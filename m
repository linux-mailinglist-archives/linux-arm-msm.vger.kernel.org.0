Return-Path: <linux-arm-msm+bounces-11865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A3485BE7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 15:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6433B267F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 14:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DCC6D1D3;
	Tue, 20 Feb 2024 14:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hj2iu2OI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2336A8D3
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708438576; cv=none; b=UOPC7hBO3TZX+sW8LjaeS5uNazWeUPBj4qjtpQl9ogBajd0Amr8APf0FC/aXsUSZV/+9TayfiucEXuwLZIbZs2ysUvSwNpw8DspVIXdF5PWcFK9kq54PBgKV5XAm6ALdlw1S4TTMp2z4Cae2o6jnyQXpe/JVSGXdq19YHqnPFuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708438576; c=relaxed/simple;
	bh=XYlYR8OxpeVvmXC1saF7WHBLyL9BLQ+hAMkfLosneSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KpF3QMj5xfDPOBJ8xmp5YPYba6RqCpXgwAAqFd6DXhxzKWE0y4mgQdjeB2NsfPM75FBqCkT+dBgj933YFWA1+9NNnQDC7nySBP4UdiVdOZl+5cDRpToXbmlD/Gt/Bgf8RRuJkm+iuxDJIN1xC37UYcn+OEyioGlmfzctW+YUWb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hj2iu2OI; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3e4765c86eso343318866b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 06:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708438572; x=1709043372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbQj3mp7H4OoQYFV5k9dEyhOUiy+Klvn+UhkFhJKrBs=;
        b=Hj2iu2OIduSG+Ol1eB85Wz/LdLR16YTWByWt+PNwSF3ObWaKJ8U2saQBE+Uqq6rT5S
         8mnaGWBUn87fRbD8+hdpY7gI78NStrjG0cKfJSDg4UmmroLlsoRZpx14MHa0t1Kpwgax
         RQIUznVYwFZG5XUIkJVoSbbQk/x61IF6d/Ic+IAKuXPSAF51MAoRUn8ApCxvWn6ApS8v
         tvxCjBMvn8Z8IvnOpM2Trn6S9PW8nUR2rO7LsPv6LQRHMvTAxUarKy39mkoPpBmV7s/S
         SA14tHKfbA9pdEbvMgJn8/EUpWDtSe2CeYqZLAjEb5bB6IxLJdwSdvxNe2kBouBW+w0h
         PwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708438572; x=1709043372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbQj3mp7H4OoQYFV5k9dEyhOUiy+Klvn+UhkFhJKrBs=;
        b=HhZixMO5u5/d+JtIaGF6c9lRhUuNbboONR8ygcztcANK7npak/otHBMGyTkYAPuSg5
         FSAoRugZucE24jRm1kCozpRCBQivJ4AEHpMM94uI6Rg3pm8DHi6dh5WJESQ2KgbAA7WY
         IgeigPfj38yibwYaVe8nPP/uf0kAvY8bsKg6phBlU48gk+Ey46IXjDF2Is6SkARp8MpI
         4pcsmDLQK7PHKZup1QbukRGt6Nb0/krcR8DHWaiGQ1ak7j4WwyZ8pgQVW/ecp2COGs+t
         OVYvIZS3d8lW8u65MNiknzHCwo9z1iCAHcg2biVLdlaqkoVEw94TeNDDluGAsUewooHx
         +pIw==
X-Gm-Message-State: AOJu0YxQPfQF6rY9S8Z8qXyiqPU1y8jvo3O8VAtoYKbyyBSANnW1BNqX
	uSaE68Q1uXtH3E15fLZpKCxZzfE9HwZmXExxCq3xcsRZgi/y38Bq8DDXxSE0VGg=
X-Google-Smtp-Source: AGHT+IHeaYqromQKXV63x2GOq8Xdo0svk0QhphX45LfqQuOwsD+jkKSct2kq2scOmWt8xpsXazi0/A==
X-Received: by 2002:a17:906:c786:b0:a3e:58df:fb08 with SMTP id cw6-20020a170906c78600b00a3e58dffb08mr4446053ejb.44.1708438571830;
        Tue, 20 Feb 2024 06:16:11 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id s8-20020a170906500800b00a3de4c7bf00sm3998534ejj.79.2024.02.20.06.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 06:16:11 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 20 Feb 2024 16:15:56 +0200
Subject: [PATCH v4 1/4] dt-bindings: display/msm: Document the DPU for
 X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-x1e80100-display-v4-1-971afd9de861@linaro.org>
References: <20240220-x1e80100-display-v4-0-971afd9de861@linaro.org>
In-Reply-To: <20240220-x1e80100-display-v4-0-971afd9de861@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=XYlYR8OxpeVvmXC1saF7WHBLyL9BLQ+hAMkfLosneSU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1LQk1ZxmTIC+nLc576zOYOqSTbjmHVkcJucIE
 Np/wdtyjx6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdS0JAAKCRAbX0TJAJUV
 VqITD/93oKXwgnE9me64LzCiFkoiYSArvAyT3TMEmLe8Z6uIdjglhQRBvW2mFA+o7YqYNZpmrvd
 MwIPbFFjM7h7Guj9l3SWYfH8oSrGSXhn2a057889KRm5dzXXpwkRpQoNGBINBCe4OXdwjsc7dfn
 buPYkH4ozhc4d6Gv7rm8XKCh7r/JlgK7Ulaako1hytqxER4nN2wi4HcLgm7MikUNDtBY7X05QtY
 bn4royGDRB0VopB0R+etVyig85SY6SxuAiFLQ36tNQepdsEDBhFJOFBzEYi6U1fouwsw1Kih3+O
 e9q90M1PvF1lILaIdRR0Ph6wDr2dNRpY2k9XnKW9XOikimp88wKkshCKc7Hks2kj3nMzCDoyZGs
 U7ib17+L5uB1cvplJ4Jpb/a9XDT2d9nbvLm3/ZVar2d8g8gwhaeUAbVgcT4/UzGfxkwvy9FFIKD
 FgHIuAvvHfyXKiMlsDxK8yz7KQFKE27fYbXCeqZP/Fo7LYh5711mjhfa8/oA9bfjVGWsNlHWc2Y
 zvs9mtTHDc36uWHwGcfmmyRnM/61a40hFfrkrQ+5Q+EOlovSrZnxl1xr5L4zz2zzhCXIyY3jGre
 Hamf0/55fGdQnveT6bmxRnfNzYe6s8mnjuydNWbePer7futL+ssjc/MzLVpg3AThEgi8ZKdg0xM
 cm6TYl7lFEk+i8Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the DPU for Qualcomm X1E80100 platform in the SM8650 schema, as
they are similar.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index a01d15a03317..c4087cc5abbd 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,7 +13,9 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8650-dpu
+    enum:
+      - qcom,sm8650-dpu
+      - qcom,x1e80100-dpu
 
   reg:
     items:

-- 
2.34.1


