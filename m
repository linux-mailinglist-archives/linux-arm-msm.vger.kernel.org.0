Return-Path: <linux-arm-msm+bounces-41862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D378D9EFFDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 00:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 160BC18872CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 23:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7612A1DE3DF;
	Thu, 12 Dec 2024 23:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m/VVGfmh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751D61D63E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 23:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734045002; cv=none; b=DtLEZWRCg9pAjN24p8IaB8AhJyYret513+whAoQylfKVQGam8rkkuG1lQPsgJIvIBNwyp8vIps36mFLTzQ54jr87ihmtUiROwtCTn0cgO8+7AQaIC2ay+8PAoLRZJB0Faftie1ChBEpglpEs5KLosATgecfyz8+Yt1fRr98Zqvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734045002; c=relaxed/simple;
	bh=WHVE0/t1otvsxQeNRlbwwsP9omODFpmla3k00JB+nT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BGUpCmj7QvrFZyauj08o7MGFKZ687gXgDk7alPFPH1IZrZPXVltKuqIeIyQ0fy790w20zyAEt36t2grMU5SHLrB5boUkx+KsKUNSwp5YGheaek0u1QQtQDHx2uzjqeVa9mkZqUclT91QyCOPuaGUGqwdWygOzhSmaBDaIVAsM2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m/VVGfmh; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ef7f8d4f30so10631457b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734044999; x=1734649799; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WaleLzibxZUfAGDbUadGTT7PEq5jpDmCmSJXElnaBv8=;
        b=m/VVGfmhIJDoxB+byci2wyeyJSA6mwStWbnPX4FqTOAD3hiBi0MJiG9btIhcJBtNbd
         Q9imCHxluZZZsZNipxmLNpSKiB8e3M+baLaOz2bIBCZwmHsbteP14VV63ccHppsmRCDu
         jP3nN+2ZbykuCkfQRL+FChFg/Vt0sdn8XWhl0HwqgFlDhE/8z1JxFyl9uzfGkSXfctl0
         715oLYOeqLCZcbQulBrcmSQpl5ukD+hn2fu0hYNeF/CEaBBuc1QjDYNZh3S9bPDcU/tN
         vRIjgffxKq6Nv0yb/YwgSVnuW4qnveLHJlUXMlGpSPmgRQVOCmumiQhFDM947CVu7y46
         wkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734044999; x=1734649799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaleLzibxZUfAGDbUadGTT7PEq5jpDmCmSJXElnaBv8=;
        b=hP+zAXORnikgewHryhQe2FgKlCTQ64QQtjnX+h5riZ4X1p/piy8P64CPVKMVoeyRsb
         bWkRv4vzyKvYyhCcFvnHqZk6ZPrKcCAMmw/bThI15MWj88yXszRnBfGODHe0b6tQorn7
         Or6/3XPTyY0Gn+DIaxiF4GHKnKmDStD8Q6XYFbjfH+CIXWZsNFmZIcsf+GHLMnjDmBDS
         IiahTtw9XL0nnDWV07qjljSHAr9g29EAAgAU9ze3ostAVDKbjvTaXbqj3iCbOH03sggm
         Ci7/32yE1UjNqIdX2SYbpP4j3PSMXzBgQDvwX2q1VaA8WRnT6XtM7DwbbfIgOa7mOkEq
         Cl+A==
X-Forwarded-Encrypted: i=1; AJvYcCWBPN4fYK60EyjuuZ7yiUfNTj+0R9Xd7ZZc6xh3kLPeChgeru8VjBETaJYS7HPsyoUyL1LrpPouclgRXy00@vger.kernel.org
X-Gm-Message-State: AOJu0YzxvxOespeUoQvl8Wxf5Y474fPMqbirwwQx1az9N4jTvb32Wm2Q
	MWliRgnga4ubCmlhawlRgCCAfHOjk5vEytAXfL1UC26KCkNE8FHNkXaEJw67bjdeiN6lW9sGlGY
	ZPbMNaspG6GcAbIKN63fBNzDtwkjIFWeZ1tpClw==
X-Gm-Gg: ASbGncvgfrnTT/Uxaq15EkDdDdMj6I0E/E/7COeE6zFIM6IjGVJ27wIlnfs2lxn8cxk
	pE99EZWs8fsJ0JAuHnC+loqePgLgayQaRqutPcA==
X-Google-Smtp-Source: AGHT+IF/V/ux6X1mO6hXRsOgpRG5i2WaZY0ezUfxfN+Hfmp4+xxlK9dJwbtdQzgy6yG4fyhaFVSrL2l4czjoSGhEs5I=
X-Received: by 2002:a05:690c:6510:b0:6ef:6c57:ddae with SMTP id
 00721157ae682-6f279b960admr5713247b3.34.1734044999382; Thu, 12 Dec 2024
 15:09:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-1-0b1c65e7dba3@linaro.org> <01f84965-8a11-4d6d-99a6-b0e37240d4cb@quicinc.com>
 <iugoc25pnh5zzzr5mamutycqohj2z2255omgh3ztyoqgyjkg23@c7axf3mg5wy5>
 <49d330b8-86fe-40a6-864b-cbb28dc2f555@quicinc.com> <ab2e0099-3970-4bc8-8a33-db53609838bc@quicinc.com>
In-Reply-To: <ab2e0099-3970-4bc8-8a33-db53609838bc@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Dec 2024 01:09:51 +0200
Message-ID: <CAA8EJppefip48dAMZLLML2zoPZzVFD=29d5Nu-E1mGQpUtDvAw@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] drm/msm/dp: set safe_to_exit_level before
 printing it
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Dec 2024 at 20:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/12/2024 10:31 AM, Abhinav Kumar wrote:
> >
> >
> > On 12/12/2024 12:58 AM, Dmitry Baryshkov wrote:
> >> On Wed, Dec 11, 2024 at 05:14:18PM -0800, Abhinav Kumar wrote:
> >>>
> >>>
> >>> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> >>>> Rather than printing random garbage from stack and pretending that
> >>>> it is
> >>>> the default safe_to_exit_level, set the variable beforehand.
> >>>>
> >>>> Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port
> >>>> on MSM")
> >>>> Reported-by: kernel test robot <lkp@intel.com>
> >>>> Closes:
> >>>> https://lore.kernel.org/oe-kbuild-all/202411081748.0PPL9MIj-lkp@intel.com/
> >>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/dp/dp_audio.c | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c
> >>>> b/drivers/gpu/drm/msm/dp/dp_audio.c
> >>>> index
> >>>> 74e01a5dd4195d5e0e04250663886f1116f25711..5cbb11986460d1e4ed1890bdf66d0913e013083c 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> >>>> @@ -329,10 +329,10 @@ static void
> >>>> msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
> >>>>            safe_to_exit_level = 5;
> >>>>            break;
> >>>>        default:
> >>>> +        safe_to_exit_level = 14;
> >>>>            drm_dbg_dp(audio->drm_dev,
> >>>>                    "setting the default safe_to_exit_level = %u\n",
> >>>>                    safe_to_exit_level);
> >>>> -        safe_to_exit_level = 14;
> >>>>            break;
> >>>>        }
> >>>>
> >>>
> >>> This was already picked up in -fixes, so no need to include
> >>
> >> I have been rebasing on linux-next. Please make sure that your -fixes
> >> branch is a part of linux-next.
> >>
> >
> > Its merged to msm-fixes not just my fixes branch. I am pretty sure
> > msm-fixes is part of linux-next.
>
>
> Actually, I noticed just now that msm-fixes is not part of linux-next.
> So pls ignore my comment. drm-fixes is part of linux-next. We should be
> sending out our PR pretty soon. So you will be able to drop this after that.

Ack. Let's get it to linux-next then.

-- 
With best wishes
Dmitry

