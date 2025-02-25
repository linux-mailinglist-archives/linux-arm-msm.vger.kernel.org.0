Return-Path: <linux-arm-msm+bounces-49253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2568FA43A95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2DA718905C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC25267B6D;
	Tue, 25 Feb 2025 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HOrg2UAo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BAA267AE9
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477562; cv=none; b=rn9TkNx/rZBcj85GbA9Am4Xk8FegPAyayerUcTNIX4Q0nFatf/M5w13P/MC2CZBheqJabvBydEtMVT3vD3JZykQxdFhu/YEZ/wDojwKo3K0GrXTsjgjRTJ1dFtGC3mdPcUHh+FuyblOeS0m0f0ALx48ZluZYA5YxN4xY2QCU2s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477562; c=relaxed/simple;
	bh=uAkOhFz/ds17g3Knhh8kOV5Lunr6MCa4mPjSf1FPgyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LKBAgPE6tFVA73j6qlf4ot/OApqOcU6kkprJMzQd2Cdp+EIIWHMRDJOD42u7NMRsxqBiTu96oR6gXOIVacLLBDEfJHOSgnSJDezyFgXM9RRYKvxczpHvqh1lgxvUh7rh6uxw9q9a4G8DVUu0PX4w1ZSo/I0gxNMDx6LBqZd6ddg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HOrg2UAo; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abb7d5a6577so59223066b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477558; x=1741082358; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGYXjJK5GAqb0O3Fi6psK47cB0ARpE1CvBe6Vy83cDE=;
        b=HOrg2UAorOzIzZWLy+4c/WUYnsAjOIHiCgHuPE37nm+6/FXMHlnbDsguNMfRGHJfR6
         pYL04jpJ8QeO9yQl1nEmVodxrxkZsMS+cA3ZTBVXyWzV1ZRvwK0fHpn6jOS3WN63ledc
         3+ZR6aDxzk2/s/nEf4fP2qI6W717ZSC5q7oVu0mbIIvc8fa0O4AiIDTGSVOkaOgZ+icT
         CLJ/KJB50KvfozMOPTkOGvj0EOboEolRmswtUNDna4JZ1aeVDGNvkZP2YYeSZXXi1iSG
         Q4JIP32IljOXjLT6yqh/bGSWWP/WvS/tKDb6tWQHmjUiMBxteJPNV1dcS1OafXjBv132
         dyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477558; x=1741082358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGYXjJK5GAqb0O3Fi6psK47cB0ARpE1CvBe6Vy83cDE=;
        b=aoqc6jgP/Twyzz5hf9uHNrzXiCNcFCr2b4WrqwIfsbS9Mhmrqfpy7VFQyNbzpdTab/
         gm6RV/KKzH55euOJMV8fqYbCCZt+gSZ5d8HSXrO+Y1TqtTaekxhKXnY5MYG9Oi+CgAWK
         XaW5+N5+22g7R2IRs4LW6wd+t8sECJJ+ILAaKrQ/fmSNNVKqdbnYkRcZctu8XYy7cJI1
         os+U3WWcS0i5XoBNGdr2cs9lFVd0MlYmCpqWIWnnsRpI1HFUDi8DIkVM7eBMZ2CRfvbt
         HFi7RltM3fWAn+b0Gm8rbaHuXsQJjhcraAS/beXrnhkES3U1lsZuM9pB10ivs6Y609wW
         i03w==
X-Gm-Message-State: AOJu0YxSmi/CevhKnB8DCcQriMM3E1xmpDOGhRfsyZTsfkTlxwaqQUlf
	GJz1efes67lubMFmZqK/CU65E9S7E57N+hck2AgIYFnaU8bYAb0YJ1BSoCoyfWs=
X-Gm-Gg: ASbGncshPFZYAhvwZXpkd3TzlU74eLgrhIJn+EcDW4Q7encK+toCqKuMIuFIoVQs2oc
	UH7DcFATBHhaNTfficdT4jYEkhq5TpQgBLaFZt+dQYBoZiBCV3AIoq/pYTDcBlppy8sNd2FiBxB
	EH+CnxjUwhfYcdJGDF4yqWCF5REd5iJiCMnyM5v8VDufgFKK4IQyMPQcRaIdOfh2x3MjmOA1vbi
	RC4Cd11w5rJ0g67T6lE1yC3dNxjLpa+vFN+hOVIUBsAxM/PypUg8g/wOgccOGJzEBQlt1SSu9AA
	17wLMU1k6JehfPjVsjeBF5MNWbrvp8OU28UfLsWdV6YtHgdYIX3GaLbnlOwEs+hKsTwJp+1ia+7
	P
X-Google-Smtp-Source: AGHT+IGPZgZbUGuhlmSdot/dlN0kkHRXF0etmolx4ezj3a9mEEIY3EVVQJAq6p2bTXw/cPoTWQuzlQ==
X-Received: by 2002:a17:907:2d20:b0:ab7:bb4b:aa49 with SMTP id a640c23a62f3a-abc09a0bf7fmr683713366b.5.1740477558264;
        Tue, 25 Feb 2025 01:59:18 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d59391sm115164266b.56.2025.02.25.01.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:59:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Feb 2025 10:58:58 +0100
Subject: [PATCH RFC 01/13] ARM: dts: qcom: ipq4018: Switch to undeprecated
 qcom,calibration-variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-dts-qcom-wifi-calibration-v1-1-347e9c72dcfc@linaro.org>
References: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
In-Reply-To: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uAkOhFz/ds17g3Knhh8kOV5Lunr6MCa4mPjSf1FPgyk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnvZRntN7+lecd4kYjDPj5WYLHzHSKoereZFnXh
 Z+kdlHhasOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ72UZwAKCRDBN2bmhouD
 14AfEACG2KZRsffXm/8B5gJnyrqbgdOxVyAeEZvbVoTI+iKgme4C+2XbjMFF6TppWcQMndwIVSn
 riS1RH0fSbMKm3ODlPLpaqF1YpP5f2qIuC9E2Ek/QkvlXJAt72+v6l1qhcQjrXm9lKdP9XCQLeb
 JAscr1yhfZb+Vbecjj1cV2tT+8MCi0NWEzUSG2kA1xy4vqDGiMZyiCsn6ugg/kJdp9Bn5LjdzTP
 KcooRK7ZtKVHII0rs9K2wUrKYgvtlLEka98eJk1HE8YrSng27lR5c3XhFZt1KlACilDQ3Ll2oJV
 GXpiXfV1VQphJvHIUj6YkLzV9ewzemE/r2YEtB89jAA3SdSIN/5NW942yn3/gZ+eqM9jCUcEEvk
 OofZeAL3qIYCOP9u3x4ONSl6TEyAGsUvH+RcXIfEj55frQkitFKzQOPiSQiQAKHlfQ/mC/c+VDX
 uO+eT5LnpjOSJtkKctLaS6OwKKZUWzr3qClhHRWa0oJkt4/kbsCy0LNHD7s1ReLxcWfXXVJ3bfN
 eCGlvB3owazdNeGJxPW7OCCgnwS9PKoHP+4hvRhSlLA0R6QB/AeIm/IjbycJaxCcvFA/tsV6ff5
 DyU1pCtB80ymJtY300cLt+MLL/3xyA+V+LU1qncghQQOpg0RjBoGZlglg5CtMI57mWMm3wmBA9E
 ilzntyWtHzEx/ow==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The property qcom,ath10k-calibration-variant was deprecated in favor of
recently introduced generic qcom,calibration-variant, common to all
Qualcomm Atheros WiFi bindings.

Change will affect out of tree users, like other projects, of this DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Please do not merge until corresponding driver changes hit mainline (see
cover letter).
---
 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
index a6d4390efa7c394398b9b6b067c9e64b21334cc0..be76bc39ac2774fc5eb3c0e92844eb609b01dba6 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
@@ -251,7 +251,7 @@ &wifi1 {
 	status = "okay";
 	nvmem-cell-names = "pre-calibration";
 	nvmem-cells = <&precal_art_5000>;
-	qcom,ath10k-calibration-variant = "ALFA-Network-AP120C-AC";
+	qcom,calibration-variant = "ALFA-Network-AP120C-AC";
 };
 
 &usb3_hs_phy {
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts b/arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts
index 6640ea7b6acb2f1d3002b52b25ef327cdc8a5bdd..15baaf0d1529875a804bf3662fc66bb517bc1f11 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts
@@ -179,13 +179,13 @@ &mdio {
 &wifi0 {
 	status = "okay";
 
-	qcom,ath10k-calibration-variant = "8devices-Jalapeno";
+	qcom,calibration-variant = "8devices-Jalapeno";
 };
 
 &wifi1 {
 	status = "okay";
 
-	qcom,ath10k-calibration-variant = "8devices-Jalapeno";
+	qcom,calibration-variant = "8devices-Jalapeno";
 };
 
 &usb3_ss_phy {

-- 
2.43.0


