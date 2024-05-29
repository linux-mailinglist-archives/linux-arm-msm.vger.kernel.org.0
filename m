Return-Path: <linux-arm-msm+bounces-20928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B9E8D3546
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 13:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4B481C217B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 11:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0F017B420;
	Wed, 29 May 2024 11:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V41bpJc6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABEF16A373
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 11:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716981446; cv=none; b=VQpseANJ7KfUvdzIOdUtd1xseCC2f+YYY6grdLODxyQjpxkvmxnjZ3JLTpXz2l+xNRz+eoL1ij40Ca2xSczGErMxBfGWx/QKHLSEjNTR9Y6aF4fyHnFyByqBoXP/cK2KlKRrX/TOTQ6XEnF4WpPJHJsPLgTs0wNa51jhw8stPzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716981446; c=relaxed/simple;
	bh=Sgi0aQngI0ZlefDkmDVYahcNW5XVUG9yQMjjmHM4DJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lo3sBbdx2Q+fOZyceTR9RW8AcgNNCofBxTqt9ohhvfGjcFKCBM9zS1YQwuZ55src1fJSCXmIvVaV0bwbDMpoQqcvyHVzslDAkPtH1H1FMGfMdeJGXsQ/UY/49dSu0x2EQsgsulk/GJSBDxudXS9AeHWE4XJluYM+dbFrn50pbwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V41bpJc6; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57869599ed5so2255824a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 04:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716981444; x=1717586244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tWL57KKa+QuQvXQYrsZPzAg76sNitSs/rlV5ZQuRmPY=;
        b=V41bpJc6sBFGBAVrwu8F9kkbQV1huZmTdq0zifCy+2i53QupRqOmOqP1alDnnVzzrB
         5p+kmtKJYQwj2sdEG7O3O3WNDbC4oB5A1lyttwLjnZ9fdZOhKtMVl5SAX/JIW+bn+u0J
         s96OAhEpDdO64BAWCT8oNILOnmEE+oFCbwYffgts8zgdSfAgSTRhbJ02WyMUFztd9NzF
         w8PGgALDKJHl26pKzdzTU37sMHtyqo8QsUsKxI/H60F/SMF6sh4z4MOkkkNqsXp2gG+O
         A6thJCRc6whz5nmEBDuIaGajk1aTQ0RiQK7p7aFNWBn9GAcj1lOfrIKhCFkZ/Av+796E
         IIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716981444; x=1717586244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWL57KKa+QuQvXQYrsZPzAg76sNitSs/rlV5ZQuRmPY=;
        b=QBodk5m89Fdi/spHHe+RwWqOJk+SVY54kdGtIMFwLTp0uPHjHXdy7tZ+p2f0mLwPza
         2n/3v9Il2hFJGTmIrtVdPBWbjrNWSxK+9PAbXiGs1635rNc34RLBaDOkoaE0J9SY2Nth
         wlYGYXiyS2p2mNId2ykC0ghFhSCsiXT9dxnUQH6k2noqgPzUZqSFH1EK+nroFqqtr6tu
         N2qNNH5OhgRBPddTacGjh4/Rfsdc4Y5n3wrPHo7/w7n3oD/Rq/pSPzqY3a+lE6QMxQdr
         5nrO5UtC30bD6xPSmHfCXFPOloBivhaMDuA4+jc1vEDtoWl9A1oJrzOWrjYIvb/ScAu6
         FFKg==
X-Forwarded-Encrypted: i=1; AJvYcCU4de9TwCrJwejDLm5HXorovc8KZncHor8xM9fK6SYYTHAV7dXkt0MqWKtMnHBfMnYol/TCcZq1w3eAxIeoZWPiNNdjeockoujrc/AdSA==
X-Gm-Message-State: AOJu0YxBnvYbdIpgKVHV7e88Oc2gyfkzJ75/yUV9CVyXBWHMBGcCqg7+
	jmYK50ZeLhczytZzqPOvdKUCYdrZZ1wSAtYtyDECAfR2Knu5njQNhvKUOj9u9MU=
X-Google-Smtp-Source: AGHT+IFBFVsDLoOgEUSvo7P2yGtFnBm3LHZOccSGi1wpH8hCfOUZMIUZkAyJ3H2f0nmrgpHKjMiAaA==
X-Received: by 2002:a17:906:80c9:b0:a63:41d4:3ff7 with SMTP id a640c23a62f3a-a6341d442b1mr307901066b.8.1716981443601;
        Wed, 29 May 2024 04:17:23 -0700 (PDT)
Received: from [192.168.128.35] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8da37sm708826166b.183.2024.05.29.04.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 04:17:23 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 May 2024 13:17:17 +0200
Subject: [PATCH 1/2] dt-bindings: mfd: qcom,spmi-pmic: Document PMC8380 and
 SMB2360
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-topic-x1e_pmic-v1-1-9de0506179eb@linaro.org>
References: <20240529-topic-x1e_pmic-v1-0-9de0506179eb@linaro.org>
In-Reply-To: <20240529-topic-x1e_pmic-v1-0-9de0506179eb@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716981440; l=952;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Sgi0aQngI0ZlefDkmDVYahcNW5XVUG9yQMjjmHM4DJk=;
 b=mjWejaWxnUbOZHodArs0kptzd3ZTHEACqRcgx/iRVj3VLVEchNMfNYjeB+0wtGtue26lpZYIz
 AgTsoBC3PQuA1v9mMMCOaOy5Rb5i+jxzqwwDpzkRuOBnvvhB6p5f0Nz
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

These are just some more PMICs adjacent to X1 SoCs. Document them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index b7f01cbb8fff..a2b2fbf77d5c 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -75,6 +75,7 @@ properties:
           - qcom,pma8084
           - qcom,pmc8180
           - qcom,pmc8180c
+          - qcom,pmc8380
           - qcom,pmd9635
           - qcom,pmi632
           - qcom,pmi8950
@@ -95,6 +96,7 @@ properties:
           - qcom,pmx65
           - qcom,pmx75
           - qcom,smb2351
+          - qcom,smb2360
       - const: qcom,spmi-pmic
 
   reg:

-- 
2.45.1


