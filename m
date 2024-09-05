Return-Path: <linux-arm-msm+bounces-30975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A13D96DEC9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 17:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2E721F248F1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 15:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FE31A00FF;
	Thu,  5 Sep 2024 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bgdVVR21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB09619F498
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725551233; cv=none; b=lUh3O14w+lgHXa7UfeuF7kp7wArn4pdXNzoOtn039pZ34xcte/SwgKH+Nt7Un+K9txnI8oTx57f1Qt6Nb3f3t7libsy1eccYenjuzSZt9T4oUCl1d83Vww8H65Y8o473fmOBLDbHVvMBKYJQglkF7J/mVU6ikake8gfSVg89Fow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725551233; c=relaxed/simple;
	bh=9LdzY/f9gPIq5cGQ2OuX8YKp8Y44UqcskuYC2hrcIqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JuGeb+UjuhCEtu+AKjs0FQJIgcMGYxW6KKHuQ3D0n1sIUyv1sEMIOTix9iBq9tJtc+L39e65GxZjd0uTjPzXYqZbL3BGWqYGhwzve6maZ5/Ewyy4QYhxRIkdB43xiliCJajmgJ8LdE6uKWRe0W4p6S2x9QwEUJHjh4VjCoAS+VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bgdVVR21; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5befecad20eso147107a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 08:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725551230; x=1726156030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqMqYtx2tEloBZSEUBYhT9uwFNjBddWxFXvqtdh8iFg=;
        b=bgdVVR21ccJjuOf/eKdaZ3srs1p+v/zUnb1XkBc5IEGv1MPwVAUb4EUqyS7CaCrh1T
         qNzAJXKXNC4AOAwrgGvSuCBXL1LrjigElp0BDQEWGTAUM8muckyPmuytjC2zBx0Vx11W
         4e2zOpZR4XVaEH9RyT0xYrFHwkCLacVbcaIk5S29GZMShh/0v4PCpul3i+Z7pNrz9Gjl
         YI/Ctwzur8jflVkHuMgosnNjBPcSiN/P38jfL5hGRrBr1LWM4qNpxmeDtWkh4Ay05GGH
         7lihXHqVdIoG/pwx8ZzWsNkS6RrKgiOm4HDE3LgN71IkOm9NZVnRBeq7yjRlXDS1dEnf
         uOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725551230; x=1726156030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqMqYtx2tEloBZSEUBYhT9uwFNjBddWxFXvqtdh8iFg=;
        b=DDyxJhwNBrCGTkv7tEeh3TjzPkKeQTP74JmwkSNcdDmzuatoKxAr+sfr9jsetyZD7b
         WX0Can8XbXfLQ0tuo/2+QjBpwcFHWWvIr0iySGAETI7ZSn8nABH3etdaopx+DuoMjmLI
         vegNRL1yxUAfF3j61YSsDfOxwUM7Owq2mNdf+FvDKVHtZsGPv6JcUkHrQ7CSKt6rYed4
         EvcLgBgUfPk+2P4jgd1mPMfTtvV3GbNUdc0J4vyqp3prIgbnZNXGYBX3UP/hf+PvIG9y
         3y7icUMEDQNf0q7NoQLbxjUeUEg/GH6tOsFBgP6KG+sr+VmvbAHkntuYyro/2cW+60jL
         Fx6g==
X-Gm-Message-State: AOJu0YzlmxkzhZ07NnKMOiKxTx0vH+ZxMnXBzP9zmHB8OZjK0drLdquI
	sujCjjiFkWG+B/ZOIpyplwrF737qVlQcisCP4r8dVEEixLqdA3AmRMltc1q6yJ0=
X-Google-Smtp-Source: AGHT+IEA39sFVULbcShyDB3g99YWZbzD7ZORRmQSqiaa3qOMHJyDeqwQecf9q7OfHQMCdq47ljfDUg==
X-Received: by 2002:a05:6402:2687:b0:5c3:c42e:d5f2 with SMTP id 4fb4d7f45d1cf-5c3c42edc9cmr2164091a12.1.1725551230138;
        Thu, 05 Sep 2024 08:47:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc6a5a94sm1416858a12.90.2024.09.05.08.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 08:47:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 05 Sep 2024 17:46:55 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: drop underscore in node names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-dts-cleanup-v1-3-f4c5f7b2c8c2@linaro.org>
References: <20240905-dts-cleanup-v1-0-f4c5f7b2c8c2@linaro.org>
In-Reply-To: <20240905-dts-cleanup-v1-0-f4c5f7b2c8c2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2017;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9LdzY/f9gPIq5cGQ2OuX8YKp8Y44UqcskuYC2hrcIqA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm2dJ1lTc7fh5BpgJiIR+QUZ/qxai2LK9tsTeGY
 lfeXGkhO0qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZtnSdQAKCRDBN2bmhouD
 12erD/4t4jVCcSIQ6VVq/xLZlFw+eGu2AEPYwSnxZmDsglSws76kjVKFpQBkapUHKdqsOCLK4Qn
 C3YQOTOEcnP+vQ+hN1d2Cvo07pheyJFFp4G2aT2ksRKW0iPsFvp51L/p1TL+toVW0LWGimISv7t
 sU8NJXopq7IBwleGsU3T/Y6Gleyn/K1bT/ZqMiQIDY/ZaEAPq9gEIxRw8fKuVA8Y0Hxrg1Ng5ww
 mnJWJ+zyt7SkZL4qmpNmkx3BWq0Xy3jKWOsJR85vgnMZN3A5ZKeDpIAFr8NsudV2CjOIIr1kpla
 4H2XdgaafQuq8QoGM18SmM7zhhxXN6V32DYUw1KEU0xWVEp4KDreIl7UaFiL2ZsnxgKieD51ERr
 EuyOiIt3c6Kh+pm8CMtOqI+6VpBIFSGBMdlCt0ZULQklA/p/R+Ee35QwLIH3gZPGT2s0LBflz2Z
 QGuLNnjmp7SzlHFp5BFY1H91iykk4H1TrHNnVsyKANxqOphZpctvPr5Rj67wl4+bmBh2pUypjeI
 NY0TEOvm1icJDtTJtm9kZ9BMSgXPKq7uKbLWp1rrX6PWs6FEKZRYIaajYEumtuQ1IEszEp0w9H1
 o0jvfSDf0adgHQwFx6CNZ+JnSKt2BpbFLRqmfAtlEEM02I5Lo7MmYLAVxxmqvoCmwATHCIcOtmL
 riZDPWSekif0ZPw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Underscores should not be used in node names (dtc with W=2 warns about
them), so replace them with hyphens.

Functional impact checked with comparing before/after DTBs with dtx_diff
and fdtdump.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs8550.dtsi              | 2 +-
 arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
index 07b314834d88..f0acdd0b1e93 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
@@ -154,7 +154,7 @@ adspslpi_mem: adspslpi-region@9ea00000 {
 			no-map;
 		};
 
-		mpss_dsm_mem: mpss_dsm_region@d4d00000 {
+		mpss_dsm_mem: mpss-dsm-region@d4d00000 {
 			reg = <0x0 0xd4d00000 0x0 0x3300000>;
 			no-map;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts b/arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts
index 175befc02b22..c509bbfe5d3e 100644
--- a/arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts
+++ b/arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts
@@ -40,7 +40,7 @@ framebuffer@90001000 {
 	};
 
 	reserved-memory {
-		other_ext_region@0 {
+		other-ext-region@0 {
 			no-map;
 			reg = <0x00 0x84500000 0x00 0x2300000>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index 3d351e90bb39..3c5d8d26704f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -98,7 +98,7 @@ rmtfs_mem: rmtfs-region@d4a80000 {
 		 * The bootloader will only keep display hardware enabled
 		 * if this memory region is named exactly 'splash_region'
 		 */
-		splash_region@b8000000 {
+		splash-region@b8000000 {
 			reg = <0x0 0xb8000000 0x0 0x2b00000>;
 			no-map;
 		};

-- 
2.43.0


