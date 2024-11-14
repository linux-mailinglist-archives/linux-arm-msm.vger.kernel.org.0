Return-Path: <linux-arm-msm+bounces-37857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBD99C7F7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 01:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC02D1F23C0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 00:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51D2EEDE;
	Thu, 14 Nov 2024 00:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGpBQQtd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398568F45;
	Thu, 14 Nov 2024 00:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731545253; cv=none; b=D+1+OMPrNtqA8NqgwXP7yoOxiNubaPR4GlRpXKsrQ5TVBAeNZXDYH6KOl8BSQXuEbDE+1eHiO6cGhk29ufJFPJ8hz/ecRvANfRiZrCWMi03mMqCy0s7iN3NXRZhnEa4s6NkJgsI0D3HMRgv8SCFGG2UhOP8WnVV444MiwzQcd1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731545253; c=relaxed/simple;
	bh=ENClf2k/0srqZ1Tno5IWk8kqgefUXkcVt7om+HGziMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AI+xhuJqIrlWq+jybGhAjBOhh+O632JBHlDI/lOM12GG/qykmj4xjuBjvTVgukLtpjuZcXcK69SFOz9Elq6mBtKkBgaXwcxCfsM/7BF1zWkU8fhF1dnjnsgz2mi7aj8/3ozZl6PkjEL0r4wKGZA4RkYZUj9jJ2LY1LxPp4/By/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGpBQQtd; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a4e5e574b6so115195ab.0;
        Wed, 13 Nov 2024 16:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731545251; x=1732150051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLKPb6tUtWuvaIwy1RvtfFfoipFQqhXlm0WTPWG9stQ=;
        b=nGpBQQtd6mVw311/zqCRy/0dpHf+qt6Z15vG8U5juaYLCe90S10wYs3l121HQtf4/W
         WDq3P1hGB7a9Koq8o83MVKTdzs3XaYKwrREbR6p3Z5AylA4lSb+iErL0qN6Sm1w87MIF
         U9TvpPowNGl+vbXBsfwBbd01ansgwfCiP8nH5y9VxvjEKEudxFqjszVz6Ri1VSLrs8+D
         MaqXrUB6HXXaHmZJWGz8ByI38TLCVzMRASm/yJ7/j/9khKmk7u3muLpXOZQ1C9Baa/V6
         a77jqGXOBeuLedo6JL2g3XH+WpP2WEiwZ3WVBURvTwYi1d9W+SQyM+ctn+AlutKaCBsF
         0NQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731545251; x=1732150051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLKPb6tUtWuvaIwy1RvtfFfoipFQqhXlm0WTPWG9stQ=;
        b=iCuqudoZRp42A7KtDpBJJZbng6m3x+JnD6zF8lq8H8mrzy10+cENZNlIOoDM5km49c
         nwO0Hr+GHpapjM7sOCmSuOiACQRrXlL+X9Hb3fFy4ncDnYwtdG23qi3muPIcrMIPU7CX
         D+dIqr9IacK8h1wG/nM32apPN4NVxyxihEoFQDUsENpy2WAGtacoCpteSM1Cl/05YRSh
         7QGMo4rec4U6mRAJqH7C+SmEh4Lb/ANxLeVpL28SCORK6V2G8trcz2n930ahqIMs2c1n
         H+/RHL7qN3yOTfUuTFIX5yLK+5dqzlvLd4KRpGaiIAhqQyy7/yUgBRBCuIlt51YLHBSJ
         3MSg==
X-Forwarded-Encrypted: i=1; AJvYcCUY4eMp9sE402/Xu56mcLhPljfOfpyAJpLeOafgBY7P59aoJAGjT4xQavProG36mp9NDRPnqeBvLdIn0E1D1w==@vger.kernel.org, AJvYcCVgEQ0M3P9SiTdJ6yO3ZRB2TjsAqSQ3cy9U9U8gzGkcrxSVU3z+thw5o0by/45lldzw8HQAm5qmafJB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuud84yVFxzKFi6dBZio7rcPq/Jvcks0dcs1tCZqZ2cJ5s5+wZ
	3+6CxyBp0EbeFJAHimbm01qTLeLMBh8aiAX8lGp8S21im03jJmTF
X-Google-Smtp-Source: AGHT+IEQPohY/RxprSo/ZE/amxJXjaPA/03CfPwtD8Zlbhh428jqAhrJ8y9EcENEoACl7aqbla2/TQ==
X-Received: by 2002:a05:6e02:1709:b0:3a6:c4da:6031 with SMTP id e9e14a558f8ab-3a71de54216mr21112185ab.2.1731545251314;
        Wed, 13 Nov 2024 16:47:31 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::8f60])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a6f988fc9csm32277105ab.65.2024.11.13.16.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 16:47:30 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: iommu: arm,smmu: add sdm670 adreno iommu compatible
Date: Wed, 13 Nov 2024 19:47:15 -0500
Message-ID: <20241114004713.42404-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114004713.42404-4-mailingradian@gmail.com>
References: <20241114004713.42404-4-mailingradian@gmail.com>
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
index 92d350b8e01a..6d1b92a57dc4 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -119,6 +119,7 @@ properties:
               - qcom,msm8996-smmu-v2
               - qcom,sc7180-smmu-v2
               - qcom,sdm630-smmu-v2
+              - qcom,sdm670-smmu-v2
               - qcom,sdm845-smmu-v2
               - qcom,sm6350-smmu-v2
               - qcom,sm7150-smmu-v2
-- 
2.47.0


