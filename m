Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F41452F518
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 23:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353664AbiETV2J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 17:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353668AbiETV2D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 17:28:03 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C58186281;
        Fri, 20 May 2022 14:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653082082; x=1684618082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=wGsJ3qCaKwhNjTweV8IkSCPXFmc0x4wrmSsizCb6kvk=;
  b=QkpDZQvpooVbecb/fUDHt2ANmHA4wvCpPpthQa/+wuXc9FYRMLnQaDmf
   WPNbCohX6vkeJhM/rvf5XSiXCZohH1Q+eX93cuTWShtXBpjytUi4gFpL/
   A/9YNKXg4y5LML+47uvbz/LO0qzT13FqSvTeKOc3TggGd67j78mvYZulh
   o=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 20 May 2022 14:28:02 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2022 14:28:01 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 20 May 2022 14:27:20 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 20 May 2022 14:27:19 -0700
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <bjorn.andersson@linaro.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <quic_aravindh@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 1/3] phy: qcom-edp: add regulator_set_load to edp phy
Date:   Fri, 20 May 2022 14:27:06 -0700
Message-ID: <1653082028-10211-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1653082028-10211-1-git-send-email-quic_khsieh@quicinc.com>
References: <1653082028-10211-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch add regulator_set_load() before enable regulator at
eDP phy driver.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index cacd32f..7e357078 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -639,6 +639,18 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = regulator_set_load(edp->supplies[0].consumer, 21800); /* 1.2 V vdda-phy */
+	if (ret) {
+		dev_err(dev, "failed to set load at %s\n", edp->supplies[0].supply);
+		return ret;
+	}
+
+	ret = regulator_set_load(edp->supplies[1].consumer, 36000); /* 0.9 V vdda-pll */
+	if (ret) {
+		dev_err(dev, "failed to set load at %s\n", edp->supplies[1].supply);
+		return ret;
+	}
+
 	ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
 	if (ret)
 		return ret;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

