Return-Path: <linux-arm-msm+bounces-89408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6626AD31FF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8833A3026283
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F91F2C326A;
	Fri, 16 Jan 2026 13:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Zp0nU2+W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD21284B3E
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570749; cv=none; b=dqS22dV3hYQm/pU0vZtw0oTGHZxpNBxUcVsvYoFjhBgUYxxFfiJyu3ZmZAlT5aN+/C+o0s9c/bwPmb9p3jfgC1bgVXVbpg1oLHw8Vs4Si/NTfNuDjL4YgD36qWZIeY7ESm7cYNBBUuUUhJ5KsdIybqmIuuZ1q4pmVVltQI9MLI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570749; c=relaxed/simple;
	bh=WtTP4Q+pd0r2GTIiE/rKycdBfVnflluT14Fgkgdo+hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NNbws5JtEmiOFMBy4C3w+3qVtKvveEyDCx3mKa9WWIrRsarUsT5ZSUgtXUn+hnDX+ikY4pz9jkn5ssXvkNkgLck3uHZ5n43lDp81zZiz/Ndd10rUrypxMfbrViJOUlwwVYANm3iwVIKLXIEg0Q5FvsQlpBoitHBQV5v/lkOOA98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Zp0nU2+W; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-652fdd043f9so3962877a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 05:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768570743; x=1769175543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4iZQThVl/1y89JJfcylszV4UE/kUt8KV2BoTPAif84=;
        b=Zp0nU2+WHNWeWn0jPZqyl4s7FFj2S1DvQld4vE++8ePJpSTwqTDTa+EhqSuXYN6bQq
         o4q/PobBxrdLuFRrR/Rk4/3z2+0X2zxAF8s+QGTsjldE3ahKbFPtJvj753RwA/003eFb
         IuwWUJZOTr+sLnNT/0s8+wcdzOwsDqFpb3D1ZCza2tcI3KcIlnMEDKTIlyqHjRq7kJxD
         6LhWr0Ro9a51NZILVMISk21Js/1eO5zEXJqGkAXBzFfnBYNEEA1upitzYbjB4Fm17MJM
         6TuHuNcuI4h4xQI755DzZMhDadGgSubFNHZzdg7MOjL9EnRwGpp4CgW4uTgWpP1SdWP2
         SQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768570743; x=1769175543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H4iZQThVl/1y89JJfcylszV4UE/kUt8KV2BoTPAif84=;
        b=kw96qm5mmCz1kJH56opyNlu7NQHL0HFI4BzMw51BM4Z8MtH6lugU5ILxeGMtKRyhEQ
         vmkxtMkmirddMyM5NfQcOgipfi8JcZivhiQ7QiyXxf2ZSzfqc0FpM8hzih68zbtgNtZJ
         cQspoS0ag6Kt0Xvs98LKXUMMULXQ0SSEjBIKi0rUqb1DuxgHiW1SbQ6QsDJdOlUL9E+I
         8tMM7gOl8GG8f+iHKEskIMXs8rS5UAo13PfaCW/cIQ0mSgIoK8Q6GSR312w3SkADVE1H
         1XEQZCXPWQSOPkSTI+/sYGSxz1jJlprXQPfCUv+n4yGgV/l3Sbh1q9XXZTQF/9W9NAGz
         rdcA==
X-Forwarded-Encrypted: i=1; AJvYcCV993hrG8ciG4U4AgFSBxumNF3MO34i4At3Ni66/74cAW9FvhJSe71kOTX+m/PlOvO7nad8x3YFzPRV3Tb0@vger.kernel.org
X-Gm-Message-State: AOJu0YzXNSTy0FoC7KbU6bxa0LrenW9qXuNrYYSuA2XVBO5v+KZyF10t
	/zzjNAr/rXFCl3Sdl7gYxZJ6WoIm/nxpWfiFee8UmZyMr1RoWcAMmmA9Abf/M73pOE0=
X-Gm-Gg: AY/fxX7KNhsnVvs5s+BXH0ZiN7JMh0ey72ilu4DsX2r9DXSTnR4/u8dnjAkLCjTGYVg
	wz+ZrEGYM1oB8En7pU+kJFiJdH1RWSLXrU9xfrtb6U+wk95alsmPAloqoMXOJX0XS3Sf9/UGE8u
	uvRDUZJNIcBA1DaKRJ0woAXL5iZjsCeFpNx0P+Wi6GZJ7+Ne4Q3uuUNJANQdW4m7CLw19FcoIln
	t8NEKX5ie0LqcSCyXE92QRqUiaIkg7Gxhrz1y42lAPRNteqKVYuxL9Fob5k86qQKMsLLwISojIl
	KiNrsj2S6khra0C748DGD//8f5cbJoyovZSmf4YjaB4kbZ829CnyCfB3tZaRl3ud8n5Nxd4URzj
	XxKkOfApxzUv8CToHjEbdsCrfjlHd9x2oDRDx2/dEK2DjupBKwTY570FycI6+iHSTTVwlk+nXXA
	XPW9lx/McK8p1Dvd+ROebgja+zrhNrRMA28qHrt69V8ajsHROwZeFni6ckRfP1NqKp
X-Received: by 2002:a05:6402:430c:b0:649:5bb4:59e5 with SMTP id 4fb4d7f45d1cf-65452ce39famr2213004a12.30.1768570743300;
        Fri, 16 Jan 2026 05:39:03 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8b7fsm2495528a12.27.2026.01.16.05.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:39:02 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:38:58 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Add camera
 EEPROMs on CCI busses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-cci-v1-4-28e01128da9c@fairphone.com>
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
In-Reply-To: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768570739; l=1663;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WtTP4Q+pd0r2GTIiE/rKycdBfVnflluT14Fgkgdo+hg=;
 b=Tlm9u6xt3xaLwM3g0YMIG/P0gmiBgjT0e3aiXa0JdE+oJH4t25lUsvfkeLG18t+EgT3l2SNcH
 PcEmJt/N5cADoY7oz/lCZC+XYi3k6OjJi+w/AD6dm/jT8cEHEfhCvRR
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the CCI I2C busses and add nodes for the EEPROMs found on the
camera that are connected there.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 7629ceddde2a..c4a706e945ba 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -529,6 +529,56 @@ vreg_l11f: ldo11 {
 	};
 };
 
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	/* Main cam: Sony IMX896 @ 0x1a */
+
+	eeprom@50 {
+		compatible = "puya,p24c128f", "atmel,24c128";
+		reg = <0x50>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+
+	/* Dongwoon DW9784 VCM/OIS @ 0x72 */
+};
+
+
+&cci0_i2c1 {
+	/* Awinic AW86017 VCM @ 0x0c */
+	/* UW cam: OmniVision OV13B10 @ 0x36 */
+
+	eeprom@52 {
+		compatible = "puya,p24c128f", "atmel,24c128";
+		reg = <0x52>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+};
+
+&cci1 {
+	/* cci1_i2c0 is not used for CCI */
+	pinctrl-0 = <&cci1_1_default>;
+	pinctrl-1 = <&cci1_1_sleep>;
+
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	/* Awinic AW86016 VCM @ 0x0c */
+	/* Front cam: Samsung S5KKD1 @ 0x3d */
+
+	eeprom@51 {
+		compatible = "puya,p24c128f", "atmel,24c128";
+		reg = <0x51>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+};
+
 &gcc {
 	protected-clocks = <GCC_PCIE_1_AUX_CLK>, <GCC_PCIE_1_AUX_CLK_SRC>,
 			   <GCC_PCIE_1_CFG_AHB_CLK>, <GCC_PCIE_1_MSTR_AXI_CLK>,

-- 
2.52.0


