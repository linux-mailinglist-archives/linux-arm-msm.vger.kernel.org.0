Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B114D4710AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Dec 2021 03:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbhLKCVl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 21:21:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232777AbhLKCVl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 21:21:41 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04DBC0617A1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 18:18:04 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id k2so16186362lji.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 18:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VGQ7+P7dGN15uBsAWu8DCnSdKjv7k9ltm1L6whtQ6u8=;
        b=dVM2YfIsMQrJCdtY0fo23q8+G0R+EJzBOJ9mivsAcqG03Lx13w4dzdM55Fx90wNin1
         WATISpyf+VrUp6g7lGldzL6xpUjhLElvBGvcAm0lcDoOYyVWyaAuFa0Rujy6kyvbAOUY
         fJDlo/x53D+TlXA9VymI6Z9rOMIPFOMr9BO4Xh6fHlx4zZikRpkaaHxu+3xV823izwMg
         RmMTfKTKDvADJkqIW3suhNWX4oTrhCkCO/rHoripLqBJURuWlkyyxnMTD2u3mlYITD0g
         cGgDAEpHQ05xW0g22HT1c6r0jCoFe6koKBWJ0aijJ3yIFK9DG0MGByGWuR/OsnP0un8W
         bAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VGQ7+P7dGN15uBsAWu8DCnSdKjv7k9ltm1L6whtQ6u8=;
        b=LBlg8eLJ0StvmEsSZxICyiZOudte7wX6+vOMuCoRoaIsgKOwf5sRyYFzsU0SZqbh4a
         zLrKpiFxzryLVCu4jqfLl/5ygFrbhq7nHRBDoNM8Og5DX3IlnG2HcaSbsgmhDAuLslD1
         4RL1QoC99KuuWtJDccJrgD9/9Ipe8ICydzZ8dlqOIXNvTqCzCHcK0ZeKPR+KR3Cm3Nn4
         Pdn3P/s7z8u8E74xLg+pGMtpAm0ZwUbDea4bx3gnN8KU2tEya2gegijjNAKUByuDgHxM
         WWHGSva6H9UwXt6DQSCpNgo5fbM52GQ6Rcf7Gzgl4kJZ/ibtlboLBYnl0WnD7eKdqoTE
         k+9g==
X-Gm-Message-State: AOAM531yUJauq3TNSHzajhWZVjseAvFrjJSaLVk8kMm/02lCgtd5xbIi
        w6/dYxN0BaQ8TklaBogJLjqL8w==
X-Google-Smtp-Source: ABdhPJwd7nIUo2OTKfddhmz3YmfGiwX4X8ZpFu24VqoxaqO4HMmmJVi1pKrXwT4ULIQUOx1dVOdh6w==
X-Received: by 2002:a2e:8ec7:: with SMTP id e7mr16417234ljl.430.1639189083208;
        Fri, 10 Dec 2021 18:18:03 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y7sm504663lfj.90.2021.12.10.18.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 18:18:02 -0800 (PST)
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
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 01/10] dt-bindings: pci: qcom: Document PCIe bindings for SM8450
Date:   Sat, 11 Dec 2021 05:17:49 +0300
Message-Id: <20211211021758.1712299-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211211021758.1712299-1-dmitry.baryshkov@linaro.org>
References: <20211211021758.1712299-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the PCIe DT bindings for SM8450 SoC.The PCIe IP is similar
to the one used on SM8250. Add the compatible for SM8450.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.txt     | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
index a0ae024c2d0c..73bc763c5009 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
@@ -15,6 +15,7 @@
 			- "qcom,pcie-sc8180x" for sc8180x
 			- "qcom,pcie-sdm845" for sdm845
 			- "qcom,pcie-sm8250" for sm8250
+			- "qcom,pcie-sm8450" for sm8450
 			- "qcom,pcie-ipq6018" for ipq6018
 
 - reg:
@@ -169,6 +170,24 @@
 			- "ddrss_sf_tbu" PCIe SF TBU clock
 			- "pipe"	PIPE clock
 
+- clock-names:
+	Usage: required for sm8450
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
+			- "aggre0"	Aggre NoC PCIe0 AXI clock
+			- "aggre1"	Aggre NoC PCIe1 AXI clock
+
 - resets:
 	Usage: required
 	Value type: <prop-encoded-array>
@@ -246,7 +265,7 @@
 			- "ahb"			AHB reset
 
 - reset-names:
-	Usage: required for sc8180x, sdm845 and sm8250
+	Usage: required for sc8180x, sdm845, sm8250 and sm8450
 	Value type: <stringlist>
 	Definition: Should contain the following entries
 			- "pci"			PCIe core reset
-- 
2.33.0

