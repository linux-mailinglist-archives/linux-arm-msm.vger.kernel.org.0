Return-Path: <linux-arm-msm+bounces-53897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 393ACA84B75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 19:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DE1E188A32B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 17:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D959D28EA50;
	Thu, 10 Apr 2025 17:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvU0KFgA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7F028EA4B;
	Thu, 10 Apr 2025 17:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744307049; cv=none; b=MV/O9D2D3OEG+MgfSiReYvq/bxp6/Yy3gW8aDJCZa0E8HKeUZjqhzVN8tGVW6yjnlUa7VESk9/oDT1cYhd7E1nm0/OG7mpuobkMjlkgYeBu9QQQ3H9FifMXwdR6Y24xEXQS7oK0PB03vzQov6YXERa62RevFvjbobOl6KnKniDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744307049; c=relaxed/simple;
	bh=CnlNbg0GTKvcW+YRPLZnuFJHpm0GHl7rf8yDbGgpwaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XGsVEuvc6yb3n9XQMGY34V+9M/AFSmnL8ht1QqhEjsRTKiGNcHD3K81CpejSZZ8HCCHJ3X0xc6z+M79W635MOOc7RmEjOm61eonJl2uWxq8biJ9mIHSagYtOV8edlbvFuCH6gCg+v4Jt9iNYlZLIw+km43UE7HJPW/CVWQi1two=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvU0KFgA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2542DC4CEEB;
	Thu, 10 Apr 2025 17:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744307049;
	bh=CnlNbg0GTKvcW+YRPLZnuFJHpm0GHl7rf8yDbGgpwaM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CvU0KFgAhYRWnt4RSrAaogf/KAlgUEadz94jRRd9zEVgxnXt3fVN0q0U08rFWxjWC
	 HgQPSXQ/1nedWMJK8Hf01tyLIXA2wq3QM3ajJnMHrIolYtyxYwAYJAgFavLmOZsS4o
	 uXbg0kwSTiqaqyn7FFJEYdZbctL3cPj8nMbVaZ60BDngXv69U6mfmIlHuIUzZoduTH
	 1/yv5XrCSCfhf0cSwJ8hWLRanQSVJq7a2ddAzq5ba5w6ndE5OF1fFEaySJEyiYDRgz
	 MPe4wvaI6iVjpq9Pd3naoSozZmYyb2SR9KmeITaUqtX2wkP03TEu2zg+tNtQEQixa4
	 zTotKfgNRgQGw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 10 Apr 2025 19:43:45 +0200
Subject: [PATCH v2 2/4] drm/msm/a5xx: Get HBB dynamically, if available
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-topic-smem_dramc-v2-2-dead15264714@oss.qualcomm.com>
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
In-Reply-To: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744307035; l=1771;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=YfczxAg1gvCb99MHVd9R5q3+yfIUrb4PwVisI6P/MDI=;
 b=wNuZPDUuBZl27aMmDBKhYTZM+gxrJDCPDgNoBteEldD81N1TAy8HjHZNyytDuV9H0QiWdTlYt
 bXaK11m6lbRDpQy7N7EjuXqdDXaHEY/QiLiXG9+mQmYkOE1Fq+SLwx9
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Highest Bank address Bit value can change based on memory type used.

Attempt to retrieve it dynamically, and fall back to a reasonable
default (the one used prior to this change) on error.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 650e5bac225f372e819130b891f1d020b464f17f..c887d46c3a5798b7aa6813fc6e2575be1e715100 100644
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
@@ -1758,7 +1759,11 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
 	unsigned int nr_rings;
-	int ret;
+	int hbb, ret;
+
+	/* We need data from SMEM to retrieve HBB below */
+	if (!qcom_smem_is_available())
+		return ERR_PTR(-EPROBE_DEFER);
 
 	a5xx_gpu = kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
 	if (!a5xx_gpu)
@@ -1796,6 +1801,11 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	else
 		adreno_gpu->ubwc_config.highest_bank_bit = 14;
 
+	/* Attempt to retrieve HBB data from SMEM, keep the above defaults in case of error */
+	hbb = qcom_smem_dram_get_hbb();
+	if (hbb > 0)
+		adreno_gpu->ubwc_config.highest_bank_bit = hbb;
+
 	/* a5xx only supports UBWC 1.0, these are not configurable */
 	adreno_gpu->ubwc_config.macrotile_mode = 0;
 	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;

-- 
2.49.0


