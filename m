Return-Path: <linux-arm-msm+bounces-21052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B3E8D4528
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 07:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A13F1C20C81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 05:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8CB143C6D;
	Thu, 30 May 2024 05:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IEdHGD+2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0386143C55
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 05:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717048648; cv=none; b=jW2Dm+OG2WHJoBQjPvYMyJEhVJLteGQlvO6Iet2n1WFI+vwojz1fRs5lbzLQ9j44xlYTdwmdkCdcDg/Ra3bs6sjT4MF0R8/pC2SKH9lDU7Xfy08vuJ8YO1vES48jisPZIvXVO+BGA3XQIJYEZNZWUA2sNyaw+YH9kU2qknPVYZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717048648; c=relaxed/simple;
	bh=fsj0LfGmZGrMirh5/lmyws+9O9/Swv/loQwtSsYXUP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gpRKYRsxJMRwxS9m+FjQ0B5K59tlfkYQ0/HRn7SJ0K8CZVpFruscAK14L1Ip4jtH4mPG2kqUNYdZj+uIDhEkq9sqCLj7kNf+I+T3pOpO+NzgVK6LrC84PbQ2A4BcfBaEFsQSeJOPqUOrasdgkSbEtqld9f+LMlyh1oTJ7mT9CJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IEdHGD+2; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-6c104f64ff6so77702a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 22:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717048646; x=1717653446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxS9ek92+KO+qEWEmGFZ/YwqXrV35uXXPCm3VPv7hfQ=;
        b=IEdHGD+2L9wudvynetjTHAvO4eMAMX3+vylzZAVPjMsTB24OZJQEZe/w4m0B6sctlv
         ahnpdxkRR7DGlsXfsyQGTHUfJ4qk54CAbPhrqdOCs6QxZnrNMCzJY1r/90lMoAdSlQb0
         qzj1WQ+5vKMvCdAOdopsevSk6dlU/9Sf5s2olsvPm1eqWrlkjIOVEjjhRaGAa1svi5FO
         l/Thry1F1fNKhwxUC+J5amZsghuuswwHrHghLem9AiH65c41GC0Op1DkIp5DA5+dboPK
         ZPJpCJ9Ch3OwXyJXXKFQG7G42BmHoBvAEwpXV+tRvY9NJaytT6WBJCWxuQyqUBOWHwfU
         5HPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717048646; x=1717653446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxS9ek92+KO+qEWEmGFZ/YwqXrV35uXXPCm3VPv7hfQ=;
        b=vXfB1LWi/Py0x5dt0Ckm7L+/S9zHnCspIvjnDp0WhdvVDA9AWqCKk+LnRpvTz4oOAU
         pNxgIiIQUT2sF+gpMWhGzu40IUpcXS0FG9xjoW+zssTgXF2ZtFqxkEWhNP21FMH8dutB
         +dv4aTfG3iPsEN/JLYUxmuAqhBF9z2+uda1n0gqjKKVlKGkpVqfT5/3iAXOnltlE2Hih
         mYkQ55XF1oDV122ao3bSKX08CXlcDzRltKh52c60KnwNYz1j/nCfm/RkFxAVwvc5TvbR
         tn6cLp3PGkMhrAL4mEP7XbkAphzznZN/LXvEM+Z9LOPOruKRP+e4aLgz28GRs31yC4Yc
         D7gg==
X-Gm-Message-State: AOJu0Yx1WSUXq7jtXkB295i0zX/bfBVbg0/G3P9LFVXG0ycjclna66XP
	o0Qn/UfPdyMa4kJX1i45k2iqyJEBm5MGTAlIH4vUCfdDLSuwKvXE62Zi3xYI1DU=
X-Google-Smtp-Source: AGHT+IFufGvvP62MCAdjZ2K0L1xe/kz4yKxYfx73uVVqFuErqy87bIy2B4aFq+uHFwpqST5ep/1qOw==
X-Received: by 2002:a05:6a20:7293:b0:1b2:c64:7b3c with SMTP id adf61e73a8af0-1b26451647bmr1370632637.7.1717048646289;
        Wed, 29 May 2024 22:57:26 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c75ffc6sm110006705ad.9.2024.05.29.22.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 22:57:25 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 30 May 2024 13:56:48 +0800
Subject: [PATCH v6 4/6] drm/msm/dsi: set video mode widebus enable bit when
 widebus is enabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-4-2ab1d334c657@linaro.org>
References: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
In-Reply-To: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717048617; l=1857;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=eBWvrCJe+PE1pKdk//cdtjIjLgQlT+4h+UpZHIX1w78=;
 b=0YTnx58R0AaK23OPv7vnpJGxBdEo6QluOSapKQTN6Ffufhsa6eDy3jbKLRAgwvoQupXLNKimb
 HbZtLiak/hNBAwpnA8l0pboHc0ma5rXkuax+ifOKbNoDqRwS5MAX/7o
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

From: Jonathan Marek <jonathan@marek.ca>

The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
driver is doing in video mode. Fix that by actually enabling widebus for
video mode.

Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a50f4dda5941..47f5858334f6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -754,6 +754,8 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 		data |= DSI_VID_CFG0_TRAFFIC_MODE(dsi_get_traffic_mode(flags));
 		data |= DSI_VID_CFG0_DST_FORMAT(dsi_get_vid_fmt(mipi_fmt));
 		data |= DSI_VID_CFG0_VIRT_CHANNEL(msm_host->channel);
+		if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
+			data |= DSI_VID_CFG0_DATABUS_WIDEN;
 		dsi_write(msm_host, REG_DSI_VID_CFG0, data);
 
 		/* Do not swap RGB colors */
@@ -778,7 +780,6 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 			if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3)
 				data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
 
-			/* TODO: Allow for video-mode support once tested/fixed */
 			if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
 				data |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
 

-- 
2.34.1


