Return-Path: <linux-arm-msm+bounces-26993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 848FD93BA4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 03:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6DC31C2312F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 01:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD5879CD;
	Thu, 25 Jul 2024 01:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="V7jXnT8e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646061CF9A;
	Thu, 25 Jul 2024 01:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721871806; cv=none; b=i5ByF7aRsn/NJISa7eXJ54nM8UEI+1XuJWBTfQ4qUjCIeZHsFOHKRlid/VXCpKWsCelCiuU62abcWo6cHnmZnBPyRrublJHT1dQRV2GoJN3X/1sVhAjApMdF19Padw8+J+KLZISth/TrU7KqRYx+s2Z6JwflHICMVReJuVPrqnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721871806; c=relaxed/simple;
	bh=PccZUTUe6JRfO9ocLzaxjzP7vmL8w4z7Skt6kmQdqXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QUE77roTsgIVZHIauezqdFKIr9/fkK8YEuegF2HMs6CFcQHmyck4ovo3bW194aUkiNla/mOK82aMuZcgbivKI5R3efZlBVqQqZkBmkJchoxnHL4DEDrHNDvofK3GMdXlsVJZuohFx4fuh7ZHlTQzAyoRgKV+WRAkfW+gyxurqJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=V7jXnT8e; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WTtvJ3xZ6zDq89;
	Thu, 25 Jul 2024 01:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721871804; bh=PccZUTUe6JRfO9ocLzaxjzP7vmL8w4z7Skt6kmQdqXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V7jXnT8e4+F7L1f7nOMHhxhDAQ6fTpTWWZ3wk+Sdf0YBHzjj33tl/ol5dmfscwRir
	 B5WunAFn9Imne1uBiV+8R1UbjzYHlZTUznY5tcjy18VmTNc3iiSzrl1EwXDjhUK1fL
	 pxzyr+FZIo8YaZetYawUrvrhvezIxX3ptLdIwjM0=
X-Riseup-User-ID: BA3AA2819FE32626E6C46F28E41A02872E12059AE7C2C178AF29F63269CA7707
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WTtvF5HkXzJrWZ;
	Thu, 25 Jul 2024 01:43:21 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Thu, 25 Jul 2024 08:42:14 +0700
Subject: [PATCH v2 05/11] arm64: dts: qcom: sm6115-pro1x: Enable SD card
 slot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-qx1050-feature-expansion-v2-5-5fac4bbd946f@riseup.net>
References: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
In-Reply-To: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

Fxtec Pro1X has two card slots and allow either 2xSIM cards or
1xSIM, 1xSD Card configuration.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 7c3a7bb8df8f..e1e66fe54295 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -191,6 +191,7 @@ pm6125_l4a: l4 {
 		pm6125_l5a: l5 {
 			regulator-min-microvolt = <1648000>;
 			regulator-max-microvolt = <3056000>;
+			regulator-allow-set-load;
 		};
 
 		pm6125_l6a: l6 {
@@ -292,6 +293,37 @@ pm6125_l24a: l24 {
 	};
 };
 
+&sdc2_state_off {
+	cd-pins {
+		pins = "gpio88";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&sdc2_state_on {
+	cd-pins {
+		pins = "gpio88";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_state_on>;
+	pinctrl-1 = <&sdc2_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 88 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&pm6125_l22a>;
+	vqmmc-supply = <&pm6125_l5a>;
+
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32764>;
 };

-- 
2.45.2


