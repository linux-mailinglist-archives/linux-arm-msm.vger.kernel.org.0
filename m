Return-Path: <linux-arm-msm+bounces-96087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGQ3LYrmrWmn9AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 22:13:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4024223249C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 22:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16C6C3015E2D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 21:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE41355F25;
	Sun,  8 Mar 2026 21:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="cjBBVeqh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79042351C25
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 21:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773004415; cv=none; b=LiyipIsjpv7vSTHmYthaF6aChDkK1zq6wGvpi0mf8iJ2MHkOHgDnEXeq9v+70W2m5Msxo+0wd/i9aW3s3D9+iR/hGm1CUF3x5GhF/E5bQLJ+cwYVexaN2SMV3LOeSeQ/3uPo6eNZCMrCmPgNOD6Q1AyX4xjm9aWsfkCjJ3ctmHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773004415; c=relaxed/simple;
	bh=IwQsRi65M4qXQUkCCxcuReQn++piLHkRFWLqIAUpTuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lDH5yMGcVuT4xIwlMWTnLNP4NJraE7W9KNDYe+J4fo3OZDy2kE/D74h+iwB1Ia4TwO4ScZed88nMnCW29x7cED5X7SpbgmhsLnEQK14xJv6vFNy0g3rtOugpTpSm+m1bgFnq/EWG1oaJhm5/gdlv+hUfu56u/PK8tmD5nx9id30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=cjBBVeqh; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1773004401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RpqpYlSXeAg/awnB0CvRWHuxixfrf2T/O/CAPqniJDI=;
	b=cjBBVeqhU4T10lCpRAAeAjU4MCvwUt698hAAsE2RWi1Qx/9Tw0CE0dvcbuicEw1Q4mZD6z
	UorENWb2j7lE2N+avFntgIvEtixr2llBmLzs9WkkY5IJkDJdLwwQSL5N9K9j8qUtR+D8r+
	Sr7ntF2rhgPnKFD1iQ28UW29ErlFzNp6GL1vocdSJR7RUUv/iyaCRj5ZGPuvsb1uf93JOB
	ZRdEbhl5sJeeqrPuhIK5VsQX9N8t/Cwn0521TR7Eo3yxF/hS4VqrOX9gK1KJcbRu3u/rNf
	6eCwLm7iciBqtV0YwVsdCO4zTNByzkNLsiQAWsRfSrX1T+18o2V/n4dDJ44sNQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 08 Mar 2026 14:12:54 -0700
Subject: [PATCH] drm: msm: adreno: attempt to recover from ringbuffer drain
 timeout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-adreno-ringbuffer-drain-timeout-recovery-v1-1-985a33faf108@postmarketos.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQ6CMBBG4auQWTtJC0lBr2Jc1PYvzsLWTIFoC
 He3Yflt3tupQgWVbt1Oik2qlNxgLx2Fl88zWGIz9aZ3ZjAT+6jIhVXy/FxTgnJUL5kXeaOsCyt
 C2aA/dnaEd9fJDilQy30USb7n6v44jj8C+n3LegAAAA==
X-Change-ID: 20260308-adreno-ringbuffer-drain-timeout-recovery-617ea69813fc
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773004397; l=2696;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=IwQsRi65M4qXQUkCCxcuReQn++piLHkRFWLqIAUpTuE=;
 b=eGLN4VQHSoWAmzLT9wCgcSJt1HexLpTsXFY/zSncDP/EA8z4I5dzj0yYnNm92JPgaE46Hkccy
 VOeuuDdDFAiC5lPjHB0M+Wg6skuqLqSpRRvniitEFDaE+chlBosgLtp
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 4024223249C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,minlexx.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96087-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.910];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

I found a 13-year-old TODO while debugging gpu stalls on sdm6xx/a5xx
and thought I might as well try to implement it. It doesn't fully
resolve all stalls in the driver, but it's a start.

[drm:adreno_idle [msm]] *ERROR* 5.0.9.0: timeout waiting to drain ringbuffer 0 rptr/wptr = 32C/C
msm_dpu c901000.display-controller: CP | opcode error | possible opcode=0x00000000
msm_dpu c901000.display-controller: [drm:a5xx_irq [msm]] *ERROR* gpu fault ring 0 fence 29 status 800001C1 rb 0380/000c ib1 0000000001898000/0000 ib2 000000000366D000/0000
[drm:adreno_idle [msm]] *ERROR* 5.0.9.0: timeout waiting to drain ringbuffer 0 rptr/wptr = 32C/C
msm_dpu c901000.display-controller: [drm:a5xx_irq [msm]] *ERROR* gpu fault ring 0 fence 29 status 800001C1 rb 000c/000c ib1 0000000001898000/0000 ib2 000000000366D000/0000
[drm:adreno_idle [msm]] *ERROR* 5.0.9.0: timeout waiting to drain ringbuffer 0 rptr/wptr = 32C/C
msm_dpu c901000.display-controller: [drm:a5xx_irq [msm]] *ERROR* gpu fault ring 0 fence 29 status 800001C1 rb 0051/000c ib1 0000000001898000/0000 ib2 000000000366D000/0000
[drm:adreno_idle [msm]] *ERROR* 5.0.9.0: timeout waiting to drain ringbuffer 0 rptr/wptr = 32C/C
msm_dpu c901000.display-controller: [drm:recover_worker [msm]] *ERROR* 5.0.9.0: hangcheck recover!
msm_dpu c901000.display-controller: [drm:a5xx_irq [msm]] *ERROR* gpu fault ring 0 fence 29 status 800001C1 rb 000c/000c ib1 0000000001898000/0000 ib2 000000000366D000/0000
msm_dpu c901000.display-controller: [drm:recover_worker [msm]] *ERROR* 5.0.9.0: offending task: sway (sway -c /home/user/.config/sxmo/sway)
watchdog: CPU1: Watchdog detected hard LOCKUP on cpu 2

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d5fe6f6f0dec..77cda368eba1 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -742,10 +742,11 @@ bool adreno_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	if (!spin_until(get_rptr(adreno_gpu, ring) == wptr))
 		return true;
 
-	/* TODO maybe we need to reset GPU here to recover from hang? */
 	DRM_ERROR("%s: timeout waiting to drain ringbuffer %d rptr/wptr = %X/%X\n",
 		gpu->name, ring->id, get_rptr(adreno_gpu, ring), wptr);
 
+	adreno_gpu->funcs->base.recover(gpu);
+
 	return false;
 }
 

---
base-commit: 52584178a10aa82d80aadda690f4bbc76d92ddda
change-id: 20260308-adreno-ringbuffer-drain-timeout-recovery-617ea69813fc

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>


