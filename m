Return-Path: <linux-arm-msm+bounces-56154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF314AA0F9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F6C43A8659
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60FE219A89;
	Tue, 29 Apr 2025 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="SomCUcEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CA121C162
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938224; cv=none; b=VnW9QBdFMbzyGuYvrJ/dMA2oaaA4OLsShpbioJ4X5L3vnG5oVdYe6QLKyCyNtCNnc/foeCz9vQAeoJLEl2DxmNSqQVLqLoVJs9FARoiwzrLVMmN3u6qC8tRm8qCQ5PJ1AHtphqZfaT66eAE/1m+9Bj9M79g5UQSFs1wm1nX7GUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938224; c=relaxed/simple;
	bh=krTaRF67fPNsLB+dqfMsYJ7ZzFpkv8kbuSh7hjXyKGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F52fRnw3YOIktHZyNLx6li74orYL2BrZdA4+vwMitZLjaR3WN0CAbfEhiw9+BSuM6c2nKHq7veeSuFCOtV/ylO/XIELqgYdCYMQRe4wbc04yjsjpFfq3KyLZUNLkcCj8wIF9j8Ad3NGDg1m7784482wKY3Z/c9oIw/HA26U+9XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=SomCUcEA; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3E6323F2F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745938209;
	bh=7zoJNAv7neP8pZ54k9HnfCrdAuXD65pSkqMbfySDhgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=SomCUcEAY1lbEHmA7JgooxrGZHrCkqUrSuoofQAItHaBSGkWYb2MrUVpig4BcCAN3
	 ItfUMCxQE4stvcmAdxiu40jeHY/trFYxJY5vVSHzHsfgnh7yAD4EhVSvU2tXwa+nx9
	 4JTjmxbDAP5RnyNJq7UatXsxwWpiYk20slK+wPRw0FA38YlFoSoO6+PN8bU9gts8Gm
	 14Xytqn/T7HGyRdvTa5cQgkXuTritxMs6z4qRCc3tu7PHTmIK20VCLBNQQKrlCXHlK
	 FEVzL/n+xVyI2AbnpdUEPEn+leVTlicN7QL0eOrxfdGYIST/KrR10Bj0/2eR1PdCa7
	 RFhOHV2tMo8Cg==
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43947a0919aso42692035e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 07:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938204; x=1746543004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zoJNAv7neP8pZ54k9HnfCrdAuXD65pSkqMbfySDhgE=;
        b=jSloHsL/9i2pTQ8nStee+aXSpJMOJUQVRHJJevNyp9u88p5UKMIf4E/fGP7ghAjKfx
         eC+OvM5YEah2DcGILwTVjR9BfOvHh8vSwZxlt1FHILbk/RsGm3fiCBEy3YLn0ZZBsZWN
         d6oNqY1qu4iJwbccBw5ulJF7XF6r6AKx/spYEAgSJwnefBBrU2ulCl8LXyr2Lbu4tlOo
         +fO/OCBFDEEkHeD/vE1UN0BaEjmzdO14jDoetMwQfLNmrlMnlBiq05QUixD87+ScpAOo
         WU0/fPEyMdEXrlsWJguu1rp2soURgYQ4afV/x3Mc9OcfXGalf8VpJ/sg8vJPO85f1W4w
         kPeA==
X-Forwarded-Encrypted: i=1; AJvYcCW3PpTPFASiU61ykWdp7A3ywDd34SVlDPt2KEGZuNW6e8GpVHbQ5saCtPKzPMbHraEnuwJZ9gxFdemc+nXQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx7n9o43C+jcGZkDFCWRtPknWcaDPSXb4tmbTiCy1+0k7JZVMK
	EhUFr5ZjbSNkf3DMwSCEFD2up3+PgxZ4Uuh0s0oaQPB9XInUSoJ+oTCH+ixjDfnM4XM0DE306lm
	Et0zxJbqERFEf4fA9ylmMALxfKjsNyRtQV0ZVn8N0DwFehW8/Eju33IX4bCS5VPGdXVZC0AmfKd
	eYvi0=
X-Gm-Gg: ASbGncsv1nLiZoD6FlPE63ApUT/ZvGWTzaYL8L5YjuV8EuCkDw+OIQYkQDq2Bs41Qgt
	YYYu1ZTxIMnyJDr80onwgLG2npXFHO61Qcyu+TJ/nNAcEcZamcyU9dNZmxP5WKYYmzlbut0Ob/u
	HB7l3n2Ed+I7HewbeSxZBa+n2UElAoGMVlhQC3eQHQPPzZ6MB4kDK4mdrBHHrQ6nIzahnGzVJB3
	5AlmG4u5G8wcnIc14tZwtbnBTNmQMyZwBlm5fsh18xULDW7PwsFQ39/6TVCwkS2JUgh2Wjyyp1m
	I22FdCtG+mDuJSBMbDo7uCjNGNYClaFTcCBUyIZiOHGlKYzUuuT8UdF7
X-Received: by 2002:a05:600c:c14:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-440ab846a52mr106209545e9.22.1745938204437;
        Tue, 29 Apr 2025 07:50:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFNDbbGCcksRyCuvtj7AZi9NRp+RqmwiuGFNbYjNx1+LdUjm8j11MjOpdX2/aQqHlEkGBb5g==
X-Received: by 2002:a05:600c:c14:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-440ab846a52mr106209275e9.22.1745938204102;
        Tue, 29 Apr 2025 07:50:04 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8842sm190654525e9.31.2025.04.29.07.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:50:03 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v4 3/4] arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook Ultra G1q
Date: Tue, 29 Apr 2025 16:49:56 +0200
Message-ID: <20250429144957.2088284-4-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429144957.2088284-1-juerg.haefliger@canonical.com>
References: <20250416094236.312079-1-juerg.haefliger@canonical.com>
 <20250429144957.2088284-1-juerg.haefliger@canonical.com>
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
 .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 140b0b2abfb5..732cc3f6a220 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -293,6 +293,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-elitebook-ultra-g1q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-omnibook-x14.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
new file mode 100644
index 000000000000..4ea00d823693
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/dts-v1/;
+
+#include "x1e80100-hp-omnibook-x14.dts"
+
+/ {
+	model = "HP EliteBook Ultra G1q";
+	compatible = "hp,elitebook-ultra-g1q", "qcom,x1e80100";
+};
+
+&gpu {
+	zap-shader {
+		firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcdxkmsuc8380.mbn";
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcadsp8380.mbn",
+			"qcom/x1e80100/hp/elitebook-ultra-g1q/adsp_dtbs.elf";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qccdsp8380.mbn",
+			"qcom/x1e80100/hp/elitebook-ultra-g1q/cdsp_dtbs.elf";
+};
+
+&sound {
+	model = "X1E80100-HP-ELITEBOOK-ULTRA-G1Q";
+};
-- 
2.43.0


