Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 975CFAB1EB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 07:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392278AbfIFFLy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 01:11:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:47152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732560AbfIFFLy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 01:11:54 -0400
Received: from localhost.localdomain (unknown [223.226.32.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E19232070C;
        Fri,  6 Sep 2019 05:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567746713;
        bh=quQV/HS8gGCUn1UWhphtDkGr/N21acpw1xudY2aPM3U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MAyR40ZAl0wGJPCA/wYtQkcE/uXVXxcii7iNMd/hBakVUfWJwJOALrW7UF3kj61rJ
         z5pJ++lctr2ucCMpJOmBVYqrpzZCnQGTqyosUi2AeDzO8eMJVCv/CJXUnJKwg7tX79
         DSx2uj3Y4ffEZJjWoE1+wtMXjrdPAJp3rVSoHJ/M=
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v2 2/3] dt-bindings: phy-qcom-qmp: Add sm8150 UFS phy compatible string
Date:   Fri,  6 Sep 2019 10:40:16 +0530
Message-Id: <20190906051017.26846-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906051017.26846-1-vkoul@kernel.org>
References: <20190906051017.26846-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document "qcom,sdm845-qmp-ufs-phy" compatible string for QMP UFS PHY
found on SM8150.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
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

