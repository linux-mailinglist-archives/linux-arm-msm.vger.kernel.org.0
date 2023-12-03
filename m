Return-Path: <linux-arm-msm+bounces-3128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB9A8022FC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 054551C20853
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FBD9479;
	Sun,  3 Dec 2023 11:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XcND2Bvh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB58D197
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:28:42 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c9b9191722so47392251fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602921; x=1702207721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7k/TcV4Cokn5QDPYijyDf1OwkI3RiXghan4g2PqQJc=;
        b=XcND2Bvh54UQmUp0MY7KcLxiaQDpDGJa9kmJ0QmCKyDfAVz6Fa48sBk3M7gIZP/ecY
         aCbk3h9JRjhPGQVLDtJMpZY2QSovxsDjNGEQnJa5QID5+mX0/xcPTDnIkhKeoKNJ6yfo
         +OA3aM0YEiY/BadniPZ7D0yCEM0Rt+Ev55KANZy18Y2erHyhkoCJsIv1eOB0+1S0sNYt
         3lKxIRurQnDFMQ2QG1ajJfkOFYdzNPXSnfj6i1jpgcXeoU/q0jvpFf5k34BhTfAXYhNc
         rwspSlYg3iDzKHn8IPXGSyJf7VC2EOGTnOpioYM10haxylmm25wLrxObooJn0XHawnYt
         PLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602921; x=1702207721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7k/TcV4Cokn5QDPYijyDf1OwkI3RiXghan4g2PqQJc=;
        b=YCdu9+eKHvADKBRjqStiF4km6T0mjJAd0b9cMeLETdIuxVFlkM5icPfymcM3Jhxi+4
         0JkLoDPXExzPmCzZiULD5THP8Cvsc+SYOWsWOa/QbOJKpC88wQltf3EzN2427Rliku79
         D04+gLIkIxz9t7xEa2qH31UbueI7d7QxgHOGvEEWc/MtPfiBxo6fCC+729dy6Ch0crKT
         JgBcz7Z+LqSFCdyOIfENPkcP9iv8oWrrGN+vBkrNM9IUE3D7EJnvt2DKeDJhudLiWiiy
         aCcfL/QCUPAgla9MPqpSNlCNUfRaa83lcZ7ceaKHsPbqA7a7rwnLX4q4lNEsJ3eQNQqu
         s7hQ==
X-Gm-Message-State: AOJu0YzavIjZbUIHF/LvzO0YvfyFrTXBNoecFtPm7AnBX6WoCmplvgMY
	BaofXFHWOPhNS8/usNICeqG3PA==
X-Google-Smtp-Source: AGHT+IGqFOCoj6Ejh31/xdT35ajIygeshLhzcKMzHS5YU2NmxWqCFUAgyHrCF7ifRWiANO1HUtNWBQ==
X-Received: by 2002:a2e:99d5:0:b0:2c9:e7ea:6d3b with SMTP id l21-20020a2e99d5000000b002c9e7ea6d3bmr1232579ljj.90.1701602921149;
        Sun, 03 Dec 2023 03:28:41 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a39-20020a2ebea7000000b002c9f70a0419sm274718ljr.140.2023.12.03.03.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Dec 2023 03:28:40 -0800 (PST)
Message-ID: <ed17e7d1-c99d-45d9-a9ba-743ccc07961e@linaro.org>
Date: Sun, 3 Dec 2023 13:28:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/msm/gem: Remove "valid" tracking
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20231121003935.5868-1-robdclark@gmail.com>
 <20231121003935.5868-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231121003935.5868-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2023 02:38, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This was a small optimization for pre-soft-pin userspace.  But mesa
> switched to soft-pin nearly 5yrs ago.  So lets drop the optimization
> and simplify the code.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gem.h        |  2 --
>   drivers/gpu/drm/msm/msm_gem_submit.c | 44 +++++-----------------------
>   2 files changed, 8 insertions(+), 38 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


