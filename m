Return-Path: <linux-arm-msm+bounces-72166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FE0B44B19
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 03:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4C0DA07ED0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 01:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DF11DED52;
	Fri,  5 Sep 2025 01:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNrn1mKh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892481D90DD;
	Fri,  5 Sep 2025 01:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757034579; cv=none; b=QjrXpVHecS6ksFdxBW//HRFXq3548AmqukNCrkT+3uiUFpI/dUzvAMeNsNZj+YFTnZ++Rtumg7ZACS0SEq1w5Z3XXQhuXwXmNRpFowtFYzGMzPQvwLFkxoSHro6SkirvIAC59bUs31xpk2rT847I/hGQVMbKerfDg2CnTPvjX6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757034579; c=relaxed/simple;
	bh=8KymmQbiX0xMeNo9k7iaOAyWLVkxoe2n8Vei2/uCabE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gbjQnGZhhorAfKS5PRuSpTIyeuS6fypxNfNZ8ZYWGKea7moeqRIt8BZ1Q5Ehn7CkAAGgwg0y8Arp8AlcMazemyjTBCplFjE6M6c2MWRXod6Xxz4faLed42hRJhSXQDWNZLCGhrG91bgNbL9hyn4foQwl3M79s3kTxYNOi3kP4Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNrn1mKh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C929BC4CEF6;
	Fri,  5 Sep 2025 01:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757034579;
	bh=8KymmQbiX0xMeNo9k7iaOAyWLVkxoe2n8Vei2/uCabE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SNrn1mKhIPievf8XKAES92Rp1xn4On/b27/H0IeKLQxTkPc+XfHH5O1Bbw3L+dA9n
	 9mhz6wPfSAPX4Bjc7VcIV/HwqPL/rb7QsfE/qQVDbMxvJ//naso21Dv2c/8LlMDlCF
	 swlqqskyIm/JATjks62fgFrFdqqLeF+kZxXTuO+DXfawR8XJdgwAI1Unk2lmn4pcIN
	 V3AkoZ69j16zQdxVLvhQcKDSlhxjQ/a22PNasoQEfNN3nIMexuGUegfrQz/XpjD486
	 vxacBSMEybUMeIs3gePJsh9QD+R499AQBG/asdKgnUH/fMLmAuyn4SBeOJBl+zCdKN
	 T43aO2eiy5S3g==
Received: by venus (Postfix, from userid 1000)
	id 1205A180B21; Fri, 05 Sep 2025 03:09:36 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Fri, 05 Sep 2025 03:09:33 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-t14s: add EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-thinkpad-t14s-ec-v2-3-7da5d70aa423@collabora.com>
References: <20250905-thinkpad-t14s-ec-v2-0-7da5d70aa423@collabora.com>
In-Reply-To: <20250905-thinkpad-t14s-ec-v2-0-7da5d70aa423@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=8KymmQbiX0xMeNo9k7iaOAyWLVkxoe2n8Vei2/uCabE=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBoujhPvE9AY5hTWjabvJxj7CzoIutmwtI5VhXP8
 Idz38UxTxiJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaLo4TwAKCRDY7tfzyDv6
 muUDD/0betVnb3gFiWMeGJzcMFu4nzBItk37KoMJBMjfK+xh2r52dxf4hrjTiKKUT4Q3f9AlpX8
 8Ij13BezBd3tVjs0ptBRBhLCj6GHHaKrS9M2CQgSqIggbt36csn8XL9dUFmuqoiJ1JFZfQNJ02L
 ndU/vNk86nq8SLyU7A5wOu88jO0T7Qp7xRquS7FGyh5LowDhq1w9CF731SK+i0q+9R7NqkNqdf0
 xkGGmy4m7jIvi24AH+8qmb8cWYmoISVsvkKPLEOowk0Q8SMO4ZRpQstS+pytUWlVW8th+jEsO1N
 OFUEQ9jGjVvVoKjx3pVfFXCAIE/YL4pdhNIXNB+6tr6wAz6SntuRyuEYiRK6/Gvcn/TZ616v4VV
 9ixsYscpvaOFCZUOyvUqr8akICgZncSBJingXjQyXgU4iQs5MObxH1NGipfSMv5f6N0Ed5ElA29
 RZjXgy66vcsx1jY1VHfPVVNWEk4Brbzk84f/giNHEbXGNQ8UWjtmwCNaDMX3S1N5a4NjR0z2cie
 8T9z5xeyvSMvdqJTds0/1zKJX51XTqwdsG4WOXAtWurqIhzzk4iKtlrU7y7hOC2ksY8GhQ0ZiVC
 ZWnVJvyX4LxmmMs5H7iZjRNFJV89MZGf6SEgPdBYwNOxNmc8cCcTiaMNx4q0EwhvNdEEprrFDo4
 xZqTzyrKLSr+66g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Describe ThinkPad Embedded Controller in the T14s device tree,
which adds LED and special key support.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index ac1dddf27da30e6a9f7e1d1ecbd5192bf2d0671e..f70489aba870289edbcf84ec22fdb004e010868b 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -887,6 +887,24 @@ eusb6_repeater: redriver@4f {
 	};
 };
 
+&i2c6 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@28 {
+		compatible = "lenovo,thinkpad-t14s-ec";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -1267,6 +1285,12 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";

-- 
2.50.1


