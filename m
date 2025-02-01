Return-Path: <linux-arm-msm+bounces-46649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 087AFA24A17
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 16:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D65693A3967
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 15:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED731C2DB0;
	Sat,  1 Feb 2025 15:58:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006CE17A90F
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 15:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738425533; cv=none; b=pIxQKZQ7z/SHH7Vbb45x4lNhfLEJn6PxIF3l9pN/vMFpvwC+SSOukJTnEmnR+gx+LAUe7D59dzDvHtiUSE5eGLm/ipMAwZYQR9p2WVjeAD/o5yTs6RZWn1sykCqibOVkTpl00PbP0YgRgC/VRf718+W+BZDMyQg/50RC7echOaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738425533; c=relaxed/simple;
	bh=yk4qm4jAP7Uk1zuKHL5phK1pTERsu+hUFyMNaTHIOIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jrn/3IGf+keq5+LfVTT+TNMY8vEPDypEJX5Lnp0XQzs1q1pvMI2+eD/ihuKPB672Rppwl/74D/Y0LSmr5QWjv62uT5bgW90DSQRpAk50jaAU+oEkTI1or9jcJv0dHSa2AYtRI6vEBNlx/F9xFDVRIiegbef1O/pAHbDdDB8vojU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: y2m+J6VtQomP5ceMAG0x6A==
X-CSE-MsgGUID: L8OgIuffRcaZ81niYHHAfA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Feb 2025 00:58:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.62])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id CBC8E401439D;
	Sun,  2 Feb 2025 00:58:35 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm/msm: Use of_get_available_child_by_name()
Date: Sat,  1 Feb 2025 15:58:28 +0000
Message-ID: <20250201155830.39366-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify zap_shader_load_mdt() by using of_get_available_child_by_name().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is only compile tested and depend upon[1]
[1] https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.renesas.com/
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1238f3265978..bbbc7428cb11 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -45,8 +45,8 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		return -EINVAL;
 	}
 
-	np = of_get_child_by_name(dev->of_node, "zap-shader");
-	if (!of_device_is_available(np)) {
+	np = of_get_available_child_by_name(dev->of_node, "zap-shader");
+	if (!np) {
 		zap_available = false;
 		return -ENODEV;
 	}
-- 
2.43.0


