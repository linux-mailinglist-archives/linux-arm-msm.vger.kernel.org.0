Return-Path: <linux-arm-msm+bounces-5079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3557F815A2B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 17:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC1DDB23924
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 16:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BC730653;
	Sat, 16 Dec 2023 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xuJ8Bt8C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB91730355
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Dec 2023 16:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50bf898c43cso1717011e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Dec 2023 08:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702744022; x=1703348822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KElCPZfyJpQwk06b+Z31JKlsF2IDE8giU5N99VUu5rY=;
        b=xuJ8Bt8Czionx8BwbeUV4Z1qqMeu02K9CP18usDetznTpL3NoJjv8GhuIBtVdXCmpN
         5WFwTXZH2fj2TaKGTfbdvfTedKp6jcYq6wYr16Q/BwYkO1uGFY3k7LqD6myTqFw5FvOP
         HZvk3gPW64PL/J8SNr79da2+fvPZip8xva1YhMyP7n+NE29hTDlLzY7jX+o5N8ulD6dQ
         O3A2boIc2bAXtgV5jNZoKg8wKB0xZlrDmbqGzTqVVd6CmekWa3/+uGj828P6MKHq4Nah
         huhMEopWT186HRUZencxaXRzEVsdV++rc2kuur6CcgUIfxHXeJk7F3ICPm6S1RAeZLOp
         +jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702744022; x=1703348822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KElCPZfyJpQwk06b+Z31JKlsF2IDE8giU5N99VUu5rY=;
        b=oVf9Px37iVzIGWmF/oEW/iTPa0TU/jaVENXfGCyW0T/IL5hB9xSOf9Bhw1ikpuDsY5
         f1JpTTffsTQ0HQxMl39I0MBTBnwkMPULtOEplPEnuMnwWms7lTR+3UWPn+nzYZLlM+L7
         sOIROOJAs7SUaZE5ncJBI1lROD7VqbsaxgmYRgQ0H9YoA7cQFyKufbYG5e1QDld6W/9J
         Wt8HYR4vN6ihpYUVLfg1ia25HgUfJ8KddQTgKGWZSsMWqv2ypQx2ht8snpGinlpfqA2r
         3lovEXkkUQBty87lVvwYjPNBLR4SU+HWS1ZsiuiXijIZI33sP4K66zbNknh/7/MuFCSf
         rp0A==
X-Gm-Message-State: AOJu0YzsHO4cZucyVZVCMzB3P9+7qkdK3FMS7+umqYCIiiB1GmcLWLU8
	PpdDeAXddhBwoB9WRTe4dFUUkrRdXFwcNifOwS8glvoQ
X-Google-Smtp-Source: AGHT+IHJ0WD5two5WbjiaiaYK7rXCoaQopzMhtPMoeu7xcYMpvb1BNyRBM+wF4ZNJogK8hSahkEFQA==
X-Received: by 2002:ac2:4e8e:0:b0:50b:ea76:509f with SMTP id o14-20020ac24e8e000000b0050bea76509fmr3427264lfr.64.1702744021897;
        Sat, 16 Dec 2023 08:27:01 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u19-20020a197913000000b0050e304d437dsm69229lfc.223.2023.12.16.08.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 08:27:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev,
	Russell King <linux@armlinux.org.uk>,
	Joerg Roedel <jroedel@suse.de>
Subject: [PATCH v2 1/3] iommu/msm-iommu: don't limit the driver too much
Date: Sat, 16 Dec 2023 18:26:58 +0200
Message-Id: <20231216162700.863456-2-dmitry.baryshkov@linaro.org>
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

In preparation of dropping most of ARCH_QCOM subtypes, stop limiting the
driver just to those machines. Allow it to be built for any 32-bit
Qualcomm platform (ARCH_QCOM).

Acked-by: Robin Murphy <robin.murphy@arm.com>
Acked-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 9a29d742617e..0d6095290b6a 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -179,7 +179,7 @@ config FSL_PAMU
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


