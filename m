Return-Path: <linux-arm-msm+bounces-81480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 07443C53A86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 18:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7816434894A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 17:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1127F345741;
	Wed, 12 Nov 2025 17:20:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44E43451A3;
	Wed, 12 Nov 2025 17:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762968005; cv=none; b=g2N2Byj0w5FB72c9MtrzT7lkkP2mnlh0eSi5Kr2tKMuEtKamLnRnsc5laClY24QUakiiCfblBBAcl9IOxOtIBJi+v90OF+H1wm3d+pPUBe3zzWlpAKuWRtweySBd04VlIGDUr/Ve77hGSQm15Ob+soPUEuB2Z87H4EYxoZyTKho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762968005; c=relaxed/simple;
	bh=DbnY/x2YtJHNcfRvXqXgSvH0s1JmoypXph38fcRbzjE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i7n82T821JgGYCr//7LppkjnjxMMVmtqVrfsgOuLljmp+NTeNjxNWsx3ydLwOo+ZwxlK/xu13g60UIwnQpS/ataxzWgQfrIDJ31PHfTfOa1OFEsaahCWRzQv1+bW2pj/uMFmLu/D1kRp+Yljckp+ox+utiFNoAuT9T1QukYSTUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ceb250d6bfeb11f0a38c85956e01ac42-20251113
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP, SRC_LOWREP, DN_TRUSTED
	SRC_TRUSTED, SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:0bf9be2b-6375-4dc2-9421-be126dd8db82,IP:10,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-INFO: VERSION:1.3.6,REQID:0bf9be2b-6375-4dc2-9421-be126dd8db82,IP:10,URL
	:0,TC:0,Content:0,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:5
X-CID-META: VersionHash:a9d874c,CLOUDID:394edc65d7854e1d9a3c2af0a673f48f,BulkI
	D:251113011956PDO1GP7J,BulkQuantity:0,Recheck:0,SF:10|66|78|102|850,TC:nil
	,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ceb250d6bfeb11f0a38c85956e01ac42-20251113
X-User: hehuiwen@kylinos.cn
Received: from localhost.localdomain [(220.202.195.89)] by mailgw.kylinos.cn
	(envelope-from <hehuiwen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 434298174; Thu, 13 Nov 2025 01:19:55 +0800
From: Huiwen He <hehuiwen@kylinos.cn>
To: robin.clark@oss.qualcomm.com
Cc: sean@poorly.run,
	konradybcio@kernel.org,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Huiwen He <hehuiwen@kylinos.cn>
Subject: [PATCH] drm/msm: fix missing NULL check after kcalloc in crashstate_get_bos()
Date: Thu, 13 Nov 2025 01:19:47 +0800
Message-Id: <20251112171947.486220-1-hehuiwen@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The crashstate_get_bos() function allocates memory for `state->bos`
using kcalloc(), but the vmbind path does not check for allocation
failure before dereferencing it in the following drm_gpuvm_for_each_va()
loop. This could lead to a NULL pointer dereference if memory allocation
fails.

Fix this by wrapping the drm_gpuvm_for_each_va() loop with a NULL check
on state->bos, similar to the safety check in the non-vmbind path.

Fixes: af9aa6f316b3d ("drm/msm: Crashdump support for sparse")
Signed-off-by: Huiwen He <hehuiwen@kylinos.cn>
---
 drivers/gpu/drm/msm/msm_gpu.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 17759abc46d7..a9b5f5106ebc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -287,16 +287,17 @@ static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submi
 
 		state->bos = kcalloc(cnt, sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
-		drm_gpuvm_for_each_va (vma, submit->vm) {
-			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+		if (state->bos)
+			drm_gpuvm_for_each_va(vma, submit->vm) {
+				bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
 
-			/* Skip MAP_NULL/PRR VMAs: */
-			if (!vma->gem.obj)
-				continue;
+				/* Skip MAP_NULL/PRR VMAs: */
+				if (!vma->gem.obj)
+					continue;
 
-			msm_gpu_crashstate_get_bo(state, vma->gem.obj, vma->va.addr,
-						  dump, vma->gem.offset, vma->va.range);
-		}
+				msm_gpu_crashstate_get_bo(state, vma->gem.obj, vma->va.addr,
+							  dump, vma->gem.offset, vma->va.range);
+			}
 
 		drm_exec_fini(&exec);
 	} else {
-- 
2.25.1


