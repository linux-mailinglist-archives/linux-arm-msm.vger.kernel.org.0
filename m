Return-Path: <linux-arm-msm+bounces-129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AFD7E4CCD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 00:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7624F1C20AB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 23:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8975B2B9A6;
	Tue,  7 Nov 2023 23:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmUfYLsf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E0530670;
	Tue,  7 Nov 2023 23:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681BDC433C8;
	Tue,  7 Nov 2023 23:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699399419;
	bh=iHy+GyJ9NrsW/tearCxVFHDU40FeYw6GBtWc/Y5XfUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cmUfYLsfzr6xtgSYobCf1VTXJeBB5718clHDdFmRbOrbve022s/yeMwwBjELMgijk
	 Xg1HlfT5sSwmX3DkZEVkNOm5Ee4SmlT3gZqvBn+/CfNyioRMrD8MdSJbxrc3SPBvlb
	 iLnOr9iNYW5Ub3L//tIV66xBIQg4tS0dyKUmzVnl/cikiulk9x8BVrMP3v1TWg5QR7
	 WFG1vkMbF44NVWmTw09SvbGf88881WFgs11bE1x+N0aQvLsZIeu29mqNy3j+I7Zf6O
	 6EqLBErTrp8alQucDlbHGSX/IiWVKFmt0utBDYlqBlGHHVi7QJLL5PDvbNezaAFBua
	 2wQ/FLwKkdZbw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	agross@kernel.org,
	andersson@kernel.org,
	kishon@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	abel.vesa@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 04/18] dt-bindings: phy: qcom,snps-eusb2-repeater: Add magic tuning overrides
Date: Tue,  7 Nov 2023 18:22:59 -0500
Message-ID: <20231107232330.3776001-4-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107232330.3776001-1-sashal@kernel.org>
References: <20231107232330.3776001-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konrad.dybcio@linaro.org>

[ Upstream commit c20b59b2996c89c4f072c3312e6210528a298330 ]

The EUSB2 repeater requires some alterations to its init sequence,
depending on board design.

Add support for making the necessary changes to that sequence to make USB
functional on SM8550-based Xperia 1 V.

They all have lackluster description due to lack of information.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20230830-topic-eusb2_override-v2-1-7d8c893d93f6@linaro.org
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../phy/qcom,snps-eusb2-repeater.yaml         | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 083fda530b484..828650d4c4b09 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -27,6 +27,27 @@ properties:
 
   vdd3-supply: true
 
+  qcom,tune-usb2-disc-thres:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: High-Speed disconnect threshold
+    minimum: 0
+    maximum: 7
+    default: 0
+
+  qcom,tune-usb2-amplitude:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: High-Speed trasmit amplitude
+    minimum: 0
+    maximum: 15
+    default: 8
+
+  qcom,tune-usb2-preem:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: High-Speed TX pre-emphasis tuning
+    minimum: 0
+    maximum: 7
+    default: 5
+
 required:
   - compatible
   - reg
-- 
2.42.0


