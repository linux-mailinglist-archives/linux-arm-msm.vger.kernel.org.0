Return-Path: <linux-arm-msm+bounces-11368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9DB857F87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 15:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F6071C22218
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 14:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5232E12EBDF;
	Fri, 16 Feb 2024 14:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMBaU6me"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1385F12F367
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 14:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708094441; cv=none; b=fxHk9xiZYiYJ9k1bgEKCJEJ8YL0kZVivQ5iNLoo0KvsCto0XMeGtNab5PzLc2sMfPCECWAcP+GKhYCHhqWgyMrRA0PurLUnyGH4+nFqZabvIyZ+OlECtc+3O2gxnSr9dh73RNcfSZ/1xxpRoV6bmzQWueOhlg+ro+5gCxRlnf30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708094441; c=relaxed/simple;
	bh=JRNY0w7Ro2R0aulceus9kSJUlVFLy2lL65NJT4HL82U=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s0Gf+95VR2LL1YbGG87P3jbcORyIPpGCKKiislB560BMP0DaCBooovPba7rwPJLSvFYTsLTgqfrNwsv+YYhpO7V0cgL9/pjZBs/t03KKziI6bbVi0W/q/Y/MspfFXjf/5WE3kK94/bhInVu64lKki+IXQnYbuC0HBVWTy1q2zmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMBaU6me; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-562178003a1so1025857a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 06:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708094436; x=1708699236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asD3ev0Cb3OxFqrbvaOTmglMW6LCxeDZuldyNVrUzqM=;
        b=HMBaU6meM0zNFQx8a9qVCgBMTlIgdLdcpZA4R7rBTUt0icL5+6V4gr4mQxSwK/cJN9
         Mbm6PDM2lU88SRDLKHL4Kop0MMe4om6ZsKAKJpHAQmczJJwxvtAZXsXQKYUUZe1Yyv/6
         VKX/RWrR6gbEb0UKEjR5L/11s0GJaOpQTQ+JG/S0ZKuc6j5qJ6tq7DYngDXf+Uj4/r3b
         Wi4r/8GYa5d+T3WQW30x1uXOHwAECEdBeg6OzhKPTdATJTqaiQhIz+oLMtsiOI4d76gU
         50/XwMAoSY7T+5as8AillwaOru1Dii7w5OAEcPdmtNoU0tMIn15dW6GfjkkzbmHvDtN2
         w0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708094436; x=1708699236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asD3ev0Cb3OxFqrbvaOTmglMW6LCxeDZuldyNVrUzqM=;
        b=JXNM4243kB4by0Ig/kXT+Nz4xAvnkWDJK5qNwn07yWt9RVlGL7JIuwSXD6Zsfau6dx
         PY6f4td7eHHWJbkvXRP16+VTKlMfN+4HvP+Hs99baqAz/nG8pn1xwoyABSSOSRhvp8nq
         j4O93tR/lhyYDxeuU66wm9MTbaRAxcVz7XueBc0Co8/mE8soBxLj+gZj/xoWsNGLK6TG
         aYtRP+5VqZ6b//Zr0XcKOUSRFMIJVtAGdrAVwe0IY8xQ/VzysGLzW1+n/LLKNxZLGkDj
         oiNZ0dnuDId6H8dM1j94l8bVdSjWVdSc/uRNLLACxBRe0vhxCeiasxzSCx1ryEDbkd4O
         bwcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUybtOMEPFzPANl9EmKhvuGfd/Hphsx62D7Xw8FnIBGYcbcIChulCrFiFsQCbvfBGBQtQkMYCwX5gOPUIgtzZVV8Yt97RKATZZEBRsvxQ==
X-Gm-Message-State: AOJu0YyuIE0/mLjm+d0tC4BjjmwBWDDSNYAYDt9MooC3BBHBBf+5lDQD
	5YTgTLvzusCsD0e/V2gblTopo/RvVJyor20nnlcdoubWUIAmIZI9XrGPt0IYAoI=
X-Google-Smtp-Source: AGHT+IGCyUGN+VLUaRlt1OZxHWuQFmwSgWLlGY6S3fHlEaQRS780PIZW2GJtYg2x+OIezg266xrJrQ==
X-Received: by 2002:a17:906:7d86:b0:a3b:f054:92a2 with SMTP id v6-20020a1709067d8600b00a3bf05492a2mr3792983ejo.59.1708094436519;
        Fri, 16 Feb 2024 06:40:36 -0800 (PST)
Received: from krzk-bin.. ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id a8-20020a170906670800b00a3ce3c5b2a4sm1592942ejp.195.2024.02.16.06.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:40:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH 3/4] iommu: constify fwnode in iommu_ops_from_fwnode()
Date: Fri, 16 Feb 2024 15:40:26 +0100
Message-Id: <20240216144027.185959-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216144027.185959-1-krzysztof.kozlowski@linaro.org>
References: <20240216144027.185959-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make pointer to fwnode_handle a pointer to const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/iommu.c | 2 +-
 include/linux/iommu.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 26a31ba4f72d..a1f9bb8fa041 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2987,7 +2987,7 @@ bool iommu_default_passthrough(void)
 }
 EXPORT_SYMBOL_GPL(iommu_default_passthrough);
 
-const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
+const struct iommu_ops *iommu_ops_from_fwnode(const struct fwnode_handle *fwnode)
 {
 	const struct iommu_ops *ops = NULL;
 	struct iommu_device *iommu;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 600fc6e6f308..269ef0af7f20 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -903,7 +903,7 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode,
 		      const struct iommu_ops *ops);
 void iommu_fwspec_free(struct device *dev);
 int iommu_fwspec_add_ids(struct device *dev, const u32 *ids, int num_ids);
-const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode);
+const struct iommu_ops *iommu_ops_from_fwnode(const struct fwnode_handle *fwnode);
 
 static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
 {
@@ -1253,7 +1253,7 @@ static inline int iommu_fwspec_add_ids(struct device *dev, u32 *ids,
 }
 
 static inline
-const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
+const struct iommu_ops *iommu_ops_from_fwnode(const struct fwnode_handle *fwnode)
 {
 	return NULL;
 }
-- 
2.34.1


