Return-Path: <linux-arm-msm+bounces-19076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 709238B8E12
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 18:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2758F283754
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 16:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFAB1339A4;
	Wed,  1 May 2024 16:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="liH3yCIL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D521332BE
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 16:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714580398; cv=none; b=mjjx4Jy9HfF5y0grYdnAF3aTqgA1uv93SkIZj48gf1Xz0sBN6bEP5mLwr01yM0V0GXIQG1ZKdglfFyKr79uM3zEC0XoNX4UmSH8Tn8m3PSAdswB0krpTzZPVrG+R6eqKgq2f9zjqcMcjku7Hx9letZ33Nr6OOVsU8B9LdnAK1ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714580398; c=relaxed/simple;
	bh=ZyhemyLIYzl0yFINT+7/a2RvvKPGInbzW42JxBvs81o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lxZmJOEphfNL3lkr2tgfrlvyMiE0DMIxeYxuQY7gBkZYK2VaGud/CEKn4u4zosnAtLGRe9pCmkBVhT4c8k01pAsKW473GW9BI5HCZT8TtSGfgnHPTjVSTDDuzlw8b27F4dHrmmzTjGNt1aqoBCE/NvKGvOCWr2xvHi2/Vci7jYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=liH3yCIL; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51ef64d04b1so276280e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 09:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714580395; x=1715185195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6FF9R06GXOtRyjyQmdyGdOb96UxXSLO+caPktlD7cek=;
        b=liH3yCILuQSrWLQ5QsWsKFlNnWE+I6QLQohs64qe80QVtN1c55Z0eoYWmG+w4yX3O8
         1FJ66CTuwy8Nqnf+qKpyrRb8SpiG+C88VjhrcS8EFvWdTyJTH/x6IBucshfob9hlJknv
         EzAweQBaorGmbPgfnGnhSoHqyIRvi3l9qPrz+CYtknBrlzDVQSzFj1g56iOJDUTcaFSO
         Kib5gL/3qgfK/C7tiqC5ZMtfCBTwAQAQxno/INp2ycp7AirxhDY7X5qdw9TYXYbdWLyS
         oBz2lm0Xe6ot5ng08UhOXtnG4Jdx7AVQukVRFBWm6bseQmpor48RTjw/ItC1fAc1zdFV
         ecsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714580395; x=1715185195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FF9R06GXOtRyjyQmdyGdOb96UxXSLO+caPktlD7cek=;
        b=LWAGTIoHxQDZG4H5lmoeWy+Kv8iJKMUoduvcuX1ZudnRExnQDpGgopohxFv3zPMC8V
         l9JjVFJ8f1ElmY55HnFTqmUdOZGeZHIaKngVYtH/rDaAK4Xoa8w1jC9Mdp46oa2mKPln
         mTOwWkCpVMLSDtuJU9AfY4MCH1s1+uH+vD0NsOzAM+/zLzE31uExIMMcg/pI7+xtaBDB
         OAkDntoOi9f6ZGHeT/ZQ64AfOEu8s0G04Vogd/CqfLjBQqxx3Ed5bAuGjfhKtz3aKbkF
         aBTL7cf/YMXLZizFDKtQc85Ebe2IxSQMfvK5Uw0uhf4qoElXekRsXnOqhf1IgVu9O7DA
         K/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUAKup66FZjJGQNHk3Ly4OYZNJGkFU4qIgeRIJZey03UUaeapG7tVYoobbZWiQUO+zdTmzoiwxMNrfvrnBV4RzEMi2hFfjZJh8K90ttLw==
X-Gm-Message-State: AOJu0Ywy6dKGsplw9XNHwkVRIoYOVknE+p1mUbxgHakKFpbscv6x9jQF
	hNxBuZKznPkOLNHEJhVazFKXbvPRE1MqiOyk1DdqfHEMb6jU0/QoHb8wr7nwy/4=
X-Google-Smtp-Source: AGHT+IF9IIAIN0iT5QCk7eZKT8YY1J2+6/5AFhPa96FrJyx8CVhDdS2uo6xfnAyLLVjblrMc5Lo77w==
X-Received: by 2002:a19:434b:0:b0:516:a6ff:2467 with SMTP id m11-20020a19434b000000b00516a6ff2467mr1809204lfj.0.1714580392994;
        Wed, 01 May 2024 09:19:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d30-20020a0565123d1e00b00516d0029383sm4909306lfv.28.2024.05.01.09.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 09:19:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 01 May 2024 19:19:38 +0300
Subject: [PATCH 12/13] arm64: dts: sda660-ifc6560: document missing USB PHY
 supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240501-qcom-phy-fixes-v1-12-f1fd15c33fb3@linaro.org>
References: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
In-Reply-To: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 David Wronek <davidwronek@gmail.com>, Andy Gross <andy.gross@linaro.org>, 
 Evan Green <evgreen@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
 Iskren Chernev <me@iskren.info>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZyhemyLIYzl0yFINT+7/a2RvvKPGInbzW42JxBvs81o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmMmuaBJdyWhG85+kYvWZOj3EctnoMvwuxbEfHi
 UzocJW6VMOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjJrmgAKCRCLPIo+Aiko
 1U65B/40D3wYKAUWpOTQBQ/Y7MvHR4fbNmoSnTPfNnGgDNpBTYDGpXRqJTXmGEZI8/95jCR4Cab
 DSgu7xVOhkx+pctCP8Kg1QkUSYwAplpD0y6zFippmyVWkPactLwo9x5wl/PgPCJWzCk8VYHPiHt
 Aiv2sUaOxL17QsDkBeFVV/AgoW2USJ2sk1ZiCx9JsyPsotyl45s/Zfl8SaV0ghXX8xF/z2aU7TP
 s1Vui1GVVove53scROHkZXz6PD8zxdC6QwRVxNyBzPg+m/xLwnUj0ax7A6Pey1WZkp7LOkxS368
 qFIio7ruvBNFah1Vopequy6jEW2ojq2ncxxZisSe7Ss3Eiv6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On the IFC6560 one of the USB PHY supplies is the L10A power supply.
However this regulator also supplies VDDA_APC1_CS, VDD_PLL2 and VDD_P11
consumers. Touching the supply causes the board to be reset. Document
the supply as a fixed always-on regulator.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index 702ab49bbc59..60412281ab27 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -96,6 +96,18 @@ v5p0_boost: v5p0-boost-regulator {
 
 		vin-supply = <&vph_pwr>;
 	};
+
+	/*
+	 * this is also used for APC1 CPU power, touching it resets the board
+	 */
+	vreg_l10a_1p8: vreg-l10a-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_l10a_1p8";
+		regulator-min-microvolt = <1804000>;
+		regulator-max-microvolt = <1896000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &adsp_pil {
@@ -220,6 +232,7 @@ &qusb2phy0 {
 	status = "okay";
 
 	vdd-supply = <&vreg_l1b_0p925>;
+	vdda-pll-supply = <&vreg_l10a_1p8>;
 	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
 };
 
@@ -227,6 +240,7 @@ &qusb2phy1 {
 	status = "okay";
 
 	vdd-supply = <&vreg_l1b_0p925>;
+	vdda-pll-supply = <&vreg_l10a_1p8>;
 	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
 };
 
@@ -464,5 +478,6 @@ &usb3_dwc3 {
 
 &usb3_qmpphy {
 	vdda-phy-supply = <&vreg_l1b_0p925>;
+	vdda-pll-supply = <&vreg_l10a_1p8>;
 	status = "okay";
 };

-- 
2.39.2


