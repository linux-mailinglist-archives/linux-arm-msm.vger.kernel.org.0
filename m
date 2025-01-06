Return-Path: <linux-arm-msm+bounces-43955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA37A01E01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 04:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7595D7A260B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 03:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710387081A;
	Mon,  6 Jan 2025 03:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vY5Lhyhv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B11D15B547
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 03:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736132871; cv=none; b=g46U7pde+z4eY3PBEhjonWs63oHQHgX4gg8aDqKh8yIuOKh9Pn2Rb/246/ggYZXUh3utXLg4YQ1FjQSp9F5oNayLSnkB16yjUIQaSMWkExz1gVjVoiAdRlvNNf1Ry00yt6Arj4GSfQCOvKpiW4jvv19nuTMz0aEmJU+stfCuS4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736132871; c=relaxed/simple;
	bh=TTyO9vUJiSzSKuNCLaOk8E6Md2+vo7CigvDNmDQ5dQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=USuddu3+HxzlZi0DvpoYBw7F+drYtjGzwq1MpayWe5UsXKzTX1l3Hs45PBx5vE+Kt1yid5zgACneltzqb7xW77kzBiAdeKOh1C2FhAVPY0dWtlpGvELGDagLcIMlIas+AloOMGK9/l4F2BmQmSlAr/a3F+RJv+Shs1Af6cV+Sp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vY5Lhyhv; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401ab97206so14500828e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jan 2025 19:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736132868; x=1736737668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHORIO6iI0h0xBdzN/DxPXJ3YyQzxG7ieDWttD2a0a0=;
        b=vY5LhyhvfhaR8mPk5GB3fjb76cHdylxHtjRQkanf88jGT7SPEYQNkrygB9A8O/PyGo
         YOFhU2mt4qa7cZOw8hLS64u+oCZqiK1QbWaDy8ClcuqQX0mO1QMj38sWCw8xkkMCcUk1
         w7aQ/K2aH74Lt7L6qvzG1hKkhE2igzWQRnbQ+dqVlyCtUpGE8sH760hKvNEieeJjdWCh
         8vWJ/OyRX5oDyl/UdRSsXlF9jaPMaobBoHZnojIVZbo9eMzXi8BElGLKBVZxm6r6Xel7
         +vZOrf0KGP1SBajjD+zWSjDx58VsJ0Yse0GuC1fhDTxZ8BPgN7xoHlQysQlKU7uR1r4u
         Bj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736132868; x=1736737668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHORIO6iI0h0xBdzN/DxPXJ3YyQzxG7ieDWttD2a0a0=;
        b=Lc9Xe/RlODFckBs2i/qkBc//VmS3tBUbvO/EIAE0o9UTjKwbaS3O2dhdqgtrgHnawW
         D3PD5N5A01cdhL4TmiqNLd2qt571Ji0MlEXC5VU85qvbL2Qe3KV7DnBYrGtBN+ESNqUO
         P35X5ib4uW7nMApynZvwQZpVXFJKVqIxTB1gpKLvI6uCDEy7I2AL3jQ+fZwewN4IX3Oz
         5kKX1VQg9x6ALSSqYTKnHC4lOwcIKkUxwVMyRy2Yvp8KocdImiqy2Ge/o6Hj/4pN90IB
         DJK5DUXEo2BWLY/YlvdMP7G4z87xB2QzKw+49sgQgI1a4UdnXP5ATxDYcZXf+Ic+XtrX
         2qMQ==
X-Gm-Message-State: AOJu0Yxqcgo2QmLSLdRE5KnPfVrKniR2XdYjEJffdNIm7aGvFIIfsFRr
	3YTaI2/h9tZailcAiFCY2DRAxF6sZ34MqLg9SSwbw0FlNcB5zHFje3JDpOVG7vA=
X-Gm-Gg: ASbGncv1vCEJdRjRrUecg7/IsmIaYVnQwG3gYrpAkgkIlPe6taRXAJ/nbmlRwnI5pKI
	ocMp3TnyB2wve/PYga3rt7KjWjYCjaUiJohp23Mq6WNze10QNVSwN8uqgJRwg8HEpFM8CZtooU8
	WIHGIOYGnjZ28tyDo+7Z++mzUYu4o2FDQga8481ZhTLrv6UjuePYwx99cbLFBls6JYETjv5IShT
	zoOFMmx/4rRmNzQtx5FIvtyHWw4iw79+p4cwJlDf2l8jcoBDlmwdXCICGAGLRes
X-Google-Smtp-Source: AGHT+IFeKnvUXg4rQjtvUDrdsCyS0VoSHNamlaIcrDr+nFLxLcf5MDcnBUzENvp+YCaaH3LgEiIlEw==
X-Received: by 2002:a05:6512:628b:b0:542:6f59:f85f with SMTP id 2adb3069b0e04-5426f59f97fmr1444030e87.2.1736132867639;
        Sun, 05 Jan 2025 19:07:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 19:07:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:37 +0200
Subject: [PATCH v4 3/9] drm/msm/dpu: change ib values to u32
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-3-00b248349476@linaro.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
In-Reply-To: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TTyO9vUJiSzSKuNCLaOk8E6Md2+vo7CigvDNmDQ5dQs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j5aWLiZNIYu1U6N2nvPJazCBEqQO/PYqrD8
 mJvRYv6UeCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+QAKCRCLPIo+Aiko
 1X2tB/wJxl1N7EusjgzyUZ5t1JmlEMWYpjphupru0vUy0hFSvAm8SwwDZLpZbuPhNYfNXntq7KB
 7b8ZQVe0fb7LyBe1UWe6Pe/cVo+DpO1KuH1nxoyLbqE7/Oqtl2WBbMWatJWqPrwBmSALQuQT83z
 PZW5EmZH+lsaoISEQAUshn4cpwXUnBQ7qgmi+P8uP4nf7Ou5NeQJ1idIhXP8xDv7vFPcEcZODST
 sCXZQQ/p0xBchFuH2gCIBFKvDO0ps3xuUpto+tcxDD9xQM0nLkxPVumf9shNCH27Bcw1wrxGZ5w
 P/hCtu0fw1jBVgEGEPF2qJSJTBbORgC+r9K56k/UIeVbTOX/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The IB values in core_perf calculations (max_per_pipe_ib,
fix_core_ib_vote) are expressed in KBps and are passed to icc_set_bw
without additional division. Change type of those values to u32.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index f0d490afb53be2f4bc706af91da05bb893a5fe34..7263ab63a692554cd51a7fd91bd6250330179240 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -135,7 +135,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 	}
 
 	DRM_DEBUG_ATOMIC(
-		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
+		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%llu\n",
 			crtc->base.id, perf->core_clk_rate,
 			perf->max_per_pipe_ib, perf->bw_ctl);
 }
@@ -477,7 +477,7 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			(u32 *)perf, &dpu_core_perf_mode_fops);
 	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
 			&perf->fix_core_clk_rate);
-	debugfs_create_u64("fix_core_ib_vote", 0600, entry,
+	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
 			&perf->fix_core_ib_vote);
 	debugfs_create_u64("fix_core_ab_vote", 0600, entry,
 			&perf->fix_core_ab_vote);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 451bf8021114d9d4a2dfdbb81ed4150fc559c681..ca4595b4ec217697849af02446b23ed0857a0295 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -19,7 +19,7 @@
  * @core_clk_rate: core clock rate request
  */
 struct dpu_core_perf_params {
-	u64 max_per_pipe_ib;
+	u32 max_per_pipe_ib;
 	u64 bw_ctl;
 	u64 core_clk_rate;
 };
@@ -50,7 +50,7 @@ struct dpu_core_perf {
 	struct dpu_core_perf_tune perf_tune;
 	u32 enable_bw_release;
 	u64 fix_core_clk_rate;
-	u64 fix_core_ib_vote;
+	u32 fix_core_ib_vote;
 	u64 fix_core_ab_vote;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7191b1a6d41b3a96f956d199398f12b2923e8c82..8a523eb308630943871c2e075d3d0d9094606d05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1487,7 +1487,7 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 	seq_printf(s, "core_clk_rate: %llu\n",
 			dpu_crtc->cur_perf.core_clk_rate);
 	seq_printf(s, "bw_ctl: %llu\n", dpu_crtc->cur_perf.bw_ctl);
-	seq_printf(s, "max_per_pipe_ib: %llu\n",
+	seq_printf(s, "max_per_pipe_ib: %u\n",
 				dpu_crtc->cur_perf.max_per_pipe_ib);
 
 	return 0;

-- 
2.39.5


