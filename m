Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163934C0FEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 11:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239502AbiBWKPK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 05:15:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239500AbiBWKPJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 05:15:09 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C06E18B6C0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 02:14:41 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id m14so30100752lfu.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 02:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b6CIcqNwdQ+RImQiajx85zJw8piOKDC5i2N3eNYh/pg=;
        b=i4tUVwS6ZaGy/Dwsquqo4xVSADi9zOn75jBbxPokAOBb0w1EyK4zirDb0YR5EcnAAq
         FKRikhY6jfr2092PI6ljQIvJrqXoY+zEPObbi8/R/H30DwAFuKM9NiVZYsuZEIvTh1Kf
         m/g1SJK1t8bZiQE8KZbsvGr0FCVHLTI649Z2pKlyD9Cj371Xwk6czr1TqH29hA8nqywy
         a3V7duCZe1c6fe/Oevi3SYFGv3k7HLr4GN7ff2cI/1e6CtXMpFeUqh4Lt97C2aadbCmu
         GZEWYlKvGHlQZriJpFu1f1zrTo/jGVBB0Ziz/2rbpIocj0M8SRT8wXFcDh2U/bv7raCY
         92Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b6CIcqNwdQ+RImQiajx85zJw8piOKDC5i2N3eNYh/pg=;
        b=QpSkZoGe1Ny2C6AgB/O2w2edF/DGlSmsyoH9y8f3Ett3Yo4MHz3605mYWajnlGOgK3
         QHqQ6d4jApfV843TLT9SNCdGaKZ0Y4Mnxb8hWfBAV1U5R7Cy90A5W0KpBWZXg9cvA+0/
         AmetGkf5oV0g3TSidwcra0tTD9k9cqEVcg5DHnQCD5s1eCTq1H8xWKvxqhp219xsKIl0
         +YEs82y8ihgGUW55SnJTNP8skCzKrsoa4eMnLUZiHONdd/XgXjlmY9LGgBqnQOx5uDR8
         b8d4FqL4qu2RUzjYuBd9DBsZjMjjiQ3+YeWhzoSp0DHfh657ordpui0vzmZs8x3DDid9
         5Q9w==
X-Gm-Message-State: AOAM531nUgPY8NHGxK8UFsgh1qfuMKEmKAOvXvgRDOOrHFtFvzkd/q4g
        eOd+C/vMtPdrAben8+fbNlZLMw==
X-Google-Smtp-Source: ABdhPJxBed4SlQQFABNUtuUUkakr7ewwZDksPEU4M9F7WCiwkSdP1BYXeBJZLB/n6F8AtbjPpFPulA==
X-Received: by 2002:a05:6512:3201:b0:443:cede:ce2f with SMTP id d1-20020a056512320100b00443cedece2fmr12698870lfe.371.1645611280151;
        Wed, 23 Feb 2022 02:14:40 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.217])
        by smtp.gmail.com with ESMTPSA id s9sm2060256ljd.79.2022.02.23.02.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 02:14:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/4] dt-bindings: pci: qcom: Document PCIe bindings for SM8450
Date:   Wed, 23 Feb 2022 13:14:32 +0300
Message-Id: <20220223101435.447839-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220223101435.447839-1-dmitry.baryshkov@linaro.org>
References: <20220223101435.447839-1-dmitry.baryshkov@linaro.org>
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

Document the PCIe DT bindings for SM8450 SoC. The PCIe IP is similar
to the one used on SM8250, however unlike SM8250, PCIe0 and PCIe1 use
different set of clocks, so two compatible entries are required.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.txt     | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
index a0ae024c2d0c..0adb56d5645e 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
@@ -15,6 +15,8 @@
 			- "qcom,pcie-sc8180x" for sc8180x
 			- "qcom,pcie-sdm845" for sdm845
 			- "qcom,pcie-sm8250" for sm8250
+			- "qcom,pcie-sm8450-pcie0" for PCIe0 on sm8450
+			- "qcom,pcie-sm8450-pcie1" for PCIe1 on sm8450
 			- "qcom,pcie-ipq6018" for ipq6018
 
 - reg:
@@ -169,6 +171,24 @@
 			- "ddrss_sf_tbu" PCIe SF TBU clock
 			- "pipe"	PIPE clock
 
+- clock-names:
+	Usage: required for sm8450-pcie0 and sm8450-pcie1
+	Value type: <stringlist>
+	Definition: Should contain the following entries
+			- "aux"         Auxiliary clock
+			- "cfg"         Configuration clock
+			- "bus_master"  Master AXI clock
+			- "bus_slave"   Slave AXI clock
+			- "slave_q2a"   Slave Q2A clock
+			- "tbu"         PCIe TBU clock
+			- "ddrss_sf_tbu" PCIe SF TBU clock
+			- "pipe"        PIPE clock
+			- "pipe_mux"    PIPE MUX
+			- "phy_pipe"    PIPE output clock
+			- "ref"         REFERENCE clock
+			- "aggre0"	Aggre NoC PCIe0 AXI clock, only for sm8450-pcie0
+			- "aggre1"	Aggre NoC PCIe1 AXI clock
+
 - resets:
 	Usage: required
 	Value type: <prop-encoded-array>
@@ -246,7 +266,7 @@
 			- "ahb"			AHB reset
 
 - reset-names:
-	Usage: required for sc8180x, sdm845 and sm8250
+	Usage: required for sc8180x, sdm845, sm8250 and sm8450
 	Value type: <stringlist>
 	Definition: Should contain the following entries
 			- "pci"			PCIe core reset
-- 
2.34.1

