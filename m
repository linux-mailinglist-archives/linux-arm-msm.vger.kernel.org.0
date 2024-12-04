Return-Path: <linux-arm-msm+bounces-40384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D659E46D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0095F1880166
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DDA2066FC;
	Wed,  4 Dec 2024 21:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg0n6R7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A6D2066CF;
	Wed,  4 Dec 2024 21:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348121; cv=none; b=LppW4aucdVu2LbdmNwvmEFPLBRQxtxOEj9WS16XfHlmlzAzr5swkDmemJQH3EJbWQGA/vSR7rewL9jLXGnkLPzGnuI/awB4qX9SMYYehAPUx8+KbIlAB78P846JXDw3TGFSPf/oChPMpw6+rL/wYR7x3fvxNjTaEzPfykM9klYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348121; c=relaxed/simple;
	bh=Gc4/S5UDLLZ+ufg8k/iV7+3SLIdTi//57AzyET94CIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eB2vkkmqsXcxqIOx2ODm1HMmqyvrkiRJ9T5faZY9JUNJoLXlJAimkdHOYslDOthyviHTEWJskaPJS1rVEuWiZh3y9MyqUFAjrqxWqy2/yIxUotaGlKFl4BAyvMGER/UColOOh539sdYlevsFicMQtwPVE3ca2OgZXWIKgjyct8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yg0n6R7Q; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa5366d3b47so33879066b.0;
        Wed, 04 Dec 2024 13:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348116; x=1733952916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9SZ4W+7hZgoL3SZDwrOLlupR4pLSVy/RP6+wF06pI8=;
        b=Yg0n6R7Qo4cwr7cMeiawSG4a5wy+kAgB1TZhYPblQbwVv6U/7ol93wokQv8kJS0L83
         lHebecpCX6/Zb/hOFUkeCVYozOmc9+TzHCp6jiDdq7S2x2s2gY/Z1FU4QrIhOkGAZ0le
         QG2KopYwBfU/fG8S6L9iYYfQsM/bixR2E+rW8prH0rYdwQJRAyQASPsfI0Me82ePh4/Z
         +iApCXppQDDeaRRDgA6lwCm1hFpFbNCZ9k0yCDWg+fUNLHDC40CbwtFsC/+3O/B628/q
         ijceRyg9MvOY1NmZy2eQ0pXZvNWmhpGYpi4df4eMC2CPCFhEeCDpgAtHc2jnV6PLKasX
         wiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348116; x=1733952916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9SZ4W+7hZgoL3SZDwrOLlupR4pLSVy/RP6+wF06pI8=;
        b=gj1UBlg5XD1IfhuYK1nHWVk7vjXmlhmtxHLdbE8OE7xponnYrjb53VhlpgpZxGYwkj
         tEGBogFZMucqX09G1dY/VdKvz0dDQAs8cDeDPn/fQrwzvXnm6YA34q/8ox9ZTpzipL4s
         6gjjvkf5/qIXXdfIE3/s9/HvQHRWI6gZcZvAQ34QSjXi4haYY7Xsr1IOM8mLYeyq3NGz
         Hje/RAQBTx8ZQ2eWcbjYFkg+0LSRV/HMy9228GGT1ifvSgO8P5iRtvKUJ3u/7dAcZVU9
         WnfKMLHOdAI3vTeIZNMHAksja17xsqQyKerzeSP6Fl2pMExTxihXEp78sUHm47PA+Jp3
         2ppQ==
X-Forwarded-Encrypted: i=1; AJvYcCUffntXDKd42e05gLnfLaNb65h0VTwvVc+iJVTUAoB8u0BioD3yKJS+BQsYuQ4/zeuiHRfUc4Ch3eXhh1EG@vger.kernel.org, AJvYcCVD3N1C8oZCx1cjh59LEypqsAurLYlaql5b2wqvxEGsk+AzC6xq67sbdyt2fQGNKhC9Ge0uYo5W640Z@vger.kernel.org, AJvYcCVeZlMtrQGci+ccopyzlSy5B7jPCQszKxU7T6Kj9uRwwqGnh1c0UfPnmYMkyGcBS88ElVEfhcrsVB2JyCU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycp5AoSlymayIONkYAY/218XSWWgx03iOrbodYy28ONJWbC+G1
	DCY7gV8G2PUyexK9h09ttoBKAJusCi9ldgDq4barAAx5+7dvTFDF5RPV6A==
X-Gm-Gg: ASbGncudM53jq3SgzN219DTPQxHzQSx9DoV086MH/iwyfz/FJ487v2VRKD0qHucXixO
	X1O1seSRtPKRu7PvuctYftH46KnpXAfAxxOA426IjzSErcDrIg0KVvhvIf8EIgr65uvJmFayPu0
	UQP1WaY1ABa+TswJLYS+r1DCjGs/rd4x+WKjc6oOA0JEaT3/m1/KA0fjvwoVA0RkeMh5uPX54o8
	eKrOwN8lGUCu/6M4umH/bYlSEzFpoX+Zow2zE+icktSSh4L
X-Google-Smtp-Source: AGHT+IH8AxAueBfrvL9t3nUdP7w0VquTTd5IXyWvNJJ0Xv2RnSD+qG/3b+HJIKWZe87n4F+r6Vn3+Q==
X-Received: by 2002:a17:907:c9a6:b0:aa5:1a1c:d0a2 with SMTP id a640c23a62f3a-aa5f7da981amr643688166b.34.1733348116174;
        Wed, 04 Dec 2024 13:35:16 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm4506966b.118.2024.12.04.13.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:35:15 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 05 Dec 2024 00:34:55 +0300
Subject: [PATCH v7 08/14] arm64: dts: qcom: sdm845-starqltechn: add gpio
 keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-starqltechn_integration_upstream-v7-8-84f9a3547803@gmail.com>
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
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
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733348104; l=1758;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=Gc4/S5UDLLZ+ufg8k/iV7+3SLIdTi//57AzyET94CIk=;
 b=kk0JJWftT1FcudBLe5A2apgcGSI0cpi7vvIE6ku7vm84rxsZpkzsqxXk4lpM+pGb7///XkEEI
 jBfTeG3dNPzD9VccHrRUTu5xvM+WzA2ZHY3JhmmkZt7iW3aWxyOBtGW
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for phone buttons.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
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


