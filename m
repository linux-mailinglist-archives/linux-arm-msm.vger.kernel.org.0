Return-Path: <linux-arm-msm+bounces-53206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FE4A7B972
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 11:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 613823B65B5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 09:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B208A1A4E9E;
	Fri,  4 Apr 2025 09:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="I/HNyg2/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB55E19E97B
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757284; cv=none; b=Ma8KnJ12DhaXzC9dHHidezEN/3lZs3AGoGrC2eyGSoxZoLTPPAq6Iuxj+Or8m2brR+Epasx/9uMOTIzSbx1zUPNLImcsZ5AId0RGbtE1Lh9sGDYWIGgCfYiR3l/U+XiKgOxZ8GZc9s4ebvfGuF/45QKOVKSGSzj250XOhRpWbHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757284; c=relaxed/simple;
	bh=Py3IjWzUP5+zKoHFRdbmgLnOmgLdEHUcnt3FElvF8UU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Grk9l+Qwg1YC6Lp/CK5hK4MCei7r7qYRVoJIOY5E8eFxFXh+FWqSp2MKS3tk1Cg96MRLoIiEK+Z8Z3hFGFU4Mksrf5HHwB4KKxVvx6uSU3QOm0IUDT204JsZiwbKblfodYIjq05g2LaQX0znwjISZ0M2p72+VD0JmO5pt21b1iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=I/HNyg2/; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 70D3F40142
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1743757274;
	bh=taLKnjcRWFAOhCgBuTXiZh92hjHs2t1+eilwt6zToeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=I/HNyg2/a/sn8rY/Q/PyIWabxsjxvGJgwU4asPrp8sONwCJP7Tlv7kl537w53W6iG
	 RksY/qPMXhytcPnUd4b/hQo2ZfuzRgfJowTzEx0BQSSc5hQewuuVnSxBFCxGONzUjB
	 yEf5wVIyUN2npGoZnNyf5PvAUJs9qSMYDVD/Z8taV7qQRzZQCRpCYsXxtxOj933ua3
	 WiuEC/Hj6UOskdJyB1cz8MDp0oog4ZxPMPgg0GeFCiBqjN9BZUasJ/fpD8881sOum/
	 2IJpSxm0pOX8n1wFjoI6MT5CZ8TXGcgALkB4h1X9q1IEkc3qhhsLdUwcRqRfPPUJ9l
	 BV9UTlf2mnfnw==
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cec217977so11660525e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 02:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757273; x=1744362073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=taLKnjcRWFAOhCgBuTXiZh92hjHs2t1+eilwt6zToeA=;
        b=iiFeum/80Oko6FXUgDQo3h/g3hRkPgWfJAfBcb0IwYpW4/J0MqmAJr0aXglHLbpbBD
         0M1EyHc3eaPP2Rsk3xeGDqbFMzQbXv7jCKIciP0EB/J1l2BcUhF8oz/Bh2R5YzH6N49+
         Eg4eDbWjQ34yuB4xx3YmrG1n3oisxirbcfQBT72fBysHYpar21HWVJJJqoJil+PftCia
         J9a3VrpFXYH/8PfZQ7ZtBkFtbfd2XIb45T70LXyv6Tfk4PIoBWDhofI/jok/zwl8QTcx
         Vnc1NdyQD8YhP1dLZQxCv5w/hanTEEOBt1XgaKFw2j8eikQe8ksp5cHegHAIVHgCE6ew
         eItQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4NeZmi8N67Ak2DW3Q9nLlzjIn1wUNql38Jx0v31A5DjXNOmDHGvi0CPoJsVLiXCJGHbF/SCIpx5IOdi7p@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb1nYWxot4lJ8xLyANUM2vOxN/2SrfOi95JdXnsSPxm4yYuoMc
	H6egHKotVVMLr2QcKrkltmCUIuRMJZ4Yrbh/SC+4nTCuTNnw4cW2amcGqtnsOWUL1lKnWNHleFS
	J30iofe+aV2eW8Od7gzoe5/iGwmK14qrIwU4cg8m6/BgcvF7QANPenlVxLv9JxrttoWZHeJJr05
	FGxlg=
X-Gm-Gg: ASbGncug60uQbqg+8g25DF11HsSkja4VzdksF9U/oharZHKjf7hWOciHVPwXMMB2sif
	bUAxmfFFDHrBSN11zmq4V5Jusu9OIAm8MqziWZgk45mcOeDX9eV8QBSwrbwopkjqnNQgx78MNxa
	EtmEmWSAn07xanEjYRVzO4OoZdDliB1ttt4QctqkxHDj9FxMz9gW1jmyqY7KEn0FNTxkaOPSrt3
	v3y4B5/6tmkofgbmHdjAgeo6qykXDeMZKPRAQYnC0uBLcXvPMQOVpuSnkwlnW60/YBbUX6W2X5k
	hkdqlL+vSP6DGHyLkkK7My66XpV/PfoSU0n3PwPOPiu59orrDwzmmLjxsqHo
X-Received: by 2002:a05:600c:a0a:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43ecf8d0a37mr14950585e9.19.1743757273206;
        Fri, 04 Apr 2025 02:01:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWbk4uEoYAB/4LlThUDVA2+k1ALwsbhVFnRClxycINFocI4ojY5djxH3yqzrqFUpYfXJPnWw==
X-Received: by 2002:a05:600c:a0a:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43ecf8d0a37mr14950405e9.19.1743757272794;
        Fri, 04 Apr 2025 02:01:12 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3174cf0sm41974215e9.0.2025.04.04.02.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 02:01:12 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook Ultra G1q
Date: Fri,  4 Apr 2025 11:01:07 +0200
Message-ID: <20250404090108.3333211-3-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a device tree for the HP EliteBook Ultra G1q 14" AI laptop. It
seems to be using the same baseboard as the HP OmniBook X 14 so just use
that for now.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 36 +++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |  1 +
 3 files changed, 38 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 710879d94c00..3d98bb95e8b1 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -294,6 +294,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s-oled.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-elitebook-ultra-g1q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-omnibook-x14.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
new file mode 100644
index 000000000000..7f069a2e9a46
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/dts-v1/;
+
+#include "x1e80100-hp-omnibook-x14.dtsi"
+
+/ {
+	model = "HP EliteBook Ultra G1q";
+	compatible = "hp,elitebook-ultra-g1q", "qcom,x1e80100";
+
+	sound {
+		model = "X1E80100-HP-ELITEBOOK-ULTRA-G1Q";
+	};
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcdxkmsuc8380.mbn";
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcadsp8380.mbn",
+			"qcom/x1e80100/hp/elitebook-ultra-g1q/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qccdsp8380.mbn",
+			"qcom/x1e80100/hp/elitebook-ultra-g1q/cdsp_dtbs.elf";
+
+	status = "okay";
+};
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a6..e7262ad11509 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1987,6 +1987,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "dell,xps13-9345" },
+	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
-- 
2.43.0


