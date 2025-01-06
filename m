Return-Path: <linux-arm-msm+bounces-43953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A171BA01DFE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 04:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D38AB18855FB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 03:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D0E3D69;
	Mon,  6 Jan 2025 03:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C3ZEyDuR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C96778F39
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 03:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736132867; cv=none; b=bFJoSpGjwEpJgBFrlZiNTi5foV+OoxpdOaaRolGSTXLAvEdkvjlMENP4U1Tlp1SFxbtv/4DZI5e8AABgqE4bLWVb+dxGAxX6dnm+5nk0ec7aMCJiiRq0kbgfjMsR/NjeVxkRyT2ZCzIEjnWdAie8Wks4X6c5WCLRjBW81lWOX+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736132867; c=relaxed/simple;
	bh=Ranvcf9s/bstJI3Eo8F/WLE+D4NDgHgD/Z08d8sAtcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GOh4OA8mPe85d7blmCqO/lobRGPyPY+wR7NhePdeP2Wt2AtoyhV0hPAwimx0edc+USbEg9LYH/sTl0i/jt91TPB2AtQ3uBBAHjRqpd7VGX9hRTU+tzJWRxFhn9GstM2nDH/0o98erzhZ5LjfO1voHmxGZmw1J8sW8sFagYvi2C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C3ZEyDuR; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54025432becso14781134e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jan 2025 19:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736132863; x=1736737663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swDuQmaW1jB5oxxfqZCzBvZatK3qx5WhH7+L/hnGQig=;
        b=C3ZEyDuRjRTPptpaXuBWWjUJw8y+zJrZm0+lMvpUL4HUmaAwuq/YmRdnqFY/AkJTrY
         viaILjn0oi70sURi3pD9DMyqGjjPyetlayEcn4d/agXV9VNrs66/DG8sF7/acNGS+GDN
         iQtzxlbmgZYKdhdYHrt0bN8V4H/CyJ6dgi71CQvS+5UjqhRspL71NxEOU64yx5QMX0np
         iKYXg+qiBSlbpYyiYR+83DV56UcnZuKmBG061T8F1VYbCGt+rTBI1Y+WIf31vmBRIjJC
         MZACjK8glCCTsyMaQIRiGF8v99mGMNlnGqKZPrwggvQFThcE2AFJxXsKbws3uQ13ixQ2
         2+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736132863; x=1736737663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swDuQmaW1jB5oxxfqZCzBvZatK3qx5WhH7+L/hnGQig=;
        b=OKEfm1qWN34lqIB/c7tEVcLSZL7mjJ8I/C9TYQv7H4QG5Ral/OX8FNZ9DP3GIExKXU
         n1Pv43BxSepS568QFG7TscJl6BisMue12whOAul2plMwSD69DeVJetnaLm9ZXvNMJwMa
         1+lpEG0844NnbzcfMdHNlq8/N3cRMYEQrIlooJvne2yrMn4bdimXVu4PekmiSmfYcwZ7
         wrtzUrxnzhYloIpZMsAlQnAaPq4431zNhpRubSTh471DvWpF2ajz1xLJC5EimdKrETm0
         VIPyRzAPPU/pbyMGQOXA862jS6lYPlSBV0DFwiTsiKJ+WcZE4K6ZgV7I5v8/BqQbL/2k
         Z/FQ==
X-Gm-Message-State: AOJu0Yy0XjnsXnvva51m7VjC7nj4vjN0ynnQtG14q1P0fgc4Y+pNmO90
	eZ4WAtuKtb3lWa7c+cQ4m493taVrbRVjFtSfshMv4jO0O5gPBll0HdVK73V/XRI=
X-Gm-Gg: ASbGncvoaTb888nGTx2eTg0/9KSr8IoU5cqvQ6Jq1d1u9/goCTBMn7A63VaExH4jlCI
	siad6sV3m4hgp/3QtR9zvMU4kwXuuKiRvxl6Vbqml66p4PQkDq+vx8BVysybQScDTvA+mOTek/X
	S7obmM1nuaxg5/D/vlxsWdYLfiXfyMBgB5JLey9NuJoT6GB6rO5reYg6Ef+43++OkdaZxg/Orqm
	0pyA+Mb8cqUVg2PpjruOrosb+kkxI7l7sqytmtzN+dhGg08lS4/lgCdPIfn1ylT
X-Google-Smtp-Source: AGHT+IG2M9aFMxTan3YopooGfdGfRiY0x82IbSXTPZPHiw0oye/j77ngPHUTAEzUD74f992i8cdiWg==
X-Received: by 2002:a05:6512:2350:b0:542:1bdd:511a with SMTP id 2adb3069b0e04-542295322ebmr14373018e87.13.1736132862909;
        Sun, 05 Jan 2025 19:07:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 19:07:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:35 +0200
Subject: [PATCH v4 1/9] drm/msm/dpu: extract bandwidth aggregation function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-1-00b248349476@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2664;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ranvcf9s/bstJI3Eo8F/WLE+D4NDgHgD/Z08d8sAtcc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j4V7gMlJS+NZnYUb5mxgwM/JXVWs//nPIj4
 PCukzy/PrmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+AAKCRCLPIo+Aiko
 1bVyB/0SPP/7XFYWq88gWJAZjJWFRNQJGXsz8SOcFvxdRxFETxTsGsqNHsA7zgTTuYwj2lldlZx
 +4nNrS/qJc17QHWTeUS5YUguRQOpTIulHxY2JwTiXsYSn9mvHGHWLYKU4yXb4c6R5KYyUkj1itn
 OHfFJerRzaWcdgeJQ2klEC/wRAPUqBq5cOUTxerirAKadMKgc8oPVMV32M09nQfTOOuGL3IOHRj
 xzs5KCKmwOk9xQMbGybB+NFvA+RDMVkgmljgaX93tuyhWEqid4c2BPdMRB/M79pCIQaZ96dFk1A
 DytTmjIzZq5Jy6UdXsdTaADceNhPU0qBv4LUPKTOlFDb+r4g
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


