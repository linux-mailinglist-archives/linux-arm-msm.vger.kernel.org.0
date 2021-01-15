Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3FA2F74F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 10:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbhAOJKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 04:10:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:35626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbhAOJKj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 04:10:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6988D233CF;
        Fri, 15 Jan 2021 09:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610701799;
        bh=xG/FvGlpOFtU5Vw4aqI2NakMCDn81Aj/i6/A8Rthuqk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mB9phZNy47yLKwlDe2M2Hep/3LtHLTJ+/kYeT/GYzEjl8OksRh0GEjMFqKI9OxaX9
         zYYa0MdHcRJVfogagPl5G4E8OpwAs/LjFByib7Ch6tZ5+ATpI/TfSEubKwhlzAarCk
         5o4pYbk/bC6E9dt/gKei2pq4GbDab7Dv4TC/Znq7T/S44Gv1ukYhCOVf8sPz7X+0lx
         u45K+Bv0I9zApZ2QZGoHU3eRGc9oy0/HJj/VIq+UcGJSlL4UdCEMz6sX1z3zbRTOTx
         mXMPmiNwLnrHa/Glt9KnOmQbhTeBKB+SF2jQoualhO23rLq1x1SRKDXQhq8ivbgPRb
         yTfyLJhjhtyFw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: qcom,pdc: Add compatible for SM8350
Date:   Fri, 15 Jan 2021 14:39:41 +0530
Message-Id: <20210115090941.2289416-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115090941.2289416-1-vkoul@kernel.org>
References: <20210115090941.2289416-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible string for SM8350 SoC from Qualcomm.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.txt        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
index 9c1a046e6fd9..e9afb48182c7 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
@@ -21,6 +21,7 @@ Properties:
 		    - "qcom,sc7180-pdc": For SC7180
 		    - "qcom,sdm845-pdc": For SDM845
 		    - "qcom,sdm8250-pdc": For SM8250
+		    - "qcom,sdm8350-pdc": For SM8350
 
 - reg:
 	Usage: required
-- 
2.26.2

