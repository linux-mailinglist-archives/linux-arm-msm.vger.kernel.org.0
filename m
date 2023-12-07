Return-Path: <linux-arm-msm+bounces-3699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE644808889
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A31C1F2141A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517B33E49E;
	Thu,  7 Dec 2023 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zeoq22n+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A99D7F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:55:04 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c9c18e7990so9471581fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701953702; x=1702558502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRRcxjW3hYUF4pvL7cDymuG16d1D2vZw+YzDn6n0y/M=;
        b=Zeoq22n+b3z4auVgMXGzve+VqM8ikqeT/CtZtWXmiBzXHjVknfMYtTDJ0Cxo9N2TZ7
         t7WwqrV7LDx2r/DUVsNu+p0U8OUI2yuF0uJpn6t1zzZTJPMiartQJ4LWqbf5kJ2L5FMQ
         O1VNbhbf/s9cTS8zIFk1Eb40LuMMSZVXUuvBsR6ehfuaO7/LUkC5TT2s7/HS6G4Kehdu
         lwpk4aHvpG4JR+cWEJUmerCtLd2ZrmIusFjeanTMWU2J+PnjP209IG5EETHO64yu7VF7
         jARHmM28J75JS6h794bTSwnl4x2xzCIaUivFttKf2NNXP9e2tLYYNzpK5x3BTZ7EX2lo
         PCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953702; x=1702558502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRRcxjW3hYUF4pvL7cDymuG16d1D2vZw+YzDn6n0y/M=;
        b=UMhBQbuLiP/moJMJhM/FPQMRS+5tQXU+u+PsShRVlNtPQMn5Q0YO8KMTjH4wNrZBrP
         htZX1uADTBmw54uGZtKj024OoAL0FnBGYEqNXecmMV4vCXt3G2nf8D4eQC8YVMCd04p4
         rNWnFxk2d8iZECACUczZc4IcTIZxL/N7u6oe+Yt6dKjRGU1O7uhb8sBPoYo0X3wuQuNE
         FfrfoiZAMNRC4nTYi9PcnWcBQfwWTI+CaO46R3e8plvU1hig8Z4Jz8HRi7gEtqyf1+/H
         nSKx4EvVkPG7pGHf00NpnFK8Lk9ajI34r/TSTHjWaBI/OpEYhM+5ON4voxb20xqT5i85
         jCZg==
X-Gm-Message-State: AOJu0YzZn4cLs73pnF9wZNf2Q6EVvQElMk2Vmh2ufSj7fL3bPXKc1UFb
	TknAgfA9XLATZvYbmDO4qKosAw==
X-Google-Smtp-Source: AGHT+IFZ7sHhE81Ocy92+1ArPxojSOEYpfmENzAM2vPFw3RZ+Xcz+EuXmeZtcNaYJEK+StIVY5K/Rg==
X-Received: by 2002:a05:6512:29b:b0:50b:f8d8:b176 with SMTP id j27-20020a056512029b00b0050bf8d8b176mr1354154lfp.124.1701953702303;
        Thu, 07 Dec 2023 04:55:02 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id cf30-20020a056512281e00b0050bfc6dbb8asm163659lfb.302.2023.12.07.04.55.01
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
Subject: [PATCH 1/3] iommu/msm-iommu: don't limit the driver too much
Date: Thu,  7 Dec 2023 15:54:58 +0300
Message-Id: <20231207125500.3322229-2-dmitry.baryshkov@linaro.org>
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

In preparation of dropping most of ARCH_QCOM subtypes, stop limiting the
driver just to those machines. Allow it to be built for any 32-bit
Qualcomm platform (ARCH_QCOM).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 7673bb82945b..fd67f586f010 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -178,7 +178,7 @@ config FSL_PAMU
 config MSM_IOMMU
 	bool "MSM IOMMU Support"
 	depends on ARM
-	depends on ARCH_MSM8X60 || ARCH_MSM8960 || COMPILE_TEST
+	depends on ARCH_QCOM || COMPILE_TEST
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_ARMV7S
 	help
-- 
2.39.2


