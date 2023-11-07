Return-Path: <linux-arm-msm+bounces-55-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 315717E39F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37780B20B46
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 10:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971202C85D;
	Tue,  7 Nov 2023 10:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YqC6rCMd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80D62C843
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 10:36:10 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7BD410E4
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 02:36:05 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9e28724ac88so53103566b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 02:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699353364; x=1699958164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V9Vc2qkKhkx61HztjKbbqVRx45srzZVqd+8CPW3yS50=;
        b=YqC6rCMdNigzr6ulktd6QGMMSkJP1/NihqLUbUpI4aInoJ9L6wPk47eC1jxfH9CbZY
         Q1CtzPwGIz+OZeWMBgIIaB/esskESEoLMdDHqXU7d3B1qCzTSMstoldz68JjIPCstNB4
         7fv4+4uy0TzBMKGRUunnWR1uOcbAaEQLJkoN2fWj8Rmzj+fxE6D5ySVdJok805BbaI1t
         YODohfj62sNOJHGzSj2/D1p56Bq8V4sg2YcirKh1xe4ZzRmxOr1opDZO2ywp5JOlnA3e
         2DUeIPXkfe/T3gZpoxP38HbENhk1bKbFl++nQL95s+/mhWPpA1798GdFkf04CalDNLA1
         d66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699353364; x=1699958164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9Vc2qkKhkx61HztjKbbqVRx45srzZVqd+8CPW3yS50=;
        b=U5crnShw27QNtHc5pm3S2zseuQ2uI8p1T7T1fN0Vxs10Z4+onKNRVn2JIpqI8UTfQJ
         u4UJANwQ/ahqRIHY9REGWfLv+9dwDaQW3IggkQuD2Gxdj4b63zv31ZdR6OS58EZWjo9W
         NT/paTj1km9sC+EOWZg1Xjan8E6JRMxcA8uegSeyR1dvwADEc1w372d7/6RH4huQuJo9
         bJoVEhSKGMrhcXe0gt04Xf4rQm/YPKAeu2YY4MPl61VIfXdfcd6Y8LBu0n5+qDqYCg58
         j9qOg1fcqINNPbGPwbPX+bJoOAHvgRQR8foWEoOhybNZ1caPYrjaukLUY8+IB1+qcKY1
         M7rw==
X-Gm-Message-State: AOJu0Yy3FqJVJDs9v7/R5Wa2rZBJUFNi8FZwiFSoeE4QAEvPuXTAv4wu
	oKbe+zEU9zfsbJpZqu1oe9lVhA==
X-Google-Smtp-Source: AGHT+IGlcsVnMGNpyWLBotkYWP9vhPvQ1zyDE2+TWGxgndROuli3GOxflA+1dY6Ar37umkuXKpUK5w==
X-Received: by 2002:a17:907:74b:b0:9ae:65a5:b6fa with SMTP id xc11-20020a170907074b00b009ae65a5b6famr15853415ejb.32.1699353364150;
        Tue, 07 Nov 2023 02:36:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id g7-20020a1709064e4700b0099d798a6bb5sm877590ejw.67.2023.11.07.02.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:36:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: display/msm: qcom,sm8250-mdss: add DisplayPort controller node
Date: Tue,  7 Nov 2023 11:36:00 +0100
Message-Id: <20231107103600.27424-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the DisplayPort controller node in MDSS binding, already used
in DTS:

  sm8250-xiaomi-elish-boe.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('displayport-controller@ae90000' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/qcom,sm8250-mdss.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
index 994975909fea..51368cda7b2f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
@@ -52,6 +52,16 @@ patternProperties:
       compatible:
         const: qcom,sm8250-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        items:
+          - const: qcom,sm8250-dp
+          - const: qcom,sm8350-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true
-- 
2.34.1


