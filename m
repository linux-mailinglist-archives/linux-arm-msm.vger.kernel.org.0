Return-Path: <linux-arm-msm+bounces-88148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 370B1D0657C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 22:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CFDA302781F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 21:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67622329C56;
	Thu,  8 Jan 2026 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FW3yrVG3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4872D6E68
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 21:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767908209; cv=none; b=g3RUcfopD8lUeX915p7MtlrdAFw97X8z7d2ROstvxRQQxnNQrHuGn6oBB+8B9HOCTQzgk0tjmcZvaX5JJAbjQJTmGg6gXoP2qdnEmR9ZpRMVGyzpW6466k1eYkrntGLi0dauXW7fLqNGeN1Qq1OJiJZurAICPmU6lWCX+g68gmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767908209; c=relaxed/simple;
	bh=TZRcR/La8sU9V7mWVhKV+xchY2Yai9plkmM90nGGXZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tAvpUDYMQFDb1SFayDsVW+ZoY+m6P5Ns3pvpaOImnevrEwc5p0+VIvNJnAfNMw2oJCUF7eJccFQK32WfGy021jil26t+jbmQk2Ov/HrbASfyWGtRdVXTrZ5dY0/4GYFdAJ0NWIedFfJjwiWeUDf1Grp0dBisxxAMekNTqhP88cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FW3yrVG3; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-382fd8aaa6eso22447551fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 13:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767908206; x=1768513006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cqbx+nBwTy8ehc/EWm5BAgZ35l9VwydtmAp8+5UCQfg=;
        b=FW3yrVG3t0C/LYdp9XUu9gzxnniOAICHH+7zCxNIuEyPi9aCCFeAUWsoE4f8NYMzn7
         A4/HhGVd8FvshjhAnQWStKbHvrYSMO0NnxenVKSvbVTNmUc2HnNSwW6uDgg0sKRh8ICO
         lFkmVmfbCYHQC+M5VHD/k+g3v6ha0kzGSAbY/qkpDfzJHCulmikkpUjC4k+xz4JkWxN3
         QDQlH2ZVbbBTYl/JIL9BqLSrRhIdy1/LMnU3hQ/EBASUNl03e2DRNLtwZNj6a8/1pzDx
         ye/6VkHsaA8YB/hFcyc2BE0QxFvmfTsk4bGeXrz2/ZGLRGr9P/FEV8+KejMIWAibRH56
         +wgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767908206; x=1768513006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqbx+nBwTy8ehc/EWm5BAgZ35l9VwydtmAp8+5UCQfg=;
        b=TIRXT2wlTALspkZH7/A5W8V0D9ZzyA11aUnv35fnSzNMNyCosYyN9kLbs6l2d0gIl5
         I8D/YwQXvPEB95rG30cdX4pzb0g84Wc5kgEESFz4f7/p+AN3sErGTHIZsaWQxuF1Sm2p
         F+nSdUoBWbWCi8D9Nsg8yWCPOASo0hu3Rroxfz8QpvnpzhKhdLlvO2rKNZ3bbbsPIMLx
         746ZT3+Ce8mqlfol/H447fpVXEUnHFV7CGa5dhWV9lHitO75cjlo1FB5aCw6WhU+/0il
         8+L8i2LUkMphNZrzVkcqB0ouY6MYpLPqV313kgMxcwKZ+KvTGu6ZduOpLGF+Jrl6dXe7
         /6HQ==
X-Gm-Message-State: AOJu0YxwsMJKBNhVhZdXs10ZzwpO8S6uJ62HdPOj+ToaEK1AGpfYN/MD
	X2ooly3C6cARlnN/MyFPepeEv9ryAy4fLoRUv8frcf8DdVnB9VOBk92QBiKI5T6TJL4Je/g=
X-Gm-Gg: AY/fxX4RxOpHQSKFh39hUWr5E3VLnGzWsYjbUag6z0iB+yzP3lqfac9Bbinv+/uPhLI
	yNS5OHMCghtCdkxoeokCYz+/Fw+Fc7x7F97Fc19FJLfAIrLW5Y0hqBj/TXjSevU3Fb8j5UtXhcQ
	CUajYOj75oHBAZ08/P+ATdCdTJox6zlDE+UaInMwjQ8p41oo1ikOO/K9rJPsoZS+V25B3+tTs+7
	MOXEPfoDK95jx55Ow/aA5wm0+S9oqySCZm0MMi92h5/tIFINZRDsjhivT5om3MdixjE2yR23VVv
	sXjC2eERgC6JEQCELG/vzuA4aQjWWW+du+b1hIhiKjIBmBnDmuUADXyGDr0ce6d24JoMHRSZHK5
	MWzrJwghfOlnO6MNrODukcv1+EhJWkfErXwG0XgMdBWBHlYVcjQFcgtmNT9mvo0US9+ggngfiyS
	lJ1duNN/xSlDRb
X-Google-Smtp-Source: AGHT+IFMaV8dzIQb/uzOgwkOhBBFvf5v6hGkMaSQ2siFokcp+laluHB0fDW4rArK+YdxprRFy/48uw==
X-Received: by 2002:a2e:b8d0:0:b0:382:88f2:fe25 with SMTP id 38308e7fff4ca-382ff880808mr21325141fa.45.1767908205699;
        Thu, 08 Jan 2026 13:36:45 -0800 (PST)
Received: from DESKTOP-BKIPFGN ([45.43.86.16])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-383140e641dsm4140401fa.50.2026.01.08.13.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:36:45 -0800 (PST)
From: Kery Qi <qikeyu2017@gmail.com>
To: robin.clark@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org,
	Kery Qi <qikeyu2017@gmail.com>
Subject: [PATCH] drm/msm/dpu: vid: guard hw_pp before accessing merge_3d
Date: Fri,  9 Jan 2026 05:36:34 +0800
Message-ID: <20260108213634.1905-1-qikeyu2017@gmail.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dpu_encoder_phys_vid_setup_timing_engine() dereferences phys_enc->hw_pp
when checking/using the merge_3d block.

hw_pp is not guaranteed to be present for a video phys encoder until the
virtual encoder atomic_mode_set path assigns it. If this function is
reached on an error/unwind path (or after a partial setup) before hw_pp is
assigned, the merge_3d checks can trigger a NULL pointer dereference and
crash the kernel.

Guard merge_3d accesses with a hw_pp NULL check.

Fixes: f87f3b80abaf ("drm/msm/dpu: don't always program merge_3d block")
Fixes: dfa35bac9930 ("drm/msm/dpu: use struct dpu_hw_merge_3d in dpu_hw_pingpong")
Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 0ba777bda253..5e5acbe9147f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -308,7 +308,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
 	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
-	if (intf_cfg.mode_3d && phys_enc->hw_pp->merge_3d)
+	if (intf_cfg.mode_3d && phys_enc->hw_pp && phys_enc->hw_pp->merge_3d)
 		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
@@ -322,7 +322,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 				phys_enc->hw_intf,
 				phys_enc->hw_pp->idx);
 
-	if (phys_enc->hw_pp->merge_3d)
+	if (phys_enc->hw_pp && phys_enc->hw_pp->merge_3d)
 		phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d, intf_cfg.mode_3d);
 
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
-- 
2.34.1


