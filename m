Return-Path: <linux-arm-msm+bounces-41345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEC39EB71A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 17:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ACB31882695
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72002343BB;
	Tue, 10 Dec 2024 16:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvJUZ/4E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22966233150;
	Tue, 10 Dec 2024 16:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733849510; cv=none; b=c6zJ1YzZCJP3ojFlw0mKRQTo0pHvdJXxzdjkt79SKhPEw75V7p/xeWYJacW2etW64tC0/GwYYxxtiqNi91XEb/PZrKvZnf2eHzzHYG+ybyb63/TTPRtMI5K3+2x+LvEv4GU7PwHQ8RSrwBBy3flIOPkPk9svHRlOqIGIeX+2nZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733849510; c=relaxed/simple;
	bh=kX0r99riBAaE8TpUV/flACMdXCRPn6tHp+x0bux6TeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WVsOoqMyg25oxWWgMFUwZ8IiPjHvzGlq9UmIkypz+SAa0kC/PLYpdpdw6iWW1llSUviByumAb03HC4UA5ybB4J2e71FvZHIQCUVDePp6xY0klBICbvQ6hzvafkoECEx5iIQ3UCzned6GbnSir0vxu14JOODvIDSAZ4yD7edPVuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvJUZ/4E; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21628b3fe7dso33166775ad.3;
        Tue, 10 Dec 2024 08:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733849508; x=1734454308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ldrDCueE7EtAyArj20F66jLgkk2NNyODodRKr0ilU8=;
        b=LvJUZ/4E7MNKVVccxZ3sXbixK7g/hXO4PrE/rmLapeg7D49KWEnQlExqMR/wiyVSji
         DIAxyQMsVr1Lt+cpqPH9JiIkSfjd9/4iH3f957OzenjsFRr5TM6vLka+SCm6krtgGuSW
         jRRgPkz2m52fNq6VcjHOR31zKlNP2TWVSqntP4I6L+u63eN15J4qQUYhS33mkhoXNZkB
         Q2mTkqG9PEo3sZw7HvlsuF8YYc455BBal7nNzJZkySw5Jgjwxqaf+76+E4ZcDtCP02L2
         x7Uf7UEbyszWdEyEqjf3rbzLMYAvmpAKIUEgGZLLZ4pgjHjfVC87aoBoXjs2REVhL1x5
         87gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733849508; x=1734454308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ldrDCueE7EtAyArj20F66jLgkk2NNyODodRKr0ilU8=;
        b=nYEgQYs6N7bFcpRCFU5yHgsTpusLI4eKeJTcMSMOmR2x9M5bd5grWEg8sX/JKWkyDr
         fN4QwERwP5iIr+Jw7hQrklS0oRgdEuaouDl9aSULddArPUAy8dxRLtnUUxeXSSzI6Oln
         YT0JDPcZHAIZt/uefSxCMw7XGIG4mubUVddETCEiv5I5stj5u0LFhQXRPxEnI/yHmJHf
         xCHCLsyK5tKD0lzHoI2TbCR7aeEtRHWU+nxZeZXrlKn9+WY9RFXF/i0a7sbe1DkRl0jd
         gVo8fnFRkerr3V5kGOkvmQff5GS5ybxH54z+QUri4ECHAeLf1i7aX9eN/XlkRaSOtEtO
         /cNA==
X-Forwarded-Encrypted: i=1; AJvYcCVjsRUxbG/DPCFYvsYSn1X/4eOUXLBZKCqISQ8J7C+9Nj5fhHvDLn8GQ0kwm6Nm7IwrG3B7jEZ4agPqyAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOmgudzOgDOFDPodo3lxBwSKFXrumquh8gwahZ9VgzPOe8qimL
	9SHSjTL3azEDxQ0FDlzM8QOcQb7AeDYRxt+i77b/Bm2b6tT8mt+F
X-Gm-Gg: ASbGncuLcGr4bEWSKgHl7QItGZZKuAzUjaGP6ZDDWxsWZriZAj0zNlfGLngM/vwzzP3
	GXnCe95aayk9G476/rajEtzyKuzI6HYjiRLTPjLjPu+2SNheFI2nKHlX7HYTEPDvzrIsObFMSBX
	dn6Zmp08hxKkV/QJJmAynvUrKi/Zb25uPl+TPqksSP2ABsOZ7wkhgxNl4MPErzdQlRWnhttSVe6
	E12bVFLZEIawJ8NnumuesO5b3xBi7ElMF7RkpoWvGf2NN9Wg1LozW67OSYSny3pNe/FkFJE9Zar
	CNC1hqvTAK3pykXsl8QnjBXxCRF5
X-Google-Smtp-Source: AGHT+IHS0LaxpkQDW28nSbT1wx8gEP6+R1uzXYbRGTNeVekseOAHAqPvkFtV0qVh9HekmfV/jSF44A==
X-Received: by 2002:a17:902:d2c5:b0:216:725c:a122 with SMTP id d9443c01a7336-216725ca362mr51995685ad.19.1733849508260;
        Tue, 10 Dec 2024 08:51:48 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f093a3sm91911265ad.192.2024.12.10.08.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 08:51:47 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Mostafa Saleh <smostafa@google.com>,
	Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v11 2/4] iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
Date: Tue, 10 Dec 2024 08:51:20 -0800
Message-ID: <20241210165127.600817-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210165127.600817-1-robdclark@gmail.com>
References: <20241210165127.600817-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Re-use the generic pgtable walk path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 74 +++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 7e9c0f8ae138..88b128c77893 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -712,42 +712,6 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
 				data->start_level, ptep);
 }
 
-static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
-					 unsigned long iova)
-{
-	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
-	arm_lpae_iopte pte, *ptep = data->pgd;
-	int lvl = data->start_level;
-
-	do {
-		/* Valid IOPTE pointer? */
-		if (!ptep)
-			return 0;
-
-		/* Grab the IOPTE we're interested in */
-		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
-		pte = READ_ONCE(*ptep);
-
-		/* Valid entry? */
-		if (!pte)
-			return 0;
-
-		/* Leaf entry? */
-		if (iopte_leaf(pte, lvl, data->iop.fmt))
-			goto found_translation;
-
-		/* Take it to the next level */
-		ptep = iopte_deref(pte, data);
-	} while (++lvl < ARM_LPAE_MAX_LEVELS);
-
-	/* Ran out of page tables to walk */
-	return 0;
-
-found_translation:
-	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
-	return iopte_to_paddr(pte, data) | iova;
-}
-
 struct io_pgtable_walk_data {
 	struct io_pgtable		*iop;
 	void				*data;
@@ -763,6 +727,41 @@ static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
 				 arm_lpae_iopte *ptep,
 				 int lvl);
 
+struct iova_to_phys_data {
+	arm_lpae_iopte pte;
+	int lvl;
+};
+
+static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, int lvl,
+			      arm_lpae_iopte *ptep, size_t size)
+{
+	struct iova_to_phys_data *data = walk_data->data;
+	data->pte = *ptep;
+	data->lvl = lvl;
+	return 0;
+}
+
+static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
+					 unsigned long iova)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct iova_to_phys_data d;
+	struct io_pgtable_walk_data walk_data = {
+		.data = &d,
+		.visit = visit_iova_to_phys,
+		.addr = iova,
+		.end = iova + 1,
+	};
+	int ret;
+
+	ret = __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
+	if (ret)
+		return 0;
+
+	iova &= (ARM_LPAE_BLOCK_SIZE(d.lvl, data) - 1);
+	return iopte_to_paddr(d.pte, data) | iova;
+}
+
 static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 			    struct io_pgtable_walk_data *walk_data,
 			    arm_lpae_iopte *ptep, int lvl)
@@ -780,8 +779,9 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 		return 0;
 	}
 
-	if (WARN_ON(!iopte_table(pte, lvl)))
+	if (!iopte_table(pte, lvl)) {
 		return -EINVAL;
+	}
 
 	ptep = iopte_deref(pte, data);
 	return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
-- 
2.47.1


