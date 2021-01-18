Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8116C2F988F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 05:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732138AbhAREN5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 23:13:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732097AbhARENk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 23:13:40 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB43C061794
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 20:12:30 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id u11so3639372plg.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 20:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HFCn4DrN5tcytFqIGARwmeCierFc1Kb78mBSzO9W+eo=;
        b=vW2AKNabMNd/ETed6l/la+/MnOp+6GJA6u+LKHT+WljEamTKRBU+78Irq9ZiMEUaq5
         QWXXqIvgCnc+ReN491rttYkL78zlGwCJIruNyvo6dH6m7P5+/Kez9db81dhTqU3Op1HH
         obGftTUjQpY6THmUjGMasJViVxsqAPXRszzW5C29okcWV8JmhIPaa0nXdkN367PNK7Po
         414a0bM0yctY6VkbB7FdSkIgP39t6tu7EN4SgsF/vuMM1hAZxKdJGomYcXtls62Bbz3M
         PBkceC796dEbBJvCqTYk2h/4m8r86P1lCwQMaA02e1rRtTXtLFRFfH9GdgiY04PiCVnM
         9IDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HFCn4DrN5tcytFqIGARwmeCierFc1Kb78mBSzO9W+eo=;
        b=pDY/9IqN26d28Pv4feFH39ghSNkpMh/69F6F/19DvWnPOahl0ryye7mgAnCRK+RzH0
         XKXKn9Zj7KtMauflc7QFDVbz99ob++LzFfNnGM6w4r7GLoA/HouxUIlJGVWSPDanqMnq
         PpZ1xgLjYXK6n1PBmZBJe+DkIlDOk7cLsZf3LPcFkjyVprf8QiX3lH9NQKnPKl1wQJjt
         vGxyTHjlWYZU4qoWHM1EJBBFZhD3/gfr6AGRMWzZeelsfHeFjZcxrfkkU8gEnLTt+8dd
         2z1sHUp37bozB/tBbpCt3GDsnTxObRhgsghSeXgX9XYuf5IO0DC/4xMGKwpbDOHExiM+
         7uPg==
X-Gm-Message-State: AOAM530phAfMCe/832SMdghBVpH5Rf6vSYdJK0+4wEn5Du6S8Oa/1Rb/
        IsZDDDaxB40Z1wKDjrJ5gC54
X-Google-Smtp-Source: ABdhPJx6dZDYGZL2Kgn7+/QRNZSPRebWg9KcK8LXhlV3vwVNwPPG5+t+PtxzzjOzz5jyNMp8XHsa9g==
X-Received: by 2002:a17:90a:7d08:: with SMTP id g8mr24357647pjl.180.1610943150014;
        Sun, 17 Jan 2021 20:12:30 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id h15sm6727319pja.4.2021.01.17.20.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 20:12:29 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 2/5] mailbox: qcom: Add support for SDX55 APCS IPC
Date:   Mon, 18 Jan 2021 09:41:53 +0530
Message-Id: <20210118041156.50016-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
References: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In SDX55, the IPC bits are located in the APCS GCC block. Also, this block
can provide clock functionality. Hence, add support for IPC with correct
offset and name of the clock provider.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 077e5c6a9ef7..1c205832a1cc 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -61,11 +61,15 @@ static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
 	.offset = 12, .clk_name = NULL
 };
 
+static const struct qcom_apcs_ipc_data sdx55_apcs_data = {
+	.offset = 0x1008, .clk_name = "qcom-sdx55-acps-clk"
+};
+
 static const struct regmap_config apcs_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = 0xFFC,
+	.max_register = 0x1008,
 	.fast_io = true,
 };
 
@@ -162,6 +166,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
 	{ .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
-- 
2.25.1

