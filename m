Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949CD3307CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:09:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234668AbhCHGIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:08:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:44546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234615AbhCHGIq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:08:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 449ED64FBD;
        Mon,  8 Mar 2021 06:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183725;
        bh=EtY/V7yjLL1IixCTj6Enc/LPtqAeNHUS6kzCMdLWgsY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i28uL1X3NZYQZAXqCtOXvXZgvHC58SUPL3m8uaGxfyYK4e1wRnPQpoI8vparSF7tD
         GYAmarxZhI+wqJb5/LWCGDHYlolhB8uiHZUwdxAxbSawLOA7drwJdAryxUPem4nS+t
         4KtnUhRLroBExZIbAOgGAYjokjeQcVwU+kVnGsclZ31qaT1NzAHCjRSqlGjkcxHchl
         /niJPETmdbPyclGWJ9k0qbpq2Qev88vxwBtbHeI9ao1V+F6MZR8oXkGe2MHTV+OoG0
         o3Eil0T+mQdkpNoDvwkSd+MFvC/Rjw22cKX2s5prMxrkJfkjha+MDkOygvVp49Arpt
         SC1yKaAj6+ZAA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/18] dt-bindings: arm: qcom: Document ipq6018-cp01 board
Date:   Mon,  8 Mar 2021 11:38:11 +0530
Message-Id: <20210308060826.3074234-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308060826.3074234-1-vkoul@kernel.org>
References: <20210308060826.3074234-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the ipq6018-cp01 board. It was missing leading to warning:

arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml: /: compatible: 'oneOf' conditional failed, one must be fixed:
        ['qcom,ipq6018-cp01', 'qcom,ipq6018'] is too short
        ['qcom,ipq6018-cp01', 'qcom,ipq6018'] is too long
        Additional items are not allowed ('qcom,ipq6018' was unexpected)

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 174134f920e1..74610f1d1407 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -176,6 +176,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,ipq6018-cp01
               - qcom,ipq6018-cp01-c1
           - const: qcom,ipq6018
 
-- 
2.26.2

