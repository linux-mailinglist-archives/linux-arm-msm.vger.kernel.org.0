Return-Path: <linux-arm-msm+bounces-75335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F33BA4C0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 19:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B9877B32D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 17:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA60F30CB50;
	Fri, 26 Sep 2025 17:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0miWAJG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D165630C60A
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 17:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758906818; cv=none; b=GU6wlDL7cxXsAXahind5FovmfgJU+sDmVZopU/ZAOX5zWOzn1Mj2dRBwIKgT2H3k779dQqnn0ALLKbpv89KfwLEwoc9ns48dKUKozKHM5xIL/FN4m2Y/FzMy416nQPAQEXTzf/HJBvYSHCoGrj/zCQIRamYkjlsDOYq6HW1g/0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758906818; c=relaxed/simple;
	bh=91ey4D4RscHiUop7uDzAjLKjyDW5NbuR+aCcWKWDgO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W+2fy+R9cri7qDMT0wBCS1DzhuXOJpNcBSy9L2lPndhRnmLpdJmb2IIFfIOIWcj7ffpf2EggmqW0AYzlhgTEEZ4uyykkSRrNPRSBKV4MAhDPmgj0eJanRxJtOqABegt/l19uDMIjKlbkPvOUcXxTMuXaGGPiuZhTFN8latO1TQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0miWAJG; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso5011086a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 10:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758906815; x=1759511615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRWrg4uLTX0GBtHqvOnBTTd6fOpgFs97cg5Sl1bCRLc=;
        b=S0miWAJGQ546MOn6P0ofsHkw5D0i56eKwwdFeN+A0CMWxftdJTlThL1XeeOU0K7dm/
         JenUNqNij8KCfCxFHLxmSPrf4t9AFtfjcbgKtaiWoegk0H0To+Ge/tfL8h9ON8LekvfJ
         fP22yHWtIoXxjHAS2SX7Vlo4EqjxRf8dru/LH+VCNLKaYFsT5YyTsXAEMxJhb53NytYd
         E1Hu1yCy06dOyf+Pm2inkbX0kOSJqtqD+P0wCfeTJaqWkmrbs/Dx+S0xQMuAykrKeoP5
         t9fSWmtgbkTvInTcFVuUrYRvkjgdZon35HGDg5Z08g6hczu94+gEGWflW13WobmfvX4b
         YRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758906815; x=1759511615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRWrg4uLTX0GBtHqvOnBTTd6fOpgFs97cg5Sl1bCRLc=;
        b=wO/7cRqo6RnDWiSLdnKsbVdXGGgeI5PyE5pewyPd/pPEZ+Gz3ghbPqj4r53KNBWusB
         rOGDqVbWNZdqjH08rKlU57T020F4RoIIR3gom5cWHA8mCoeGaPqE7JUFF33ROZ+UtTaZ
         k0iU/4dhtruqLoXfioqJgFtsCvxfT9xnqMjFGBy1tvxoH9ftTkcc3kvOjkDy06ihA9nE
         Mcraf5NJsQjG+4+cl7fDkPctlaIVxPm3qELwcoXdRgdzjSqWzL98LzqmWkYlkrkLjLCH
         oOjWFHhJYbCCJrq43XeU3RdTg7sFQtT0xMJVsH0X4ubHB+oB5KfOcHzqmVvI8tM/0qXW
         arQg==
X-Forwarded-Encrypted: i=1; AJvYcCVeaFEdHo8f6FvVEo+RSk6IDDsqphk4m45fQargJaW2zbv76cAq0q2bvtEUXm3C1jVtfqPgmVexHDWhnaPN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfln70lJKSx+wkXaZRbW45SKZrJ7bM6Kgt7ljFQUiK3elAUvgl
	S7H/xDqex1q47jCZvJ3JEYtEhE/m/ilsI97jOTmQvWtofutAeEa9HUKB
X-Gm-Gg: ASbGnctamMNoWKQ9u78oviZ3oVood+yF6aBtUXDgv1Z/ywiRO/0Mlmds9U5VDoEoYuL
	qcrecS4ZGqIopHy92SYNAZ4LgoasRjRlKr3LEwQJTmSigYsU9fLnqhKT0GkjTzMzTat1671CoDy
	MNr4kaJ4MrDMlbBsVidhnpAD3HZIyptN17bWYqzHds2Br6XAh2sm6FUR7v2e7xLUMZx+uaxrggJ
	cL8gDzpsVp7dGY3SuNl8NjJ36sWHYkDxsQqdBknFNxRaPxoSpsCjQX+cMi/2dkmCj2cZfimZh2l
	fIbTJAqATS6hG5UJzfK+qzbwYS/qFsl/PFcUU77i/3SmCz7vGS54xeDXDXS4vLleHwyJG9uSYGi
	StJ7q8nU1iLtuJAl4a1fs
X-Google-Smtp-Source: AGHT+IF2fQ5BiZMnQgigSk9bQwDFvXDilYuLTRYlFcSL85YTbz8PJY3/svIikRxIAKdIw43rzklQbg==
X-Received: by 2002:a17:907:7296:b0:ae3:b2b7:7f2f with SMTP id a640c23a62f3a-b34bad2854emr1008213766b.40.1758906814999;
        Fri, 26 Sep 2025 10:13:34 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b353fa65be9sm397211166b.48.2025.09.26.10.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 10:13:34 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 26 Sep 2025 20:13:27 +0300
Subject: [PATCH v5 2/3] arch: arm64: dts: qcom: sdm845-starqltechn: fix
 max77705 interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-starqltechn-correct_max77705_nodes-v5-2-c6ab35165534@gmail.com>
References: <20250926-starqltechn-correct_max77705_nodes-v5-0-c6ab35165534@gmail.com>
In-Reply-To: <20250926-starqltechn-correct_max77705_nodes-v5-0-c6ab35165534@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758906810; l=2258;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=91ey4D4RscHiUop7uDzAjLKjyDW5NbuR+aCcWKWDgO4=;
 b=2U/nuqSlPTKe8L1FhhwHJLSB8akD3pymeUuvoK/el6+mN0UWF2b5cjlMxT654CudZIg0YRAMQ
 cY/qtM60JRWABqJk/gokkOi+ZoXlrBZeHkBKtppWOdskxb5LDPZDnP7
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Since max77705 has a register, which indicates interrupt source, it acts
as an interrupt controller.

Direct MAX77705's subdevices to use the IC's internal interrupt
controller, instead of listening to every interrupt fired by the
chip towards the host device.

Fixes: 7a88a931d095 ("arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes for v5:
- group interrupt properties together, including #interrupt-cells

Changes for v2:
- fix commit message to be more clear

Changes for v2:
- fix commit msg header prefix to 'arm64: dts: qcom: sdm845-starqltechn:'
- remove binding header for interrupt numbers
- make interrupt-cells 1, because irq trigger type is not used
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 45c7aa0f602d..215e1491f3e9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -599,11 +599,13 @@ &uart9 {
 &i2c14 {
 	status = "okay";
 
-	pmic@66 {
+	max77705: pmic@66 {
 		compatible = "maxim,max77705";
 		reg = <0x66>;
+		#interrupt-cells = <1>;
 		interrupt-parent = <&pm8998_gpios>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
 		pinctrl-0 = <&pmic_int_default>;
 		pinctrl-names = "default";
 
@@ -644,8 +646,8 @@ max77705_charger: charger@69 {
 		reg = <0x69>;
 		compatible = "maxim,max77705-charger";
 		monitored-battery = <&battery>;
-		interrupt-parent = <&pm8998_gpios>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&max77705>;
+		interrupts = <0>;
 	};
 
 	fuel-gauge@36 {
@@ -653,8 +655,8 @@ fuel-gauge@36 {
 		compatible = "maxim,max77705-battery";
 		power-supplies = <&max77705_charger>;
 		maxim,rsns-microohm = <5000>;
-		interrupt-parent = <&pm8998_gpios>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&max77705>;
+		interrupts = <2>;
 	};
 };
 

-- 
2.39.5


