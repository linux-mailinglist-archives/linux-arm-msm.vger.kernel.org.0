Return-Path: <linux-arm-msm+bounces-14070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E7187B609
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 02:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36D041C21092
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBB44A08;
	Thu, 14 Mar 2024 01:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ixYmp7Bj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FBB2F43
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 01:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710378651; cv=none; b=UWS/sIp0SVPihN2VbGqxdnaNuinVcIc6Hgm2YmF14AGH+7Nx+NrRUciJ2sQKAvlRrc5PWC7cXT1I4sBwB8h2ayO7SE6xGvTFoZSy8G6G9Z8l4tgYkFst88Zv/PKx8ukjQo9ZHZfXM89XoyZyHJl0UoliCYxw8/hhCU/fn19chBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710378651; c=relaxed/simple;
	bh=thk7wK1FydPIdoBcFyLFgX//qapGQtCBVVmk3tJhOWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a1F3rE064o4d3RMMqtot8wUxLyvOCB2LLg1+GPkdAz7EoUsXcfeLM+XhjfO99gUIUYX3JfODRaZS4USkOtQabDcV1EssqIv0ZIQ3hIsG5ACYmdAKiPzCgg2AMsJKvuYPBWqUmLwqvRBlJf9megIYR5aTMt0r1lQR9i/HN+V/PZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ixYmp7Bj; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d4360ab3daso4772091fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 18:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710378648; x=1710983448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+mg/QgGY9aZHLSlX/LvtBL3FjmiyE45LaEWnMCzc0I=;
        b=ixYmp7BjJidtXgtLvyYHnSnt1/t3o2K7S4c3Daf3N7qJXMnHzqCdVk9e8I1t84sCB7
         2K38nUEyz7ncZ5OhxedpqZ42QYhjc7/gqqVq/36vYcabJKr+ytKTM/LevUYAc39tHuMm
         ligcdFe0Op31uz+re89Mn3O2hXHDhuOFFB3VMVXAY84oLl8hTOrmhQpfqM4K/ETqsY1n
         MYPivoiahVQ8Fv+75ea3Kfua3F1OPhsazF35i1CaDF7/w+7xWxbK1IlKtj1IMw1IRpXX
         XGubSe4+tJTC20he8lPTY4TOXTqs6PogRmLTGrVd8yKtiHw74hAgN1fCjwDKHo9XQ6Qp
         8UEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710378648; x=1710983448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+mg/QgGY9aZHLSlX/LvtBL3FjmiyE45LaEWnMCzc0I=;
        b=tS697Yti8y1xxiWb2qTvXtPJ3TvZo9pyzWxFEn1HZgs4H9yXWXYO1ItGhwaf8ZnFlV
         lwytpOqtYbNXJpyl5Ggo0k/7iS8S8naYP5l4oQMILGEgSkGRZr0mb2y2kWDjVz2luZ13
         jlFnAiejbvt/kPndXmusb0PPm+uKQo1LPPim2aYDmyBl88xzbA5WL0dk/3R1DWIc7zXR
         0vkCNOXug+6iTTIUZGqZY0Y6kNNWzUnwev7opzP9NEARIKhMPWkqTn6VhHd8476pY/vA
         Ei9LWg09G7z/gUGAhmnX5GPxJHcZNY3XG5EpOzAdo6RJiqLOaDaM/MpCKt0FGTXg1SGQ
         EJ1Q==
X-Gm-Message-State: AOJu0YxMCclpHqTAeEKZE4FHujApDPqrg4V4EA8hmwfnBsVjwz0R3ChU
	YaEw9YucDBqD4gnqqNych7j8XW+ixC3aDsCOIqYNWlsWvLpK6w0u/VC8bTwE9uk=
X-Google-Smtp-Source: AGHT+IHBe82yWu81fztcxeSaXu7xVdPyduDpAFU3wzVXa2k2jd69py2qrnLPHlLMY+WKqqnY9ZTvKw==
X-Received: by 2002:a2e:9c07:0:b0:2d2:eeda:c019 with SMTP id s7-20020a2e9c07000000b002d2eedac019mr128385lji.28.1710378647800;
        Wed, 13 Mar 2024 18:10:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u19-20020a2e91d3000000b002d2ab6ae675sm48917ljg.137.2024.03.13.18.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 18:10:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 03:10:43 +0200
Subject: [PATCH v3 3/5] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-dpu-perf-rework-v3-3-79fa4e065574@linaro.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
In-Reply-To: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2836;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=thk7wK1FydPIdoBcFyLFgX//qapGQtCBVVmk3tJhOWI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8k6ScKobsIPOE/hOw550JGULOX1nrrox+Dnov
 CdrJ/Ys+TOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfJOkgAKCRCLPIo+Aiko
 1f8JCACr/qopx9NwwqC7LgXMdW2hItrEVb5W9z3cNXNh3so9MAaCV0oldYq6/rlgHUzwjYaBBzJ
 atC7SM1afc56E5BHWLyj+2NfkXNGVunm7Lr8VxJsAW09ABAZaT10aDEHbTWBA4igCWO21uffIvs
 Iabcf9CzR0a2plZaBiiU53p2/9iXHkrEne4BNykBunLXVdniMnWu6FbEYDOQciWY9RMG+IzMmRC
 6oIq1ThDUdCbqQpgRKLdWB8NULAEunTVu5ZgZ95j71LvTOquQCd7MHmzjN8bqt0vh7S/8P0GBg7
 undfAeSrJClKMOotZjNenQe8QNl5IXy2jtK9z68aHAuxOrPi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move perf mode handling for the bandwidth to
_dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
and then aggregating known values.

Note, this changes the fix_core_ab_vote. Previously it would be
multiplied per the CRTC number, now it will be used directly for
interconnect voting.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 39 +++++++++++++--------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 87b892069526..ff2942a6a678 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -118,21 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 		return;
 	}
 
-	memset(perf, 0, sizeof(struct dpu_core_perf_params));
-
-	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
-		perf->bw_ctl = 0;
-		perf->max_per_pipe_ib = 0;
-		perf->core_clk_rate = 0;
-	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		perf->bw_ctl = core_perf->fix_core_ab_vote;
-		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
-		perf->core_clk_rate = core_perf->fix_core_clk_rate;
-	} else {
-		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
-		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
-		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
-	}
+	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
+	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
+	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 
 	DRM_DEBUG_ATOMIC(
 		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
@@ -233,18 +221,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 {
 	struct dpu_core_perf_params perf = { 0 };
 	int i, ret = 0;
-	u64 avg_bw;
+	u32 avg_bw;
+	u32 peak_bw;
 
 	if (!kms->num_paths)
 		return 0;
 
-	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
+		avg_bw = 0;
+		peak_bw = 0;
+	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
+		avg_bw = kms->perf.fix_core_ab_vote;
+		peak_bw = kms->perf.fix_core_ib_vote;
+	} else {
+		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
+		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
+		peak_bw = perf.max_per_pipe_ib;
+	}
 
-	avg_bw = perf.bw_ctl;
-	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
+	avg_bw /= kms->num_paths;
 
 	for (i = 0; i < kms->num_paths; i++)
-		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
+		icc_set_bw(kms->path[i], avg_bw, peak_bw);
 
 	return ret;
 }

-- 
2.39.2


