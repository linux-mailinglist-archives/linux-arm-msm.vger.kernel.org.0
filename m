Return-Path: <linux-arm-msm+bounces-113913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M3QzLf2zOGqQgQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 06:03:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4996AC664
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 06:03:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VTTxz6b0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113913-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113913-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2A6D3008CA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 04:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A83357CF3;
	Mon, 22 Jun 2026 04:01:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB5B351C09
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 04:01:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782100903; cv=none; b=S7pRBBSJAQ8E4uxgI69ql+lz7TE/GdExooNJPky3Tw8Faus3zYE8dlvSMRa1cGV8CfD9Fj9Jj6unpJ4vWRKb/fwO5doSogilJJUp+N08ivWimrc6wXddn+YA53APC+0U0spKnXpRzFLKCL2gUUgpdVbwVa4tLo6oaqrxcR0dx6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782100903; c=relaxed/simple;
	bh=6pFNLpuLug7O+tfXSFxSsEKPBIXycCEnudrnGEpJF8o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iaIQQ7QFwkRwawe/quOvA9g7TYEKOAM+pnMJADUlZdpyuvYm/DqHDe37o97IDL51NmSEBw+hlalpntYDwayv+3Q2bYA0iIRHVTOy6fCk6yCnmBtnwtqhg1teaHUlthjJROIGjii4l+TCbLI/s4QIiXVhM4Q+A98A+HZp6BSqPbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTTxz6b0; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0b7ca8831so7846245ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 21:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782100901; x=1782705701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=opbavV9WMk/II6cyX6sw7s9bgwRaNlObVyJZX7PV6k0=;
        b=VTTxz6b0Xz0f9KjipD0w/x7a3khfAHSBo4Ap4+JpxgWeCYA8IT1j7teqfW5yuEkUZ5
         ND5qYM35pZ2ab+KBIzA9h/oCNgn79p3bT804cs2OVrV6A28gWKTVfE8I9Py7gQWXxGa0
         G48QP6wBFhJlHqO0gtxPFI2GicEw9Os+B/Nu5jl9Olrz/Cdp6gJVozB5jgyi63CLlgu/
         fGweXq23jfEiIRkPpGGJR+oNjSpseUPlYzLwuMoZnr8vAOLILobWB+HAsXGURuBoSLMD
         r7OQmWw65YH2EJO3+vrMekcjq3vaRzTpmNBVxp8YcBSxNpQy+urg0S24kOmwppALvk0G
         iy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782100901; x=1782705701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opbavV9WMk/II6cyX6sw7s9bgwRaNlObVyJZX7PV6k0=;
        b=Yd7SR3lymLNIlFocJCL7zclZPJCxJgiaJjEYQdTjIfGdqpfhq5ot1QpT/B9xBmRLyX
         CJOEzFl0MQ/zHQY0D1fFx3oMIX8TPnZWTb7iOfSAIRUOeKvViACOq4UCvez+02MP61S4
         X7P0EVc0IMDILRe9ByWon7wMmcoJU254W/wx6+1ZDz6TpwYRe3qzxHpRPUQtBdx72Up7
         aQTF+gq3Nge4/c53hB8GKXuw/izkGsYJ8gYTA4bAgyCVsWphUWY7U9eW+p5Ht4DYTjPR
         v3sgEhzYMTByHtOVruWYYU4C6dt0jySvXBJBemzMoJV2GdMRGCDMrqqY4g/c2KqPfk/B
         VFvw==
X-Gm-Message-State: AOJu0YxvJKi9AD4M5V/wNcScr7xIfBm0jty/nbm7fcctC/WRhNjbnyG1
	xZR2UpLACyhXrXklWYv/N9MskJNxhJLIFn5qk8xddTh0w31tosc0WBVp
X-Gm-Gg: AfdE7cl078jbPTtEz401Zcf2IxhUP8qHu8fiX0p8ZDRlbJylw0WRVSJE9scX9GqyXmy
	mlZuQuPgHC5agc1TGyNRGXE2CTIfiqgTlBmSW9HnSGu2l0CCSkAJb6sQAIWq4QrvyMxpVxlCTth
	K4XzP/Vhgd9mnqzE6qajlqus6sXjaHHX9HwGuTl+qS6P0xYn60tps2OLlmEcDFRONf2Tpt9zZGY
	PHKbF8RIWgGf2tDAa4ojsdTbAJuzxnuOLLceIiv2LBJbp0VNyPmYe/PIpiArsLGQlN9y2h/87Ug
	yhqae8K4UW4zQWImm2IADykFhNWXip+IZDMIMG6/BEWZCYSkX1tsltIup/LneztPJh1RDAMu0hM
	wo5O+b2uT7IgOr6aIePmR8IcBTEqq04V/K29LWuz1QjiUmr3dkE+P/tVSd6MpNltIEWUolkgk61
	9YNRu7Hpq5x9WWreFQJFXysAVYWoc3+jGgJtzYPaM=
X-Received: by 2002:a17:902:f545:b0:2c6:a45a:4f85 with SMTP id d9443c01a7336-2c7190134e0mr68990495ad.3.1782100901072;
        Sun, 21 Jun 2026 21:01:41 -0700 (PDT)
Received: from localhost.localdomain ([202.164.135.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfdad0sm71907115ad.63.2026.06.21.21.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 21:01:40 -0700 (PDT)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: [PATCH] remoteproc: qcom_q6v5_pas: Release dtb_firmware on stop
Date: Mon, 22 Jun 2026 09:31:14 +0530
Message-Id: <20260622040114.17128-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-113913-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:saileshnandanavanam@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[saileshnandanavanam@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[saileshnandanavanam@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD4996AC664

qcom_pas_load() acquires a reference to pas->dtb_firmware via
request_firmware() whenever the platform defines dtb_pas_id. This
reference is only released on the error path inside qcom_pas_load()
itself, when qcom_mdt_pas_load() fails.

On the success path, pas->dtb_firmware is never released by
qcom_pas_start(), qcom_pas_stop(), qcom_pas_unprepare(), or
qcom_pas_remove(). Since qcom_pas_load() runs on every load/reload
cycle, including subsystem-restart recovery, this leaks a firmware
reference on every successful boot of remoteprocs that use a DTB
co-firmware image (e.g. ADSP/CDSP/MPSS on SM8550, SM8650, SM8750,
X1E80100).

A second, narrower leak window exists if qcom_pas_start() itself
fails after the DTB carveout has been mapped: the remoteproc core
does not invoke .stop for a remoteproc that failed to start, so
qcom_pas_stop() never runs to release the reference in that case.

Release pas->dtb_firmware in both qcom_pas_stop() and at the
unmap_dtb_carveout label in qcom_pas_start(), alongside the existing
teardown of the DTB carveout mapping, and clear the pointer to avoid
holding a stale reference into the next load cycle.

Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")

Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..040aabbe5860 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -360,8 +360,11 @@ static int qcom_pas_start(struct rproc *rproc)
 		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 
 unmap_dtb_carveout:
-	if (pas->dtb_pas_id)
+	if (pas->dtb_pas_id) {
 		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
 disable_px_supply:
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
@@ -419,6 +422,8 @@ static int qcom_pas_stop(struct rproc *rproc)
 			dev_err(pas->dev, "failed to shutdown dtb: %d\n", ret);
 
 		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
 	}
 
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
-- 
2.34.1


