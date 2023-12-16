Return-Path: <linux-arm-msm+bounces-5078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A89E815A2A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 17:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD9D4B23834
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 16:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F1C30646;
	Sat, 16 Dec 2023 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FMZfUhgy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A60D30356
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Dec 2023 16:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e23c620e8so1141722e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Dec 2023 08:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702744022; x=1703348822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXRZlAau+k7NGTbzeyPNFZOgIyK71YnKo+kgg/iWUAM=;
        b=FMZfUhgy6QGH2HgtShSxwsyxZ9T/gCgvZz6H3fBMN/7M/wnVxFrEZP0jcWaTKY3iTK
         uqCfosw6zXGEdQFFpirP2zD4LPVE5ZOrjgHV7RhnwtK0kybC1SLozV4lMO0Po+2k6sIf
         epaWENhiuiQa1VZ36vS4GDyE0Zrh9OY7Atwy/PBIzSK08CdDzL+G5b7Uu79MahtR8lEZ
         jpO0CJJ5nTi0iGrVixGqPM4gInBLns/63ZVmOcrsEmYCZYJz1I2P9mnOtoqhzO7g7k79
         qePUEFDOfbgv35I9wuLr999kIETd3ToZhyTWTdkVeXBRuWvn5gx1AddyB79TELcB4Z2c
         Q28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702744022; x=1703348822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXRZlAau+k7NGTbzeyPNFZOgIyK71YnKo+kgg/iWUAM=;
        b=PT89ISHqNHdfW/O/h0IMsVZLBs/KSr2HOvQ5JwpEjJJrzK61rtld15GV0qgj7FwxOR
         6KRoqVveSoUvh/UkeD/68mkCbsnLtEgTmbj0U2UBnxa3bPOtXUzkVrs6u+vWNL8mO//s
         LGSWetQ2U/YRTalfShGKBuvAkoBIvb9NCUMXcLQGKQRWpaNjpFgL0PswFuoZz2Dn6/wR
         Fef78knBmi9D+EugHF5DZsez76dKrgVCgslrH1jHFvTLyGC1rlBu8AUM6FPFITvoo2jK
         yZR194df7sxUtG0roAgAfBsB7PS3Cs4XSqYY5Q4n/TBtJwj+I6VYeXWRGklr6ef7EkpU
         PKvg==
X-Gm-Message-State: AOJu0YxDBxgL3FdJ+YJ03DHTe9Vz5To1KtsOVVJDk1Na9Gymz9qDUsBi
	heOLYW+SpteSHk+sk7+rhLp1AQ==
X-Google-Smtp-Source: AGHT+IE/jFD3yOHsP0n5a7l283VLf8+ombeu8GqYWfjwZgT22dw0ahGoGVYCJQsfdwyPuBgkZcjp/g==
X-Received: by 2002:a19:f70b:0:b0:50c:17d6:fff6 with SMTP id z11-20020a19f70b000000b0050c17d6fff6mr5574410lfe.1.1702744022620;
        Sat, 16 Dec 2023 08:27:02 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u19-20020a197913000000b0050e304d437dsm69229lfc.223.2023.12.16.08.27.01
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
Subject: [PATCH v2 2/3] ARM: qcom: drop most of 32-bit ARCH_QCOM subtypes
Date: Sat, 16 Dec 2023 18:26:59 +0200
Message-Id: <20231216162700.863456-3-dmitry.baryshkov@linaro.org>
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

Historically we had several subtypes of 32-bit Qualcomm platforms.
Nowadays they became just useless symbols in Kconfig. Drop them and pull
corresponding clocksource entries towards top-level ARCH_QCOM entry.

Note, I've left ARCH_IPQ40XX, ARCH_MSM8x60 and ARCH_MSM8960 in place,
since they have special TEXT_OFFSET handling, which can be sorted out
separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/mach-qcom/Kconfig | 30 ++++--------------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mach-qcom/Kconfig b/arch/arm/mach-qcom/Kconfig
index 12a812e61c16..27d5ca0043be 100644
--- a/arch/arm/mach-qcom/Kconfig
+++ b/arch/arm/mach-qcom/Kconfig
@@ -4,46 +4,24 @@ menuconfig ARCH_QCOM
 	depends on ARCH_MULTI_V7
 	select ARM_GIC
 	select ARM_AMBA
+	select CLKSRC_QCOM
+	select HAVE_ARM_ARCH_TIMER
 	select PINCTRL
 	select QCOM_SCM if SMP
 	help
 	  Support for Qualcomm's devicetree based systems.
+	  This includes support for a few devices with ARM64 SoC, that have
+	  ARM32 signed firmware that does not allow booting ARM64 kernels.
 
 if ARCH_QCOM
 
 config ARCH_IPQ40XX
 	bool "Enable support for IPQ40XX"
-	select CLKSRC_QCOM
-	select HAVE_ARM_ARCH_TIMER
 
 config ARCH_MSM8X60
 	bool "Enable support for MSM8X60"
-	select CLKSRC_QCOM
-
-config ARCH_MSM8909
-	bool "Enable support for MSM8909"
-	select HAVE_ARM_ARCH_TIMER
-
-config ARCH_MSM8916
-	bool "Enable support for MSM8916"
-	select HAVE_ARM_ARCH_TIMER
-	help
-	  Enable support for the Qualcomm Snapdragon 410 (MSM8916/APQ8016).
-
-	  Note that ARM64 is the main supported architecture for MSM8916.
-	  The ARM32 option is intended for a few devices with signed firmware
-	  that does not allow booting ARM64 kernels.
 
 config ARCH_MSM8960
 	bool "Enable support for MSM8960"
-	select CLKSRC_QCOM
-
-config ARCH_MSM8974
-	bool "Enable support for MSM8974"
-	select HAVE_ARM_ARCH_TIMER
-
-config ARCH_MDM9615
-	bool "Enable support for MDM9615"
-	select CLKSRC_QCOM
 
 endif
-- 
2.39.2


