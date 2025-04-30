Return-Path: <linux-arm-msm+bounces-56292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0864AA4CD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 963D37ACEF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB70231847;
	Wed, 30 Apr 2025 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZYpRAQUt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DE7227BA5
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018503; cv=none; b=RMZqaK32QFhJmdjtcAY4ASSnkTYubyYe6No4gYB0tMwcC9G81dVcRXyxXWGRnLKpYsBj/8eC8SBRdcQsevnyOFAnRE6unwGo5jHa5uxBijPNH0nTH+Ek6Ur1vZmShJJzR6FiRmvshfEXze/oVQ6GG9O3dDj8lDa9cvWR/s7l3Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018503; c=relaxed/simple;
	bh=h2E0Qu9mtfOPc6WOXOdr8B2EUlTMKmMwT95e+uaYoFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=plegq5HEn052QJA82SYH6qOsxf/Gnu8+qSyQ7xWMa9YL3TquA+5iU2HadCbdiWnsXNTRbZV9Di4jzuzBQUUrN5wEj/Dk5oU8zaTrxd4413qq6CkkpLP+dDSayqnkbUYUiSJ16s1W0L7H98rBCj5LQgB7KHIK2blioGMUaqklBxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZYpRAQUt; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30c2e18b620so2883931fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018500; x=1746623300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DqxNn+UoD7iamnGtY9TgLsPSi/cCuXwa0uWwu1jgxA=;
        b=ZYpRAQUtMdp7c5I85C3xlAQdzR0RnLTwYi6OIPmbyp/RmISzjf8BMSsnz2BczMZtHi
         wpfPv/hD3nQXw71wjBZo3z71WNp7Q+sLdZQOaCfCy5bsG6eT/VuITvBV4eMtvRVbXdWn
         38G2Ti2lh9wFnuRzwZOB2wQ0QAVdw6KEZ6wknyBlyPbOAk3xqfkEehJ/zUYIIo++XXzH
         mY5T/IT3p0nEHH1065a44b6pupQ5F4WxvBf+iahViS73CZ14SpfpDSFVQUzPyXhUqdA6
         0L4WjbSjr9YOhvHJUFlgS05MDHIJP2u92bn+bSH8Y2CySVqAlcN5OgxnOi/jg5Qo1Kmh
         xqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018500; x=1746623300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DqxNn+UoD7iamnGtY9TgLsPSi/cCuXwa0uWwu1jgxA=;
        b=EkDk0nxRJovE7g8/Sh4Gg79qWHYEAuHpAyVqX24MZZ2eiBHRcU/OxWU5flQTbgCPCI
         0sNnttIYvOTlOLZWhrWP4oNszcce6Eq8ifRufqkXBeUu8o56HnFXces90ihsDwltLuIQ
         ZoY/fK0saAhHlN9noh1ZzHK0pUs9zw+SuAlwsIz5zGb3gXBdc3bqbjfTPxtm8xVKQu2S
         D8pJCAL0+/jqYK/sH2uGY11AtPJ6bG9wnJZcISesxLLlkSVjq35TOn9/5HnX0ufCskDD
         0SvoCYPvfxf1eR4bTNwaZYkU+0ZZyiwXxyK0ztAN4IVl2qP9dQJFPm0vwXNso7OAj3sm
         +I3g==
X-Gm-Message-State: AOJu0Yzvivs8Y3H+9oIdUAUOeTHDT3s1lz4IRwD7amlh4CysoDzbryqt
	qHGvGn8jt9mPTDHizegPN7c36OcwYYak/xkdqptx3yqUpLHdaBQL/TB3dNMiT9SrlYkUC/Zhr6Z
	O
X-Gm-Gg: ASbGnctBws9rPJ1nQ+eOHzA4+2dwmGYS3syZx1wJ82JyyyWMWBWvzYHgeTOduPc87lD
	4CFYWRxm8oymEjDI0OadTKLrdbTAaIZSaguZE7WXMfHo91/2SbfmznXwuWwV7GvypJZpVOtCLSt
	T1AwvCF9ZTFqSzvJDcpmAPgSoQTySefSL2zk4Yuqz7YEARcXglKb7JEtP9CmRUVRBa1J5cflWGM
	gm3aH1QHIfgYyhkqdH6Nb8cv1thLbmcgFZjawEAiJs6P6ShwhX+k01oT9XLsQU7s8wniCAJ78Ms
	8iinR866EQYQn9zHjTIogSyB9zOdkzHBa+X35i4tD5n6K48QtmHeWQicZT0=
X-Google-Smtp-Source: AGHT+IGBVWwBGr97Pgn5thROq7Wn5mBmawppBRb/WcGWKf6ABPhBLHfvBEY9IGyyMBgaUaKDfEDYwA==
X-Received: by 2002:a05:6000:2dc3:b0:3a0:7a00:61e9 with SMTP id ffacd0b85a97d-3a08ff35f51mr815792f8f.0.1746018073615;
        Wed, 30 Apr 2025 06:01:13 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:33 +0200
Subject: [PATCH v5 03/24] dt-bindings: display/msm: dp-controller: Add
 SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-3-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=h2E0Qu9mtfOPc6WOXOdr8B2EUlTMKmMwT95e+uaYoFI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh71UGHnWgpuzZGk5SCnNpPWKK18fJgvG/kuR
 yjfgU0YoJOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe9QAKCRDBN2bmhouD
 16DxD/0dpiL0ZWMmbsC/O716FLuR4a7LbUfU79DS35TsXf0SX7b9G3TTgdzKCecKJ4nRqO/0Bik
 RfAoWMIRHt8Caw+lic14c4j1wGuqjiRmDWqG9Hyb/78A9TRDe4Rx790uR7PYGxlDODd6KxiQTfd
 Hku6UORjGcYyGG+G5u8JRzJ6JcBoE35ad8apIFNoTMRtJywIVTfCvdLVLIGlbv6e7zT+mBwyvHE
 GK6kxlSdPbXmQDDwPSVJKN3WGWY2yMzrM0m+CLY8rmJyV2RmVwwU2kE/fzRm47viq8JMJCbyNQm
 4xyWv9TTi/9UGwj2R8DZ4qhOSNvHixbHrFg5TYYGa9d8OUdbC6+ga6tRmGeoA6N7wQ2hKaPYe8L
 oSi84mvp1SS0calcSD060NU8XZ8hsayuGYwhpdWpNsIrkRtAe43tJvPJ5WsgN2HHTUoFxstoXm7
 MAJAQIW2q5lyVYgXUrshcEV0d/HscPN7fdj3GQ1+6qJLHMQ1tdmtUXu/KGO7tMTqHtJ9MKYhZh5
 7tq4g8ONujqhPtRm6NCaqK31+29YTkgMG9t0a73stfi+UjeDGWTT87sa+GvFRCq8GV0hiDE8cJ2
 JY7azY426J7ZK33JtY9fWmYbOlLTFJTyItNwQo96Flu3hI26LkG71tgzMCkZsk4agSpYjkAHI3j
 XuGfiW7Jr4275og==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
fully compatible with earlier SM8650 variant - both are of version
v1.5.1 of the IP block.  Datasheet also mentions that both support 4x
MST for DPTX0 and 2x MST for DPTX1.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. Extend commit msg
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..a4bf9e07a28355c0391d1757fab16ebe5ff14a44 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -37,6 +37,10 @@ properties:
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+      - items:
+          - enum:
+              - qcom,sm8750-dp
+          - const: qcom,sm8650-dp
 
   reg:
     minItems: 4

-- 
2.45.2


