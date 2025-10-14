Return-Path: <linux-arm-msm+bounces-77080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D608BD7496
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 06:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 791F03E8114
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 04:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B0A30C374;
	Tue, 14 Oct 2025 04:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8zd6X4w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCAE30C34D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 04:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416954; cv=none; b=YYrKZ/Se+N4PGOHZfr+HLtggDO7MaIZJN5LwxZSdQgBUvGwAH3IlmxXxM1I7WjY+Ir+6uIdHhh8mDNPJKGrgR6wJLOnKkAGf7mvn6rObtZaW3Rj4Yb4EogThAgbfOkWEaXy0M2PzTpYrJ9KCZ8bkgpMWjBGPQ8n7mFdF/U/By48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416954; c=relaxed/simple;
	bh=ZOeZWKOOWKCm2A4DyWN9TLg3TCjbyuF4ehcHyG+iQKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gvCU18bpAE20C3b2GIpgh6+uHeuoowegHnK6u0pKGlb1vHboZUjcSTA61fueLgTDX3yewqIWGWqkBIodqIGOJpDiYnTtYqVwkj+OOthAqVL3gy0zTY7sRuKrFQxpmT3sJCjs+CKk756hs3niQecSF3ihBkPMZWzhzoQIVa1muK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8zd6X4w; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so4378758b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 21:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760416952; x=1761021752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qr0OOb/YSzzcrccKjN+O1ce21xTtHsXacPPXsNxVeZg=;
        b=C8zd6X4wfAgULf28ZjaEStgY0ocgWj8EIzAfV+AoGsguCrrRxdVGItVUqJJp9gR6Q8
         b2uqsAmhhTScsKdoBX11fQVjV0y+wPHG0aT2xgArT5Pcn5ShtG6pGz3bOS2rkIYb//eg
         9ltIwGsd715rqIGtNPDZVmBqVovn23Xdu5NBMVkkcUKnTL4HC6HR97Yz+f4xEsdTqzrT
         6xHanuNuqAPpbIYezIPEPq1k+mhs+rwBdb2Hpv7UWxE4g5nnPYPzWhS5iPcOhyXnAbz+
         CTVvIjztTy8bRom+9xvaDfUhDStR6EyXyJwQALhvdKhRKtq/lFNCcLK28xQAblV72d3P
         I17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760416952; x=1761021752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qr0OOb/YSzzcrccKjN+O1ce21xTtHsXacPPXsNxVeZg=;
        b=X75mWL76Tom22OxhLy640zpHwxRQZFLcHg9Sr1HmWjtp2asYMjwwKeaWxB0xcj0IT0
         SEO/tiuRX6zTUU3PzRrRFJoMtgNQmenhWSrzS9/Zxt1T8vsLFWL3ooXrta2cnDa4hNY6
         G0dowT6zoxV2BT4OtQG+DosQQYNA0iLlzbIPkSfcRUusOLfs2icYUeLonwAJ2ftjYVVm
         NmzTdSnuJOHtuPaT4zzmhR9KEs5j+t+UfyWI+q2Yoo9l5uWDYJgirJUusN+hAWqCd4RK
         G2oEJrMwbpnrsomYwhE49wA6cz+0OWaXZ3DAanehBLCm+7XhiVwINCsIIXEgtVQu4RkA
         SfkQ==
X-Gm-Message-State: AOJu0Yw2TUQN/JQua8xWfGTqoF+r3dZsU+zBAkRzjw+Sm3tkV+HAcPNn
	fDElRh0dmrwBPw2Gu13vZiL5ZlcNPBf9h7d+y+l6AMVBxMsYz6WeXZyJJJxtl4r1
X-Gm-Gg: ASbGncvvY5wMFcj4k/jEuXI449kPJvsPb3eUwoYnrldcLXCqnYhpYqNzIpy3OgCCCRE
	4IZ2cwW3di+dFeUHP+WMNwYb5YBawEAt+i56UezYjpP0epQhQuBydRRQl/dW3f60B6SlxVxzyp3
	2/9VLTyeeu2D0ted4SqqAM3IMDn3Ei0FwXk0AwqR3DD9dnBDLeb2FpwrxAtntFC/T3uGi299l61
	ELp/ZqkKNXrYfDjlPKZla0VVHUBdw2uBQp6BroBNGXAB5ld3wWE17/R/9NgHNCpinWz4fZE50JW
	VBRLtB+NEMHVLrtv+2VelWJgjpBhbGbNzQCia5sN/qaDqAVvN27gibniIfP+Hvzmk43NPLZ7hN4
	R1owkKFTrTcnQ/dwyEg++bXcMaIkwXpJMEhEh
X-Google-Smtp-Source: AGHT+IEiczPDzcVKQsKr3sSM/MLNqusV/eS1JcWGMdi/R/+jLgzmhexRA+IU3VJwnNlXXtdTmYg0Mg==
X-Received: by 2002:a05:6a00:3cc5:b0:76e:885a:c332 with SMTP id d2e1a72fcca58-793881ed81bmr30446227b3a.32.1760416952199;
        Mon, 13 Oct 2025 21:42:32 -0700 (PDT)
Received: from archlinux ([177.9.216.59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-79b65528a51sm8440684b3a.85.2025.10.13.21.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 21:42:31 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] arm64: dts: qcom: r0q: add gpio keys
Date: Tue, 14 Oct 2025 00:41:31 -0400
Message-ID: <20251014044135.177210-3-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014044135.177210-1-ghatto404@gmail.com>
References: <20251014044135.177210-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add GPIO keys support to Samsung Galaxy S22 (r0q).

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
index a17dcb848fc1..5ca45b040a99 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
@@ -2,11 +2,13 @@
 
 /dts-v1/;
 
+#include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sm8450.dtsi"
 #include "pm8350.dtsi"
 #include "pm8350c.dtsi"
+#include "pmk8350.dtsi"
 
 / {
 	model = "Samsung Galaxy S22 5G";
@@ -28,6 +30,21 @@ framebuffer: framebuffer@b8000000 {
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		pinctrl-0 = <&vol_up_n>;
+		pinctrl-names = "default";
+
+		key-vol-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8350_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+		};
+	};
+
 	reserved-memory {
 		/*
 		 * The bootloader will only keep display hardware enabled
@@ -124,6 +141,25 @@ vreg_l1c_1p8: ldo1 {
 	};
 };
 
+&pm8350_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>;
+		input-enable;
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <36 4>; /* SPI (Unused) */
 };
-- 
2.51.0


