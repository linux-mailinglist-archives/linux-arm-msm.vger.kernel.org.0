Return-Path: <linux-arm-msm+bounces-43957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 669FCA01E03
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 04:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C1A97A1C93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 03:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4097586335;
	Mon,  6 Jan 2025 03:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="glagEf5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4C43D69
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 03:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736132875; cv=none; b=Vfuwlpe2qn++XD539wOVpIUnXa3bo+eOBkKbLeonX05xRIV59ieYCaJTNd++/WkDpDBVNvY1GPkS7OE060U4P/jjNWsj0/t4Wse4aJii1xsTfkCWP1cF5z0XN0bDA6zHGGXoWa32ve6my4CTsp/PlNHHf10vA76L363TaEV2pMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736132875; c=relaxed/simple;
	bh=KJrUekUQHpsltHpQlGGp+aa7hsu1HP/5xOuInMxMEys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dpPJLRWQovxOFW3u08+bw/5e3GfCFm3HOGLNnxmX+0b9G7l28Y0csNPWD+7V4Z03NqmS/EYU7mjF+aJ8GueuF7F0t5T6phRXmwHsznTSmpfH1YJEymj540dkOBpEm+7ufCfWWbtgk5T/BGClTcgrHgsYwCkif5GjP3Fk37VDr3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=glagEf5A; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401c52000dso15654142e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jan 2025 19:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736132871; x=1736737671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5CrB3VVs4RubiecuAESwKhvETynOyoovj9hYHIh994=;
        b=glagEf5AF8eBzO7gG0XoqytG0F9jRE2BaW4TXro3NrDFpSHVvGge8J7gkspI8cJ8+d
         LS5Yfib1JQ/kbFiRcn3/qZ9YnypmS4Sa8PBLuJ7qbt6SuK7L2G2QLll/+kH9iSS2R/5z
         N3DKuJkqAuCH+hjA/nVI3Ds7ZvwsGasTfgyAjel+FrsxYx1iDW63RYSoHy2JwfR2VITe
         +pGRM4hG0pg4Lmx2tYK936c9p8S+FkIjNfw5G9Jyhm20IZAZvUkV/gFy1hpvj1/PNXcJ
         0LakpsW59lzZ3MlUNELHOCGNIsoavNK7O0rjN9jGK/DgAdofbepOGHcDWQJjebBfFuAr
         ggaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736132871; x=1736737671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5CrB3VVs4RubiecuAESwKhvETynOyoovj9hYHIh994=;
        b=iGWoByhaSd+qMif2nuxAZWpIABC+2324BIrS7NuekLqam3xVqlM2jtptZ6W/K0w6qJ
         QY9cpQYtmIyGCOA6npty92m+HJcOr2DXSiqxHDsJja9BzoMYQk27UjWtBqa9lsbMw5Va
         Fi8DrvGCBXzfCAX958TbShcrzgYm99ZTBJu1vzXjNDLkOKMW3OVy87PepaXP7zjBW3Vk
         8yJEj1bNXCWhI4hx7niBSwXQuhCr/bIhV8/ah3nHuMur4HSJNL9qBy56JPYxe+wJ1gGn
         745itbl8t/MOVPvtD/50mrRj3uhhgacXrgtp2yeJSmMjD5taGvIS6ym4ioRKMJ6N/G6F
         k6ow==
X-Gm-Message-State: AOJu0Yz6KNvj/0SBLVkXguGNXn53AHGWsSdho+TeEjhiIXBlnJ4lgcMT
	TSYker/U7ULYGHhW8hXNq36zyTiZb1GrjwhmP7Kat7OpGnGXTwPEXC2Nm52ZT/uwm5Hwi2rECSm
	xo/A=
X-Gm-Gg: ASbGncsrZHMD+pEQYAEQEPJ+H8BitzgRn5y6XscP3oRo2t1cWGoSYp+wCOWQMvy6cCQ
	HO/GBsPLtaU5dRwnA4JZVfoePEVXa8yqeuCP381R/Nm0RnGtORjaGMlDShvEc4IoVrnKaL+uwIJ
	xkO+fiQwY8rGCdMWNpIoxb4Jp4iBCZgdWhHmdiKLTKMz3iMZEXSs/9clSm3RFuV8MFrraKO4JH2
	tCYBlMeHL+P3yuFg3elmHdYpESAKWIuOgQuMtEHJVCFnTHfqCvGUTQOCX/5iiXk
X-Google-Smtp-Source: AGHT+IHzx6/+7iGF1P0U7GWJ28wdjB2danjMCVHHo/L2A4YNnr8iSGE26LZqT4t39m0vn1B4eunyiQ==
X-Received: by 2002:a05:6512:3352:b0:542:2972:4dee with SMTP id 2adb3069b0e04-54229724e2amr12217322e87.46.1736132871412;
        Sun, 05 Jan 2025 19:07:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 19:07:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:39 +0200
Subject: [PATCH v4 5/9] drm/msm/dpu: also use KBps for bw_ctl output
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-5-00b248349476@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KJrUekUQHpsltHpQlGGp+aa7hsu1HP/5xOuInMxMEys=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j5AyXKui86uo80O6nJIzR09aronJqlcaPRc
 n3a4bydiG2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+QAKCRCLPIo+Aiko
 1Q51B/9LaocYG/L2mMpfx5wBR3PisMBgyCmDdcxoHwEvhA7kQT/cQWQz70Bj2xpCVxp7gb0vJ6d
 aFdgE4IQyA2z9UDFRsX1i/Ti+S2kfW+0IgI7onaWQpH5Ec1PgIRTOAW5rGCc5UuMTTyfomkN0nA
 COg0eejJV5sMHcx5I6W5EXU7F4AmT7L0yvYYoZI91hCCsTfg36p00MzUdtqn/4MB3CvrIrhDVXQ
 v+28+lOWN9DcMKnhOXz8BO9kE2n/ZGGd+pTkB7g8OM+yiTGRTQerVBFzIUN7w8VokmNosPutKl7
 g03NputU4t+ibPynj6fsWAEHOS0FiHBnoTwJvoEQiGg6GD+1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Change debugfs and log entries to use KBps / u32 for bw_ctl and similar
data.

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


