Return-Path: <linux-arm-msm+bounces-67275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45225B17765
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 22:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BA381C80930
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 20:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23FA269811;
	Thu, 31 Jul 2025 20:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pQxYk7CX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52317262FC8
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 20:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753995101; cv=none; b=ukaKk0PtwBSkmKMv+vGpTuFvoB3I+/eSPJ+INQQmLRRAajM4kQhXSR7PTvS4++jNws8KBUGRUw1ke4OzOFSayrwHClZ3JAHzVbxQG8LrrXao9dGHagL/6jX9biqX92XhyaKThl/vGO8t5VqG8PM0acA70nCjgbG/qQEMxfxEQgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753995101; c=relaxed/simple;
	bh=TzJ2JmpzdBdudyzzf/p05R89SsWQRe4dz/J8/0Kx2Ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NS40ykw73JoCGjP8LHoeFr+lk3IMfPR2f/ckLb9b790zuix1L4v/mSJbcXjNJVpiqI+/UrkE6h9XQjfirfkmK/k3A/CQ5loKJTaD2tGtEVCtMt6yX8ft2idbZfQL7Jg7EQUBDIApDGo0iYiSEFy5OfPdDk1Fhjq/v/CA+Q/Ufqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pQxYk7CX; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4561607166aso10028415e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 13:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753995097; x=1754599897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zf/LNXjHxtqIC/Q118TLyzaGDDqd8kl1KqYbnGndGhE=;
        b=pQxYk7CX3tVopZkxt14n6A8c2UPBJbtP1MatLbMheBDENBcSsmcVDdrKJGQxF7uAdv
         4co06YXy/mektcl4+2b5rGfoZIGGZSz2YXBML/P+DMNQP6ghOsDndUPVnp7kwBE1T722
         iNzn0sy4o0F47km2WTYla3JcZcK+0EBjDeNGwBygTrnrsLUz0ITmX8MnDN6pvH92Ujoe
         G3RiOYtpLpvu8RdCRRThG8kUi9ldeThTlw7Ii9U4SJhwGWpLR9Uk6Gu4OvhS+KDsexaM
         GhG5nlYALPLGR0cWaT5T8Iu1PrEuHx5OSizvNwZ/GDCcRCxetq/jFwQ5ewvvCBM2FFKr
         zjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753995097; x=1754599897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zf/LNXjHxtqIC/Q118TLyzaGDDqd8kl1KqYbnGndGhE=;
        b=DZcoBlBG/6gdPYF8m/py+Fbt1pILSRs3+sm2a8Tym3SeHyRL17uS8LaE8pQOBuw/3v
         Bo9CIxg4cE58VouIomzeWpXhf9b+/COgdadbAftXxSRdBLuATdMYBLX08K41FNOWMVZy
         QZHVoUMwf0ARm2dvt4VsOQ7moIZuY9zkX3ZurFpvQtpqMz6Uasrd0r8YJQrvQjvUVniU
         EGndF4sJslM5ev50JKFAE2Zdba0Ml4dm5dAElRNaYrdEPJ3T11C9nQ1nL7QR2i3E2cEU
         c92mtnYVN20nEs6oBPeRkbf5p8JdivcaDK6W1sWC3qzrjG6EB8t5SXOZhM8FCEMkKoDA
         3lSw==
X-Forwarded-Encrypted: i=1; AJvYcCU5UtNOcnrumLXwe0wLmnc7xjfuLZ68Jv+piFGZqwx9jp/qhMQGyS2mPJAdrUIvWN87tOfb2c36b6sWbxrE@vger.kernel.org
X-Gm-Message-State: AOJu0YxV2Njnox+2H2jOZdsTcKVaH9JyV/PxZzaOkHYjHgIj227bK1K7
	4U1NxQOMnxQWepHxpOwqPAvDcyEyxPKK4QYmIiiRl4vunap26ZYilQE/CarRwZXRP60=
X-Gm-Gg: ASbGnctEwjFA732J+jxKXwk9AqNrKjhj+GuW2bExjdULQs3S29uN662Yb1zg6laYJEl
	oOSjLaZObHvFmtqhlRZd7bQEXWQ899UdWnQ7cfw2DJs6ZkBQqT/fPbxUpAsQ1NW597wBo+FMsym
	IULegNwQkVa6OctA5j8QL2OpTA3WyfodY1GjDykWRkjeXKubl3dNPduxJKV3RoGkVvy7rivi+CR
	K1L2IhoNhI3M6MENYvpwLacMwDuN2Jl/0jER3nMffGBnXtejlgbFlsrJ2o7/uw+e73dc3bJbiOV
	v/vZnN87IsQduSkKBwt2QmKyVCCAntFjF9bkHP3rdfgt183rZG08DfJKRuo29qRbnnmzQvg7b6o
	lF8BeXYf2xORIoMcf2CGEYM/JLsm6KYTGS2CricFcOCpw4WDIkM4MuK+r7OI1/86E
X-Google-Smtp-Source: AGHT+IEBtM9baJ05rMQ8rmvvoHC3YitZQWp1OkVogVqW4nzyS+HV7tOa2ALIi9aP0/Okii1jJTR8PQ==
X-Received: by 2002:a05:600c:138e:b0:456:1824:4808 with SMTP id 5b1f17b1804b1-45892bdf9admr72814715e9.32.1753995097349;
        Thu, 31 Jul 2025 13:51:37 -0700 (PDT)
Received: from localhost (dsl-217-155-193-229.zen.co.uk. [217.155.193.229])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45895377b3csm77261535e9.13.2025.07.31.13.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 13:51:37 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 31 Jul 2025 21:51:27 +0100
Subject: [PATCH v6 2/2] arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-2-4782074104d1@linaro.org>
References: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
In-Reply-To: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=TzJ2JmpzdBdudyzzf/p05R89SsWQRe4dz/J8/0Kx2Ug=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBoi9dWGuoo93gmwB77kCPGYwUlsY9B8O8a6EL6V
 hiUNrfCis6JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaIvXVgAKCRBjTcTwaHBG
 +HVQD/4uG2m55fMJmbjfHg8fX+MUj5tsHp2hIHNB19uXmOC2pXqHksIZXlWW/vdSEWRUn2eQnym
 p7mQYpuoIyl8Zl8uxd+tjz6mY1tNabZ3nW8llV/a3hiqrCK3CZ5fkWtcG1f0Coe1Miyc9y3gPbT
 cqSq6w4+btRyy21R9x8yF0acSKX0RU+SlcZ1oXqAiyS/j3PNItTTzeA7L5YM4ggtMmn8XAo6B6J
 AWpyNOQdo164fGka6KOkvCyPkNmGkzR9iLJOEvi4pV/gZbNJ7F0QT98+ReLcwwZpnwBfSiFXfq0
 JgpU2NHwEPWKZV03M7bN6x7k35IPYJPJIk60uyZYgDW/mm14qezyRD/WaxLBLeymT0FYQwiAelg
 WvpBlopfiUdsjNmeNazTI15wxNQVDWiN92ffx/DTGdamh8QnV6zXgpJavERvu44ujbgc76Z1Aln
 DyeOZp/Tr0YP1SZrQD6puIC1a1BZQgZzSdUMN6XQrRCuHJ7s/twRjRXoQp6FG90m3ZnAY1WH14N
 S/mtw90dpoUFCL7nbs+mKyuYBqZ3R0Cam97xCW6yvXeSZUuDCTzIdN4DUtKhixvv79huUee2zrh
 CIO4s33To9p9nQfJ1BOhojulPP31ZWjDHzfO2twdbi55h+RqHaH/j+57RP3KrFaYCEm0g62hZ6Y
 IOOb2OFxwOjqaLw==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

Add the Samsung ATNA40YK20 eDP panel to the device tree for the
Snapdragon T14s OLED model.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
index be65fafafa736a0401a5872c40f69cb20cfbbd90..d524afa12d19b2a6f22a24b9bed6b6b40248375f 100644
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
+	pinctrl-0 = <&edp_bl_en>;
+	pinctrl-names = "default";
+};

-- 
2.50.1


