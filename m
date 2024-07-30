Return-Path: <linux-arm-msm+bounces-27341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B8C9403D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 03:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E31BF1C21954
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 01:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8AAC8D7;
	Tue, 30 Jul 2024 01:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yelx25aZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641CC2C6;
	Tue, 30 Jul 2024 01:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722303513; cv=none; b=kYeJW4Hxy7gK99V9rjV4j0oZhGbpVLg63BcOkBIPtIrRrTYGUMD9Brr/8a9qvjJNcCaoTRFeVr4+QmcWyZRZM68Wcew6Va5c7TrmUzyr1ftwvUM8xBokG0ivVdTU82MwnGZmIoDu5RNCLWnPFsAeOxFQ4HUawlefAN2hTIvNU1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722303513; c=relaxed/simple;
	bh=ax3TPARwN0WV0f1DYefYxiiOKQRlRBjw40MkPYhauHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IqTP5VfkR9Wiek8s5l7pNrEN6x+nenNUXI1m80jKaRNaZOZfqtwghH1d9Wg3b2OEFHluRUC8duQuxvwQ1lRq7VxVTTOs/Bjl7NopU6jIv1maTGqG4HzQBaBuknHhcOVv1h7BV6WSvrFSgEmIGEQ7sWr2THysPvofXIEW77naQQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yelx25aZ; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-44feaa08040so23734601cf.2;
        Mon, 29 Jul 2024 18:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722303510; x=1722908310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jadAqLKFE3q2pZsf/6bbztkcQnmkofhXBTNZedlCiwM=;
        b=Yelx25aZCfuPmYQYToDNr5ijzUR9uY/xAtYWkLWfI5FZXRMHmtstWDSMcWM1VU0b39
         hgvVSbmUL5TjyrJa4h2eZjSSrJWuhwtvuFrLhYG0bwkpxq+U8jb6AyHn5jYxRowJWNAf
         j0Bee9Fgz4YZxtx6WkUcQ4/rhXgEUeVkEM958XVUKYensjz2vICIYKq5fwYpJ4JanGA5
         Xb6m/4umcrdVkkzoSwOXw5hqZWlRCMrY4E4DzyWQ1gJpBMSY1OiL2eBqS9klhJiC/SK/
         brItPztLaylpdCwM2vXYetx2wVmPTw/X9xDDeMgH0npDRUYTJ3yGZ3jUFXy+3JzCfY10
         mH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722303510; x=1722908310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jadAqLKFE3q2pZsf/6bbztkcQnmkofhXBTNZedlCiwM=;
        b=jvyBFlcDbWCzo4Gkz6+Vd62m+p2EK4RxfUiu7PL3OehmZYZSRNhPwBTi8NuAgYN0Zh
         iqyFBZBfW9loibqWpCrJFywaM2sQdHDnoxRRD/thjsEV5/fIei8P6IZEoIFKepgso5rk
         oQfkDmQsnn83Aq5w69i3fq6f/t329vvRPrFaO1lSibtYkKYoSaFJZNHaMJWsG3uCAoni
         rpQVpfRpBeKIFNFUQX6qqtmEQgOwMjkSlU/nCuB8oeg8ATtO6Sv7IImSKPyCWJCgv7Ss
         1xoWqCRGbDQigaBniJTNe0NX/GM32PvrF/wjOmfx5wos2+i5aJChdurhRSJO8iUUvYoe
         vZlA==
X-Forwarded-Encrypted: i=1; AJvYcCXdBHlBAE93sCNHhxVz2yV1zFcrD9pMie8v/Cy1v5MN1uUOV9aowl4zdTgupsmoLdbKPo3vFMQXLYp+gYjGGLRrH78wy8jKGqbtbeLOL0bok7WKMKvkREdURJ7XOC/JXMZQlKiBXt4KPwU=
X-Gm-Message-State: AOJu0YwgVu4amUjyzU8r0+cEqxKuKSVJHUmjgFVA8sbm6mU8AauTt+LA
	ic8kQc6FZtmQvhlpHNkTOOumk647qprmoJ46Rzd7etG+YS3MJLVk
X-Google-Smtp-Source: AGHT+IGYK5Xjx0Vrl3G9T4RWpcjMNrPODmKbYEWMFZUZH5DSxk2I2TbWckPM+lm2RVZ3ltORXgQ/7Q==
X-Received: by 2002:a05:622a:1b9f:b0:44f:ec6b:9b01 with SMTP id d75a77b69052e-45004fb89acmr112733241cf.56.1722303509828;
        Mon, 29 Jul 2024 18:38:29 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44fe814741bsm46607701cf.29.2024.07.29.18.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 18:38:29 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/2] dt-bindings: iommu: arm,smmu: add sdm670 adreno iommu compatible
Date: Mon, 29 Jul 2024 21:38:22 -0400
Message-ID: <20240730013820.41702-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730013820.41702-4-mailingradian@gmail.com>
References: <20240730013820.41702-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SDM670 has a separate IOMMU for the GPU, like SDM845. Add the compatible
for it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 280b4e49f219..c672f7b6a2ae 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -116,6 +116,7 @@ properties:
               - qcom,msm8996-smmu-v2
               - qcom,sc7180-smmu-v2
               - qcom,sdm630-smmu-v2
+              - qcom,sdm670-smmu-v2
               - qcom,sdm845-smmu-v2
               - qcom,sm6350-smmu-v2
               - qcom,sm7150-smmu-v2
-- 
2.45.2


