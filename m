Return-Path: <linux-arm-msm+bounces-26703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 464309389BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8571CB220C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D791B969;
	Mon, 22 Jul 2024 07:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="EDQ7jNsb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E483C3BBE2;
	Mon, 22 Jul 2024 07:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721632281; cv=none; b=qcM3wo+yPRVJgDuAaEstdjLV1jYuZfwA0HISlcRJjMjEv/FQJS974TxJNK9X8AsLRdOW42G5MOXyLvEmaoCG6pluVAAGweYMkpE9p6n3XpCoZmXVOuJzQ4VqczGWFjxcMtHOfRTSk6hEnq5Mr0XTRdJb0kT6BB2Ls4P7GTze62E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721632281; c=relaxed/simple;
	bh=HJblI5oQuwtVrKZEQ7b2SgOy0zXWPkXW2shqhb1zCr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kIZInMw+h6W32Y4hztxynn67nhNUrJtpScUv5xnLMjAtgdnSLXO7zUXskAUuUA+VZdRilh6ChJ+95/a/ToLKW18Yo4Ih2UZ3/D4GsytgjzqYArnbhMSVHwNIBSfsvbp/bD8k+JWU5pGbfuvWtKQqbv82aYri3ZP+SIz91oDnbTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=EDQ7jNsb; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WSBK30b6yzDqT9;
	Mon, 22 Jul 2024 07:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721632279; bh=HJblI5oQuwtVrKZEQ7b2SgOy0zXWPkXW2shqhb1zCr8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EDQ7jNsbkx5OFNUmkROQmqGlmTXsyPgalmeFanqJIbqGnXlUoC61p4SLDu2jcdw95
	 3sbEpUBcKo/VSstyJlRJo0lKcl18DzE+HoGfdg+nFnXFN+nxKVCrEk3jDpMGrJoEWJ
	 vBFZ/QQ7KPcD8755iEhVtxYhWYsz/ouTdDQ11Qy4=
X-Riseup-User-ID: 22681378F6F097C354D6F7437EB999C57E3D138DEE5D7800A8283525E4F243EA
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WSBK01NYVzJmqy;
	Mon, 22 Jul 2024 07:11:15 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Mon, 22 Jul 2024 14:10:15 +0700
Subject: [PATCH 05/12] arm64: dts: qcom: sm6115-pro1x: Enable SD card slot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-qx1050-feature-expansion-v1-5-c4d486435b96@riseup.net>
References: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
In-Reply-To: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
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
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 60c046fe8e52..42567545f56d 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -187,6 +187,7 @@ pm6125_l4a: l4 {
 		pm6125_l5a: l5 {
 			regulator-min-microvolt = <1648000>;
 			regulator-max-microvolt = <3056000>;
+			regulator-allow-set-load;
 		};
 
 		pm6125_l6a: l6 {
@@ -288,6 +289,36 @@ pm6125_l24a: l24 {
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
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_state_on>;
+	pinctrl-1 = <&sdc2_state_off>;
+
+	cd-gpios = <&tlmm 88 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&pm6125_l22a>;
+	vqmmc-supply = <&pm6125_l5a>;
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32764>;
 };

-- 
2.45.2


