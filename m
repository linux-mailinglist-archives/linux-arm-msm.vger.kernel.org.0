Return-Path: <linux-arm-msm+bounces-49261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8C2A43AB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00107188F13A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBCB269817;
	Tue, 25 Feb 2025 09:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kUoIRYvB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B7B268FE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477573; cv=none; b=H/9FCoYuTQIKKvNOTPa9LR/bvwWiBmoM7SIKjUOdRPWURmXK1vjRLVJmxSqieT5cWJIaXQeewYdNPDRXz4G8+3aBmsE2mMiXnURfiq+ObtUO6UIjUV1D2SPDQ8wGJWCxON5tSXUtM729I2xhpgDOmKN6fOSmsg9LHr03Bvf+ulM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477573; c=relaxed/simple;
	bh=RKuPjioiZhGOdgrYzxjxqsqfKyfh/jhQWZg0vK2co2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bKeFWcStU5K2APtfPa5Ilc6p9ZDGkSsOg+I25ybCXDzjG5w2xMTEXGWsyA4gu2TwCJNoR3O0H87BR+x2JVk5Gq5hpw/XEIxW5iOxGYXnMH8R1YRx6CcmG4w9xBAgbnp/MBiikG+j7fnIk7jpCWo98CEExUPKzju1fa1rK4W3AYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kUoIRYvB; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abb76cc6108so68843966b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477570; x=1741082370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oYKEYktLIGAoz2vM+3jSPjj/36LO+Fu09JfKcqO2S8=;
        b=kUoIRYvBBKRwO3Nd5WlWcZcvttqukMw1acnXWxdjE+tkdC5PDsPBDaqt76Gqnvznte
         jAqPpCCilPg2M82HH2iSiiAEUWKoD4FzLhl00G4YVzjLO+KFx0xyfzEFivu1f1JDTtP4
         4N7iCKZGoHJgdjbmiNMXUVHiVSHv/ePdWvkSGqOBs7dUPYRmq3ewTiwebST8g4f64JY8
         TIQux+hhUh34sylWHta7P3GaAeRsKdu1oFkkkH/s3BLw8RJY3+b4T/GM03GjPI1q34KV
         XQ5D+79N9c3vaZqgUPbq+mWb9Sg8ttJr4ihL04MNDSglEQE65dknv2U2umuvXP7AB9F8
         zf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477570; x=1741082370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oYKEYktLIGAoz2vM+3jSPjj/36LO+Fu09JfKcqO2S8=;
        b=NnuFDR9VHg2v0TATV9qxm8nADTa4+r2GyRj/292nTzPH8VOH8RsjnktaA1viihC+si
         7nRrDk6cyJaCOhX57jlgJU5/g3FWfL5gM0zxg3Epx5CC+WMFQ3irjeK1zz93ODOBSYCO
         xtrSIW9JIGgVhtvQAfpacKl3FhRb132R1tyxPemyCTqqtZcrmct2DKB9oQ0EGg7tHu5Y
         5qRT0FSsKraYVqeOHY39GCGBJ/7NDumMS4Me5//895RcbBL/b8fJHFcNN2QLVid1d4W5
         wLpkYH3x3pBl3Oe88JCHUY+pjFIllMDNvtyT2+d09F/XtN2E2YzeYnPItRcGUQg0vh/9
         pOug==
X-Gm-Message-State: AOJu0YwZAp9NrYSv4oU1bKK48yClUxjWPjgNJe1rmZEbJVSVCoA5+ZqR
	TEA6M8oxDrUd8yuLsUF0HnZskmtVkCmfnHk4GhTcFRXu0YMoKf78o/kvizn3ptE=
X-Gm-Gg: ASbGncs6BSVTIA2b9Z1dcUO2d5F1VxumusT680G9lFy0IN/+uCQu40aa73gtxaFF7s9
	UMteofZKrE6w6M/DaU3F+A1JorSNi5KuCccBsedVgJcFZkYeQDQq5j60y6tIKGJv5wA/wVd6d9t
	9aecAdPTN4fqhm8NVA8u255l+9fkvT2JBEf8JgDsBKvfy7fByeEa7MNySs2PiRocziruyvTfgdC
	sy3FAGKHVHyT/6xLzY4sgKSY+Vi0t0b8bS3HhDJELAq9bd8QIIvuENPoi5ic3YiptixUk2Mi0/p
	eI6LDiigJv/PF/uEpL0Jv8Bn+he8DIY0NSvyQBBpWLs7m0XBLxS4GESIKkF8Oj+PDbRfEOeTniV
	R
X-Google-Smtp-Source: AGHT+IE5J9BOgHuVxdD6dnB1X6wTG9bRyUbtIyIBtFh7ZpxaQ0KKSfCbGAzBrAHTKHaG+uR7b0/L9w==
X-Received: by 2002:a17:907:a089:b0:aa6:ab00:7b9d with SMTP id a640c23a62f3a-abc09a43223mr659666666b.4.1740477569658;
        Tue, 25 Feb 2025 01:59:29 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d59391sm115164266b.56.2025.02.25.01.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:59:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Feb 2025 10:59:06 +0100
Subject: [PATCH RFC 09/13] arm64: dts: qcom: sm8150-hdk: Switch to
 undeprecated qcom,calibration-variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-dts-qcom-wifi-calibration-v1-9-347e9c72dcfc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=958;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RKuPjioiZhGOdgrYzxjxqsqfKyfh/jhQWZg0vK2co2A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnvZRuNOxocprZJjU0ihXilQ8pH7MPFURjGP3Tx
 He1Oo4t45uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ72UbgAKCRDBN2bmhouD
 13dHEACHOHhA938NGZwxNWttskkKRw9+0hZj9LA/5p6glURtKnaSNLi8+qLjKjaHkkPySuJunra
 gbq2BwVuSZAQCrhbXgp+V6ftyI6Nvh0bflcjj0sD9pGGFwaF86lToMidku+229AzB7aphTJj1Ko
 KHDBJV4MvTPd+53TbZVFyN13zxyQS9qGG+plnGOVisFHNCz2qZDpC4OW1nmg2VzOrsQVUT8or3f
 TRV2SaRA2mPva/3sC/mWBk9yyWZG248gINEodRFrIkB6mVTGxMP4Nkx25zPlk6ChwaKEIvWMbBh
 VQttQ4vn1+QFgqkGTObRIXMpwubEkhvl0nOGxZM/h3pNCj5S1JVfjof/BOqLjdmcjFEVoJh6Jxx
 0r9lH91GsnVSbZizDWSAG2HZp2ARb+3XfdJG39moG3ZYa8RlwpS1HTEKumzar2MPDDZC6SbVgUn
 LTcBeDP/eCdatN/NHpArVpfV1dkbQit8B/PGDBX4JMaTaqPKFwjVQKXJrX/edk2KbqcvdRKTPsX
 nZvbNmC/nRWE9ECfEmqj+qOyEX5FEY8n2tr06FtScgVwYo1jVl0AwEEzbq8I0LfAk5tEceytD69
 dMXBLt6c5OkML09UVxaZRe6Ct0PISIXheNVmXnF1BtJ6crC57OBDSdjlTJ4uYd8CL52gvk9Lwzh
 +bqKLh5dQQONXSg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The property qcom,ath10k-calibration-variant was deprecated in favor of
recently introduced generic qcom,calibration-variant, common to all
Qualcomm Atheros WiFi bindings.

Change will affect out of tree users, like other projects, of this DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 6ea883b1edfa6c511730550f4db0cb9c25fc633d..9ac9854b35fd157e0735aaff4e0bdbaa8946e0d5 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -719,5 +719,5 @@ &wifi {
 	vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l11c_3p3>;
 
-	qcom,ath10k-calibration-variant = "Qualcomm_sm8150hdk";
+	qcom,calibration-variant = "Qualcomm_sm8150hdk";
 };

-- 
2.43.0


