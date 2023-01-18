Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBC076720E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 16:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjARPQj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 10:16:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjARPNV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 10:13:21 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10FB346D6E
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:10:48 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 36so24708565pgp.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4t3wjs91jqYDdhcaBgIoHHF665G49/NIuIJvlGrcfA=;
        b=Do9F396SRyFEV5JxNfbhAFqRMWeNzyfD1WsRYMmoSI5NQ0nbug+TxY3SaKiPs5a9Pw
         fdR8QaB4M85v9GsVqYcqCnDclRF/RVSxmYBMgKF1l3LucUAiXBAf/086AwtifvXmAe/B
         MZBjJxOX4wrbKnG+PlVFDYcKiKCT09DhEsY/KikbgL/WiS1cQA2NFIM4RkmK+hru+Gfi
         m/hpxzgMjZ8x8brdl3PgOhZaKWJszwS+5Rthb8IF4PjcH/k+wjpkYOT8XEB5cUv/G0Oy
         1rcXFiGcE7RMaXs+ngfiDoWQqYvsrtt66hh3TzWLSVaDUTVKKlC/JhgxoeuhfqMu4NAS
         UTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4t3wjs91jqYDdhcaBgIoHHF665G49/NIuIJvlGrcfA=;
        b=sAWnxFQfF3GuflBY37Psmvzd4uhvw+n+Ng5W707GAbmYSXVyu82zTpv8bw204ti6i7
         DHQ5TIi10iIZu+oN5VKVGYPcPx8anqd3pxOgb18AP2SaKpM0AqHC9Yy/aFcucueib/rJ
         9eJhyCUs6m5VEpSwjVPmOUCwEvzWvVmjqUiB1JLS/nbbuclw2LV9Yh06ri5qVxDnQC1l
         Gkk1ifdj7Ga7xE3eApEwg6+msJEn56O0fXi/Rgf/ao2GVmUzMzRfzuk6xAM2+j0qmQhj
         gKNZ/Fi0N/9cPAed9NLTZ8QHAD1jIV2yEdJTkgPkoOZJiRQ0NkhjxCoekD0KVawIkPTL
         QjJw==
X-Gm-Message-State: AFqh2kqAjLV0B6APqsp/UyHGAxqup2gDJc1lJ0doHKXJTWpER2Xj2nGr
        Xv66Xm3MLe1eBnWQt6AHnjW7
X-Google-Smtp-Source: AMrXdXsK7jXlYKJw2R2kMtVvIpTTwtJt9k0lK/4ARndplI5whavjRrr8Cxok5DG/utsHXMucEWMrog==
X-Received: by 2002:a05:6a00:2986:b0:58c:8bdd:2e3c with SMTP id cj6-20020a056a00298600b0058c8bdd2e3cmr7663075pfb.20.1674054648177;
        Wed, 18 Jan 2023 07:10:48 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.61])
        by smtp.gmail.com with ESMTPSA id i15-20020aa796ef000000b0058d9623e7f1sm6721544pfq.73.2023.01.18.07.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 07:10:47 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH v6 17/17] soc: qcom: llcc: Do not create EDAC platform device on SDM845
Date:   Wed, 18 Jan 2023 20:39:04 +0530
Message-Id: <20230118150904.26913-18-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230118150904.26913-1-manivannan.sadhasivam@linaro.org>
References: <20230118150904.26913-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The platforms based on SDM845 SoC locks the access to EDAC registers in the
bootloader. So probing the EDAC driver will result in a crash. Hence,
disable the creation of EDAC platform device on all SDM845 devices.

The issue has been observed on Lenovo Yoga C630 and DB845c.

Cc: <stable@vger.kernel.org> # 5.10
Reported-by: Steev Klimaszewski <steev@kali.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/soc/qcom/llcc-qcom.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 7b7c5a38bac6..8d840702df50 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -1012,11 +1012,18 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 
 	drv_data->ecc_irq = platform_get_irq_optional(pdev, 0);
 
-	llcc_edac = platform_device_register_data(&pdev->dev,
-					"qcom_llcc_edac", -1, drv_data,
-					sizeof(*drv_data));
-	if (IS_ERR(llcc_edac))
-		dev_err(dev, "Failed to register llcc edac driver\n");
+	/*
+	 * The platforms based on SDM845 SoC locks the access to EDAC registers
+	 * in bootloader. So probing the EDAC driver will result in a crash.
+	 * Hence, disable the creation of EDAC platform device on SDM845.
+	 */
+	if (!of_device_is_compatible(dev->of_node, "qcom,sdm845-llcc")) {
+		llcc_edac = platform_device_register_data(&pdev->dev,
+						"qcom_llcc_edac", -1, drv_data,
+						sizeof(*drv_data));
+		if (IS_ERR(llcc_edac))
+			dev_err(dev, "Failed to register llcc edac driver\n");
+	}
 
 	return 0;
 err:
-- 
2.25.1

