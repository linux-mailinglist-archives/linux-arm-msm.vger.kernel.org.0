Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50F9030F8DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 18:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238239AbhBDQ7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 11:59:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:54012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238267AbhBDQ7G (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 11:59:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7B9764F3C;
        Thu,  4 Feb 2021 16:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612457905;
        bh=z0XutANkFnDl2HKzc+3dvSKKP7OeyOyODq+qSSIl9nY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lRM6DmXxCArxfNSfeePmfUSveiVunt5ceaWIqQVEyk4khDRmJlg0UBU/gMhSV1dtf
         GV+YTJj607iRUjAPIff/6p4EMcEJRLSSeSojRFO5fW9+3lEQ0h5hBawCGvVv/z4WFY
         47MnXywTa52DkYN4DI7jZO01NcUUBEVScq/dDC4LmBjbmpixXV1etctEsrwqR3YJNP
         sEQ2aFLQXd6etCssTk+3LyVockRKAE30k1Xj/fQU7ElTL+JqPD0FgITz5a75Rsjmyd
         vtjhbIbsLOW0UxrcGk/w0Dh1eBEGqSdB/6VqQMhAVNy72ZmglElEyJJHDIMB4l6SFK
         PUHJdDQ2SypzA==
From:   Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: phy: qcom,qmp: Add SM8350 UFS PHY bindings
Date:   Thu,  4 Feb 2021 22:28:03 +0530
Message-Id: <20210204165805.62235-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210204165805.62235-1-vkoul@kernel.org>
References: <20210204165805.62235-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible strings for the UFS PHY found on SM8350 SoC.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 62c4f2ba5b9f..bf804c12fa5f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -38,6 +38,7 @@ properties:
       - qcom,sm8250-qmp-modem-pcie-phy
       - qcom,sm8250-qmp-usb3-phy
       - qcom,sm8250-qmp-usb3-uni-phy
+      - qcom,sm8350-qmp-ufs-phy
       - qcom,sm8350-qmp-usb3-phy
       - qcom,sm8350-qmp-usb3-uni-phy
       - qcom,sdx55-qmp-usb3-uni-phy
-- 
2.26.2

