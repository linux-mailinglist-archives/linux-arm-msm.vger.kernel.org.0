Return-Path: <linux-arm-msm+bounces-98420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJrME7uHumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:08:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 328EB2BA85A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FC483085117
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B323C7DFB;
	Wed, 18 Mar 2026 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b="jLVP3DBt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from adishatz.org (ns314768.ip-37-187-26.eu [37.187.26.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6473BB9FE;
	Wed, 18 Mar 2026 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.26.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831706; cv=none; b=bWfF8G4HxoogvBXyKWeKauHi2n13qN1sv/xnfur/o1CIXRylx8WDqayS5RgbtbdVq9zLwOjYdjQwhO1ouwlzS22VUJ7Fm1kDolg8b+V45UZL+P8xQzGZUwKLnFQXAtoSz3NBJgi/nA6bb8TRb4Ly/LCtz+RZKt/gAZSjDv0JmXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831706; c=relaxed/simple;
	bh=+h7VgWxTbctynTEEzkJwuUAj6UJY3rV4CeG96iKevXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d3V1Aw5B7F+4YOo+3f/FB36iuA1DZ1FW+3D9fC3cbdcptORKZRKP5iGf0sKiHYEu5cNTYMLNdrr7hfT4Ua1A+SyZS2/StEJQVeGpiXJq1LlmA7uOZhf1l83RulBFkdtZYV7vCyPXJ/UmjIEut4cmcLovQoDt3pVYLSeRZ4VTcdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org; spf=pass smtp.mailfrom=adishatz.org; dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b=jLVP3DBt; arc=none smtp.client-ip=37.187.26.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adishatz.org
Received: from p-si-bellegarde.ad.iut-nantes.univ-nantes.prive (235.33.83.79.rev.sfr.net [79.83.33.235])
	by adishatz.org (Postfix) with ESMTPSA id 325274C0F46;
	Wed, 18 Mar 2026 12:01:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adishatz.org;
	s=mail; t=1773831697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WSsQgT58pE8KtcDFP/XIQpUja66lpILoARG6AZGn0Xw=;
	b=jLVP3DBtYhPlxOAeRmV1QRSH6fA57Mdq0ShZivzZz6sDpuNehH3UN6iTp90mFhBEfqKJKO
	uQxZ+GFIudI+kGrnSjTN1c+l4SIpnSPuiV5psRvYkbgLWpgf/RmfXBTsxi4RwPCA6KtmSR
	lGIthJ+9hjbACH6QAQxRCClQyHZPf7VvJHFnrpG4YFUJZcPOdpCsdBM855eBJ6bfLmY/a1
	P4IjTTxT3GJOeLftnrQ8VhNvpLm2OMbvkXw1D4qwxSDqUum8od6zPglOwABReP/Ql9YRZ3
	kJwWUdxMGiUynm6loyYnkaDHkImH36qj/g/iOvQHd6WRseT3vN8vzQ2c7nRVRg==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=cedric.bellegarde smtp.mailfrom=cedric.bellegarde@adishatz.org
From: =?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>
To: robin.clark@oss.qualcomm.com
Cc: lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	antomani103@gmail.com,
	mitltlatltl@gmail.com,
	krzk@kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>
Subject: [PATCH] drm/msm/dpu: fix vblank IRQ registration before atomic_mode_set
Date: Wed, 18 Mar 2026 12:01:26 +0100
Message-ID: <20260318110126.274347-1-cedric.bellegarde@adishatz.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[adishatz.org,reject];
	R_DKIM_ALLOW(-0.20)[adishatz.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,adishatz.org];
	TAGGED_FROM(0.00)[bounces-98420-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cedric.bellegarde@adishatz.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[adishatz.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 328EB2BA85A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dpu_encoder_toggle_vblank_for_crtc() can call control_vblank_irq()
at any time in response to a userspace vblank request, independently
of the atomic commit sequence. If this happens before the encoder's
first atomic_mode_set(), irq[INTR_IDX_RDPTR] is still zero.

Passing irq_idx=0 to dpu_core_irq_register_callback() is treated as
invalid, and DPU_IRQ_REG(0) and DPU_IRQ_BIT(0) produce misleading
values of 134217727 and 31 respectively due to unsigned wraparound
in the (irq_idx - 1) macros, resulting in the confusing error:

  [dpu error]invalid IRQ=[134217727, 31]

Since irq[INTR_IDX_RDPTR] will be properly populated by
atomic_mode_set() and registered by irq_enable() as part of the
normal modeset sequence, silently skip the vblank IRQ registration
when the index has not yet been initialized. This matches the
existing pattern of the master encoder check above it.

Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 1aa74ecb08be..8a3e09d21c38 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -256,6 +256,10 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		goto end;
 
+	/* IRQ not yet initialized */
+	if (!phys_enc->irq[INTR_IDX_RDPTR])
+		goto end;
+
 	/* protect against negative */
 	if (!enable && refcount == 0) {
 		ret = -EINVAL;
-- 
2.53.0


