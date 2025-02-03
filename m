Return-Path: <linux-arm-msm+bounces-46783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BA2A25D65
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 503AD188C1E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41D520E307;
	Mon,  3 Feb 2025 14:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idN3qLUG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925E12080FD;
	Mon,  3 Feb 2025 14:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593815; cv=none; b=ph6hvlXweI0Qb0E+sbAopgSE6RHHxMKD2tywG2FVaUUS1m0e9r5Rewlsrisck9LbvmSd13opa00WDNbad+ZDWXvD21YVE3zbEEqzcklwgte3TDEar/beMgVGKY7H/092OQfU8rjpQ8UNFideb076EUCuVtNRy2MAQMlxeqUTvoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593815; c=relaxed/simple;
	bh=zD7Pq+WFbaHHBaS2R8kR9JYaHuI7hD9DburLNSUKAVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fsTfZ33okR2K5lgL32LXa+HJw6Ag703JocoYIDBF+8+8cB0H04c/9qJdPzF7/DhTT3rdmW6Na5OlZ+ofIXFNRUcb6N8oP0YXxFp2IO2PVchar5xPi0BTvyBfHFLbJpHJGGdNxra4X6abegktb6lzyhj9urALOZZvmAkYLBJboXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idN3qLUG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E474C4CEE0;
	Mon,  3 Feb 2025 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738593815;
	bh=zD7Pq+WFbaHHBaS2R8kR9JYaHuI7hD9DburLNSUKAVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=idN3qLUGd0hhZOxWPP49Lw28CqynEiRiulvMNbLNcBi357mDCC30ow7oj5c77famd
	 Vze2Twuv7ue16mu3a9Up8lFRRiMz1ngeEgY2IiyMst4RGXwi4rwsDwj06LfLPWQ6EZ
	 TI2PAClLB4zdPSJkp8apFUyGUZCYk5l3ecBGgn0KxkOi8yuPBIXme17wsxbov6r3dq
	 lnZJ+8IB2fXMs+K5lVaMMAtQ0VkOF7vh3v1VijRTjsGEyZU/rXqpmdRi6ZOkBxJEE5
	 NMxpYYYKopYmCnv1FdOjaOeXtKOWaC702PcDYUrOpV1TeT/62z6A/7XMYFwqR+unWs
	 8Od6hI1G3o1pQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 03 Feb 2025 15:43:20 +0100
Subject: [PATCH v2 1/6] dt-bindings: phy: qcom,qmp-pcie: Add X1P42100 PCIe
 Gen4x4 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-topic-x1p4_dts-v2-1-72cd4cdc767b@oss.qualcomm.com>
References: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
In-Reply-To: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738593805; l=1694;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=42PZ3rbeoTMdj0E7PXO8CTKf4NJAQ55+Zvhnaeo61ps=;
 b=6XhwaHS612yGZQtBXD5K7jXAbLxI/7wUek8qLJ6Z4P3wcTHtcG3v+uJ1Pz5w8RN/jF1qIB7+H
 RkFz2yojXtECkeMuSder0AkiY1TaGKst+4tx2LyJrfy78Xh6YgXZ20R
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

X1P42100 has two Gen4x4 PHYs instead of one Gen4x4 and one Gen4x8.

They are mostly identical to X1E80100's Gen4x4 PHY, but there are some
minor details in the programming sequences.

Introduce a new compatible for this flavor of the PHY.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 89391649e0b5cb7e778b51fe61fb445d1f17eaf5..51eaffa45c18df15f93f7a3c7382415a59982793 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -45,6 +45,7 @@ properties:
       - qcom,x1e80100-qmp-gen4x2-pcie-phy
       - qcom,x1e80100-qmp-gen4x4-pcie-phy
       - qcom,x1e80100-qmp-gen4x8-pcie-phy
+      - qcom,x1p42100-qmp-gen4x4-pcie-phy
 
   reg:
     minItems: 1
@@ -124,6 +125,7 @@ allOf:
             enum:
               - qcom,sc8280xp-qmp-gen3x4-pcie-phy
               - qcom,x1e80100-qmp-gen4x4-pcie-phy
+              - qcom,x1p42100-qmp-gen4x4-pcie-phy
     then:
       properties:
         reg:
@@ -180,6 +182,7 @@ allOf:
               - qcom,x1e80100-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen4x4-pcie-phy
               - qcom,x1e80100-qmp-gen4x8-pcie-phy
+              - qcom,x1p42100-qmp-gen4x4-pcie-phy
     then:
       properties:
         clocks:

-- 
2.48.1


