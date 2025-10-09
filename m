Return-Path: <linux-arm-msm+bounces-76734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E6DBCAC20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 22:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A70C1A61CBC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 20:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381C5264627;
	Thu,  9 Oct 2025 20:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="YDAMtM0x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43D9243968;
	Thu,  9 Oct 2025 20:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760040651; cv=none; b=oQ3Yrs3wk5F4yAWH2RIv/0NTEbyBiRAs9UkjLb+P7+ROmdmPToKV4Sxv6qUVS9NhOO/kkGWrJk7kfQ8zKZmOQeiUKM/EgffX2CBFG7eyrevoEMeUxpGpqbOptm0SJF/XkII+Qsrh8rZqRzI9FQeMg+xhgsZFcq+AIEYQsqknB48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760040651; c=relaxed/simple;
	bh=YY7Ni4ZE9u19jYffFjApSiTE50P3andvCQORplpjrn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZDPhptQcAcpSEIgFY5bxWu2wUz2ls6R3Dv2cUJTEUirA7dOyiYop/oe0H+5bTOsnKCF3pmdN9OFH1HJ6ip/0CI0kM9mM+6DcYnJ4iZWlYhHJIFG4HtzNaiiHZsE8QpB1H5svaec4jzqVRi5v1ztXfSM2ViL28/6m6TcnxPh9lB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=YDAMtM0x; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id 6wxDv47sFn3LW6wxEv5BUC; Thu, 09 Oct 2025 22:09:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1760040578;
	bh=vdngJh840tLkhFfzkI4vmR2f7NaB/3n76TsJ3oZYjGk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=YDAMtM0xZMWyEyZyFOpLw3BPZcgOCTeNhBmVMuEp+UkHWCM0ozvZxecpUC7n9H7kh
	 yR7dQpViv8LJDXDzIufxxZtY+g5rxaiZaWHTCTSKr9PT4fbLyGYpApgrBInpW7gkCA
	 GBqefHBgpVMd1hC0XLiEcbF3IuwkJqCxI5/zTjkG8YqXXBTFtlUCf8mux+DlYWZN1i
	 njzyx68pxSjAg37NCU5CPYxWCkcliygO19GFqM6mezHSQ9L+qnxl3/Z9E04nAc+w9k
	 stta+Wy/Fx1v3UqysT8i40J/2tfPKN8P82HFxTVVMkW5HhUi0ZOHNJWsu9sUladSkG
	 gRbycFMByQEew==
X-ME-Helo: fedora
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 09 Oct 2025 22:09:38 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: Remove dead-code in dpu_encoder_helper_reset_mixers()
Date: Thu,  9 Oct 2025 22:09:32 +0200
Message-ID: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'mixer' is only zeroed and is not use. Remove it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 258edaa18fc0..94de83e125f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2171,15 +2171,12 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 
 static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 {
-	struct dpu_hw_mixer_cfg mixer;
 	int i, num_lm;
 	struct dpu_global_state *global_state;
 	struct dpu_hw_blk *hw_lm[2];
 	struct dpu_hw_mixer *hw_mixer[2];
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
 
-	memset(&mixer, 0, sizeof(mixer));
-
 	/* reset all mixers for this encoder */
 	if (ctl->ops.clear_all_blendstages)
 		ctl->ops.clear_all_blendstages(ctl);
-- 
2.51.0


