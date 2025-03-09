Return-Path: <linux-arm-msm+bounces-50737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D169A5818D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 09:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD3821890620
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 08:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B755199EB2;
	Sun,  9 Mar 2025 08:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+E/riMc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D154019048A;
	Sun,  9 Mar 2025 08:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741508061; cv=none; b=Ddun53ra2qdNHEaFdHNBs1o19MCGX5goh7hUZKFLN474cfl9zgB5rU0WxZYf9wHHvO2q9LxFdd7uTObGIicFTDGEP8ygw8R/AEhcfyKEtKZjPDK06fJn+qtlU9M31CzYUBKZ3FLmchYC7LDF1EtL5Ul4ZR0F2UgvmKNnPm04E/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741508061; c=relaxed/simple;
	bh=W7nw0jw1Ss0bwB/C3uFPtKQuwQs41yxqdxR+vB+V0zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZX46DEFz1okUu0GLPNTopw04qT+Gl2JSP0zXhNxS7em5e/ZTCgRzzSeDmlsRsB8D92kDS4aMVJH9G0st6Jq8ncNFZmMrEdunLs5Ztj+bfQ1gljWk4m2Pu+wXCqJeWe/FMXnfOGKhahy80J/OZyinja95p/PMM/doMUDBfhjedZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+E/riMc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D8BC4CEE5;
	Sun,  9 Mar 2025 08:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741508061;
	bh=W7nw0jw1Ss0bwB/C3uFPtKQuwQs41yxqdxR+vB+V0zk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b+E/riMcyW0lsp43Ptc3xlBElutavjsKDRvsbCHA8pswmdsb/fDfbefdA0uzhTbWr
	 eeuJm35etXEKsCIUPsizm1wGzOpYc88QFlcsjsxCxRfDp6rMbkKDMvqoZ2vRXIb9Zg
	 w/uh+hpekyhCibq+pNmU67sXcBsLPupY/I0U3F3Ry5GM2FKlj+9VcWPvMec7ltFXaX
	 gkztkHy9CZrN7I/ERdG0UCUPpm/n8bzunHaWH9d3nh6CTJcOOHxXlvGQu48xH3is5Z
	 lOW3lwETrOxPSEypMOy/wB5denbKBivE7CeFGKAHCK0DyLtLDXlHJOrS54ynNWx1eE
	 LIfEY5iI9Q5Yw==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sun, 09 Mar 2025 10:13:59 +0200
Subject: [PATCH 4/4] drm: bridge: dw-hdmi: use new helper to get ACR values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250309-drm-hdmi-acr-v1-4-bb9c242f4d4b@linaro.org>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
In-Reply-To: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3491;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GlRG7IRAmPhh4kgVI1wSSjTe2BRrv/NhljUJqAp8BWc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnzU3GVJh+APeTTkohhWIe+PzXwyyRACeTM0JgU
 Wm5rVdkNtOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ81NxgAKCRCLPIo+Aiko
 1SrHB/9N+uaX/X4CoyHTSXJuwjV5LbFux68360Y/uEBmnhY4s/L4Pkj+CxBUhEfH/JbwZ5i5SZA
 WAIWl7nFtC8xIUqsAHbSJG0i9daG+w+4zsYduDOiaw+jGSUL/LNMdtadacnh0rMnGbLMFdBA/qQ
 xfs4lGJY9GZ0YPlA9JtqHKl8BlFRlSSH2LI3v7gQ19H2XIX4ShbzkM5+18qaNV75XexeKsNPkMG
 W+kJzbbMWFmWDhUgUsrUi0jnEUqbHTAflZV2e4mf5YN6YEK1FhNQsX3kOvzUOK6ibRgPEmQgP/i
 PzDJiBHWMoOx9HzzX5+9kO/F8QAqTy2M/jqAF5iMtieww1BV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Use drm_hdmi_acr_get_n_cts() helper instead of calculating N and CTS
values in the DW-HDMI driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 90 +++----------------------------
 1 file changed, 8 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0890add5f7070f13fefad923526e92f516f06764..b8775e677233ca96c2d4a06fb5697aa3c0bd45c3 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -558,68 +558,6 @@ static void hdmi_set_cts_n(struct dw_hdmi *hdmi, unsigned int cts,
 	hdmi_writeb(hdmi, n & 0xff, HDMI_AUD_N1);
 }
 
-static unsigned int hdmi_compute_n(unsigned int freq, unsigned long pixel_clk)
-{
-	unsigned int n = (128 * freq) / 1000;
-	unsigned int mult = 1;
-
-	while (freq > 48000) {
-		mult *= 2;
-		freq /= 2;
-	}
-
-	switch (freq) {
-	case 32000:
-		if (pixel_clk == 25175000)
-			n = 4576;
-		else if (pixel_clk == 27027000)
-			n = 4096;
-		else if (pixel_clk == 74176000 || pixel_clk == 148352000)
-			n = 11648;
-		else if (pixel_clk == 297000000)
-			n = 3072;
-		else
-			n = 4096;
-		n *= mult;
-		break;
-
-	case 44100:
-		if (pixel_clk == 25175000)
-			n = 7007;
-		else if (pixel_clk == 74176000)
-			n = 17836;
-		else if (pixel_clk == 148352000)
-			n = 8918;
-		else if (pixel_clk == 297000000)
-			n = 4704;
-		else
-			n = 6272;
-		n *= mult;
-		break;
-
-	case 48000:
-		if (pixel_clk == 25175000)
-			n = 6864;
-		else if (pixel_clk == 27027000)
-			n = 6144;
-		else if (pixel_clk == 74176000)
-			n = 11648;
-		else if (pixel_clk == 148352000)
-			n = 5824;
-		else if (pixel_clk == 297000000)
-			n = 5120;
-		else
-			n = 6144;
-		n *= mult;
-		break;
-
-	default:
-		break;
-	}
-
-	return n;
-}
-
 /*
  * When transmitting IEC60958 linear PCM audio, these registers allow to
  * configure the channel status information of all the channel status
@@ -646,32 +584,20 @@ static void hdmi_set_clk_regenerator(struct dw_hdmi *hdmi,
 	unsigned long ftdms = pixel_clk;
 	unsigned int n, cts;
 	u8 config3;
-	u64 tmp;
 
-	n = hdmi_compute_n(sample_rate, pixel_clk);
+	drm_hdmi_acr_get_n_cts(ftdms, sample_rate, &n, &cts);
 
 	config3 = hdmi_readb(hdmi, HDMI_CONFIG3_ID);
 
 	/* Compute CTS when using internal AHB audio or General Parallel audio*/
-	if ((config3 & HDMI_CONFIG3_AHBAUDDMA) || (config3 & HDMI_CONFIG3_GPAUD)) {
-		/*
-		 * Compute the CTS value from the N value.  Note that CTS and N
-		 * can be up to 20 bits in total, so we need 64-bit math.  Also
-		 * note that our TDMS clock is not fully accurate; it is
-		 * accurate to kHz.  This can introduce an unnecessary remainder
-		 * in the calculation below, so we don't try to warn about that.
-		 */
-		tmp = (u64)ftdms * n;
-		do_div(tmp, 128 * sample_rate);
-		cts = tmp;
-
-		dev_dbg(hdmi->dev, "%s: fs=%uHz ftdms=%lu.%03luMHz N=%d cts=%d\n",
-			__func__, sample_rate,
-			ftdms / 1000000, (ftdms / 1000) % 1000,
-			n, cts);
-	} else {
+	if (!(config3 & HDMI_CONFIG3_AHBAUDDMA) &&
+	    !(config3 & HDMI_CONFIG3_GPAUD))
 		cts = 0;
-	}
+
+	dev_dbg(hdmi->dev, "%s: fs=%uHz ftdms=%lu.%03luMHz N=%d cts=%d\n",
+		__func__, sample_rate,
+		ftdms / 1000000, (ftdms / 1000) % 1000,
+		n, cts);
 
 	spin_lock_irq(&hdmi->audio_lock);
 	hdmi->audio_n = n;

-- 
2.39.5


