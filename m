Return-Path: <linux-arm-msm+bounces-26657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE3E937D34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 22:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FDC01F216E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 20:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18E6148855;
	Fri, 19 Jul 2024 20:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RJwUSFV4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1834D78C9E
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 20:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721420212; cv=none; b=u10M8/ksJZKg/qlo59a4+vqVOeXIHDNcn7Yfx5XGxdVCQn6HVJaHp1mkFTksdqpMdTyMnciomQVRe916rP3kvhIw3mBBjz3+F2wwKb1WMMH7XvDJ1e7etW615xkI3/pKZBzvVAeq6rcQ7gmcjrtKRnHvSL65q2DIFtPydlQtZOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721420212; c=relaxed/simple;
	bh=7PfuL8EmAzULDj2bMgzZdzubi20nIrTMhCYmfWtcoZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ceAPu+ZZ/tITZyVEpfu/McFHyibVAWnEyQ+HGVjmTJWQKyzi74gAmrP54Bhdl7yKB/delq+dkZBtf2epnWQf/iDg02dg3PCrwdhdc3wa1HMMxFGazKCxVsl80V+SXDl1b5CiBQQhyxSVbHiL+C9p9kgI3jQCXrpOZmWUMtpS36U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RJwUSFV4; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a167b9df7eso1642329a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 13:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721420209; x=1722025009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvy3kdyKbzwX28a3czM+gIspgwuzslgEezz2/gnPdaQ=;
        b=RJwUSFV4cgJ9esqSoDWMnW/2oXY10tFbKOnKLh14iEZeBUnxzCruYISy0Un2mdYZB5
         KTnQzy4dO7IofSWGg5m+7P56sy3AweHaBOjMUoOgjRhpAGe5pLDE60iPkW0j5zYMP9B2
         FToHyR2YSD4i1fk0t3O5cb3ox2OaOF0Q9dN5fSaIcZ56O96cJMCVumCvdBaPBasCITqB
         nNo9xVxuRnb/6hvGvo9KHfPCF5uQ+NAT37cub1HhpbEqcZsTnDNo72+6QMFHvDBLVOh6
         +f82rnXN/Vf5ic85Vp5EZjHPyq5gtRsD3SR+EPBbodNi7MXGs6+RVYwI8L/A0jvbJSVi
         avXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721420209; x=1722025009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvy3kdyKbzwX28a3czM+gIspgwuzslgEezz2/gnPdaQ=;
        b=b4SmHvje9vglZhKnySp2jsV6yiXKeluxA6lFYMracDv+bPrUt4w5Lqji7g6x1HnRvi
         DA738tGxIXgOkfiE6G/z0MEZVIPe8S4w625eknYSl6F2oGRMlaWnbVOvmIRApNnW29dN
         mahxIv9wezcDss91SOODrfHQHHkhyYelne7pqR+ZRmWwsG7LuwN2fN7dTX+zOxEVp/aS
         OD/J9yRBzeQer8J0xMR54aYBgjCYZ2Lw/4kcB+GDpCr18vk8iqRuMJ6t3sKDAmLHzhRg
         SBzUa0dVbuRPSSAimANLNxo936Z2ToO0Sbag1iLvOvG6mMmKBuoVcfUmVL+pqM/sh33y
         E6TA==
X-Forwarded-Encrypted: i=1; AJvYcCUoGv+Ahz78KKQ8WmdqJr/1z29VWdqOVKYGJGRR5XOdab1UKdgVE/r2Kz4M9Vi/9rBPozHdScp/Ti+w89XPO4Ubh4wbGnG8Af04DABajg==
X-Gm-Message-State: AOJu0YzM8MCTcGmTGgB5bZMMYr4yCYzWVxDS6PNauJjLXodnL1dZBmZg
	1r/bV8czGVUQS10apRnhmJzs8yd5OfD5OO41EVlF7NjdFvQHS8QHauyoKiQ0nQ4=
X-Google-Smtp-Source: AGHT+IH675mRPu1BbuT2rdj3zXdSRVKHxzEBqfxewWck1waCn5vp2QaRlRL15R+XRadoXDVsep5n2Q==
X-Received: by 2002:a17:906:74b:b0:a77:e1fb:7dea with SMTP id a640c23a62f3a-a7a011301ccmr667735566b.2.1721420209188;
        Fri, 19 Jul 2024 13:16:49 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c922b6asm72332266b.172.2024.07.19.13.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 13:16:48 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 Jul 2024 22:16:36 +0200
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Lenovo ThinkPad T14s Gen 6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-topic-t14s_upstream-v1-1-d7d97fdebb28@linaro.org>
References: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
In-Reply-To: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721420206; l=806;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=7PfuL8EmAzULDj2bMgzZdzubi20nIrTMhCYmfWtcoZA=;
 b=2Hw0uXDgViNUESdOGV7dJMGYE+W33ATJm/dI7R+6E8EJ10bNrrISQdfBM5H2QZI7cTmMJG+oh
 +2tTJGOWc+oCZxu2w5sxnDZw8IV9SZ0Qq/ZL/L4ItbHm+3suQ57IMVc
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Document the X1E78100-based ThinkPad.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f08e13b61172..8af56b602de3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1038,6 +1038,12 @@ properties:
               - qcom,sm8650-qrd
           - const: qcom,sm8650
 
+      - items:
+          - enum:
+              - lenovo,thinkpad-t14s
+          - const: qcom,x1e78100
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - asus,vivobook-s15

-- 
2.45.2


