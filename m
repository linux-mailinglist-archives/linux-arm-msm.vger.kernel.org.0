Return-Path: <linux-arm-msm+bounces-25470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF62D929F62
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 11:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 510921F2433C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 09:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1FA8005C;
	Mon,  8 Jul 2024 09:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i3jIcC4c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839367E766
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720431591; cv=none; b=luw043srDhucIkWiNVoyYwuP+30YQTle+3E6GQJtKvgxS+QtxXsXkrMOkBID43M/4/IdWvPm2kScH84ANlwYEiYQ1WuuJWKL3ggb3u8U8e//gqnBtuuShn75FghWaqoBEseHYAtZrs6mxeaigfAP9MYh+3apkqQt4bhJsoI8ESw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720431591; c=relaxed/simple;
	bh=x+REoia1SPVixROvzFdazwCRh5mhW9XzZbQzMlPar2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sKrRRJc8xVjPeO+uBQa3oxeyG2aCPDesHG4RV8ZBUKBUGtUl0SIkX9A30fhzRy0FeO3HwGgMEdowj767qDWFkx1zh2nXmA5QHgINBSWd4C3Bp6d7PhpodyoKag7Vyc25MGXVGDC402F0L7oGTpVNEvt0FWzYcYTAhXJeKL20Pt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i3jIcC4c; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4265ddc879aso12485485e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720431588; x=1721036388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xo8BvOJHNg5KkElAnqbJxKoNs4vF5XqhPo69/tFmIJc=;
        b=i3jIcC4cODRRa+XF9L/yYxQffmSSCtsBMAsmvCNUzVVht8gH1EGSVZB36ObUTypG99
         J45i05tSAFJAVQEIVSnFjxfkvwwF2wAZ3cyRZW9y6hTuiZNx8Q/zqOgyTLwcT7s9+0dr
         t1kGk8zS8/ctwT8kDoB23rYM9cHnKUUBrNcf9kwcrm2F3LaMpxU0w9bcEc47GNNkgU3C
         AtemdtDMiab7Y/aLQ5mDJwSYoWz3dsZAS1y/d49zAdjYnLkWllcTjH5/GtfCej5r+wav
         /Oky6vz6QBwcioNqKmMV5BE/3Hnl/WyUXLfxybqduuyVO6hF4dStAJlozl/a5bwhd+oM
         E1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720431588; x=1721036388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xo8BvOJHNg5KkElAnqbJxKoNs4vF5XqhPo69/tFmIJc=;
        b=YwVYIb202fx4PnSM2xhJFcyhIWX612Zkjrcw4Us7h7zsMjMJ9TD/1UbHCzYsEVeEo7
         eRsSqnFpm6xOfD0K40iU3+Y8O4c87mMcgoBh9egcj2tQ5WS/GDtayKnVJMfhE+dGH3DS
         tJR3D3uNR2a8z3JdFnRbTw2/zJWEcge1SmYsMBZ9MsdGJZCFCTc9fjYZ0pK4/dAQ7j1b
         KvXPlJJz6TqnwWjFEBw8PSCnOuB9tvPxeT+gh60yJ18GVl1QwKYREguHF+P9b/XgYi4d
         UxP7DeduGfLYNOQLoz4rrJrJhA62Lty1aHuPM1StAJAKZNTBn7Mds4XckKxMSxXF+fie
         3xOw==
X-Forwarded-Encrypted: i=1; AJvYcCWM6rkgWD1y0ChNJFwNTaRk/+EKK7ltmeiVeGlNj5OWDeACxwEXZoCMOn7GXhBFkIemEyNulM/f6UG25BvyeCmRqzLOEVKMcAwXqu3QRg==
X-Gm-Message-State: AOJu0YxAPbJFJIX6jn9oc3WU2YNL314+wOV/AMuZP3nAlCXd0dPzsV/M
	yUpeewX7G0YgiJ8P6FQPetSX+X+uQSqSuhm5mJdo7IrObrrc1VREfCzd6iJ/AtI=
X-Google-Smtp-Source: AGHT+IFX4NmOMlKq6u6ELmSfHAdUOXEIC/NFVGVqPUkBzbvs1KI8EYpyG6LPnijLV3R8h9eDbqBeVg==
X-Received: by 2002:a05:600c:1d1e:b0:426:5dc8:6a63 with SMTP id 5b1f17b1804b1-4265dc86b5fmr41077435e9.30.1720431588135;
        Mon, 08 Jul 2024 02:39:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a2a3:9ebc:2cb5:a86a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36789fd7a0esm15457779f8f.104.2024.07.08.02.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 02:39:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 08 Jul 2024 11:39:29 +0200
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8650-qrd: use the PMU to power
 up bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-hci_qca_refactor-v2-6-b6e83b3d1ca5@linaro.org>
References: <20240708-hci_qca_refactor-v2-0-b6e83b3d1ca5@linaro.org>
In-Reply-To: <20240708-hci_qca_refactor-v2-0-b6e83b3d1ca5@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kdQldVCRGhnIPxVPu3DpUjVdb4CujtCOUfjhf5GMlEY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmi7PavRvoDk+qu9H80Nik2zZsdjGSAEOv4dUvI
 0g2wBXIniaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZouz2gAKCRARpy6gFHHX
 ctu5EACHDBOa9Md5wzEatjgmUSsIFi4954ytTWLBcm08mGigjLZL/YnbW/11UFU1fk0ScjmfjgV
 xpnC75B6+u39wTv65J2Txd7rg+vQ5fCnTWdEzPOiy55PeYyX9GvsChbcZCMEXNcuJrOsWNCA/9k
 6wyiXs5oNi6bPhzQmNlOb1OGER30tNo+GfyM5kQrHCdiVRLm89ecaQmzM1BDg01SLxRoeSw0UuU
 uYA4QOfGirGofHKScWT6T7cCVDS7sDkiyOEuUrvG2y0z32kLJeOWK9AbfXzMQzk1yEP8zUsTuM6
 6LgNCQhJXv65eY05hC6/L8OhZ4CrswKm1lv/CC237u7UWQnzDwYko1zH2By1FznAmifMPOlDJxh
 /jWq0CC8H5hg/tuihuw2f1D9DGmoOYiVihtP4s5KQdCOhrjsj923jcd8/b+n6Ufwks6hrNKoLs+
 7fpJBiRI5dhcWpB5WNf4w21FC3Fca/0QnoOZJgVEa+Wc39yXBrg5kr+r9TECl1URtDEVYo8tf04
 dqOwDMmbE+WOoskCUpfAE6IbHbsxo3A5AWmy76PqWuoKO2DKschrNYNBHmYyyZfLatXqpnN4TLR
 lvl8L10cS9ZMWiYMcsX7cvYjd4rr/qb56WCw2jfBSXPMEfuN3MHOSWtxSGZRv2VYyxnoOU6Wdf6
 rGYOfmIr9iUq0LQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Change the HW model in sm8650-qrd.dts to a one closer to reality - where
the WLAN and Bluetooth modules of the WCN7850 are powered by the PMU
inside the package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index b0d7927b708f..8ca0d28eba9b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -208,13 +208,10 @@ wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&wlan_en>;
+		pinctrl-0 = <&wlan_en>, <&bt_default>;
 
 		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
-		/*
-		 * TODO Add bt-enable-gpios once the Bluetooth driver is
-		 * converted to using the power sequencer.
-		 */
+		bt-enable-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
 
 		vdd-supply = <&vreg_s4i_0p85>;
 		vddio-supply = <&vreg_l15b_1p8>;
@@ -1255,22 +1252,15 @@ &uart14 {
 	bluetooth {
 		compatible = "qcom,wcn7850-bt";
 
-		clocks = <&rpmhcc RPMH_RF_CLK1>;
-
-		vddio-supply = <&vreg_l3c_1p2>;
-		vddaon-supply = <&vreg_l15b_1p8>;
-		vdddig-supply = <&vreg_s3c_0p9>;
-		vddrfa0p8-supply = <&vreg_s3c_0p9>;
-		vddrfa1p2-supply = <&vreg_s1c_1p2>;
-		vddrfa1p9-supply = <&vreg_s6c_1p8>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 
 		max-speed = <3200000>;
-
-		enable-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
-		swctrl-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&bt_default>;
-		pinctrl-names = "default";
 	};
 };
 

-- 
2.43.0


