Return-Path: <linux-arm-msm+bounces-36787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 226E69B9670
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 18:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBF9D281B5F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 17:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997251CDFAC;
	Fri,  1 Nov 2024 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQ57S0HW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32711CDFC0
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 17:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730481575; cv=none; b=hzA8Kfis7+EBv+2NucY9fge7dLAbqZY6fYn9iKWoGloH1pfmNT1VVcfON9pF2sIPGWNRW3Xa5FKuiL9Y6FUwhYs7tJqEa8ggELYC0ze1REP48vyvJ5HSiJiuo3jWaru2X+rp6+uta9VOaZhJV9S+UudJF48p+c4ezKmesqtmtG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730481575; c=relaxed/simple;
	bh=aohspfFLz01Bsoz8qiz0rj/BTMlKJDWhcBWm5TdNfts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fbs9lgBnbu7QTB5fOaDCDdNyqh8plem7n+hjw8YA2ucwsP21eXmqbhY2B2ITzyXrNZlhCgGcj6DKN0ROh4S5fzQjO4y75bnh3hZKwqhPbXl5AeIk5ZPbLqfGHrMRac6f3h+q1vUXuB/XBP85t6CAtx/mvoOkFgwyq+Q00e27sR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQ57S0HW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4315ce4d250so2178645e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 10:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730481572; x=1731086372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwbEvvhCun5RpxorQf5NksJvgUQe/LexZ98AYrSrBRY=;
        b=SQ57S0HWtgXoYQ5bqyoGHARER4j5WM+qAS6PUFoHNKqv5Wv0F4IbqIGbGQeECVvFD9
         A+chl+UhOuKyY/BhSYv4llz89ZAfSW7K2LyXMo04dcBMTVGOU7srzFpvLfnnLKK+u6q3
         Jom8FrThNzXaseudy15sqmvh5fPsJrn+tC+Psh72O5w2c6Y6dodC8k81h4tzAGcBzr3s
         zZasCDGclyegxSdSOpKc0619FOQmCGxjYDu9cBZ3PDV4IGLK9eEQxJH1NYiVIWkb744+
         2JwI5FgF0rT5y70sD76iKaRvxk1x8wBDQmIV71LP0n78lLqGb8qOkF8e6cJapvb7AY0b
         6Itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730481572; x=1731086372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwbEvvhCun5RpxorQf5NksJvgUQe/LexZ98AYrSrBRY=;
        b=xCRyEnJQNG0qbQ8HF28UZixJBsq/LsEsohQIuiNL2YsBJqndmAFZW2TKb19zGMAeHS
         UphHwl7N11R2+LoK1zM8SIO8fr+iewhd8XMJznXP09vi92VS2p7AHex1c4FxjKbuqBqe
         Qlw/DAd249lC2sjk6nWcGZknRpoxPrCoZnnwaMtMzMdeZdj33oJPazotNxBWcgZKeJfj
         iRyrWiHALRyUQLroL26wcdVPhyRt7mX80nZde4WvVoI22D36m3kouUndBcnE2iG6Ytl9
         FaTHfqLt7p5o5NwHBrtV7Q5L67XqKHT4MeYhfdsF4gdkv1BiGl8o7qA915EaA3Zz+uFF
         jJxA==
X-Gm-Message-State: AOJu0Yzhywpx1y2K93zCn3+yxUxKYxHbm5TNtxm4WEzoxyC7QDjAK6gj
	NxkPew7fdcquDPd5ROV+8Zew35KdrlQEXmxx/MXmjx4F1ckAh/2AZZ1huN98ZJ/W8fR1Xq4ADPH
	B
X-Google-Smtp-Source: AGHT+IE0S6/OaKfJiJjhqRg6U2xFgtDoACFB025CZnqFxPKmcOa46KyXKUNmGlHnZFL2idVDxcy9Fg==
X-Received: by 2002:a05:600c:470e:b0:42c:aeee:e603 with SMTP id 5b1f17b1804b1-4319ad2c723mr91344405e9.7.1730481571709;
        Fri, 01 Nov 2024 10:19:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ab305sm68536785e9.7.2024.11.01.10.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 10:19:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 01 Nov 2024 18:19:14 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: sm8750-qrd: Enable ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-sm8750-audio-v1-4-730aec176459@linaro.org>
References: <20241101-sm8750-audio-v1-0-730aec176459@linaro.org>
In-Reply-To: <20241101-sm8750-audio-v1-0-730aec176459@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Melody Olvera <quic_molvera@quicinc.com>, 
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=827;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aohspfFLz01Bsoz8qiz0rj/BTMlKJDWhcBWm5TdNfts=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnJQ2ZyRk0bhsfW1ZMte9eI1NZRyFQUns+lItPJ
 /qbsyhKTIuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZyUNmQAKCRDBN2bmhouD
 1zV1D/wNjFQCjPhdRDl39tQMJtrGSuEtmDSo/wHvA5WCdssnaseiC3q3g+PLsbsR3guZGI69kVs
 sPXPliy47dJJ+JEtKffSfGU1mzyq7zDV2ID7uk94uJu5oFsA43oZO4huYJG38f4eJ8jkoBiBcoM
 f5bgxuuZOnYEq0ubuX7emLJQlfidFx0RUe7IiAu/d5MP4UB3e7VaMnOWp6xehEzvvHItGWJUs7X
 rm4TrffytJni6Ii2nlHgIdCYsV8Vjk9xHFr47TRUlEceV2obUnyiKfxFaYqyufJMZbO8KsMr2jW
 AnkJWC3dt7ZVLn/e8pySCu6szm3mSLKmQ33iJZB+e3tNmKyRIHyLcJ2Rrujr/2rfPrOS9R8bExm
 oVc6z1rJBTCckIC8HpBfq7aUw/8GeMNLDO2XmBDs7U71bzrzUEz0LFvBOxGKzb1wJV0T4Miq0c8
 O6BzDC6Jev8T7gQWydeO9VxWCwWUNn4PxMLHlGoKgBaE04kXOuaH/orJG9nG7TBPI9pINDx8KxW
 QyUzfxc/Wg6rB5/KFaS0oTZbUxUzDLpYaB12k83fmbBEHW02lLZgh30PPShNt0IHlzMFkkCCYVm
 /FCC4oFasyozAaVKKlIVs46AbofD85zwKTTNdldBSlSm9ZEpTSdORHR4MPs8gX+rsFykCqvbThA
 vdu/YI0eQpkbs6w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Enable ADSP on QRD8750 board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Firmware release will follow up later.
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index af0174d95e3af641f7ca44fa4ef8643593859e9f..4a4c1ce09714bb99b8450f718e16c882bdfc149b 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -862,6 +862,13 @@ &qupv3_1 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8750/adsp.mbn",
+			"qcom/sm8750/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &spmi_bus {
 	pm8550ve_d: pmic@3 {
 		compatible = "qcom,pm8550ve", "qcom,spmi-pmic";

-- 
2.43.0


