Return-Path: <linux-arm-msm+bounces-47268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DB4A2DA84
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 04:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B071A1887D0D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 03:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A524683;
	Sun,  9 Feb 2025 03:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wlyw98Lv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E6F6FB0
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 03:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739071299; cv=none; b=OfVSE9M5av1y0fjyAYFZlILSAd5bqn9MhDXzV+GxSCXTSTOmo7xrmZoLVEDwR09WozExXoEtUN7R5NjaNXZoIi4xU2BIhPPHvjOfdT+q7wkyPNYz21rDOsMxZpzArS9LLjYlZ8lY1t3YNoVVRpGddxAdaAmf8Evt9qrNmtJhYz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739071299; c=relaxed/simple;
	bh=lJN1ZWQbA0MEI3JAi+kHjKIQi/CZ9+YkFP59ireKkPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W2WJeAMuthEBG15CU+h3XIkErnI9BAU+60SdKCcbRlwvZ3Kr+vHGoeyIQ3y3NHN7StGAdeh93TXiUpQQpuVe8NFKG6PGCdv+94b4rffSwX+VDgE3q288GbIePk6+cR2/6pPGJ6QpiwwP9EHv1LLZgsgUJRkkbMKPX7gm92Rz8cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wlyw98Lv; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-544ff74be6eso1315658e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 19:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739071296; x=1739676096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8PD0IqrAGE2oYpbwGvaPQf/cJok7PeI2X9zpMbZbMA=;
        b=Wlyw98LvaRvjaFpdb67KSbgUIysz2jNEHT/uRWlmgp/Yzhp2OZRvmGJK+8qMT/MnlB
         r7Qk58yACin8i3lhDh7kMVVNRFTMAcypJ/exZlVbuavwWYIeqqSZwHE2fDjCvle7+yyO
         TJP2+5Faquo3gtGNTNvpBs6CLFBacBwumgOez4OdhLCwQL/TDaenXbp9V8DXIuvCcAVO
         TT1kHiwUHyYOcWfa/DduivA9kI1Ona+rF3JNziEFM4LdbokAxEuAquOY/BEf5yUdY0I8
         Y1B1XCE3W+TbBydEWj/mkjztly2sDWCuqMJysOQEhtvVyhh9Qdij0s9xph8Z9taOq4JP
         sOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739071296; x=1739676096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8PD0IqrAGE2oYpbwGvaPQf/cJok7PeI2X9zpMbZbMA=;
        b=oNXEtYC2swArLtUcI20nYpY1DfkN1v0eSqOsfS+V2RufkurOypVUD8mQfpU6XhdYD5
         Kvz05x4tbKkFSiPPDGrmyDlrF62zEKJsiIZGSCVxl/DvnJ+DlAQhMPNoq66BJkJasZve
         vHhWCTxsGHKcF+3NVIw2Hk7zRP9WI5yodbNIG/bnOjTic2EXikS5m5+6vVh2f9Vv+j/u
         NZ1jPX7KlC+F7UKoUyg8qgz8vc2xqgAeUj56ixdF6d3GS3l2AjuZcBqlBw6IsDqWz3YO
         qFfMr9aSAlcRJ/VruIB8qscKLBXjUyGn19Xqe9v/me+RnVY2TiOadgsfOEbkHZmIiqlk
         VKCg==
X-Gm-Message-State: AOJu0YzgEdZANcLwCCxb8K9InJra2UN7n0tfI/p2E5AA1b0EKf8N/G+c
	dwgKqq+cLbGS9uD+KXBM1JWJFaGEZSvNMHh1RS+ZU1NmILCzjMRqpnlqkXBounI=
X-Gm-Gg: ASbGncvLjz4NCjMgLXKzfx1ucgBKFSzcHAdvFdE/zSErxkivDDVRbYF6JcxC6qoWP8Y
	r+DnA8Sw1w8K8BL7M3Maf3UHrzRocjvaApzwEwlFkiN92zoLpPjDjCl/rLnYDeIEHaKrZvIAC3Q
	h1k4mNj4YsWmBdLA6zTSakHGopnxVK7D2SXM3OXQBCskd+UawbMt2oceZlqGB37JJ4yuc8a5z5C
	c/IANEPQo/HoaoBM2w/c/Wr8muJEQJOt4iA3dOj9VfWfd8I+91UbxBIeizjaQeyfMPm/v5XGKlA
	UCW36qmJujwk4ckeE+6/HlU=
X-Google-Smtp-Source: AGHT+IFaywdtzcVxRpRasataZ5TzvhFAkmqRc+3xEcB2W31nSu5sSrJNfgtxxqaJuGVD/E/Q+1m4ow==
X-Received: by 2002:a05:6512:3052:b0:544:f93:6902 with SMTP id 2adb3069b0e04-54414a9d22bmr3196055e87.22.1739071296027;
        Sat, 08 Feb 2025 19:21:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 19:21:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:15 +0200
Subject: [PATCH v5 5/8] drm/msm/dpu: also use KBps for bw_ctl output
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-5-87e936cf3004@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lJN1ZWQbA0MEI3JAi+kHjKIQi/CZ9+YkFP59ireKkPs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8xogycCD/CtLU5spQjunXyA2yQ228CTHlDh
 9fHZ7ZOPxmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMQAKCRCLPIo+Aiko
 1QxfB/0edAg30o+RX8k53oWUGA7So0JNIGqiaOvFrKH3V4FKGNAb44E9W6t2RrnxRzsp4OIVQ1c
 VFkOH3/zQfLpaxlogiPh4CQptNkc+qe03nJj8/XhaRqVHLZL+gaykXWjSelVoVBGebF25gJJWf4
 mYVMuK7pGwHQ54T14CBozrhewL8Z0lSYhfDoFMwHeHiRMJPD4pLMTdy/yhn12fyd44N8wcMUV1b
 PUpA4OjMEs3ZOYFq8GQvsCyOSNAAa6+V4GO8BFAmZAIHVgFLxBa22ON/U7T8uwIOUPEmg9N5aQo
 65VEsbMCS2nHkfdz7UZqmUp+HeuNbwuo16nkKCSkmVY7oLjJ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Change debugfs and log entries to use KBps / u32 for bw_ctl and similar
data.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 5 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 7cabc8f26908cfd2dbbffebd7c70fc37d9159733..b93f7556f187d46b325a689ad01ec177cecbc37a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -135,9 +135,10 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 	}
 
 	DRM_DEBUG_ATOMIC(
-		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%llu\n",
+		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
 			crtc->base.id, perf->core_clk_rate,
-			perf->max_per_pipe_ib, perf->bw_ctl);
+			perf->max_per_pipe_ib,
+			(u32)DIV_ROUND_UP_ULL(perf->bw_ctl, 1000));
 }
 
 static void dpu_core_perf_aggregate(struct drm_device *ddev,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 8a523eb308630943871c2e075d3d0d9094606d05..ac3c6c5ad1cec3856f0eff2ed71153d3c2dc279e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1486,7 +1486,8 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 	seq_printf(s, "intf_mode: %d\n", dpu_crtc_get_intf_mode(crtc));
 	seq_printf(s, "core_clk_rate: %llu\n",
 			dpu_crtc->cur_perf.core_clk_rate);
-	seq_printf(s, "bw_ctl: %llu\n", dpu_crtc->cur_perf.bw_ctl);
+	seq_printf(s, "bw_ctl: %uk\n",
+		   (u32)DIV_ROUND_UP_ULL(dpu_crtc->cur_perf.bw_ctl, 1000));
 	seq_printf(s, "max_per_pipe_ib: %u\n",
 				dpu_crtc->cur_perf.max_per_pipe_ib);
 

-- 
2.39.5


