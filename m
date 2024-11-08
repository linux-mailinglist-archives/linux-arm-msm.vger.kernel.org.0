Return-Path: <linux-arm-msm+bounces-37297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3290C9C130C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 01:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE49D2841E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 00:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB241BD9F6;
	Fri,  8 Nov 2024 00:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xm7hdksO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E951BD9E3
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 00:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731025307; cv=none; b=n1ltC7NLrsApZmI7T3IuOWAtKp3W+7Amage9r9ZenY2/ndlwO9uYxO5TkELaUxjv4YturFv2zmW4tq3KW+c1fBFG7TG63k+/THFSqc6hdfoTWfzcfUGLb4X/I2zc/NSvdapOC4A5DE/umSGFIa29qp2LN6k2AE3I5G3SJ7Xp5lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731025307; c=relaxed/simple;
	bh=AR2ot2ScldeaKrjr/qeTAbSFGVp+4LY+MmiRX3d+ewg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qh9unKNJo7hiHgHjlvT2PH5Rehk1hiAeKVnCCLr5c76G7N/boAC9Zw+n5JAMVIcrfcbFyYHMHOoWEwKBoDtXqfyusn40cm3EeLt6S5URj5YQWuEXp5HGEBp17Sz6zKriczCqSeF/7RoUv44Vz8Iu10kCLSGBJRXH1bhgoyytLFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xm7hdksO; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso15160451fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 16:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731025304; x=1731630104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKmZ4meMm9nE0dI/BvNTGi28DshZDKFMZdPFX/d5o80=;
        b=Xm7hdksOKjzH5kl73OofaeoBfqPwoPu/eycVz8zLKMKY/tnIvxl8akbhHxmBo499PC
         wLVcAXZGaQH9h6en4GMqNxa+NtWvHE0cTdsvtpRyPy6DV/KVmjAXPHO93iWdCcgoPAQo
         w0T0WcP8hdaou7Bzydl/kIxzpBQqbE23V3lwELzRnAJy+antHH+eUVn/yYPgg951zM5A
         LUG/toZm8DFZae6r75QJhpk7jfQTJJB6b9Ng8dJOLDE2bnR/r78dThmhyP0O1p1kgUfr
         ep0zC6di4Nc6gPGVn2mHMlkMV6HOhHbh7JO7/YZdL9HxPLGpBhnBjKpcZUejdkAM7MxV
         zOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731025304; x=1731630104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKmZ4meMm9nE0dI/BvNTGi28DshZDKFMZdPFX/d5o80=;
        b=Sbl7cAyOlb730abQMUW/14YLYgnl7VHLayqra9jaPzJHtRLkzYlkJamdRZRaUi0GGk
         95nLF2w7L7vEi+cJUCpLNvBswHwXVnybjr5ADhi//VDcSJhXlmFFUL0cqe71ptylY8Jb
         3BnY9mw30j9V9mBgSuugFwvzO7TT/uTPULvMhjBne1lzRI1wAs4GoZf3hin8ADIlV21V
         aPA550qGMrmDJfyLo2Rqz5bfVB1Y2QE/L0+JBWrldpPVtBv5rnEKhFPyiUk9X8qSPyHP
         pRptmtCtNRTwbZ1TTERDXjFXnHaOdi9LdzG2Cb/n4qHYSyYADEyo8EJGhXZpuC3mXGby
         /ViA==
X-Forwarded-Encrypted: i=1; AJvYcCW9wewuOHFKskjkzEJC1ouLutyx2x3MyRdrD19/pBEv6BzCiCaTraG2eTc6TCXy7HJh+QBkbeI2i0031RJN@vger.kernel.org
X-Gm-Message-State: AOJu0YzfBeg3yeR9lm7ojkG7o0glxCXWVjp801MnsOA4GJadIsoj2QpK
	f5f6M+tD8JHQfeOBxiePkf6HhV96Kfuk7Pcx+p6CgfAcfBJX4JRDGvPuCWCODwE=
X-Google-Smtp-Source: AGHT+IGOBd1C2/u1sDhdEsw4b6WynLug8IcEk/4yg0nbhikVEpWeMtzi6UwH0Mu9GqYs0elB/cDwkw==
X-Received: by 2002:a05:651c:158f:b0:2fb:54d7:71b5 with SMTP id 38308e7fff4ca-2ff20280ab0mr3598621fa.22.1731025303838;
        Thu, 07 Nov 2024 16:21:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff17900a63sm4195191fa.47.2024.11.07.16.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 16:21:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Nov 2024 02:21:33 +0200
Subject: [PATCH 02/14] drm/msm/dp: drop msm_dp_panel_dump_regs() and
 msm_dp_catalog_dump_regs()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-fd-dp-audio-fixup-v1-2-40c8eeb60cf5@linaro.org>
References: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
In-Reply-To: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4566;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AR2ot2ScldeaKrjr/qeTAbSFGVp+4LY+MmiRX3d+ewg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnLVmOYKBgfvb+d+khmE2/qFL9b8EIYfJneeqrr
 jL0XRP1qqiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy1ZjgAKCRCLPIo+Aiko
 1UqCB/9UqsIYfGSTs8f23lHRsCMhL86Oo4W2rAeToZsOGj4vggqbsrTchD5BS0MY37Y1/hS+J5O
 GCsz81GpFHoHZQJtdaLtEZVLTOSrE553BDARSYVosWT6W1jTafsxubFHe6I8z+GzWUUkJf4yIHK
 Ov0GcWbCGLTWvC0hHhqZDASPwv3Tj19Y9Xt6m2W5OxMZy803VmL55RTOboq9vEu3NHXil6bYyG0
 iNWgF/MeU52rpM68MheZAKRvbVC4AI74HhVBxC8beI7vHzf0kDmH9m1gWVNvr2W7amU/7kMRXWO
 mXPjOXDTAW/11X3Ay/sbgkwiTc4m8G7z2fLFwrjHW/jfBhMB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs() are not
called anywhere. If there is a necessity to dump registers, the
snapshotting should be used instead. Drop these two functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 37 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 -
 drivers/gpu/drm/msm/dp/dp_panel.c   | 11 -----------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 -
 4 files changed, 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b4c8856fb25d01dd1b30c5ec33ce821aafa9551d..0357dec1acd5773f25707e7ebdfca4b1d2b1bb4e 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -276,43 +276,6 @@ int msm_dp_catalog_aux_wait_for_hpd_connect_state(struct msm_dp_catalog *msm_dp_
 				min(wait_us, 2000), wait_us);
 }
 
-static void dump_regs(void __iomem *base, int len)
-{
-	int i;
-	u32 x0, x4, x8, xc;
-	u32 addr_off = 0;
-
-	len = DIV_ROUND_UP(len, 16);
-	for (i = 0; i < len; i++) {
-		x0 = readl_relaxed(base + addr_off);
-		x4 = readl_relaxed(base + addr_off + 0x04);
-		x8 = readl_relaxed(base + addr_off + 0x08);
-		xc = readl_relaxed(base + addr_off + 0x0c);
-
-		pr_info("%08x: %08x %08x %08x %08x", addr_off, x0, x4, x8, xc);
-		addr_off += 16;
-	}
-}
-
-void msm_dp_catalog_dump_regs(struct msm_dp_catalog *msm_dp_catalog)
-{
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-	struct dss_io_data *io = &catalog->io;
-
-	pr_info("AHB regs\n");
-	dump_regs(io->ahb.base, io->ahb.len);
-
-	pr_info("AUXCLK regs\n");
-	dump_regs(io->aux.base, io->aux.len);
-
-	pr_info("LCLK regs\n");
-	dump_regs(io->link.base, io->link.len);
-
-	pr_info("P0CLK regs\n");
-	dump_regs(io->p0.base, io->p0.len);
-}
-
 u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
 {
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index e932b17eecbf514070cd8cd0b98ca0fefbe81ab7..62a401d8f75a6af06445a42af657d65e3fe542c5 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -104,7 +104,6 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 t
 				u32 sync_start, u32 width_blanking, u32 msm_dp_active);
 void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp);
 void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_dump_regs(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 				struct drm_display_mode *drm_mode);
 void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 5d7eaa31bf3176566f40f01ff636bee64e81c64f..7d122496723a32fd591d094269397a9fdd51fe44 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -317,17 +317,6 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 	return 0;
 }
 
-void msm_dp_panel_dump_regs(struct msm_dp_panel *msm_dp_panel)
-{
-	struct msm_dp_catalog *catalog;
-	struct msm_dp_panel_private *panel;
-
-	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	catalog = panel->catalog;
-
-	msm_dp_catalog_dump_regs(catalog);
-}
-
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
 {
 	u32 data, total_ver, total_hor;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 0e944db3adf2f187f313664fe80cf540ec7a19f2..47c1d349be470b60596b64a7bc8c7c39d2e8fdd1 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -55,7 +55,6 @@ struct msm_dp_panel {
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel);
-void msm_dp_panel_dump_regs(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 		struct drm_connector *connector);
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,

-- 
2.39.5


