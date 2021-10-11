Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBBA4297E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 22:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233584AbhJKUCc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 16:02:32 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:5204 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231156AbhJKUCb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 16:02:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1633982431; x=1665518431;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=N4CiImnv1AWs5GJEFOOIHHQawf6Kw72cfC4kfIeqxAA=;
  b=ChndwnomBBfh9slOlR9KmUAmXo7sEzn3Pg4Yart+IfncPnpg+GrQHspE
   mtvV2z/tfuPgUKs5+HQcC87p1DvxmVJgVDv3BVeyQ3ScKo4dEKJcQYaC3
   4FuGw0RfefH7xoUHvg9x9+o+yXHMlNGr0vP2AKXFOoi+qsRGuFNnP0Yqd
   c=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 11 Oct 2021 13:00:31 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2021 13:00:31 -0700
Received: from hu-gurus-sd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 11 Oct 2021 13:00:30 -0700
From:   Guru Das Srinagesh <quic_gurus@quicinc.com>
To:     Stephen Boyd <swboyd@chromium.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        <linux-arm-msm@vger.kernel.org>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <quic_eberman@quicinc.com>, <linux-kernel@vger.kernel.org>,
        "Guru Das Srinagesh" <quic_gurus@quicinc.com>
Subject: [PATCH] firmware: qcom_scm: Fix error retval in __qcom_scm_is_call_available()
Date:   Mon, 11 Oct 2021 13:00:14 -0700
Message-ID: <1633982414-28347-1-git-send-email-quic_gurus@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since __qcom_scm_is_call_available() returns bool, have it return false
instead of -EINVAL if an invalid SMC convention is detected.

This fixes the Smatch static checker warning:

	drivers/firmware/qcom_scm.c:255 __qcom_scm_is_call_available()
	warn: signedness bug returning '(-22)'

Fixes: 9d11af8b06a8 ("firmware: qcom_scm: Make __qcom_scm_is_call_available() return bool")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
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

