Return-Path: <linux-arm-msm+bounces-27108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747F193DC86
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 02:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04A99280995
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 00:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FC1197;
	Sat, 27 Jul 2024 00:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AoWHWe68"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4016617C
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 00:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722039878; cv=none; b=U0IegJ/VXMwIVnK80YF/oAZSGg4aggHSzJzQNj2rSOG+IA3qbcRo0XThht9jKVStZm8PbOqxjMXzZ/uWAkUylekJ1RSqLpcuwFe/6Yra0dHyZC8GQak+GycWniXJRD4oWusZQh19f4QyHVBEg5v+c2Zrw0tK9l3g2C/0ucTA++0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722039878; c=relaxed/simple;
	bh=Ndp4bAkXYF/K4IQwJ7+ZYrFKk1x51BhCGMUzpEpODxE=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7E4Hw/q2o+e2k+HDy/T9r5OBzqHEr1MrSmMEYoprlzmiPkh3eVavo6Po2CG5r7Ns3Q1olL5d9BjrPhCQLDzwvPnAcBTw/m+f8ZP4HAjToUpNfKSdVW1l0fPKWuCdJjlQ89CMONnbvwNsLQ1K+JewcFkzKmMyFkJwfSb1Mi4zh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AoWHWe68; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6b7a3e4686eso7949316d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2024 17:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722039876; x=1722644676; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07ogrVS5x8lpQcrfQ9VX3T1kjP2RfniPU+x1JGxiSQI=;
        b=AoWHWe68+5YY+0+oIoHmTNw2Zv8QsJgqZc03WaOlTf54NSrl9+rI7nFJVSmsAuLCYu
         C6nviqqlDT07P990LRPCxrkn/1i8a2/qj0La9fd3klsk6xaGcdT+1WTzChOZm6ibLGTD
         brgRQVpwE1Hx4zmDcsi8/GFYu2VrWpChDquD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722039876; x=1722644676;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07ogrVS5x8lpQcrfQ9VX3T1kjP2RfniPU+x1JGxiSQI=;
        b=VYKZ8CyBXZ5v+NhyP/sXyPSey1g5lXISIPMrjoMafkMDvdsZFvchLqydCswC6SLZzD
         nkZdO+FntNh6bLH/3li1LKDLn0CEvDkzo5sFgBlA1H7KUx4YxLYrpL5Eqy5E0lLF/oa2
         0ypxZ3jkWMsb1QJHRDVaAmxKTi40ndgx94FAWFPklcaiHUx8x3LEn3BtqtP7yVJyw9iB
         t2+gsbL0ZTt96OcO+KUj29B2S9qcfNxTEdZV88DmJXpsgKQNNXP6OjnUH6rfjPuBCP67
         LWlIkrIgePBIntS7Up1FzHGI9TLUxBFdhhG2aImSqE5NQ5HZjZnoOwSjlWifjxpbEr2e
         lG0w==
X-Forwarded-Encrypted: i=1; AJvYcCVFLEBsb+YnXaCSVZqooefi6SBEnggZn9/EDSn6w2g3PDmPFPbdRhMQrD8I5uyEiSy2sbEF50n4k6EPM4MDOtZhs/foJZpMlQF/ana+4Q==
X-Gm-Message-State: AOJu0Yxi3y3NAjX21GlQ3L+DHYlk+BbKxWl67BXOIUSO1vM/Uh7/1QQ7
	h3r/4EYjXoPkvUGev7BZ3OlRSrZ3RtyRCX2KOBhuhMpYyEQk7Q5jRzce0Sjj1BBRx9FWI6ZLD7e
	1mVgxgwtTzYMMLK8MWOmNwLgk84CqT0hiPGJ/
X-Google-Smtp-Source: AGHT+IHpnZkC5VzVD/9wtOuDbyMsVbJocHHwdfZb7aYI9KRRHqHEMH/h3Uk7GOcJxPPS3XvCEOHVuSYaA8p7WV7saKw=
X-Received: by 2002:a05:6214:19c7:b0:6b5:6b1:6c with SMTP id
 6a1803df08f44-6bb55a1533dmr19000576d6.24.1722039876063; Fri, 26 Jul 2024
 17:24:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jul 2024 17:24:35 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240725220320.130916-1-quic_abhinavk@quicinc.com>
References: <20240725220320.130916-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 26 Jul 2024 17:24:35 -0700
Message-ID: <CAE-0n50mBEX98HH+5BurM-uRyzrxcPXFJ7yLg__hFJHfYjm67Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix the max supported bpp logic
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Guenter Roeck <groeck@chromium.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Tanmay Shah <tanmay@codeaurora.org>, Vara Reddy <quic_varar@quicinc.com>, 
	freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
	neil.armstrong@linaro.org, abel.vesa@linaro.org, quic_khsieh@quicinc.com, 
	Rob Clark <robdclark@chromium.org>, Chandan Uddaraju <chandanu@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Abhinav Kumar (2024-07-25 15:03:19)
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index a916b5f3b317..56ce5e4008f8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -423,8 +424,10 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>                                 drm_mode->clock);
>         drm_dbg_dp(panel->drm_dev, "bpp = %d\n", dp_panel->dp_mode.bpp);
>
> -       dp_panel->dp_mode.bpp = max_t(u32, 18,
> -                               min_t(u32, dp_panel->dp_mode.bpp, 30));
> +       max_supported_bpp = dp_panel_get_mode_bpp(dp_panel, dp_panel->dp_mode.bpp,
> +                                                 dp_panel->dp_mode.drm_mode.clock);
> +       dp_panel->dp_mode.bpp = max_t(u32, 18, max_supported_bpp);

Is the max_t() usage still required once 'max_supported_bpp' is also a
u32? Also, what is 18? Shouldn't that be some sort of define so we know
what it represents?

Or maybe none of that is required? From what I can tell,
dp_panel_get_mode_bpp() calls dp_panel_get_supported_bpp() which will
essentially clamp the bpp range between 18 and 30, unless
dp_panel->dp_mode.bpp is between 30 and 18 but not divisible by 6, e.g.
29. Perhaps this patch can be included and the max_t above dropped.

---8<--
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
b/drivers/gpu/drm/msm/dp/dp_panel.c
index 07db8f37cd06..5cd7c138afd3 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -90,22 +90,22 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 static u32 dp_panel_get_supported_bpp(struct dp_panel *dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
-	struct dp_link_info *link_info;
+	const struct dp_link_info *link_info;
 	const u32 max_supported_bpp = 30, min_supported_bpp = 18;
-	u32 bpp = 0, data_rate_khz = 0;
+	u32 bpp, data_rate_khz;

 	bpp = min_t(u32, mode_edid_bpp, max_supported_bpp);

 	link_info = &dp_panel->link_info;
 	data_rate_khz = link_info->num_lanes * link_info->rate * 8;

-	while (bpp > min_supported_bpp) {
+	do {
 		if (mode_pclk_khz * bpp <= data_rate_khz)
-			break;
+			return bpp;
 		bpp -= 6;
-	}
+	} while (bpp > min_supported_bpp);

-	return bpp;
+	return min_supported_bpp;
 }

 static int dp_panel_update_modes(struct drm_connector *connector,

