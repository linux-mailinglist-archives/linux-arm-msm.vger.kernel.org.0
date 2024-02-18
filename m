Return-Path: <linux-arm-msm+bounces-11576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D0C859491
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 05:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B256728384D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 04:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EDC1CD0F;
	Sun, 18 Feb 2024 04:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vbuiCmd5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851F71CD03
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 04:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708229885; cv=none; b=UjLHr1qGJfkfdnLJALq1X8+11N9QO2GvJy2hAlbIRkejZb0/zXS6HmZiSXk9ac39LiyXbvOUniuZ3t4nU0aFMkS0scbjEYQ9Q1kjzvVdb3mCKFtAiBdYpUGXqU6Vv5wICGNfXTcn5vt5EAu6VKrKxopMu6gI0TV7/IMxGLW21gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708229885; c=relaxed/simple;
	bh=Lkcxnc7kQjKz5FJDXaeFm4oviG9PoQJZEi4n8rRF2Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KbziB5SNdMjVRaqzrqzBcpLFC8K9kEuw4SUOSfcczVejuXd2GEtF3/P0H9Vn0/usSUebyz0DaAVc1urOWJO6yF5f1ve3NU2pxaobxUnLtrYkZZZYV8qs0lYF8m3zDvrBK7mMVPgZADQhjgi2TW5+wCKAOub24VMPh36wUqFHG0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vbuiCmd5; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-603fd31f5c2so36317247b3.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Feb 2024 20:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708229882; x=1708834682; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EzD4Pv6p9Be8l8eNEWsH1WgYTIMlRyAnHGABnOcxnhU=;
        b=vbuiCmd5Si6VdQhhYxY2YmEU49HlBkMWg5/5GuYuZWd223UePptNE7lxSGOlbwgZYQ
         1Bc6Hiegb0qWXPaFChzUp1DLP7pLXqAjKKkw38sfIU5LiQXIkz4WRQcNvnc9MtUH+28h
         4vw1hYHf/Hj3dc28MBHk2/ht/QXwBw1q423u7GyDJeS0mSdaZkNVFGpphU1r+TOHWfHQ
         Q+wV9gWDHsRr8WUa3RYtQkQh6/JuJFlpO+9KWfONp81JQeg65Q+4W2De18XG+61zVd4F
         1mEs1pZJWV6Pecu8WTOTJRMTm3cPGeHMrI58MAkpCcQCwk65Hu2hR8qV/fCDBWa6lnCI
         vChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708229882; x=1708834682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzD4Pv6p9Be8l8eNEWsH1WgYTIMlRyAnHGABnOcxnhU=;
        b=sIN7LqOKANI/O9cwl40cQE86M9GtZzuvJOYswPtdkDsridlf25YFPgegeGKLI0RguC
         XoZszkEIpnk+djXAOFsbdPTt4lIx5NMlArou4Fy805mgnZ01E/CyVWcKetCOuNyjjM9M
         gu88BjL5sSJjqfsYrjbFk1REX3WWocldCDcuip096tGGIk5LLhZCS7vGkS7oVcPmj8yk
         t9hlwvfrMpFbsroGa7oIjTQYBhnJ6m/Z6eO8rv4KOKizotT3yelRCkD9ZV4Q7+j90GRR
         CC3r3w6uWyLRl+nUojfhhWcqQKElxieKB2KgBcFx0sa1WAcHTi1eNS4bGIbGx6g2X/Sw
         MHcw==
X-Forwarded-Encrypted: i=1; AJvYcCVtAkx2dXg5V/ONppoYXT5ITNCFtgk7yYrWqKY/yRIwq1/7TNfhvj93/PC/QO+3CuSrtjGZ1oibtbWOyCfRkSaQ2k1HlzJSYZgpvTlrqw==
X-Gm-Message-State: AOJu0YwRGYL4YaC6xZGjtWZuBWS+zWNW+10g5Ad/TT6msbNzQn4aeXQP
	uEkEkK27eWbFN+TzEyVvHRAXcHLiJgqrDPkvzVTBvsq4jyEyztLGO8XtuGZoDkItFTd7rjNdGr+
	1AsVv1f711HIm3+m46qPrjtq+Cpir1WDLiauVhg==
X-Google-Smtp-Source: AGHT+IEpgMf3VvMWakVwv7fghI9Fa7G7wYfMJAdAyHJSmdQW1S3Ff0ESfxQKn12qZsKW7JtlMbzrJ7Lgo1P4FfdpkMU=
X-Received: by 2002:a05:690c:16:b0:608:b86:7c9f with SMTP id
 bc22-20020a05690c001600b006080b867c9fmr2610027ywb.7.1708229882487; Sat, 17
 Feb 2024 20:18:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216230228.26713-1-quic_parellan@quicinc.com> <20240216230228.26713-17-quic_parellan@quicinc.com>
In-Reply-To: <20240216230228.26713-17-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 18 Feb 2024 06:17:51 +0200
Message-ID: <CAA8EJpoVFEXRCnePop20cv7vy0+=gsZ_cgdgkLSoQ0QsHjNYdg@mail.gmail.com>
Subject: Re: [PATCH v4 16/19] drm/msm/dpu: modify encoder programming for CDM
 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Feb 2024 at 01:03, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Adjust the encoder format programming in the case of video mode for DP
> to accommodate CDM related changes.
>
> Changes in v4:
>         - Remove hw_cdm check in dpu_encoder_needs_periph_flush()
>         - Remove hw_cdm check when getting the fmt_fourcc in
>           dpu_encoder_phys_vid_enable()
>
> Changes in v2:
>         - Move timing engine programming to a separate patch from this
>           one
>         - Move update_pending_flush_periph() invocation completely to
>           this patch
>         - Change the logic of dpu_encoder_get_drm_fmt() so that it only
>           calls drm_mode_is_420_only() instead of doing additional
>           unnecessary checks
>         - Create new functions msm_dp_needs_periph_flush() and it's
>           supporting function dpu_encoder_needs_periph_flush() to check
>           if the mode is YUV420 and VSC SDP is enabled before doing a
>           peripheral flush
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 35 +++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 13 +++++++
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 16 +++++++++
>  drivers/gpu/drm/msm/dp/dp_display.c           | 18 ++++++++++
>  drivers/gpu/drm/msm/msm_drv.h                 | 17 ++++++++-
>  5 files changed, 98 insertions(+), 1 deletion(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

