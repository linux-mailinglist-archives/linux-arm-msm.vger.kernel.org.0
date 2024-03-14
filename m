Return-Path: <linux-arm-msm+bounces-14072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC79887B610
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 02:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D173B23BDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89A24683;
	Thu, 14 Mar 2024 01:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fcs8yGXj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAFA4A15
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 01:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710378653; cv=none; b=FAt85e3MAYOz4e3wNI7zeAaYSpAI0HhIN61xxqB9hIAKuXH7Nt7VqNBDRo3eUPh8eYoVj3aRNd0ZhEXQBLGWAozpGCPR/wtdRZDtdC9ZiTOpc/YpfBucCtPdUaVURsuv+9wemn9FDHPHhDejE6MPB5++klUzmbWRSaPfFgP0rEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710378653; c=relaxed/simple;
	bh=HtjO3+r4eD0Q2obHhXvuyUuLiZ1mp8ct03mOrvFNMx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=khzVbIw3EYabOLIyNYVW/OGfqYUsvqSOJkEkO7VaC6oa18fMf//GutFgcl95LjMX7zFbqUIgpjNqvYCajuc0JI8HFFywgMFXCUvIUnfcq3opOJUI5Ql+DCPUpVEsu1dzYCXjcaoYJBDmbJS/MbfQleuAa4VRiR+1wmAe79C14yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fcs8yGXj; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d46dd8b0b8so4286651fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 18:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710378650; x=1710983450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkT0b7xRMHVuIJC0eNZGFO5wcpvp57gRfpmlCIxi9Y4=;
        b=Fcs8yGXjKU0d3dY0rUQk6QigazY0c97p22WA9ToFwILFu2zx/UM+IhWSUrBVs6f8Yy
         JaDvW63Fxty26muqPfr7SsrzyG9dZTFRc8cTo0SyMo6MGlKc+36T+JVtSnRw5orcAHud
         zuf3Or3XxkERpQ3Y5pWDb8NwraPOGrj9LEfKCICUYegYiZnCKw+I4blJeeM6ScFz/UxN
         nRqSa416Q1MO2O8aQl09FmwHPWzZ9cT9EJxXAj2bcEk5JLShieNUDUjdrx5pmResd2dk
         1iETBOvfcFe3kqMILn5qJvhtbN/Vm71rlB024pB4xSnKC3rjsMqLylzy6psPjynQFC0D
         r7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710378650; x=1710983450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkT0b7xRMHVuIJC0eNZGFO5wcpvp57gRfpmlCIxi9Y4=;
        b=UCSz7gUyc7cExbYMOqntctMDUyqskxJpjDkr69r2I1zrqlANak86ea6DJJGFETeZD9
         28jQPSuwnBmw6+tNbqaJS3hrEmJ6ced8LA6tIieGj3ppbf4QDf8sgXM2/HgrAOBzG24g
         UkXU85hCWT9r+TnD1lo8ZcnbBPcg4JJ8euFcgCt7qgAYyepMP8rnLMQB0ejsL70BWTif
         JXOcvqiqllWJGtHEMBdhY//jihRGYkgnsw4NBOY2uQtDW05qZGnbmsKn2Mb/NrRgZoUx
         ljQr0l4qet0fJVTiNn5jj8A1Lf4ur7GdIKXQ3BuLytoiYQtp5vbklE6HfQ3GpVLuuqJj
         mOgA==
X-Gm-Message-State: AOJu0YzlvDlsxWChzeXydCa/UooOatVul3bx9cF7XkPwvyPb9tzJ9WC3
	rFu0WtaUB0MGoXUGAfE/DFR7bmekYtK74VzNS2Tx+X/j/bFa7G5k72xdivmSgDk=
X-Google-Smtp-Source: AGHT+IHbftlvUJD0VKntserQOB+EnscF+o7ttbHZCzElms73MiWTPm5j4W35pZLrGaf/0ry1Bv4xvg==
X-Received: by 2002:a2e:8187:0:b0:2d4:5d56:e559 with SMTP id e7-20020a2e8187000000b002d45d56e559mr94218ljg.47.1710378649994;
        Wed, 13 Mar 2024 18:10:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u19-20020a2e91d3000000b002d2ab6ae675sm48917ljg.137.2024.03.13.18.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 18:10:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 03:10:45 +0200
Subject: [PATCH v3 5/5] drm/msm/dpu: drop
 dpu_core_perf_params::max_per_pipe_ib
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-dpu-perf-rework-v3-5-79fa4e065574@linaro.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
In-Reply-To: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4144;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HtjO3+r4eD0Q2obHhXvuyUuLiZ1mp8ct03mOrvFNMx0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8k6TPD8BbtAUQpZUbTD3Z/1YlsRo8D0pPIlbn
 OullnlyTpWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfJOkwAKCRCLPIo+Aiko
 1QZcB/9VgPlKys7jt/lpRgWB5rrxlnQ5HZMGHoClHsG0Q1rsFCxp6+pdLWyZvuagrhUp+fNXGDL
 t+193uvDqf2swJeUWWBNdChGRgEZHPnXMHmodThOTq9cYfTFogx8HBwzXVSTIunAAGogNTWBhTB
 VGULPe71s6UNu32IPcbHfYX5AVU3Ny1N2P6YihRpH9RGxf+gk+i4hVe5srVVOPhmG+WbCxbdgEI
 9qT4bWQlzaf4JoM2oPmSxybHJ2F90gf84yzck6z+uKXxhQeKl3yz+mfLrj7U33AB3c4eMbhYAxv
 bPVGgskCjTDZdS//uQIldaPIkypgpyVcadUblq27F38w3s8w
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The max_per_pipe_ib is a constant across all CRTCs and is read from the
catalog. Drop corresponding calculations and read the value directly at
icc_set_bw() time.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 17 +++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 --
 3 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 2e78e57665fc..2fc05665dc7a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -105,13 +105,12 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 	}
 
 	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
-	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
 	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 
 	DRM_DEBUG_ATOMIC(
-		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
+		"crtc=%d clk_rate=%llu core_ab=%llu\n",
 			crtc->base.id, perf->core_clk_rate,
-			perf->max_per_pipe_ib, perf->bw_ctl);
+			perf->bw_ctl);
 }
 
 int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
@@ -190,9 +189,6 @@ static void dpu_core_perf_aggregate(struct drm_device *ddev,
 		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
 			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
 
-			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
-						    dpu_cstate->new_perf.max_per_pipe_ib);
-
 			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
 
 			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
@@ -216,7 +212,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
 	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
-	peak_bw = perf.max_per_pipe_ib;
+	peak_bw = kms->catalog->perf->min_dram_ib;
 
 	if (kms->perf.fix_core_ab_vote)
 		avg_bw = kms->perf.fix_core_ab_vote;
@@ -321,15 +317,12 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 		 * 2. new bandwidth vote - "ab or ib vote" is lower
 		 *    than current vote at end of commit or stop.
 		 */
-		if ((params_changed && ((new->bw_ctl > old->bw_ctl) ||
-			(new->max_per_pipe_ib > old->max_per_pipe_ib)))	||
-			(!params_changed && ((new->bw_ctl < old->bw_ctl) ||
-			(new->max_per_pipe_ib < old->max_per_pipe_ib)))) {
+		if ((params_changed && new->bw_ctl > old->bw_ctl) ||
+		    (!params_changed && new->bw_ctl < old->bw_ctl)) {
 			DRM_DEBUG_ATOMIC("crtc=%d p=%d new_bw=%llu,old_bw=%llu\n",
 				crtc->base.id, params_changed,
 				new->bw_ctl, old->bw_ctl);
 			old->bw_ctl = new->bw_ctl;
-			old->max_per_pipe_ib = new->max_per_pipe_ib;
 			update_bus = true;
 		}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 5a3d18ca9555..a5a9c3389718 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -14,12 +14,10 @@
 
 /**
  * struct dpu_core_perf_params - definition of performance parameters
- * @max_per_pipe_ib: maximum instantaneous bandwidth request
  * @bw_ctl: arbitrated bandwidth request
  * @core_clk_rate: core clock rate request
  */
 struct dpu_core_perf_params {
-	u64 max_per_pipe_ib;
 	u64 bw_ctl;
 	u64 core_clk_rate;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 88c2e51ab166..771c04c1a5ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1389,8 +1389,6 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 	seq_printf(s, "core_clk_rate: %llu\n",
 			dpu_crtc->cur_perf.core_clk_rate);
 	seq_printf(s, "bw_ctl: %llu\n", dpu_crtc->cur_perf.bw_ctl);
-	seq_printf(s, "max_per_pipe_ib: %llu\n",
-				dpu_crtc->cur_perf.max_per_pipe_ib);
 
 	return 0;
 }

-- 
2.39.2


