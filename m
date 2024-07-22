Return-Path: <linux-arm-msm+bounces-26710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7359389D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FE5D1C21053
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A87061FE7;
	Mon, 22 Jul 2024 07:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="YFEenxm1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA63B5C603;
	Mon, 22 Jul 2024 07:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721632303; cv=none; b=uAk/pZ1wRsPGBJ3E7SVnfWwHYJw4+a/d28PDwoTn1hdICpF33Z1/Omr6CLUq8CR+fe7VMLx+PYH4vsHBrKEPPOJdv15BoSDmSrpdBNG5IlpbPHU8j46aMuCRTi+R8lpGtKIxQNqts7ccCErm/5T/TvbMCI0GpOMbMgkIvwFlzSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721632303; c=relaxed/simple;
	bh=Qp1HPrxtCdVBwj+fKMzHWw50d5Ybm0uUddMCdm6lVq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rPojWqtY9ApkLyGzZT/C4SiRg7JbF0KyTRIXpn6L2hZ/ryBOUdFQAL+KnNs8crssu5oz7tPdEuGiq/ldNX+pvagmQaL+FU0v44BGRnbDQNWswtXD552F1zdc5zk5crKggdce/o5Dn8MaFuyZ5ugDrDJjQX+Xxi29c4sPwkWZgIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=YFEenxm1; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WSBKT2Bbbz9v89;
	Mon, 22 Jul 2024 07:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721632301; bh=Qp1HPrxtCdVBwj+fKMzHWw50d5Ybm0uUddMCdm6lVq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YFEenxm17Qziom9S4BzvhPAUMOfyXqzeZrMI3tNwcJPgNiQsV3if9cXKXrAv4o1wx
	 +ldkvsnaIsfsocY2tZLUp8AJ6HYhkNyYFj5Gq3Ed/DQdeg5DOIPWIyqTFKiXcWwiVS
	 5QjaOaMDpYZDfIyPIWFnhVAN5nLwGoPGgJjDg8SE=
X-Riseup-User-ID: 92DF24B5FB6C06253BDC6747F3C07A91FE2B59A39A253CA2BF8D1637276449BC
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WSBKQ3WlVzJmqy;
	Mon, 22 Jul 2024 07:11:38 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Mon, 22 Jul 2024 14:10:22 +0700
Subject: [PATCH 12/12] arm64: dts: qcom: sm6115-pro1x: Enable ATH10K WLAN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-qx1050-feature-expansion-v1-12-c4d486435b96@riseup.net>
References: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
In-Reply-To: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

Enable onboard Wi-Fi on the F(x)tec Pro1X.

For reference, HW/SW identifies as:
qmi chip_id 0x120 chip_family 0x4007 board_id 0xff soc_id 0x40670000
qmi fw_version 0x324103d6 fw_build_timestamp 2021-12-02 08:20
fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.4-00982-QCAHLSWMTPLZ-1

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 14d4f533f741..c148ebd1c8b4 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -531,6 +531,17 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pmi632_ss_in>;
 };
 
+&wifi {
+	status = "okay";
+
+	vdd-0.8-cx-mx-supply = <&pm6125_l8a>;
+	vdd-1.8-xo-supply = <&pm6125_l16a>;
+	vdd-1.3-rfa-supply = <&pm6125_l17a>;
+	vdd-3.3-ch0-supply = <&pm6125_l23a>;
+
+	qcom,ath10k-calibration-variant = "Fxtec_QX1050";
+};
+
 &xo_board {
 	clock-frequency = <19200000>;
 };

-- 
2.45.2


