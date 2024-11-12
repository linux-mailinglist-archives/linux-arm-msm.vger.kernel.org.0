Return-Path: <linux-arm-msm+bounces-37616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA98C9C58BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 14:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43AC51F236F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 13:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7292361FCE;
	Tue, 12 Nov 2024 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HY6XVhRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBEE42AA4
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731417315; cv=none; b=jMnkKV+zoW3rBlg+ov7jV4NvAestEX4Zz0szi6HFPWmw8Rpxi+si8oIXAu82ihcSQSoPYpp8hfdGNvLp4lqe1iu8JVNMA+3RgLs3Gb89O77b4z4XVplfaYnKg5urS0trZYuAGS45uwNMb2AhaLnuzK4kuCsySh//zPOcPYIVf2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731417315; c=relaxed/simple;
	bh=WtaRJKgDEoVmddlel65SoHhMdd+VmSQDSCD/pTtFpTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rd7RmannvHPeUL5rPPk25/2Fq5qogYCVhP8a/aPjoQbypgLzomPVM4IIDnp8X2DqFjYIYBTm+VVqrUM/vpG2DUoBkG/KZgw6dQiXJsqZ+2VfadwCmMLNlHXhAubvE0SKvyiUacEc6TRvXNnZeE/px6WpMvRH61AFecrZQ+mBxUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HY6XVhRO; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e9f69cc576so41060277b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 05:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731417312; x=1732022112; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RjMFUcCJ2PMcOh++QmaV4FSg4hd5bf5ZwUL8svAZiGU=;
        b=HY6XVhRO5P6+59owMD4r00SxgV1hTOBqKbFDVAeXkyiOm4te06RL6riX/rhuJaCN/3
         OIw/ZfIU/l/XwtCewQIQCOVs9BkCtTHLZc95NEtHKAZe9ebZvjD6Igd+U0N91ujI/9tb
         OXv3bBYqj5a7BpXPAfdcAKh62+RoLKVK2WCzESgHT1qNX7ywZ1/tMcCHdzdmotWYEfiQ
         lJIW7a45b4uqwfE0F7tn/v4q6FV8pZMoJRKA/FX1x0+f+dX5ozjOAyCkgyYMoGjyUHhr
         CUlHUGM+MQ+tZeL+CzDzYFfU9+Rl3ZYElYK2b2cxvytoNOYG74qGY44SlG6LK3xUyj2B
         ihKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731417312; x=1732022112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjMFUcCJ2PMcOh++QmaV4FSg4hd5bf5ZwUL8svAZiGU=;
        b=No+gV5UaIJeVF/uRDM/YBPSfZbv1w9iJHroJ9guY+eGZDEUO60zFp5rsdfRHl2Pn9d
         ghW4ojhEKmQBl4mzgdx1k7+h8VwfyTl1AB6paMX3yPfsQNnfnWdPtA6XrcTANhw1ksOg
         BPqQfJP9izJpMGVAeOcA5xXpT6znywCuhwZxhaBafQFjLH9WGvVVv4x4kzLxouJIDz9/
         TJvmZLZOh2hmUkAh05C9gCqIZWCqsgCIduFFisGpyoG6Lhpk63LG7eh0qdrxe8VjlgsJ
         V8qE8bty1eEAxXn9nndEn4hN+9Dp8IppFEf3xOT9p1bvkmYa0u4qkh6a9gHyceEUbWi2
         Kjgg==
X-Forwarded-Encrypted: i=1; AJvYcCWVF9Cyt/mLsT5Ywoa7lewNw8OgStGXI+5jcKX75Wa60wHoQGpZYp+OhKmvqlzYRdlHFC5/xdToLt/GhDUO@vger.kernel.org
X-Gm-Message-State: AOJu0YxEMEzRIphcS5TjfrOnaown+m1sWqEWgmj1iT6PSsCw34IVvNF2
	iHFcdOWi+rz9VIdTzRgHjclTfaobDsDnyI1Z7tGlFbZkgnDFxvLKqLZQffr1L4zT/qhNW8q/6p7
	B9Jn4plirCjlhx92WPZUNE6WZzT1gs27ZTbCMpg==
X-Google-Smtp-Source: AGHT+IHXjXnnSh4cfhalObRmFjWIlKplKbXL511dM4znTgK/qAvBdvKZqt3NvA/NCChuF/Jz1MpD8Bjt8ZPwU1Hyt0g=
X-Received: by 2002:a05:690c:9b08:b0:6e3:1f02:407b with SMTP id
 00721157ae682-6eaddda0ec6mr157284817b3.11.1731417312627; Tue, 12 Nov 2024
 05:15:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112-fd-dp-fux-warning-v2-1-8cc4960094bd@linaro.org> <643d2935-65ce-4d86-9be6-c2faa1956365@quicinc.com>
In-Reply-To: <643d2935-65ce-4d86-9be6-c2faa1956365@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Nov 2024 15:15:03 +0200
Message-ID: <CAA8EJpqBouv-f-QMpZ+hrA-vF4ojhUWBn5yMqYYB9LpW0TACdg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display/msm: qcom,sa8775p-mdss: fix the example
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mahadevan <quic_mahap@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Nov 2024 at 05:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/11/2024 7:21 PM, Dmitry Baryshkov wrote:
> > Add p1 region to the list of DP registers in the SA8775p example. This
> > fixes the following warning:
> >
> > Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: displayport-controller@af54000: reg: [[183844864, 260], [183845376, 192], [183848960, 1904], [183853056, 156]] is too short
> >
> > Fixes: 409685915f00 ("dt-bindings: display/msm: Document MDSS on SA8775P")
> > Reported-by: Rob Herring <robh@kernel.org>
> > Closes: https://lore.kernel.org/dri-devel/CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com/c
>
> Thanks for the patch.
>
> I think this link has an extra 'c' at the end.

Oh.. Can you fix that when picking it up for -fixes or would you
prefer to have a clean version in patchwork?

>
> With that fixed,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - EDITME: describe what is new in this series revision.
> > - EDITME: use bulletpoints and terse descriptions.
> > - Link to v1: https://lore.kernel.org/r/20241112-fd-dp-fux-warning-v1-1-705b527f5a63@linaro.org
> > ---
> >   Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > index 58f8a01f29c7aaa9dc943c232363075686c06a7c..4536bb2f971f3b7173b8807f90c9af3e460bb01c 100644
> > --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > @@ -168,7 +168,8 @@ examples:
> >               reg = <0xaf54000 0x104>,
> >                     <0xaf54200 0x0c0>,
> >                     <0xaf55000 0x770>,
> > -                  <0xaf56000 0x09c>;
> > +                  <0xaf56000 0x09c>,
> > +                  <0xaf57000 0x09c>;
> >
> >               interrupt-parent = <&mdss0>;
> >               interrupts = <12>;
> >
> > ---
> > base-commit: ff2ce06d5e28be5ee399a2ff894d6a551c70a318
> > change-id: 20241112-fd-dp-fux-warning-c8764c93f787
> >
> > Best regards,



-- 
With best wishes
Dmitry

