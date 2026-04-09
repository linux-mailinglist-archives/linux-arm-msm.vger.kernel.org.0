Return-Path: <linux-arm-msm+bounces-102506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHinH9PJ12k/TAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 17:46:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EEB3CCFB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 17:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C14523021D15
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 15:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A493E0237;
	Thu,  9 Apr 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmutQfLF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF183DFC62;
	Thu,  9 Apr 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748416; cv=none; b=is9KBN0W6MVSI57+c7/NdJRtswU9CqYFExM3RunYltuSc0m2pFPSD69PaT26uegmbTZVu7oXMOFcB9/qBTJRmJXRwbm27kYF5hFnEFcOAEa+uXqHFagwxHoUUF5F+TszGW0yxrovcTMl6DKNjExiMEQj7/MtIiiSTnmfjQlzr7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748416; c=relaxed/simple;
	bh=cep+xMb91JM9KjM4+ZqrlL/XV/ZXMZeYnM+gV7tlv0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k7FEI7fuZmzKsftL2fnYrD1fAUmISqoQDlJBb0pWX6DACWMwLY3aDkLPaGLXs53E0mGMmeYoUJ/z5RpX8K1/STdqrdDK1vQ7PBgC2oSODJ/uE0/Dqfzl7JZVwm9Hn1T3b6/VGkvPvrK3PE/Olj/bzYFguqr0b6rUy/0WqsxPraY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmutQfLF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D085BC2BC9E;
	Thu,  9 Apr 2026 15:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775748415;
	bh=cep+xMb91JM9KjM4+ZqrlL/XV/ZXMZeYnM+gV7tlv0E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dmutQfLFG3bN2I6iOr+1Er0+CR/bIAs+CoiXs8MQSxc+nZ0bIF5OWIt1l40bO9huO
	 SElCDsXh4MfI60F5DZXzB7lyqo+uh9DWSAHmdNEaEOvvfpI9qitRs/54yotgM+SAEh
	 bWK/HYFs4ksxALR3D3mmRwFSG27Qnd+iK/M3IKTQ3pxeLUXMk6/V8NjmzxpA3xchwi
	 rtosFNpDhhDBhwyJASi+lZiZDfuhwtHNjFD3P9ZA9KjMXupmmrWzawkX8VPmRzl+mG
	 AlI3hwTDgf/9FiSKC/+fJMiBMWhd5Equt1RRx8baatnY5LzuqMX29BnTx8BLUvUWfM
	 THcjwPqc+tbkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36E5F31E2C;
	Thu,  9 Apr 2026 15:26:55 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Date: Thu, 09 Apr 2026 16:26:54 +0100
Subject: [PATCH v3 2/5] arm64: dts: qcom: sm8550: add PCIe port labels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rb5gen2-dts-v3-2-be736355d4b4@axon.com>
References: <20260409-rb5gen2-dts-v3-0-be736355d4b4@axon.com>
In-Reply-To: <20260409-rb5gen2-dts-v3-0-be736355d4b4@axon.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775748414; l=2276;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=bK2sEqMstb26/kSTAhsg9lrLGwFBAEwx+Z/Kvj8kVLc=;
 b=8mxIsaAUS3Ug0ICJ49fi02flrfSL856RfZ4CC3fAWaXdht55I2X8OSn6yCh2rnJZVDp4oCpQi
 OOLfVV6LXRFCMSJ6pazhdiYx6H0mllDwW0r6bYcjCovD9MNq5Oy2Oe2
X-Developer-Key: i=jsandom@axon.com; a=ed25519;
 pk=Q/yflwj2WhkgBVTskrS9Vl5oScD0Bp3vTzDi+OxskTo=
X-Endpoint-Received: by B4 Relay for jsandom@axon.com/20260319 with
 auth_id=687
X-Original-From: Joe Sandom <jsandom@axon.com>
Reply-To: jsandom@axon.com
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102506-lists,linux-arm-msm=lfdr.de,jsandom.axon.com];
	FROM_HAS_DN(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[jsandom@axon.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.854];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,axon.com:email,axon.com:replyto,axon.com:mid]
X-Rspamd-Queue-Id: 14EEB3CCFB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Joe Sandom <jsandom@axon.com>

Add labels to the root port nodes (pcie0_port0, pcie1_port0) to
allow board DTS files to reference them for adding endpoint devices
to each pcie root port.

Update the pcieport0 reference to pcie0_port0 in sm8550-hdk.dts and
sm8550-qrd.dts to match the label rename in sm8550.dtsi.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Joe Sandom <jsandom@axon.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a8259d28540e718851e094f74ead278..e821b731bdc496c872703723df02ae9b9b0233b5 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1012,7 +1012,7 @@ &pcie0 {
 	status = "okay";
 };
 
-&pcieport0 {
+&pcie0_port0 {
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2fb2e0be5e4c6b597f20f332cdf063daa2664205..cf63109ff7bf7b6fc827f108e22e82b8b04273c1 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -912,7 +912,7 @@ &pcie0 {
 	status = "okay";
 };
 
-&pcieport0 {
+&pcie0_port0 {
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 055ca931c04859f3a312eb9921aeb7a8cc676822..54308cbde40732da072177eab533582c155df590 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2098,7 +2098,7 @@ opp-16000000-3 {
 				};
 			};
 
-			pcieport0: pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2300,7 +2300,7 @@ opp-32000000-4 {
 				};
 			};
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1



