Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB666429700
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 20:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbhJKSmY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 14:42:24 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:31541 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229542AbhJKSmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 14:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1633977622; x=1665513622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QrXD17VOOGZ0d82h6IwbE8Mr2ENUYegMuWKyFIFlz60=;
  b=GNXVuCbFaKUl8tEJ/46x2ELzekkBFgUeoXa5YP2g4AfKLMKyvcITM+Q1
   1PXzlD/+nSWo++SYVnUhYkxT1o1z7kPVuflkfuwYs1y3B45cu75AFs3I3
   dqGU3LWBkCe4O6LL79aCwzOpjuWjv9y6gMy+AMCtfSjeEZG5QXf5HruZr
   8=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 11 Oct 2021 11:40:21 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2021 11:40:23 -0700
Received: from hu-gurus-sd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 11 Oct 2021 11:40:23 -0700
Date:   Mon, 11 Oct 2021 11:40:22 -0700
From:   Guru Das Srinagesh <quic_gurus@quicinc.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [bug report] firmware: qcom_scm: Make
 __qcom_scm_is_call_available() return bool
Message-ID: <20211011184022.GA18698@hu-gurus-sd.qualcomm.com>
References: <20211011092054.GA6793@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211011092054.GA6793@kili>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 11, 2021 at 12:20:54PM +0300, Dan Carpenter wrote:
> Hello Stephen Boyd,
> 
> The patch 9d11af8b06a8: "firmware: qcom_scm: Make
> __qcom_scm_is_call_available() return bool" from Feb 23, 2021, leads
> to the following Smatch static checker warning:
> 
> 	drivers/firmware/qcom_scm.c:255 __qcom_scm_is_call_available()
> 	warn: signedness bug returning '(-22)'
> 
> drivers/firmware/qcom_scm.c
>     232 static bool __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
>     233                                          u32 cmd_id)
>     234 {
>     235         int ret;
>     236         struct qcom_scm_desc desc = {
>     237                 .svc = QCOM_SCM_SVC_INFO,
>     238                 .cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
>     239                 .owner = ARM_SMCCC_OWNER_SIP,
>     240         };
>     241         struct qcom_scm_res res;
>     242 
>     243         desc.arginfo = QCOM_SCM_ARGS(1);
>     244         switch (__get_convention()) {
>     245         case SMC_CONVENTION_ARM_32:
>     246         case SMC_CONVENTION_ARM_64:
>     247                 desc.args[0] = SCM_SMC_FNID(svc_id, cmd_id) |
>     248                                 (ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
>     249                 break;
>     250         case SMC_CONVENTION_LEGACY:
>     251                 desc.args[0] = SCM_LEGACY_FNID(svc_id, cmd_id);
>     252                 break;
>     253         default:
>     254                 pr_err("Unknown SMC convention being used\n");
> --> 255                 return -EINVAL;
> 
> Presumably this should be "return false;"?
> 
>     256         }
>     257 
>     258         ret = qcom_scm_call(dev, &desc, &res);
>     259 
>     260         return ret ? false : !!res.result[0];
>     261 }
> 
> regards,
> dan carpenter

Hi Dan, Stephen,

Please find the fix below:


From 8bbdb1517c3f58b6b29d0915424b9b0e03752e14 Mon Sep 17 00:00:00 2001
From: Guru Das Srinagesh <quic_gurus@quicinc.com>
Date: Mon, 11 Oct 2021 11:18:06 -0700
Subject: [PATCH] firmware: qcom_scm: Fix error retval in
 __qcom_scm_is_call_available()

Since __qcom_scm_is_call_available() returns bool, have it return false
instead of -EINVAL if an invalid SMC convention is detected.

This fixes the Smatch static checker warning:

	drivers/firmware/qcom_scm.c:255 __qcom_scm_is_call_available()
	warn: signedness bug returning '(-22)'

Fixes: 9d11af8b06a8 ("firmware: qcom_scm: Make __qcom_scm_is_call_available() return bool")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
---
 drivers/firmware/qcom_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 2ee97ba..27a64de 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -252,7 +252,7 @@ static bool __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
 		break;
 	default:
 		pr_err("Unknown SMC convention being used\n");
-		return -EINVAL;
+		return false;
 	}
 
 	ret = qcom_scm_call(dev, &desc, &res);
-- 
2.7.4


Thank you.

Guru Das.
