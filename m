Return-Path: <linux-arm-msm+bounces-14769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A6B886054
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 19:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 618211F20CC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 18:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05C81332A1;
	Thu, 21 Mar 2024 18:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L5iDk2s0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30971755F
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 18:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711044561; cv=none; b=eahqwHNp+i/PePM3UmPgnjczbpBiAbzkdTR6WWg5vnDta1Qi+ebE6g2ptWNiehDjEv42nee0Jkml2wS0vJYaMPVZE+E6szegEWIFWZX0UE0b0EtKlxtGUqF04YRMXKN2CnZrFnMM6X0bPRYJcAJ78w+mFEWss+jKn2o1YG1z/2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711044561; c=relaxed/simple;
	bh=+kvU1aAxmYiOqpNLzLV9AKHkLsr+Pg4/4guyxVu2rTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KrBSl4cCQtVbMYLxC9v4TlfX138c6o6jsNvZscCqsB5jpHoDYXbLx2e9OVVEBhQPiThpYxI6iRPVvIRoWv7YJkAls/wfBXyy3sN9yt5ReLYzWlhib2EQ7dynWlt5NkQnCmGaylSBrknj3Hex11uIwII/oPlzFyx9PrkQG2TEfsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L5iDk2s0; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso1350775276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711044559; x=1711649359; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HkajwP7ngpIx4/g/7669hjMnrAnMPQAVj88YL0Lbi1s=;
        b=L5iDk2s0x/bz+djzCTnyT9PPomVnJbv3RQUf/jJfQZ6MFr9tvYLr/HvHuAFDelqVEh
         TACImLKvnmkz1pK1VBjJkYLd822TjrGgAkDbEcQLr4SfDPZJaY8ma7xce0NYc3fO8ZYB
         7nQSpij0+XwSVOS/9CjOKQtPc9QjyRktkvtBbi04HHmcH5H2P9JeDTw4YwdeWDUQ1Tno
         peixxU0jt5NuNsWoTnFdlrz4kd+WcbwGqag+YlSIgtkECZmLS0BbGp7vBTQ/WH4hxySC
         Zi8OR2dDJ5acu6MOTxtjbFIjSYqhiynncMvs1JOnOUZvHf9UDs3pmaQfbtqk+LrFAras
         Fqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711044559; x=1711649359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkajwP7ngpIx4/g/7669hjMnrAnMPQAVj88YL0Lbi1s=;
        b=ZrCfsGVm6nirNT4X18/liJMwPYyR6W4r/6AZrWRamaJkBCMKLjQ3HwiLoq0PT/EP8u
         55u8gpWowKTpWSTX2B/M1JVVZo4PruNqM50It3l3OhdLV3U4RfDHnnyjnd+4AtS0VWAz
         mN4h4SUPQiXikpwPuR0Fqo1cW5zNxjcgeays9A16x4Ic2un4HaQzEBx1bmDwt9RfZwbh
         sVs1TRao9hMQMEj7KA3/RVBv9Kq0tBjsgNzIx14EybL3ZlnPVnh8as0YHVw0FFOZdxeQ
         fFYjiy1pj01B/ZSNqhVOuZMGCXepeKQCKIV+SL1CV5JHdARWr3VkRhP7PQ/KZ2u22pvn
         LYkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8VReoySXmUQCqWqtijtQ5Kh6Y03ID2qgXKcvPkhfsJSXJ+uGMeZs/fR2VAd1/+KT8quDoUUp9DRM305eQYy5zwsvgT0niJt7hjIROzw==
X-Gm-Message-State: AOJu0Yx1O0+DGt3ZZC3ie9WZdF119kWYo1cnhvcuxMg7VIXVlRCn0t8j
	8ySgPcWVe7kAJww/R4PgTZHvUNW3F28F02CovA+mN8zBNKlnZBIqpMAITuHAFVIbwKhmY0IDQWR
	TzUaswTvP8jY5FaG6WD+Vd0AB4LawYJ2K7XsDJQ==
X-Google-Smtp-Source: AGHT+IEgb1tC3yh3Dm97jZ9sCyMK4fU9umiqVxwlyvlLkNMpl72fRixe5DGR195Bp+bKcT7S9CZXtACGQPj4cFP6z0Q=
X-Received: by 2002:a25:830b:0:b0:dc6:ff32:aaea with SMTP id
 s11-20020a25830b000000b00dc6ff32aaeamr19005880ybk.24.1711044558949; Thu, 21
 Mar 2024 11:09:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org>
 <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com> <CAA8EJpqxkY=Bk8_iAq6Yj6VGNO2UYmF2Hm6XOeE5EhJFKUpaPQ@mail.gmail.com>
 <9bac0e8c-d14d-a759-dc02-2e38301e4ef1@quicinc.com>
In-Reply-To: <9bac0e8c-d14d-a759-dc02-2e38301e4ef1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 20:09:07 +0200
Message-ID: <CAA8EJpruKjwOoRU8UP-b__n77Z18WQpJMUWdqgry4vZsQ5-QZw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: add support for 4:2:2 and 4:4:4 planar YCbCr
 plane formats
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 19:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/21/2024 8:43 AM, Dmitry Baryshkov wrote:
> > On Fri, 23 Feb 2024 at 22:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/22/2024 3:43 AM, Dmitry Baryshkov wrote:
> >>> The DPU driver provides support for 4:2:0 planar YCbCr plane formats.
> >>> Extend it to also support 4:2:2 and 4:4:4 plat formats.
> >>>
> >>
> >> I checked myself and also internally on this. On sm8250, the DPU planes
> >> do not support YUV444 and YUV422 (and the corresponding YVU formats).
> >>
> >> May I know what was the reference to add these formats to DPU
> >> considering that even downstream sources didn't add them?
> >>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>> Full-screen (1080p@60) YV24 gave me underruns on SM8250 until I bumped
> >>> the clock inefficiency factor from 105 to 117. I'm not sure that it is a
> >>> correct way to handle it, so I'm sending this as an RFC. If we agree
> >>> that bumping the .clk_inefficiency_factor is a correct way, I'll send
> >>> v2, including catalog changes.
> >>>
> >>> I had no such issues for the YV16/YU16 formats.
> >>
> >> We don't support this too on sm8250. But interesting it worked.
> >
> > I have been cross-checking DPU formats list against the format list
> > from the display overview docs.
> > The DPU (and SDE FWIW) drivers supported NV16/61 and
> > UYVY/YUY2/YVYU/VYUY formats for ages, although overview does not
> > mention these semi-planar formats at all and interleaved YUV formats
> > are marked as unsupported.
> >
> > For reference, NV24 and NV42 also seem to work.
> >
>
> Thanks for the update.
>
> I cross-checked sm8250 format list in our internal docs to make sure
> there is no discrepancy between those and the display overview doc.
>
> NV16 / NV61 (linear) are marked "NOT supported" by DPU.
>
> UYVY/YUY2/YVYU/VYUY (linear) are also marked "NOT supported".

But all of these image formats are handled by the DPU _driver_ as supported.

> So the markings are correct.
>
> If you notice a discrepancy between our dpu formats list in the driver
> and what is marked as "supported" in the display overview docs, that is
> something we can investigate and get fixed.
>
> If you are running some standalone tests and reporting that formats
> marked as "unsupported" in the display overview docs still work, we
> cannot simply add those formats on the basis of your modetest validation
> as your validation alone shall not supersede the marking of the design
> teams as the system level validation of those formats is what we have to
> go by.
>
> The formats marked unsupported shall remain unsupported by the driver
> and QC shall not ack adding any of those.


-- 
With best wishes
Dmitry

