Return-Path: <linux-arm-msm+bounces-11688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D50785A4CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 14:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A02F2822BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD29936AF8;
	Mon, 19 Feb 2024 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dHm0Q74V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D10E364A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708349767; cv=none; b=Qojln9XdJmq0foiO4N1JFQzBZWE/hi5WcRHbPDjl8GRsoz4O/BLESpEtIYFO07TFqM9ATUFJpCMaeBwQNQ/a69Wk9d4HqVEsCcFX+nUBQJxfrJDQYssUmpNmPtcj694Qr3f2lM0H94dN79WXNxoAHjVDemZt7ntAJmyRAOyGB0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708349767; c=relaxed/simple;
	bh=iLSWFU0PEB/wfyF1Nv5EVeYr19/e5DAihIhWgNDJAow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z/XH53fCYuusKmg0B80qkrSduNGVjf8zwg0C6ZQXb+kMNP+qE/r2XWncDkrPP/+9CkTsbXD/LExFqGOrkRKleOaFxEMenAeLAdcdJG74/aR2eVl2FGAx9A3czSr4ckKwS6NjhgGzPt+0uy8EToD9KvKRqd9rHA8rCte6VT+yNrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dHm0Q74V; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55f50cf2021so5938489a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 05:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708349764; x=1708954564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vm4+HsWSLi5Bqiq8guveLonPTq6IX1sdSS8MIp6iya8=;
        b=dHm0Q74VnjbI5ZMfbUOs10dnil2KlFmkK2+UcNOeJ+LX+79FSEhcPGLnBcgDOc8k1V
         q+gWqAUs6ZsiXAiAZ90kJApfE/67PKrohNv6pdbySK4FS/oA5tGaZCH8/8N6AN4rBAVB
         dZ/mOZUHawy0MaJZ7vOqqTBeAic0o7e2yVIt1RM8TXSF3VWtNJZNhHZuhvD0OPA9Qavl
         dZlo1NlkyhrWQQcbty0d44i+VhbYLdNYzrOBseT9MYvN1gwHHb39Es6bM79S88aC2lmZ
         zEa9NYrUypHMtbDLXocv+a9xcXh90Ms/2rGjvusCvAjW2DOdZ9tE6KT6X37AeXD+4LrX
         ZXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708349764; x=1708954564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vm4+HsWSLi5Bqiq8guveLonPTq6IX1sdSS8MIp6iya8=;
        b=um4Ffx9BWH6l/fRIMM6rL8xNmTN5Q4Ums6I+HKef7uaxEkyQLY+EjjhhEwJzNys/pI
         5Gn9AxIkOqFB9x/LHL2K0cmycaL2NoQ2lCvLzLtCjaSHbqwC/c88jGtvkIOrhjZHYaK+
         Vyi4ndnjgvnaN7TmpPHzNvWtQLhuW7/PYjSkocDQIrfMsWKzGZZInW5is7nLeIpyBZ44
         Rgcv5czeskPz3LyCmgUS5GZdiQ29LqMnuzVqkJhwb+3EV9UaZzClinig8UWbOrByazUc
         0ETFV8Vfqing02RiK+A0gtvsOBIFEgay52XukBTPP4zgcGhbT/a7SeGse0qVv9B/ya0a
         h7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCW3XXxHTxsZbWl7E+6r2F4YlhPwIotJXb7WUsEKw4vOGK3IQoOJ6AKcK+U56vMNs9x4zWwfPTLO597neKtLecHseXAcqAdhgnpOVPZhZA==
X-Gm-Message-State: AOJu0YxLfJf4K//LBVPEnaelUEWS1K9uQVOyc7Ely6G45KhiqbSe2Uud
	Tc+UwgEo/Rd4/8BzQFHsiHysgT7+TLZZh1mcBVf/juXAAa2Bj3QmPy6S3YwOHhU=
X-Google-Smtp-Source: AGHT+IHV7bK4ehHh9S5n4E8JdbICBeyKCog4TBxeQJc7jVSQ6sgYL2AGYMpXguUVOZv4iBTFSYicGw==
X-Received: by 2002:aa7:d959:0:b0:564:3191:f407 with SMTP id l25-20020aa7d959000000b005643191f407mr4013903eds.12.1708349764412;
        Mon, 19 Feb 2024 05:36:04 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id q29-20020a50cc9d000000b00563a3ff30basm2900168edi.59.2024.02.19.05.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 05:36:04 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 19 Feb 2024 14:35:46 +0100
Subject: [PATCH 1/8] dt-bindings: arm-smmu: Add QCM2290 GPU SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-topic-rb1_gpu-v1-1-d260fa854707@linaro.org>
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708349759; l=1444;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=iLSWFU0PEB/wfyF1Nv5EVeYr19/e5DAihIhWgNDJAow=;
 b=71RQnNARetoCSKqpzfQqO6Lapq/qBgUH5HXLBQdA6ZcDXcoSaL+2ynFTnCmi9jFSY8Q7b8KzZ
 O5iL+UfQEyvAPDXeCzVYV8yaVrWJofN/Mv+M8WmxZgIBOjFSCjpHxRD
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GPU SMMU on QCM2290 nicely fits into the description we already have
for SM61[12]5. Add it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a4042ae24770..4a8d4022aebc 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -83,6 +83,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,qcm2290-smmu-500
               - qcom,sa8775p-smmu-500
               - qcom,sc7280-smmu-500
               - qcom,sc8280xp-smmu-500
@@ -462,6 +463,7 @@ allOf:
         compatible:
           items:
             - enum:
+                - qcom,qcm2290-smmu-500
                 - qcom,sm6115-smmu-500
                 - qcom,sm6125-smmu-500
             - const: qcom,adreno-smmu
@@ -534,7 +536,6 @@ allOf:
               - cavium,smmu-v2
               - marvell,ap806-smmu-500
               - nvidia,smmu-500
-              - qcom,qcm2290-smmu-500
               - qcom,qdu1000-smmu-500
               - qcom,sc7180-smmu-500
               - qcom,sc8180x-smmu-500

-- 
2.43.2


