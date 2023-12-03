Return-Path: <linux-arm-msm+bounces-3129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57633802303
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57607280EB2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBA39479;
	Sun,  3 Dec 2023 11:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BGSI5Sia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F230C1A7
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:29:58 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c9f72176cfso6436111fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602997; x=1702207797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L0LyKzKnnjQNBqpZgr3H1rimZEhXmRz8udpJ0Q/WYuk=;
        b=BGSI5SiarnJ5/Uo93YilEwgGfDH90dSNtTPLzPBRTjD1IxCa5SIXKXL/nvKMoy2z++
         5pCShdlE650yiyU07S4+OX969IRYW2yG31KvgyAOercHZF9gBHYspP5xO38ZfuaxIe1N
         FQDvwzECGbPW57V0kvU4SY8taJ3CgbK4Y3R4HISVlg4jpcWALQCkCGOWTdmahI8ATSN9
         G49fO7a2gPoLOHesmBcC8A7KTO6Ut/oXqO7AagDxc08OhHh716+W9kZyKAxaUS+8b+2y
         E277eidZIqZ42HfMBP+cnW4EjFxDoO3z2AI9aFWcGecOBRgs0/gwrTG9zsfZ/s49C91E
         J23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602997; x=1702207797;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L0LyKzKnnjQNBqpZgr3H1rimZEhXmRz8udpJ0Q/WYuk=;
        b=c9bbetss122aRfX+Gj0U9M9qXfeQCLGsJPwFtsHw6fGVuBzXbHjsE2o+9W/XKmhP2Z
         hY9PhTSYw5FoNg7z3lBuSWPFkxSTClo59D/d7+EsK5JnfiJDsEDw1q+0mJZ1YbqzVAz7
         4yCz/CGFmMCencYBdmi2uN50LI9xDshdilY4LaayOqPKm+eXFimpYsR/68UMlpjb6iTg
         wVHwr18v9gNmZuPDlzJqDFZr/Z5GP0UdTxcFNSiagCTImyE9Jy9HqYM7tftf7kwTDLPV
         Ptn+bjHhpsy+Ph7F1Y4+yvxM/Nr/igxL4UnKY11OqD/SKO4oKFoMP1Pqj0OtHSV3k7h3
         yw5Q==
X-Gm-Message-State: AOJu0Yyx9R4SHBzfKl3J9Bs0si+bIzOq+tuWpyAl0Hr544RcMoupqiu+
	KtnIsFzgwJ2QcrUEGuYQE5IB3g==
X-Google-Smtp-Source: AGHT+IGTWhetex2umS/MYFjg06ukzdRjs5bcWAHhEyNkgUiBPD5J1u1F0p2cwaRW9I0sqe5Y/14uTQ==
X-Received: by 2002:a2e:8483:0:b0:2c9:dae6:442a with SMTP id b3-20020a2e8483000000b002c9dae6442amr715352ljh.172.1701602997158;
        Sun, 03 Dec 2023 03:29:57 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a39-20020a2ebea7000000b002c9f70a0419sm274718ljr.140.2023.12.03.03.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Dec 2023 03:29:56 -0800 (PST)
Message-ID: <2d5acbda-61a9-412d-bf9d-04a372c927c5@linaro.org>
Date: Sun, 3 Dec 2023 13:29:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/msm/gem: Cleanup submit_cleanup_bo()
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20231121003935.5868-1-robdclark@gmail.com>
 <20231121003935.5868-6-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231121003935.5868-6-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2023 02:38, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Now that it only handles unlock duty, drop the superfluous arg and
> rename it.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index d001bf286606..603f04d851d9 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -248,14 +248,10 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
>   	return ret;
>   }
>   
> -/* Unwind bo state, according to cleanup_flags.  In the success case, only
> - * the lock is dropped at the end of the submit (and active/pin ref is dropped
> - * later when the submit is retired).
> - */
> -static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
> -		unsigned cleanup_flags)
> +static void submit_unlock_bo(struct msm_gem_submit *submit, int i)
>   {
>   	struct drm_gem_object *obj = submit->bos[i].obj;
> +	unsigned cleanup_flags = BO_LOCKED;

Nit: checkpatch will warn here, it should be unsigned int.

>   	unsigned flags = submit->bos[i].flags & cleanup_flags;
>   
>   	/*
> @@ -304,10 +300,10 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
>   	}
>   
>   	for (; i >= 0; i--)
> -		submit_cleanup_bo(submit, i, BO_LOCKED);
> +		submit_unlock_bo(submit, i);
>   
>   	if (slow_locked > 0)
> -		submit_cleanup_bo(submit, slow_locked, BO_LOCKED);
> +		submit_unlock_bo(submit, slow_locked);
>   
>   	if (ret == -EDEADLK) {
>   		struct drm_gem_object *obj = submit->bos[contended].obj;
> @@ -533,7 +529,6 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
>    */
>   static void submit_cleanup(struct msm_gem_submit *submit, bool error)
>   {
> -	unsigned cleanup_flags = BO_LOCKED;
>   	unsigned i;
>   
>   	if (error)
> @@ -541,7 +536,7 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
>   
>   	for (i = 0; i < submit->nr_bos; i++) {
>   		struct drm_gem_object *obj = submit->bos[i].obj;
> -		submit_cleanup_bo(submit, i, cleanup_flags);
> +		submit_unlock_bo(submit, i);
>   		if (error)
>   			drm_gem_object_put(obj);
>   	}

-- 
With best wishes
Dmitry


