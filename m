Return-Path: <linux-arm-msm+bounces-17196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 660318A0BA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 10:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1472D1F24DAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 08:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E48E1422DB;
	Thu, 11 Apr 2024 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I3xjWIDs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6451411D1
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712825546; cv=none; b=ikb+aBvfzawuM97eLegz4m8CKBMJ6WJM6CoavSzNyWf5nlgrcBY9FL+69xr7eZ19hWN1GxwmUF5Klg98+Bj+NG660+W9JUg02M5z7T95iBV5rvqFYcpys2Xn+yuNU02mZCZ6hQPoxdcTtNDvRrLSr6O5MJZIMtnWynCyOUiSWms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712825546; c=relaxed/simple;
	bh=oz1vppDKVcLy3ajc0dto/OD6QDdiRhJGUXxPZ8/cYfY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TOifijOZ3Q1YDOwviVkTXGuhAFlSSlmJtgG7T1uotblGdQWl1EDK26CNgm7P0PiGJRJvKs3uTTcfcfSU3JWYS8I8RmDu/qNdeuQUB2r+mB/CHdUczEYoGp3dL2dlFw9v6RRxHHszIx7PWpJd/TtmFfIWSmTYrekg8QBE96c2vb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I3xjWIDs; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516e3103d92so1845679e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 01:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712825543; x=1713430343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PnP8Lqn3WKmBuN4LCmH6PJtaBigbDoHwQF5Dz835wx0=;
        b=I3xjWIDsRT0fw0gUMq9lb5Nf2aDz4j4wxxFmu3qz4xWUYno2lC2PDW2pthUt8XyyBf
         w6yyTHi8pQGCQuF7auYdkuI9ElmRIFwxEvs0nH4FbQCeYiUlQzUXxCkiuCbmIS4BC5R5
         /a0mapzH/XRCgWCQvGK+ckq36wFrKMtUzqMJEV4oFR84q/JmIm/EW+cMKBkeAP0jl+Kb
         6jktWCKgZcLY26iJzDv59UX4e2pFFR9IyZaVrQF9JaL3JaokXA1rSBxdjkBmF+7RzJ0p
         rN0jSMV1Tw6qSOn9J6HjDL5FQ5a0DTjnfDqrq3FU+gQAvtWlpbVJCLIsgN84mGbYv/+R
         tuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712825543; x=1713430343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnP8Lqn3WKmBuN4LCmH6PJtaBigbDoHwQF5Dz835wx0=;
        b=hXrFxO8YvN6dMBxVcBI1XsRY4JCTx7xwRcjEgjAkcQ8sKyflqX+IhDn16hQGM0AmBj
         TRyn2rj+hL3oPGysQxQcaMEJJPbpT7VnDVsWAPDWM5175KZaQPEyn8bvRYBnvKPPEy30
         fG7ytlohTkct5jjiVhs98jRFaNWH4ZbREM9uiZ7rTzwX7Uk4ELmzBBa5ckRMTyHhh1ld
         Owi8QX2ZYSIxxhMCPfXLwGVBcuzeunihAVMCvJVlj2JxV69kC4+erMonUdJJsfm+qhG9
         D9QIQoSISyl35w9rjHmsfDq+4YlpCSUUFKUxmnUzc5jBr7CysGyrVqdXTKEMeUc/2e0Z
         rvFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVftGC0hJLyBky4kcy4qyOBLHp5Unv3/Jgx+I3jP63Dsx/V5W9pXwZafO1ojh29SAQAnXznkTZlxF0QN37Zo/lHfZeTaiEJGIA9e6ZGfg==
X-Gm-Message-State: AOJu0Yyf3gSxPh/vU87au7p5WT7mdQ4r41nDiBfU6Uo0LCATU8wXvahc
	B5A/UHsxBWwmaVR31MNoCsi2t+PHd+JVfRoND0n9WEO/tkY8hhmCu2Xo+A1ad8cBEArLreAL82x
	gS5k=
X-Google-Smtp-Source: AGHT+IFsgyT59h7uLUMSIJtnMqqqFxMUp0Iiz6ouQd+KPyTANx2sGA/tMfTB7jcSdes20PhfQqYjyg==
X-Received: by 2002:a19:9153:0:b0:513:cfb8:8cb3 with SMTP id y19-20020a199153000000b00513cfb88cb3mr3295631lfj.1.1712825542648;
        Thu, 11 Apr 2024 01:52:22 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id o1-20020a056512052100b00513d1e9ce7esm149934lfc.90.2024.04.11.01.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 01:52:22 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Wolfram Sang <wsa@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] Revert "Revert "dt-bindings: i2c: qcom-cci: Document sc8280xp compatible""
Date: Thu, 11 Apr 2024 11:52:18 +0300
Message-Id: <20240411085218.450237-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 3e383dce513f426b7d79c0e6f8afe5d22a581f58.

The commit ae2a1f0f2cb5 ("dt-bindings: i2c: qcom-cci: Document sc8280xp compatible")
was correct apparently, it is required to describe the sc8280xp-cci
controller properly, as well it eliminates dtbs_check warnings.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index f0eabff86310..43af1c23ebe4 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,sc7280-cci
+              - qcom,sc8280xp-cci
               - qcom,sdm845-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -161,6 +162,7 @@ allOf:
           contains:
             enum:
               - qcom,sc7280-cci
+              - qcom,sc8280xp-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
     then:
-- 
2.33.0


