Return-Path: <linux-arm-msm+bounces-86045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10169CD349A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 18:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9293D300FE3F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99982F290B;
	Sat, 20 Dec 2025 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2ckGDEi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9D81E2606;
	Sat, 20 Dec 2025 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766252836; cv=none; b=e68UeJTnos7W2EOZglQl1F5vbB4rNyhjPZB9p3gy6VhOOFMC8gwgMSRMu6CNuHzVAmLlhfQ/fH/aMkahJDmoScLvTsHY+f4AxQz14IYBOF1SwqFMMKXUZVcbMnNNlIoE5pVgmHQgkibbhAS5jMsosafhoaY5prqKJRorNFBSxDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766252836; c=relaxed/simple;
	bh=/6ymR/zsgaTJlBSb1sWLgYTVW3pJNv15dUW4iJE0K3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lOI2B/k0cQszbJXkIes6V3wpTs5w17SgKgybhblBahRDIWPFzE2YhM5UJ1hS8Zv79rn7PwFbRGWuWTUFBoqSOExJpGeHIBRS23j8332D2XuBtOeGA8GfAEJtin5+qCCA17XEThrhHS8vXIZaJ1cRNPmEdmEcbVJ5N1aCmBaJB4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2ckGDEi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18D77C116D0;
	Sat, 20 Dec 2025 17:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766252836;
	bh=/6ymR/zsgaTJlBSb1sWLgYTVW3pJNv15dUW4iJE0K3w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J2ckGDEiezHUEENyfhMf/ZmZzatVaSP/zzA06wI/v0IW4I+tGxD36W0wf8ZWsZtNQ
	 Fs2tk1JHWuhj0VYqfZOORcRsG4eSzr48xeFRsk0Y12/QYm5930IRo69MpPWd3k8sSF
	 oF1Z5r2uRW+IuVl0rZk4BDZk2Ia/8CAfZXPIR70jyVXvqdIhuXKrX+mZ+sc9r3Yidq
	 BYCrVoeAifE/hqrFBrYKmIwhc6j6KhzU1PoEwy4xR3g2Z6ZZ6DF9jt26x9wYN8J8FC
	 y4EmOaMRuVvexI4vwKS4q45G7jUoCGQx7jqOVpSjWS2+6po9OnN48FqRDa2ELKHd3F
	 LNPDnwqQApGkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BC2E668BC;
	Sat, 20 Dec 2025 17:47:16 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 20 Dec 2025 18:47:09 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: force
 usb2-only mode on usb_1_ss2_dwc3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-tb16-hdmi-v1-1-18b1e20b396e@oldschoolsolutions.biz>
References: <20251220-tb16-hdmi-v1-0-18b1e20b396e@oldschoolsolutions.biz>
In-Reply-To: <20251220-tb16-hdmi-v1-0-18b1e20b396e@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766252834; l=1227;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=E8oavXRiJ9H1foB04HdpgfXtgNtFJTJ6fhdED81IK24=;
 b=BGWpsS3qk/sTbV/IEd1uBM6f7fX4TAFb+4rSSmfGhelGAK+Oy1wlfkmy3PxfSvVv+HcQvZp19
 jI2qWoVYd9nCmgZbauYkkfqAbRx+loeZ5IyF3cGfntXjVMZoTOipkz7
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The usb_1_ss2 complex has 2 phys, usb_1_ss2_hsphy and usb_1_ss2_qmpphy. On this
laptop, they are used for different peripherals: The hsphy for the fingerprint
reader, the qmpphy to drive a hdmi bridge. The normal logical wiring for the dwc3
controller is to both phys. Overwrite that with ports only to the hsphy.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index 3186e79e862de67cbda48a4b85a459e6e965ba65..b505a4cbb4350a962bbf779ec788265c7583bf20 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -1560,6 +1560,20 @@ &usb_1_ss2_dwc3 {
 	maximum-speed = "high-speed";
 	phys = <&usb_1_ss2_hsphy>;
 	phy-names = "usb2-phy";
+
+	/delete-property/ ports;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_1_ss2_dwc3_hs: endpoint {
+			};
+		};
+	};
 };
 
 &usb_1_ss2_hsphy {

-- 
2.51.0



