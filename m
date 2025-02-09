Return-Path: <linux-arm-msm+bounces-47264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA6CA2DA7E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 04:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5C1A165C3B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 03:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8062D243365;
	Sun,  9 Feb 2025 03:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rFqf6RhJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B536FB0
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 03:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739071290; cv=none; b=Y9VUyMzSmCK8H4gjXfWD02AUhgi5CnaEoDBRQydpI44BPfyvhaLlhRbqbCnHTRi5s4q/518DbctNnMvhLq+QjTBifrufmE82iMcUdrfvv+uVKrjC5Vti7EorLhozDtfWqqe+rcqvWjc6e2weQsv/tm+ZJcGOWmIyqpI5p1ab14U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739071290; c=relaxed/simple;
	bh=Ranvcf9s/bstJI3Eo8F/WLE+D4NDgHgD/Z08d8sAtcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gK/uSeRG7vAsyAuzLHnv9/pTVwm+TgPsPTpi4+KAQS+/VsNffGH5fCkrNLikTkCpRVVRdpsUXF2VWydtyPh/9ABXCWYo0oTKQSxOT9iiUPxvnAQzTRVuH+omelFq+nDARsCghrsDBzqAPYDeuz7nHc172tZyQ8rdb1YvvUKTCdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rFqf6RhJ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54504bf07cdso1037210e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 19:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739071286; x=1739676086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swDuQmaW1jB5oxxfqZCzBvZatK3qx5WhH7+L/hnGQig=;
        b=rFqf6RhJ72hTvjBavjesQaMcxxW8+Hs5m9Sn0Ft63XHNre7GzsbuOvKg9+G6X99muv
         msP9u5V5vRU8YN2Ps6dUKlKZ23QwAVTxbwyQxZUc+wYndb2qOxJd1aViM1WSutDWBzS5
         cemVfJgLRHKOTKLISoLgs4y4Tj4BensP7OBVMsAAVN9H0GFzuknzPKwo7UzCdrr56o9e
         ecCv9bgIcGIODo738hMwa98ctpFLJpvXlktc7mvLIwQYghcPGz0tiCu6mDqFGyvGlwVJ
         kXiom8dvqCgo8R3H22qExpOalbuapfwDT5tVd8bQrCrAbj5Zc/RA3C9wgmtO/eIzyiQ0
         I9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739071286; x=1739676086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swDuQmaW1jB5oxxfqZCzBvZatK3qx5WhH7+L/hnGQig=;
        b=RJ/atvAFajsTSz4PbWC5aZ7nF5N15RV7J1YWlW79SRSYs8UWOOyxoVkMBnj4buQDHI
         b1SAmAkeYbIs87cDdSAKOhdXcpvAts6VXJev7lDcUgyeeiUyV/oCOTvWS77HSzv5ED8o
         EDmxv+RAYiffO2TAB4YCEPPKhMkdM5Dmg1Elq5JSE74gkMG6RM4Clwzhn2NQOABnuUlF
         3iuIzx0UhdXor637Trv5nOVwlJHivDfPts7GNQz5kjVeUmff/mXYMkxOiWPIMygjhimh
         pjyNCDT/YRh3yn5yF4ryZr9S04K5ytfrbBU7X49XqP815oroi3v/esbeGAcD2xDJfefD
         cg7w==
X-Gm-Message-State: AOJu0YzxMHD8PiNNGaoQounlw3+avvPIXFAUWGSSFVcWi34axX0/9Icd
	4VZIXCf3uQw9ps42kpm78LM2eLosHl/Rcqa9IYXsN7c7kzhej7gYhdDJ/tRvVws=
X-Gm-Gg: ASbGncuhBKdHxlfTGs/G5eNEwSgMTXjoKG5030Pf07s3o1LIqe9VT49/U7KNJDdyGu6
	8k7L1w56XOrfeBx/x9BZXPi4WHYqXTOW9oda63LBhV2gZVKk9UZGA/7sE5M8IxV/X85jD6LfP7I
	l+u17okfts+tsr63EJ7NIInzaxkNoJqvxGYAy79ygB0LoBPCmlpTNTStzDJkIShl6JM7I3uJ1oz
	3RZ9SBK4b/kU2ikzic1LvScngzwVvhrVlQ1EU6yBcALyFzEGwQWJQdU+kB9MHbTgn8peqJ0povp
	ukVMXo9iAj+zkFFJij6MhtA=
X-Google-Smtp-Source: AGHT+IEjRl6W1kkjIAvlsg/6xHePAIbF/2a1GsmuWlMBWrsnf6cxOnhxUOdZt9MG6G4TVb63ZwXACg==
X-Received: by 2002:a05:6512:114d:b0:545:6cf:6f41 with SMTP id 2adb3069b0e04-54506cf6ff1mr1016294e87.48.1739071286529;
        Sat, 08 Feb 2025 19:21:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 19:21:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:11 +0200
Subject: [PATCH v5 1/8] drm/msm/dpu: extract bandwidth aggregation function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-1-87e936cf3004@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2664;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ranvcf9s/bstJI3Eo8F/WLE+D4NDgHgD/Z08d8sAtcc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8wBCZCkujv3nx4cUz2YO03kQVt3IqDaJosn
 DsM5L+5bh2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMAAKCRCLPIo+Aiko
 1TgIB/9e/AqCXwvYgzwRGiWpiwOhogNSKGNm5+WPJ8kK5U2o1VViOp1np3wH5gCkCwLWB3OZK/E
 R02fkAGqsc1IiGZRIk1Qqd8vHXZmPk2cDgWnCdwXb68C+MazLuGfC/neHjUP8uPPP+kF+viliD/
 L9ONUJ+l6bGwURpxisFX+3MvBdKzG8SQNVUNv1WyV4l5zYqfdMXOtNwD38XY9Sd8a+Bly+eRmOO
 Ky9IOJOmTEh/Q2Yum3LzryjIYS3hKyfMKrYG/ahTrCT0MWtAs/Pjff1LSfCuIuotap0U+/IhuRT
 R0oRsCQDePexJcPYqZnJ4iamcet0y5LmxQOQGzaXuDeqElT1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In preparation to refactoring the dpu_core_perf debugfs interface,
extract the bandwidth aggregation function from
_dpu_core_perf_crtc_update_bus().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 45 +++++++++++++++------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 6f0a37f954fe8797a4e3a34e7876a93d5e477642..c7ac1140e79dbf48566a89fa4d70f6bec69d1d81 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -210,36 +210,41 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	return 0;
 }
 
-static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
-		struct drm_crtc *crtc)
+static void dpu_core_perf_aggregate(struct drm_device *ddev,
+				    enum dpu_crtc_client_type curr_client_type,
+				    struct dpu_core_perf_params *perf)
 {
-	struct dpu_core_perf_params perf = { 0 };
-	enum dpu_crtc_client_type curr_client_type
-					= dpu_crtc_get_client_type(crtc);
-	struct drm_crtc *tmp_crtc;
 	struct dpu_crtc_state *dpu_cstate;
-	int i, ret = 0;
-	u64 avg_bw;
-
-	if (!kms->num_paths)
-		return 0;
+	struct drm_crtc *tmp_crtc;
 
-	drm_for_each_crtc(tmp_crtc, crtc->dev) {
+	drm_for_each_crtc(tmp_crtc, ddev) {
 		if (tmp_crtc->enabled &&
-			curr_client_type ==
-				dpu_crtc_get_client_type(tmp_crtc)) {
+		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
 			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
 
-			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
-					dpu_cstate->new_perf.max_per_pipe_ib);
+			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
+						    dpu_cstate->new_perf.max_per_pipe_ib);
 
-			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
+			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
 
-			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
-				  tmp_crtc->base.id,
-				  dpu_cstate->new_perf.bw_ctl, kms->num_paths);
+			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
+					 tmp_crtc->base.id,
+					 dpu_cstate->new_perf.bw_ctl);
 		}
 	}
+}
+
+static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
+					  struct drm_crtc *crtc)
+{
+	struct dpu_core_perf_params perf = { 0 };
+	int i, ret = 0;
+	u64 avg_bw;
+
+	if (!kms->num_paths)
+		return 0;
+
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
 	avg_bw = perf.bw_ctl;
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/

-- 
2.39.5


