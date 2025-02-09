Return-Path: <linux-arm-msm+bounces-47271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE64FA2DA83
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 04:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1DCB165C17
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 03:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5B4243365;
	Sun,  9 Feb 2025 03:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nC3+I/MN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F298467
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 03:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739071306; cv=none; b=snk1+eYmx+/nBbYt01OyCpQNwGWeIDyeQcB5L3WM/Tlz1/0TLnUsr52WZrWGHqZXQ+eQNa7JT4claxs10VSReOWbOzlM8/d55GKaW8J8SrLQpU2T4jn5eVEGDsoIb1uqs3zY11xXTwRf8+RALmpDu4fX1iMSNtmvnoDPMLLe030=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739071306; c=relaxed/simple;
	bh=EjVnzSvwGeLB3HXokJpPau5v3ni0TOZS9ZUms7htZ/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lHhEwQZpeSw6SeaOFAawhhuyhzk+d7N2f3qTKT88hpy426g21L4s+4cSr4s0PUmCIvh6LcOuJSUu8dX09NOrKHY54lv5sUP6ZuXG/6w2fTZ1ArQMD0TaZR/pLTYFVUtma/E1rYf2rIr5xB+tw4qOEO6l6LUfYSDKUTgbnZOOFFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nC3+I/MN; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54412a7d75cso2942821e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 19:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739071303; x=1739676103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oi1Az+d17IMWsJWKpM/Z7vG/JaxyEjq4HPEfn1poENE=;
        b=nC3+I/MNfAV3uu58KbbzEafSE5B0NmC8ipbcbsWCol6LHbb50vT8a9SetOblrG1Q5f
         WmjroOxXjsY1y1xaOm0D26nWWHnEHTTtaZwgmS8NX2uI7XirbyQvVaNLB1SDuMPw9OjJ
         tHY2+TuwdJautEL/uJr7DVRPcZrQrGV+yVXXShQWADz1nzW7bW2YPhcFrbopEmZ5Idun
         tkpJEd1AIiQfcyg6fh5xEw5mw83ZBfEVuh8EbS6OCsTFWiJVlkO5BKPgOR8rh8dxPwhp
         pLUWM4g6PTip+MuF5VbEDcYPEjpwi9d1o5AL0hBGicQ+o6auQSJf+BLjOj1sFcAa6z9t
         hisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739071303; x=1739676103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oi1Az+d17IMWsJWKpM/Z7vG/JaxyEjq4HPEfn1poENE=;
        b=BWomxmRQsL7dcgXihakDghm4UNZW+bCLewwoR+ShuxOdrc+s/hqVnsLtqkgmz4+VjS
         TNkWfH4Za6ROQ1dzIA3THvSi4B8EQ6mb1JjvTlvJj8PRa+fDYbPJixYR/toCMwNXwhcN
         OlR5jtzIizspEsV21gaJ9TU+2JD5OH9tqyZxCURQAzKHJDp9DT6s1hbDUu8K0SnEHgeV
         UEy5gK0i56xxMpj71hdS3ngq/Q0U/fvS21LT61+HnzCmvnb4lbHb3cpTY/fSjX/5fHn2
         Rl2H/3Wx1IBZ969ouDiKZZyuPS5W7b8CB5OrKd3H9dPi8J3BvW+isM6Dpm3mXF990LdI
         WXrQ==
X-Gm-Message-State: AOJu0YzCTwsw7hFKVaq2EyxPLmCoH0TKX7piFythjCOTmHWWIPDGpAXS
	dAONelS7AzMidJfoaQbzUlHBgXzZPoaOhrvPXgTFMixbaE7vjSlxFyHZ05HTAKA=
X-Gm-Gg: ASbGncsv3ROmBe2yMaJp4Ay0wmUf39n4Ii9gOcXv+4cPnUmQJORk6lh7BeGUHW75Rkd
	xq73UuhOCyupwKQ3pBTiufZpf1sX+zQcpvNCo6wpJ6TyNaljRrTm6OfMjXz+4cISULb9W+WA+1s
	0MXmwVJJqhY7bKz1t+BCO1btCqDJBjB4zORJtjJ2R3AhMSx7B5crjudaVs2sljIdePE2IMdfTvE
	yEs1KaKGNWheyPpLAE8BZ+UVOq91D/6QS+w4PVq+PqXPgtdyGlDQNzRtZL2krvIrqL4Fv4rSSWn
	R1xmRh3pLwSV5DoeMMq5YCE=
X-Google-Smtp-Source: AGHT+IFEZWwhATFiIjC/mq/2iOVr1pCkgPVkoAotYXpYl7oqtRxrDKn/6LcJLuTgNAVp6QR7gFdePQ==
X-Received: by 2002:a05:6512:2355:b0:540:2022:e3c6 with SMTP id 2adb3069b0e04-54414ae134cmr2990351e87.35.1739071303093;
        Sat, 08 Feb 2025 19:21:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 19:21:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:18 +0200
Subject: [PATCH v5 8/8] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-8-87e936cf3004@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3426;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EjVnzSvwGeLB3HXokJpPau5v3ni0TOZS9ZUms7htZ/E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8x64F2cJNeOu1Uli/yCTGic6MsHG4iZAHU0
 xuYkcG1bUyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMQAKCRCLPIo+Aiko
 1dRQB/9KevaeocmmMuzIO8TfX0MVz2QgpEIEX19HB0AkRYNpfMcBZFYbPMOEOjm7UT+GjkTHz5Q
 oQQ/7zMIqsyW/6ObGU75R3mPz9vZ8iV9oa/yZ8lv1c3/VSqliYLdwO+gebs92S3DS6ZxGmgTG8c
 a1I83mr92Vh1pxUJDygWzDiflhiVd0KxhTWIjXiyb4Iflz8RET3n+qv8scrqFNe+7RYOx8cIeF2
 cljFJWxAmaIDHdQvvcK/rWlaBdTahxLsET4m7fYFBv0ZM+nptASfNzpI8wRg5aQWf+yUwIQ39si
 dwX5THa0LLAZkrWtLqS8NVfCSd8hKtLkWrV59iILpHtN8zCk
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move perf mode handling for the bandwidth to
_dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
and then aggregating known values.

Note, this changes the fix_core_ab_vote. Previously it would be
multiplied per the CRTC number, now it will be used directly for
interconnect voting. This better reflects user requirements in the case
of different resolutions being set on different CRTCs: instead of using
the same bandwidth for each CRTC (which is incorrect) user can now
calculate overall bandwidth required by all outputs and use that value.

Note #2: this also disables threshold checks for user-entered bandwidth
values. First of all, it doesn't make sense to fail atomic commits
because of the debugfs input. Compositors have no way to correlate
failing commits with debugfs settings. Second, it makes sense to allow
users to go beyond these values and check whether this makes any
difference or fixes the issue.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 36 +++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index c8e20be08aa83c8bdd70065643b46676eeed610f..7ff3405c6867556a8dc776783b91f1da6c86ef3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -118,20 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 		return;
 	}
 
-	memset(perf, 0, sizeof(struct dpu_core_perf_params));
-
-	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
-		perf->bw_ctl = 0;
-		perf->max_per_pipe_ib = 0;
-	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
-		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
-	} else {
-		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
-		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
-	}
+	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
+	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
 	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
-
 	DRM_DEBUG_ATOMIC(
 		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
 			crtc->base.id, perf->core_clk_rate,
@@ -220,18 +209,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
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
2.39.5


