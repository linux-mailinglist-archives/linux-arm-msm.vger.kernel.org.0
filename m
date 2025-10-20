Return-Path: <linux-arm-msm+bounces-77988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 520E9BF0E07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 13:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 199A4188260F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 11:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9E72FDC59;
	Mon, 20 Oct 2025 11:37:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEA02FC862;
	Mon, 20 Oct 2025 11:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760960260; cv=none; b=cf9yKfV3oZmb6Iesr2BNUDTEQzhCZarYRmznZeihiOWeaENJKQ0we5Yq6H+Hq1ewrGN6XoMd7V+qFppjx75/eK9Kau/JddN3RuYUdggQeadxo6MeemJ6jLiPgcyunrjsfEO+y6D+sVIMyxhM920VkV9xN78k40NmixMFU+Q3u10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760960260; c=relaxed/simple;
	bh=hrE5ynjN4EEBaatJqh+SMhKQdi9HVeog8IGfAP6kE+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=crOIMbQF7lu7eekHYflVtFBddC09JWw7tCcMVSJHfVW1DorByKdYE7WloISOt1O7iXmpw+QVVCJb/WOVtDG/KsZvu0nSwKrrCn3yu6ZhRUyEtRx9TuuKCdGcKfw//4SzHaebUU+/oAd7wEZmlkUUNtez/NY7TeJ/NDIlYMsd33g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2883f10aada911f0a38c85956e01ac42-20251020
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP, SRC_LOWREP, DN_TRUSTED
	SRC_TRUSTED, SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9e0a14a9-ab98-4269-b939-fd4775a0f249,IP:10,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:30
X-CID-INFO: VERSION:1.3.6,REQID:9e0a14a9-ab98-4269-b939-fd4775a0f249,IP:10,URL
	:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:30
X-CID-META: VersionHash:a9d874c,CLOUDID:5827c87bff38bde25837b5837f87607c,BulkI
	D:251020193614H7E4RRCI,BulkQuantity:1,Recheck:0,SF:17|19|25|45|66|78|102|8
	50,TC:nil,Content:0|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2883f10aada911f0a38c85956e01ac42-20251020
X-User: hehuiwen@kylinos.cn
Received: from localhost.localdomain [(220.202.195.150)] by mailgw.kylinos.cn
	(envelope-from <hehuiwen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 252442399; Mon, 20 Oct 2025 19:37:28 +0800
From: Huiwen He <hehuiwen@kylinos.cn>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Huiwen He <hehuiwen@kylinos.cn>
Subject: [PATCH] drm/msm: Fix NULL pointer dereference in crashstate_get_vm_logs()
Date: Mon, 20 Oct 2025 19:37:08 +0800
Message-ID: <20251020113708.7403-1-hehuiwen@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

crashstate_get_vm_logs() did not check the result of kmalloc_array()
before using state->vm_logs. In low memory situations, kmalloc_array()
may fail and return NULL, leading to a kernel crash when the array
is accessed in the subsequent loop.

Fix this by checking the return value of kmalloc_array(). If allocation
fails, set state->nr_vm_logs to 0, and exit the function safely.

Fixes: 9edc52967cc7 ("drm/msm: Add VM logging for VM_BIND updates")
Signed-off-by: Huiwen He <hehuiwen@kylinos.cn>
---
 drivers/gpu/drm/msm/msm_gpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 17759abc46d7..51df6ff945d2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -348,6 +348,12 @@ static void crashstate_get_vm_logs(struct msm_gpu_state *state, struct msm_gem_v
 
 	state->vm_logs = kmalloc_array(
 		state->nr_vm_logs, sizeof(vm->log[0]), GFP_KERNEL);
+	if (!state->vm_logs) {
+		state->nr_vm_logs = 0;
+		mutex_unlock(&vm->mmu_lock);
+		return;
+	}
+
 	for (int i = 0; i < state->nr_vm_logs; i++) {
 		int idx = (i + first) & vm_log_mask;
 
-- 
2.43.0


