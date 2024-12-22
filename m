Return-Path: <linux-arm-msm+bounces-43086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 511D69FA811
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 21:16:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B50A9165C54
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 20:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861A51A8F8A;
	Sun, 22 Dec 2024 20:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LkpIECo7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201071A83E3
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 20:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898470; cv=none; b=rJ/chP5f4rTvGwOq+GfRQCmPpbTodo7qyeXhoRgehqHgUlj8h2TA53iEyXs1bhz+eJmkO0oa3m2Cmw1D+jedHlGfP+n3YCQxCkwOR9zFUIA5mx7hW//BJ42II0yzkZF5z33EotnYXiaz8KwrzlmtTCVI1hPUx3F31hbS72Asda0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898470; c=relaxed/simple;
	bh=qIhxSu00rW2paqTbMkjcxg3yZsqhJapbbH9jI5PUDS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZOVBRz8yYklgBXABFpCHBXW/IBhjO7bLfFjC8UWf3Zx6pL484z3L7pf/lay+zg4b4YWAO0i3Q4B3b9ZiNRU9SPBu2lvDbrvdsvYQyVMvipYjrX2pVhNckmcqnTqh04yVZuqMD38eMPIaZ/Yj2+HatR1zQcQoF5lOSoPWPnv41sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LkpIECo7; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3022484d4e4so42093051fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 12:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734898465; x=1735503265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uv6pAEXMlb2D1Xni7Zr0BSfncxDb823MKd8hn8RFu94=;
        b=LkpIECo70//0O3iVY8btI4nQw0SYjHwORUt+W1eQ1qEsaIdMMr24rJtZulE34OLEDw
         t70kHjnrO3W7MhDZNcSugdHYIxRbaURP7SUuWqPylvwjiGC5IuIdZbkcPT7oxYIgFcbw
         c5Z6NxpRabIbB3sDtNwUZaLLOC6lPq2388xwaUk6KjAgJoTSmyFIiiP1k1ajpAqjEgou
         IKaXWdx3svmO39xbymlreQl+6IHgVU0tYNLEPz7I8qLMOJdg355boi5h7tueN2vTZecQ
         zGvcJvQitz8BhwF99CNaeTGuinRwu4uiEEhms1DzZIoLIJKCvI/KzyvRUPxB23MjqA4j
         DXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734898465; x=1735503265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uv6pAEXMlb2D1Xni7Zr0BSfncxDb823MKd8hn8RFu94=;
        b=U/YY9k+UpibHP0ZEgL2m+d2/RkM0kQc/NhV7THEziNBxpkbFKGTOZmTIoJldhIpGJj
         AxND/446mbf62SrzxwtpDI19qDC07wCNKnhki+vJYs2nkisMfSBSpWMCF9VYF4ebj4+J
         DaTw7CGTRQdv4dMINNJp6Rxh+mbfyTpdE5qc4A+9KC7xquR4YYs/c2zVY36Xw02BztUC
         unPJ0LF3jtO0ZKymo8aQE+suycoJylMGfyByHkxyX2IQ2tbBilvs6Djfya90370gzXxe
         KPZ5Cd0pmZFmv8LbzLJqNBFuRb7sJFcFJCDE5U71/KelSshCrdL4Vul5Yjju3r20d9zv
         wppQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgazDpunORnZ9dKUv49oiX1qOvx1/QKU+oOfPAsNHkr9ayktZvJ9PZPk49cBVDmBJ5K2jhBMyROmC1MbXA@vger.kernel.org
X-Gm-Message-State: AOJu0YzJGVw8KzdGgpGFK8hKhSjuIu+M7zpfA5ac1MSLNTkDNlIDeS9m
	h1XjhrzL6X5wcXQgafxZOGtvv/eJlnKtgmxIbD2MBbKGaYx/ACkBFxeiwEenmytPS/UxssnbYdv
	1
X-Gm-Gg: ASbGnctcnBvhKGkZWsE6Qj1kvQ7oehX9a2ThA/SOZf1mUsvOHRpkhlRcvuSkY2HpUz1
	PuLKEjWSfAEgqIVP8gT6Ty4W5a1ccsHE59DMM/ucmjSwR+Qz0rsF+8Xp4TXDffQd3Z36smzZXcT
	T0jJKVugvkmbCrVzPbNdSxnepGnIR1W1rB3lHF0VxMBnp98w1KSwhRexAR1Sry+fk+eFq+0vsDS
	9sL72gNppiTXyPnoK0Bb7tdcCIrBvWDByLzY83ftGPyOpd9JITlCARimwBIBh54
X-Google-Smtp-Source: AGHT+IFvMx9oUwYidZpjcFuW+f3GeJqEmVbBHnXKNz+ui04Y7l2GY734lcVTnwUw6IhW9wDL3e0uHg==
X-Received: by 2002:a2e:b888:0:b0:301:12:1ed6 with SMTP id 38308e7fff4ca-30468545dc2mr38358141fa.11.1734898465205;
        Sun, 22 Dec 2024 12:14:25 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 12:14:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 22:14:10 +0200
Subject: [PATCH v5 07/11] drm/msm/dp: move/inline audio related functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-fd-dp-audio-fixup-v5-7-370f09492cf6@linaro.org>
References: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
In-Reply-To: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14086;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qIhxSu00rW2paqTbMkjcxg3yZsqhJapbbH9jI5PUDS0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaHMOs89FyfUzs5h7aZBJe9LHkyOV6wBlfAB2n
 0ho1BawizOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2hzDgAKCRCLPIo+Aiko
 1fJ1B/9D/WW0K3+8cNBlIeIIYw7w3VJN+uwDm8FIOywmqXJ7BtuUQNGWlEEHwXJl/nYgsqaDxUq
 f414PLXnlnqiZV94ikjAjxSo5OxD8VYqg9ld/KP2P8eyLmlxC9Rev657UBz19LPCEiq53ATxXbu
 zZDwL/kIx0JjnHu6nTAmp2TppTdy1s8mGPtMMkSBj90+PqCx3Yj1pmWTv6JnixCJUGBZB3ILxx4
 40rR4rK1HK3pn1E/YjSZK88AA9QMdNccQw7qx2i6y6bUWl/MBu70qLMF8rAs2/P6Xgkz/LNeBO1
 mXNQeP5z/yAMWf590Nw8XMnWXmr7ZZPYLChfenl37g+/Zac8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move audio-related functions to dp_audio.c, following up the cleanup
done by the rest of the submodules. Inline functions with simple
register access patterns.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 112 +++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 166 ------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  16 ----
 3 files changed, 98 insertions(+), 196 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index a4b792624ccc444f8912eb967d722cb94f6d4087..6a6b4032548cf3298e7fa75795401ec0925d48d4 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -31,67 +31,129 @@ struct msm_dp_audio_private {
 
 static void msm_dp_audio_stream_sdp(struct msm_dp_audio_private *audio)
 {
+	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x02,
 		.HB2 = 0x00,
 		.HB3 = audio->channels - 1,
 	};
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_catalog_write_audio_stream(audio->catalog, &sdp_hdr);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
 }
 
 static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
 {
+	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x01,
 		.HB2 = 0x17,
 		.HB3 = 0x0 | (0x11 << 2),
 	};
+	u32 header[2];
 
-	msm_dp_catalog_write_audio_timestamp(audio->catalog, &sdp_hdr);
+	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
 }
 
 static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
 {
+	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x84,
 		.HB2 = 0x1b,
 		.HB3 = 0x0 | (0x11 << 2),
 	};
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_catalog_write_audio_infoframe(audio->catalog, &sdp_hdr);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
 }
 
 static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
 {
+	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x05,
 		.HB2 = 0x0f,
 		.HB3 = 0x00,
 	};
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_catalog_write_audio_copy_mgmt(audio->catalog, &sdp_hdr);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
 }
 
 static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
 {
+	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x06,
 		.HB2 = 0x0f,
 		.HB3 = 0x00,
 	};
+	u32 header[2];
+	u32 reg;
+
+	/* XXX: is it necessary to preserve this field? */
+	reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
+	sdp_hdr.HB3 = FIELD_GET(HEADER_3_MASK, reg);
+
+	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
+}
 
-	msm_dp_catalog_write_audio_isrc(audio->catalog, &sdp_hdr);
+static void msm_dp_audio_config_sdp(struct msm_dp_audio_private *audio)
+{
+	struct msm_dp_catalog *msm_dp_catalog = audio->catalog;
+	u32 sdp_cfg, sdp_cfg2;
+
+	sdp_cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
+	/* AUDIO_TIMESTAMP_SDP_EN */
+	sdp_cfg |= BIT(1);
+	/* AUDIO_STREAM_SDP_EN */
+	sdp_cfg |= BIT(2);
+	/* AUDIO_COPY_MANAGEMENT_SDP_EN */
+	sdp_cfg |= BIT(5);
+	/* AUDIO_ISRC_SDP_EN  */
+	sdp_cfg |= BIT(6);
+	/* AUDIO_INFOFRAME_SDP_EN  */
+	sdp_cfg |= BIT(20);
+
+	drm_dbg_dp(audio->drm_dev, "sdp_cfg = 0x%x\n", sdp_cfg);
+
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, sdp_cfg);
+
+	sdp_cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
+	/* IFRM_REGSRC -> Do not use reg values */
+	sdp_cfg2 &= ~BIT(0);
+	/* AUDIO_STREAM_HB3_REGSRC-> Do not use reg values */
+	sdp_cfg2 &= ~BIT(1);
+
+	drm_dbg_dp(audio->drm_dev, "sdp_cfg2 = 0x%x\n", sdp_cfg2);
+
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
 }
 
 static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
 {
-	msm_dp_catalog_audio_config_sdp(audio->catalog);
+	msm_dp_audio_config_sdp(audio);
 
 	msm_dp_audio_stream_sdp(audio);
 	msm_dp_audio_timestamp_sdp(audio);
@@ -102,8 +164,7 @@ static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
 
 static void msm_dp_audio_setup_acr(struct msm_dp_audio_private *audio)
 {
-	u32 select = 0;
-	struct msm_dp_catalog *catalog = audio->catalog;
+	u32 select, acr_ctrl;
 
 	switch (audio->msm_dp_audio.bw_code) {
 	case DP_LINK_BW_1_62:
@@ -124,13 +185,17 @@ static void msm_dp_audio_setup_acr(struct msm_dp_audio_private *audio)
 		break;
 	}
 
-	msm_dp_catalog_audio_config_acr(catalog, select);
+	acr_ctrl = select << 4 | BIT(31) | BIT(8) | BIT(14);
+
+	drm_dbg_dp(audio->drm_dev, "select: %#x, acr_ctrl: %#x\n",
+		   select, acr_ctrl);
+
+	msm_dp_write_link(audio->catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
 }
 
 static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
-	u32 safe_to_exit_level = 0;
+	u32 safe_to_exit_level, mainlink_levels;
 
 	switch (audio->msm_dp_audio.lane_count) {
 	case 1:
@@ -150,14 +215,33 @@ static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
 		break;
 	}
 
-	msm_dp_catalog_audio_sfe_level(catalog, safe_to_exit_level);
+	mainlink_levels = msm_dp_read_link(audio->catalog, REG_DP_MAINLINK_LEVELS);
+	mainlink_levels &= 0xFE0;
+	mainlink_levels |= safe_to_exit_level;
+
+	drm_dbg_dp(audio->drm_dev,
+		   "mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
+		   mainlink_levels, safe_to_exit_level);
+
+	msm_dp_write_link(audio->catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
 }
 
 static void msm_dp_audio_enable(struct msm_dp_audio_private *audio, bool enable)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
+	u32 audio_ctrl;
+
+	audio_ctrl = msm_dp_read_link(audio->catalog, MMSS_DP_AUDIO_CFG);
+
+	if (enable)
+		audio_ctrl |= BIT(0);
+	else
+		audio_ctrl &= ~BIT(0);
+
+	drm_dbg_dp(audio->drm_dev, "dp_audio_cfg = 0x%x\n", audio_ctrl);
 
-	msm_dp_catalog_audio_enable(catalog, enable);
+	msm_dp_write_link(audio->catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
+	/* make sure audio engine is disabled */
+	wmb();
 }
 
 static struct msm_dp_audio_private *msm_dp_audio_get_data(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index e9db5585c1325fe5e067526f567e39387d5a4f47..332d168811c28f5c54069db9754ecf69904d5b24 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -670,169 +670,3 @@ struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
 
 	return &catalog->msm_dp_catalog;
 }
-
-void msm_dp_catalog_write_audio_stream(struct msm_dp_catalog *msm_dp_catalog,
-				       struct dp_sdp_header *sdp_hdr)
-{
-	u32 header[2];
-
-	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
-}
-
-void msm_dp_catalog_write_audio_timestamp(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr)
-{
-	u32 header[2];
-
-	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
-}
-
-void msm_dp_catalog_write_audio_infoframe(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr)
-{
-	u32 header[2];
-
-	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
-}
-
-void msm_dp_catalog_write_audio_copy_mgmt(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr)
-{
-	u32 header[2];
-
-	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
-}
-
-void msm_dp_catalog_write_audio_isrc(struct msm_dp_catalog *msm_dp_catalog,
-				     struct dp_sdp_header *sdp_hdr)
-{
-	struct dp_sdp_header tmp = *sdp_hdr;
-	u32 header[2];
-	u32 reg;
-
-	/* XXX: is it necessary to preserve this field? */
-	reg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_AUDIO_ISRC_1);
-	tmp.HB3 = FIELD_GET(HEADER_3_MASK, reg);
-
-	msm_dp_utils_pack_sdp_header(&tmp, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
-}
-
-void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *msm_dp_catalog, u32 select)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 acr_ctrl;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	acr_ctrl = select << 4 | BIT(31) | BIT(8) | BIT(14);
-
-	drm_dbg_dp(catalog->drm_dev, "select: %#x, acr_ctrl: %#x\n",
-					select, acr_ctrl);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
-}
-
-void msm_dp_catalog_audio_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 audio_ctrl;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	audio_ctrl = msm_dp_read_link(msm_dp_catalog, MMSS_DP_AUDIO_CFG);
-
-	if (enable)
-		audio_ctrl |= BIT(0);
-	else
-		audio_ctrl &= ~BIT(0);
-
-	drm_dbg_dp(catalog->drm_dev, "dp_audio_cfg = 0x%x\n", audio_ctrl);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
-	/* make sure audio engine is disabled */
-	wmb();
-}
-
-void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *msm_dp_catalog)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 sdp_cfg = 0;
-	u32 sdp_cfg2 = 0;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	sdp_cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
-	/* AUDIO_TIMESTAMP_SDP_EN */
-	sdp_cfg |= BIT(1);
-	/* AUDIO_STREAM_SDP_EN */
-	sdp_cfg |= BIT(2);
-	/* AUDIO_COPY_MANAGEMENT_SDP_EN */
-	sdp_cfg |= BIT(5);
-	/* AUDIO_ISRC_SDP_EN  */
-	sdp_cfg |= BIT(6);
-	/* AUDIO_INFOFRAME_SDP_EN  */
-	sdp_cfg |= BIT(20);
-
-	drm_dbg_dp(catalog->drm_dev, "sdp_cfg = 0x%x\n", sdp_cfg);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, sdp_cfg);
-
-	sdp_cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
-	/* IFRM_REGSRC -> Do not use reg values */
-	sdp_cfg2 &= ~BIT(0);
-	/* AUDIO_STREAM_HB3_REGSRC-> Do not use reg values */
-	sdp_cfg2 &= ~BIT(1);
-
-	drm_dbg_dp(catalog->drm_dev, "sdp_cfg2 = 0x%x\n", sdp_cfg2);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
-}
-
-void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *msm_dp_catalog, u32 safe_to_exit_level)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 mainlink_levels;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	mainlink_levels = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS);
-	mainlink_levels &= 0xFE0;
-	mainlink_levels |= safe_to_exit_level;
-
-	drm_dbg_dp(catalog->drm_dev,
-			"mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
-			 mainlink_levels, safe_to_exit_level);
-
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 60f08fe888cb110e3fc3dfb1d763a57bd5bf47f6..9ebdc9bd865c566efb97cf0edbdcd809e5a713e7 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -150,20 +150,4 @@ u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog);
 
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
-/* DP Audio APIs */
-void msm_dp_catalog_write_audio_stream(struct msm_dp_catalog *msm_dp_catalog,
-				       struct dp_sdp_header *sdp_hdr);
-void msm_dp_catalog_write_audio_timestamp(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr);
-void msm_dp_catalog_write_audio_infoframe(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr);
-void msm_dp_catalog_write_audio_copy_mgmt(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr);
-void msm_dp_catalog_write_audio_isrc(struct msm_dp_catalog *msm_dp_catalog,
-				     struct dp_sdp_header *sdp_hdr);
-void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *catalog, u32 select);
-void msm_dp_catalog_audio_enable(struct msm_dp_catalog *catalog, bool enable);
-void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *catalog);
-void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *catalog, u32 safe_to_exit_level);
-
 #endif /* _DP_CATALOG_H_ */

-- 
2.39.5


