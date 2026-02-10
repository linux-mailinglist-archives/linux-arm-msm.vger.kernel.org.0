Return-Path: <linux-arm-msm+bounces-92525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHLaKQFdi2mbUAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 17:29:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2228011D2E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 17:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E44E300C26A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 16:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9F63806D3;
	Tue, 10 Feb 2026 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9oUAjMF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DAE389471
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770740989; cv=none; b=sljowRho03HmAwFovMGoHD1EeksvSBHEBTbYf/t8ZoIT7+SIMOYX6oPD7bKXxAzLjODGJPlMUw13EU1Cqi40LvJsCh9F0Ys0Yx0JOzf6IWVh9wREJSrjsGoOdKufJJ+LJsdkEmHRm+r08sFP6gYCrs8FgAM8ehVaDRW9f8tHnLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770740989; c=relaxed/simple;
	bh=n5cxhcAYuqXwVPgqUWtTDYlwQYPPyoUIskghINChSL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GW/AGc40dK/1+f4ZP7CPlHsq4xyqiWr0ss1NlpT47jTanc+kt2BVZdURVqSnZqKRn43riH2aB6fOIaCg10wZVH4TlsnJERD9KVRx1GkSoK0vkYdQQH/zKdYT+OoSrX6PiuRYplNuTMrMBJoQV8lSUE78eLT/VH1UU6jhL40oK1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9oUAjMF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-481188b7760so41630715e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 08:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770740987; x=1771345787; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdzOxstMlsYuxY5gUUqtUIeZeD3M+KWyBuexQsbSY20=;
        b=H9oUAjMFywEmCbFxUgvVBLHd0kGnex+5KeeRaYdxZ2V0q+X3h9WS6do0e7mo0t5P/Q
         n+ElNiySFa/hUBIMxzTxjSDDJ+jEQTqjm/3FJ5SDpLa7phG5H2BAkPwS1DaLFp6nlNeO
         DzViIpKKqV2sNpOAF2wiNCCTUElk63fyaewDkzhlQp83X8YqPKAh0ChWZE9VSYRGpEYZ
         MrATeTGlJ5Itca4K47wXtMcvHymVx8b6kH2yRPng6IpQPi/AmrisaoxEwkDURhcVV+HV
         U8hC4pUOYQd+JzUBsfprtlHzDj69EuTU4w3gihkKDIswzLRAAAfmTJYzTjyKr8fpJfqK
         gitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770740987; x=1771345787;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdzOxstMlsYuxY5gUUqtUIeZeD3M+KWyBuexQsbSY20=;
        b=IULiu+9V1rLJ37WRmtO/9FvslV4akUuZIW3Ta15PtMsR24L8jEk4fMYJ7P0ntNNqiP
         b/YhY74+7zrXaO2660zNu7ejBI7kGkevFp+7FWj2r8VE3Jp+YzwGGBg7dQGsWUWgo4cF
         FAmSa/bk2S8hVZVlMQXGnKnb4wpoYLOc707y1Xk8FMlVcc9QbGIgbFi3gks+iKZi7Sm/
         SXSzf0aoGi1IH7kT1TRT7KRQtZTJuA6qmlVxwYEInExJ8jy9EdycAYq24Ob2uS0v0m/7
         eeME9ycxuXLE7qiKZTWarZrZ9yAiW/TCva76bSv8qGe9agGWpogJU3rXDo3jrdCGqvAk
         WNQw==
X-Gm-Message-State: AOJu0Ywg1XE9jPKglUkipr9IaVNgWxj3zFsEo47CmzTk8bSzHQKzSIGJ
	SNDHIBcC53G1yOay7H1YZJv0jjh/VjbRYnn6Y5z7qXHPZPRK2iEg9vs=
X-Gm-Gg: AZuq6aJcb+ZkCEtbg0eBJXDnD/xKC8xkI0puOyX5f7f2WCc2lWsMrwRkhDUdeKI8JQj
	AImAz0YVlv+RikExCL/E9qlbLUJDQwxC6dZx6uhhVTJwqeewvGEc2diGnRfpHWnzTHcffuFjxIk
	QonM+UjH0tat2ZqCwvwe0ZLv8IDKM6T7DMq0rjmvfzoxMDwb0LYoESdmVxBJ739EHy+VWPrvASM
	i6B2FpKI2np6Hhv12WKTSRxenvbZjmUQe5MM7T9N4joZK/kxUqdjSZoLxlby6y9QXDFTSpID4ir
	Ub48wQPGLjN/TJ84RFYc5bEFIfAttIdzxRTaw+1gUPn/aqQ32djWJKVo4nuwWRgVe+yAitfGIDt
	/EybmrKdZ5OkS9tLTIxf+0YtIzB7cG22febaxorWbtCc2YVttC3qKKFDrtbc+ccmL3n0VTTXnKz
	0k0FvrgmXs+VAkAALUyicm7YEIPAVo2SJng8DtLxg3lierjZeSZFHTvw1b/tIDNbdrkxxQgY0jP
	ZXLW4jJ/EM/cA==
X-Received: by 2002:a05:600c:3148:b0:47a:8154:33e3 with SMTP id 5b1f17b1804b1-4832097e27fmr187592045e9.28.1770740986868;
        Tue, 10 Feb 2026 08:29:46 -0800 (PST)
Received: from [192.168.1.17] (host-79-19-172-190.retail.telecomitalia.it. [79.19.172.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm95182975e9.1.2026.02.10.08.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 08:29:46 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Tue, 10 Feb 2026 17:29:42 +0100
Subject: [PATCH] drm/msm: always recover the gpu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-recovery_suspend_fix-v1-1-00ed9013da04@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWwqAIBAArxL7naD2oq4SIWJb7Y/GLkUR3T3pc
 wZmHhBkQoGheIDxJKEUM5iygLD5uKKiOTNYbVttjVaMIZ3It5NDdoyzW+hSXefbpq/s4usAOd0
 Zs/634/S+H7EzSB1mAAAA
X-Change-ID: 20260210-recovery_suspend_fix-77a65932fa4c
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770740985; l=2814;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=n5cxhcAYuqXwVPgqUWtTDYlwQYPPyoUIskghINChSL0=;
 b=M9SJ3nUQubja4jNzIiH2tA9YijW97ffp9B+aOxZx4Zzsd4ZwxYxM2PqFAUA4PUMwW1FxjOr3Y
 r9kplVv06gSCIjLoDjXxpAys0/yewGxd4mLhyICAH8uf89NNneUrX8G
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92525-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2228011D2E2
X-Rspamd-Action: no action

Previously, in case there was no more work to do, recover worker
wouldn't trigger recovery and would instead rely on the gpu going to
sleep and then resuming when more work is submitted.

Recover_worker will first increment the fence of the hung ring so, if
there's only one job submitted to a ring and that causes an hang, it
will early out.

There's no guarantee that the gpu will suspend and resume before more
work is submitted and if the gpu is in a hung state it will stay in that
state and probably trigger a timeout again.

Just stop checking and always recover the gpu.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/msm/msm_gpu.c | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 995549d0bbbc..ea3e79670f75 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -547,32 +547,30 @@ static void recover_worker(struct kthread_work *work)
 		msm_update_fence(ring->fctx, fence);
 	}
 
-	if (msm_gpu_active(gpu)) {
-		/* retire completed submits, plus the one that hung: */
-		retire_submits(gpu);
+	/* retire completed submits, plus the one that hung: */
+	retire_submits(gpu);
 
-		gpu->funcs->recover(gpu);
+	gpu->funcs->recover(gpu);
 
-		/*
-		 * Replay all remaining submits starting with highest priority
-		 * ring
-		 */
-		for (i = 0; i < gpu->nr_rings; i++) {
-			struct msm_ringbuffer *ring = gpu->rb[i];
-			unsigned long flags;
+	/*
+	 * Replay all remaining submits starting with highest priority
+	 * ring
+	 */
+	for (i = 0; i < gpu->nr_rings; i++) {
+		struct msm_ringbuffer *ring = gpu->rb[i];
+		unsigned long flags;
 
-			spin_lock_irqsave(&ring->submit_lock, flags);
-			list_for_each_entry(submit, &ring->submits, node) {
-				/*
-				 * If the submit uses an unusable vm make sure
-				 * we don't actually run it
-				 */
-				if (to_msm_vm(submit->vm)->unusable)
-					submit->nr_cmds = 0;
-				gpu->funcs->submit(gpu, submit);
-			}
-			spin_unlock_irqrestore(&ring->submit_lock, flags);
+		spin_lock_irqsave(&ring->submit_lock, flags);
+		list_for_each_entry(submit, &ring->submits, node) {
+			/*
+			 * If the submit uses an unusable vm make sure
+			 * we don't actually run it
+			 */
+			if (to_msm_vm(submit->vm)->unusable)
+				submit->nr_cmds = 0;
+			gpu->funcs->submit(gpu, submit);
 		}
+		spin_unlock_irqrestore(&ring->submit_lock, flags);
 	}
 
 	pm_runtime_put(&gpu->pdev->dev);

---
base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
change-id: 20260210-recovery_suspend_fix-77a65932fa4c

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


