Return-Path: <linux-arm-msm+bounces-35203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0311A9A632F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2EF11F20C73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 10:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2811E7C1C;
	Mon, 21 Oct 2024 10:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kTvT7p+1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E141E6DFF
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 10:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729506653; cv=none; b=taAcyc8zXbItz2Pc1szSmiJgnRL2P24os7m7YC+TmWUwW3AFvI+YWptVL/xvkCwllAAf/k8NpmO8Cehf9Pvv16ZP5qJ0T7FOoJRaesm04jWQxAe+NlhttUhHaJkd1ja1zCJXnBPO/zisH4z5vG79+HI3s0xwaj9aP/K7OclZ+L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729506653; c=relaxed/simple;
	bh=1S0e8INDTJp4RQZO2xifYyW0FBrz3v2kT78lT89hhEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kGTD5oWxwQMHRJjNyORiG3qeMkikO13ct8cBh7URpLp5OaE5fEGhwvXnvMyLdWevaojyATf15iF2aMMtmCA3cEYFxppk/N4UtXuhy662o5V4g18sFKa3SFRg7ZGmxeuQHQxzvDQyDsXWwcsdb+dPuds9hZ+IF+uAnSA/47PMtMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kTvT7p+1; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb5111747cso47309931fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 03:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729506650; x=1730111450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQiTcshw9Ox4It49mqmwWy0sWX4h7q2ja8AFVlIbjLQ=;
        b=kTvT7p+1ag9exQk1AeyV1bqJEaNOG/EEiyNZC6CXdCjN2EELGuDePI1LqTqPcHtVLX
         QOHDj3B6j6WQzSkMw3JY/o9A0DrJ1dPVRkgUD4Iab+B1Qx/ohcNRfNRTeKPyeZS7aPQ7
         AUieRMT5Jnu1Fdu8sOokBlIn8/4QbXAvKN7PFeSfogFpqTy9P3p15enoDan2IT3Y9v2F
         vc6/OVHpqX5EAziFJqflQYGiAAACNzg0tpgayYvqyDhOrU9JCj+ge7gM2JnyORpYNsQ8
         AS0yF5j8IS7JsMQT+MP+RUK1drc1e/nmzrSy3aXNAzpNfD/aBp1i1jpVIz4q6EE+e2Z2
         x82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506650; x=1730111450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQiTcshw9Ox4It49mqmwWy0sWX4h7q2ja8AFVlIbjLQ=;
        b=k0guoSq/+EWVoEF3YpU9PWAruKGyhGaoyAvJprsLPNSfBaEfsipVRiyKhVzL8Dq9CG
         Z3bNQWhXlz9YUMNWchqpA+QXRoiGSDmDQNtTTUXHW/Fg2QxndOCShpGVHSVkjRKeFK0e
         PAjSgcgHyGL48h3XhXL/OD40KaG+OoUK88a5g0v9ZrKjWeB2jPYU9mAP6usA/FL/wfPi
         YSn0bhRh3MrozJ+4i9iqAmsBqwm8LaLzow94BqSRexVF7QGdA1LKw1OeTQFBa/SHk7+4
         xI+fSjp9IHtZ9hMNvh5gOljOfLFECniPvbQN7RLv9jj1v3F8DccUvAJFMain0ce/jE7f
         5vtw==
X-Gm-Message-State: AOJu0YwfV3buAE+3S1xSPbaugezhktNq1daG+OIZKvClaqw2Uk5cwhU/
	rXeUm02KIMm7apSuboShsAtFhXQS/0o9q8D/ZoOxVR75UHBqOFm8pTMleZwe7gZ20IkDUEtyf2t
	lVok=
X-Google-Smtp-Source: AGHT+IFdlpTLDL6uAYyvCauFygr27m1FoT6MtjFdr97ltgm4aJVC2CgQpEhbCFZHza/cCrXb9elX9w==
X-Received: by 2002:a2e:4a12:0:b0:2fb:b59:816a with SMTP id 38308e7fff4ca-2fb832268bdmr30572101fa.45.1729506649961;
        Mon, 21 Oct 2024 03:30:49 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae1217bsm4522711fa.112.2024.10.21.03.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:30:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 13:30:32 +0300
Subject: [PATCH v2 04/11] dt-bindings: clock: qcom,sm8550-dispcc: Add
 SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-sar2130p-clocks-v2-4-383e5eb123a2@linaro.org>
References: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
In-Reply-To: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1S0e8INDTJp4RQZO2xifYyW0FBrz3v2kT78lT89hhEk=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnFi1LoEgArHwHyvEnghZXjDksFVQgTU920IZf7
 M9whm+DPmyJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxYtSwAKCRAU23LtvoBl
 uBWPD/4iQROZaL0D58KWTrit6SzEuGMOfHuzbHZ7M2HUOHm72tW3Ws27trklsAWjsrJEfrauMbK
 UFXHbUyz5oleiJt4LqnhI5zU8p1tCWTeScjn7ROnhvlb/YWZzIPO1tjzTlt3ir6NoHyYPk+r/CJ
 qFrizxvo2cV9i2HkUGzDNrvOfIBX1l36BYo1VA/1bqMq5eHkKozt7YqjnyN1qOafPAGmKJJuU49
 O5YUcfmpGXkjnodArFXYMJlVDHV7floI4gOAyH9BStUmbza0o2lSu6eTynROeU895e82YIx/VKo
 W39EgjTN5w2qo55vSw7N0rkFOircnT4CVdzvXckb422twwqW1sYpyOF1hCEY7eSVIXVUpZgbC82
 4fehRDCrFBJGqnbcuDD83fHqu+CDDcnWfHkhNTKfHXAGvoL/H1NyvuiKV1mHVzhoIBF6UYdVAcn
 R/PR3uL9SAKlRgLCgTD4b7681dEJ80xDK6CAczG+uyqPW6tAVG6zps2sdodLDe9MEtj2CvbTeGa
 YyOmmpPqr5hxv0dEm9Jta6aZeqXlVU82xwMpODc7wCai9NDbMiO1+uE204CP+62IfmVDP63Q2Wo
 eKDhoLw8iv+s+3kQv0hzKehiCh2/U3OPFlmw8rpB2WDXqrh6EJyHaoo2mivnoQhUovqa8tFy2zl
 XYnMmjTq6tHyAuw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the Display Clock Controller on SAR2130P
platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index c17035a180dbf3dde715a281bc54165122739618..c57d55a9293c214c4c101902cdd9603074e2243d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -22,6 +22,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-dispcc
       - qcom,sm8550-dispcc
       - qcom,sm8650-dispcc
       - qcom,x1e80100-dispcc

-- 
2.39.5


