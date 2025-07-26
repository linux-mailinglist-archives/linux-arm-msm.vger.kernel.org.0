Return-Path: <linux-arm-msm+bounces-66773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B7DB12D23
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 01:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37910189C736
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 23:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20904224234;
	Sat, 26 Jul 2025 23:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Ygnv0NxM";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="/11Yaeyi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE52B21A443;
	Sat, 26 Jul 2025 23:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753574230; cv=none; b=jMrzxHIeq8Q2RwgLiC4yc/vy2HXn3CJNsWh6L07HAMR+jx2wwPv/HITvv/Kn05VBfkwzyoAU6xgGfZuHUOgtG1rCs5yiNFIPjn9uCTlctZxqqSEzpYq7Px/N2pb171rGl3xc8Rat+MxF7uRFdhBzeAv23S5nvfk/ST4d9uXcPX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753574230; c=relaxed/simple;
	bh=QGuzXPq07mqvfO2VsT8Q4PuMdIh8J51KRw4UvQib6ss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MKCL3etVFT85jCspjr8T32Y6yPr4EbKJdMnKv2kaYY6Td4nW+V/4/mFduTUArIKDSOSSzILTT7E5E6MaoTiMMdNuXg69MDhy7BNFrm8IERKe5e13Nr53HF9164VoEaWuxW5/yedV68XKGQAH/culLtkpeNCocSE3cACPVKhtp6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Ygnv0NxM; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=/11Yaeyi; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1753574209; bh=REsF7UiUULs+mnw0jfnyHa8
	3wJ0V0kwr567Unv0UtQg=; b=Ygnv0NxMX7VsbPzBy/vb0FkrpjTtFDKHKNRXLiCOToZHgSLHo1
	WsWA2clPDdp5egDkmJyUlnyu4L/paNH7V4YCzgcvsLUod8tB3Mswlq2Zf+AxbZh7+Pb5UmlPc7Q
	Or3OLULuPw+RoUjIHNQMcMPyXif7c7Dq+lvniBnyimyuTkQuO/x2s9MU6vs8jRYVGajs1r/klKc
	J7tcm/RQZeS3zKsNioPKb2rSzoF64P1piRruYjl9CZNGyUXWX8v+TJar/uaCIzIYbxQbkvyxwlE
	pqiVYGKitCOsa+yfXDGXJgiawMVEq+6UmQuFneqmXJXsiVPvT96gJ5tXVntb3gAF1DQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1753574209; bh=REsF7UiUULs+mnw0jfnyHa8
	3wJ0V0kwr567Unv0UtQg=; b=/11Yaeyim1TVSHNj+IHkE7SdZFOvI93NKfpquaifX/Z3Ed1b1/
	lQFPQBaUYojaAKWIjWSJIoOcu50dHWGnhwBA==;
From: Jens Reidel <adrian@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Jens Reidel <adrian@mainlining.org>
Subject: [PATCH] soc: qcom: smem: Fix endian-unaware access of num_entries
Date: Sun, 27 Jul 2025 01:56:46 +0200
Message-ID: <20250726235646.254730-1-adrian@mainlining.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a missing le32_to_cpu when accessing num_entries, which is always a
little endian integer.

Fixes booting on Xiaomi Mi 9T (xiaomi-davinci) in big endian.

Signed-off-by: Jens Reidel <adrian@mainlining.org>
---
 drivers/soc/qcom/smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index cf425930539e..c4c45f15dca4 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -898,7 +898,7 @@ static u32 qcom_smem_get_item_count(struct qcom_smem *smem)
 	if (IS_ERR_OR_NULL(ptable))
 		return SMEM_ITEM_COUNT;
 
-	info = (struct smem_info *)&ptable->entry[ptable->num_entries];
+	info = (struct smem_info *)&ptable->entry[le32_to_cpu(ptable->num_entries)];
 	if (memcmp(info->magic, SMEM_INFO_MAGIC, sizeof(info->magic)))
 		return SMEM_ITEM_COUNT;
 
-- 
2.50.1


