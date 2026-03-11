Return-Path: <linux-arm-msm+bounces-96888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKi1IOMPsWlwqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:46:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 431CC25CFBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19F69306DFE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39832DC791;
	Wed, 11 Mar 2026 06:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9oQja+M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922E622F388;
	Wed, 11 Mar 2026 06:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211586; cv=none; b=huDIItJsOhCrZLmHXOsDUKlNIHehLaR+mFOdY6dIApgg6VjH5Nbmo0++32y0Pt9EpQmFzeuTnN+dLSFId3FtjE/8Cl0rEa3VzsK7DjoQ7iwR44DuhoAto5+09niY0BkTbIx8p9MTDQ2wNeemGdeSt5NcFVvpOGO7qw+bGBimUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211586; c=relaxed/simple;
	bh=vBOnw8yghv/EIcA9QT+ZjQ8pghLr8s2Qh5T/B7PIH0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQ+Y9jY4J73ioQmDaEX52q32eu55XNvf5o/DeK8kz6v/5bJUCEMgMGoPKZcbQyjBj1VxmITvhwQbSKdE84RfUi/JtfkrXvE6I2nBsnbs+hIjsDMN8laRq6HmoynwCLlzzgdXfF1mz2XmrN1QcrjnI+RQgJNoedDG71V1kDoQwIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9oQja+M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62342C2BCB5;
	Wed, 11 Mar 2026 06:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773211586;
	bh=vBOnw8yghv/EIcA9QT+ZjQ8pghLr8s2Qh5T/B7PIH0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g9oQja+M1FCsYw68hE6gLhq0yjdesu5Br6mRQNqN4Lhh8oAz9+O4x0b0mKntSOvKv
	 mcGoXTBteVXqiep6XolQKhV6sBQrdG9RCJpfuZ4IqK7wFJzvT/gkH03KLEfJnVZrpW
	 C2NRrTx1xXbCsYb1VKSm37Ox9Zj4ajjP4f0Hptn+xbRfva2wadTilai2NWx65updt7
	 uSS/SXh+cukTcEx452EUVvsRf+L6JH0+8ME44LepmV6M8FuN+EibzfOm/9q9sBSguz
	 7D5nDiaQhRHmhY+dH5bk4yyo/jHoJ3R0OhfD8r94NR6I0leR34SPwkiaA+1+9zENT4
	 78nWsXAkCI5bA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B19FD0631;
	Wed, 11 Mar 2026 06:46:26 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 11 Mar 2026 01:46:07 -0500
Subject: [PATCH 4/5] arm64: dts: qcom: Add AYN Odin 2 Portal
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ayn-qcs8550-v1-4-fe8b2faad1ea@gmail.com>
References: <20260311-ayn-qcs8550-v1-0-fe8b2faad1ea@gmail.com>
In-Reply-To: <20260311-ayn-qcs8550-v1-0-fe8b2faad1ea@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773211585; l=3515;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=nBwiNbTbHdRFCkQ1uUTv1vg+vqE8l7fIu7huEjcbK44=;
 b=ffa521UAW5P/qLENkuByPsGhdba5O0cLphotUR6kldq3/4kGGXYnlOgjIVLB7azvFOMw0tsN+
 Lk5pWYBFI1vBSFMnizjRlcXTiYnQxkOXSuwDZKaxtERzinGa3nJU7O0
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Queue-Id: 431CC25CFBD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96888-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sobir.in];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sobir.in:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.38:email]
X-Rspamd-Action: no action

From: Teguh Sobirin <teguh@sobir.in>

The AYN Odin 2 Portal is a high-performance Android-based handheld gaming
console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
7-inch OLED touchscreen.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Co-authored-by: Aaron Kling <webgeek1234@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dtso  | 79 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d1bed853eefc25092d39fd1d840d4bc3a97911c5..4e4f870ad68e02c620a8c490665285a07a632ecf 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -151,6 +151,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-common.dtb
 qcs8550-ayntec-odin2mini-dtbs := qcs8550-ayntec-common.dtb qcs8550-ayntec-odin2mini.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2mini.dtb
+qcs8550-ayntec-odin2portal-dtbs := qcs8550-ayntec-common.dtb qcs8550-ayntec-odin2portal.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2portal.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dtso b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..4f15612430d9af2eb065d98fb3e4536f434d08d7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Teguh Sobirin.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "AYN Odin 2 Portal";
+	compatible = "ayntec,odin2portal", "qcom,qcs8550", "qcom,sm8550";
+
+	vdd_bl_5v0: vdd-bl-5v0-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_bl_5v0";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&tlmm 52 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_disp_2v8: vdd-disp-2v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_disp_2v8";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@38 {
+		compatible = "focaltech,ft5426";
+		reg = <0x38>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&vreg_l14b_3p2>;
+		iovcc-supply = <&vreg_l12b_1p8>;
+
+		pinctrl-0 = <&ts_p_rst_default &ts_p_int_default>;
+		pinctrl-1 = <&ts_p_rst_sleep &ts_p_int_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <1920>;
+		touchscreen-swapped-x-y;
+		touchscreen-inverted-y;
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8550/ayntec/odin2portal/adsp.mbn",
+			"qcom/sm8550/ayntec/odin2portal/adsp_dtb.mbn";
+	status = "okay";
+};
+
+&spk_amp_l {
+	firmware-name = "qcom/sm8550/ayntec/odin2portal/aw883xx_acf.bin";
+};
+
+&spk_amp_r {
+	firmware-name = "qcom/sm8550/ayntec/odin2portal/aw883xx_acf.bin";
+};
+

-- 
2.53.0



