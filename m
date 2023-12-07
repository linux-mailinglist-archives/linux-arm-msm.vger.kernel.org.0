Return-Path: <linux-arm-msm+bounces-3700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED7480888A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FD4E1C20A04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4BE3EA65;
	Thu,  7 Dec 2023 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="frMcO/nW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23864D6D
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:55:04 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50bfa5a6cffso732846e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701953702; x=1702558502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JA5daNbyCgwvSSjCzYxa9vhAfMiSd1k1ygkW4K36+HA=;
        b=frMcO/nWF4DLLzVNQsY/qbLRXyYtOtyXGSUta37YDdqoD/D+52KWAGVmgVytNOCX/F
         IVgP4e20n6ac5Cuyj3cT5lJbIbdinThLBTbOtK5gCXjVQ31iHcqzVj9LCVku9SVOX429
         T8hZpqSihA0gwyGX2B5RBeNN4wpqme2A+Vjmnw2fjnTWPgaKDOLZXK2azPZN1tYhQQUP
         0/cO5nPUQwYeZXMj7BZQuksCzO+oT7nG0yx71jFqN5XgWH/6QS+c6yoj3ZDuEIf9Ddv8
         ttHZssy2rSHmfsv1tp7pkI01Mwr9Yd5ud1Pd05Np8NKdYOhAIXGyaC6NOAMvr74ni6oU
         l1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953702; x=1702558502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JA5daNbyCgwvSSjCzYxa9vhAfMiSd1k1ygkW4K36+HA=;
        b=F5Qga4Vyq8L6JmhR+SRlrdaJVHSxxPogQFkdM6rLI3a72YLhoQWzcu8SI62JvZDUYf
         hJOXuOC7GJF3dAFvTxYiKQf7perKiQhc+5f5D/FKGqDBaKm/HKDBuCjpvCos6di3S6X2
         WPmuJ+XT2b6/ezieR18t4zaQViZ4vaU/U+iI7mDM/voXqvb3JmGS6TVU18+KHHVJ6pVP
         YQm6v68X2evj7V7HUG141+ooTbCP7L+wWldKW1ySafwslgUphpycoKl15dc+oHrTbvPb
         lDbydnFrITvH7vsr7sxYQ39KsYADBb06j7HBZHjpNzX5iq14sCb6Vqa4laGo9LQj8bqz
         dBxw==
X-Gm-Message-State: AOJu0YzDXcVqqit1kmkqXW3SRZNIqAzQvI8NS9mm4q7ztyexiCrigSQC
	AyECDU7GoUcCNQXmd13LAOoW/w==
X-Google-Smtp-Source: AGHT+IGViRtvlpdiCs1SPsFLcYgzGmJHBhF3Is5KUCBEwYegCA67nn8Q3E4ww4emr+dFf1lSoaEOAQ==
X-Received: by 2002:ac2:58fc:0:b0:50b:f084:7c8f with SMTP id v28-20020ac258fc000000b0050bf0847c8fmr1365742lfo.111.1701953701726;
        Thu, 07 Dec 2023 04:55:01 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id cf30-20020a056512281e00b0050bfc6dbb8asm163659lfb.302.2023.12.07.04.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:55:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] ARM: qcom: drop 32-bit machine Kconfig entries.
Date: Thu,  7 Dec 2023 15:54:57 +0300
Message-Id: <20231207125500.3322229-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kconfig for 32-bit Qualcomm arch predates DT and multi-machine
support. It still defines ARCH_MSM* types for some (but not all) 32-bit
Qualcomm machines. The MSM_IOMMU driver has a strict dependency on one
of such kinds.

With the DT support in place, this has become obsolete quite a while
ago. Replace all 32-bit Qualcomm ARCH kinds with the single Kconfig
entry for the workaround required to be enabled for some of those 32-bit
platforms.

Dmitry Baryshkov (3):
  iommu/msm-iommu: don't limit the driver too much
  ARM: qcom: drop most of 32-bit ARCH_QCOM subtypes
  ARM: qcom: merge remaining subplatforms into sensible Kconfig entry

 arch/arm/Makefile          |  4 +---
 arch/arm/mach-qcom/Kconfig | 41 ++++++++------------------------------
 drivers/iommu/Kconfig      |  2 +-
 3 files changed, 10 insertions(+), 37 deletions(-)

-- 
2.39.2


