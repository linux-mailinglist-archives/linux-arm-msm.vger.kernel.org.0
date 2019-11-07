Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62B0BF232E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 01:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbfKGAQt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 19:16:49 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:47078 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbfKGAQs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 19:16:48 -0500
Received: by mail-pg1-f195.google.com with SMTP id r18so358564pgu.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 16:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0nBZv8FFoKEgL4fsBvxQaUdCsRxc1XVotv1J9YRLLnw=;
        b=KlLlhnQzrZLYcZikdtxcTrY7sQne6JCPy0QN8bUz5EuBMZh8wwD/0fld2egCgIDonA
         nEFruNRrcA4//QYZF5HEFn9d3KTeaRgZfVoBvdDX610t95RTvAYuq5bc/3OrgJS3cvYY
         QV+6Yx2iagsg0yaRhWwaAh+p1AAVTlVfa1BcHioGT+oMCsp67w2724+YyAZ5xVBw29/e
         IIwjBgZl7xk1sDCqRN1J9ImRuwhrZpDfSZELDsI4RkzjRqGn25M/xwKG9LksalvkjlFW
         4+P/1jCX6LgKnuKeILkhZdoCNMANVdOGfrFQwwmr3neU3l6SZQQem0MbywkBO8YnIzc6
         4PKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0nBZv8FFoKEgL4fsBvxQaUdCsRxc1XVotv1J9YRLLnw=;
        b=Vflv16n7p9fddyYpiuX5AOsihllSkGf7K/nVzKGwVIiQL60UNH6DY6BWQv0yHoR76m
         NSjXVbMvWbLTfile2XLcFa6n0A8R4ea4jbmfHGMBmbskDoz9U7kL0I0ecHe1F8XSclT4
         sV3tmr1VeEdGA3AX7/iYUmQtej1qmcxROcG9kn/Tsd6lF/B8jFLQ2mQOZjUgi6P6nyG3
         gJRskK07xm+djRI92khqY3IcgtzjtMMEegI7VGnYb5d7Zo3Z/gW3fsGx6y/v7eYWwMfU
         MN6XMkKHOeM7wcIce+aOI7dasNzfZHcVoiWPM+g5/vj4/Ds0elbpNDSUFBUmfRSiV7Eo
         F/gA==
X-Gm-Message-State: APjAAAVxnem/RiUd11rhGqqDwto5DD23ihWI+8nMZgTWpUdP795m2nkT
        Yy/D7Zsj24hKfTbuuAJ45gdPOA==
X-Google-Smtp-Source: APXvYqylCS28PWGfQarKLeATMQnlbU/SSpHJ55W+DXbTPWJdbgLGRSTTN/p4Gq9A3Hy0tqLWzVu3KQ==
X-Received: by 2002:a63:65c6:: with SMTP id z189mr714193pgb.433.1573085807945;
        Wed, 06 Nov 2019 16:16:47 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 90sm81044pjz.29.2019.11.06.16.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:16:47 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andrew Murray <andrew.murray@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: PCI: qcom: Add support for SDM845 PCIe
Date:   Wed,  6 Nov 2019 16:16:41 -0800
Message-Id: <20191107001642.1127561-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107001642.1127561-1-bjorn.andersson@linaro.org>
References: <20191107001642.1127561-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible and necessary clocks and resets definitions for the
SDM845 PCIe controller.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Picked up Rob and Vinod's R-b

 .../devicetree/bindings/pci/qcom,pcie.txt     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
index ada80b01bf0c..981b4de12807 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
@@ -11,6 +11,7 @@
 			- "qcom,pcie-ipq4019" for ipq4019
 			- "qcom,pcie-ipq8074" for ipq8074
 			- "qcom,pcie-qcs404" for qcs404
+			- "qcom,pcie-sdm845" for sdm845
 
 - reg:
 	Usage: required
@@ -126,6 +127,18 @@
 			- "master_bus"	AXI Master clock
 			- "slave_bus"	AXI Slave clock
 
+-clock-names:
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
 - resets:
 	Usage: required
 	Value type: <prop-encoded-array>
@@ -188,6 +201,12 @@
 			- "pwr"			PWR reset
 			- "ahb"			AHB reset
 
+- reset-names:
+	Usage: required for sdm845
+	Value type: <stringlist>
+	Definition: Should contain the following entries
+			- "pci"			PCIe core reset
+
 - power-domains:
 	Usage: required for apq8084 and msm8996/apq8096
 	Value type: <prop-encoded-array>
-- 
2.23.0

