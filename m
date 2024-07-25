Return-Path: <linux-arm-msm+bounces-26991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ACB93BA48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 03:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8FDEB21D21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 01:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FF0107B3;
	Thu, 25 Jul 2024 01:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="ofPT3C3v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD79134DE;
	Thu, 25 Jul 2024 01:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721871797; cv=none; b=GYWR1FsZEy8MyoHdLkQ3QID971YzUbbfOXJOj05iaFuKVtiPKYXmZMkXzjZXwPjb/c8trtZ5AtNQN4wWz9XxX/L7k82KtaWWolRl+mHtaAraepkWYDgpUnfKRGfj3A/Hh9ReI/NolkPVOmDu41UxsjwXYDxFnylvG6nUb4lCP3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721871797; c=relaxed/simple;
	bh=bEGmwY/xZM3nCt/Jy5DNiksam9wLkSESc6wXn+mfCGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQbOZxnPZGgfFB6iu5zuETR4TtnclB7nJUcAYrkEUaYz3EV0HR8jvEs9ptKPSkpdK6aBJC/BBJy6TxT/dpx/jQkpUeKrDzimv6xR3BJYlxz1QEppXvR8yFOGfla/BW5NJO6nJTrpSByM3LyXb7uVj4CeeMo+8k1mwYHLyEubaXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=ofPT3C3v; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WTtv748V6zDqWn;
	Thu, 25 Jul 2024 01:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721871795; bh=bEGmwY/xZM3nCt/Jy5DNiksam9wLkSESc6wXn+mfCGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ofPT3C3vxS7/INxdH0Yms9m1uh3kBjCYesZxnVAHHnaYtaOSAOCDW+cHxXynvKR0v
	 TXeQb3t4fbGxseVJ28n/7pm1jm4zsxvLDkuKKzmKRLYlDJ1dHfzmnJXEG/K4+GchBG
	 0fzOckN9mQff4urxvj3lROiVTZvtxvTkVCiAcUqY=
X-Riseup-User-ID: F06DA95B4E2B8D86775BCAD658E853CC6687FC431305B004ED9FA67CA5D052F1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WTtv462tDzJrRJ;
	Thu, 25 Jul 2024 01:43:12 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Thu, 25 Jul 2024 08:42:11 +0700
Subject: [PATCH v2 02/11] arm64: dts: qcom: sm6115-pro1x: Add PCA9534 IO
 Expander
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-qx1050-feature-expansion-v2-2-5fac4bbd946f@riseup.net>
References: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
In-Reply-To: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

F(x)tec Pro1X comes with PCA9534 IO Expander, it is used for enabling
touch screen VDD/VDDIO and keyboard's caps lock LED.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 3eecdc76bcac..993e7cfffae2 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -70,6 +70,23 @@ &dispcc {
 	status = "disabled";
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+	/* Clock frequency was not specified downstream, let's park it to 100 KHz */
+	clock-frequency = <100000>;
+
+	pca9534: gpio@21 {
+		compatible = "nxp,pca9534";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
 &pm6125_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio5";
@@ -89,6 +106,10 @@ &pon_resin {
 	status = "okay";
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm6125-regulators";

-- 
2.45.2


