Return-Path: <linux-arm-msm+bounces-3778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F008C8092C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 21:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F657B20AD5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 20:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BA210947;
	Thu,  7 Dec 2023 20:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PbTq95zo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B161715
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 12:50:59 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5d3644ca426so12643517b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 12:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701982258; x=1702587058; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GHFnN9FjnDUyIm3ImJ93WmZwuwHXaZZaOetdBgpVvF0=;
        b=PbTq95zoRmZD0Zr3XdWEkk7aWOCw88Cqs9S5pinhMf2r3ErXDzoyca2XfPu2OrVBsn
         aG+YGu+auZ73bmHd4Z3QhDSQyOnEX7kWBaMJyIgKaDRdD8WoLM+s/+xZes/2Xv8+JO9H
         O3jd8ZCeHua0+ulCEZO+u/aBbJZuEHtqD8gthdxm10+hiaXOqQStbPdVgpw8aFet/+cE
         95+5CWWg0mSL/wS2Au+tfl/k3ilqVPgGXfwR2633YEKNmxkCJncVD1dhgWjHEeo+7feY
         rKegQuMzLtodXFxCqBtvzbU/05E8Y5od+dPaXj0MCmhfMIsjOlGFoA5XUq66FN213oYb
         WAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701982258; x=1702587058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHFnN9FjnDUyIm3ImJ93WmZwuwHXaZZaOetdBgpVvF0=;
        b=m0qR5BVJOWHlIg9tKMcbmTHZqMAOehtTbPUl9iYUfcoeSNhXaqdenTWhzuUXlaJ9s/
         5qm7dLSaCmnXLBy4LMY0pW3MYQBIlq3OyrHUhfBAl+jfEnKqe7weydTpiQIppXfo6hxC
         oU1TGYWA8uPjwN3/dLrLRunAfYzxqD7iR6+MRqElxbFpkYsf8Mjc8zQKwagwPL0HFpYy
         T4nl19BXFY4TIM7rdRrjGNMHawVMujPRbLAzYUlhiidwQqi4X5/7BDxxr+4wwA8aZbPH
         2/0BFmcOpKA4k9T6KqEmYyBr56XiV9yvoh78//KkvgRD/5Hm6lVTmvVsmQOnGETBX5zR
         25jg==
X-Gm-Message-State: AOJu0YyJfX8FrC+QfSXJvWv36DYjnJC00+QnHXovMlfnqsr9WyfYjn4V
	PJTS7lgReqXXjeFeQ2kj5ZEDLGCeHt0KcR3Fup7AiQ==
X-Google-Smtp-Source: AGHT+IEA1n39KJnSZo/hJu8BTwfWY7XwZpY7hxF+ePAJ9IpCjhaqeMU1yQaNgkLu+U39JXPMy/N8smQsdJiMZkL0r7Y=
X-Received: by 2002:a0d:ca82:0:b0:5d8:96c:68e7 with SMTP id
 m124-20020a0dca82000000b005d8096c68e7mr3453640ywd.45.1701982258345; Thu, 07
 Dec 2023 12:50:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115205318.2536441-1-pvorel@suse.cz> <2bferiemkljxua63v6ogifpzhlbj6m2gycxrbitgmc3ybj2a4p@7kfnzcrjj6jr>
 <CAA8EJpoEzTeOSVy5qVCs6eSBTxWKRfDq0UzrEjz1Kx1sG9xkCg@mail.gmail.com> <644f49ae-26f0-4a4b-9a3a-53076be31d87@linaro.org>
In-Reply-To: <644f49ae-26f0-4a4b-9a3a-53076be31d87@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 22:50:47 +0200
Message-ID: <CAA8EJpqmvKQHzPtzseCJ=y0GwP5Y5H_cR4RpjU97y=8q=b-zDQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: defconfig: Enable SDM660 Clock Controllers
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Petr Vorel <pvorel@suse.cz>, linux-arm-msm@vger.kernel.org, 
	Petr Vorel <petr.vorel@gmail.com>, Martin Botka <martin.botka@somainline.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Aboothahir U <aboothahirpkd@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 21:26, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 12/7/23 19:54, Dmitry Baryshkov wrote:
> > On Thu, 7 Dec 2023 at 18:27, Bjorn Andersson <andersson@kernel.org> wrote:
> >>
> >> On Wed, Nov 15, 2023 at 09:53:18PM +0100, Petr Vorel wrote:
> >>> From: Petr Vorel <petr.vorel@gmail.com>
> >>>
> >>> Enable support for the multimedia clock controller on SDM660 devices
> >>> and graphics clock controller on SDM630/636/660 devices.
> >>>
> >>> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> >>> ---
> >>> Changes v1->v2:
> >>> * added commit message (not just the subject)
> >>>
> >>> NOTE motivation for this is that some not yet mainlined DTS already use
> >>> both:
> >>>
> >>> https://github.com/sdm660-mainline/linux/blob/sdm660-next-stable/arch/arm64/boot/dts/qcom/sdm636-asus-x00td.dts
> >>>
> >>> Kind regards,
> >>> Petr
> >>>
> >>>   arch/arm64/configs/defconfig | 2 ++
> >>>   1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> >>> index acba803835b9..10a098aa8b1b 100644
> >>> --- a/arch/arm64/configs/defconfig
> >>> +++ b/arch/arm64/configs/defconfig
> >>> @@ -1235,6 +1235,8 @@ CONFIG_SC_GCC_8180X=y
> >>>   CONFIG_SC_GCC_8280XP=y
> >>>   CONFIG_SC_GPUCC_8280XP=m
> >>>   CONFIG_SC_LPASSCC_8280XP=m
> >>> +CONFIG_SDM_MMCC_660=m
> >>> +CONFIG_SDM_GPUCC_660=y
> >>
> >> I'd expect the GPU clock controller to be a module, can you please
> >> clarify why it needs to be builtin?
> >
> > To allow the display to be enabled early enough?
> That sounds like a terrible bug in drm/msm.. Display should
> be wholly separate from Adreno.

Let me quote Rob's email ([1])

Userspace does have better support for split display/gpu these days
than it did when drm/msm was first merged.  It _might_ just work if
one device only advertised DRIVER_RENDER and the other
MODESET/ATOMIC.. but I'd be a bit concerned about breaking things.  I
guess you could try some sort of kconfig knob to have two "msm"
devices and see what breaks, but I'm a bit skeptical that we could
make this the default anytime soon.

[1] https://lore.kernel.org/dri-devel/CAF6AEGs89FRmFsENLkP-Dg1ZJN2LzCfxY2-+do9jH9b8L-XZxg@mail.gmail.com/



--
With best wishes
Dmitry

