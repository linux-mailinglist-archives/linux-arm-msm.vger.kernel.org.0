Return-Path: <linux-arm-msm+bounces-52674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCD7A7377F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 17:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D5171757E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 16:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2FC219A80;
	Thu, 27 Mar 2025 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bdIOa/Zy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A62192EF
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 16:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743094635; cv=none; b=TqmMBXdXx0bxXJCoo6vd1MJr2ztvTZLqmQTMeqUN/7at54/1qEpnd7mDUxkjfFsInmNECxjINjNl2cT+FONfP6QiOZe4RjdYp+HtOF/KbrFY3Mnxbz2Op0NIPpTikUeZiNih+V6llmlTI59AvnBX3fAxDgGbNS/g1GCIPq5UwM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743094635; c=relaxed/simple;
	bh=TXeF8ENNskUDGwF3cvjKoqijZfLRyaaJUxKZNZISbrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GxzkNzKFC4MamQfFls/sPr/5l0k2H9Z2wYpiyfSZMLQdLIiwFtH2VsKd+7Kc6m8Xkw3Bu7M0GmoocORJjNk5oQbE0Lh4CPniIuRuwfrjzJ5zqujiE7Cpl3iySJq0GZQnnaViO7zSjCkoX/nIXjpcce8A9t68tYYUxfxTvlIcc1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bdIOa/Zy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso13739245e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743094632; x=1743699432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mluwDyuart7Fj/8nHrivAiHFnq6wOhPI8aN7mFHwSpU=;
        b=bdIOa/ZyVvN7XE9qD/TFdW644k1A7Avrc2HqPeLfRTb0MT5Rygzt939L54GWCzK1oU
         gqbPIAKFbmbz/RRITSIdjzO/V9KkCRj0n0nafJlABPYYK5KkUiRQsza1nU+iPIsZ6KLH
         W7I0UXOT56wVTuaZ5LYlamy7eO6lRdhHjg7vbWAJCot8DmInGU5YfXG5DfvfKEG6LZ0Z
         eKHwoo09oLPvjsNGrnZJwdkpxzq28oSD3Yn21LZjwnpACgnkvZak18yKC7ss3iToP9re
         uyWKVnJV/q67biLOMne4xFLB/ph8gMJ2pc3luYq2rDGgjhqQ/Il6TNTUFM1NSFu6DZEn
         n8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743094632; x=1743699432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mluwDyuart7Fj/8nHrivAiHFnq6wOhPI8aN7mFHwSpU=;
        b=rx5GAM5RxZrUtFR4iVDzxWUCdrV03Vc+BIYAPraQEFltXCLrKMm8VQG1R2SdHwNvbP
         QRDlsOjOYcc9TiT3v7UFcerXhJ/SjbZGZ1NzPnkjFsXjVh/gwk4FCcPKHXJZLNqU2xdA
         mORw1/SpqH5kUDR/x4X18tPb4Q1PAgWzf0bvuh/RFnatAhxoY9TCKvUTH8Cp50o8PlUb
         4hWiFSerqnD2s0zMmwZlP1BgSYZlKp99pg4eXnPAuMGJ8UcJMrrHgRq8kE32SfYS8jP8
         eHGnwqOib1WZsgL5Ur5CR/4MQeFuLajV5qm1S0gUp0L3f/R9Z0HcZ6JvQjR58yzihcS3
         x20g==
X-Forwarded-Encrypted: i=1; AJvYcCXjGCVQaxQneGtSfxszoMgi7Bt/j/Xo55Iq4umBGSaeeeO9zx87gUM7BWnTXA/s32s7N0S86Vs4JS/R1eER@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk3fZ1daCeuIisWaWbqhW4mSnqCmB8NAVPJAqdLUzYoxQ/JUbX
	jBKAZaAJP39+WuJVNId98qLYFkBxFXRwA7nhjiul2LqLk/nrB7moyN7BqgNy5QU=
X-Gm-Gg: ASbGncu4XyArHwVaomAZ/RFV9lUZigExyq7l5oHVKWn+IP/44rzTQq2KGnRFPpeQMyu
	AkdJcMsD2zIYiSQqnAGgm6JARDRqIvvqHYfJRktXZ+VmmdrltEPIv4ljyYgji5RFxdIlBt6e4Om
	bkJ+3C5Tn0J6M7tOKDEkkduAFB4/CMgzv9jGd3tX9KozahWaacy2STw0ETb1+Eix/o+38L8F8Bl
	tE2qpgaqbYUE19eQJeolmzCijaPJnrEgFkF6G4dYa6SHeFe4VoAFN5SXT9pA6AkYF2FZGJa71cN
	4iUlk0Hokryfiszr6Peyq73iTlMvrVtQ9gQrEMbtTpTn1UyxY/oa9gNP
X-Google-Smtp-Source: AGHT+IHFKLKUDx3bf/Nrud35EUvZz/B+9hO5Z7cPlEtAREYQimYT1rwW5U9Kqesuzw76jBJ90BPzbw==
X-Received: by 2002:a05:600c:1ca4:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-43d850937a4mr37060565e9.26.1743094632171;
        Thu, 27 Mar 2025 09:57:12 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d8fcd78bdsm605275e9.24.2025.03.27.09.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:57:11 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 27 Mar 2025 16:56:54 +0000
Subject: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s-oled: add eDP panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-2-45d5f2747398@linaro.org>
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
In-Reply-To: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1042;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=TXeF8ENNskUDGwF3cvjKoqijZfLRyaaJUxKZNZISbrw=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn5YNmkynQR9xvi5h2y8w6vWoFbs76NuH1fvz3i
 GskKbStz7eJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+WDZgAKCRBjTcTwaHBG
 +IU8D/9yokKbCBHJN+OPAwndry40zJ/POSNc0542KHetrFdYUYQNLJzpj+YwBDOg+ovXAlySkjv
 WqrBOtvZnNHXpYybHU77l230G3Z9owCEFgpi8c2H6TGFv8VVQDzpKMTArj5qDmmOGLwlII20wBS
 hdgH2mhdFyBx9xb6KMy9IasCepzg1DR4jsu1Iu+LLrjIdnmSSjkUyZoCc5aCFwdAaqnNnzh/TqG
 Uc4pFerI8OvSRuc8WpJ6iWi/DdK5nTSQQRERqe6kYQDtUmcga7zdmTXPUCZUWwI6jV//jCnF9W3
 ple//Q4Hk+Jymi3iDcn0vCeC6LY7XC2EzEx5ZO8IGqCG4oDN9AHKvDg3UeyX9uHlm+AnnBTgL2O
 Avcl6rzFfKy5fbORpQ+Yt/vN0jY0ODr3mgUwr7xvAmWufAukixJ37en5GXleNq1OPtGlenM4l9r
 mgRUoFAZ79HgLuSIrww+N1xBaOQL2Yf1BuPiI1IF4LH9rcwh1haHNfOkgk7GEvgbQB9IO93C/Yo
 q4j133sKZhDstXmrqe7Ss37XSFumsIc6Zw4HBnHJnL7LT6GtTESqSzryB6LkGizHUeJ4KGzN6nq
 LpL0l1PWqjsBt++CINaQf1/AZ9PzRUKK4jUPi3tLIqA8Tr/f6vf8J2BcCZ9kr3APVeKpr/xiU2u
 lpGwSoVvsSi1YcQ==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

Add the Samsung ATNA40YK20 eDP panel to the device tree for the
Snapdragon T14s OLED model.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
index be65fafafa736a0401a5872c40f69cb20cfbbd90..9a5197dcb2651c22f89e98cf523682bff17e22c3 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
@@ -10,3 +10,11 @@ / {
 	compatible = "lenovo,thinkpad-t14s-oled", "lenovo,thinkpad-t14s",
 		     "qcom,x1e78100", "qcom,x1e80100";
 };
+
+&panel {
+	compatible = "samsung,atna40yk20", "samsung,atna33xc20";
+	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&edp_bl_en>, <&edp_hpd_n_default>;
+	pinctrl-names = "default";
+};

-- 
2.49.0


