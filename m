Return-Path: <linux-arm-msm+bounces-14771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BC28860BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 19:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48112282569
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 18:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F391339AB;
	Thu, 21 Mar 2024 18:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p+0w1kli"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE76133994
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 18:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711046652; cv=none; b=S/OqXzSC3Wmewz2VI1M44rhCcTwfv2uWa4mhd8PTYuo63bzA0ObmsOGJ4r6N0YbVFYT6Z4sZRj/rnKvcazwEBa16rF8k13h+R1+yp0nzT1AEPk8TsYL510XbYKa8ZSjFL7OEBwuA8wqRjuHknDTXIk+/dOeX9ZEwnnLq70+VHWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711046652; c=relaxed/simple;
	bh=u5fKGW4UtPXjUBnXOUxN3L5LUwd2I3PF5Zxq+kv23Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HyNAMXp/cKnaUflix+GalpvCunXqgGGx29+5C/cF1X4VDOyvog+Ydk1pqy3yi69NiSSlx+jANt8Py3zKd6ppEN/o0ryCb+QKMwvuhhwGoXAxdjqcLOMgFtAoP9uQYtQbxzcyAz4umNnXgsrTguy0BfIoEUx2ydGvwQN1+JEhY9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p+0w1kli; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-609fb19ae76so14687467b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711046649; x=1711651449; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wl+oGM7xBpGJ1G8vzSX1N4Tg+wB3JNqlo4iK0nt+DCE=;
        b=p+0w1klii4/sZgJ9O8h5pPsv2VBIF0lUeEeIyWOstKHknMopVTOnjXd9vAQU4tGefl
         a+E903mqbRqZhXdli4XhKqQSl+V4pms1wdtI5+Gd7CoWTLLBOqeXytcBkZHhXiZd5+KF
         0E2Ph+osr9RmZn4K9wyUkcatt1DhXXye+7OQgALCLM2/E6Qa7t53BUV7RGx0xhZJQWcK
         FuCu5Uf9/z7JKZGOGG8+z+4NPzArwMl8LAx4dfht7HaY/CD9Yeek4KFvVcca2kG4Kl5D
         qsYOnbS5kW7t9o+tXSfSSIfGfKKk3bsc2VfFa62D3X/8iyjobIbqfIB7Duyz72MaCxNB
         Y/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711046649; x=1711651449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wl+oGM7xBpGJ1G8vzSX1N4Tg+wB3JNqlo4iK0nt+DCE=;
        b=oj1z8wzqJCw0u6dV3ouuKijxf95qlxcf1RwXU76tHHkro7OJj4WQHb8JL76iv4+LGx
         lNy5SAWLw3NANLKT/mUs7fqRNQuqM6VVv5ol36b9hZvUE9q3iRMbxNwITsDJc2dEotnn
         VwYlCOSqe3ewxsZIGHyQ8Byx3se2xoOQbvYz4okDinpPBR5oXoNPrGjLxMZt/SG/IdPX
         zK9H+tYUPzDnXzYJjLWshCcqAvp3pu7bCbxsL8RV7XltkDGLyNnPpVjQiIIIaWiAw2iq
         gWZkvuoBBwLOTc39jAc1phLPcyYKW6PN1IdtF2IhcvUU6WUnlIKGPtJqvkwrwIe7yj/G
         iGLg==
X-Forwarded-Encrypted: i=1; AJvYcCUTDiTnnrvFRuuACJCzt86evXncsQjy8QtvT22t/hPrTCCazxTPpAxz3RK9HEZv71sGnVGV4EBMUfQxJw4rpGCNLSN4nofXXPzZ4K+Yfw==
X-Gm-Message-State: AOJu0Yz93vHDGo7d/HSPvVqo8QwSOgWtDF/TPoElAKHX09DZ3eyLnGR6
	gDYDItNunCpDcGfywWSXfhQg29MQIdbzza0mVtJq/l9UtG2CeaMuk6uDyC8j045yUSbFINzopSE
	EdYhFO3M6JqXU4zdVute2Yl5hgPVplTPv0H/1+A==
X-Google-Smtp-Source: AGHT+IFe03RC3nVeodEdT7bU8JoK4NpydonqfbIUHt0GiBTobSGhc2F+x/+N2a9UtT/JIbzibPnfAA+Y9ys6bgQHi8I=
X-Received: by 2002:a25:ab09:0:b0:dca:59a7:896b with SMTP id
 u9-20020a25ab09000000b00dca59a7896bmr3462ybi.50.1711046649346; Thu, 21 Mar
 2024 11:44:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org>
 <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com> <CAA8EJpqxkY=Bk8_iAq6Yj6VGNO2UYmF2Hm6XOeE5EhJFKUpaPQ@mail.gmail.com>
 <9bac0e8c-d14d-a759-dc02-2e38301e4ef1@quicinc.com> <CAA8EJpruKjwOoRU8UP-b__n77Z18WQpJMUWdqgry4vZsQ5-QZw@mail.gmail.com>
 <0c1aab88-8e0b-5f2a-fdc9-2a9e01628fc5@quicinc.com>
In-Reply-To: <0c1aab88-8e0b-5f2a-fdc9-2a9e01628fc5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 20:43:57 +0200
Message-ID: <CAA8EJppqvV=-P4g6ADVh4_CxO13sty+sDPEE1BBg3BA629rVeQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: add support for 4:2:2 and 4:4:4 planar YCbCr
 plane formats
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 20:28, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/21/2024 11:09 AM, Dmitry Baryshkov wrote:
> > On Thu, 21 Mar 2024 at 19:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/21/2024 8:43 AM, Dmitry Baryshkov wrote:
> >>> On Fri, 23 Feb 2024 at 22:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2/22/2024 3:43 AM, Dmitry Baryshkov wrote:
> >>>>> The DPU driver provides support for 4:2:0 planar YCbCr plane formats.
> >>>>> Extend it to also support 4:2:2 and 4:4:4 plat formats.
> >>>>>
> >>>>
> >>>> I checked myself and also internally on this. On sm8250, the DPU planes
> >>>> do not support YUV444 and YUV422 (and the corresponding YVU formats).
> >>>>
> >>>> May I know what was the reference to add these formats to DPU
> >>>> considering that even downstream sources didn't add them?
> >>>>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>> Full-screen (1080p@60) YV24 gave me underruns on SM8250 until I bumped
> >>>>> the clock inefficiency factor from 105 to 117. I'm not sure that it is a
> >>>>> correct way to handle it, so I'm sending this as an RFC. If we agree
> >>>>> that bumping the .clk_inefficiency_factor is a correct way, I'll send
> >>>>> v2, including catalog changes.
> >>>>>
> >>>>> I had no such issues for the YV16/YU16 formats.
> >>>>
> >>>> We don't support this too on sm8250. But interesting it worked.
> >>>
> >>> I have been cross-checking DPU formats list against the format list
> >>> from the display overview docs.
> >>> The DPU (and SDE FWIW) drivers supported NV16/61 and
> >>> UYVY/YUY2/YVYU/VYUY formats for ages, although overview does not
> >>> mention these semi-planar formats at all and interleaved YUV formats
> >>> are marked as unsupported.
> >>>
> >>> For reference, NV24 and NV42 also seem to work.
> >>>
> >>
> >> Thanks for the update.
> >>
> >> I cross-checked sm8250 format list in our internal docs to make sure
> >> there is no discrepancy between those and the display overview doc.
> >>
> >> NV16 / NV61 (linear) are marked "NOT supported" by DPU.
> >>
> >> UYVY/YUY2/YVYU/VYUY (linear) are also marked "NOT supported".
> >
> > But all of these image formats are handled by the DPU _driver_ as supported.
> >
>
> Ok, I see where this discrepancy is happening now.
>
> So I took another chipset, sc8280xp and checked these formats.
>
> Those are marked "supported" in that.
>
> Our dpu_formats listed in the driver is not chipset specific and that is
> causing this discrepancy between the display overview docs and what is
> in the driver.
>
> I will plan to move the formats list to the catalog to eliminate this
> and prioritize that change.

Well, from my side, disabling of interleaved YUV formats is going to
be NAKed. They are heavily used by video players for output. So,
disabling them will harm user experience.

>
> Till then, I think we should stick to the display overview doc in terms
> which formats should be validated on which chipsets.
>
> >> So the markings are correct.
> >>
> >> If you notice a discrepancy between our dpu formats list in the driver
> >> and what is marked as "supported" in the display overview docs, that is
> >> something we can investigate and get fixed.
> >>
> >> If you are running some standalone tests and reporting that formats
> >> marked as "unsupported" in the display overview docs still work, we
> >> cannot simply add those formats on the basis of your modetest validation
> >> as your validation alone shall not supersede the marking of the design
> >> teams as the system level validation of those formats is what we have to
> >> go by.
> >>
> >> The formats marked unsupported shall remain unsupported by the driver
> >> and QC shall not ack adding any of those.

Ok, I have a significantly different background here. Because
beforehand my code was frequently based on rev-eng, on the incomplete
support by the hardware vendors and the frequently incomplete docs,
the argument "work" still prevails in my head compared to "claimed to
be supported by the vendor". In the end my goal was always to get more
from the hardware than the vendor has even thought about.


-- 
With best wishes
Dmitry

