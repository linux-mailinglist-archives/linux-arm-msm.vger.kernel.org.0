Return-Path: <linux-arm-msm+bounces-109116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EBQB0Q3D2qSHgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 18:48:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADCC5A995E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 18:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61AB33294905
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492BD36E47F;
	Thu, 21 May 2026 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yR0kjbpl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D8A36A37A
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374838; cv=none; b=ez454fkI+Tq7WK578YFOik+D8eH+xaaLxzBlhxEzvciqQy0Pi5NcsvH1xtfX+MP8p5xwVgfi4VFlIVmRYZETmycosm9kCRtGg5zWkZq4tnL+O6wxm8mr3F8SupF6oFcfCofiwzgCvx1mNY+C88nb3OJfoIkEPAZ7ePWuYOYQXNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374838; c=relaxed/simple;
	bh=KnQNWhFGZp33dCjq6OXiRZfhx2zq6YDbC/BM4AvYDFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aaPpGLam/nF2efaZWOu/Hyvm5sRwlxaPM+JlWg1xjzjR6dlOXfeBkgph5rmjr/ZD5S1S1YGKpCQ+nJ0Xr7nQ8AzIoeprKogqGLc1bR7/MK1ctBCfdmiwpC/EZsMTnzdvmUY48S4sk8utqvKMcrIdYLrilccHhLY+sCgQxQZQtCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yR0kjbpl; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-369576666d5so2903395a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779374836; x=1779979636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9BURsh5NYMbwKkwuyMPazevtClBiueqRU9O2y7rbG4=;
        b=yR0kjbplKJPCSv98BAtKLEoBQXMUdukcIRjDsnTSYtMfZl2AiG4AbjRU6OBwT78iid
         8j4b4SzwvJJFca+jeTKJsUil1lHrfo+GXwo0YXxKg9pLQalmksNF8CfQjzAh5jrhmMiV
         LEhT7XfB+sDiTNb8E+/ntpeXcOZoFXNXh642jDvKxC+7mN/YMR0l0acHfQX2k2jnOzFe
         ZAkHUIautgfut9tOuvLIy4YZu0LImytii0pqeLz6+/lDFa3sVa2olcexpzYE+n9grBZu
         CUWwn1mGi1/zHXvQ+BBJuchWB5XHnlqnsZure2R5bhEmcWKy6S9K8LykP1RLguiuRKXq
         5r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374836; x=1779979636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9BURsh5NYMbwKkwuyMPazevtClBiueqRU9O2y7rbG4=;
        b=dwhAtbE/W3eeMievpZh1fTVehGyUOPUpQq7pRn1kOdyeBqi8GN6UaxN303k4w3gHb1
         S5rirejW0QpoIonxZN2Kb6QJ4YTbm61t8Su2rAVNb7akNZdMXMhoX6uGtpzY9iI9CEXT
         uMzt5xV6xtybq00JyU4+2xIZIlIfra1ci9Yw8LKQ/AfzHFM7V6hNWu6EZ+xeyBzxMELB
         xEbMmJ2CEOKipWF4M+fvsbcb5y/umjqvemM5lhVmIzjpwW6mo43fE86Y+JGZVvmANZjg
         kiRlwhH7prZUfrI1W2UtaY1V6bB4i6OY6TttTWeDBBIAUrZOL3t7MBqY60tS9xI2VlCu
         wfGQ==
X-Gm-Message-State: AOJu0Yx10xP+c1Q7CiNeCeKKUGcqWKNeQhWAvCCkMz6sg5USEbFRd+s9
	3CbvROEUcrfyKuyZYfX5/SJH/nbl0uNgnqX0LSICmI/CRdhUxE0dcOs5G/dqOLCimEs=
X-Gm-Gg: Acq92OGWSNprRS9v9knKb77mL1VZXSBUEdxRdEURqj94vt/EITwvkDURv67Itqyjq8O
	eDm/+/RQHm6m6jikt6LC/RJjbfJ8j7WZEnzA7UI2nVfPbcsKmfm8BXu7tTIjM6O3AqVODAjDclP
	Gukkks3mshLlATxwiKgRkO+NhLSqWowrasCwQDNCUT+YhlF/PPVeFkKsy7E6kBsIzvtAo0vmjii
	mk07NDTHCYjV62TIVKLaLkkIPDCOSOdjAcJ83aGFtmR4/dIn9usnKfFV1iv46Ao2DwHG+ATeveU
	ipJxFf4dVEm//D4toeYdmj7SKbgkuNIZ6BegiqBO7Jtnm1AuNVYgA23/C9M/kkfXBLbWlBSB4fx
	OLxgUZJL8ECeUFTv5C7doX9G/iwIHoi9Ybgr9h9c1Q7OFUIiSUkaTHfCkzjkHafkPLEAvJF8dhG
	0uGvLv
X-Received: by 2002:a17:90b:3d4e:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-36a4563db18mr3294883a91.20.1779374836085;
        Thu, 21 May 2026 07:47:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::109e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5bff3ef3sm476527a91.4.2026.05.21.07.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:47:15 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 21 May 2026 22:46:05 +0800
Subject: [PATCH v4 3/5] drm/msm/dsi: Support dual panel use case with
 single CRTC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-sm8650-7-1-bonded-dsi-v4-3-a4dd5e0850f1@linaro.org>
References: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
In-Reply-To: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779374785; l=3355;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KnQNWhFGZp33dCjq6OXiRZfhx2zq6YDbC/BM4AvYDFo=;
 b=nMdcNoK7/z8Uvsq3qZxzJYj4k6T+yPZNRjhZ4FVWWK4hodIv7ywVAZaXqYzqN6eh4rNaL0DUK
 4O0zFdXVKxcDx+0rHZUOJMKzSINWRX6pZDrVJ97WSdEdwIz1gI2bbTY
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109116-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1ADCC5A995E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Support a hardware configuration where two independent DSI panels are
driven by a single, synchronous CRTC. This configuration uses a bonded
DSI link to provide a unified vblank for both displays.

This allows application software to treat the two displays as a single,
wide framebuffer with a synchronized refresh cycle, simplifying rendering
logic for side-by-side panel arrangements.

At the DSI host level, the frame width for each link must be that of an
individual panel. The driver therefore halves the CRTC's horizontal
resolution before configuring the DSI host and any DSC encoders, ensuring
each panel receives the correct half of the framebuffer.

While the DSI panel driver should manage two panels togehter.
1. During probe, the driver finds the sibling dsi host via device tree
phandle and register the 2nd panel to get another mipi_dsi_device.
2. Set dual_panel flag on both mipi_dsi_device.
3. Prepare DSC data per requirement from single panel.
4. All DSI commands should be send on every DSI link.
5. Handle power supply for 2 panels in one shot, the same is true to
   brightness.
6. From the CRTC's perspective, the two panels appear as one wide display.
   The driver exposes a DRM mode where the horizontal timings (hdisplay,
   hsync_start, etc.) are doubled, while the vertical timings remain those
   of a single panel. Because 2 panels are expected to be mounted in
   left/right position.

To maintain synchronization, both DSI links are configured to share a
single clock source, with the DSI1 controller using the clock provided
to DSI0 as below.

&mdss_dsi1 {
   assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
		     <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
   assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
}

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index d14b6e41dcd90..4d7ac01aa393d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -186,6 +186,7 @@ struct msm_dsi_host {
 	bool registered;
 	bool power_on;
 	bool enabled;
+	bool is_dual_panel;
 	int irq;
 };
 
@@ -1024,7 +1025,10 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			return;
 		}
 
-		dsc->pic_width = mode->hdisplay;
+		if (msm_host->is_dual_panel)
+			dsc->pic_width = hdisplay;
+		else
+			dsc->pic_width = mode->hdisplay;
 		dsc->pic_height = mode->vdisplay;
 		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
 
@@ -1705,6 +1709,7 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	if (dsi->lanes > msm_host->num_data_lanes)
 		return -EINVAL;
 
+	msm_host->is_dual_panel = dsi->dual_panel;
 	msm_host->channel = dsi->channel;
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
@@ -2596,6 +2601,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
 	if (!msm_host->dsc)
 		return MODE_OK;
 
+	if (msm_host->is_dual_panel)
+		pic_width = mode->hdisplay / 2;
+
 	if (pic_width % dsc->slice_width) {
 		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
 		       pic_width, dsc->slice_width);

-- 
2.43.0


