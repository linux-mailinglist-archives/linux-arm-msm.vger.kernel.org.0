Return-Path: <linux-arm-msm+bounces-20466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B54CF8CF0E3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5DBE1C20ED8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 18:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C687C1304B9;
	Sat, 25 May 2024 17:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dA5YG2ld"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F951304A7;
	Sat, 25 May 2024 17:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659962; cv=none; b=VTi38brOf68ButwteMRc1YdP1gVdSFFSeorTsDRLXRLZiqf/WN/9ZOf8A7IrsRx3MxOpLOcmSNJ2TtSbOy/n0AvzLgqZg9y1iyP7kqfpFktC6kCNNXxEIOJfaOG/ehn39asGc7bCH6HqbUpoRXS/1ISdE1o5fMF3UcNxA7IWln0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659962; c=relaxed/simple;
	bh=x/A3qlHKSNksLYkJyamEvoUm6j0d2K1gDvbHogrpo0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqy4GZOokWJR/GscXnZC8xCds2xxDDGN9+veAM97b6kh4cq5y8zNLST6QeKX4HAvPtz+elhD3BoAyHx6X7qdjNIEX6FLuvPEKQLL3WV9GKloCUBP6lVCuw5++dLvUrC8rUeHmRR0P4Lvy62yhWSO9Ta0q3gJV9wbQmuy95MSsoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dA5YG2ld; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52574C4AF11;
	Sat, 25 May 2024 17:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716659962;
	bh=x/A3qlHKSNksLYkJyamEvoUm6j0d2K1gDvbHogrpo0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dA5YG2ldKuY07n1rg7kv83bweOx1o7532gHn4E3h6ldpV3PWfYE+K8D759V/hWkEm
	 d5e9XCx8iUJkHOImcjZlNwzWhJusY58NtiPHf2F8l8QAvK+nV51o1ebigd7M+9tK+8
	 5+21YARO5/JG53BJpigfvP4h/Q9QsPLn44dazPdqT6pgXabQK8GhZ/BWaQwQAXzXq5
	 TTS2bet5Kej6E0i5e8rqOMTNtQ4GvCow8uqkok2BxGR367w3U0XSO9w8/lgnI8LZUB
	 /KksqpX3OE1oFRLjT9gBbt3nqMLw94sS0NZSrGq5Ekf3hHdFHuL0CKWwG7hJT1vuPp
	 vUwTjFrvhYZ2w==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 11:04:03 -0700
Subject: [PATCH 10/10] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Enable USB
 multiport controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-usb-mp-v1-10-60a904392438@quicinc.com>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
In-Reply-To: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=ApeqdvS88ACvmrMfc7ygIjzXVr8WNirPX8Y+Q+iz2qg=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUigNf7OPmC9AZV+nbwo2ZWqTekEW/mFXM//YE
 76bMWBweBSJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIoDRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXvxRAAiLS+lEqoMRKXifzpZgBqbQKahAwyZOa/z+B0HjV
 ATMhQP6UbO02H3tHJ6x+6nhC1uq2w6bTtoaOHCJvbdfJq+Bko3nsyk2M/TbDFeVPeFD0UXNaPpE
 NO6LtiLjcPXgXVEEaFqUfzrHv76P2dYXrvBZumeiNcK0oLjNaNQn9nqe+w9c5P6RCB928L3iA5A
 73IaKXehwKa2kVBsPz4u3bfKcPB5HLecCIMMITIAjAdgcAp/+qGFHP4lh0hBYjxrggcGerQ2/SK
 IixzUjoP3AB/G2IlRXd8h5jS2tghqvsZ9PaHIbaqh4bMHgWuXxKRhlSpstZuSXR+L8o085tQw1D
 r3/X3gwY1J6Xbmb0rjR8aL5qAAQhQcDVCr7msLiIxSKrrqGR+73J5iPmzFtji1vSMedeJGfFIcU
 N1tZc9KjpClkZz50177Qcwjx/2Vt8TgbicEQuZSvQ1sKmw1QuYomO/gYrMjGnMxRplVRehvA0va
 3eCt3e4JW7JfJSP+HXamS6i0dMX9Sgmj25gqE01lGE12axNnCUwr4PArGUxzmpzCFbLEUk04va1
 B6wXVmxUYKYN1oRA0bllHyaKki/ud+DoHQp9moS94dh2dUc3BX+keKtSuSDpGWAEvIu5ir+4sDr
 LhLiBCDzpogQcB0KF/l4JA0NbNlSK56hzPOvbZiG38HQ=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The Lenovo Flex 5G has a camera attached to the multiport USB
controller, enable the controller and the four phys to enable this.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 6af99116c715..daa3065bcfe5 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -557,6 +557,38 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp0_hsphy {
+	status = "okay";
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l16e_3p0>;
+};
+
+&usb_mp0_qmpphy {
+	vdda-phy-supply = <&vreg_l3c_1p2>;
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+
+	status = "okay";
+};
+
+&usb_mp1_hsphy {
+	status = "okay";
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l16e_3p0>;
+};
+
+&usb_mp1_qmpphy {
+	vdda-phy-supply = <&vreg_l3c_1p2>;
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+
+	status = "okay";
+};
+
 &usb_prim_hsphy {
 	vdda-pll-supply = <&vreg_l5e_0p88>;
 	vdda18-supply = <&vreg_l12a_1p8>;

-- 
2.43.0


