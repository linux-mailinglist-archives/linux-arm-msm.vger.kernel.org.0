Return-Path: <linux-arm-msm+bounces-38310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F00C9D267E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 14:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C2D4281CBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 13:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649051CD20A;
	Tue, 19 Nov 2024 13:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OfWaAXN0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BA31CCB5E
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 13:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732021839; cv=none; b=Bc7Qqao6em/lct95xFYXAaXLFiALVewAMepaCJS0A5NTf7yutFEbzZDci8t2DsKkzzPnpgYVCCZkhuailw+BpP2DXhOJSn34F1ukOa1VvBM4ZjiaokZev2NrxC3KHRG9+0vxrZ5SE4CFHuP1v3iO5pAD40IV0PcBJ9DrdfZdHAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732021839; c=relaxed/simple;
	bh=+Z/PdD2MYfcpiCWwU8ARGvFmCClzUqxWTTx33AL6Y8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/enU5fGUL98Yn4Ya9MarAtx/k4wlurnIAmT3EPVwx4V9gbLhocu5cRUAdS0QH7XGlQ4gxRh+NzwrgrZleF7U4LmolLpTi9DTvZleCd5xMgvBFjHmcqdTgTnqjsZALGoe4PslhmwAZqyTuBku249ofFVZcOnmprwdY6SfLW1rOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OfWaAXN0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43169902057so45586805e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 05:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732021835; x=1732626635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLg4Ldyb3QyH8qI2mLCFcOUNVAsIDeqLMDJbc+hKrrM=;
        b=OfWaAXN0w8BpXd6aMfcE7DJ8fZ9gufPDHRZWgi9XnFGYpgdyH3Rz43E8Tz+y3UwZ2V
         3q4RSftD6zBtUOzB3FL89XKmFQC8ntr61LmedQkAI6boWUqa5uiagJX7OJw+7bYTeW57
         HItDlwKvrM1kP67z42KYM/HDJPTQBl+EkkLyrnBVL3J1t8v/9FBgXRxDlbU/YVo0gVsG
         OdTY6/UXXxLVf9XnJvB6DdvJ97Y2FXeigKCF08IXhwlMcAdbF+aMXyyGzrR+s+vTDRMh
         kEUNHjC3MbEJS2FI2UBIg/jqbZxPAi5TuTjLCObGAbkIX9XMpVoynoTu44kL4hUJDEse
         RYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732021835; x=1732626635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLg4Ldyb3QyH8qI2mLCFcOUNVAsIDeqLMDJbc+hKrrM=;
        b=C3WuPBmZ8Q/gdcAdaxqQAWeY4RB/5gX9BxiOAn87hSR5V5cEDAy7z5tiDF3g18+c6c
         HBFtexAsUhTO94RGIF7OMUUTp2alX0R87efex0a0zo5nj3uJ7iFuqEVYTb2lGOPqW/Se
         hXkLnY0Sgl4LFxuxKei4tN7Yoxywkm6SqKpyV1VoqX6wJXbyywhg3FVr9Zb7F6OxMX2i
         lVlRlbu9Kc/BEjQhzBnfoWqn+FNKmO9ewTD0ZQQLc/xef7nh9Q1in+NwlEu/OsjGTKCX
         ON57WomU82kijmAerO7iU84xynYvkkda4W8pmcZkCqhObbjcDS/+pQzv0cDWe9Cphsyw
         gKkg==
X-Forwarded-Encrypted: i=1; AJvYcCXALvIG6Gb+bc+w2lipbbpfeSHq343SPRD2egLL/ON3Ke+fD3OiTMQsX86kkp2+TOFQwXJyrWRVO28SKlTe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz42atKcM+/PxWGkyjSqAy9MCvJmuVkSQ1CPU6TY8RhlpWxqow5
	cB0mmmD6LGjT2xvvgY4pXy6gAIMBtVOTC7EruYrfHslE/Esg5X91Aa5xK0ZD6K0=
X-Google-Smtp-Source: AGHT+IGJzaFaJz3YJohGuDkgPzfL38B4e04J3jb4J8DFuGIWIjaFuEed7tFXmMa3NleNtFete+AYwg==
X-Received: by 2002:a05:600c:c0d:b0:431:680e:95ff with SMTP id 5b1f17b1804b1-432df72b93cmr138509745e9.9.1732021834697;
        Tue, 19 Nov 2024 05:10:34 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab76dafsm192016185e9.10.2024.11.19.05.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 05:10:34 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 19 Nov 2024 13:10:30 +0000
Subject: [PATCH 1/6] dt-bindings: i2c: qcom-cci: Document x1e80100
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-1-54075d75f654@linaro.org>
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index ef26ba6eda28e95875853fe5043fe11deb5af088..89f852ca0d6b8a6b57b596eca0a3765efd058f39 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -34,6 +34,7 @@ properties:
               - qcom,sm8450-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
+              - qcom,x1e80100-cci
           - const: qcom,msm8996-cci # CCI v2
 
   "#address-cells":
@@ -205,6 +206,7 @@ allOf:
           contains:
             enum:
               - qcom,sc8280xp-cci
+              - qcom,x1e80100-cci
     then:
       properties:
         clocks:

-- 
2.45.2


