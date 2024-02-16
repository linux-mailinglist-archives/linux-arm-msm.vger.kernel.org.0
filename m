Return-Path: <linux-arm-msm+bounces-11366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 549F8857F7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 15:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDC3428B4E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 14:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0213A12EBDD;
	Fri, 16 Feb 2024 14:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C6vRSD4J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE2912EBD7
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 14:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708094436; cv=none; b=IOjfGiOH7od7Co4PK8Onu3brA9JZzvRb68D2ZIOQdDTPntc9Ylt8msAwm2IZmKo/8NPxzCSr0xjOkX45vEaVnTBkaF7gKa43BYIGAeGC4Fm/hKn9yyTgr1kjD4sCbz/MCwyrVvwJW0rNDsQnCh/pUQEuqH3ABz8EyYpzBnz1bS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708094436; c=relaxed/simple;
	bh=VhhgxqgxNna3VDXzGb+u29de1zzuvgOHxd0eRr4Za/8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=KkGTjDoSTAyX8LCfydfGdTrKDTBysDHe3PDGGBw0gP494pXxFVgmavzPmaBs+oygalJRYW5uiDPLqhaMAAQvkUc+Z/mmw5UsJdTK9EqCCZ8mV5BfwmVeqpZ3uVdZFWd0whbFyUOoqrnXln8M/p43bIwYPFuDEKXsWZ5g4O2kOS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C6vRSD4J; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3dfb2e03e7so39043966b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 06:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708094432; x=1708699232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRC42YbuNYRdIwcaj+US8j1sKLD+6CzDw3sU7mb37/4=;
        b=C6vRSD4JJq5VeMpEP/qRigg9X6R76yWVZMsOrj+Tc1BoLlL99PJRhdXCL7JfIyG5GX
         jCqYQWrKDtOxbjTqzp6frBGY01m/xc0MIHJ5tsq7llV9AxClh/BJH1UexH15Fbrn6jj/
         1ta6q/qIsSOO8XZIMNWh3LjtVanF5H6mCeRsxOzxGNcxH3e7ydzkfp880eOUEdcqf/Zi
         0DrgV7iwPy6YcfTijX46hkS8bSz5xioYPguXBptI40L1ZCfSNdNvbfBkvMuN/Y7Vzkkp
         nYTbWV4wGHkvdigTBChx/xitB18De9uMjTYTUWAgwfE3ZLMkJcLp7kbAfmc3JXapjIGO
         laUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708094432; x=1708699232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRC42YbuNYRdIwcaj+US8j1sKLD+6CzDw3sU7mb37/4=;
        b=nWzcPCxsiMkVbsiffGzRRRjB46ltCzvqtPz0VT/+dN08sR2Z7Z/YA4lYr7quVmZ6Xm
         1NA8IQeTW/R7FNzHeWimFLy0jilz/j00edZ7Tsjd4hSkiz9FHDYS7JzOkZNqOHNQjxzz
         Qpw57tnJRgynn7psRdS9Djb42dB6cqhU/r5gv9v7knf21p3ucIPmuE4kwUPbdlvYp3n3
         GRhW2qrR81ze4Y4GgvM7Mv39juptJRv4h/e8APmOYk9oE0IfHvkOCJJmFX69zfRywi8/
         SZ4HXidVMkeKI7iNY6Rwj/yqbsFQfYWFf5WpOAsGmXxW9sGwSjOwVFVTHJC76+Wm+wPm
         scUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRaUXznte5jw7r6nN+hOCZc+ISeAo5+1RHyelavAvcmydfPtzO/TF8io2tYL1mKikXDvM0PLZDeFMygqKKMx3Lst79bQjcG26Q/4mO+A==
X-Gm-Message-State: AOJu0YwwYci8zuoutdA7HapX5thWNVGYHMIUaFe3EtlevQMDU290Dvw9
	W5aPZ281QbhoMG1Ng/UnH69UeGMbcnHUKhiINLCS99OnBGLTRWy36RC/F/kJ66o=
X-Google-Smtp-Source: AGHT+IHf//9yt3eTnyw6VXgXdUG6tjNHVGPCN0at0VvNZn01LUmWCi7a4swsg2sOshpZkHrmmM9UNA==
X-Received: by 2002:a17:906:185a:b0:a3d:994a:791d with SMTP id w26-20020a170906185a00b00a3d994a791dmr3667044eje.59.1708094432164;
        Fri, 16 Feb 2024 06:40:32 -0800 (PST)
Received: from krzk-bin.. ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id a8-20020a170906670800b00a3ce3c5b2a4sm1592942ejp.195.2024.02.16.06.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:40:31 -0800 (PST)
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
Subject: [PATCH 1/4] iommu: constify pointer to bus_type
Date: Fri, 16 Feb 2024 15:40:24 +0100
Message-Id: <20240216144027.185959-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make pointer to bus_type a pointer to const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/iommu-priv.h | 5 +++--
 drivers/iommu/iommu.c      | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
index 2024a2313348..5f731d994803 100644
--- a/drivers/iommu/iommu-priv.h
+++ b/drivers/iommu/iommu-priv.h
@@ -21,10 +21,11 @@ int iommu_group_replace_domain(struct iommu_group *group,
 			       struct iommu_domain *new_domain);
 
 int iommu_device_register_bus(struct iommu_device *iommu,
-			      const struct iommu_ops *ops, struct bus_type *bus,
+			      const struct iommu_ops *ops,
+			      const struct bus_type *bus,
 			      struct notifier_block *nb);
 void iommu_device_unregister_bus(struct iommu_device *iommu,
-				 struct bus_type *bus,
+				 const struct bus_type *bus,
 				 struct notifier_block *nb);
 
 #endif /* __LINUX_IOMMU_PRIV_H */
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d14413916f93..170329a085b8 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -291,7 +291,7 @@ EXPORT_SYMBOL_GPL(iommu_device_unregister);
 
 #if IS_ENABLED(CONFIG_IOMMUFD_TEST)
 void iommu_device_unregister_bus(struct iommu_device *iommu,
-				 struct bus_type *bus,
+				 const struct bus_type *bus,
 				 struct notifier_block *nb)
 {
 	bus_unregister_notifier(bus, nb);
@@ -305,7 +305,8 @@ EXPORT_SYMBOL_GPL(iommu_device_unregister_bus);
  * some memory to hold a notifier_block.
  */
 int iommu_device_register_bus(struct iommu_device *iommu,
-			      const struct iommu_ops *ops, struct bus_type *bus,
+			      const struct iommu_ops *ops,
+			      const struct bus_type *bus,
 			      struct notifier_block *nb)
 {
 	int err;
-- 
2.34.1


