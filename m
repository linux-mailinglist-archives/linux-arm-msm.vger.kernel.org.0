Return-Path: <linux-arm-msm+bounces-1966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF9D7F8B53
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 15:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E6611C20D94
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 14:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F296614A9A;
	Sat, 25 Nov 2023 14:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fX7Sgcb2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DE012B
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 06:17:48 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a02d12a2444so408665666b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 06:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700921867; x=1701526667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLrIlTcrfNZmEHwR1vKQ7waqjNZmvK/fvwshiqcqRAo=;
        b=fX7Sgcb2cGwapAialxIgrETc7FqwWNI4RFvJhOCDneFOEJT2hYL/DDFns1cAWkxqr0
         ZieHVA2ryV8P445WjVUjQIqrOu7JQSdNvv4EL4SGRh7iOMI/55P+Q8vLQKsSjamP4y9f
         kTPgNlQZS6yKnrWkMIXom5F/1GONl6CVcO+pZjDq4rz9m9X9ZefzQi/nke/JqtsvT+8A
         OzTAnDECOAnIhJ9UEFvMuvUVxSpR+ztxrVDTGbnaWIdXpmeFa16F7UwZzguoVn7wGzi7
         jLQXoyL0/TBjIOO/D2yUgTazJoQyvLZ0kmwbJyfWKgpImdpWLt20wGwNatVTRIQI9GKK
         vWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700921867; x=1701526667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLrIlTcrfNZmEHwR1vKQ7waqjNZmvK/fvwshiqcqRAo=;
        b=gIs++d509wbqfsb7ivwKxtTuOaZh6TMLZa9G2xUSVeiSfK2/oqMc8znQrtNNRTT96/
         P01jJzVve2WIvkhOE4IA22ok+N5wo3RLpqAazF436yP9wWaNa4E6rJTBicMXi9gsmjVH
         COqXH3en3XPlzuhL1n0EpzjOxx8x9t/w5yjxmbw5B8Zeif9+tF++rEcgVCdZiRSdh7J+
         2lw93LPvZw/47wLfyAR4cG7ogH08sj7qU21YZziU0utgSHL7fYpYqlKlFj7Ktn4FfHps
         uzudDMhb8CDwsCy+yTI+FHtXem6+n3L6BAfYFVgmN/3GVIjSpvIw6XpoQxE83qT/HTyW
         MmUQ==
X-Gm-Message-State: AOJu0YzpB6p9jQZwpsVC5FCsBXmqm7Av+XWHODU6aOpuInyMb5GjkBgx
	EFJQhSa5+cZbeUqk6/rmjuDh5Q==
X-Google-Smtp-Source: AGHT+IHy8KiePOZBp8lIAsCOZSPCZfjYQvCkrTWRBfU0HFRyq1+TOhdthnHNQZRG532gJ6TOTfvz5A==
X-Received: by 2002:a17:907:3c23:b0:a02:3f1e:57e8 with SMTP id gh35-20020a1709073c2300b00a023f1e57e8mr3984306ejc.36.1700921867257;
        Sat, 25 Nov 2023 06:17:47 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id 19-20020a170906319300b00992b8d56f3asm3500345ejy.105.2023.11.25.06.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 06:17:46 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 Nov 2023 15:17:30 +0100
Subject: [PATCH 02/12] dt-bindings: display: msm: Add reg bus and rotator
 interconnects
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v1-2-11d71b12b058@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700921858; l=1875;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=AFFsjfQ/BWb6zbEE2kIE5M6+YBHmlQ+rokF2C+2Kd04=;
 b=Ko21H+lWGGl59y8qJsZ+LTUw0AWkhTziUlqwg4+lQP0Zq18rNp2fD1omovB6ZeBmhVmjSNMTp
 wKdjaAGzz5nAy1P3zo5fSusiUSJLqx/3Pre4Gi7Q7gCCuziLVKdW0lH
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there are
other connection paths:
- a path that connects rotator block to the DDR.
- a path that needs to be handled to ensure MDSS register access
  functions properly, namely the "reg bus", a.k.a the CPU-MDSS CFG
  interconnect.

Describe these paths bindings to allow using them in device trees and in
the driver

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[Konrad: rework for one vs two MDP paths]
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/mdss-common.yaml   | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index f69196e4cc76..c6305a6e0334 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -61,17 +61,27 @@ properties:
 
   ranges: true
 
+  # This is not a perfect description, but it's impossible to discern and match
+  # the entries like we do with interconnect-names
   interconnects:
     minItems: 1
     items:
       - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
       - description: Interconnect path from mdp1 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    minItems: 1
-    items:
-      - const: mdp0-mem
-      - const: mdp1-mem
+    oneOf:
+      - minItems: 1
+        items:
+          - const: mdp0-mem
+          - const: cpu-cfg
+
+      - minItems: 2
+        items:
+          - const: mdp0-mem
+          - const: mdp1-mem
+          - const: cpu-cfg
 
   resets:
     items:

-- 
2.43.0


