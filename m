Return-Path: <linux-arm-msm+bounces-8855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD31840697
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 14:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48022289B79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 13:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D296164AA2;
	Mon, 29 Jan 2024 13:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwmQdUAB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F388E6313E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706534354; cv=none; b=ZvWvzlJvDNfeycajwQgkqGnhqsYHkt/Ytn+OGip3r2SAD7ci+jvAXgMPD1ONSXrn6JxuoyeNWG71TzCDabr9FBpFYzbYbl82OrjtkQDpsG6cE8QSnRYR999GZIe0tv02bTSGwUUdCPOCAdCS1VmUBSR5pyTEjO9/p9ApWRKAsxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706534354; c=relaxed/simple;
	bh=obEEQfmkAfxnjBW+PweeqoESi7fBuQn5BZP9Fnf2iR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uoyHrvaIUkHT5uaeEAN1QByqVNV4gJXlxeil1aTmiqzrigIE0gyXFIowMyxCxAX2NA1n6A3PxCLLsYzFAz3jVt8QFtDv7yahg1qi4W3t3Q1/EwDRdveJtnO1/0e/2uhJdEJmi4MmkeW2NorKRkg8T60hiZACLJLApBQa0nqo9Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UwmQdUAB; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a35f68bedc6so33334866b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 05:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706534351; x=1707139151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GG0GBWYmR303lhQbjP/lih7U/nLsvQ1GRwuqyhVa6N8=;
        b=UwmQdUAByTQvsZ8UckIo6hB9ORoV3rlmhrEL3OD5qt/IM5i3wU6jThDeXvZ3up9rMy
         e/VRaOH55a5dreCXSONF1Bdx2gtuCqSgWJ++uoxNyNIWE6MHsGHQCgmLwPvGFAoaVI+l
         +RSRiWpR4NLQLATee3+avimjXIvjd746YhWHum+RAW/3Wxq8ao/BC7PBJpM8wgx6KgQD
         rVdq1343zTIfjsNxyIfKXd/6ihiOB347PWcoJic8Zgvt03onJqZ1WC1wXEsSejPFXa+H
         8YLkMRX4ZqiS+4SRn3z2UDn14svrFxKlsgfMF3Xf4R3IgT34zy1Vlj2oTvOAE3QKDCBc
         9NNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706534351; x=1707139151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG0GBWYmR303lhQbjP/lih7U/nLsvQ1GRwuqyhVa6N8=;
        b=D4wshNcuVt1pA523htMEOAIup48/47e5OXV/t0qx87CIkiWG6MWvlOtclpCaQiezJc
         aeIzZqAI+hLKJi6oOHhluWeW6eN4qu8BPxo2ye7srJPGKc3/aQwy7fTolZihDDLDTUyw
         9/iMOyFOdh++m6+cHOzBvXB+1oFQlOV9DG1JPdQ8Xlxy6fiuGVtrBAl/f+twRn632n1S
         JaI6otDOumpZ5I1ekTLcfTqVVbrLo/ia4h80z7E7XSrDBeyYq/XQ9lVOX8zNDUS/J17P
         1b5qLYJOZ29cvTyIbp6GU1JeZXWDYSV2G5eAuGF1Igqbiqz8fgiE4kiY/QPYSEwYxWUV
         apnw==
X-Gm-Message-State: AOJu0YxApr3zumJQRwof3XvJlSVblBYHCC1rFoXNmlMfSdXgokgApOPn
	o5eSUZnFtuxE15REs77+brO6AwqXyf2bHQY8An8R5UD6Q5mJ2vs3Jlzar5aSzok=
X-Google-Smtp-Source: AGHT+IEJy4JQltR8i3WL7nnCfTH9WoA8KA83+7OvtRrL8fcRTBSUgiIoyZaw31At50+47iq+vfBl/w==
X-Received: by 2002:a17:906:c097:b0:a2d:2121:2a93 with SMTP id f23-20020a170906c09700b00a2d21212a93mr4511029ejz.70.1706534351183;
        Mon, 29 Jan 2024 05:19:11 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id q15-20020a17090622cf00b00a359afad88dsm1591658eja.10.2024.01.29.05.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 05:19:10 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 29 Jan 2024 15:18:55 +0200
Subject: [PATCH 2/5] dt-bindings: display/msm: Document the DPU for
 X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-x1e80100-display-v1-2-0d9eb8254df0@linaro.org>
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
In-Reply-To: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=875; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=obEEQfmkAfxnjBW+PweeqoESi7fBuQn5BZP9Fnf2iR4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt6XFMvqsCn2GbXA3hKh3+PdT5dkoMZI1KJEt9
 0ujMq6Z04iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbelxQAKCRAbX0TJAJUV
 Vo80D/96RIySVK8vNVIn96hqrcM85c5tCYu+ZCsjzpyfM13gPfwrzZ/DHNk0Ll0jIod8CkAp3fW
 dLmw4QLlALVFosIdJ2txSld1VcQiNKbLuJ9GvnCsgbcQ6dPj07BYklYMrde8tuMYoYm4E0HO2lW
 L8mmfw8j1FyuBWB1ETbnncINvDXJHRgQfUJYjGsAAzkQS+ocXYeIc9ZuSx2hPBE4EkFMF4v+QR0
 kUu6KApyJS2Y/7BSZMImkuJotbmQqkmkoRdiPp3g04ujhE/SycbyCI/MHbBNK9P8sKKfQoPNqBD
 KgA1CNa4D4HU53rCeqf9Ruwe9hwizLy9nOEOUStWBh78MNNQ6kQ2X+v9YCJTGsGlPYgxXfsxujv
 0UI8vGUm5CY3ccQq2UR5mxrAPcqWa4WiMW+2ektPPnCmS6ONS2wMYMuCx2rS2q0Dd8WHYjUYDbA
 +drBWk2Rs03ks3T/IoYSy75lGsIYLL+UnzlJSUs8z6sRLCGg+J+h70brlXfl3db2PjNhaH11TCm
 2An/Wlvs/excz7GL1PsXjYtQhEOkyjmr4Wu87hlNvFJXnvMHk2xX1RBC/uRfk/ANBL42w81ArWk
 4h69JC4e6ROgyx3KDy8RZkAp4rkVd1bIIIZ1aZ5Y21rVxjazjwKhr+ZfAONiBY6ktSVLWRBjn+x
 wFVzNOCvqkNnP5w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the DPU for Qualcomm X1E80100 platform in the SM8650 schema, as
they are similar.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index a01d15a03317..f84fa6d5e6a2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,7 +13,10 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8650-dpu
+    items:
+      - enum:
+          - qcom,sm8650-dpu
+          - qcom,x1e80100-dpu
 
   reg:
     items:

-- 
2.34.1


