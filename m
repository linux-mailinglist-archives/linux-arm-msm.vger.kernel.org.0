Return-Path: <linux-arm-msm+bounces-26708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B8E9389CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCBA81C21075
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A1322EE3;
	Mon, 22 Jul 2024 07:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="niAyUhlT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D577C4C622;
	Mon, 22 Jul 2024 07:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721632297; cv=none; b=TntQEDbQGB9gNEGjwFUU3TPDJaUTr8cai+LLb3FJbbuz5cY1PkSEWdstCUwQGiAx3wZoohP7ozrrub6D55xz9i6m+HFQadN6NwaFr1VqlrHJRPigyLKl5O1zf5oE2Ls/Ekp/ZqrQrq0pbwzG/HFXziKebhrcZ3fWOHPVwg3FDyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721632297; c=relaxed/simple;
	bh=spsgb927J7oiD5gJ8p0esP6KuXgCov0C7rIhStML6Fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GrEimszNlSC4mvcFlZghHcqSVdGJe93j68YKlVbHuZSEfCpIFrSSiehu3LN52dP+KrGJ2EkW0KopKQmNGfkHBLfukBjX9tDpEFlceVLC2c+ePPRoxtBg00j9exlP6n4trFFQ/keDtTAzlkzi4cWa23r9iOQ0+m4aXmeMVzJajks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=niAyUhlT; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WSBKM0Sn7zDqX6;
	Mon, 22 Jul 2024 07:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721632295; bh=spsgb927J7oiD5gJ8p0esP6KuXgCov0C7rIhStML6Fo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=niAyUhlT7AKLwURGiHBlcnoLZ23zk2DA4q/lXr6lqMM2Qv+Ips6wykd0ii7ic3Afq
	 X1/1w6WnvRZpwZTXvs9WWUVl7FloEOlxyaHZBBw/Abd59Ikb3PJoW6jF2YZSBnbZ6/
	 YAuzs7o8dc6zFmMTmFdPfLUuWRs0IjtdMM+oxEAU=
X-Riseup-User-ID: 0A8DA8C0466ACF1B233FBD76D672D900C82812DA02A75C0C9B95E30A46F762E0
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WSBKJ1LjxzJmqy;
	Mon, 22 Jul 2024 07:11:31 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Mon, 22 Jul 2024 14:10:20 +0700
Subject: [PATCH 10/12] arm64: dts: qcom: sm6115-pro1x: Enable RGB LED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-qx1050-feature-expansion-v1-10-c4d486435b96@riseup.net>
References: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
In-Reply-To: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

This device has an RGB LED. It is used for notifications.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 88df28fc8c7e..b434241a95b2 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -183,6 +183,33 @@ vol_up_n: vol-up-n-state {
 	};
 };
 
+&pmi632_lpg {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
 &pmi632_typec {
 	status = "okay";
 

-- 
2.45.2


