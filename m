Return-Path: <linux-arm-msm+bounces-15265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF36C88CD72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 20:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6521829CC46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 19:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0345713CC74;
	Tue, 26 Mar 2024 19:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lIXfB8H3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B85A380
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 19:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711482463; cv=none; b=IXnD3mDVKslUS5EmY1J2zCwck1tMussbm/k9hcbDxKrCf4TVjbFnGLdXHavmvZgmtS0hVB3Q1W+ZTvH1vWIcjQ4y/DycQiGcCUcG3fBaLWX3OGBCoHR/0rxqNGLryaQzEx/unxDL8OLfK7FwBDL/kf5KheLdD3E0ZXBmUXd/tZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711482463; c=relaxed/simple;
	bh=9Hrv+yQ6ggCFqu5Jm8HZOWdy9wYvi7d9h22Bf0YsEa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8FL0V4/7nJyUum5gIaq02iP1azeO6QzT7zge2l6m5qGKDP9rIb1Pg4Lk7MiDr04PdQQ7q9XHFRXR+ACc8dZv6nC37nZEQcd/GBQ/sZL4svVsNU16p9H9i2EYyHuOTSZ20M+qR8J6MBGMIqzuFzXWxnJ8s+35JOHaZY+d9prBVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lIXfB8H3; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60a057b6601so60494817b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 12:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711482461; x=1712087261; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+qyPM89Y10g6lsVDwvjAhw3OysernPxYLdybxWGA1Ik=;
        b=lIXfB8H3N2R03ZaF8Xmsh9SO6/3MB43g8Co3QazXF85TAOHLbofwzSp7ah+0ef5cOj
         lGTTXItGvplb6qwu8Cgn5A79TjPtz+NbQqS+CAEEYSkP+XrP5RKNHoEuRgT5sw0UQAM5
         7usZgfqj70bxQePonjtLUici5YAx+g1kpEDCcDeJYQuaBEoIex5D9wTyEPMRo6jwWCj2
         9R48zuvIh6PEisXU4+jbsHX9wxcL+4Jtx2FMM7Y8QHSriRWpuA5QtaDNw0Ml9kucMN/T
         wIXMy7WyPl6GspxnUZQU8LnGFyl1jb7Kj/RybAlb2RsRX1QzQA8hBpN6vXRNviicj8PJ
         WydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711482461; x=1712087261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qyPM89Y10g6lsVDwvjAhw3OysernPxYLdybxWGA1Ik=;
        b=v16AbLnTMIOcH++m/RmuRwVhESFtwtwcRdJdxLfUyDVkSWvLD0J/jw01Kj5K4rAaIq
         KevuW1Q4Kxqijz09dp90GiLvn8cYq67wcjOcc18O8Qw4VdV2vj2pnsdD6f/suWq87ug7
         IpBlK1D68MNfzOK3wedPcxDNdURQXtchIn7LA5UDr7UXcLNdhsON/grh/XpK2nmglbe3
         DzZnFEy0t8rrKSrF0Ug5RKwHhvddLUQARiZKnm7izvZds1J6husoTNrROnRP3jpq9Dlk
         neuvbQOIe1tTzyArp/y3+1PWwnKAIiKKbgMFFPtPV0Bcj5wLXL+eNv9tcGKaoh6tZR/x
         IOAA==
X-Forwarded-Encrypted: i=1; AJvYcCWktz1Ee7Y2Y+Y9aYvFX7cIXJoPyCeURmJ+qCcOx1388Hy8dbPJiEEY4GXmKlYFDFPFNvT4OaqTOpcr+ohlBdKYRYspl6gD5Z5rSkOxbw==
X-Gm-Message-State: AOJu0Yx6EskkFFKobp+iV+o0HWlNpQDXoTsdIhGrVyg07netLX1ImPB6
	JMpOLDl1lxfnfZO2OIhZRsehCxqG++FJ2Sn0wCqE8egTJox3zJ/sgLELkjI+PY7/etNj9cxRI2D
	ESqGszL7UtIsPV5tQXEcflv6rqRifGeuYpF3QWg==
X-Google-Smtp-Source: AGHT+IEDgs+miE1gX6ZQTUPVvtQ4tAfLoH8Z/nDmvJIeTUqUSoM57Xw13la+OqnoQDXlV9aokZwVCnZHBuAHWvDS4Lc=
X-Received: by 2002:a25:aa4d:0:b0:dc7:8c3a:4e42 with SMTP id
 s71-20020a25aa4d000000b00dc78c3a4e42mr8948827ybi.30.1711482461135; Tue, 26
 Mar 2024 12:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
 <CAA8EJprTNFgKJ_3cdZz4f_LCkYFghi-cfaj3bZmYh3oA63my6A@mail.gmail.com>
 <85204b78-7b24-61cd-4bae-3e7abc6e4fd3@quicinc.com> <CAA8EJppqrF10J1qExM=gopiF4GPDt7v4TB6LrQxx5OGyAL9hSg@mail.gmail.com>
 <671d2662-df4e-4350-0084-476eb1671cc1@quicinc.com>
In-Reply-To: <671d2662-df4e-4350-0084-476eb1671cc1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 21:47:30 +0200
Message-ID: <CAA8EJpppre8ibYqN7gZObyvzR08yVbTevC6hDEDCKQVf8gRVRg@mail.gmail.com>
Subject: Re: drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error:
 variable 'out' set but not used
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	freedreno@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 21:32, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/26/2024 12:10 PM, Dmitry Baryshkov wrote:
> > On Tue, 26 Mar 2024 at 20:31, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/26/2024 11:19 AM, Dmitry Baryshkov wrote:
> >>> On Tue, 26 Mar 2024 at 20:05, Miguel Ojeda
> >>> <miguel.ojeda.sandonis@gmail.com> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> In today's next, I got:
> >>>>
> >>>>       drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable
> >>>> 'out' set but not used [-Werror,-Wunused-but-set-variable]
> >>>>
> >>>> `out` seems to be there since commit 64d6255650d4 ("drm/msm: More
> >>>> fully implement devcoredump for a7xx").
> >>>>
> >>>> Untested diff below assuming `dumper->iova` is constant -- if you want
> >>>> a formal patch, please let me know.
> >>>
> >>> Please send a proper patch that we can pick up.
> >>>
> >>
> >> This should be fixed with https://patchwork.freedesktop.org/patch/581853/.
> >
> > Is that a correct fix? If you check other usage locations for
> > CRASHDUMP_READ, you'll see that `out` is the last parameter and it is
> > being incremented.
> >
>
> Right but in this function out is not the last parameter of CRASHDUMP_READ.

Yes. I think in this case the patch from this email is more correct.

>
> Maybe you or Rob can correct me but I thought the fix looked sane
> although noone commented on that patch.

>
> >>
> >> We can pickup that one with a Fixes tag applied.
> >>
> >>>>
> >>>> Cheers,
> >>>> Miguel
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >>>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >>>> index 1f5245fc2cdc..a847a0f7a73c 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >>>> @@ -852,7 +852,7 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
> >>>>                (block->type << 8) | i);
> >>>>
> >>>>            in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
> >>>> -            block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
> >>>> +            block->size, out);
> >>>>
> >>>>            out += block->size * sizeof(u32);
> >>>>        }
> >>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

