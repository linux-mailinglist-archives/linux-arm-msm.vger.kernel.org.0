Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97A4B5B44A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 08:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbiIJGda (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 02:33:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbiIJGcx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 02:32:53 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B703BABF34
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 23:32:37 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id e20so6555932wri.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 23:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hFaMhiJ2smTY3tKW4XMPUKWJJb1/OofcwoKHsMVmwSo=;
        b=o2anOs2Q2VroHG5wz70Ofe7YBNn0OmrnSLsTKtY2Xe9gulO4fILMMGIbv23+MoYP3T
         dDHkWbC2cuZsuIf68xyFwRoaeYjWQ9SJmWqtcbfe81RDtg5PG6eUCKAfNfPbZ9+ex2+I
         3OVxhwdqUSInN/vfgoaExzHwr7ByZ+Vx6KJzkcfD93hP9JqR20qdGexnidFHzuaqtpEQ
         ndLfeKbufe4gHKIWUQn385HMeQiMVmuI25o8bHr1zNeusBWM2v0sMQuu3DLVlb0B0Dgh
         Yu3QJY1lZttHJRna+PA8h6NInUWzg8x66ojb3YIiGWYk0X39vIY9e7tz2CgM3P5z3B71
         MN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hFaMhiJ2smTY3tKW4XMPUKWJJb1/OofcwoKHsMVmwSo=;
        b=YI5v/zfpPpQwW8SYlKaqHUUbE2VRVMYPgXKuXomxHrk7M7LIiG0UMxrbepKHLoyLqA
         m4XDaKPqRBbvLqrezTHxUlG5kxOWlSfXO2271XTTquIS38p5tOzA1KLmkzkcgH/viExf
         jduGNP8WSp/u3Ah2/+TZbonvHTsTmNcDlKONVLmy0wUPhOr4rMJrXq8M59Pw8XU8lhUd
         ZEf0RW3Zdaw5ermFE/X10GDIyhZS9lS239ldEumSfaeX81Kxwt/Alr16fJG+UC4I2ecm
         woGzBkGWBlB8UF64mWnKpUWZkyWTIrzTQBahzfqXIwKVvpXjIatQI54kp5sufRUMGk0T
         wp1Q==
X-Gm-Message-State: ACgBeo2MD4eEG3LB2VOb+DNzooUfAsofOHMwPOQsXJ5EllNjGVL3EjVz
        VFmmpFtvzj6HrE4V8N3STAC0
X-Google-Smtp-Source: AA6agR4Z10iWlqJ86QU2gjMalZBEweVgqa+WdXv2zKRkU4TqxEoOOH7EISzHhzglLNEWx0l1uhMFAQ==
X-Received: by 2002:a5d:6484:0:b0:226:dd0e:b09c with SMTP id o4-20020a5d6484000000b00226dd0eb09cmr9901777wri.388.1662791556316;
        Fri, 09 Sep 2022 23:32:36 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.47])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c4f9000b003a5c7a942edsm2828122wmq.28.2022.09.09.23.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 23:32:35 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 12/12] PCI: qcom-ep: Add support for SM8450 SoC
Date:   Sat, 10 Sep 2022 12:00:45 +0530
Message-Id: <20220910063045.16648-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220910063045.16648-1-manivannan.sadhasivam@linaro.org>
References: <20220910063045.16648-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for SM8450 SoC to the Qualcomm PCIe Endpoint Controller
driver. The driver uses the same config as of the existing SDX55 chipset.
So additional settings are not required.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 92140a09aac5..16bb8f166c3b 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -789,6 +789,7 @@ static int qcom_pcie_ep_remove(struct platform_device *pdev)
 
 static const struct of_device_id qcom_pcie_ep_match[] = {
 	{ .compatible = "qcom,sdx55-pcie-ep", },
+	{ .compatible = "qcom,sm8450-pcie-ep", },
 	{ }
 };
 
-- 
2.25.1

