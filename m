Return-Path: <linux-arm-msm+bounces-41053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175A99E936C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C57AC282B6B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FF2228CA7;
	Mon,  9 Dec 2024 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YE0A8whI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF22227BBD;
	Mon,  9 Dec 2024 12:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746192; cv=none; b=XiPLItUPk0xWKh/uHJVt9Qpb5KuaB1I7OqGiZA2yuIRQ9ZuTlmcz80UqW3bpT9pIlkFpELMSYz7mHvqnlyJRQfDrGWF9T/8uSuM/SxR58IEuyLtDrUb1YKSjb/dNAlgsMZQB6aYGGz3FZaHb2KtOm9YgSU0+/G20kCmbUcFZmEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746192; c=relaxed/simple;
	bh=dlgcmmRAJ3MoneeImOkiyCmgGQmRXGdsz+RvU9rtPRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u+F1e0r5YSkwSHTrfLldGklFAvr+80ClfIyV18vOF2d3ncTguQSTE8b6MbTzNwRQBzmL8OZnA3NYyVdOjRos7QtuqqcOCas78u6cTrevzonPwInWXeTBGOdNhvVBzcJP6TQtEPnzDr1KdmEpv3ImLoz2gYO5oiA99BSGjWHN8Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YE0A8whI; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa68d0b9e7bso142522166b.3;
        Mon, 09 Dec 2024 04:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746189; x=1734350989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2f7ELYVZ6i0Dpu4rh7kF+9M0py46gZ2QUyL5S6CNu4E=;
        b=YE0A8whI6cvgUQEaUw2A9MVda+OaUf18T22/7Fo0SPIo/WDRr9slNa8QSzKsMTYNLC
         TkCns1sDBwKX/KvbfkQw3oMCfFdaZohPVMbR4S2VWJz0AIiLwFSTyeEsgv0uCShsmymk
         10MP5jlB3ve3AYdvTe123LyRTyekQz1t73jfd57ae/lIA1NSPlx8YACwRpa5GyJxoIJE
         li5aG3yZc3rApAl0WhrOp2ZQMY9xpmx/au4TBb+KD5swEFsiPHbb9+SH6c75xTGhqqWg
         0fVppEHL87S7mnaChFx4drerDtqpslyb9vn/QBaGXqZGeYijpjXzVMBrfWNjMXMbZCVZ
         7Oxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746189; x=1734350989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2f7ELYVZ6i0Dpu4rh7kF+9M0py46gZ2QUyL5S6CNu4E=;
        b=ondAjWkzPWhMYv54AyRoJpvmOnc5H45b/PuCFb1rO2MIwmAT7ZEgEQqLIVZoh6hW+c
         0j+EdrTayksxYxtAUQay6b8x0t3uwb7E3tjkKsXOmDxOVLu9kmsoPAu+f22Iqu/qqj2l
         vjCSjKgtAXU0Xp9VU+pk9DfiDYFfwtk7e7fXdYdPUkltdJzxcYf3hfLw1O4aavfW9AKl
         L3UTgqXmvzmzK6rmmBjTshZ1d8PvcwbSLicRLa3QIydiE6Y7hfZznhvwS7ep+Qwmz3F9
         Oq7ifS91s8ezLDD7rSGZ/d5hUMoZ+cro8RWbzjBeLIKciflJkshyt+Tf0HtHJbmwswhy
         tO4g==
X-Forwarded-Encrypted: i=1; AJvYcCUlvwhOupkEqUH9E4pRSyQXVxmQ5n1t1BVZO3/mIINnCu6n7J8KGdPHYveZ9hAbIWjApH1JKKeau1S0vjbL@vger.kernel.org, AJvYcCVq/rUApv++hhf2DgDEUzDLTJEm2dv3sBNUIw0wgNPUgRFdjrXdEykfp21X6b8DhXc/kpuHJJ48h/rCa84=@vger.kernel.org, AJvYcCXvQvaPf+Fehh82l7WBBg6P5ryf9B7o+221NysmSzEgVlro7Q90Jbbj+yJXNX2hz3u28GqSy63OBr4+@vger.kernel.org
X-Gm-Message-State: AOJu0YzgHbh0PsdZlkO8OmEODIHzIUkXodjxEgWegksvH7pclx9f9+m6
	Igt6FQewpE9WGRBz4n//m9kfVm5M+cam6DZZREM8uNHen+Vyd2Wm
X-Gm-Gg: ASbGnctnAoUcAQJZLmPZ2hWLtzpSX0EnMgUSWWnkMzp66Yn67ErBMqYhwU+oLvIq31x
	tZ+8RkfupgdmwoK9hWYOisnTHOsTDx44gHKQzaVO+wAp/VOUZydSS428/nI9XKl0p3bnx/cId8z
	nO+xGCM0ITov1ynXFjPuSkY4GW0ZPtKzZ/lgIC/ZN9BidBm8fImODiJOkAFfnG/OegbEjv/iU45
	9afXZlnGv/a8PRxrEUg5vv+Qf8nP1k6O07chX5cumgLyru4
X-Google-Smtp-Source: AGHT+IEp8z5X2U8OiBEdYqda/aR+XDgWSzRXp6uS/B5o7EaTd7qbArQGCNb+OILme2c0iMt19jYciQ==
X-Received: by 2002:a17:907:780a:b0:aa6:38e9:9cfa with SMTP id a640c23a62f3a-aa69cd5ba6amr8682466b.26.1733746188899;
        Mon, 09 Dec 2024 04:09:48 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa69964876csm37308766b.49.2024.12.09.04.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:09:48 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 09 Dec 2024 15:09:12 +0300
Subject: [PATCH v8 08/14] arm64: dts: qcom: sdm845-starqltechn: add gpio
 keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-starqltechn_integration_upstream-v8-8-ec604481d691@gmail.com>
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733746173; l=1907;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=dlgcmmRAJ3MoneeImOkiyCmgGQmRXGdsz+RvU9rtPRQ=;
 b=NzH4ZaUowklqnkXgCP5WUdtmcqMdbTI25YUoyNdcqAiiSzB6wx4OI94lfQKnqSORVGpz1ov2U
 HV19XcbRz+PA1RMo3l+EcEypPs7cOY6E5Xc7MKUAFgJ5jdYXnvTIus0
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for phone buttons.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v8:
- add tag: Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Changes in v7:
- s/_/-/ in node name
- rename key labels
- move pm8998_gpios with chg_int_default pin

Changes in v6:
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 5948b401165c..38c09e50ccfb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -7,9 +7,11 @@
 
 /dts-v1/;
 
+#include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sdm845.dtsi"
+#include "pm8998.dtsi"
 
 / {
 	chassis-type = "handset";
@@ -69,6 +71,25 @@ memory@a1300000 {
 			pmsg-size = <0x40000>;
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		key-vol-up {
+			label = "Volume Up";
+			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+
+		key-wink {
+			label = "Bixby";
+			gpios = <&pm8998_gpios 19 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_ENTER>;
+			debounce-interval = <15>;
+		};
+	};
 };
 
 
@@ -417,6 +438,11 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&pm8998_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
 			       <85 4>; /* SPI (fingerprint reader) */

-- 
2.39.5


