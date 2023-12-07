Return-Path: <linux-arm-msm+bounces-3701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BC680888E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D10A282322
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681813FE33;
	Thu,  7 Dec 2023 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vS9g3SHV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D109F10C9
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:55:04 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50bfe99b6edso761876e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701953703; x=1702558503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXRZlAau+k7NGTbzeyPNFZOgIyK71YnKo+kgg/iWUAM=;
        b=vS9g3SHVs2A55tdg6+yaKVy7xh5AfQWZEs22yuWPJDg5JVyNd32o59c05V5tB9vjfU
         f3nQESSEMituK8GpAeHnbqUw2yeE9RjOGzAEFWWpEHyNzNirCOP5k3x5vfxhm678+lU5
         c5f3M45sI+QUURgfrNxwyrsRp+raQcA4Z+/fKM2IIsA1W2Sy8PJcPxRdO92DLcJzipxQ
         ir5U45IM7YAz/z+TobRseU9vwkkNgg1cY7N799idHJWlDYqejHvE6Bmkf0UiX5iPn+c0
         PXcCkytjbNvrzJm4alsuy0MUIQgBJHpfIstB9TfM2LyQb0BDqnnTgA2ya4T93XHeygNg
         Y7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953703; x=1702558503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXRZlAau+k7NGTbzeyPNFZOgIyK71YnKo+kgg/iWUAM=;
        b=iNA19BzXWl8yarEygiUsFT/uKg40BIcTnMhMmDPiKHrU3qtmsylX1gqT2movLlQHKn
         HVMBanBN/2YTEJ3tIddIz66kNK28190lWAmSTUV7ezjMOgNaMBTXL55C5gqUI4cDft24
         vLgnLu28BZjQXcRSytGI0rpZ7363qX4VX1fOyFsIqGYFUVrP8zLulr/h8FsQ10bqJTeN
         NVUsoK6GKewtz4OK90ECpr7MBlZhrkaapObmVEpMtqDPZlzEWhd8CZcvGuASj9aG7qU3
         MD0MjZhqT/pcFmBU+AiJ/m050+pocGwNC6iKbEDbj0AydKp+uOV1vhRjl5XPcIuWLHNg
         bMdQ==
X-Gm-Message-State: AOJu0Yz4crOb7tEdJjvsbnPw3Zobs2Eni9rNdLa+RVPyyXwZ8nr0SkpL
	057vplCQuVuCHRQzLikozu/ZtQ==
X-Google-Smtp-Source: AGHT+IH8ass7HzS6uZLXeKJmVhmIziNGBwk8jv4tdxJanOaneYQPNZLBKTC6kWejFA4F6qBuDA1Nrg==
X-Received: by 2002:a19:9102:0:b0:50b:ee85:ef5e with SMTP id t2-20020a199102000000b0050bee85ef5emr1247967lfd.119.1701953703035;
        Thu, 07 Dec 2023 04:55:03 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id cf30-20020a056512281e00b0050bfc6dbb8asm163659lfb.302.2023.12.07.04.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:55:02 -0800 (PST)
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
Subject: [PATCH 2/3] ARM: qcom: drop most of 32-bit ARCH_QCOM subtypes
Date: Thu,  7 Dec 2023 15:54:59 +0300
Message-Id: <20231207125500.3322229-3-dmitry.baryshkov@linaro.org>
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


