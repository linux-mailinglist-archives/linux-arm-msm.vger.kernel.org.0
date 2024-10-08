Return-Path: <linux-arm-msm+bounces-33599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5495995507
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 18:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E94F2848B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FAA1E25E3;
	Tue,  8 Oct 2024 16:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipdSVXh9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81071E2314;
	Tue,  8 Oct 2024 16:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728406339; cv=none; b=HSvr4TKSRHydMSILc526qbe2cmepjF8rUC/eV1Q3lZ9Lqz5JXQcs6fR4G6+5XZpRFVJJnWraKd8swjiLDl0XSZQYBjdUc0PqTDFNiGxJL6A36PbMgYH1MdIxu7AuvInho/NjhcQNz17/OANCuCHW9cWA8M51NqNz8oMIvVFI5ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728406339; c=relaxed/simple;
	bh=8kPyplfx7x37JVDroPmWayLQ3fm9wa9IxcjlIN4yQpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G0gqbwupo1Eu5INVyrfsUhMF/Ivfr9IiJH0dNtkoLVuUr616k864W9yzjohZvBdn2LQaGcXhCUBNr/9zVEGOgEo+gWLUgmVB8TXxQ/SNa0eP2Pf4ooOQEQgQf1DKF0ssCRhcF71TPVsyPKVYQjsBXCck1qwDfI6+SPBrCVcn4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipdSVXh9; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso61206581fa.0;
        Tue, 08 Oct 2024 09:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728406336; x=1729011136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUIhXPOAyDpWUNw2bJL6q86xbPtd/630RooihSDfsyo=;
        b=ipdSVXh9rcjpV+jzhVtN3Q9qXsnpX1mP42uxcGeLhFks6pT72RBQPWRLqYeXhu7uzr
         hitInNkHreHrSUWsFdbNItDDQYPb5rgsZKL/pYNqyNzNQ3EfBtin3VMqnIXQ6hT+gIBB
         GC5rU3bZZd961AdpHn01njhN/TaLVCBZJj0csqrgwqcHR9UWz+wkynDDG17DgkKdWdWn
         PiSr1hLw3MAJpOL/ZHTkopy+9lHTelMaaF0gS8eHxCjT57JEQrK8TQx9yTR8Sql6W+iw
         0PsWhTUCT/FSfZ4ybTHx4gIeUf/UrODGVFbw+KbInUYwB+obk2sRLjyeZrErpNKP+r4g
         03RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728406336; x=1729011136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUIhXPOAyDpWUNw2bJL6q86xbPtd/630RooihSDfsyo=;
        b=DGDMxVZoC81FFN6lGmSEIIBPQQcwadYSnoYTO86bs42iPcSNx11CYy/+UCddTWr+tJ
         IRpNKYOTEOVLvo0gAkKhjz4eeYAojO5fFXwolCeL3/++9b/8Ykr7+LSGTx5j8xUnmjdN
         ekHa1mw+teLaw85VcSTt4o7qFp7qnK0W6bxobU2VQ7lFtfVl7yc7F2RdG2iMMaZ/v5ed
         XT7Jj7noNIu7epWqJj/017XPFPLT40n5FZRSmVSCaU96YvmUT0aSEu4bqkE8IhhSqTjy
         dw3TBcza9auxM637IcvZ0qQF4yJUN3gfKBxD3DKT06j9IHwdMRFc2b9UpbWL/lb8x4vp
         aiWg==
X-Forwarded-Encrypted: i=1; AJvYcCUfjcUjmwbuufNLOSkHvI6OVzxfjT7IdDis7/Jfbbotx+SAIg5Cw+lFUHG3kG5HxxT2Csi8Dh8npe+c@vger.kernel.org, AJvYcCX9zzuiEz2Yh1vXQUQNFr7MUmH5xpbodMBaB1PriqO6Eek4vY7Msaz/obd+HgRyd+EEffPuujtdVgJYgkoc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5YyV2QLkn7v48YRAT2zqUgJGM+MzHM1Y2j7xxFUe6hZhxOu1D
	5f0tRDvf8lqJP/fefmeiplU6MGzdbl0wL5zVmuatw6m6Pga+VKiQ
X-Google-Smtp-Source: AGHT+IHw6Tx7J9X5Df2I+Qfmt9z7SaUopOjY7Xw5DF9CPgcN2OBevhxYBq2X+MlB+4Wre0CuA+K3wg==
X-Received: by 2002:a05:6512:3c9b:b0:52c:c032:538d with SMTP id 2adb3069b0e04-539ab88a08dmr7485689e87.27.1728406335935;
        Tue, 08 Oct 2024 09:52:15 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-539aff23e5fsm1260736e87.235.2024.10.08.09.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 09:52:14 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 08 Oct 2024 19:51:46 +0300
Subject: [PATCH v6 09/12] arm64: dts: qcom: sdm845-starqltechn: add
 touchscreen support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-starqltechn_integration_upstream-v6-9-5445365d3052@gmail.com>
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
In-Reply-To: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728406308; l=1393;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=8kPyplfx7x37JVDroPmWayLQ3fm9wa9IxcjlIN4yQpo=;
 b=/G7A95QN5hxeN8V6M6LlVq3SnR3dKVOvs4m1PGRd86hto7chKW27hEzznRPGQFiaER51Y6qRR
 hObRT5Vid2hDsK3ZezeuWHHDUxz+wSACjBSC8Q4t6VnOkFVgMPJXWbr
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for samsung,s6sy761 touchscreen.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v6:
- refactor: s/starqltechn/sdm845-starqltechn in subject
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 5635f3b088cf..2a367625d591 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -561,6 +561,23 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&i2c11 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@48 {
+		compatible = "samsung,s6sy761";
+		reg = <0x48>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <120 IRQ_TYPE_LEVEL_HIGH>;
+		vdd-supply = <&s2dos05_ldo2>;
+		avdd-supply = <&s2dos05_ldo3>;
+
+		pinctrl-0 = <&touch_irq_state>;
+		pinctrl-names = "default";
+	};
+};
+
 &usb_1 {
 	status = "okay";
 };
@@ -665,4 +682,15 @@ sd_card_det_n_state: sd-card-det-n-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	touch_irq_state: touch-irq-state {
+		pins = "gpio120";
+		function = "gpio";
+		bias-disable;
+	};
+};
+
+&qup_i2c11_default {
+	drive-strength = <2>;
+	bias-disable;
 };

-- 
2.39.2


