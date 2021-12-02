Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52775466509
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 15:18:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347108AbhLBOV2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 09:21:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358492AbhLBOVG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 09:21:06 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99985C0613E0
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 06:17:34 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id e11so55031528ljo.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 06:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yjQ+4ebAvK4TgGM0msltCvsHoQYHGywItHMmPjFkemE=;
        b=ZRIDOzdNdmIKD6A/1xwzN+kVNd8ygNG+cG1wiadTOGmQAiHz3iuaSjexIDUqfGMtIk
         XBqcHCRVHLRFh2xOQTxQ4qc5011/hM16CAZYO5xHtauzPrhYBw3Jf/aclbdAzWGDfreh
         g6Lnk3k/bkm0n2gcC7dJq+Pwa9DvKc+ojM0Y3caVYoQW6iHvPZEi0KRt0lT+eYNWgbIV
         XGMJz51pUbnrUjTJ1RDv105RKd7D0RELcAUBSjqKzpKJc8tPmHcaW+E01d6Fk/vaS23i
         aSS+U6GtOrItzRzgFq4mdzaXTBSbp17PklufY+v1Q3g5izHqUIjWGjVg3M1bFXlciCgS
         JfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yjQ+4ebAvK4TgGM0msltCvsHoQYHGywItHMmPjFkemE=;
        b=YjDkC0y5V12tX6/FMcIYF/eLXmSCeKTcidjEx1JTisX7oqvNWn3/R6tZWUhs/eJmTA
         RzMwkcn2FmEwBhGlU8454VY714SiI0nBS1237ldmW0TnijHUKesEjQftQB2nr9otR2rH
         8ztOpNYBDTQSjQujF8RY6O7kiMUnRo/kt8ZwSzVEq+hgqfmopIPkua+56qV6XNnsRhTu
         iMBIvTUaQ+4X08QPkm3kGVwWQZam13toqHy4Is7fJDfobVSAlogGUgeTgBH3nqO1Q85V
         WNexthOL6xtOJNgYtHAxl79pP2Ftmw799UozMzwQSItLT/AbjzKHtiuhofqUe5vPjUry
         yXQA==
X-Gm-Message-State: AOAM530suQWjHISPXEHZzLVLg1o/lFgoSJsIMPjZygfZDqhTcCYJzN5M
        8KxTGF3eKBMKWb2hQUOupKZ1G3eqM8UbuA==
X-Google-Smtp-Source: ABdhPJzYjEbrDaoG2AYuQrrFS2vLhmoQavoOkvREG0hCAEzqwDogoPQtD5czycat4pINh8dC9hv/Yw==
X-Received: by 2002:a05:651c:124f:: with SMTP id h15mr11660021ljh.514.1638454652828;
        Thu, 02 Dec 2021 06:17:32 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m15sm362487lfg.165.2021.12.02.06.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 06:17:32 -0800 (PST)
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
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 01/10] dt-bindings: pci: qcom: Document PCIe bindings for SM8450
Date:   Thu,  2 Dec 2021 17:17:17 +0300
Message-Id: <20211202141726.1796793-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202141726.1796793-1-dmitry.baryshkov@linaro.org>
References: <20211202141726.1796793-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the PCIe DT bindings for SM8450 SoC.The PCIe IP is similar
to the one used on SM8250. Add the compatible for SM8450.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

