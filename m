Return-Path: <linux-arm-msm+bounces-13754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C21877165
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 14:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3A1C1C20CDA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 13:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416193D970;
	Sat,  9 Mar 2024 13:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s23bjsqD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DCC3BBF2
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709991104; cv=none; b=D0k1RjTI6FZk84xqgQaIwMiTP3CN8SWGDj8SIXBw9xZAKLdojBImKRuSpiGZv8+UzgPbnT4X4Llsv/YKnHBgrxqlR+3Qy1nx+KOXsyOjPzj0gTDHABe8d55nBAX/ETLONmfj5K6qGcTxmWAhsumgyWed8F92jv054SmY3X6vVvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709991104; c=relaxed/simple;
	bh=dzIRNamppTDwRXph5j+j6sHF8ZDQWmVY7VVa9HIkrhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHFyAK1axivbtFhpWaV823l67cGV1OAduKZCujqEiXZfYnkoc0mTaDQTeJ/j8RaEeKLbGXDFuTpuAEVF2TciFOG5xu8zWDojdWhVsV8i0GEaTOfO1ykFri/uYcoIMvF3+Nx+tIi83iMRnG7ZYne8o9plsqSjLNg3HKzkLdDOxiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s23bjsqD; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d204e102a9so36807011fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 05:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709991101; x=1710595901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9S9sVMkbewmcU+sMnLiPTREy1pYzZjdKzAeaIhzyiFg=;
        b=s23bjsqDQZr90LrSQJSBL+QQWWk6f1Yu/p1BlB1g8+Fau+aIxomaVo0DEAeA5LZHqG
         IxInETpQAso7g6x+s2n0+OnC1787lV2fPY+bp6tvqauwbxg0XewmLMyry+Z8lC7sGhkT
         Qjou3EbuwONy/l72pFOAQL/tP2ROv+khSIk4eAGLwozdOq3zLKqX6BfUFeR4mf+ZeZMk
         AigPzX35TCjhcJ9QIRstZXBV9IXN/biEG4vcL2KonXWPfDJ1DBQNyrYV0lV9+Ma8Z5GU
         HEphwalImz+TTf+6exIz4/xhPWFbG+hNXeffwssFUBySgMAn7+g/WLK7XegMn01F1JqF
         VSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709991101; x=1710595901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9S9sVMkbewmcU+sMnLiPTREy1pYzZjdKzAeaIhzyiFg=;
        b=Fo2IvzKKs0hlBp5jdZz+wxTsa1ZqsmkTCga+9kDMk8Yn+FoGWge24rUh+0wx/4i2r5
         NHthVrwuTiYGhge0PXUNfug+EgwGKZjUwJrxNDkd7ygdqalnly0PHLHElsEUqi55Prye
         sAgV1GABYIoHrN3WBCJBfImWtcsbIVU6ImHOuAHB+bwQKHPEuf9xqRnB5V9OYg5FG1wl
         lMFlJpYrg9P9jECW1Qca3ek7tGfaVZT+5Fq8lx/YNeROeTA0CZDy5tmzHAMNJQbuoXEc
         jIU6W8AnXkIy5IoeAmbFJ7D2MlrWLCeumzS1KoegFr4rz/hewDbVVUyNGjyTCWaQrCUz
         pANQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7v0QUTgLnJ2dIV2ZehBU2w7n7FUlh1LrciQmTxESx1wmz7VbV9qyWdnW4en77GvrGgXA7pDnpz4FQomw9eC4fPrk3Dger1y9WlQ0TLw==
X-Gm-Message-State: AOJu0YwH4QmEuRuH/iaYpLnRIV6URl5W3jqd0WD1r+hbKO7zbe2NgJEp
	aNh5ZY5zNIhKIyrk9Eamk2kflQO/cQCRMsPIKSqND0AW0H0saOrHT0hGKaiogZ8=
X-Google-Smtp-Source: AGHT+IEpSZeJhL5yoIiRWaKJ5Og/+Gu8F/5CU1zIV9HwGS9ow5HVn0ZE4zYgJJ2lmTzhhyHOkgWHzw==
X-Received: by 2002:a2e:9c49:0:b0:2d4:d88:50e1 with SMTP id t9-20020a2e9c49000000b002d40d8850e1mr1200361ljj.42.1709991100722;
        Sat, 09 Mar 2024 05:31:40 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id t27-20020a2e8e7b000000b002d08f3640b5sm298524ljk.11.2024.03.09.05.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 05:31:40 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 09 Mar 2024 14:31:09 +0100
Subject: [PATCH v2 1/2] dt-bindings: iommu: arm,smmu-v3: Add SC8280XP
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-topic-8280_smmuv3-v2-1-c67bd3226687@linaro.org>
References: <20231219-topic-8280_smmuv3-v2-0-c67bd3226687@linaro.org>
In-Reply-To: <20231219-topic-8280_smmuv3-v2-0-c67bd3226687@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709991097; l=1021;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dzIRNamppTDwRXph5j+j6sHF8ZDQWmVY7VVa9HIkrhM=;
 b=IARinJntgA9j3ldAG+sggUdQewMX0B8FKYRMYSHMxceXbAzKPita/P7clAon14ZE33XE2qsPW
 Svh21LycFfKCvFkZ3auFTkXQ2YwF/lhzL4YUB6vxLQIMsF3Jfuwiy3x
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The smmu-v3 binding currently doesn't differentiate the SoCs it's
implemented on. This is a poor design choice that may bite in the future,
should any quirks surface.

Add a compatible for the instance found on Qualcomm SC8280XP.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
index 75fcf4cb52d9..f284f7b0c1d8 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
@@ -20,7 +20,11 @@ properties:
   $nodename:
     pattern: "^iommu@[0-9a-f]*"
   compatible:
-    const: arm,smmu-v3
+    oneOf:
+      - items:
+          - const: qcom,sc8280xp-smmu-v3
+          - const: arm,smmu-v3
+      - const: arm,smmu-v3
 
   reg:
     maxItems: 1

-- 
2.44.0


