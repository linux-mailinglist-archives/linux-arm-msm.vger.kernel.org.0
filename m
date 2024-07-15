Return-Path: <linux-arm-msm+bounces-26132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1CB930FDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 10:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C2FF1C2012A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 08:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDBE1849D3;
	Mon, 15 Jul 2024 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="hnS8YKHT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B671184100;
	Mon, 15 Jul 2024 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721032423; cv=none; b=JL9fBkB43caH507vNYXHFFMNwK0g7HDIRESKDF3GUteK6NG4vVEC8aBL2/ydD0ggq784X7RAvzh5kl3DSkG8aclr/h2RG6NfxDcbhrhMoX8NDvzV0GMFt+bxS9+5RqqDNYIezYVBWmmoZ0vSp+ZEWIOfzrjPcFKA1l1hkkPqze0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721032423; c=relaxed/simple;
	bh=GOFHld7N2DnMubu4a676OGIxZoC5c9W/WFt4GLcbc6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IVvWHkA263IBzXYt7bH/f5tug1JHxHAuw1kTCetz2g/3nVKmBw8F8ZHJeIuOWJtMNDKW3SfIf3wjHTsNnNErioWfOcL4voutieuxFYZ7/56447ya7w63RybpSVMCOD7Xj8nGccjWrXq/JvVtaJWkMJllDAR0hHRH/Nl6o6+9Lic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=hnS8YKHT; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 497D638A399E;
	Mon, 15 Jul 2024 08:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1721032414; bh=I2caou9mvPwzmKsHqGYo0NPtkkydAHfAzkWxXhdErY0=;
	h=From:To:Cc:Subject:Date:From;
	b=hnS8YKHTdaYeZ5jMZmM41XHTenW66/lRFCzh0TU18lhdSm+rkoSqGhEBCuXLdFoBq
	 xUqgyn9xuTC3hDiVkbnZrcl105teQRrtVf6KUlgKJ5G8qlTBq7/+Q9/iYctpD2z4gQ
	 CFaEyJGElpI5Q0rY1vWLmBQHJk0ZUKm9QtCAh6vZ8eSjTQLRtzbTYVGpuJx4XlvQ2T
	 G43RVt/lgkopExjovyb9cxQSeXBhYrieeXs4NLbH776iJJc4NBo1GuTfPdB1wz6qFC
	 US8F7etxQozB6EojjRJ7siPifUH3rvMl+WHe99xxXZgXB2GOfjiH56ttiLC3MI4MU4
	 +0JpqB/fNd4S52UuFdLJfF14t/zSe4AkvjKNqvPnDWUxg8Lg9RhFug1y6v3guKvzn9
	 0TL1B1H3i7DJU+OcsHoSVk7pidSDawpR/maBDASC3f/nXwoePvtBqrcmr4ltklJ6Gz
	 F5cR334V+/fJLi0rZ198p8rAypZpM2Ky7Fy+2j4c9arwwYTLFReWvDn4VWyV7Ce9tr
	 JPMWLSFan/TkzANu9NSmQUt1G/z1mvoLFQFs9ER6xlGg7OwzlDtnxDpptdP7omu9rW
	 +bmGu5ynJchDXln4UuR1ce6YaVyuo6noaEScEPikY0O1Abm75qqi2GZJWwTZaseKXp
	 WZxL9epY4LCP+OT305roHY3I=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Ach_p67wPtD6; Mon, 15 Jul 2024 08:33:28 +0000 (UTC)
Received: from xtexx.eu.org (unknown [120.230.214.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Mon, 15 Jul 2024 08:33:28 +0000 (UTC)
From: Bingwu Zhang <xtex@envs.net>
To: Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Bingwu Zhang <xtexchooser@duck.com>,
	Rong Zhang <i@rong.moe>,
	Daniele Debernardi <drebrez@gmail.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	~xtex/staging@lists.sr.ht
Subject: [PATCH] ARM: dts: qcom: msm8974pro-samsung-klte: Add pstore node
Date: Mon, 15 Jul 2024 16:32:40 +0800
Message-ID: <20240715083245.80169-2-xtex@envs.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=xtexchooser@duck.com; h=from:subject; bh=pZ8z0gqdS1fPPC5alHLTORsjbM2aO189atg8HOE/k+c=; b=owGbwMvMwCW2U4Ij7wZL9ETG02pJDGlT7q2t+SVnKJhjzTtP5arNflEvT7WVvfNnK+76efXMc +cLbrM+d5SyMIhxMciKKbIUGTZ4s+qk84suK5eFmcPKBDKEgYtTACbir8/wm6WNoa1vbcL3e6J7 Z5VZzjW8FPmaoenTNa9El8U+RkoCcxn+WVg8c561+fImlsBfF5WvuX1OML6gOt2m+pHcF8N6E/H vvAA=
X-Developer-Key: i=xtexchooser@duck.com; a=openpgp; fpr=7231804B052C670F15A6771DB918086ED8045B91
Content-Transfer-Encoding: 8bit

From: Bingwu Zhang <xtexchooser@duck.com>

Add pstore node to allow for retrieving crash logs.

Tested-by: Bingwu Zhang <xtexchooser@duck.com> # on SM-G9008W (samsung-kltechn)
Signed-off-by: Bingwu Zhang <xtexchooser@duck.com>
---
 .../qcom-msm8974pro-samsung-klte-common.dtsi    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi
index b5443fd5b425..ff98b9362b0d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi
@@ -126,6 +126,23 @@ led@3 {
 		};
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		ramoops@3e8e0000 {
+			compatible = "ramoops";
+			reg = <0x3e8e0000 0x200000>;
+
+			console-size = <0x100000>;
+			record-size = <0x10000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x80000>;
+			ecc-size = <8>;
+		};
+	};
+
 	vreg_wlan: wlan-regulator {
 		compatible = "regulator-fixed";
 

base-commit: 6fd4da15c334831a865d4700ceb3ff5a917163e3
-- 
2.45.2


