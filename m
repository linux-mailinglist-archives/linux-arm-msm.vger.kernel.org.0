Return-Path: <linux-arm-msm+bounces-25206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4882992691D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 21:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03AA228479C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 19:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F9C190694;
	Wed,  3 Jul 2024 19:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WcNHf7k6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98414187332
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 19:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720035916; cv=none; b=Q/EPL8QXhL/7VKI6o9GNDvdugGw0Q/Wy+goXEXEJlhMGyECdI/XSzNb3UtX8J/hdr7Dlow/bO6rRAYvb3dBA3Vteej/2SVsYxAjhkEbYhwJ/S7J650yo02OrXdpjx02B9RuNOMywEP93Qwi8OQ/kdJjfzRA+n+ydg5GMyPJqEZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720035916; c=relaxed/simple;
	bh=LbhgyuYPQ1FCoFCeAN/+B1/4KdPm4NaPacO5gdM6QUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h/DGmcof3ceTNoX+xxrDov9D3jS/C3q6greoPsWuAHnmcGHbrDyEjibFxcakALiFwyW7k4Kf2b1atScvj23WpkbtZSy4jkqo9WyjYD/IbDNxwADTGCrVRpFDMO0xm3QAuzO3+ccN932kAD81jeYasWN1OW7Jrrx70OOgICCcElE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WcNHf7k6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-424ad991c1cso51352975e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 12:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720035912; x=1720640712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/oOzHTF24myyBngZj5R+KRorflJu1lowERzxh9egzl8=;
        b=WcNHf7k65XWZia6Ts2YwXlcpJr9SF4b71H8ZSWlu93j4Q6fJJuhjGHl/KBVf7Q1hIK
         1dtpi6wOU8meVXSFSnZ84ai0R04FdHR29LFDBNYpSXiqaFfrK+Q+bmlaIbWsJdFwJvHL
         NqyDQ6EeSTyWlIE2smDPkuIj8cUdtys8s4M0ylgcuF0BgGEp89jPuyWKpNM2UWYfIyb6
         DoeWcRkL3HB4Cr2gCczepismEmbwJHHLb7KMg/JKrfmvthAOH2MuqN01hK2Dxm/Q3R3d
         NzQkm8/PdUpBzo+Dxkz8HBnyjX8e8ur09SdDlHLq+X9S8ByJFD5jJGUUybLUELuUjgt8
         y4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720035912; x=1720640712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oOzHTF24myyBngZj5R+KRorflJu1lowERzxh9egzl8=;
        b=oIC2wzqSl0Iv3ffONQQEs8wDOs8MrXLJbqPUwNjJm9ir4p0je4gkPvRH+0Yoc4gpvG
         fjeIuH8igjuRVAhbz3TyzbmDVhXAGxPzFQpB0WGgZHoA0A9k4AF4JxNYPvpqIOkaQG/f
         fuksji0upl36M4B1dGaHQZtNdFmTEcy92Emvh00vJeAvKFXMAJYURiJp2G+wzk1PGaFi
         G3LmXArR/vx37rqacz2Rj59mwypNvIJFzIJYb8Mj3oCvgyJhMZBSqy+Oe/ojtE0l5F2C
         t6dxsoja+J4ju/QaKjIEQvbyHm402UILmWptenDQiuMOJz3h+qL1QqsnSchFnUNQKpxh
         am6g==
X-Forwarded-Encrypted: i=1; AJvYcCX24E/GsdFbEEcMkWDiicWcaqx5jjl2N8SzAojY842XhEYJK2Hil+D10fWih8d3DOZdbkG0LRvosvVhGj/SrprZ5SfStgz3VmJlTp6UEw==
X-Gm-Message-State: AOJu0YxLVQmoPDkY/bywUosIsoiscYSIK8qtl3rAm5IuQ/KGfKw3+BvA
	7LO4HRdVuW6oGD0atxFfrgQzMTfso/Jr+j1BF+a/nB8dnNof8VYL26chhHrRrBk=
X-Google-Smtp-Source: AGHT+IFDvXSDLNsqPjalgX5KzGzsvCuo9QTvMeP32Q3CDklVpUsvFm0oKlpbzd6GYrkJ+buNIz7+cQ==
X-Received: by 2002:a05:600c:26c8:b0:424:a587:4392 with SMTP id 5b1f17b1804b1-4257a00bf07mr110020905e9.18.1720035911914;
        Wed, 03 Jul 2024 12:45:11 -0700 (PDT)
Received: from srini-hackbase.lan ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0642acsm260617905e9.25.2024.07.03.12.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 12:45:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 03 Jul 2024 20:45:05 +0100
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-yoga-slim7x-v2-1-3b297dab8db1@linaro.org>
References: <20240703-yoga-slim7x-v2-0-3b297dab8db1@linaro.org>
In-Reply-To: <20240703-yoga-slim7x-v2-0-3b297dab8db1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: robdclark@gmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=754;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=LbhgyuYPQ1FCoFCeAN/+B1/4KdPm4NaPacO5gdM6QUA=;
 b=owEBbAGT/pANAwAKAXqh/VnHNFU3AcsmYgBmhapFeTkdVjn5BxNBfreziXzaiQFOuonJ+rVFP
 WQCkcD2SLKJATIEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZoWqRQAKCRB6of1ZxzRV
 NyoiB/j9YvM7cDozr/ARdRBZgWqB95eQnfW4MnI9+QP/Jenm7QvxfN85V8Kup0Wzly04mRC4Mle
 vl26ExaV59zilck/aKpTmrMdDXcPhpUB9G6OAd0A32fn7Qvcq0oTMV1/d+uzM/Gy3WPUZ5IX4GG
 fbri1JcYXUZ7RaYUXVgndsbyOP+qoY5H8ilbq+GjDLH0sXxXKG18UyBifNmXbeGEwFr1BHCKORk
 WQAXs1DXj4DNxWAQZjJMFsVP0MCVT4fARA++h+yBmrUtrHpy6G1FRkqMxPNdj01h020sSNZnsfo
 NnxHEByQGObf3b0k5nd02H74SP+EJ1PfIfgFoxOo6NNcYjY=
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


