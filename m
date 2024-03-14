Return-Path: <linux-arm-msm+bounces-14069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFE987B607
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 02:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C61D11C20E05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A6C4439;
	Thu, 14 Mar 2024 01:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t9AgWM2K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFCCEDE
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 01:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710378650; cv=none; b=ZSkLmnMcpeBL3BhTr27JPMmrJ+jcVgAzYlQL8CawmUPftn60DSDnbX/5IThl8ZmOVoi1O4CGGwyLuH8TP1QvulyUKkQzzaNc4FzK3dc3NqvZdc3Rsi4CpzSzbmVcl6ALeFONni8nW+pxCmd5i2jhfZNJTG8mokdcESuolLodeR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710378650; c=relaxed/simple;
	bh=XB5qQZ6AM1gMdqH09M2m8W3Q7FcCw/TC5ffKreIP0Lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oVZm/UXjKPT3zry8xlKMwdA8etqg2QLtQPVFnbr6K0yYrHfAvqwLmiX7NZHybpuMBLDSncV5KMHWjKjGGcsOWE9FvvbqK8cRFA4TLL4zcFLbL+sm7VmtU1HjvH1In1jtMUcKihymqWeke8a9kEmUlSXIf3YKOhcwEi2rjYUo4B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t9AgWM2K; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d204e102a9so4726261fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 18:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710378647; x=1710983447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H05lkKyWbPVJPRRlJwmLAAiEv2sm+h09AW5BdkwY1QU=;
        b=t9AgWM2Kv8MWLh/HUzn9swDPH+XE0WjCZEegtTwGUq9CkvkqsT15gVRQ5oR27FyqBA
         NIhqioPbRHLgoUPWD/XRcHmOTUMmSz12nZ3cEP/KDVERby/fERtoHB4hVqBdISG688lD
         FvSmxxprnWC/q5gvaLtzUyJnah5/uZzR+OUf9i3X3eJBVQtQJ7sdZpAdXrM6E/dRR42c
         AjLlXs3cJ146foggLuW9vP1csfLXZo0IrKmmiwFBbfNe34Rs1NQI1vyZd6c88Y+CxUhQ
         xk5NGdilYWvusiwd8NUmIZrdau64eInqs4Z0KTtK25ev/ccvwYdGsf2PJJ1oPBRiIJ2j
         r1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710378647; x=1710983447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H05lkKyWbPVJPRRlJwmLAAiEv2sm+h09AW5BdkwY1QU=;
        b=CTpFZHABTdgnUHIB8jd+h93UOjQLxIRKe1r/0LhsL96Cs7P3OxZNN8jZidpsXysGsG
         wEm2fi9NSjWufBujlXu9Dxlx3I1OFDi7esz2FH0y7pVHTMV7M43NJ4mP2wkoZsQ1WGPb
         2nm0YKGKkqK3+w+hwnV/WxBvmgi8p0MK2kKpgJAEEXj+2Rd6L4QyHIv142QRf44ArOLZ
         4dqTTgReT/JcQ24itERb058YPldhuk57jkKFYIy6+t/ZwvkN7Tq3uPmxwacxa920OZQ4
         FTlobU9gPgnNpI5A+95YsdSw4u2g/tZs4jEhL1i3Fqt0E6J270cMwejWEtYXqTDgYuB0
         boTQ==
X-Gm-Message-State: AOJu0YxrokfrnmlOGJeFA7U9+dBp2wGldnrx6kVOdNcJaYjYrWJKgdwk
	FG/QXWuikwWEpxWUy1jX8HKUThF3bFqdU57xOxky/b59x52rSklY58hOuEwgofqZPpfmBsj0V+k
	j
X-Google-Smtp-Source: AGHT+IGW4KP56dB8kSZt72D48OJV+VAsUXapGyd7phHEUjL0KU73SEVc2EAO3GOCJO0b2LhW1PtD8Q==
X-Received: by 2002:a2e:be83:0:b0:2d4:64b1:25e2 with SMTP id a3-20020a2ebe83000000b002d464b125e2mr124380ljr.44.1710378646791;
        Wed, 13 Mar 2024 18:10:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u19-20020a2e91d3000000b002d2ab6ae675sm48917ljg.137.2024.03.13.18.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 18:10:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 03:10:42 +0200
Subject: [PATCH v3 2/5] drm/msm/dpu: core_perf: extract bandwidth
 aggregation function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-dpu-perf-rework-v3-2-79fa4e065574@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2547;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XB5qQZ6AM1gMdqH09M2m8W3Q7FcCw/TC5ffKreIP0Lc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+onv0kXr8re+i35+SlTdqBy1spZr5luMYQ+snYTuNj6O
 6JZfClnJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmkqbI/ovJbPuPd+LrnBLP
 Tzjj+pppSZDAq3k2HdHLK9qCywxrw9/c6V5y+t237E2zk/2+xlQpRP5e/OeBUA1v0IEpz1feM4h
 Z0R9XlnT6WMya/UpCbr7JgUZyu1Vsi8sXZib8047gDkg6qL4pdXlnwIOde01Xzlg+02oh27aUe4
 b7uqYtEyh+v8aSyYHbS2We+vwJ3HosssyhCXUZH0z/Jkm0q7PtrHoZ773c8ADLA8kbp45YF0XUH
 Gwp0GNJdcn9u9BOVb3z/6f+O7ZzjFIu2QpM+CKa1md/rLSNaVFz3mnrHfxSCVHuJWzHygWzAo+J
 Razje3jyZcabDgb/JtE3vgkf/eR+typM5tRJqTm8aW4mAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In preparation to refactoring the dpu_core_perf debugfs interface,
extract the bandwidth aggregation function from
_dpu_core_perf_crtc_update_bus().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 45 +++++++++++++++------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 68fae048a9a8..87b892069526 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -204,36 +204,41 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
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
+		struct drm_crtc *crtc)
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
2.39.2


