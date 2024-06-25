Return-Path: <linux-arm-msm+bounces-24162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D827D91725F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 22:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 141801C229EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 20:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B119F17CA05;
	Tue, 25 Jun 2024 20:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p6mj5BRc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1498517C9E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 20:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719346724; cv=none; b=NBB61a1QCH03Hpykx8or4AKfqkdHdXFq6TddgD5tWSM5MTKf5CXV28dpi1Ot5DY6MEtH4KcKYkfc8ix7RLir/xuRnV6OfYdM0teEfjcYRVjM3YU6Aeh+o2Eha1EAnKmRkRFpPTkL5rAUTyaj46qkY8T/ai4zhQDFMbvV5fcZTlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719346724; c=relaxed/simple;
	bh=oCFFyXpS9EO2My7WikIyEOWe4OKBnkUKSgmJOOWdWDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Stl4mGw2YT7tK4QAvcFdZuFi2KkS240MZoOsmUC5dcwOMNmk8jbA+ivsp+x6bE4K0h9Ps0kriW5gDdgAdD56Af6TkHJmGYcL0nedPGdfLuBIP3xJZQiqnSQnntXKmB2D0MMF3l19NUeMn5nXqtql1oXZIl5sIcin6Gz+IVVcofM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p6mj5BRc; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-645808a3294so22479907b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 13:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719346722; x=1719951522; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hl0vn1IfpeicnMOwpEfyDxO5oFF0xIRhWfGVIKpdxKk=;
        b=p6mj5BRcJLU8qmqAFv4cDljoNScjpFzFy41Mb2wMD4Dzav0fd8T8EyQzN1EvRFOGKZ
         377P9QVpEj5g/pf3OgJwxXCyIC0T8kZW+QESEVLUKT1kbzb2v8yB4xX1WPNlJhpYQU04
         gcAazYgmuFwsSPrpN8HdMD5bx7il276Y1K/zoJJhgYJjjOVrXtHQMj0D/R2Yvu8+1G27
         PsogDGsLi3YjWWByhPU9ExrP5+GzmcDJhdGjyAEXSrIvq3nGt9vwOZGmR37qp30CqN4W
         wX/VhyknH/hrK24awD85+rRfztp86Pm0byCuZjMmZKg90YmA5AtFLVX8jK6Q7K+N6Iyo
         j7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719346722; x=1719951522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hl0vn1IfpeicnMOwpEfyDxO5oFF0xIRhWfGVIKpdxKk=;
        b=bQmXfIi80KCLd3j8HupRoOdNQXM/NoFWTbe5MBFT/QNgXRTN3UwbDaFZdyt0SXAX0q
         949cwi+bYHzz5207zNvI44f1lKv5XW/0Z3Mgvjv2mT+iHKEziEIZP2xEG7KyoBnufba0
         ZGB/Dm+yv0ghh/a2mp9cM+WcAWRi0F6LSZ5ou48D1ZDqI4E7FxzYHSI/PbUWelKmEbFc
         ZviVVwYPZ2NF6216MEEsoDAi/Ajj8fWX0hs5CrQlFBjiyd6NgrRKzq/vlyY5YNLlm8bb
         qi7BQZ/bP/PLiWFMxV0elrHPZDJlJaXnVyyw9xnKfrtkzVeqYulbVpxHLjMfv2FxvTA0
         4tZw==
X-Forwarded-Encrypted: i=1; AJvYcCVwhz51V3WV9cy7RG5HZpPjFBvOaNuf8tzDsV1hkGSDvcwN530tJio74Y55MRSNm2pAGtRM826eL5zQCVpcJZexpIOt6ZnbWoSrjPdo5g==
X-Gm-Message-State: AOJu0Yys+fT+i/C8uzVu/6gg8vN4vF2EA+9Ak5pODYu0l4L+mXpRoOTE
	aeQxVlArSon9UHZbzPwiOKSPnnBTy2LVWLx9jXEOD3VQPJvD9uDqdp7T4yvoUGyH/83z3+ROLTr
	wgiUXsvOa01+hD6Z5gbrd6P3TXKmGd2ZUSJa06Q==
X-Google-Smtp-Source: AGHT+IGhh7cMGkaHnGaMvg5sqr7zzAMtsWcZCW0A35zu7AxPMIv8wJrJE/YBk35y+kSqxRG2SLUIsYgPhykOiRmUsIc=
X-Received: by 2002:a81:8547:0:b0:631:8274:1611 with SMTP id
 00721157ae682-6433dd74338mr83572967b3.20.1719346722141; Tue, 25 Jun 2024
 13:18:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org> <20240625-adreno_barriers-v2-2-c01f2ef4b62a@linaro.org>
In-Reply-To: <20240625-adreno_barriers-v2-2-c01f2ef4b62a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 23:18:30 +0300
Message-ID: <CAA8EJpqnFEkWx4hq_UDgQ9n5qNj=WjN-Td0+ELGh8hrDpBFjGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Revert "drm/msm/a6xx: Poll for GBIF unhalt status
 in hw_init"
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Jun 2024 at 21:54, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Commit c9707bcbd0f3 ("drm/msm/adreno: De-spaghettify the use of memory

ID is not present in next

> barriers") made some fixups relating to write arrival, ensuring that
> the GPU's memory interface has *really really really* been told to come
> out of reset. That in turn rendered the hacky commit being reverted no
> longer necessary.
>
> Get rid of it.
>
> This reverts commit b77532803d11f2b03efab2ebfd8c0061cd7f8b30.

b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt status in hw_init")

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 4083d0cad782..03e23eef5126 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -867,10 +867,6 @@ static int hw_init(struct msm_gpu *gpu)
>                 gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
>         }
>
> -       /* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
> -       if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
> -               spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
> -
>         gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
>
>         if (adreno_is_a619_holi(adreno_gpu))
>
> --
> 2.45.2
>


-- 
With best wishes
Dmitry

