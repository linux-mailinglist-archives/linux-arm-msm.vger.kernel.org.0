Return-Path: <linux-arm-msm+bounces-5080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B2C815A2C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 17:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5DF2B238A3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 16:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43913065B;
	Sat, 16 Dec 2023 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FRyuzb4l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCE63035F
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Dec 2023 16:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e1112b95cso1729059e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Dec 2023 08:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702744023; x=1703348823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5ZLFRFzD1CGy334KNd57yMYTCMD3u82eZUZ6VE2QPA=;
        b=FRyuzb4lf7Euwwz4CSxmuGs6Wc7K1NFR9ZwsMbM01VefBHXuvHm9Ln8FbkgPCIFtXU
         vOSFGKhxomBJKiabhmGMk9X3791CvhL1RrqZWefDncsUcCdko3aUYxqaax0qXFrTT3jU
         1bhIfNbIEP+cz/zqqgBJngn32elnPTXnwW6JPjyzEhs7jgwMookKWUAqrjpvnhegYydw
         hY/QYad8RmZzQl07qs0tR9SuWsqoXgUMuhYNm7HFc7zlEmYuDNB/8fnynNnG9lYLVtO0
         vubi2NEYwtMzlTMa3T2vCcIW2OqdoSowemh23esR+tgHbQbNiSfn3qa2urNTWDHXtCSl
         oPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702744023; x=1703348823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5ZLFRFzD1CGy334KNd57yMYTCMD3u82eZUZ6VE2QPA=;
        b=RxjKfjnJ0qGtwgrCAUdsnSsINBTsOZa+57eJqmUK5zB3137cK3N5RnkVjZNQeewAvi
         xFJbYgesXKZBlk2q+QQQrvhDUeKqlM+oX8UqixVgmSppPk3BW0IMoB0XA0gzxMUNYSer
         LLgcVi8mx7a5sUxzGgef4OtCapnZ0HiKXfOAhq9KYJERVHsqzl9M2gN2nvm4KsITBAkT
         6BjmYthqRLbP6tJ5Xs2R7l7fQqhJ58dWZC0fi9wtus1ZYLqlcu1tzoqh6qRI570EfUz2
         vLOsa6otWqZsFZiHascuAHjAw+w3QPDWixMXuxmaJUZoii5pz4PEYTM5/LrqnkDuv2yH
         DwOg==
X-Gm-Message-State: AOJu0YyOcCX5PbO9YX+8qrHw0ffWF+8bBShx/KrLb5HVrqJ6Dp0t5b/E
	aibwEth40JIVvb9JAV3leaJsoA==
X-Google-Smtp-Source: AGHT+IEdlLjha0pDKVzgZ8VedXq3zwTQeBW66gbUelSUrCVVlVfnjfOPU+pT4taKuf9PB4jXLPRiNQ==
X-Received: by 2002:a05:6512:15a0:b0:50b:f84a:539d with SMTP id bp32-20020a05651215a000b0050bf84a539dmr4674856lfb.19.1702744023345;
        Sat, 16 Dec 2023 08:27:03 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u19-20020a197913000000b0050e304d437dsm69229lfc.223.2023.12.16.08.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 08:27:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v2 3/3] ARM: qcom: merge remaining subplatforms into sensible Kconfig entry
Date: Sat, 16 Dec 2023 18:27:00 +0200
Message-Id: <20231216162700.863456-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231216162700.863456-1-dmitry.baryshkov@linaro.org>
References: <20231216162700.863456-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three remaining Qualcomm platforms have special handling of the
TEXT_OFFSET to reserve the memory at the beginnig of the system RAM, see
the commit 9e775ad19f52 ("ARM: 7012/1: Set proper TEXT_OFFSET for newer
MSMs"). This is required for older platforms like IPQ40xx, MSM8x60,
MSM8960 and APQ8064 and is compatible with other 32-bit Qualcomm
platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/Makefile          |  4 +---
 arch/arm/mach-qcom/Kconfig | 13 +++++--------
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 5ba42f69f8ce..95216a508d80 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -158,9 +158,7 @@ textofs-$(CONFIG_ARCH_REALTEK)  := 0x00108000
 ifeq ($(CONFIG_ARCH_SA1100),y)
 textofs-$(CONFIG_SA1111) := 0x00208000
 endif
-textofs-$(CONFIG_ARCH_IPQ40XX) := 0x00208000
-textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
-textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000
+textofs-$(CONFIG_ARCH_QCOM_RESERVE_SMEM) := 0x00208000
 textofs-$(CONFIG_ARCH_MESON) := 0x00208000
 textofs-$(CONFIG_ARCH_AXXIA) := 0x00308000
 
diff --git a/arch/arm/mach-qcom/Kconfig b/arch/arm/mach-qcom/Kconfig
index 27d5ca0043be..f4765be1b2a0 100644
--- a/arch/arm/mach-qcom/Kconfig
+++ b/arch/arm/mach-qcom/Kconfig
@@ -15,13 +15,10 @@ menuconfig ARCH_QCOM
 
 if ARCH_QCOM
 
-config ARCH_IPQ40XX
-	bool "Enable support for IPQ40XX"
-
-config ARCH_MSM8X60
-	bool "Enable support for MSM8X60"
-
-config ARCH_MSM8960
-	bool "Enable support for MSM8960"
+config ARCH_QCOM_RESERVE_SMEM
+	bool "Reserve SMEM at the beginning of RAM"
+	help
+	  Reserve 2MB at the beginning of the System RAM for shared mem.
+	  This is required on IPQ40xx, MSM8x60 and MSM8960 platforms.
 
 endif
-- 
2.39.2


