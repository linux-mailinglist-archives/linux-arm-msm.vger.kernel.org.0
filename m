Return-Path: <linux-arm-msm+bounces-31899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D224397AEB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 12:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E50A1F238F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 10:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176CA161319;
	Tue, 17 Sep 2024 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hHB/VKoC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411B915B54F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726568842; cv=none; b=ZgEt48Cp+aDR3eywQJUg5lmJnvnDfYcFrD/kugBXQ8YqzzrPTeCo/6YGQ9CFe5XxTAPajzzAuAT70MxZTl62GbtrapGte+oQ4DRACFvc4Jre+1xV/x+4eGCAFsUfnRd0EwJJ+Dq/TQtvQzU+E0nlO4FbzyLI/ySlsx3pxVMe3bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726568842; c=relaxed/simple;
	bh=RQUyVCVGKvk955KD/oOhxw77fHG83o7vjf2LfrYMi3g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JBM+a2k5+va4v0i8vAFBC5dWvLSVVE9mbnV6q1V3gde17VwvKIpiPLl7S9ncWKGtaNQ1Xc10bMFKVND2nHRjCvO9gpqR5ZXYaxqV6JH6ZDNgKTmTQrsrWMcnClzyf+lYtWxtIfbmpu+NTw4OUeI5C7xmyfrKKljWupsmifztpbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hHB/VKoC; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-378e5d4a80eso2570499f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 03:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726568838; x=1727173638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O3BbujuHzO/RAMZvTpQiB1Pqjgm8cgnsqTGoSPy3nXg=;
        b=hHB/VKoCSJEgXT5RtxJduNcATFbNzOUn5Gx7nJJ3Wfs0w2Dr/Zhpz9ZxvaYAiSyNZY
         puYz1QrxSvUAp0bq3RkVKB3iSPbEsIL2/O5+6RgAG3o98rcpxNK0UqDY5T5JaKN3AGhu
         AvlmNrKadHbHN60gkAHi6xI0ttXW3o2zBIU97UlpQ3/EivqbRIVSf1RxI5HoVuFnNGVn
         kK4e+14nhbxZPL2d8xiMtF5fCGnLhEYtH/9nIiXCu9iz2GamSpdDQgQ9I9PLseywswO6
         FTdJUhXLJeifNqoXs3QcX8FyKP09OtmKktz1XK6cLNKEwWpNuEkLNGhfRmTAowfC0qR+
         /MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726568838; x=1727173638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3BbujuHzO/RAMZvTpQiB1Pqjgm8cgnsqTGoSPy3nXg=;
        b=sCfILeF8z6139dKDGxIEKmAcNJFWYqnKBjlJq4WCeH8xAF43BnSE2PWLt+pZM0eTIu
         itbShEVMQDpqR3f9WRwJR2itzmUNn+PDq/xjStTuNkS0Ys25wnovvkTSREjp2/64RnKg
         TbxbMor1CE63uHQZsBFXrpjOaC6OAbOJtXKRfqCaYuJQhHqMnOFOZuZ5JO6xJz+k5vs6
         Wbu7sVTRk/vttkvdiOocoHkuDXgjp1EAQrMjZ49lM6hppn45Cv+rLI4RjD+qDzOCvd84
         x2UGw5x9/O5TZ4up663KTNTaN50BvwIC57xpMIUdcH5m3/JWw03Ncn3BRm+J6i7bK65l
         2V8A==
X-Forwarded-Encrypted: i=1; AJvYcCUPkFLS60lMk6PSwLQla8UosX6fYX6UhxPUvR1zX7PkevrXNLhvE7wZm5LlmyWWGYSbEW7LuLvr3j+1Jsj7@vger.kernel.org
X-Gm-Message-State: AOJu0YzpxCUJ/+lYtuhYojvEvxQs0jfPXlcT/m1ufHQGXTmziGLRprpF
	NIFsmHHsOsv5P+ZS1wrVOXZSOsoXBYmO+x671GA266nWBpWYtAPXp5+NVp447b0=
X-Google-Smtp-Source: AGHT+IHV5sT6le5zmGHifYAmMMnHu84747/30MSIE35w1b7lr7DQVM5IDV37QwsVD4o4IxyZXamNlA==
X-Received: by 2002:a5d:61c2:0:b0:371:a60e:a821 with SMTP id ffacd0b85a97d-378c2d4c9c6mr11217648f8f.38.1726568838503;
        Tue, 17 Sep 2024 03:27:18 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780031esm9151096f8f.84.2024.09.17.03.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 03:27:18 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] arm64: dts: qcom: x1e80100-t14s: add another trackpad support
Date: Tue, 17 Sep 2024 06:27:15 -0400
Message-Id: <20240917102715.4096-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Trackpad HID device on some of the T14s Product Models 21N2ZC5PUS is
at I2C address 0x2c add this to be able to get it working on these laptops.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index 941dfddd6713..8468f99d9bed 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -467,7 +467,19 @@ touchpad@15 {
 		wakeup-source;
 	};
 
-	/* TODO: second-sourced SYNA8022 or SYNA8024 touchpad @ 0x2c */
+	/* SYNA8022 or SYNA8024 touchpad @ 0x2c */
+	touchpad@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
 
 	/* ELAN06F1 or SYNA06F2 */
 	keyboard@3a {
-- 
2.39.2


