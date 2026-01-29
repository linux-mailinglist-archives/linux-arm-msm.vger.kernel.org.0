Return-Path: <linux-arm-msm+bounces-91102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIAVEnbKemlc+gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 03:48:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9590FAB3F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 03:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34B6F3008223
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 02:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABCC2F9D98;
	Thu, 29 Jan 2026 02:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RE5oEN+B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64E62C15BA;
	Thu, 29 Jan 2026 02:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769654897; cv=none; b=cWtCUHsGkOBG5IH0uaNRmC5obOmiY3sq+7H54/GWf83QEOokar7HKP7sDhYkwmLRHOWMHHSsLzvhejzooWooXMbgpxzMsj7LOC8uRXXGHtbMjWAiLbfnBv7vQdXqWIfayz7WTSu/DxEWVYnDOXsKrDpf32G81P0oQuJdntKBnPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769654897; c=relaxed/simple;
	bh=lkzp0nb6klztZYzcVb6n2Vp3zkT8ip+rPJ8dVTaMUB4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Gpkfacf3Ti0wTPVx1EY6SbMgAGn9RR7441gE2IC6Dvd1mXHyj4C+jVXBF8MWO3FcH/xaxbGBnve/NgsC/sagFZ5khymr6vDgIRk4N1b2bAuh41vsCxLrOq3kb8EhOeF8fdN9y5m5XeLfjFbBSADth/hdloLIopvL7CJDwUjt3kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RE5oEN+B; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769654887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w37zi7Z3Z1toycVB9XsslK/3vJdWdgc5ktIQdfluvMU=;
	b=RE5oEN+B/mFoQOi85mSF6DC0enssy/ugYR03qfZbKSUNTMLcb6Bl4sQObojIGaY6gFK++4
	qD4rYueiwW2la2xvYSE6QLhakVnqY4ec5S3JVzGT7crOLJ4lJgc0whIoTRRma6ng+rU+xT
	FjGWSYkkzH2Xcs35BJjMC4AeliQ8eIg=
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
Subject: [PATCH] drm/msm/dpu: Fix smatch warnings about variable dereferenced before check
Date: Thu, 29 Jan 2026 10:47:11 +0800
Message-Id: <20260129024711.30268-1-sunliming@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91102-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 9590FAB3F2
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
 
+	u32 offset = ctx->cap->sblk->sspp_rec0_blk.base;
+
 	c = &ctx->hw;
 	/* program SW pixel extension override for all pipes*/
 	for (color = 0; color < DPU_MAX_PLANES; color++) {
-- 
2.25.1


