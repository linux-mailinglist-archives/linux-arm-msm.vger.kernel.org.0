Return-Path: <linux-arm-msm+bounces-113644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id knIoKYyfMmqV2wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:22:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B1769A0C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:22:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113644-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113644-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCE1030BB9A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B04C3BA24F;
	Wed, 17 Jun 2026 13:21:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F4E3803DC;
	Wed, 17 Jun 2026 13:21:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702483; cv=none; b=E9QZ3hV4q8lyD0BgfwUqxgAkDTOi/56Va15R9Ev9kt5P0H56rRc+YsTViMmP1EHOWdQ52BrDQRXJLRcGtkitC1xUozJnOXRM7LylfYoUaO5FxCjrxEBZ4N0bkOVHaX3BilMdTC6ehJ4X+rxOwdRkFcOWWB1rng66GVIY7Zys+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702483; c=relaxed/simple;
	bh=ZriTRHwpVuuSI8sx60OJkUXi6Pde34Hx+1H30ePoBfU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mYs0I0LBGUhUpQB0rcjQRhxaA+3I0GEZ3Most/wvTASPoQ1hvAaNU+3wM75Qh2watO/FdHpDD7ruQcM4ws9v3RKskzxkcWUxTKc0OoWAOLpNMXw5khvWiVe+dWLWPH3E51J/Xu8FtsrxZXO/KjPP8y+vPwRDCMV7uDNwZnXVDAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=209.97.182.222
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wDXsT4_nzJqE6m8Ag--.42556S3;
	Wed, 17 Jun 2026 21:21:03 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app4 (Coremail) with SMTP id zi_KCgCn2jE+nzJqBRWdAQ--.32818S4;
	Wed, 17 Jun 2026 21:21:02 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: robin.clark@oss.qualcomm.com
Cc: sean@poorly.run,
	konradybcio@kernel.org,
	akhilpo@oss.qualcomm.com,
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
	stable@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH 2/3] drm/msm/a6xx: free all preempt buffers on teardown
Date: Wed, 17 Jun 2026 13:20:06 +0000
Message-Id: <20260617132007.131079-3-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260617132007.131079-1-fanwu01@zju.edu.cn>
References: <20260617132007.131079-1-fanwu01@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zi_KCgCn2jE+nzJqBRWdAQ--.32818S4
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?uRSk8QXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnXz+g1OQfMo27QHy5TwQyZx1aBq0Z0cBcM+ksJCNzc6HQ+VxDRSXxPGQotD49GmWfKpp
	yPDu2GgIIjdkSmMp7CWrk1kkTs0faXjOpS++uTCd
X-Coremail-Antispam: 1Uk129KBj93XoWxJw48JFy5AFy5Xr1DWw4xXwc_yoW5Xw1xpr
	4kJ340yr4xA3Wakw4xtF1rua43Jay3WFWkW342qa95Gw1YqF1DGF1jyr15Jr98uFWIvr4f
	tr1kGr45XF1rAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8SeHDUUUUU==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113644-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[zju.edu.cn];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,zju.edu.cn];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fanwu01@zju.edu.cn,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:fanwu01@zju.edu.cn,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fanwu01@zju.edu.cn,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,zju.edu.cn:email,zju.edu.cn:mid,zju.edu.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06B1769A0C8

a6xx_destroy() never calls a6xx_preempt_fini(), so on teardown the
preemption GEM buffers leak: the per-ring preempt_bo and preempt_smmu_bo
(allocated in preempt_init_ring()) and the single preempt_postamble_bo
(allocated in a6xx_preempt_init()). a6xx_preempt_fini() only released
preempt_bo, and only on the a6xx_preempt_init() error path.

Complete a6xx_preempt_fini() to also release preempt_smmu_bo and
preempt_postamble_bo, and call it from a6xx_destroy(). Because
a6xx_preempt_fini() is now reached on both the init-error path and
normal teardown, null each pointer after msm_gem_kernel_put() so a
second invocation is a no-op rather than a double-free.
msm_gem_kernel_put() is already NULL-safe, and msm_gem_kernel_new()
only stores the GEM object on success, so pointers that were never
allocated stay NULL.

This bug was found by static analysis.

Fixes: e7ae83da4a28 ("drm/msm/a6xx: Implement preemption for a7xx targets")
Fixes: 50117cad0c50 ("drm/msm/a6xx: Use posamble to reset counters on preemption")
Cc: stable@vger.kernel.org
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 1 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7c25c763071f..d14c3e8d879a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2444,6 +2444,7 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
 	timer_shutdown_sync(&a6xx_gpu->preempt_timer);
+	a6xx_preempt_fini(gpu);
 
 	if (a6xx_gpu->sqe_bo) {
 		msm_gem_unpin_iova(a6xx_gpu->sqe_bo, gpu->vm);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index ae315640e689..42e51234fb85 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -424,8 +424,14 @@ void a6xx_preempt_fini(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	int i;
 
-	for (i = 0; i < gpu->nr_rings; i++)
+	for (i = 0; i < gpu->nr_rings; i++) {
 		msm_gem_kernel_put(a6xx_gpu->preempt_bo[i], gpu->vm);
+		a6xx_gpu->preempt_bo[i] = NULL;
+		msm_gem_kernel_put(a6xx_gpu->preempt_smmu_bo[i], gpu->vm);
+		a6xx_gpu->preempt_smmu_bo[i] = NULL;
+	}
+	msm_gem_kernel_put(a6xx_gpu->preempt_postamble_bo, gpu->vm);
+	a6xx_gpu->preempt_postamble_bo = NULL;
 }
 
 /* Initialize the preemption watchdog timer at GPU allocation so that it is
-- 
2.34.1


