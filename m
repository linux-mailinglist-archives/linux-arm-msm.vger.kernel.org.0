Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C3B2F900C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 02:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbhAQBbc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jan 2021 20:31:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727617AbhAQBbb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jan 2021 20:31:31 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96D8EC061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jan 2021 17:30:50 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id m10so14551147lji.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jan 2021 17:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tf8Myeu0NiVasaQllGDJf9giDfGqj4Lr7pfXB9rMYOo=;
        b=bzh8H1o7OvBYKYZ+AUzTP0kObTcxG67VlE7t4IciX+DNMBw4buWt3PpsPy1ugyWDaU
         G1wR+AlNBL0CF7lNBdmJXw/zmskc4d7AXi6To71O2waK/ssnMrChLVK38rLhLUbiLPG/
         cFbShffgA1YjuObRsbST9vvpUo4+EOfo8hj9jiJQOmvrI7DWda4L73e8iICl+Zb21gc2
         hg4MxgiS2KrgK/P1qtQa2S0VJpt7pA9NPtzVEn/PXacjwb3OyRAXJdM7uZ0Vgi63zacs
         oyoI47DhDpTp+FcPPyVEbP19sGpGjarR+Gwh8noKBuqGO9mZcXzjP947q5v6A/YMdQvq
         Cybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tf8Myeu0NiVasaQllGDJf9giDfGqj4Lr7pfXB9rMYOo=;
        b=lt0KVEFQ0hdlwFl7R0JQDQMOeG2zkGTyXr4r6XBHXTVsOh2jA7kvp3hWobGANF/P2C
         NhVithNdiYV/IljY08lu+g4ZSK7R7MQpnOqxxru1C1AGJ0T/Ha3kSSGGsH243S392FeL
         FoW7NNwPaLxPvxHqdxzleDGWKDwwo3xEfH5sqOv1cZ7oCqW1Cr/PcuAI4lmgVrqAOlC5
         WwiC0c3DgptNguu1w/JmrDi18SuKZ3uCkcRlS6vOgTqKCM8OWEdwFow8HEA3YONZPaOL
         jLMgVO5VxZijcsculx2iWcOJZB88ajUZfFkubGeBI+b5ACferWdrTDyySjvam1Ia3aKr
         zqWw==
X-Gm-Message-State: AOAM532YhusLWvXwR/GJ/OjFVlCxVAgeEMlpRm79vn8JIKjk0PIRyTbd
        90/Qkrp9vveqFU5Cgbw3Nl++7g==
X-Google-Smtp-Source: ABdhPJzCDmMat/1UUigYllAFwd42mjPpe1qj4SNZ/2UrU65qWRdj9vEqkxPR4+SWN10VoNs9u+OiXQ==
X-Received: by 2002:a2e:9654:: with SMTP id z20mr8451972ljh.54.1610847047709;
        Sat, 16 Jan 2021 17:30:47 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.101])
        by smtp.gmail.com with ESMTPSA id m13sm1260909ljo.121.2021.01.16.17.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 17:30:47 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-pci@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: pci: qcom: Document ddrss_sf_tbu clock for sm8250
Date:   Sun, 17 Jan 2021 04:30:43 +0300
Message-Id: <20210117013044.441700-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8250 additional clock is required for PCIe devices to access NOC.
Document this requirement in devicetree bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 458168247ccc ("dt-bindings: pci: qcom: Document PCIe bindings for SM8250 SoC")
---
 .../devicetree/bindings/pci/qcom,pcie.txt       | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
index 3b55310390a0..0da458a051b6 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
@@ -132,8 +132,20 @@
 			- "master_bus"	AXI Master clock
 			- "slave_bus"	AXI Slave clock
 
--clock-names:
-	Usage: required for sdm845 and sm8250
+- clock-names:
+	Usage: required for sdm845
+	Value type: <stringlist>
+	Definition: Should contain the following entries
+			- "aux"		Auxiliary clock
+			- "cfg"		Configuration clock
+			- "bus_master"	Master AXI clock
+			- "bus_slave"	Slave AXI clock
+			- "slave_q2a"	Slave Q2A clock
+			- "tbu"		PCIe TBU clock
+			- "pipe"	PIPE clock
+
+- clock-names:
+	Usage: required for sm8250
 	Value type: <stringlist>
 	Definition: Should contain the following entries
 			- "aux"		Auxiliary clock
@@ -142,6 +154,7 @@
 			- "bus_slave"	Slave AXI clock
 			- "slave_q2a"	Slave Q2A clock
 			- "tbu"		PCIe TBU clock
+			- "ddrss_sf_tbu" PCIe SF TBU clock
 			- "pipe"	PIPE clock
 
 - resets:
-- 
2.29.2

