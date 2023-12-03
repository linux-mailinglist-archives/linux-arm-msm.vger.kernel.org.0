Return-Path: <linux-arm-msm+bounces-3130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF55802308
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74C8F2807BF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FA19479;
	Sun,  3 Dec 2023 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AtyzRzEb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EC5C1
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:31:34 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c9f62447c2so7586391fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701603093; x=1702207893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=66Aoa/dxI47/obkV1zabVPwJ1McMDn3dKlFH06pxzrQ=;
        b=AtyzRzEb4QZ+WS45ATBrbQZ5eM6SxFJYgsuAfICzO2PJ3cWbJ4fk27WYGX8T7hIgmg
         Qlkwom2U6yLXRCGNxz+Tv86/fMDIgtiMnUljKJLE4TPmO7RrvizExAOwnTiE1RydNQak
         VPWosledIWhMpV+ZjoRXkU4jLh9+sYQYbyVS7j8JFZXmxd0lIO6zhMq6TAxHgXazY0ZY
         pqGHVYX72gvdRAkUgG2Wlo0m6hzrNnx4XkNTCE/D8SlpN4bkHFYQl+oQw0FsLyvqzGWP
         mUSb/IYruyQSSrx/qumVflWbqdcqjtJEvd3BBFmTuUHyFIdWK6JQLIXbjjZmnIgyy/fX
         F9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701603093; x=1702207893;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=66Aoa/dxI47/obkV1zabVPwJ1McMDn3dKlFH06pxzrQ=;
        b=kCvn39TYrbDg6aMlsvCpraUequscAI9rEYlgtchzbD33M4+cgxOkWs7Gogt6zNoPGL
         D9ZSQda1gOI5LSRrpOgvYLb8+OPrPNJOkXR4h9B6HHp5kMxP+D4qnopqr/8UhpqbF24h
         4Kd5QFYm35YZ3wXlO5cYrD9ysK+ytA11GDm5z4wTQwFcl9r85qNedj5UG5v0d2r+StaK
         T8ephWWHX2pvxtqCI0WxwVO9mcYh+XEPfvW3Rbu7jk7xBn6XgJISwO8BfGWe7Ay01T3f
         6B0+Ycfex5C+qQ5L8RLYt1dOawQ+52acwU5ysVo03+YnnXwwNewatarJChNoY92TDS25
         Oe5w==
X-Gm-Message-State: AOJu0Yy3G8/xPP/2sVfpO1k0vACLTDzu/rq+ZPTYsdP5pGISmk1nossO
	IF+Fv8reQmyTJBPTTvV5hDaSAQ==
X-Google-Smtp-Source: AGHT+IFJF2uIQw16LPEWXGCcDiQFvQy273U89PuyeeiGEbrQ5BJZQUdHrcIEp5fGZblxU+A3YEYqsQ==
X-Received: by 2002:a2e:7a14:0:b0:2ca:135:2204 with SMTP id v20-20020a2e7a14000000b002ca01352204mr194590ljc.16.1701603093057;
        Sun, 03 Dec 2023 03:31:33 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a39-20020a2ebea7000000b002c9f70a0419sm274718ljr.140.2023.12.03.03.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Dec 2023 03:31:32 -0800 (PST)
Message-ID: <ae97ebc2-83d6-4f37-9b69-6a52303b0084@linaro.org>
Date: Sun, 3 Dec 2023 13:31:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/msm/gem: Split out submit_unpin_objects()
 helper
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20231121003935.5868-1-robdclark@gmail.com>
 <20231121003935.5868-5-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231121003935.5868-5-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2023 02:38, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Untangle unpinning from unlock/unref loop.  The unpin only happens in
> error paths so it is easier to decouple from the normal unlock path.
> 
> Since we never have an intermediate state where a subset of buffers
> are pinned (ie. we never bail out of the pin or unpin loops) we can
> replace the bo state flag bit with a global flag in the submit.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gem.h        |  6 +++---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 22 +++++++++++++++++-----
>   drivers/gpu/drm/msm/msm_ringbuffer.c |  3 ++-
>   3 files changed, 22 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


