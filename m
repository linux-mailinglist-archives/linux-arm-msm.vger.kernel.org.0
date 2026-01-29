Return-Path: <linux-arm-msm+bounces-91103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OmIAf7Kemlc+gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 03:50:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52978AB427
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 03:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B099300EFA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 02:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DE9358D21;
	Thu, 29 Jan 2026 02:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JG+j+f9F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D833570B4;
	Thu, 29 Jan 2026 02:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769655023; cv=none; b=GuBUlrX1aVM8oqvaI+7X9YfTaBvxDjSTJx03xqOkEojHN3PgxfAJj8VA5yQOkKt62hbQ+fxuiZWq4x05bKFbByT7WVQTvwim6+2KvKyzcZvWFsFMagCdX1nif1HgZBCwSu5DMf2ITg4QsmOyllekT67IfPWelChqayomr00R4+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769655023; c=relaxed/simple;
	bh=aMy6cyy08ml3JgdiwozTnc63ZLFrmEaGVYFaLd1y5rc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HaFbuWhyjy2xBuIMvMJK6ojaIvGHGJkduMSbn3RCFF0EZtKdEzRE5B4iwtLylAVYhTirZup0fCOLf9WfnvGfQoYiHDbShERNcGSfv79d4mnNAiT62E8WydadQ6NRkj9kkXJjp5FELi/u8fUgn+XAJ7Rqe1A6wJd4H7PhpTsNNHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JG+j+f9F; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769655012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0LxstW29k/h/2F7AZ/O8A+GqEd32z7jzPtpyQ0dWEUQ=;
	b=JG+j+f9Fe/HLug+o+caz4zwkyGcp/qX2uNIIpAKU0L1ZplRLRmJNRJm6d/f5oeQ8DrydYI
	xGfh2QarC5IDlo1mHBeRtg9mSLgUt7AIjDxCFhwhX8OkMadq4jXMM7LJXTxVPmx2oZiL+2
	P7MPkEE2yPHFgUudYu421dCOvpIHz7c=
From: sunliming@linux.dev
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: sean@poorly.run,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	sunliming <sunliming@kylinos.cn>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH RESEND] drm/msm/dpu: Fix smatch warnings about variable dereferenced before check
Date: Thu, 29 Jan 2026 10:49:19 +0800
Message-Id: <20260129024919.30449-1-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91103-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com,gmail.com];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sunliming@linux.dev,linux-arm-msm@vger.kernel.org]
X-Rspamd-Queue-Id: 52978AB427
X-Rspamd-Action: no action

From: sunliming <sunliming@kylinos.cn>

Fix below smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
warn: variable dereferenced before check 'ctx' (see line 159)

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
Signed-off-by: sunliming <sunliming@kylinos.cn>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
index e65f1fc026fd..312ee6597ab1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
@@ -156,11 +156,13 @@ static void dpu_hw_sspp_setup_pe_config_v13(struct dpu_hw_sspp *ctx,
 	u8 color;
 	u32 lr_pe[4], tb_pe[4];
 	const u32 bytemask = 0xff;
-	u32 offset = ctx->cap->sblk->sspp_rec0_blk.base;
+	u32 offset;
 
 	if (!ctx || !pe_ext)
 		return;
 
+	offset = ctx->cap->sblk->sspp_rec0_blk.base;
+
 	c = &ctx->hw;
 	/* program SW pixel extension override for all pipes*/
 	for (color = 0; color < DPU_MAX_PLANES; color++) {
-- 
2.25.1


