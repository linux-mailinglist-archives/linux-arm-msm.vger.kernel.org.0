Return-Path: <linux-arm-msm+bounces-13750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5897A87714D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 14:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89D751C20B2D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 13:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E495F3FB8C;
	Sat,  9 Mar 2024 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oJloeZMN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99653BBE3
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709990114; cv=none; b=pT+sOO0e3YEHR9mTxoejaEAUeZvEHm7SVSQtG4fOoKxWiKyC6L6qaY8gtbQwKoIrRCrKosALDvBtO8CjqHFxcgLd+FNIBzMBoO8d5tJ0aQHVDetPfzrmXOAwMl9CQW8PO85zG4LpenUCWPMgEM7cAM3pj/z7JpMjzxtfQd/00AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709990114; c=relaxed/simple;
	bh=HmrkCodgOiENVwajhEf4IeU+AccZfWCi1JJva4e0gNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZblH3XpI2+m2GnBCpnqF3gNnHw5nKEsGsiunyglhpQSMC2yEOX9cT+5VCyuS9LSsFmYT1gwyNOoaHQGzHxG5Jvg5cxpshKQEPV+ueHjrrHCIti4aIIhd8pngfySIfN25D+N5CSSKxVlRWgsaUyAXguXbdUW7DRgMjuCY2q29IeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oJloeZMN; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d40fe2181dso20260591fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 05:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709990110; x=1710594910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Q2KZLzuT3UR94jDBU/FFVjIPHKvDHfe0WeIOQfMnsg=;
        b=oJloeZMNuy9UGO6DTS/QXrJqtlxCpT+mzWBQXiEmvklJ0IpQbAkJq8sdJEdO2jTw4j
         MMkLvjEnAsnkqpLbs+9AXjgFavBLLXKfpat39o0GIpZRhw8bsjS7D1oFbYCJ/3BuXy14
         +VEqh3s0FxM3V5SYNjeTSppTDzZrGvoKJGHw/lPVJ1AhX0fiBi6U9jqMyNK00DRl4xCK
         BEbfhbpVGQhHvGvLeifgwMJkBKya6IoYm5KfIAyXTNWQPyjupA7D032SylcQiWhIHsrZ
         1Ec32kPT2sS3THMeRNES2VMSf6tZ0nWf2NOBnok3uFA8Hg4I6GgrbPXKG8gcLNUIQKSJ
         FY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709990110; x=1710594910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Q2KZLzuT3UR94jDBU/FFVjIPHKvDHfe0WeIOQfMnsg=;
        b=AUysJxbRu7BtQJpD5wqVMIbvNtgeVguIgbKrtmqwT2jWdVb/IuXip8U/sR1MG5hq95
         Ssl6sQK81FHiZvaaxHtgNTPUpwjDlqFXu7ugWhVry3Ke4dVvU87GB5XTsO/bBZxJABsX
         BgQqoBLHXfvvpHro2J8IN1750prGvl3mpQhCW+q4uUvfti1j7LOofS+NmY0c1CgljFls
         bu46iz5hxSkaoKjsnQqOwApe/TzoVBc/pjoLzbBAwU54hZG5+1iAsfTJX+p8f/VV6KvU
         UO2pBrzFTfFTBCCaZdZVoJX6woVVZ16y8RohD0CiZDydQpLabf1l71efY6idXVR8wHbm
         lTjA==
X-Forwarded-Encrypted: i=1; AJvYcCURozNgOukR6YxdgjFdURiVI5k3TpHWuTEximUWsS65Nc/yE0ZuiR86YiyDxMvdcWmzSJR+JAskiPAB+wUVFVC07VXe9OwAJCXWrnnMcg==
X-Gm-Message-State: AOJu0YyYOkdWbW9HKAREKCmGQ++ifGb1tQyLvUiRrlAUXZB2rT1tV27x
	4voFcTByzAfBj+JWOV+iZusbS6rBFlv2iD6XOPVEiAxs7NAj/VyQfWHVuHFnSq3AbqiJL/osB5D
	whas=
X-Google-Smtp-Source: AGHT+IGeAzGtL6FkqXCIla/z9d2A5mD9375JAQQhHyrsSlcx+uZwDAjn7BDeiiA/FM6uxk4RgHrvFg==
X-Received: by 2002:a2e:9890:0:b0:2d3:a7da:b17b with SMTP id b16-20020a2e9890000000b002d3a7dab17bmr1431405ljj.4.1709990110049;
        Sat, 09 Mar 2024 05:15:10 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id i26-20020a2ea37a000000b002d3e6ce75cesm297596ljn.70.2024.03.09.05.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 05:15:09 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 09 Mar 2024 14:15:02 +0100
Subject: [PATCH v2 1/3] dt-bindings: thermal: lmh: Add QCM2290 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240308-topic-rb1_lmh-v2-1-bac3914b0fe3@linaro.org>
References: <20240308-topic-rb1_lmh-v2-0-bac3914b0fe3@linaro.org>
In-Reply-To: <20240308-topic-rb1_lmh-v2-0-bac3914b0fe3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, Amit Kucheria <amitk@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709990106; l=924;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HmrkCodgOiENVwajhEf4IeU+AccZfWCi1JJva4e0gNI=;
 b=a9qQLgMOYxxC13+lhiLrDmaFP2VsWIJNnpW3mFDBV7o3tEwmYyluHlr0nwCzXgk2DThNsG6co
 W7+3PbadllBA5b5ZpMaaLeY+14KSj1SDZ4bAzUbFUSBvLXnm00bKsUj
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Document the QCM2290 LMH.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index 5ff72ce5c887..1175bb358382 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -17,10 +17,14 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sc8180x-lmh
-      - qcom,sdm845-lmh
-      - qcom,sm8150-lmh
+    oneOf:
+      - enum:
+          - qcom,sc8180x-lmh
+          - qcom,sdm845-lmh
+          - qcom,sm8150-lmh
+      - items:
+          - const: qcom,qcm2290-lmh
+          - const: qcom,sm8150-lmh
 
   reg:
     items:

-- 
2.44.0


