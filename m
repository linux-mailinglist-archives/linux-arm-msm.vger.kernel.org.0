Return-Path: <linux-arm-msm+bounces-25194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C0F9266A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 19:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BA01B2479F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 17:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C061849CF;
	Wed,  3 Jul 2024 17:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bgCZ5CGT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC6E183080
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 17:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720026062; cv=none; b=R9P2RdMqvEkqzR3nubFvC6R6t53TtVETxtAj6kRcIlz55VCs5xE78V39f6xzIsQUAlkfUfxvwW77yXomkZzrusLjse2hiaclW4nu6z5SxR/mwf8FWJZ3IGg7CRJza/o/cl+mkcdpvHOhS7RvZm0OXo2jLTKJUjE1Dj/tYHTTQSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720026062; c=relaxed/simple;
	bh=LbhgyuYPQ1FCoFCeAN/+B1/4KdPm4NaPacO5gdM6QUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cH7UKBsjdHU5BfDUgHlLLPYV+6mFQJubwzWuM7cpyZfq9Y6DSSgf2Je6YmsT8LLoHX+Y19TicjhjueadXF6SARCdgfZn0ejhZH7R4BqLGKQMl2XX6Rm0av9C16KS0b0gku+NZXrZHgG4A5JGPgTELaXR36frw4UHBL45V3kbnlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bgCZ5CGT; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-424ad289949so40846145e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 10:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720026059; x=1720630859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/oOzHTF24myyBngZj5R+KRorflJu1lowERzxh9egzl8=;
        b=bgCZ5CGTDeOlZcibCHkdy8DIjNLThDfFi9EeOsIXv+Yh+mOBb2NOHNlJ0S+JNMgWWa
         xGnOyLVShNsrYMZl3vd2k6fms8S5M9daMsD4W+bxGKo/fbU6tpkWj7NppKGfNXLyg2UM
         AsimSNBWa0FZRobZqF3WNmeRvFkTL7DaBfJNqdrP78xeR7InU6Df31ji9YR/AI2mxRui
         7evP3XYTXVSanQUJQmc4zSTmAJFu0kXXiUvt8JiEFUBhu8MU9gLftt3OaKgqjg+oW9H0
         xpgfr8z60DiqmnZ0cEx/NVXFXWOQlxAR86Set+SYf8w1gTVJGqEsk5gu2H+OqBOlyE9n
         DPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720026059; x=1720630859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oOzHTF24myyBngZj5R+KRorflJu1lowERzxh9egzl8=;
        b=pERIKDXD3jq02Z+dl5vsGN36n8qf/LA3qZXlmB4NMuRFTu7E2kNw6pwhFQ4ydusDsi
         iJyaKLARLEfARy9DN6qFrZapeHfKYCbc/YpRYDvFFAZ3+Rir0vDt7mS5XWkLnnbIU+M6
         gCGz5DtMEjlyMZcSumlDFGL9cZeh7satnO4X/kWjev3HycyYK+kpmATknNS0k96PO33W
         uVe/BnOOfJCWd/0LUtfXgsQvQnCZg7z0rwJt65OVTNjwDBICK45j3VG79lF6tozbRN8c
         6uEor+AJDZ5uIkOtzIeV3wmeyEcl2nX0zhggQHruFHrz6bRMxwEUJ06I2hxELDW5bGvp
         ZFkw==
X-Gm-Message-State: AOJu0YyVTPOJSC3QxmkbndE5Xg8MC0CMcL588DxhqfzI9Rc+fQgm9rHs
	ITzEDp9CXn2eiXQmKQKBajqKAk+qB0yYGmnLhQJSKqbkxzQoePwl2auG6V4wpts=
X-Google-Smtp-Source: AGHT+IFvi4Z0Yr4c28zJ0tOsZ54ddax4HE4/6ljn/sAf8A3Lmsja3W8/AkKy/+XoLu/7wT6QmgT8ng==
X-Received: by 2002:a5d:6c6a:0:b0:366:e935:61cb with SMTP id ffacd0b85a97d-3677571fefemr8730961f8f.56.1720026058681;
        Wed, 03 Jul 2024 10:00:58 -0700 (PDT)
Received: from srini-hackbase.lan ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fba2dsm16403776f8f.73.2024.07.03.10.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 10:00:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 03 Jul 2024 18:00:53 +0100
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-yoga-slim7x-v1-1-7aa4fd5fdece@linaro.org>
References: <20240703-yoga-slim7x-v1-0-7aa4fd5fdece@linaro.org>
In-Reply-To: <20240703-yoga-slim7x-v1-0-7aa4fd5fdece@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=754;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=LbhgyuYPQ1FCoFCeAN/+B1/4KdPm4NaPacO5gdM6QUA=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmhYPHgSscjwwN765uvatUqKgitpYf6Kn0PI3Ui
 g2XCcBGh3eJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZoWDxwAKCRB6of1ZxzRV
 NzGICACI6+yAbbDZ33USGULT9nDNVeOQwv7oQ3OE5DFToX0HqBXD8owCW0jI+ihC2HkF7pVI1Yv
 19Brt7R0P45KedxZxfRZ4O0SNpNiQRyNHyiagxH0BvceZBfjEJA8HjrtkC9PztaN4TewmjFEj1O
 dO0CpYt1GIVfroHqk+k2jaYn5L53clfpBvJ/H8zlxlMeoVezzGIEfPHIW4m3n87D1A113g+PWsH
 ss+v/s7RDNW9INM504nRgG4dXYhGlgBEfLGLbzuioi0BoYplhAD1JFug0434kw+tv9gjeO0PFX0
 /8p90GlYpYxCrNRj2sQnEYyoGG2DTK7IHDQQXHP+ZUW2KDr4
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Document the x1e80100 based Lenovo Yoga Slim 7x laptop.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 1c8643eeb2d1..626e48703bea 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1039,6 +1039,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15
+              - lenovo,yoga-slim7x
               - qcom,x1e80100-crd
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100

-- 
2.25.1


