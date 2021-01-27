Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3251E305B79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 13:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343524AbhA0Meu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 07:34:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:48392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237976AbhA0Mbq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 07:31:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA46E20793;
        Wed, 27 Jan 2021 12:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611750665;
        bh=zmIt74OYog12g3nhqk+8BQG/Tjv6vDEBEGYa/eSWniI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O69yXSBpT/PLhEqa7GF4Q7vNsZH6TFViyR9a0DXnM1Hn7jDB60KF16y7AUySsB+3L
         VsX2D77v3UOwsEu6A0mPwqg3KHvJ2C3lYWBYyALfKzsvV722b9LRXtjgEwcHKfIg0D
         jVeqCHJ+0zG4S95OiLWHrTdxo8+/Gis182BdeFNgGMACHEfqcNy6YzhCMUA6IGgAjH
         FU/MwDGFeVgxIALVeHXkTqgJudnQ4CtTUDm+YEz+2Ni+DBg2EQ1waEC9tP/Bx5F2yi
         M1chExmGS4X121H3xyLSRTxBVxBu3hmnqbqBT89DjxRNQauGj4WxI9DWJpH8l5zH5Z
         7Di3EIURoxnkQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/6] dt-bindings: arm: qcom: Document SM8350 SoC and boards
Date:   Wed, 27 Jan 2021 18:00:49 +0530
Message-Id: <20210127123054.263231-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127123054.263231-1-vkoul@kernel.org>
References: <20210127123054.263231-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the SM8350 SoC binding and also the boards using it.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c97d4a580f47..8fe7e473bfdf 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -41,6 +41,7 @@ description: |
         sdm660
         sdm845
         sm8250
+        sm8350
 
   The 'board' element must be one of the following strings:
 
@@ -178,6 +179,11 @@ properties:
               - qcom,sm8250-mtp
           - const: qcom,sm8250
 
+      - items:
+          - enum:
+              - qcom,sm8350-mtp
+          - const: qcom,sm8350
+
 additionalProperties: true
 
 ...
-- 
2.26.2

