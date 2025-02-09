Return-Path: <linux-arm-msm+bounces-47266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B17A2DA7C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 04:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FDD41887D83
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 03:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345D04683;
	Sun,  9 Feb 2025 03:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i2xib3/J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E22117BB6
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 03:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739071295; cv=none; b=eBHvRF3iK9Hzj3vOkBZGr5pCcN3fup3EVUS7Z13LwMqujoYsWHhcPULMzgdFkpS0UO8QvK+aNFu7wWQdJiUF7kVMVxYlcAU2e96AYyvAq18K26Naj0c/N/qr9vMX641xh89+DAvBQ8yRuXhRd2PBMy8qA8+punbJw7TkB0eDeaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739071295; c=relaxed/simple;
	bh=X6tV8r+a8XfU3v4vYgDgLRiuGjq6pfQHwg0IaxuHjX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IasoN5M3EprL6J/LBq4apF34/4oT6HKtlhJsrrENAq5872sfOuu/gJlzk2rw68ALpxQQvjgezoOBUtnQy8rBm56GlPsc18WTe3Q/40R3CwTdsHdRvdGCcCbw9LU3bxeJyOki3+5PO3y4sDlhp8C37Smg6JdjM6aGRyf0Wa1TY0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i2xib3/J; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5440d5b30a8so3935846e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 19:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739071291; x=1739676091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4UlSnEikNx7abvy/6VbAdoXI8N3J7sKCjOK+VfTtyw=;
        b=i2xib3/Jb+X0z9Yr5XAuCHm+vogX7X3g8tJmYjDPK+u/p4Foh9oyOc8nXVfh5gs3ei
         kP9d4bOU/8JwuJ/Ua0jhaIVDpk4qe1luPdThNRDgCFaO0ue7WQuJ+2hmy52HMW6Sor1l
         HGLlFHYOS+JaF7nX3V7pWBAw01qSh6NH33AjuuclxJxW6gMmG7jBM/S5CpnqrpR/UC+z
         EILHKr0Z4lvrWKu0nSQ+f+dxISuECrSOMIZ3WC/7H1rJkccVngropVBTpCBhMJcVqvg6
         uMnI3BjPHyZvU97fc0NT+cDrJoMwUkcip7RBZ0pYst/jaPYVP7L1o3WOm5pSCzM79gWb
         lP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739071291; x=1739676091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4UlSnEikNx7abvy/6VbAdoXI8N3J7sKCjOK+VfTtyw=;
        b=oy2tbON61gd/tJMeMoL+w9tFfdvBjiELttHh6MAFeM1Du3W0Ze18WkEJ2Xut3U0FWE
         3VBCSNxHV/yYEXVHQi6duGUhuyp9ecNqRZ7+K0Tq4Qb8FFA/MnsA0ezqJbsYXqlpVts/
         ZcAUTm7sO7CZWoNMC6lGg77SDEmk4JSF2eN/B4Xfr63gW9XZOnUyxOGwP0VWSSukNxAT
         aeV5IMYssqV4hZls4k/NsRgfgyiR5iXLj5yJsf2Mrjq/ydfbYnhU7Z3dmLHqbnReja6J
         fd5HYzcpDacCfHDJ5sk7uTIwcGkQErf3lp97r9eE2rR88itwARkT5k0PJFCeaC9UO0+E
         OPzw==
X-Gm-Message-State: AOJu0YyZ//8meeQCAdd5fqm3Gg8EV3gym25LwNiR6QSoMcLANLdsTsFX
	wyi7CDc2RwvpfY/R87RhXwHXlO6gYW1/DOsdkKaF/jvp+hxpnKxYCA2hn6bIEcE=
X-Gm-Gg: ASbGncvSiQBkFvloyTfFftZSMQT52B5R4P48dVmovbAWq8V8D9z7LjCD5DfeWKvQHPy
	nC/WTHU94L4L+57HiNxbh82deI0UU1/fV/rNWOQERybAcCzf14RVgeQ3U7pZBO2twdPxREIcbEX
	CYioWP26ffapeket1vru7oyccmlTsa0vjiZsWseOY6LV1jg9iaV2nEOuZVk/b6JTeuyAwZ4pB8N
	hvPVfPZzyxut9BArYv7xDwB3NmbtdKO9LYjhHbCtSjvgnZeDzkVlf54Xg3wmqCRwSJS1v0Amitj
	KDTJltY/joWClHnz8nBFkcg=
X-Google-Smtp-Source: AGHT+IEKDarG7rC/R9xtBGIcbxt5IeulVvgGtMHcAmMBT6m3be6rYJT3zF+K9/FgT4Xb7JmkSmruVg==
X-Received: by 2002:a05:6512:3a89:b0:542:23c9:43ad with SMTP id 2adb3069b0e04-54414af5684mr3151937e87.34.1739071291286;
        Sat, 08 Feb 2025 19:21:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 19:21:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:13 +0200
Subject: [PATCH v5 3/8] drm/msm/dpu: change ib values to u32
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-3-87e936cf3004@linaro.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
In-Reply-To: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3509;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=X6tV8r+a8XfU3v4vYgDgLRiuGjq6pfQHwg0IaxuHjX0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8wpB7jgP4Qlri1nPaeJxJlTr70cG59uYiVj
 jaOF3pgSBKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMAAKCRCLPIo+Aiko
 1V/zB/0Rw6yebdjw+ZPWbLHnVkId9fk8H3Og3Oq3ehSuCJVq0uTEa3Vu+K2R2+htujYpJehUt/U
 G6wPeN0rh34IJrokOjGel7n1IWv7DAwp/QRS4JWd/EiBhmmYyvgTD/5PoQTqAkym4JI61b4TfHn
 pyrB5uvdRQtf140/VZFA6ynvI53qKEKyR26Z9PTEsCOvbg1QBKXmJsEo9j6H7wUjO8xDmRGRbYz
 h0HgQ456LEMdhBnVEsdG7kbzUR0VuUuG8SXm8MWVdqHL9wn9r6Q1iHSH7Is8WyqixKBV1pusSlF
 6xZM9ToySvI2DMVcnxFEDU/DZpB1r2kHklVsXHhkF66Ubfgq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The IB values in core_perf calculations (max_per_pipe_ib,
fix_core_ib_vote) are expressed in KBps and are passed to icc_set_bw
without additional division. Change type of those values to u32.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

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
index 451bf8021114d9d4a2dfdbb81ed4150fc559c681..e2ab7b3a8246c11f844d25c64354526ad162e15c 100644
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
@@ -40,7 +40,7 @@ struct dpu_core_perf_tune {
  * @perf_tune: debug control for performance tuning
  * @enable_bw_release: debug control for bandwidth release
  * @fix_core_clk_rate: fixed core clock request in Hz used in mode 2
- * @fix_core_ib_vote: fixed core ib vote in bps used in mode 2
+ * @fix_core_ib_vote: fixed core ib vote in KBps used in mode 2
  * @fix_core_ab_vote: fixed core ab vote in bps used in mode 2
  */
 struct dpu_core_perf {
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


