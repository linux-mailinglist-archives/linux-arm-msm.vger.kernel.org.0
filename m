Return-Path: <linux-arm-msm+bounces-64829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A510DB040B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0A5D4A3207
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 13:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6A12580E7;
	Mon, 14 Jul 2025 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SBGh9rXO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE3A2561D1
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752501327; cv=none; b=DtCSfjQsBQPG073aBr9GPn74ZtGn/VwY+3FqVhR6HxFr/xSUu9aCGcDqt6bLuQrxZYgwdKmAM5xjEP4z30jIUYaydrCRG59iC69khji5dqBa0f2WM5wFtt0wmCXuqcrc5UyKlqqs6pbAR4qLwmjH9Pz8I3Lke6qR/i0L8gDCfVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752501327; c=relaxed/simple;
	bh=U6vdEfe7eEqqK6fH9n+kZgrS8otaRD5ZuF4/mbw7luQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLigNeZGko8taTr+i3GCyK3vNNqJDB11NeAudwZzYiml2f39alVgIQYD+wAdmWqz+vhYIEYqWlhx96IBp8CYFoSflLx6IFs1o8ycw9widtw9gXGxpJP10AlMkR7oLppMT5ak/kZYhAWoceA9ht4p/5xsmYLMiJ2vFjiXdwiO6p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SBGh9rXO; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso226180f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752501324; x=1753106124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+exwkn5+6FAjeomS833hx9Nw5MjZVYQZmpGmTX5gKo=;
        b=SBGh9rXOP90CU41ouXO8LYNqxvxziYHUlIphXb3ZJc/gXGIKBiQo/Q2RiqMbTZRfOu
         0tFDmH1qbeqlPomXi0p4g5O+j69xk729+IFFSb/tcK7+/0wxsi5pA4KoSaIiq1f+KVc5
         nRF/g0jkH+6eMxvUByiDDAcvc9uWiA7iLIe5+9GyYRJNaajYaQmXWaP8iufRu9rYxKaV
         d5C2RrqxrLcfxk9pmD+ifwKJANwsdLIeQfgXwXXjDLOB5zsrwtIIKfY5ghcysldGTMWf
         lphDBFoOb94tl7YzcwJRgUtXbhq7Su3RK6pxAXY2f7P+snvPNGYwiIvjlpZJMKZKInX4
         4kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752501324; x=1753106124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+exwkn5+6FAjeomS833hx9Nw5MjZVYQZmpGmTX5gKo=;
        b=vwDiZieVtqkHiP517I7B8jq2pbNU3Gpl72OpgYBeNKM7IBNKcr4wEo1M49r9Qr+0Ia
         WPJQx5iS50RraDaGCu+jz7T3Bi7LYRf8m4PaUpVi6ABWNjK5G9qibaCaPos/UixhueCl
         6Om7LZo0lqIxkSnTVk55sX0AyB2gM7P15lM5Drub7be7dbEdttR7mnisX6MjyeCu3ubb
         O3tk2vxh/WzjZGQ1UW/+q9PZlnQyw7TXRMu1C6JPOn6gbZPXhl4+m4gRwcwH28lee4qs
         Zgm7HIfwY29aDy2oDNxP911/oteQxYhYKNq+5KSvxXUw6Es5nlDDoGAmM4h7Zu4rwKrm
         SofQ==
X-Gm-Message-State: AOJu0Yw8BMOeuX1GXdkmsVrhKz6l8VFhhvJOHI5Sa87qUUdvxeMgtrxW
	NmJ+YkGiS8jYOeDYYXuE0tHZRZiHQ+6dqe/9kgK/RtvYFuDjPgdxJ6nBUs2ikYbetSM=
X-Gm-Gg: ASbGncvFbXt5Hxj+/zBq/gUCyyBDiupgmoSYVwnHeogrfrD3UFdJ91q66c55BfUKCqd
	SbErOFoVAwHb2SrXMsVK7X6tBAa6aq0HGtWfCzpvDNFvAcB9RaOftXSdBs5sHBocdeIOm0VC8zn
	XFAeaaUQCLmFmk9XnBPUOK5TT37ssT8vLFjEq7ZSSKFZrFEPYeNtjRW8IzfU0z82FULZsf1bd2B
	DY7ZNXeKYd71ZW0ly3s7f1XicEQNLYDKa9xEbKQwShwiL5InkgmnfbCjV0XOsHkpT2ETtKgjEMW
	Ga7ELHx1UhN0VA0AKZKGUghllBkZOu3kPBr+9l8g34dDwt0wTFuqBu6I73BPiL21t5bt4MEZNE1
	c2n2XKfIrL/fXy6vQeik060bneLjstDUb+VGr
X-Google-Smtp-Source: AGHT+IGN5F9lGSNHk8ElMvikHLrdDkpF4jgTQ1Islu28FbyWWuuZDHETIrYK9F7PtGhmec77qA9Pug==
X-Received: by 2002:a05:6000:26c8:b0:3a5:324a:89b5 with SMTP id ffacd0b85a97d-3b5f2e39d5cmr3318899f8f.8.1752501323841;
        Mon, 14 Jul 2025 06:55:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5037fa0sm172291575e9.7.2025.07.14.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:55:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 14 Jul 2025 15:55:16 +0200
Subject: [PATCH DO NOT MERGE RFC 3/3] arm64: dts: qcom: sm8750-qrd: Enable
 Iris codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-b4-sm8750-iris-dts-v1-3-93629b246d2e@linaro.org>
References: <20250714-b4-sm8750-iris-dts-v1-0-93629b246d2e@linaro.org>
In-Reply-To: <20250714-b4-sm8750-iris-dts-v1-0-93629b246d2e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=U6vdEfe7eEqqK6fH9n+kZgrS8otaRD5ZuF4/mbw7luQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBodQxGbTWyaBxv/bqgY3HAsANB+pukY8Z3ub2VP
 4vdlxGG4DiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHUMRgAKCRDBN2bmhouD
 1yV0D/9gB7OmVyXChYn29CO2NYuNH5pe0JjHhmEkdRJ3iD1A3A0++uh0PZhDN+ZfWM5KpzruI4Q
 r1qEvS6v8hlopbc3b4wL4lYUBN3za0+gSiu9SZwJ0TL4uwPE3hnAaal1AZBuAAdXZcGxC8FPFVI
 Euxygw8myqhoqgJaMWz1ZjPT0qIPthIeYh6TgBnARiaQP2wcm4pmbDycupyIBYFoCAw+zj2SKpJ
 j9GK29ylES2ahY9DXJ+aZufjvUH4NU+KCatbpjNmJVvKNJrJugw5y7JJZFwhgola5XQValMCZqF
 dHBT3vQ2vx/2lR/zR1JuNgpxz9cIQlGRDKiqHB30v1FeDdEYLutIm3nTlxYpw3b0SK/4IQo0epx
 mStP009nY9h0q5AUxfVtTwFG6rixOXBDm4o1rGkFI1Xee+UEkF6jYbcxX1CxuV0A6HlSgPEuLwr
 Gce+Dv3EJL+NYWONsNxg2bm2RWG0gPy/gQIndX9lWno44+sGCgB0RKTkggLDUtLznCqvsv29WVy
 HPsofWkUOIWIwjykuz63MwUj1rS56q7ti2221j5MM0q0wOhY5r7wpsDBRVi79ecK70zTdGwelRK
 i6CAfNIErAumfSkM01HUyR67QJW+r2vFEhVFce4/FQeXQJx0gJrq8yV5eMlR6kV6gKEVb3zatIB
 j93F+A2KrfoSaVw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Enable on SM8750 QRD the Iris video codec for accelerated video
encoding/decoding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Do not merge because firmware (hard-coded in the driver) is not released.

For Rob's bot reports:

qcom,sm8750-videocc bindings and clock headers dependency (will fail
build):
https://lore.kernel.org/all/20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com/

qcom,sm8750-iris bindings:
https://lore.kernel.org/r/20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 13c7b9664c89cffb68a1f941c16b30074816af8b..369623f8e4c921e99532d5e22fe9f0049746ebaf 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -813,6 +813,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &pm8550_flash {
 	status = "okay";
 

-- 
2.43.0


