Return-Path: <linux-arm-msm+bounces-45387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCF7A14BA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 09:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 273E51886297
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 08:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1101F1FBCBA;
	Fri, 17 Jan 2025 08:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e2XNMYWW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD291FAC23
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737104220; cv=none; b=OmwtsrX3flGDtB1GUhw95cdDtlz3zEzIXSgzd+aZZD8ICJbaRfbKtDKV2z++YHYjFnKmuj0ZhwSmUgTHn6MJFTC7kWDanyAfh18f8StRsOTSZbvZQdKOKctWW10Ln6UN/iogao7MfxVPvGzpn8u0i8k3xRRPd4E2rUtyxub/T6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737104220; c=relaxed/simple;
	bh=W3eVsc55e3ZuouquqjNn9pJNO1JJGFNEugaVYRs9q+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3mKUqmrtNkw5A9+L2l9lXXq0WhDx/T0MRtQmWGrwDGqwFtdzI7aGI6KvbHZ9cwZRTZYFyCL0FEehhixkbD1uziOPg+dvjW7i7dMt1b6Df2sPRdN72jJCb9wRyb4t2xzOWFcGq8z01wQtenQUpcVpRY5GSNiageeGjqU/8mK9DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e2XNMYWW; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-303548a933aso16173841fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 00:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737104217; x=1737709017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BRQ6lNkfp8bS79Vg2bjfdOdsHUWBBgAxpLUiozXV7I=;
        b=e2XNMYWW3rSbT4DJcEPwJSflpGFU+UFjrOByQpjS5uZTXGwV1Rcgg4paseP+8uThNY
         SgW2l6ut/UCuLu1ObC0mZyyJmHrlK/LZFeB+zVjFly6W9JI5oGS36fl0Rx+nHwaDKDJo
         R/nazFayUx8av5THpDGH8yHlU4u3+TdvnvMKfMXOuJJM4BPPGoQEByZDPUp3lbldLaUl
         iRpCoBDQNCn3D/xpIF4MYmFzuW9EIuQieRxemv9tduiGs2IYmFf4dsl5TK7tAD6frgSk
         +iS9/KLALfnkB/gS85APxfJptVwIxEMp+IhxCtk2AGYjH0oOqxtlKpC03ijYO/OCry8G
         kstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737104217; x=1737709017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BRQ6lNkfp8bS79Vg2bjfdOdsHUWBBgAxpLUiozXV7I=;
        b=i7nj8Phk8GBOu+VWXnlQ2pH2WUBZsBwtA6OJC+XEyxovHhhOR2Y448oWM2iJ54idX5
         G5ZvgNYi1naK9NuVkLcXrmrwpZCxUDphW6yeU3HuSVjK1fcv3bm9LCqlSNJ0Kz1TVkuF
         dMsRFT3qt9qbQdZw/2Ic1w1miw8yLxkDiXfElfxFHPisOxmfJOhedeuXEO1fNNUyg/P4
         YWjaKZRt+UKosNXWSbKnGemvNjPCTQqJrKf8QIDpmtsjSqb8EFPAdLQsTeajTY0hcHWU
         mmPvIAWJpqwJA+eA6OysiyuF1UiRsuvqvKNIYGt9APjYyZvWusrcdVINzjTpXY/d5TkP
         frmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO7n6ADMHI7iLT0dVS3aubBmWqlKyv1Pn/c3F41Vd3dJEGYcjayBxIrsXnAH9RA5ZFJeZwnjH4MRRwoNlZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxAJ1p7n9aYqatPxUIqkeFoCGMkDGyMH+OI7fArHm4/gpnVS2wx
	4llHz5uCte4TMtp6YR2XpHsM/i2LFW1aGIdbQlFS6ZmbpKvdE4Tjoi7E3zayoAM=
X-Gm-Gg: ASbGncskgnBhsB01bew757uUrLnJ8CwtHx2m0l0IUpSb7w4AwHFrphBwu5AGT7uzXre
	gpDMEQ0bYBqvqpdcy0Hge1dHg2SFxAyWjuRsjJyWfHXkYK2Mzst+C28QGtT6aZaeEB88sP1L02T
	gZCuIkQ+PDSERGT1GgGXgj/zR5HCZ0HBOoExHR6gqaqAOZ2lhjYnqvj3GOdpKcIqVXd3DrlmSoT
	VQELtnXaDF+8fBC4KwAZiztYBUhzffN3niYOVCDEtCpGkCcrnh+z0bzyoTBOEgI
X-Google-Smtp-Source: AGHT+IGJKew3iWflBqoi5/eBNb71qdJHpWzyjt6BMF62fH7cdxIvx8zhS7YOn1v6IRPYf1vezlY6Mg==
X-Received: by 2002:a2e:a883:0:b0:306:188f:c0b3 with SMTP id 38308e7fff4ca-3072cb3cf7amr5794901fa.35.1737104217192;
        Fri, 17 Jan 2025 00:56:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a330764sm3402101fa.3.2025.01.17.00.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:56:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 10:56:42 +0200
Subject: [PATCH RFC 7/7] drm/display: dp-tunnel: use new DCPD access
 helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-drm-rework-dpcd-access-v1-7-7fc020e04dbc@linaro.org>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3991;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=W3eVsc55e3ZuouquqjNn9pJNO1JJGFNEugaVYRs9q+4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3qXtJub1UL2OoOXbhcTTBRLmuZej50sKPqoXmSaa94ZK
 xb17lWdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjI+hIOhklzNU4FVAc5WV5y
 MzwS7eByXE656tX0UOPvT6c+/fpr1sfX1kz/OS1ZDY7WXfT3/1K7Up79QrO3zXH287zXWpzNX+h
 3zb4qNf3xjlS5xQ6uVdOPt5/e8XvlkgLPNLcGy9BUkVWKtXmnD6VaTZVQVZn7uXBdEUvX/ce9Vs
 dDcvUFeTqCX5ZKlu2qTm/qXp7YKn8qrZV5p4+CxUnPnEliJ1fv3LdKQ4p/kY2kV3r22edTzzTLx
 jwSsVZdNsdtao7QjD6jKqPEt/nhO4rYmIQDuR7LfgjLn3pp3bMWv1pfa7W7fGJiPxpslrVLKB57
 PdNl+vdD39QFcuddkzXIcmiWFD2UL/r1zlyBS6vdQnYCAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Switch drm_dp_tunnel.c to use new set of DPCD read / write helpers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_tunnel.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index 48b2df120086c9b64f7d8b732c9f1f32f7b50fbd..4ef1f20bfe4a0648a92345a80fc6658ab23c5003 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -222,7 +222,7 @@ static int read_tunnel_regs(struct drm_dp_aux *aux, struct drm_dp_tunnel_regs *r
 	while ((len = next_reg_area(&offset))) {
 		int address = DP_TUNNELING_BASE + offset;
 
-		if (drm_dp_dpcd_read(aux, address, tunnel_reg_ptr(regs, address), len) < 0)
+		if (drm_dp_dpcd_read_data(aux, address, tunnel_reg_ptr(regs, address), len) < 0)
 			return -EIO;
 
 		offset += len;
@@ -913,7 +913,7 @@ static int set_bw_alloc_mode(struct drm_dp_tunnel *tunnel, bool enable)
 	u8 mask = DP_DISPLAY_DRIVER_BW_ALLOCATION_MODE_ENABLE | DP_UNMASK_BW_ALLOCATION_IRQ;
 	u8 val;
 
-	if (drm_dp_dpcd_readb(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, &val) < 0)
+	if (drm_dp_dpcd_read_byte(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, &val) < 0)
 		goto out_err;
 
 	if (enable)
@@ -921,7 +921,7 @@ static int set_bw_alloc_mode(struct drm_dp_tunnel *tunnel, bool enable)
 	else
 		val &= ~mask;
 
-	if (drm_dp_dpcd_writeb(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, val) < 0)
+	if (drm_dp_dpcd_write_byte(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, val) < 0)
 		goto out_err;
 
 	tunnel->bw_alloc_enabled = enable;
@@ -1039,7 +1039,7 @@ static int clear_bw_req_state(struct drm_dp_aux *aux)
 {
 	u8 bw_req_mask = DP_BW_REQUEST_SUCCEEDED | DP_BW_REQUEST_FAILED;
 
-	if (drm_dp_dpcd_writeb(aux, DP_TUNNELING_STATUS, bw_req_mask) < 0)
+	if (drm_dp_dpcd_write_byte(aux, DP_TUNNELING_STATUS, bw_req_mask) < 0)
 		return -EIO;
 
 	return 0;
@@ -1052,7 +1052,7 @@ static int bw_req_complete(struct drm_dp_aux *aux, bool *status_changed)
 	u8 val;
 	int err;
 
-	if (drm_dp_dpcd_readb(aux, DP_TUNNELING_STATUS, &val) < 0)
+	if (drm_dp_dpcd_read_byte(aux, DP_TUNNELING_STATUS, &val) < 0)
 		return -EIO;
 
 	*status_changed = val & status_change_mask;
@@ -1095,7 +1095,7 @@ static int allocate_tunnel_bw(struct drm_dp_tunnel *tunnel, int bw)
 	if (err)
 		goto out;
 
-	if (drm_dp_dpcd_writeb(tunnel->aux, DP_REQUEST_BW, request_bw) < 0) {
+	if (drm_dp_dpcd_write_byte(tunnel->aux, DP_REQUEST_BW, request_bw) < 0) {
 		err = -EIO;
 		goto out;
 	}
@@ -1196,13 +1196,13 @@ static int check_and_clear_status_change(struct drm_dp_tunnel *tunnel)
 	u8 mask = DP_BW_ALLOCATION_CAPABILITY_CHANGED | DP_ESTIMATED_BW_CHANGED;
 	u8 val;
 
-	if (drm_dp_dpcd_readb(tunnel->aux, DP_TUNNELING_STATUS, &val) < 0)
+	if (drm_dp_dpcd_read_byte(tunnel->aux, DP_TUNNELING_STATUS, &val) < 0)
 		goto out_err;
 
 	val &= mask;
 
 	if (val) {
-		if (drm_dp_dpcd_writeb(tunnel->aux, DP_TUNNELING_STATUS, val) < 0)
+		if (drm_dp_dpcd_write_byte(tunnel->aux, DP_TUNNELING_STATUS, val) < 0)
 			goto out_err;
 
 		return 1;
@@ -1215,7 +1215,7 @@ static int check_and_clear_status_change(struct drm_dp_tunnel *tunnel)
 	 * Check for estimated BW changes explicitly to account for lost
 	 * BW change notifications.
 	 */
-	if (drm_dp_dpcd_readb(tunnel->aux, DP_ESTIMATED_BW, &val) < 0)
+	if (drm_dp_dpcd_read_byte(tunnel->aux, DP_ESTIMATED_BW, &val) < 0)
 		goto out_err;
 
 	if (val * tunnel->bw_granularity != tunnel->estimated_bw)
@@ -1300,7 +1300,7 @@ int drm_dp_tunnel_handle_irq(struct drm_dp_tunnel_mgr *mgr, struct drm_dp_aux *a
 {
 	u8 val;
 
-	if (drm_dp_dpcd_readb(aux, DP_TUNNELING_STATUS, &val) < 0)
+	if (drm_dp_dpcd_read_byte(aux, DP_TUNNELING_STATUS, &val) < 0)
 		return -EIO;
 
 	if (val & (DP_BW_REQUEST_SUCCEEDED | DP_BW_REQUEST_FAILED))

-- 
2.39.5


