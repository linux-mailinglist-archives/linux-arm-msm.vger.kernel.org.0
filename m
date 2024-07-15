Return-Path: <linux-arm-msm+bounces-26160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E03931419
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10EB81F220BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582F618A958;
	Mon, 15 Jul 2024 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="DvchD5Pi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ACB1850AF;
	Mon, 15 Jul 2024 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721046141; cv=none; b=X5bB3OJNwWQNMfPdvZnfLBDt/kviPLg6EsDM7YZ0D2XparKQ9Yvzw/gMxzqQURDevqF+j1+g1gQCaXrS1EbZhUkP2YLEOITjhNqNfUGuvl73rtiSVbxnNtzmidM4P35Rn1vNt9OTPGgRsfUaxOv/Lg3lO+fe1mRGQPFLR0Khg9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721046141; c=relaxed/simple;
	bh=rhj6YU+4sh2fmtzVDWQcXgy8QAUuN6NeLcd416vREKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qi56PtBDpDA7eGjE+pINQXgH5/ohnQAsWvMYwknlU6+PP/K1twBUprSithJKRlh4LQba/3JDONx1v47sVNCUhMb8wUguA5z49FSDJU+MKKRsiHjZOpYEjD96kcM5XsKGt2W/UTlYwSkcCrmGU7CcRQMZ4fkrowg9U8ZfShYzpQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=DvchD5Pi; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id BBC7038A399E;
	Mon, 15 Jul 2024 12:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1721046133; bh=y1+SQ3apUbmcQoHUoMHVMaKDypGWPo698XSl7yEvF8g=;
	h=From:To:Cc:Subject:Date:From;
	b=DvchD5PiHrE0Qk+MU8ryF0zg2YejEeb/LQjCc9RCFh+VFoF19NPbTmF0T3175T9Sr
	 m14+XOTgvb3JNTR0d1kPmJt10uH+DKvxNjhAqlpsYoKzwYROHAvJYAY6ESnv5Kxl6L
	 GJzhcakm+E90dvOBUbLCVwZk7hC0tgxbOOYRZk3msuFV+hufSZ+gZohl83X93fVMmd
	 XUij27MqnVLZRXuntWNDvt3/V9gSGiL5e2eWUa7AQMFGB4dXLlHLehiSGCN4RqwSTu
	 EQjtrGGNlKX4t5/JnxGft0pG1hEii8lIFV4H4pa/s4aKWyjzYPP/KZS8akkcsih2a8
	 3OauShvmLQXkzygOWvGXJE3+7j6xBDJFE0JTvvAq2TBYnxyQHtwqY2QyednBSh7NI4
	 kf+DhTA1l2KKyEVQ4HuRv4jp18TncWDHuO/POqmsHGLVNqoM8H8rkTUOWX0jM2BLDn
	 JSy5jPf8gofuqa/9YtBnaKAuEo52PgZMPZxRpN4iQE/Sdm+gqKgPjGChNfbjeiSBQx
	 JIP8VdMcIhKBdBX/nG7YWenpc1w/I3QzOigYpyIzE+eW59P/8vMcg9+TMEquIrQ0xC
	 gsqhpzoWCYmDeDDXIfmEJ3AMePi7eZ/HxAunsOQZ7/xQpYfDCNzocIFDfDx9ldwwLH
	 kraLcXPL5ZstaG5z/TdRODK8=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id y8VJbKC15Tc8; Mon, 15 Jul 2024 12:22:07 +0000 (UTC)
Received: from xtexx.eu.org (unknown [120.230.214.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Mon, 15 Jul 2024 12:22:07 +0000 (UTC)
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
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] ARM: dts: qcom: msm8974pro-samsung-klte: Add pstore node
Date: Mon, 15 Jul 2024 20:22:01 +0800
Message-ID: <20240715122201.345426-2-xtex@envs.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1617; i=xtexchooser@duck.com; h=from:subject; bh=g0144RZDvUfKue3w7fs4s3tdYQywVwxNoaGNF6PBxak=; b=owGbwMvMwCW2U4Ij7wZL9ETG02pJDGlTRTL9+ISVhHwk9TMW2kx//TIidt5h4ZfWH89eqMkJq b9a8OJyRykLgxgXg6yYIkuRYYM3q046v+iyclmYOaxMIEMYuDgFYCLhlxn+inmsWPVJLOa5x/QZ C0/vsvvYvHUGj7fWgtk/AuqnBV2Y7czIcLVj/awXX2538x7L3+HS+Et1Tv5iMWY5vc7mRoYD9Ze FGAA=
X-Developer-Key: i=xtexchooser@duck.com; a=openpgp; fpr=7231804B052C670F15A6771DB918086ED8045B91
Content-Transfer-Encoding: 8bit

From: Bingwu Zhang <xtexchooser@duck.com>

Add pstore node to allow for retrieving crash logs.

Signed-off-by: Bingwu Zhang <xtexchooser@duck.com>

---
Changes in v2:
  Add a label to reserved-memory and extend it to avoid duplicating nodes.

---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi            |  2 +-
 .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi   | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 15568579459a..19c12686831b 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -149,7 +149,7 @@ rpmcc: clock-controller {
 		};
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi
index b5443fd5b425..d3959741d2ea 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi
@@ -438,6 +438,19 @@ fuelgauge_pin: fuelgauge-int-state {
 	};
 };
 
+&reserved_memory {
+	ramoops@3e8e0000 {
+		compatible = "ramoops";
+		reg = <0x3e8e0000 0x200000>;
+
+		console-size = <0x100000>;
+		record-size = <0x10000>;
+		ftrace-size = <0x10000>;
+		pmsg-size = <0x80000>;
+		ecc-size = <8>;
+	};
+};
+
 &remoteproc_adsp {
 	status = "okay";
 	cx-supply = <&pma8084_s2>;

base-commit: 6fd4da15c334831a865d4700ceb3ff5a917163e3
-- 
2.45.2


