Return-Path: <linux-arm-msm+bounces-1970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D12287F8B71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 15:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DF75B213C5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 14:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF6A11708;
	Sat, 25 Nov 2023 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JVI45ek3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4615133
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 06:18:01 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c9947f488fso8152411fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 06:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700921880; x=1701526680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMfZuIt+BqG7KJ9nvVW95qPOCXnGA5QHM/Q3t0t9+4M=;
        b=JVI45ek3nUjZLPzP4gXrVK6Ab8mYya+JK4b9mYzHFa9kiBUUgmVW6Ybu1S57XM133X
         sWPLVrKUB1M7pNEFCuz7eD4XAmzvC+6D3TR8kHQAgPPd38FkMkn17vsYbKb59i2meUfU
         SAWGZDfuF/G6CIujKfDfZtbA0Bemft9M9Cmo5bIwg33LZDJInr6K+D73xo6I50bQAUfZ
         z9cGALg2Ud+B2vcWHsrnWq4FX3j62ud1TC5RR+tsBGTZ27m7fEVeVX9eCCE784mz4DB/
         aup5BIVu+Eln1mdCD3Bz44W4j/e+Za7ToZXE+PhXAaaOYF4wPXlUsOb7gnDnXe5kMDwd
         K1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700921880; x=1701526680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMfZuIt+BqG7KJ9nvVW95qPOCXnGA5QHM/Q3t0t9+4M=;
        b=iTyldQSDqGt5k5mRhXvHAB26cx9D4QzxhqidM8oTaS0pyUdwKR0zz8PhLXgEqjnqRP
         Wu1Ru3p7t/FBOTAMY3PqG1S8ebNopxXOyiKr7zKiGbS/oH3FP5XLC4vKRS57wMT/gWgK
         PzAHOQ/iko0vCe73HgDdKFQMH92VKSAeV1CJRgSsN1Hxk+Tnlsljl15UoEdU/HPf/xY9
         W+0NdJuWMF+ENs1u5nEMHP0eav7AJI1+RrcIr/fPZZEMAJJj8EtvJ+SKOkYsNNFfMdEo
         GrIFdL/i6iTqkgYMnb9DKgruqN/K0gj5/rHdfBfuvfHBb1Rohux1YTwYi8FrtGSCPMcS
         0kNQ==
X-Gm-Message-State: AOJu0YxtaqZPpybjTCuEtQ0AO7kx63XjD9INxRxs+f5T1UKbdrBHHaFC
	skg4/QNPhfUYUw7ALDh07rtPzg==
X-Google-Smtp-Source: AGHT+IGY8/ylhRHLmys2VuwyghOEp5L7XnbE9NC1OHEjDt/EDFIyFNSFmFVQ5bIXBVUTdxQp2wEScQ==
X-Received: by 2002:a2e:350d:0:b0:2c6:ed74:39bd with SMTP id z13-20020a2e350d000000b002c6ed7439bdmr4479087ljz.12.1700921879933;
        Sat, 25 Nov 2023 06:17:59 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id 19-20020a170906319300b00992b8d56f3asm3500345ejy.105.2023.11.25.06.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 06:17:59 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 Nov 2023 15:17:34 +0100
Subject: [PATCH 06/12] dt-bindings: firmware: qcom,scm: Allow interconnect
 for everyone
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v1-6-11d71b12b058@linaro.org>
References: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700921858; l=1089;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=zKRggNekRjMo2HWiE/Zd6htFQdzWQ+j1rvOWJYZk1Dg=;
 b=J86IamNFPWjvFl8R15HeGrbbKv6nxOgsRyV2gcyGjGQvv0D4Sonw6dL4ASTha1oCz3/d/YNgs
 sy9rMHIgH7XD+CMd35v3AcW4emIGcmWa0HZbVIBI6fy/CV5AVKhIpjD
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Every Qualcomm SoC physically has a "CRYPTO0<->DDR" interconnect lane.
Allow this property to be present, no matter the SoC.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 0613a37a851a..f3a87a8426d0 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -178,21 +178,6 @@ allOf:
           minItems: 3
           maxItems: 3
 
-  # Interconnects
-  - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              enum:
-                - qcom,scm-qdu1000
-                - qcom,scm-sc8280xp
-                - qcom,scm-sm8450
-                - qcom,scm-sm8550
-    then:
-      properties:
-        interconnects: false
-
   # Interrupts
   - if:
       not:

-- 
2.43.0


