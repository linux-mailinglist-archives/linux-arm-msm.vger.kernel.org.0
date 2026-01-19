Return-Path: <linux-arm-msm+bounces-89703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E2DD3AE98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97107301D33E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D6338A9D3;
	Mon, 19 Jan 2026 15:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okA/kT21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC1D389DE0;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835585; cv=none; b=LdANvQhqTT8WbL+LPxzQN8w1balsye3+PnXRJ2BH9IeN93zXk3YvU3+fZsOs3UZoeHWYGN10jSr/wcSVda1gDHQtoaVP1djP7YmE4kdKpuapslS0cGVbByiTU8axLSrQvKhRt/ybX6raGYQMShPTOzWi6vxEe8MzEzsPxbvsnds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835585; c=relaxed/simple;
	bh=wByVfzvvxUMMC5xRv8r3WcMWa2jc02VrCVChH0cIF9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N0+inSG4Lde8csDYZVzAPawS80vR57wc0iUO4IwRo3l9YmTX+m138CTE36bgDtUmc6RBZ0RRm1PXJZqMbSUvVXLwrHJBtwafuPV1a880VPUPmLxNNOgZbUOcAJk9eh6RuTIZ6uaK6+FEvhetFIe/n8eHGYGYjAwBdpqjgW5EXSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okA/kT21; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B61FC2BCAF;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768835585;
	bh=wByVfzvvxUMMC5xRv8r3WcMWa2jc02VrCVChH0cIF9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=okA/kT21lTY59uM/yo6CTfhkSNyUoQilhsnFp8vhD/RB3v47iGQ3QBiH9tpv/Bamg
	 b4s3ozs/tr+Nm7BqTc8VFTVVEWKB9secCVfBBB33374AJgWYSipNjxJtOTnyRizXk/
	 BicqhJxobILKeWavEsPe719MoSMIP7vDQ/E3NZKPdzySXD1m0Sn6f6ZzuMfqfCP2pS
	 wOm0x72Gnj8YF+eKmcsypL4zJDMivwv172WD3AynH+xWLTXFBGIRfCQ/t7kShtE+Pc
	 p5kQwOdz7snxdsN4abTRtLZNLjJr08ul11vwBFiqAzfSa59Xcn+8fgUoNNMIC9jH+H
	 Ru/jsCr0IOaIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F76D29C36;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
From: Biswapriyo Nath via B4 Relay <devnull+nathbappai.gmail.com@kernel.org>
Date: Mon, 19 Jan 2026 15:13:07 +0000
Subject: [PATCH 5/5] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable debug
 UART
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-xiaomi-ginkgo-features-v1-5-3c8fae984bda@gmail.com>
References: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
In-Reply-To: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768835583; l=1079;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=So7Suu1OGUJTmgzGz2EHPUQLhQmg/zXB63gWW3YsqKE=;
 b=0IHWbUEHxlEgzZpXjcPy5Dg59dwaRpe6fLc+8bhtzOJSDHaDXIKBRRh4K8LP3CuME+vKnauq0
 Gba5cpfCUGUBwGdJgL4jofTEx5osieJrpT33KntkcuLRoPeQNuUaUO8
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Endpoint-Received: by B4 Relay for nathbappai@gmail.com/20260118 with
 auth_id=607
X-Original-From: Biswapriyo Nath <nathbappai@gmail.com>
Reply-To: nathbappai@gmail.com

From: Biswapriyo Nath <nathbappai@gmail.com>

Enable the debug uart node in xiaomi ginkgo exposed as test points.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 673bc92c7..18aecd9ff 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -26,6 +26,10 @@ / {
 
 	qcom,msm-id = <QCOM_ID_SM6125 0x10000>;
 
+	aliases {
+		serial0 = &uart4;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -124,6 +128,10 @@ &pon_resin {
 	status = "okay";
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm6125-regulators";
@@ -300,6 +308,10 @@ &tlmm {
 	gpio-reserved-ranges = <0 4>, <30 4>;
 };
 
+&uart4 {
+	status = "okay";
+};
+
 &usb3 {
 	status = "okay";
 };

-- 
2.52.0



