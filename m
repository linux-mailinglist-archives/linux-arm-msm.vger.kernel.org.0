Return-Path: <linux-arm-msm+bounces-42273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A57219F26CA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 23:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E2DC1885764
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 22:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9699E1CB501;
	Sun, 15 Dec 2024 22:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dBAACbM5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035301C4A2D
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 22:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734302663; cv=none; b=npiJd+V4pRW0NUdWRxzu6e0zqAsfhgmLCKB+DoGptJ6XTKuCi4h3LOz7Coow75n7JPvZZCUkxScnGh/8ckekSXzkBGAZib6kGdjv8lc/+7JOF868iIoP6Soywk4eGlG947u2IVLstbvXzv4PhiSes4SAoQUw9O8OquDjRjSdIZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734302663; c=relaxed/simple;
	bh=zZAoMMPsb9fb/oDQ7+LF8Eb34eAsmWspMbb/qgrfju8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZAQlHDHBjUQwlEJ1rO2WtACudbH1er0iJpfJGPEwOLBTOSOtns01PVZkYK9zP3PYFz+2EbVGuvXHY7RLP7bEsgbSy8RWDl4dUwm/HMHC2ytDgjFJ38BrpflR6g0bPXMKMzcKJlm3kvf23tW6ApHvFX3J1W7Ab13sKerfgsRFMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dBAACbM5; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-300392cc4caso43250541fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 14:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734302658; x=1734907458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfNu0dNr6gNc7ZyMNRFRl6r61F4MYMcTmAPmZwUXsJY=;
        b=dBAACbM5YxRskHduPwJ0rpyO2PyKq5j+W7UwRWsKnVXVGblhhPXUKgSlaFeY9adVqA
         sFwAENbiZs/DvnwSdnIRDwXVieQHTj3/IltQO4/JIemYbb/uIXaW42k0eAy6fPomRybl
         u9uVmY+zsWQcUCfdLShcNVXaCGGvwlpHdpDcCEvCG3OcXYnhQZVW9zQVbQwf8zQWVsC4
         Z34+3pK5g92DD1428MD/b4jg8kCqfmVpoA7Ehmq2Ufiz+GGFjD1ZjTjLs3loXPlL2dSL
         s/npON+eRoCfgURH4w/gGwEI2jYRka7Ktm+hTYlvud5Hy8skK7gAWySJizY8zrP9ESot
         Q29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734302658; x=1734907458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfNu0dNr6gNc7ZyMNRFRl6r61F4MYMcTmAPmZwUXsJY=;
        b=iDli2vf2J5+A/ugGy/VJwPO2OSZu9Rznv0GJddISzNF3m6qBQZMm+c3LLHj3dTBlIq
         9MPb/qCmIDnbMsJZVoLMoeq4tONHD1nkTsNqmm2rs88x59aR5tr6btil8ceST83uhhAT
         pvaz4kPa59VVtWltMJDeqB2A9f2TOE8JPJtWVBa+LkH2xN4pY7Jdu/WkWHFxm9BynSCL
         ym9T5wDiYzNNDFyhlRZsFMW8PhPm1fFHQHy6XIeyZ+MVruIZmIEUoRItZZzT3+hw4UOH
         Ssc8B5rJ7ZLtqYs0Ca18C/v68u5y4O2i0vg9sRHXCxwtcQcAXkEpPCDdB+WmiCX6dE3R
         JcUA==
X-Forwarded-Encrypted: i=1; AJvYcCWRthXC3UGW/XjA16XICF6mHl4pxl0njDlautHKqv1Wq/bWSNoZrOBDHaxwXoctZWY5OcvANDT91Dec3ee9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3fGT9nPu/c/RwIwCTFxlamRytFErabjhIPB9DlpKOI4NNR3vV
	XLapQJsbLnSdprVDuUvPYrZoRoCsJF0zXtRGD99bPwi/PUZT7moN+O8DQkyHBAg=
X-Gm-Gg: ASbGncv9F9ScHH5y44o7cNlt/gFHzVwdnyrF5UOaZJy2DSaDL7MetA8s/juQKaq0Z6M
	g1WrHKsn0JibnFdTjrbRRd38L8dP/UpxmGoS7KOMnOCxY2enyUhlwZ+OywsXEJCxuTc4gGLTROP
	dQZUUyoFVU6ooo8Tcb5c0pzi6G8UYA290PPfLtiURbZ8B3JVufh8czP4whAD/T2e4zceCm2IxDt
	xTpNUuFpiQBQnhupPXM4D4nijZtuOFG8+8Ga3XvPjP7qFaKP8dUgr8Uddo/O+bV
X-Google-Smtp-Source: AGHT+IF9LwmKsxrRntIBEldp7Bijki6HAvjE/sqlfZG2FJkXPK0+FP4QMXW8DXTFjYmKq7QxUaSxzQ==
X-Received: by 2002:a05:651c:54a:b0:300:2848:fc7f with SMTP id 38308e7fff4ca-302544f93abmr36413641fa.25.1734302658099;
        Sun, 15 Dec 2024 14:44:18 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441a41d1sm7201701fa.100.2024.12.15.14.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 14:44:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 00:44:07 +0200
Subject: [PATCH v4 02/16] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fd-dp-audio-fixup-v4-2-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15188;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zZAoMMPsb9fb/oDQ7+LF8Eb34eAsmWspMbb/qgrfju8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX1u5TwuQ3amRfpEpvPRxw+KJuZGrZ8KSHosNv
 zQhgLPFP9uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ19buQAKCRCLPIo+Aiko
 1ST0B/42Hpd9NlyS95eb7PBhy/HjkrlUc578i7vTzoV4+wwO8hgbmNySWlt/D0G56j+WA8Z+YZK
 UeQzBQKuG/lGB5aCfooaPLnyPtK0537p0yYhnQ47SA5ywXCLru5TVu4enQ5ldGDUeVQJi0WjaYN
 3Q/f1zixMFUcsa43gMvdFRZc/aMOcKGfhYkk8Dy71kfWLc7T7gYfOJXVsODlHGwtopM4CsBAdL+
 40lHnHRJ6InChSgsOsTOdMPaFhUPxxvZvgcRPnyP7A5SP0p4xjrYdZj2ONf99fgrrldNM8I/+/+
 RnTdQmg5CqJpkp55sABfpav9roPo4y0qnDAbeQ9TuXV/JOOX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
to program audio packet data. Use 0 as Packet ID, as it was not
programmed earlier.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 268 ++++++------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.c |  71 ++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  10 ++
 3 files changed, 122 insertions(+), 227 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 5cbb11986460d1e4ed1890bdf66d0913e013083c..46fbf8601eea8e43a152049dfd1dc1d77943d922 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -14,6 +14,7 @@
 #include "dp_catalog.h"
 #include "dp_audio.h"
 #include "dp_panel.h"
+#include "dp_reg.h"
 #include "dp_display.h"
 #include "dp_utils.h"
 
@@ -28,251 +29,64 @@ struct msm_dp_audio_private {
 	struct msm_dp_audio msm_dp_audio;
 };
 
-static u32 msm_dp_audio_get_header(struct msm_dp_catalog *catalog,
-		enum msm_dp_catalog_audio_sdp_type sdp,
-		enum msm_dp_catalog_audio_header_type header)
-{
-	return msm_dp_catalog_audio_get_header(catalog, sdp, header);
-}
-
-static void msm_dp_audio_set_header(struct msm_dp_catalog *catalog,
-		u32 data,
-		enum msm_dp_catalog_audio_sdp_type sdp,
-		enum msm_dp_catalog_audio_header_type header)
-{
-	msm_dp_catalog_audio_set_header(catalog, sdp, header, data);
-}
-
 static void msm_dp_audio_stream_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
-	u32 value, new_value;
-	u8 parity_byte;
-
-	/* Config header and parity byte 1 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
-
-	new_value = 0x02;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_1_BIT)
-			| (parity_byte << PARITY_BYTE_1_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
-
-	/* Config header and parity byte 2 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
-	new_value = value;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_2_BIT)
-			| (parity_byte << PARITY_BYTE_2_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
-
-	/* Config header and parity byte 3 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
-
-	new_value = audio->channels - 1;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_3_BIT)
-			| (parity_byte << PARITY_BYTE_3_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
-		value, parity_byte);
-
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
+	struct dp_sdp_header sdp_hdr = {
+		.HB0 = 0x00,
+		.HB1 = 0x02,
+		.HB2 = 0x00,
+		.HB3 = audio->channels - 1,
+	};
+
+	msm_dp_catalog_write_audio_stream(audio->catalog, &sdp_hdr);
 }
 
 static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
-	u32 value, new_value;
-	u8 parity_byte;
-
-	/* Config header and parity byte 1 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
-
-	new_value = 0x1;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_1_BIT)
-			| (parity_byte << PARITY_BYTE_1_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
-
-	/* Config header and parity byte 2 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
-
-	new_value = 0x17;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_2_BIT)
-			| (parity_byte << PARITY_BYTE_2_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
-
-	/* Config header and parity byte 3 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
-
-	new_value = (0x0 | (0x11 << 2));
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_3_BIT)
-			| (parity_byte << PARITY_BYTE_3_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
+	struct dp_sdp_header sdp_hdr = {
+		.HB0 = 0x00,
+		.HB1 = 0x01,
+		.HB2 = 0x17,
+		.HB3 = 0x0 | (0x11 << 2),
+	};
+
+	msm_dp_catalog_write_audio_timestamp(audio->catalog, &sdp_hdr);
 }
 
 static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
-	u32 value, new_value;
-	u8 parity_byte;
-
-	/* Config header and parity byte 1 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
-
-	new_value = 0x84;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_1_BIT)
-			| (parity_byte << PARITY_BYTE_1_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
-
-	/* Config header and parity byte 2 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
-
-	new_value = 0x1b;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_2_BIT)
-			| (parity_byte << PARITY_BYTE_2_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
-
-	/* Config header and parity byte 3 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
-
-	new_value = (0x0 | (0x11 << 2));
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_3_BIT)
-			| (parity_byte << PARITY_BYTE_3_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
-			new_value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
+	struct dp_sdp_header sdp_hdr = {
+		.HB0 = 0x00,
+		.HB1 = 0x84,
+		.HB2 = 0x1b,
+		.HB3 = 0x0 | (0x11 << 2),
+	};
+
+	msm_dp_catalog_write_audio_infoframe(audio->catalog, &sdp_hdr);
 }
 
 static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
-	u32 value, new_value;
-	u8 parity_byte;
-
-	/* Config header and parity byte 1 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
-
-	new_value = 0x05;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_1_BIT)
-			| (parity_byte << PARITY_BYTE_1_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
-
-	/* Config header and parity byte 2 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
-
-	new_value = 0x0F;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_2_BIT)
-			| (parity_byte << PARITY_BYTE_2_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
-
-	/* Config header and parity byte 3 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
-
-	new_value = 0x0;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_3_BIT)
-			| (parity_byte << PARITY_BYTE_3_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
+	struct dp_sdp_header sdp_hdr = {
+		.HB0 = 0x00,
+		.HB1 = 0x05,
+		.HB2 = 0x0f,
+		.HB3 = 0x00,
+	};
+
+	msm_dp_catalog_write_audio_copy_mgmt(audio->catalog, &sdp_hdr);
 }
 
 static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
-	u32 value, new_value;
-	u8 parity_byte;
-
-	/* Config header and parity byte 1 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
-
-	new_value = 0x06;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_1_BIT)
-			| (parity_byte << PARITY_BYTE_1_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
-
-	/* Config header and parity byte 2 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
-
-	new_value = 0x0F;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_2_BIT)
-			| (parity_byte << PARITY_BYTE_2_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
+	struct dp_sdp_header sdp_hdr = {
+		.HB0 = 0x00,
+		.HB1 = 0x06,
+		.HB2 = 0x0f,
+		.HB3 = 0x00,
+	};
+
+	msm_dp_catalog_write_audio_isrc(audio->catalog, &sdp_hdr);
 }
 
 static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 6a30996200bc7fbaacd0502f096e787f754752de..8fddfe5d85d6398c6582e1f74647f4cd83f5a4d9 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -1122,6 +1122,77 @@ struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
 	return &catalog->msm_dp_catalog;
 }
 
+void msm_dp_catalog_write_audio_stream(struct msm_dp_catalog *msm_dp_catalog,
+				       struct dp_sdp_header *sdp_hdr)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
+}
+
+void msm_dp_catalog_write_audio_timestamp(struct msm_dp_catalog *msm_dp_catalog,
+					  struct dp_sdp_header *sdp_hdr)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
+}
+
+void msm_dp_catalog_write_audio_infoframe(struct msm_dp_catalog *msm_dp_catalog,
+					  struct dp_sdp_header *sdp_hdr)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
+}
+
+void msm_dp_catalog_write_audio_copy_mgmt(struct msm_dp_catalog *msm_dp_catalog,
+					  struct dp_sdp_header *sdp_hdr)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
+}
+
+void msm_dp_catalog_write_audio_isrc(struct msm_dp_catalog *msm_dp_catalog,
+				     struct dp_sdp_header *sdp_hdr)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+	struct dp_sdp_header tmp = *sdp_hdr;
+	u32 header[2];
+	u32 reg;
+
+	/* XXX: is it necessary to preserve this field? */
+	reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
+	tmp.HB3 = FIELD_GET(HEADER_3_MASK, reg);
+
+	msm_dp_utils_pack_sdp_header(&tmp, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
+}
+
 u32 msm_dp_catalog_audio_get_header(struct msm_dp_catalog *msm_dp_catalog,
 				enum msm_dp_catalog_audio_sdp_type sdp,
 				enum msm_dp_catalog_audio_header_type header)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 62a401d8f75a6af06445a42af657d65e3fe542c5..4a5591d9f82a21d7a3bb64ad6b486e39bd406cd5 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -111,6 +111,16 @@ void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
+void msm_dp_catalog_write_audio_stream(struct msm_dp_catalog *msm_dp_catalog,
+				       struct dp_sdp_header *sdp_hdr);
+void msm_dp_catalog_write_audio_timestamp(struct msm_dp_catalog *msm_dp_catalog,
+					  struct dp_sdp_header *sdp_hdr);
+void msm_dp_catalog_write_audio_infoframe(struct msm_dp_catalog *msm_dp_catalog,
+					  struct dp_sdp_header *sdp_hdr);
+void msm_dp_catalog_write_audio_copy_mgmt(struct msm_dp_catalog *msm_dp_catalog,
+					  struct dp_sdp_header *sdp_hdr);
+void msm_dp_catalog_write_audio_isrc(struct msm_dp_catalog *msm_dp_catalog,
+				     struct dp_sdp_header *sdp_hdr);
 u32 msm_dp_catalog_audio_get_header(struct msm_dp_catalog *msm_dp_catalog,
 				enum msm_dp_catalog_audio_sdp_type sdp,
 				enum msm_dp_catalog_audio_header_type header);

-- 
2.39.5


