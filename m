Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFF4A800F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 12:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729068AbfIDKKW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 06:10:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:40418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbfIDKKV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 06:10:21 -0400
Received: from localhost.localdomain (unknown [122.182.201.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B32AC233A1;
        Wed,  4 Sep 2019 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567591820;
        bh=kZtJo0KapTONfrxJjZzeyUaYd5qO0HV428i3J/RotIU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kDp3Ks5rtdnF3T8wXfe4iEeFogNasI3PzC7flDRM6F45YJaMSnHfcq5EJL1EE9L1W
         s+Tw0ZqQAKulW4GpDaLgMsmSNqD58z2OMsvZ58S/whshNbklXjodVRKDJNPYXOGZ0C
         cL9uq1a4vmQQf/s9h/foZU+ijKjWHkRntptGQnkM=
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/3] dt-bindings: phy-qcom-qmp: Add sm8150 UFS phy compatible string
Date:   Wed,  4 Sep 2019 15:38:34 +0530
Message-Id: <20190904100835.6099-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904100835.6099-1-vkoul@kernel.org>
References: <20190904100835.6099-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document "qcom,sdm845-qmp-ufs-phy" compatible string for QMP UFS PHY
found on SM8150.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index 085fbd676cfc..eac9ad3cbbc8 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -14,7 +14,8 @@ Required properties:
 	       "qcom,msm8998-qmp-pcie-phy" for PCIe QMP phy on msm8998,
 	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
 	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
-	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845.
+	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845,
+	       "qcom,sm8150-qmp-ufs-phy" for UFS QMP phy on sm8150.
 
 - reg:
   - index 0: address and length of register set for PHY's common
@@ -57,6 +58,8 @@ Required properties:
 			"aux", "cfg_ahb", "ref", "com_aux".
 		For "qcom,sdm845-qmp-ufs-phy" must contain:
 			"ref", "ref_aux".
+		For "qcom,sm8150-qmp-ufs-phy" must contain:
+			"ref", "ref_aux".
 
  - resets: a list of phandles and reset controller specifier pairs,
 	   one for each entry in reset-names.
@@ -83,6 +86,8 @@ Required properties:
 			"phy", "common".
 		For "qcom,sdm845-qmp-ufs-phy": must contain:
 			"ufsphy".
+		For "qcom,sm8150-qmp-ufs-phy": must contain:
+			"ufsphy".
 
  - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
  - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
-- 
2.20.1

