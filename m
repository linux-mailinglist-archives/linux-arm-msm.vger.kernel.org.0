Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42A7C2C9712
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 06:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgLAFge (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 00:36:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:53802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725962AbgLAFge (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 00:36:34 -0500
Received: from localhost.localdomain (unknown [122.171.214.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 512FC2085B;
        Tue,  1 Dec 2020 05:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606800953;
        bh=035VIv0GRh3/oat1wjyeHPrM7YiefIf5kZbPlJyaNnY=;
        h=From:To:Cc:Subject:Date:From;
        b=KTj5oRwmhxb+PlRmm9m0C+SddhGftvfy7IPATLO0+h2RoFFnJB/o/E8AIMWCwaWvv
         v7lWT9EOlggAJjo4Ahwtfn1xcnPeTjTw3Urp2vFeRp349dkFUsM1oaUQwvUcexlFKS
         Uo5gmLbQ1vGVsBtL/aLkW9s06ULCmjHRaGuyGOC8=
From:   Vinod Koul <vkoul@kernel.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: qcom,pdc: Add compatible for SM8250
Date:   Tue,  1 Dec 2020 11:05:37 +0530
Message-Id: <20201201053537.2134991-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible string for SM8250 SoC from Qualcomm. This compatible
is used already in DTS files but not documented yet

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.txt        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
index 1df293953327..9c1a046e6fd9 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
@@ -20,6 +20,7 @@ Properties:
 	Definition: Should contain "qcom,<soc>-pdc" and "qcom,pdc"
 		    - "qcom,sc7180-pdc": For SC7180
 		    - "qcom,sdm845-pdc": For SDM845
+		    - "qcom,sdm8250-pdc": For SM8250
 
 - reg:
 	Usage: required
-- 
2.26.2

