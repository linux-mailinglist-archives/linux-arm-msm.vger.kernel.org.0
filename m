Return-Path: <linux-arm-msm+bounces-4219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA9180C9D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 13:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5551C281E5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 12:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570B43B2B4;
	Mon, 11 Dec 2023 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ghveoY1b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700C39B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 04:31:10 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c26a45b2dso24022445e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 04:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702297869; x=1702902669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VOobDHbYbVICzHx4WCyFbYqB5rRjPFGXbV0nxhsk/8I=;
        b=ghveoY1bwOzOgcsFnUlIIc/xu6Y3A22M5CPGbNhTMCQa239S6IN8SHgbR7SOSbbG3+
         +aPqKal/NA/DP2e7k1Rw9FuoRGtrukDRGzAXhgmsrHNvNZsmWValn8T2XQtY7YLMLLQE
         Ic94uQViVJabjdQkV1oqmDSSyACZ3I/1Qi1eeXRodsb/duKQsm/mkZmRyj9dBPDgenb1
         k66uMmAVkjz+QRaOt4QL5eEeCqm1EBF0Xw2ZHwNbWe3Mp5Rpt/bwZAjjcfZBl16ZS/eg
         9N6w6rQe7GIyKC4HiSEZgbTWoveHn2g4eZ2nVsSrQxLxAFKf/8b8MZ99LUQ60vvoQs03
         P9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702297869; x=1702902669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOobDHbYbVICzHx4WCyFbYqB5rRjPFGXbV0nxhsk/8I=;
        b=ncGrjujPArX6HPNtOgTSiNmLjsJQOthqIxEGa1ax19KR+SPTDB0Jc9YNcQeTiITRRK
         mkNnms5ccMY97glszZWuDheuitPqoX4tjcNU0NckRwLgLFaG4CVkm5fFnLaDUXUs2g6E
         H3/AJ3EVdz5CWvSkFE9wQfvDDQpuX9ojW9GaToOPtEMBsMxPYBtpUpAdM8SH4q/g01nx
         PRP9P1etakcVeH2L86w1PnylMOy6gi5wjJhMKvnU6tVnAayAFUr/KPIeygoz/Ks2YH+R
         mbKndtvRc5EblpUIjRO7cLXxN4RgEP+AOeCUHeNUF0uX76FRqd/76Uef7LDjSTKpFqJA
         +y2A==
X-Gm-Message-State: AOJu0YwYRipuexANIQNoLZ+5jVO+oyaikUDA/Rrtsc50ogl0XloywxRs
	X/5AAekYKrU2uTPxiplp/4XVFQ==
X-Google-Smtp-Source: AGHT+IGRxkN6z/jb6t8VFhbLYKIQhgJmBNUTIAsiGZuBWuWXZWBx6PeaFMH3wkcyTYMkokuRlfngOw==
X-Received: by 2002:a05:600c:1503:b0:40c:2c5f:5887 with SMTP id b3-20020a05600c150300b0040c2c5f5887mr1997537wmg.22.1702297868774;
        Mon, 11 Dec 2023 04:31:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id s5-20020a05600c384500b0040b632f31d2sm12932313wmr.5.2023.12.11.04.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 04:31:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100 LPASS RX
Date: Mon, 11 Dec 2023 13:31:01 +0100
Message-Id: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for Qualcomm X1E80100 SoC Low Power Audio SubSystem (LPASS)
RX macro codec, which looks like compatible with earlier SM8550.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index cbc36646100f..b8540b30741e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -19,7 +19,9 @@ properties:
           - qcom,sm8550-lpass-rx-macro
           - qcom,sc8280xp-lpass-rx-macro
       - items:
-          - const: qcom,sm8650-lpass-rx-macro
+          - enum:
+              - qcom,sm8650-lpass-rx-macro
+              - qcom,x1e80100-lpass-rx-macro
           - const: qcom,sm8550-lpass-rx-macro
 
   reg:
-- 
2.34.1


