Return-Path: <linux-arm-msm+bounces-3361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8439803E8D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 20:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 513C4B209FB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 19:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3293174F;
	Mon,  4 Dec 2023 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bRBqh33+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741B4C1
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 11:39:07 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5cbcfdeaff3so57175797b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 11:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701718746; x=1702323546; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YTaRrGnNYWJXMSaCAkRjN5SkjpY2VkDKl0lQohgIOR8=;
        b=bRBqh33+WEasPCrXglkOCn49BOxneLpHspnV+h1wN69C1SjEIa9ZVvF/elRuMy6SzB
         7/FKOSfVChrx2/VN1RB6kNzBjYgFtfO8G3JsWaLrtpd8vXWDO0oYCMSQrI0zrnQsqtSt
         IHjOkoLTg29XwYn6QFuvvseTSuMgoeKhX/y121yhRXMcs4PnBR4MpvwfWaCYyRA7+mEP
         18NKqoLxb0F7l5ob5qN9o8PLsHfSaPLqFG8QzuMiXAzU7nay7r8qBqvCRI02+LYYC5wL
         XHo0lJm1KOuOvyrfuHOKGJcW+/ek2Sso3fQPjkz89LUSFkiwZDwZHh2FZIhEnbZMhEw8
         YRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701718746; x=1702323546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTaRrGnNYWJXMSaCAkRjN5SkjpY2VkDKl0lQohgIOR8=;
        b=WsoDKGoj4XJgWeahuyuG6clfC++opycV0cNfTTVmTGgAXw8HWS3lVZVpxo8CQohCgc
         HmZwBpF9YBGEBaYvVZ+7KFMiWaqEr7Fjv5bFb1Y75xilZAnnB3m4To3pCVvFlx4WrF77
         XtVe2eHLjtHmQldCCq7lm+Et58riFLFqHgddu0bmazlRbqFDFvZyQheJ3uKjfdCjqY/s
         hJxQINdDSNiTfWw9a/xd4Ou+DIzMZXDuDIzEhC40kQsnFJQ0GJjPvSZRfQFP4dKKgKwA
         1zmRM6ZcTNxz6coHQM0VhHbBIDr9qHvUQ6NjVHNyW0DpBEWyQkdz+PkS+nzjt59/JkQX
         /Shw==
X-Gm-Message-State: AOJu0YwW6UWdDERA1fkbzQjs2EK/XVg1jLtuaYX0Hqg4EpujRd1v8ZEg
	nkXxr6s8pTbCQUe60BuevVLHxOET2F5SVPy7B+8Cd3c47s52RzbA
X-Google-Smtp-Source: AGHT+IHnf+wIvLq0T+FY2Q4ycS6tDbC03pIpYzm4f+CmPYNLG73XmpwNsbHDjLnCXb2W1bDF/n+0HHpOQ1t0sBPlJMI=
X-Received: by 2002:a25:2cd:0:b0:db5:4e94:67cd with SMTP id
 196-20020a2502cd000000b00db54e9467cdmr3836892ybc.58.1701718746667; Mon, 04
 Dec 2023 11:39:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204171317.192427-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20231204171317.192427-1-harshit.m.mogalapalli@oracle.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 21:38:55 +0200
Message-ID: <CAA8EJpqdJFxM=Ervg6Gx3umV=K7HaprAa2RrtSjxtv_qv1VO7w@mail.gmail.com>
Subject: Re: [PATCH next] drm/msm/dp: add a missing unlock in dp_hpd_plug_handle()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Vinod Polimera <quic_vpolimer@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, error27@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Dec 2023 at 19:13, Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> When pm_runtime_resume_and_get() fails, unlock before returning.
>
> Fixes: 5814b8bf086a ("drm/msm/dp: incorporate pm_runtime framework into DP driver")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is based on static analysis with Smatch. Only compile tested.
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

