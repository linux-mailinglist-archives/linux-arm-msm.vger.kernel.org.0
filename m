Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF27340A2AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 03:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234225AbhINBmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 21:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233111AbhINBmS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 21:42:18 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E27C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 18:41:02 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id f11-20020a17090aa78b00b0018e98a7cddaso1489758pjq.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 18:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lhLjTqtK+M62pAcyMDUC5gBlzD9t7scZRuwKE1gyu6s=;
        b=H7vkbd+NIblPAAG8MxIxt/IfBQd9cCoVDE3Nbp7N4WvT7ez29Md/EqiiRYypT5fv1f
         Ei1PXF2w2o/ii5m/fHRa5WofWSwRGEPVo/Tns1ircM0WY9tnOtHaX+Q4D7IEwGT8tSAT
         Kn75/FOVNduQKucPxCSP6QYoQX+ZL5Z1Kr1Cv0FiydsMh8D8ojpQ3tI6a6CdnsFCmFH1
         n9BcnvJcipA4coiAi+mIkY2WnYNfgF5WjWmEb5KonH8IUuQYf21lfjgp+02i+5mfnMN7
         s9s4baWZl7zmFV4TFIRGRArHw82CsJoMJupEaotrPpQd5az5qMp1/s4AFFqGn0mkUb6A
         nFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lhLjTqtK+M62pAcyMDUC5gBlzD9t7scZRuwKE1gyu6s=;
        b=Lj/dEV5JZ2IYF48eB1IyVaI/qRw/rb62Nl9o5nn5+IvDEc+lsHfvdwnijBfcHRfhsg
         r1lvz+muRSM/dw92ngcCqR13MqeoIOrz4N/pVy04wm0xXELv2hMG+1+9MWMRWHiMPxZD
         5G+gTySG2zlEjTP59nwf2stORwD+RM4NNcr0x1HYvhIPoJOx/uYeEOKEaeQDpxJaSvXk
         kiNGl7qoUS+3aQUJEJ1WiPujCiCBRz0nJmLdtR3wznTu0OcUXXzi0rWZKCHdwxtDILzF
         2TSgDij2lCQ2yYwI/jx1MbA2fLDFGQM5Bu63cmxnND1IyWtN+a9VN2CBUU1ZUhtCGgJd
         pHUA==
X-Gm-Message-State: AOAM532/7d+LuyOHJ3CtfMjectzwo8zsyJRRuZRhngBjpTLxQeeOpGt0
        JsYHEYBr0vY10iXkg21uVgJimw==
X-Google-Smtp-Source: ABdhPJyQjhXYVDzTcR2xFBImTaTtHV7yY57hyRjp5805b5Z2K86yS1QBXvgq17tl3Pbmc+PCRJtgUg==
X-Received: by 2002:a17:90a:940d:: with SMTP id r13mr2681572pjo.63.1631583661628;
        Mon, 13 Sep 2021 18:41:01 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 4sm8037615pjb.21.2021.09.13.18.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 18:41:01 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/3] mailbox: qcom-apcs-ipc: Consolidate msm8994 type apcs_data
Date:   Tue, 14 Sep 2021 09:40:48 +0800
Message-Id: <20210914014050.28788-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914014050.28788-1-shawn.guo@linaro.org>
References: <20210914014050.28788-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm8994 type of apcs_data is defined multiple times with different
SoC name encoded.  Consolidate them on msm8994 and remove the data
duplication.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 26 +++++--------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 82ccfaf14b24..ac42cdae638d 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -33,10 +33,6 @@ static const struct qcom_apcs_ipc_data ipq6018_apcs_data = {
 	.offset = 8, .clk_name = "qcom,apss-ipq6018-clk"
 };
 
-static const struct qcom_apcs_ipc_data ipq8074_apcs_data = {
-	.offset = 8, .clk_name = NULL
-};
-
 static const struct qcom_apcs_ipc_data msm8916_apcs_data = {
 	.offset = 8, .clk_name = "qcom-apcs-msm8916-clk"
 };
@@ -49,18 +45,6 @@ static const struct qcom_apcs_ipc_data msm8996_apcs_data = {
 	.offset = 16, .clk_name = NULL
 };
 
-static const struct qcom_apcs_ipc_data msm8998_apcs_data = {
-	.offset = 8, .clk_name = NULL
-};
-
-static const struct qcom_apcs_ipc_data sdm660_apcs_data = {
-	.offset = 8, .clk_name = NULL
-};
-
-static const struct qcom_apcs_ipc_data sm6125_apcs_data = {
-	.offset = 8, .clk_name = NULL
-};
-
 static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
 	.offset = 12, .clk_name = NULL
 };
@@ -160,21 +144,21 @@ static int qcom_apcs_ipc_remove(struct platform_device *pdev)
 /* .data is the offset of the ipc register within the global block */
 static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,ipq6018-apcs-apps-global", .data = &ipq6018_apcs_data },
-	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq8074_apcs_data },
+	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = &msm8916_apcs_data },
 	{ .compatible = "qcom,msm8939-apcs-kpss-global", .data = &msm8916_apcs_data },
 	{ .compatible = "qcom,msm8953-apcs-kpss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,msm8994-apcs-kpss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = &msm8996_apcs_data },
-	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = &msm8998_apcs_data },
+	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = &msm8916_apcs_data },
 	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
-	{ .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
+	{ .compatible = "qcom,sdm660-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
-	{ .compatible = "qcom,sm6125-apcs-hmss-global", .data = &sm6125_apcs_data },
+	{ .compatible = "qcom,sm6125-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
-	{ .compatible = "qcom,sm6115-apcs-hmss-global", .data = &sdm660_apcs_data },
+	{ .compatible = "qcom,sm6115-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
 	{}
 };
-- 
2.17.1

