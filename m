Return-Path: <linux-arm-msm+bounces-2641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 841C37FE7E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 04:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DB5A2820B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 03:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22069F51F;
	Thu, 30 Nov 2023 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a7aC2mTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1916DD7F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 19:58:38 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-da41acaea52so421897276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 19:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701316717; x=1701921517; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V0GQhlWdvAUlsF/29HLus0m5tiuhwjzglUbn+n9oGmE=;
        b=a7aC2mTTjHOHUfiQ+Jt2Xk8aWo+di+zINYdh6Gd8vFqcBRA3A63NYFaX6W/uyabrW/
         BxaIFUXFj0cbM/rzli+hqjgWCGiNHjbrhsvigh8WkZzExQFCE3/8W5Lq52tD5ym/hHQn
         INHrMf7i4XqRe2eIaLztnwRo3KoqMc8o1Cvny6lO9lZo/AWE4XgfkaXci9zX6FoDkLyy
         wg/401PVs/Gp+AUE4/CYtpcUIRZVJ6ssLi1j6fY+jnRdL4U+JF4BTNcik9nQZ4JTWIGu
         /b1KrK2bXRzLaCCDZTc/bAyFwR2kw/rSn/zmwwN05EDEM3E08jssbIfBmQdfLAzwl3pP
         NkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701316717; x=1701921517;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0GQhlWdvAUlsF/29HLus0m5tiuhwjzglUbn+n9oGmE=;
        b=V3uhu8a0roOuHiwUPWrnwSJMBW+onfUfOROUypgElSDt/lAdhWtUTq0h6MzjX4Gjgo
         g87mE0ey5IbpaAVqvSGm7svWic/ZPh3bGUZ4T+WAoCWfz8Crw4jLIlDVzhWXbcEvs5zl
         Ng/6VDa9rtFIi9Kgv8BmJTgx5Q+IWMRyRrCRquz02v6PCZbqoCFnW5bJOR3e/L7prcJc
         rNJHA0Cqm33AdIzW0yrydEuq9oZiMjcT4PbKz0WFt1ASHQlTBVxiWavXFsYWyd9UcqEO
         kUmNr5J21ET2qFggjcgFekUr3U+k74Ai1LTN+cAk7MLtzopwjQj6FW7WeMSU4bWUOkDc
         OwBw==
X-Gm-Message-State: AOJu0YzOTFBhRHzF75fRjmXqzVWjz6p0NnwDSq8XkSr8R2GBTL+yFA4n
	I4UhEUsGQgzFz1C5r0Uw7bm7fIJny0jWbYASpSN0Ww==
X-Google-Smtp-Source: AGHT+IG2PaEBhAnYDfPeNn+LVRC9+yXdgkqOfxVNf6ZlTQyYG1pPuBFtF+9CCkfpn9RTCOHos08jypg4V5VeefPfJcw=
X-Received: by 2002:a25:ae8f:0:b0:da0:4576:3689 with SMTP id
 b15-20020a25ae8f000000b00da045763689mr20436952ybj.25.1701316717256; Wed, 29
 Nov 2023 19:58:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129184159.24216-1-quic_parellan@quicinc.com>
In-Reply-To: <20231129184159.24216-1-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Nov 2023 05:58:26 +0200
Message-ID: <CAA8EJpqFcT6RiLN103RVTeJ5vCq2MZuSBMwEP9Cb50eX1_HFJg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Capture dpu snapshot when
 frame_done_timer timeouts
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Nov 2023 at 20:42, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Trigger a devcoredump to dump dpu registers and capture the drm atomic
> state when the frame_done_timer timeouts.
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>
> Changes since v1:
> - Optimized the format in which frame_done_timeout_cnt is incremented

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)


-- 
With best wishes
Dmitry

