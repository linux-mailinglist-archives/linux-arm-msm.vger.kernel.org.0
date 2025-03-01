Return-Path: <linux-arm-msm+bounces-49925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52384A4ADF6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 21:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 901CC3AF7AA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 20:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81221EA7D2;
	Sat,  1 Mar 2025 20:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zrAYQ2nM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065161E98EB
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Mar 2025 20:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740861606; cv=none; b=fz4xPf7jWccM9pKKOoYVpHrz5gzZPdToaHqwo9kcfkq7Mi6jL2KqI0SZk+miV0eUon+hhhjuF/CRRNcn90sKEUueZDM/QncX0BVv6LzKCa3srLRyYJOiYsPrIFVOAWTO9xNK8mtCkCkWXGxK553s5P1WTB5+UFLiNlyIm+TghZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740861606; c=relaxed/simple;
	bh=AezDpTs9i2rYRC6AeDwZvqAV87zlWZZG2GdTd51PPFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2ryD4GIE9d3e3+vh+xJXuYE9X7XynUsLSDFZnS1o84gBTc81Tej8Z1pG1A74mM++jr+uaoqezMLaBEHPahwDcaUvu9Y8nn9/qTMChyrgnfYoNAJCS3LQBLikkcvuXD9z5bSH7ubovMi07ybtqiBlWPdDOc6p7xe4yeXg4xcsyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zrAYQ2nM; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30b83290b7bso37431141fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Mar 2025 12:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740861603; x=1741466403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rrKZtC/bMyEQV7p861KyPu6bgZA7HKXFytfcKKDOBo=;
        b=zrAYQ2nMM/alrGYOPsjP3jvzE0EoHdk/ZQM7vdDCI+J6VSXcoofTh4qyjyvhid8CJt
         MvoOIbetiPjIDxU56erOKuAOe2Hoy+SGsOnam0gqRmOqDTNgBp60wgufjh8uvJJKfJsa
         hmBGT7ML32ZM9YV1vsEpt/JDAZduYMertnNDmPqh0XFUh/I3e2dl5/jvTyLF3jDx+hRb
         2K+9P5h0O830MfWhCxn5MmBn0gx+9yJdjOvOhugQ2vM88XGHTZWtx3PKgI058Xr3mLy8
         5mPNYwMTT1fyG5S498KzY/jkcl/5GfuHtbjiEBebb5L9CYZHMG6NZf3bCjgMjBRacZSQ
         O6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740861603; x=1741466403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rrKZtC/bMyEQV7p861KyPu6bgZA7HKXFytfcKKDOBo=;
        b=e3t09iTb6dSfPPxBdLSR1Qt3sCQnSSXi/iSMa0UaaBfbC3C54K004aowOIF81UGSEZ
         iLDmi9dZQ30dB781K/TSy57z49v1JOQvGl19L8fU9waMqtDOv8IsseMzb5yvdzK6214l
         sLjg2+0W+engc3BzxhvSDm0of7xnGduM2Co+I1FWxd84qyOEgo+WhMGf9ZJzg+TJs/tu
         cfA8GzEen5KLB3r/ulSbXyR7MuSjLhkIu1G9tTLV5tP6EA79Hioh98OYoCPy/VFsg8OQ
         Zyhws80XO5taZ0YtZV/EfQy1U1NK8JLzu5PC9nF9YVsdyNGFjDQXIuXxCCa7AVi8qW04
         vFHw==
X-Forwarded-Encrypted: i=1; AJvYcCXd60JCJd69Rt9/SmnmPA5VRNiKvejBdiBy0Jqy3AEA4bKzHn5lWqYdwBqCz5Zmq5mdR468H741X1jA2Wsj@vger.kernel.org
X-Gm-Message-State: AOJu0YwVuKFsBljMrQ055UgJiV4vko03QsmVgf4MjN7RVDaJXkVkkgGi
	oK8I6v8lxWsxyTCcdN6aW5nf/8V99IHWuHoDD+Bek3JZFztEcujFlJvuTpyMXhg=
X-Gm-Gg: ASbGncv4P2cz+axy38yrhclawd4YmfK7oiJshwaPDpddjpSnVzPCo8dE0qRc5IsQECL
	b0GfQw9QMKXMaFOSzgOSTyOlxf0FYGL8Y0JGxQSKXq0A8lCwNgrdSYiuj7yNi6dLBDtgzE6GEvA
	ObRkkQQde1Xz5Oh43NyFcRlGu/jJqBQdAZyBy5Ge1whXbDbA1r6CbWFhoYgc7HiBMaz/1eE/z/L
	gv0tUj0Z/0MAl56wiLnwNYErF9Pu1/ciV9QIlmXHysfXWuvWm5Y6Fm5fghB6OWYviDMaAZavL4/
	WTjDjYOmCT1kGgUWy+k2aucCsaaoJI0Oiur7NvOB3Ru2TK4H2Spn
X-Google-Smtp-Source: AGHT+IGzJuIl1nriLCLHVpXfC1qxg6TocNRgoMvm3sF5xsxOv1PgMaKL1vLpURJQMUg29MdXarznzw==
X-Received: by 2002:a05:651c:b2a:b0:30b:8dbd:b7b with SMTP id 38308e7fff4ca-30b9325c8eemr30950491fa.19.1740861602945;
        Sat, 01 Mar 2025 12:40:02 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b931524efsm6668921fa.60.2025.03.01.12.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 12:40:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 22:39:42 +0200
Subject: [PATCH RFC v2 7/7] drm/display: dp-tunnel: use new DCPD access
 helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-drm-rework-dpcd-access-v2-7-4d92602fc7cd@linaro.org>
References: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
In-Reply-To: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
To: Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4082;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AezDpTs9i2rYRC6AeDwZvqAV87zlWZZG2GdTd51PPFs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/rhggk3/sV12amrbT3Pe02nov6j6csCu47VZ5cXfao4/
 dVhquTeTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMxKGa/X+hwLufpUrF3SdX
 3LhoFNIVapbxLr/w5zWZ7wGZP9b8KNj6JTX38dnpAgV5MdbTipeK//8T4qjhHx03Ued81S8Xq9N
 GwSWXUpYXSV2wTg76x/C0v6SNy7o/J1XB7Ex53YUas69tWerxP4R9r5wQLjFvMWi9vPKKzk+rK0
 nyzGFHEh6L8Qb63PeZ7/Bvy5l1/1tNbQ1N/7lcq+H+zMWo0Ffwku3CfoHri9uFTWf/+KOtNy0o4
 dHPJ/fvVSYzxZecW/h+fprD6iPefqtXMi/hcuVs23Wqd+OjF4+bg+M6XxUfakub9Hep1oRiFe07
 u+P36vAbxNlfUVZfW/zGmZ3PuTWwVlmAbbv2P0OXXaoOAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Switch drm_dp_tunnel.c to use new set of DPCD read / write helpers.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_tunnel.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index 90fe07a89260e21e78f2db7f57a90602be921a11..076edf1610480275c62395334ab0536befa42f15 100644
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


