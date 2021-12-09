Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE0646EB4D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 16:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239799AbhLIPgJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 10:36:09 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:2095 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239736AbhLIPgE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 10:36:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1639063951; x=1670599951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=d0J9Gsv0Qy02MYG9978Ae2Pi8dBBcoFBOCcgoYXmzWM=;
  b=fSV0BcDgFlwMYIT2zTPzZ64JbR5poYYPCYdQeV3sOC/vRxuNIF3z4vOf
   ylIZSlJ96P5ViA+mAhEnQxgToAtz8mrWapLAMk8cTNeuhYtJO2P78BA9R
   KFwC7CLmw46osfvcHbZ4uWQC96QnQz9ah9isMECxut9mMK7wjYLa/OVKZ
   8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Dec 2021 07:32:31 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2021 07:32:30 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 9 Dec 2021 07:32:30 -0800
Received: from blr-ubuntu-173.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 9 Dec 2021 07:32:27 -0800
From:   Rajendra Nayak <quic_rjendra@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <swboyd@chromium.org>, <mka@chromium.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: [PATCH v3 3/4] soc: qcom: rpmhpd: Remove mx/cx relationship on sc7280
Date:   Thu, 9 Dec 2021 21:01:56 +0530
Message-ID: <1639063917-9011-4-git-send-email-quic_rjendra@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639063917-9011-1-git-send-email-quic_rjendra@quicinc.com>
References: <1639063917-9011-1-git-send-email-quic_rjendra@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The requirement to specify the active + sleep and active-only MX
power-domains as the parents of the corresponding CX power domains is
not applicable on sc7280. Fix it by using the cx/cx_ao structs for
sc7280 instead of the _w_mx_parent ones.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
---
 drivers/soc/qcom/rpmhpd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index a12db32..6360204 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -325,8 +325,8 @@ static const struct rpmhpd_desc sc7180_desc = {
 
 /* SC7280 RPMH powerdomains */
 static struct rpmhpd *sc7280_rpmhpds[] = {
-	[SC7280_CX] = &cx_w_mx_parent,
-	[SC7280_CX_AO] = &cx_ao_w_mx_parent,
+	[SC7280_CX] = &cx,
+	[SC7280_CX_AO] = &cx_ao,
 	[SC7280_EBI] = &ebi,
 	[SC7280_GFX] = &gfx,
 	[SC7280_MX] = &mx,
-- 
2.7.4

