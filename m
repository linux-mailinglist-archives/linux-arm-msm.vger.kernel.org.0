Return-Path: <linux-arm-msm+bounces-3702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 392D880888F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC858B213B5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891033D0D5;
	Thu,  7 Dec 2023 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EDhtN4RT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C563610CB
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:55:05 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50bfd8d5c77so752236e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701953704; x=1702558504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5KSmEP1TGocOwJYVVwYZKa9nj2Hg1ok92vdy7xwTe8=;
        b=EDhtN4RT4tBoe43bD3lk3YMoUGa/IxbdmBxoclZny95f7xW6QJUAC1B5RrybY7X9xU
         oQcyAv/cczxJQMjHnoTUoZPJeyQAkOiUKSqM9e6Tg8HuiDQEDFgVHvNPH9Y0inn83aLt
         5Zuf4KouuYFcCR1+XAT4Iai7xYFPsqMLoc3twyNDzLAaYcke2JspuYFbHr38UbDr7/LF
         pZ0ZDN6ABFnHzdV7fY2+ZIjxmnoUhIW/brqgZ57odpfqacJHGPMetGEHewKkkSiNOfvj
         6pLVBMlwnAeyxxuWhzfaokkeuPIfGjAUc9FSjzo7gR+OHGSPb/SX98DNgROZlA0JI+GP
         bpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953704; x=1702558504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5KSmEP1TGocOwJYVVwYZKa9nj2Hg1ok92vdy7xwTe8=;
        b=f9eHwqfW6KMYsbTYi9QfRs4Xl/lyDuMCya0SyDJAr17S2UiVKrzzaHbzREnKQzX68h
         6/nsFgiWZGcKL82k+X7iEG71Y5W4YMQMKEniM7wXj2pQkrnPByqsZFd9qX7IfiN6zumY
         aRq5uIq+6jc5igQz5elR1I00+Ffdyz51S+Z5RrjT9ftBxHpYlPpF6WgaJVoKR1TDIYc7
         lQ8ouGtSKf3AqPc39f/xO93XejFDAwBsf2x+1+w560LOKNLHnXjte3ram5vi3UtDo2UL
         gbmPHB2O9HxlE32BQADlINN0JNbkfGXDrxFkbtQJLlFZ3p8BQ89H1oT/z9QuBSGxseW4
         LVrw==
X-Gm-Message-State: AOJu0YzCblQ2klJWHFZmykkBVnuUUWhOhh+lSnNiyF5U7hLpng+NzN7n
	FfJNd4+1ZGrkB32CqV4QQAmIBw==
X-Google-Smtp-Source: AGHT+IEPd3y1di3O6hl7akm24VuD+UvFlBj59LsViuKsxVfNbyodkQMJ3vhlHaDmvfNAZZhg7vxVeA==
X-Received: by 2002:ac2:538b:0:b0:50b:f881:862a with SMTP id g11-20020ac2538b000000b0050bf881862amr704995lfh.128.1701953703825;
        Thu, 07 Dec 2023 04:55:03 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id cf30-20020a056512281e00b0050bfc6dbb8asm163659lfb.302.2023.12.07.04.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:55:03 -0800 (PST)
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
Subject: [PATCH 3/3] ARM: qcom: merge remaining subplatforms into sensible Kconfig entry
Date: Thu,  7 Dec 2023 15:55:00 +0300
Message-Id: <20231207125500.3322229-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207125500.3322229-1-dmitry.baryshkov@linaro.org>
References: <20231207125500.3322229-1-dmitry.baryshkov@linaro.org>
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
index 5ba42f69f8ce..45fa8ac001c5 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -158,9 +158,7 @@ textofs-$(CONFIG_ARCH_REALTEK)  := 0x00108000
 ifeq ($(CONFIG_ARCH_SA1100),y)
 textofs-$(CONFIG_SA1111) := 0x00208000
 endif
-textofs-$(CONFIG_ARCH_IPQ40XX) := 0x00208000
-textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
-textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000
+textofs-$(CONFIG_ARCH_QCOM_SMEM) := 0x00208000
 textofs-$(CONFIG_ARCH_MESON) := 0x00208000
 textofs-$(CONFIG_ARCH_AXXIA) := 0x00308000
 
diff --git a/arch/arm/mach-qcom/Kconfig b/arch/arm/mach-qcom/Kconfig
index 27d5ca0043be..0c99d0a746d4 100644
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
+config ARCH_QCOM_SMEM
+	bool "Reserve SMEM at the beginning of RAM"
+	help
+	  Reserve 2MB at the beginning of the System RAM for shared mem.
+	  This is required on IPQ40xx, MSM8x60 and MSM8960 platforms.
 
 endif
-- 
2.39.2


