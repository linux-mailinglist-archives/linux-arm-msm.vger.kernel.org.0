Return-Path: <linux-arm-msm+bounces-77956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F08FBEFC08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 09:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 26F4C4ED87C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 07:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28A62E1F02;
	Mon, 20 Oct 2025 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="JD7Q1NRv";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="eyOd3mB5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3531E2D780C;
	Mon, 20 Oct 2025 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.134.29.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760946952; cv=none; b=KMSYGFG3YdhKzAglJyyNs2Eiss+MBnGnloGEH9Gv4twKbVOSyoJXK4KMIc2k4cx7qyrOv7fPCi7xPjWzvkpmxt6hA2Xdb0KmHmzigWGLAVQI51/D/rofxfzrevbhSuG8AqvDeFnRb0N8D4vhvOcTLx7qhdWrPdDz7gEQZpwYLKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760946952; c=relaxed/simple;
	bh=HoLScURiP3Pv6o4YbIiJloOE/qlQmDATtnSmzjOgiO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UDSDVR5GobHpmMDSlmmQy41qYyF1c+MDpSVlfaJEajAdHyuvk230dzWst319FemiRKVzM7i5GdpVTkDkg61v5u6emLuSitmGwjvbeuFJgIUzmECusH34oP5hzlSOZwSSWhB0nw4Aj+TADxSbE2/g1e6OIjvIzTT9JsfMn1lzZcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org; spf=pass smtp.mailfrom=sigxcpu.org; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=JD7Q1NRv; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=eyOd3mB5; arc=none smtp.client-ip=24.134.29.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1760946938; bh=HoLScURiP3Pv6o4YbIiJloOE/qlQmDATtnSmzjOgiO0=;
	h=From:Date:Subject:To:Cc:From;
	b=JD7Q1NRvW3vFmjply4D6KKNGm+B4qS3jQN4+E1g7O8fF1on6bhO6s5SUc4mSTA71o
	 FORai1167OInQNI9kV6l6AWGhrqSG968JOk+T6WvchPs97ejlCNy4N8Lu437Zxa9Jx
	 vzNcgt4m3MZ2M4j1eSJJeK73nq8R+FWGM7sZQRSVWYanvZ1nj84AevL+HUQ+lckcYN
	 zaPjOznvJtIehzjCMeqd09f1EYvT6Y9UouQtk3UuHLCM0aIE9juZK4rKzlVqPQGUr4
	 KWNiml4ARJnxzKCvm2SnVJ8s19ruARZhVpwucbAmlQm062K/MGwfRCYJYMOQj+tRAP
	 5Ig8dJBd/alhw==
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id CECA3FB03;
	Mon, 20 Oct 2025 09:55:38 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gbHSv5zJ0Xt5; Mon, 20 Oct 2025 09:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1760946936; bh=HoLScURiP3Pv6o4YbIiJloOE/qlQmDATtnSmzjOgiO0=;
	h=From:Date:Subject:To:Cc:From;
	b=eyOd3mB5kR3pv/tKI+etKBa/Eph3aV0CGExpzJ8axSPLGyJ8FUNXQXwDYXzPyujwA
	 4tbpxBxPW258RlzE5KZVVL+iyshAuE6uBei3pGF1wDMA5bz2pbpc7JHsbASBSAzL/p
	 nA443Kfm1Jh/uf0TF27xWnktZJ+F9KSGixnhJlwaFNDnlM//cDwc7/hHGR4qBd67tl
	 M0/Jo6xA8SgwizcH5oTGd0BEk2U4J3BImmvcvX69TTne0PB4tnnmCorwI9Y6lrR/Zs
	 wQH4X25R8NTHUinpqKH7MO8uTTDofIpiV3ZgG9IiBllyR6ZQbnXuyNcKdv+yKRXYv3
	 qCuNX7nxgqyIA==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Date: Mon, 20 Oct 2025 09:55:13 +0200
Subject: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: Move address and
 size cells upwards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251020-shift6mq-dt-v1-1-8714087118b8@sigxcpu.org>
X-B4-Tracking: v=1; b=H4sIAODq9WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0NL3eKMzLQSs9xC3ZQS3VSTJMtU85Rkc0MzSyWgjoKi1LTMCrBp0bG
 1tQAoCiiYXQAAAA==
X-Change-ID: 20251019-shift6mq-dt-e4b9e7dc7169
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=HoLScURiP3Pv6o4YbIiJloOE/qlQmDATtnSmzjOgiO0=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQm85ZXJ4N1ZWbTJLcyt2cmFQWDd2WHdmb3dJRTZ1CjVtaVVoQUF5Qk5lcXMxcUVm
 TnVKQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYVBYcThRQUt
 DUkFsdjRaU1N2ekI0L0xCRC8wWmZucVNUN0swQUFuTitXdEtEY011djIwUFUzZzdycld3OHZnUw
 pXWmhUWWxsVFVLYUxSamRNdTRnOEdYdU9OZVJyaGxOSFdKOGhKY29Fd1cycVpLd1VSVkJvaXQwR
 kZJWFVxQ2JJCmNBeUhvZ0FDYlhrT0pvYzFiYUhlaXFHSkV5YWlIaG13cmdVcHRtL0tHWEZsSWVW
 QndKb25ZeWxPK1VBNis2SkIKelIwS1ptNTJsWnh4R1Yvbm5SOUR1ak9TbjRVWkdlb0I5Rk9PSHR
 vdlRhQUY2SGhDc3pjUWZNbXV0c2t4UmE5VQppZkNCc2pBNkFnU3JnYnJMRFgwblhCVUdXNDIvdE
 x5czVGeDBHdGIrM3VlbnlkUkczNlMxcnh4dUZZb3ZGR3kwCkNzQ0kxNU8rUTJ0NHphWElkNjROL
 zh0c2dzMnMzWkI2Q3FjK2F4WVNmaE4wVGNNZ0xHcm4xNm9FdFdJbDNGVVIKQ2lsSkRpVTNSaDJo
 MzVXNVdtNmVmMjlycms1YjZKTFFqR3hyNlppekpZdW4vZEFCajdUbGI0WmxjSVcrU1AzTQpQYnN
 qTlB1bnBKUmYxaDY0UFZleC9OdEV0UzhHT2dNRkVhNGRkM200NWJiRm42L2JhVDNXMHgvRjBlan
 lYSDBpCms2V1ZRUEJFT2JFei9ZY29pOGMrWmwwSENva1pUMHBmMExJN041WW1lYTBYZXpPNTJJM
 UFmUmZoVmhXazdidVYKQ1hVcUo1dTRrQUtTc2R4VGtYM3NjRFhJZnkwaGNyZGZEaVhyRUYvdWht
 S3dIdFpWMVM5VTU5KzBpU09aRHlqVQoxcHlNRFQwOEJKQTA4ck5ya1YwNkNhNUVoR0VieHQ4T0d
 hZ01HZlhMTUpheTRlbjZHdk1iWVB1a3hNM3JrMW9qCkE4TWk1QT09Cj11aTk0Ci0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=agx@sigxcpu.org; a=openpgp;
 fpr=0DB3932762F78E592F6522AFBB5A2C77584122D3

They're used in the parent to describe the panel's reg property.

Fixes the

linux/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: panel@0 (visionox,rm69299-shift): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'

warning.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 89260fce6513..44e7b5015d26 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -472,6 +472,9 @@ &mdss_dsi0 {
 	status = "okay";
 	vdda-supply = <&vdda_mipi_dsi0_1p2>;
 
+	#address-cells = <1>;
+	#size-cells = <0>;
+
 	panel@0 {
 		compatible = "visionox,rm69299-shift";
 		status = "okay";
@@ -479,9 +482,6 @@ panel@0 {
 		vdda-supply = <&vreg_l14a_1p88>;
 		vdd3p3-supply = <&vreg_l28a_3p0>;
 
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-names = "default", "sleep";

---
base-commit: f406055cb18c6e299c4a783fc1effeb16be41803
change-id: 20251019-shift6mq-dt-e4b9e7dc7169

Best regards,
-- 
Guido Günther <agx@sigxcpu.org>


