Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6319C3B09D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 18:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhFVQEQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 12:04:16 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:33426 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229663AbhFVQEP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 12:04:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624377719; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=UqnDlULNFQX8sxYRGMJKBXRx62K74LxNFyKp7waY4JA=; b=xGtyk1nDTAfjlytLoEu4fO2oZ6ksxJo1c94enHVVDRre6XUZekapMTeoIaPaev+RoO9rmZBr
 7BFvS/MkaK8iOsbwnE+HGm4ePswJ0j1woiPMs6j/rFuzdDJquMvI5TaEAAVmG+qsfrJgiQaP
 4qRKKmq4u8akBIYsbUJlPBN8DuQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60d20948120032024135aefc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Jun 2021 16:01:12
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B75CEC433F1; Tue, 22 Jun 2021 16:01:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from pmaliset-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 32842C43144;
        Tue, 22 Jun 2021 16:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 32842C43144
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=pmaliset@codeaurora.org
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        mgautam@codeaurora.org, dianders@chromium.org, mka@chromium.org,
        sanm@codeaurora.org, Prasad Malisetty <pmaliset@codeaurora.org>
Subject: [PATCH v3 1/4] dt-bindings: pci: qcom: Document PCIe bindings for SC720
Date:   Tue, 22 Jun 2021 21:30:48 +0530
Message-Id: <1624377651-30604-2-git-send-email-pmaliset@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624377651-30604-1-git-send-email-pmaliset@codeaurora.org>
References: <1624377651-30604-1-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the PCIe DT bindings for SC7280 SoC.The PCIe IP is similar
to the one used on SM8250. Add the compatible for SC7280.

Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
index 25f4def..0acba07 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
@@ -12,6 +12,7 @@
 			- "qcom,pcie-ipq4019" for ipq4019
 			- "qcom,pcie-ipq8074" for ipq8074
 			- "qcom,pcie-qcs404" for qcs404
+			- "qcom,pcie-sc7280" for sc7280
 			- "qcom,pcie-sdm845" for sdm845
 			- "qcom,pcie-sm8250" for sm8250
 			- "qcom,pcie-ipq6018" for ipq6018
@@ -144,6 +145,22 @@
 			- "slave_bus"	AXI Slave clock
 
 - clock-names:
+	Usage: required for sc7280
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
+
+- clock-names:
 	Usage: required for sdm845
 	Value type: <stringlist>
 	Definition: Should contain the following entries
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

