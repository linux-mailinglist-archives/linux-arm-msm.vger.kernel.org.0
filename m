Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD336C52C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 18:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjCVRl7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 13:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbjCVRl4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 13:41:56 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6387A5DECB
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:41:55 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id h8so76131402ede.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679506914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpSUX7WridYFFvb5Xp7cUrsNqCFgLBD3FO2lvz7TpLw=;
        b=IV1x1BqgCGt63Cp1Rtj+Sl1p+8KgiPEaF3rr1g2nvx46txOZl3R7pJuM4R+EBFAG8P
         i/Bi5FG7Nr0QPg1Dqt6HLXhJACgwWVtpn3zpyb1qLuf/rcclMJ8iTbZC+xmUKWAj4O7w
         Ad8wEckfV7Lg1UTwBs9FW2uTn6/Oj82dFxyfhqiqZAwfnE7UAEUkY1xvhB83Ha5/HrpW
         iMbF3SLu/hPf1j1UhJ4+9WphYQEkV0pLty8Z0Map6qG1zx8sr5E7z0l7KEB+8M5ywo6I
         HSniMAzyCKjAerY9ZFRGvDMRR2ul7r++24WvRiUg1OdvuzFTBweF09vfHwTkBOupFcnU
         6PFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpSUX7WridYFFvb5Xp7cUrsNqCFgLBD3FO2lvz7TpLw=;
        b=ZkFupK7fsuOnNcRLIzvfb4X3AIPb/32JcX71pIy+xoUrZmzhVdwOXWDqLS3gUa7LIz
         5l9DL6S1aCsvy1oic5OfxdDjzU6B0Ws4iVw9sHQAZN7PqczUPF7cOG66BC45ZzY6Gtmj
         pkf1TcCUzoyqtYC1QBGjcE5F1QD/X5ctDje0+x5lyD/0XMyWMYhkC3lk11nGrhyVZSNX
         hPRBq3FqwoEjtxbB2Org2nslgkkXLHPDMvejNi9SHEVkUFxr0rbruSdewWmGIQUg78Fr
         8kAC1UP1OgPVLx4fUSnYvmeHm29h8DW9bNwYB8u+JMw25SBfgdffBGOWPDbUY1FtL6pe
         n+6Q==
X-Gm-Message-State: AO0yUKXd/iVrgelW/vG0djNnxcSjIIKgz0m1i/br6IGNoZ5uu2gUqPa1
        0UZ4ceCIvSjxhVZ+aQp1b9eb5w==
X-Google-Smtp-Source: AK7set/aO2+dIbJ5tWFhN6pYhaj+pQe5AHVtFd1G1wRKBTmH5FX2UZ2lXtHGXiyxHNpCUzteIexImQ==
X-Received: by 2002:a17:906:6083:b0:931:e5de:d28d with SMTP id t3-20020a170906608300b00931e5ded28dmr6467345ejj.33.1679506914038;
        Wed, 22 Mar 2023 10:41:54 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id jx3-20020a170907760300b00930876176e2sm7548088ejc.29.2023.03.22.10.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:41:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 02/11] mailbox: qcom-apcs-ipc: do not grow the of_device_id
Date:   Wed, 22 Mar 2023 18:41:39 +0100
Message-Id: <20230322174148.810938-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322174148.810938-1-krzysztof.kozlowski@linaro.org>
References: <20230322174148.810938-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Re-organize the compatible devices and add a comment to avoid unneeded
of_device_id growth with every new SoC.  These devices have quite a lot
of similarities and they can use only one compatible fallback for driver
binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 6bbf87c6d60b..f3ac0b035945 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -143,17 +143,19 @@ static int qcom_apcs_ipc_remove(struct platform_device *pdev)
 static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,ipq5332-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,ipq6018-apcs-apps-global", .data = &ipq6018_apcs_data },
-	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = &msm8916_apcs_data },
-	{ .compatible = "qcom,msm8939-apcs-kpss-global", .data = &msm8916_apcs_data },
 	{ .compatible = "qcom,msm8953-apcs-kpss-global", .data = &msm8994_apcs_data },
+	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = &msm8996_apcs_data },
+	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
+	/* Do not add any more entries using existing driver data */
+	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
+	{ .compatible = "qcom,msm8939-apcs-kpss-global", .data = &msm8916_apcs_data },
 	{ .compatible = "qcom,msm8976-apcs-kpss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,msm8994-apcs-kpss-global", .data = &msm8994_apcs_data },
-	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = &msm8996_apcs_data },
 	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,qcm2290-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = &msm8916_apcs_data },
-	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sdm660-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
@@ -161,7 +163,6 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,sm6125-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sm6115-apcs-hmss-global", .data = &msm8994_apcs_data },
-	{ .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
-- 
2.34.1

