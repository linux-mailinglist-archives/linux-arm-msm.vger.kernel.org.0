Return-Path: <linux-arm-msm+bounces-26700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D7A9389B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 526A9B21832
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB30927702;
	Mon, 22 Jul 2024 07:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="ZjPVdF1H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E61224FD;
	Mon, 22 Jul 2024 07:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721632271; cv=none; b=QMC8av9XGcc40vyl5JFGCcvlNAnqk1cpFYGR4rLPW9SbThe5R7B8H4WQphC58eqw20dbVgMQHMMNJfdt3man7Mm6N6SBB2uuE7y0NpGRGiXLpXd9iU98+1njc62EzDTp40BGpSRobSQ30DSXgpoGuyGje3r02D1s90FdfcQwnBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721632271; c=relaxed/simple;
	bh=M3L7RYMJWWu8n7oj3hIljj0OriZSrZa/7iNAsjZjw+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RgmP4bulymw+6nj6DTqsGS7g9DzBq2oUlQzMLPUyeDAhoqDcsDO5y/kqx2KZuPnOIvlzspUc56AqdHNFxP6HhotQDVIRn7ojlw0Ink5xQ5WUYc2OhwjKsOTv7GWUWRRlcOwprGQy3d9/wa1vfoFc15XFE2feioZz4TORFQecwk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=ZjPVdF1H; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WSBJs4PV6z9v89;
	Mon, 22 Jul 2024 07:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721632269; bh=M3L7RYMJWWu8n7oj3hIljj0OriZSrZa/7iNAsjZjw+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZjPVdF1HgmSK/hMWWf9/LRJ/Gueftj+M/fN4+SEvj8QSqLvnXFiG5BIMAp3qovgkN
	 zec6cywyW8EE7OYYfAGL+b9698pXSyMoXn2jHf02VS4rQU3f/unDCveA/gmVqWwt47
	 03E6V8wCNZXl42Nd8Nj8yEYdswm1bCL0ZJlDWVHM=
X-Riseup-User-ID: 1C66832B198A5148F9B03B2455FE833E1DD501321EA08AC55304A099201DA9AC
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WSBJp5TXWzJrYb;
	Mon, 22 Jul 2024 07:11:06 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Mon, 22 Jul 2024 14:10:12 +0700
Subject: [PATCH 02/12] arm64: dts: qcom: sm6115-pro1x: Add PCA9534 IO
 Expander
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-qx1050-feature-expansion-v1-2-c4d486435b96@riseup.net>
References: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
In-Reply-To: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

F(x)tec Pro1X comes with PCA9534 IO Expander, it is used for enabling
touch screen VDD/VDDIO and keyboard's caps lock LED.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 5b7dd54be6b6..43b4bee72dd8 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -69,6 +69,23 @@ &dispcc {
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
@@ -88,6 +105,10 @@ &pon_resin {
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


