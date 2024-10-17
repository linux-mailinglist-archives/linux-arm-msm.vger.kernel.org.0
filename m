Return-Path: <linux-arm-msm+bounces-34799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CDC9A2BAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 20:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B9961C22655
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 18:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A6C1DFE3E;
	Thu, 17 Oct 2024 18:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g4N6Z9j+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85371DFE06
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 18:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729188412; cv=none; b=dLAXmxUp5RAk62K8jdgmutD2ZH83v188xbqaBeyCJHqTsC3aGFEbdEaedwP8RvdCf8AnIjljmJIsygzWk91j3O24euBOtMkbNciGdFby3s/1uhp4iCHygMc9VhLGa7RAt4tCcVG5R4AVm0Bx/yR+bQs84nKUobS2dPKB7FLHIOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729188412; c=relaxed/simple;
	bh=lJ0LUusIeVZ84mBvRVqBOPZuDI/QEgNaO+WDWc3yBR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rEJ/a6N7gX4ED91ARQxyPYpGXSGlKds/LAL6bIaF6eW68WI3tbkTbPl6VJPem0HX91LFTK5J5cXhfU9n/kmfbtiazba6e1k6lasNgo7buFZsu8AZzFCHef6rca5FuxOJ0NKMgqUW84OfPcmcmLOL2begdvpWF3ytbGf5dKdtSMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g4N6Z9j+; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb3110b964so13022001fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 11:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729188404; x=1729793204; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A5k5FlQr8eQm+XSWy35+Shq4ayEnOEjGR0S1Aeo+Sfc=;
        b=g4N6Z9j+Zr/qRjHXM5YcTfyxAPDwmhzefuAN7o2daC8geXTodQHizhlXmqCokrH54H
         ZpWH13xV/8CQuyAiM2HmG+NrPH9qbjheXfsyyO/8wfA4QRtzjHhLPmx+axiSwUP5OpNg
         YoNv5nk1k/5ck5EScVDmblWjexpgvlniryT8KTrj5kAE7N6RHEbvTq5GGvkDZygyaLoh
         lYY+/kaIq2mcn7SLgXjIcgCxffSNMOubSbEsKzY6pwuW+7GBUpkBa5hGcFtw7Mw0R7Yn
         +BCXKhujObkZ3fQJI7wGn3g/D4LE26kDxVYgITYi2imqNph09eAOZSasDw3/EiMG0qjz
         cx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729188404; x=1729793204;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5k5FlQr8eQm+XSWy35+Shq4ayEnOEjGR0S1Aeo+Sfc=;
        b=V8MeOMLepEqm7gR0RQ44RrtWdTw3I6d17tGRkSkAlvyfTnasMp5IABAdC/m4uJDhKO
         TOJcbAWZVh4MaKLvKTS9ZuDD8j2xfWHZKaOZxZub4yClLf+YsOutF+sM3E5rdEk588Vb
         GG0XOfp6FeE0tn+vXvlFXORJkKDl+pt9Sy32WhFB317xLbfaVlQizAp6OQMCrHtyEBnm
         krG81hNxmW1zX+y/vyc5p0bFAITw6sHumhpwng38HfqeLK3orowk8XuLilB55jZU28be
         658a19dcQ7Dq2oycWNiykd9T+MtQfWSTsX+dgPbI3i6FmbH4UJyix8xlWwhBMRwwMmIJ
         1rkw==
X-Forwarded-Encrypted: i=1; AJvYcCU8io4+tdj/X/4YVSuqJv1h9atyUIx+E0e+zMCzh0S0MUH2ajWImah3kYCqXIu2xC7HjWANiaztUlt43Q9E@vger.kernel.org
X-Gm-Message-State: AOJu0YzYTHNtauvpgLDUAaI3Ynm3ZMOoLtc7Bqa2tpHugd7la0Ad2+Jn
	49jf8tVNCvW52QhULmInSptqRcoFrHY5UNJ5fCAqSVrGYNdfgB+SvYgledh30P1eWMFoAC7MdEb
	K4Ws=
X-Google-Smtp-Source: AGHT+IFz9Nsx3UX23NLybwupGYy2MzzrxLj7hR6kA72kb5OXCO9RzmJ5WXaRlhMeXggQ1yI5oqsj0Q==
X-Received: by 2002:a2e:6102:0:b0:2ef:243b:6dce with SMTP id 38308e7fff4ca-2fb3f18a11fmr80956321fa.10.1729188403814;
        Thu, 17 Oct 2024 11:06:43 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb5d1264c5sm7689921fa.33.2024.10.17.11.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 11:06:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 21:06:36 +0300
Subject: [PATCH] dt-bindings: iommu: arm,smmu: Add SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-iommu-v1-1-29d75f91fcf5@linaro.org>
X-B4-Tracking: v=1; b=H4sIACtSEWcC/x3MQQqAIBBA0avErBNm1BK6SrSQGmsWWShFIN09a
 fkW/xfInIQzDE2BxLdkOWIFtQ3Mm48rK1mqQaO2hORU9kmTwVPJse+XsjO73mBHAQlqdCYO8vz
 DcXrfD7gmcGxgAAAA
X-Change-ID: 20241017-sar2130p-iommu-4ce763051f01
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lJ0LUusIeVZ84mBvRVqBOPZuDI/QEgNaO+WDWc3yBR4=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEVIvVK1a3/95yZib1URABoSRiKIYuY3CIMv+V
 47V659ElrmJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFSLwAKCRAU23LtvoBl
 uCreD/9GE1ShV9dvJohSWmR9a4CiAJe5Im5SwB9QEy0AFiCEShf5JRXLXqOJXB47dG/RCRdSS/x
 +65u9t33ghOQE3FZsQylrHBuPXlpDXa86MBDZtT9juA1vSnGpF5awrA80isYgDWgrk3+6O6ifrG
 bxn/7HsZR8njl5WjiOj36FopqkCIkop5+znePaOVAMvI/rRfzcCLL9WcMZWXBBiPM7AWCV9BNRY
 D0e77uk5X+n8ZjG6vVtAxZ6NuNr6CbeIYYQV+Jy5GOsWXPKcD7UUeQFDyCtnCDjXclrEzIzLwsy
 ItD0yd7yqO+KezddPnnKjUd7qD4C0eCBI6m5FYwQwODxCT/1O3FZSr1Tm685SGOH5S+BrQ+Ed2D
 O4GvryNdB/pBpMNkPOwKYgZb7eo3LUugAYjjx7KK89uHTxmOYNfMP6+i/OxOGT4J3EHovUXI5gU
 v7WVDsZfEtDT/Zy5kMqBceTNikeC0h0GJJVQBDdz4q581y9+LXqO6/VGq1bf1fe3gqprAoQ67v4
 w8/5tZ1M1IODS5Xuaa9ynPrS57kYXzGicxE1PHWilFTsG7Vz9aANi79mTeHOQ72l0bPZR/unN1e
 Qvz57POj3C0+fvozOpA9bEctR/jDlr8RO3OaGDXhlbdpiX+c5haH0x4PG0Dg8UjcFoW9czdS6y8
 QOThDSBrgUIfJaA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for ARM-500 SMMU controller on SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 92d350b8e01a83f30ba81ba4f35107e16a2d2378..a4ecbfb53fb00d9a5c44acf3f7695b552a195b1f 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -40,6 +40,7 @@ properties:
               - qcom,qdu1000-smmu-500
               - qcom,sa8255p-smmu-500
               - qcom,sa8775p-smmu-500
+              - qcom,sar2130p-smmu-500
               - qcom,sc7180-smmu-500
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
@@ -88,6 +89,7 @@ properties:
               - qcom,qcm2290-smmu-500
               - qcom,sa8255p-smmu-500
               - qcom,sa8775p-smmu-500
+              - qcom,sar2130p-smmu-500
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500

---
base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
change-id: 20241017-sar2130p-iommu-4ce763051f01

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


