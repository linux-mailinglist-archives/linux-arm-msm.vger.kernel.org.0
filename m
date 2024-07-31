Return-Path: <linux-arm-msm+bounces-27482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33941942677
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3182A1C211ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7DD16D4FD;
	Wed, 31 Jul 2024 06:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="EGSz/p/P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBE616D4F0;
	Wed, 31 Jul 2024 06:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722406778; cv=none; b=mvc4QUmVyRsiDD7ATg8Qbbir3j7q7CnzrUc+M35keM8On5J/WdWjeNjldbYmWkQV1P2Y4hQgA1G2YPb2TCPG90St4SEs+IKC3pTqS1fUJtDDLhB7IsGS0KH+RdUdT+tOdMNbMMR/vkaG1FXX88peiurYFoHORJI6IHTgAJfTfwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722406778; c=relaxed/simple;
	bh=g/YbokrOUCi3VM6aKD3FpAQrmmvdCbVrYSg5eeD24EM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y4eeAC9kzi2gpTwaokbi3ngCIhn5PHiF6zL+BrYmgEPsuYbgUN9V712O1rgH2pjm5CPSaD4OJHBpy8asTiDUK58Z0GlHVaGUWANG/U2f9MJb8krY/47lajfV9ILPdcCD8vOn83Vfbv+cqZqAwx+199QaNjgziiK9+VqPid7Wdl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=EGSz/p/P; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WYhlD1t9fz9thY;
	Wed, 31 Jul 2024 06:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722406776; bh=g/YbokrOUCi3VM6aKD3FpAQrmmvdCbVrYSg5eeD24EM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EGSz/p/PytKkLO7A9c1LuDjv9ARAGtnwFrlH5cXMX363wK6B5pnWUWzC80Ai+Yriq
	 VyqRSmJufenjMx6LG5W2ndm21Pnk0tKr9vUNJ6PikYGcKuwIh79EwHKdgUxcCn3Rtc
	 VHp4+etQcyZbEnIyRk5vhXAyjvGhxABLcV3qqBZ8=
X-Riseup-User-ID: B55F22F61BD3BBD69A8E232AAADFE083F58D2C6889FBBDF4791EC3D1EF363E2C
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WYhl93g4VzJmtl;
	Wed, 31 Jul 2024 06:19:33 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Wed, 31 Jul 2024 13:18:46 +0700
Subject: [PATCH v3 05/11] arm64: dts: qcom: sm6115-pro1x: Enable SD card
 slot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-qx1050-feature-expansion-v3-5-b945527fa5d2@riseup.net>
References: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
In-Reply-To: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

Fxtec Pro1X has two card slots and allow either 2xSIM cards or
1xSIM, 1xSD Card configuration.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index b45ae3402741..67946d099976 100644
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
2.46.0


