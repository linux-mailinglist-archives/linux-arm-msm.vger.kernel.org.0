Return-Path: <linux-arm-msm+bounces-113645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZLQfMJefMmqX2wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:22:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0B569A0D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:22:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113645-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113645-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB85430DA5CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6EF4071DD;
	Wed, 17 Jun 2026 13:21:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A233F5BFD;
	Wed, 17 Jun 2026 13:21:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702483; cv=none; b=SB4uVAGCExb6nPDGYz6lyfSlE8WCwmQVTuqn54odWsPECMz01SKaPHAQGhZBRC9Byq1se0S8ApLipR9rDwiybu5pSnJ8C2D6yWVm6uNEtvrDcPeCt3OpHJpje+yh2+EM/dYJCFbvgIXxZUTN/oQS2cVfuKvAKzpQ5seFJl0apuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702483; c=relaxed/simple;
	bh=CO5iMW2oOvDbB37yTKJ5GJ5bynuFvPJ3OfNIVIETedo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=np8XEJtm5pRqZ4v0AWFh9PYQDkNu/J+Gtqi1gwtHTzhwcSE1r6vALpVPJdOQhZdhMHsGpTbdHExfFHEaxRnG5Gkh0nypMw5b4qyTfs/FLs0NRlyhY1NVQ6+882QDPK/XdYF3kM94CGVWRY5vogj/TFFA6utmp6xKLr+Sgx92qZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=209.97.182.222
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wAHJDk_nzJqD6m8Ag--.30420S3;
	Wed, 17 Jun 2026 21:21:03 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app4 (Coremail) with SMTP id zi_KCgCn2jE+nzJqBRWdAQ--.32818S3;
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
Subject: [PATCH 1/3] drm/msm/adreno: sync preempt watchdog timer on teardown
Date: Wed, 17 Jun 2026 13:20:05 +0000
Message-Id: <20260617132007.131079-2-fanwu01@zju.edu.cn>
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
X-CM-TRANSID:zi_KCgCn2jE+nzJqBRWdAQ--.32818S3
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?Zt410gXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnXz+g1OQfMo27QHy5TwQyZzsI/eaKfu/fJOJen4aeRX2Q+VxDRSXxPGQotD49GmWfKpp
	yPDu2GgIIjdkSmMp7CUnLJuT1O+x+sR/9gt+BHM5
X-Coremail-Antispam: 1Uk129KBj93XoW3Ww48WF45Jw1xuw13GF43CFX_yoW3CF13pr
	4DG34Syw4xAw47Kw47CF1ku3WrJa4fWayxWa4Ig393u3W3tF1DAF1jyry3AFy5WFWI9r1S
	qFn5GrWDJF1rCwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8D5r7UUUUU==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113645-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[zju.edu.cn];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,zju.edu.cn];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fanwu01@zju.edu.cn,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:fanwu01@zju.edu.cn,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: EB0B569A0D0

The A5XX and A6XX preemption watchdog timer is registered with
timer_setup() and armed via mod_timer() on every preemption trigger. Its
callback (a5xx_preempt_timer / a6xx_preempt_timer) recovers the owning
a5xx_gpu/a6xx_gpu through timer_container_of(preempt_timer) and then
dereferences gpu->dev and queues gpu->recover_work.

Neither destroy path waits for a possibly in-flight callback:

  * a5xx_destroy() calls a5xx_preempt_fini(), which only frees the
    preempt_bo GEM buffers and performs no timer synchronization;
  * a6xx_destroy() performs no preempt cleanup at all.

The only timer cancellation in the driver is timer_delete()
on the preemption-IRQ success path, which is unreachable from teardown
and does not wait for a concurrently running callback. If the 10s
preemption watchdog fires while the GPU is being torn down, the callback
races against kfree(a5xx_gpu)/kfree(a6xx_gpu) and dereferences the freed
container, leading to a use-after-free.

Fix this by adding timer_shutdown_sync() for the preempt timer to
a5xx_preempt_fini() -- which a5xx_destroy() already calls on teardown --
and, since a6xx_destroy() performs no preempt cleanup, by adding it
inline to a6xx_destroy() as well. timer_shutdown_sync() is used instead
of timer_delete_sync() because the timer is re-armed by mod_timer() from
the trigger path, so teardown must also block rearming.

Because timer_shutdown_sync() may run on any teardown path -- including
single-ring configurations where *_preempt_init() returns early and
*_gpu_init() error paths that precede *_preempt_init() -- the timer_list
must already be valid on all of them. Initialize it at GPU allocation
via a new *_preempt_init_timer() helper, called from *_gpu_init() before
adreno_gpu_init() (the first failure path that reaches *_destroy()), so
timer_setup() always precedes any timer_shutdown_sync().

This bug was found by static analysis.

Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
Fixes: e7ae83da4a28 ("drm/msm/a6xx: Implement preemption for a7xx targets")
Cc: stable@vger.kernel.org
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  2 ++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 14 +++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 13 +++++++++++--
 6 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 56eaff2ee4e4..0fbfb99c23f8 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1753,6 +1753,8 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	if (config->info->revn == 510)
 		nr_rings = 1;
 
+	a5xx_preempt_init_timer(gpu);
+
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, nr_rings);
 	if (ret) {
 		a5xx_destroy(&(a5xx_gpu->base.base));
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index 407bb950d350..4bf258830619 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -158,6 +158,7 @@ bool a5xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a5xx_set_hwcg(struct msm_gpu *gpu, bool state);
 
 void a5xx_preempt_init(struct msm_gpu *gpu);
+void a5xx_preempt_init_timer(struct msm_gpu *gpu);
 void a5xx_preempt_hw_init(struct msm_gpu *gpu);
 void a5xx_preempt_trigger(struct msm_gpu *gpu);
 void a5xx_preempt_irq(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index e4924b5e1c48..96ade4936ef8 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -295,12 +295,25 @@ void a5xx_preempt_fini(struct msm_gpu *gpu)
 	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	int i;
 
+	timer_shutdown_sync(&a5xx_gpu->preempt_timer);
+
 	for (i = 0; i < gpu->nr_rings; i++) {
 		msm_gem_kernel_put(a5xx_gpu->preempt_bo[i], gpu->vm);
 		msm_gem_kernel_put(a5xx_gpu->preempt_counters_bo[i], gpu->vm);
 	}
 }
 
+/* Initialize the preemption watchdog timer at GPU allocation so that it is
+ * valid on every teardown path that may call timer_shutdown_sync().
+ */
+void a5xx_preempt_init_timer(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
+
+	timer_setup(&a5xx_gpu->preempt_timer, a5xx_preempt_timer, 0);
+}
+
 void a5xx_preempt_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -325,5 +338,4 @@ void a5xx_preempt_init(struct msm_gpu *gpu)
 	}
 
 	spin_lock_init(&a5xx_gpu->preempt_start_lock);
-	timer_setup(&a5xx_gpu->preempt_timer, a5xx_preempt_timer, 0);
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2129d230a92b..7c25c763071f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2443,6 +2443,8 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
+	timer_shutdown_sync(&a6xx_gpu->preempt_timer);
+
 	if (a6xx_gpu->sqe_bo) {
 		msm_gem_unpin_iova(a6xx_gpu->sqe_bo, gpu->vm);
 		drm_gem_object_put(a6xx_gpu->sqe_bo);
@@ -2685,6 +2687,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	    (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
 		nr_rings = 4;
 
+	a6xx_preempt_init_timer(gpu);
+
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, nr_rings);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 4eaa04711246..027c8e66826e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -274,6 +274,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
 void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu);
 
 void a6xx_preempt_init(struct msm_gpu *gpu);
+void a6xx_preempt_init_timer(struct msm_gpu *gpu);
 void a6xx_preempt_hw_init(struct msm_gpu *gpu);
 void a6xx_preempt_trigger(struct msm_gpu *gpu);
 void a6xx_preempt_irq(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 747a22afad9f..ae315640e689 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -428,6 +428,17 @@ void a6xx_preempt_fini(struct msm_gpu *gpu)
 		msm_gem_kernel_put(a6xx_gpu->preempt_bo[i], gpu->vm);
 }
 
+/* Initialize the preemption watchdog timer at GPU allocation so that it is
+ * valid on every teardown path that may call timer_shutdown_sync().
+ */
+void a6xx_preempt_init_timer(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
+}
+
 void a6xx_preempt_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -459,8 +470,6 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
 
 	preempt_prepare_postamble(a6xx_gpu);
 
-	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
-
 	return;
 fail:
 	/*
-- 
2.34.1


