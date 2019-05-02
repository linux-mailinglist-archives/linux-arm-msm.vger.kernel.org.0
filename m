Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABFE1109D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2019 02:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbfEBAUO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 May 2019 20:20:14 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43883 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbfEBAUC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 May 2019 20:20:02 -0400
Received: by mail-pf1-f194.google.com with SMTP id e67so213388pfe.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2019 17:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E3Sj1qJb0z4ITNAEehqfID3UnkAx5s/XXWNjkKffQfU=;
        b=zEpyg9pbCcfkvwFW2lmkHaYw4yyiwzQL+VAJlGltUoQXTJpPE5AFN2bRZntv/Ka7l8
         5MvCCEp1tfaTmDKpy5J+tD2ONsTTPuJ5qVu9DeGAZ+wDBBXfKyBpMwsFcVNVuzTgdOOz
         yJ9d/A2FJ6gyMgXOKKfMjmNcBz7LFRiEL+wUpDVX7KPqMl0EDqZjjiAxG012mulIwjVs
         82yBANyzLl1OSZdyQv9TXoSJVXXu8+n8nhYdEpCPDo/08voTOwWgNb1RE668luqwxHVz
         aXH9ZeBXmWnvTB3wVZTkI0VtEqkxe82nPd4IjwwXOpg0AsHZ1CgH5ihCzjWaxBfsGsuz
         KLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=E3Sj1qJb0z4ITNAEehqfID3UnkAx5s/XXWNjkKffQfU=;
        b=Q2BtI1o3fmXsapxc0nxJXRo+SrpJ57Tt6Q9tfaT//MRhbx5ioWMozw6Daw8UuKIhds
         yEFZZOJtQ+7xb13lg3tTKfTLcH+lqeZ7nfwS+i5BYKhhkh9dttmzmviH8CGdVBFkJ+xr
         VPzCsTDzWHRZnb+KYsRNIB8ha2eEjY4KUFEBr0wxkfkdihYaHUbePKszasrAM94rU4RO
         MIwAM2jiJM5lcGiek1/XOR/LGv+AFFuCVq+4o5927SJjMLHJ7MV3XTZDmyO3MDul4XKl
         W+u6EPVg08gPM1hWGi0CGaGu2zp3dK/RA3mBt/LiysEMFrCpUyyPLaAtcN0nMlU4dfee
         bfEg==
X-Gm-Message-State: APjAAAW8V6b/TWfGuEJxQRzASo/PIuTumtSILlfTQSrnXMNvFMB0qaaO
        JfYn/r+b/4vwvmR6CcJZ8aSckQ==
X-Google-Smtp-Source: APXvYqyuKZju222vPHwWFWzBfL0wmEdkJgGIUuUpI5WGtfe21pDlwonXurw15SfiKQKXw3bnYyb5Gg==
X-Received: by 2002:a63:ed10:: with SMTP id d16mr816767pgi.75.1556756401822;
        Wed, 01 May 2019 17:20:01 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s198sm36927534pfs.34.2019.05.01.17.20.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 17:20:01 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: PCI: qcom: Add QCS404 to the binding
Date:   Wed,  1 May 2019 17:19:54 -0700
Message-Id: <20190502001955.10575-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190502001955.10575-1-bjorn.andersson@linaro.org>
References: <20190502001955.10575-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm QCS404 platform contains a PCIe controller, add this to the
Qualcomm PCI binding document. The controller is the same version as the
one used in IPQ4019, but the PHY part is described separately, hence the
difference in clocks and resets.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 .../devicetree/bindings/pci/qcom,pcie.txt     | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
index 1fd703bd73e0..ada80b01bf0c 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
@@ -10,6 +10,7 @@
 			- "qcom,pcie-msm8996" for msm8996 or apq8096
 			- "qcom,pcie-ipq4019" for ipq4019
 			- "qcom,pcie-ipq8074" for ipq8074
+			- "qcom,pcie-qcs404" for qcs404
 
 - reg:
 	Usage: required
@@ -116,6 +117,15 @@
 			- "ahb"		AHB clock
 			- "aux"		Auxiliary clock
 
+- clock-names:
+	Usage: required for qcs404
+	Value type: <stringlist>
+	Definition: Should contain the following entries
+			- "iface"	AHB clock
+			- "aux"		Auxiliary clock
+			- "master_bus"	AXI Master clock
+			- "slave_bus"	AXI Slave clock
+
 - resets:
 	Usage: required
 	Value type: <prop-encoded-array>
@@ -167,6 +177,17 @@
 			- "ahb"			AHB Reset
 			- "axi_m_sticky"	AXI Master Sticky reset
 
+- reset-names:
+	Usage: required for qcs404
+	Value type: <stringlist>
+	Definition: Should contain the following entries
+			- "axi_m"		AXI Master reset
+			- "axi_s"		AXI Slave reset
+			- "axi_m_sticky"	AXI Master Sticky reset
+			- "pipe_sticky"		PIPE sticky reset
+			- "pwr"			PWR reset
+			- "ahb"			AHB reset
+
 - power-domains:
 	Usage: required for apq8084 and msm8996/apq8096
 	Value type: <prop-encoded-array>
@@ -195,12 +216,12 @@
 	Definition: A phandle to the PCIe endpoint power supply
 
 - phys:
-	Usage: required for apq8084
+	Usage: required for apq8084 and qcs404
 	Value type: <phandle>
 	Definition: List of phandle(s) as listed in phy-names property
 
 - phy-names:
-	Usage: required for apq8084
+	Usage: required for apq8084 and qcs404
 	Value type: <stringlist>
 	Definition: Should contain "pciephy"
 
-- 
2.18.0

