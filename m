Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D43B4C84F2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 08:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbiCAH0R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 02:26:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbiCAH0P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 02:26:15 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FCF7B55E
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 23:25:35 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id 139so13733446pge.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 23:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g11sci1g7elBgDqwDkIww3iURlfsGrxIIuaKlSKDbrU=;
        b=jHhGcs4nFH8qWADu8iQt40Vllw5BFzNZlpiPQpMa/UoK53aBCZqVB3s9n2sRbJajcN
         iyKujCVNxu7MVFVKONVRBbsEo5Ay6m8xuGr91NB9b+GkCRX7OaZDNia6MXr2aZqMATV9
         XWdPFXhofUAM2lT44glK/gwytAlAExGjpOQZWJ0bfE0VFqVbMV0SbG3tOM2h8cF+XCJ5
         9EdhSq45lbnDq1OGfPzZPAFMH7Fk7vatSCxaT3ZFsaGB1eTk0O3b3/WUjWlQiTwP1NYX
         y9Ur5v4NXANoH1ayeyFqEmCUogHblm2gYgjKpwnMoBdr6xiFMvJ9uiaw8JUvU360P7eh
         1jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g11sci1g7elBgDqwDkIww3iURlfsGrxIIuaKlSKDbrU=;
        b=nkrbzUS+3m+9wVV4UpLtlpbVKc8qnCHUiku25+A1GSEFHXRURJFwL/8Dfa48gR1qkP
         sBVp6qTjNC9OL8QpYb4hbLXArUU3Aox9NeeEL2O7DJOl/9VAp5Elpl6ag7V/lSEw2VSM
         nSpiPB+ocjRap1PXe7K2eBus+HhByBdBi6FF+FeJsDqtuqzwTMfcOkEJDct0R0iIouD2
         lurFy09JB7W3Df5rj+KgKvTAXBz9GQ7A6VyvXD6qdgb3Wesx+9i7J0Rq0MqP9boPp5c/
         Y32HkchXFTlT2HnkrwbGwEJvdYZYbevkrqZ/HEVJqyJJu6YkgVP1GGHh9BoFzvQea1tZ
         rpMg==
X-Gm-Message-State: AOAM5335T8A3FRmXPG1W/9tUo0mRudCcEwNSem3c3R8K8a9yWwY90/Af
        bR1jpaGPH0PnSRF5V7xUfU6C1q104t0rFQ==
X-Google-Smtp-Source: ABdhPJwxYEg5uUYRktayPGS8GnGvJFHSCeQqTElNTBaLnBCTZyuadouKt1II6X9JEH5aSUhglt0d7g==
X-Received: by 2002:a05:6a00:21c7:b0:4e1:dba1:a3a6 with SMTP id t7-20020a056a0021c700b004e1dba1a3a6mr25983616pfj.59.1646119534480;
        Mon, 28 Feb 2022 23:25:34 -0800 (PST)
Received: from localhost.localdomain ([223.179.136.225])
        by smtp.gmail.com with ESMTPSA id m6-20020a62f206000000b004e152bc0527sm15680445pfh.153.2022.02.28.23.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 23:25:34 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, svarbanov@mm-sol.com,
        bhelgaas@google.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/7] dt-bindings: pci: qcom: Document PCIe bindings for SM8150 SoC
Date:   Tue,  1 Mar 2022 12:55:05 +0530
Message-Id: <20220301072511.117818-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301072511.117818-1-bhupesh.sharma@linaro.org>
References: <20220301072511.117818-1-bhupesh.sharma@linaro.org>
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

Document the PCIe DT bindings for SM8150 SoC. The PCIe IP is similar to
the one used on SM8250.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
index a0ae024c2d0c..a023f97daf84 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
@@ -14,6 +14,7 @@
 			- "qcom,pcie-qcs404" for qcs404
 			- "qcom,pcie-sc8180x" for sc8180x
 			- "qcom,pcie-sdm845" for sdm845
+			- "qcom,pcie-sm8150" for sm8150
 			- "qcom,pcie-sm8250" for sm8250
 			- "qcom,pcie-ipq6018" for ipq6018
 
@@ -157,7 +158,7 @@
 			- "pipe"	PIPE clock
 
 - clock-names:
-	Usage: required for sc8180x and sm8250
+	Usage: required for sc8180x, sm8150 and sm8250
 	Value type: <stringlist>
 	Definition: Should contain the following entries
 			- "aux"		Auxiliary clock
@@ -246,7 +247,7 @@
 			- "ahb"			AHB reset
 
 - reset-names:
-	Usage: required for sc8180x, sdm845 and sm8250
+	Usage: required for sc8180x, sdm845, sm8150 and sm8250
 	Value type: <stringlist>
 	Definition: Should contain the following entries
 			- "pci"			PCIe core reset
-- 
2.35.1

