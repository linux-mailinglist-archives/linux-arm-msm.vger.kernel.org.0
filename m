Return-Path: <linux-arm-msm+bounces-62494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EF2AE8836
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 17:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFC1E18850D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 15:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A8626B76F;
	Wed, 25 Jun 2025 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GoHy6fmw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C3226B743
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865332; cv=none; b=gunADmv/noktUX8XpLv0+zwZxxsvHlhJbFghZQ/AHVYVQvmXDg/AAoIcZugM75F4BGyYthHG16oWuSHDiO0m4omM2LJZKFXt205fld7NeCSTbDgjXLSZt51tbQFru0gHoyOm3ErZhQOcqdC7xakhHw+o1UBANd51ZHsmuzz3czs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865332; c=relaxed/simple;
	bh=DGQGEnve4/bgkJQyVwSOGe9EimBGv4nown95OAXf1bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BCvv08kxRWpAqGZ6eSxHHb0SPR206pRfnJic5vpn4RS/3W5N0Hyh6uYLU+8viR/83cOQwcrdULk9N8XunVrioMzu4xbnCjfqHBnEVLX7u18+RMO9PdJrWohLpu6dyrDmO3swwBfTEsA8907lTqo0NvCoh+3loWD/H1b7EWS4Ifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GoHy6fmw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so37791845e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750865329; x=1751470129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PI3qPrTkmKZMuiNpclcJbamBpUy45L3AQm07k2EFtpk=;
        b=GoHy6fmwRcYFfI6v0eKyexJuCfgMF7byV7Jfu/cIlEuuj1MZgVZTHMuPgjRb3WhihF
         KV4L3pXgY/CeSXSntjw5c9PLxz5wmstP/lryCDi/3O7yMPJd69hr1/lAiNJRjc0UtAep
         YAx9WZvfJPXpHUUPVBHwoltOcq1hJrhpsYjVwua0d0zTLwdnVmAp+oAeJgqkbs1Xzgok
         vdgysTMrr45SOZ+sqPOb7pJ52VD20orKNLL+dPtJMvLLLBQET8AcxegQzMIpjo7FLanA
         RVJfR3m01YIkCnsEbMnyFXa6rWE5PCBENlFpD8BSmVZyHMSeTlsQTalKuedMa1uvgv4q
         orXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865329; x=1751470129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PI3qPrTkmKZMuiNpclcJbamBpUy45L3AQm07k2EFtpk=;
        b=ZSwqqqOtMWGLGRsyRs492PTkArclXf4u0679qnmy829JXd782TUvBxylUMrAzk7BoL
         2e9kL0BUDYGhJ4xa8kOVFkKTfWdAyUQyu6Vd3wGf2PY5tPM1I9rAe3F5jVM0hXE8Lfuv
         vvlUgW9fofe3nczhhViv2FJGAnoczDzeYkU2nkMIsS7pNJZxcLszybEeCR5Lr2wriAN8
         kbFymsZ6cVc9Gy6Fl13s9tKJfvsgMlYrkLo5ANt91T13gol6vsM/fmF9GjaI7/rm/COK
         Bv03n9nWCjFK4gZ0R5Dzhfc3GlVRO7gXRc5XtdmDvat/K8HmhtA0gx8NYgTAuiM4Th4c
         KEWg==
X-Gm-Message-State: AOJu0Yw8Rk2LTUdcdsnn3ATOSnSTeyWGkYQtQM7LLbpXt1P0MdtILTXt
	94vLdsgXdt2g62N++ZkK6zCJ4Ls3Y6+LcTX++b+ewU1rVa/uNFZolWe4XaNu0vRXXzw=
X-Gm-Gg: ASbGncs3hwKU7WZwOSJwuNceLIUZ0bfQyehscfUtPJ+ZyvA6WljlnTlCQVQLZIDq0cp
	gCgtAbMT5PdWAJzGteqXCKXLh5lUI//NjNcvPD6Zrmh53uxAqiiUhivat6WSr2bNRVNy99H+Pgp
	0YLSxTrNluyK61nBXhQQy8Ev+Fe1XcknNbQmjifOnEVZ97pm2Q2iIrJZqHVqOypIlE+qFGQzhDU
	MPXt3dNNiPypH4QJWihIdhXM11SHe0Hr+F1xxB0dfctSZ0WdxNT4jGCZoShBWUefBT4YjyyDbNe
	PkM7x4sM5IzYdX47st4FypQdiOMbV9pNSqN1B3EMCQsLPzJl4Y3V5w/9EcllQ28=
X-Google-Smtp-Source: AGHT+IE8ILEBDNbFHwVn4CTLwkc5qRiSUjqDg5Sdx22jaPZhlrkws3KhJcV/ZrUUcqtIut17KcQNeQ==
X-Received: by 2002:a05:600c:8217:b0:442:f482:c429 with SMTP id 5b1f17b1804b1-45381aee7e7mr31642335e9.8.1750865328896;
        Wed, 25 Jun 2025 08:28:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382366f88sm23283235e9.30.2025.06.25.08.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:28:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm6115: add debug UART pins
Date: Wed, 25 Jun 2025 17:28:38 +0200
Message-ID: <20250625152839.193672-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We should not rely on the bootloader to set up the pinmux of the debug
UART port. Let's add pin definitions for uart4 to tlmm and bind them to
the relevant device node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index c8865779173ec..91fc36b59abf9 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -721,6 +721,13 @@ qup_spi5_default: qup-spi5-default-state {
 				bias-pull-up;
 			};
 
+			qup_uart4_default: qup-uart4-default-state {
+				pins = "gpio12", "gpio13";
+				function = "qup4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -1565,6 +1572,8 @@ uart4: serial@4a90000 {
 				reg = <0x0 0x04a90000 0x0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart4_default>;
 				interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
-- 
2.48.1


