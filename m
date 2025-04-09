Return-Path: <linux-arm-msm+bounces-53658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1753DA82908
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 16:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BD81501A2C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 14:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E5F270EBE;
	Wed,  9 Apr 2025 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXNTaMPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B9B270EBB;
	Wed,  9 Apr 2025 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210078; cv=none; b=Pb2vRmdQfmhMWgJnpuFQAHz9HXOKkKsZQKWzJnHz8ShGAqD79vCogN9jtjYD10WMOD0SwhE1uH1mf9iZOYpqF2tURC859pv7BNz27lb326L63o0DmTapi+yAXnQo1aZl9t/LknMj0LLhzhiS9dQ0gcfEJbZObqwVg6ScXCob3gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210078; c=relaxed/simple;
	bh=gjO0NaznG9wTOn+3bPa2NMeREAW0lMGcxML0LiXoBjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYDq9O29OWMeSo7wBwejMnvN9PGiu+Pe2G9s7ZkTh3uizglNFQoIeuqohYgke+DHjbGygswIqUtAPxtH5ErmjFl14z35k5/7ttusrLFfHHP8uHfwKx3hlk3fkRIbJmEbODCbLJa4uvsEi3t5EfldlQKB3FjmI+4SkTzCzZvFoHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXNTaMPf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28FCC4CEE2;
	Wed,  9 Apr 2025 14:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744210077;
	bh=gjO0NaznG9wTOn+3bPa2NMeREAW0lMGcxML0LiXoBjo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lXNTaMPfMrFX/JCwtUU5LzJTKzUJ2HS2Hc/TQetb/56/h1u5VjhtK69Y++X8sszc2
	 3erh/LXq6zsLhVOh7V3ljKs1v32DylvITDFRHEAqsiEdzhCHAiu3mrXpUNkZYKegAD
	 M6Q7s6olcfL4C7A9RpgwMcQzrWF8EDEWnFu6qeB2QPHJJ2sG58dnvDoW+29lyLJlZf
	 jSnmBow5kcBAEg/2v+otZGChvXT5ONueM2iN0qSZQhx24fQ+E68ydzJycIlsZHmCjl
	 4pxtjcZ0jn7Z2rSM+sTOtmG2bJxg2ST9aGf7BBq98gaooD/FzLsgZbloKRYgxcmvZy
	 1a8rQ2ch+9piQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 09 Apr 2025 16:47:30 +0200
Subject: [PATCH 2/4] drm/msm/a5xx: Get HBB dynamically, if available
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-topic-smem_dramc-v1-2-94d505cd5593@oss.qualcomm.com>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
In-Reply-To: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744210063; l=1739;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=wZrd8KgkiIAJ3vhwmoEtKzY8+3Bdh36AfHtErS5fuR4=;
 b=ajABwCpUBCbbhJhYu+gP0O8SYysgaD51y8xuMbha9rLTNbcWcsb8xXkxOQnUy+olHQLFnNSLd
 UMq1wLUvhGmAu8sQW3N6V9L3/oHIufpehofcH9uY7UGhuoNUi4OWZlG
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Highest Bank address Bit value can change based on memory type used.

Attempt to retrieve it dynamically, and fall back to a reasonable
default (the one used prior to this change) on error.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 650e5bac225f372e819130b891f1d020b464f17f..b6a8a7a03e2cbdde5983061d2dfc0c8106840672 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -9,6 +9,7 @@
 #include <linux/pm_opp.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/slab.h>
+#include <linux/soc/qcom/smem.h>
 #include "msm_gem.h"
 #include "msm_mmu.h"
 #include "a5xx_gpu.h"
@@ -833,8 +834,12 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
 
-	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
-	hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	hbb = qcom_smem_dram_get_hbb();
+	if (hbb < 0)
+		hbb = adreno_gpu->ubwc_config.highest_bank_bit;
+
+	hbb -= 13;
+	BUG_ON(hbb < 0);
 
 	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, hbb << 7);
 	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, hbb << 1);
@@ -1760,6 +1765,10 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	unsigned int nr_rings;
 	int ret;
 
+	/* We need data from SMEM to retrieve HBB in set_ubwc_config() */
+	if (!qcom_smem_is_available())
+		return ERR_PTR(-EPROBE_DEFER);
+
 	a5xx_gpu = kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
 	if (!a5xx_gpu)
 		return ERR_PTR(-ENOMEM);

-- 
2.49.0


