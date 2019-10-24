Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 454D6E2B5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2019 09:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408724AbfJXHsp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Oct 2019 03:48:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:54358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404701AbfJXHsp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Oct 2019 03:48:45 -0400
Received: from localhost.localdomain (unknown [122.181.210.10])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7662E2084C;
        Thu, 24 Oct 2019 07:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571903324;
        bh=yxBzuY5vQ1qSryK6IQg7fvOnrKcvDa+SSEeBRqhkPxw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pF2kgEu9XntoVcWKyu8gAlTtFColK9gK1fB7ANdbn7GNLfZjh0V85EZwEDBY12puM
         /SYx3sBcdxLVtsrrfxEvzg03JeUisxhA783KqrJv7FAyBeCSxzHJWfh4DhuXp+0qib
         NqPkybYe+qwnHVFMrKDiPGDCBR04nBqjyh8gKhIA=
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/3] dt-bindings: phy-qcom-qmp: Add sm8150 UFS phy compatible string
Date:   Thu, 24 Oct 2019 13:18:01 +0530
Message-Id: <20191024074802.26526-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191024074802.26526-1-vkoul@kernel.org>
References: <20191024074802.26526-1-vkoul@kernel.org>
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
Reviewed-by: Rob Herring <robh@kernel.org>
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

