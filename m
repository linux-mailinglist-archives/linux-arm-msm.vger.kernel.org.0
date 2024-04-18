Return-Path: <linux-arm-msm+bounces-17833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BBA8A98F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 13:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E54CB21F25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 11:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E7115F404;
	Thu, 18 Apr 2024 11:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vsNt5fbK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0DA15F3E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 11:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713440907; cv=none; b=Y4OocYRCsnUJ7mPLt9amgrvSdr75EkEylZkRGuWK88pTPKk13QrmgVkkVrvVXacEeHIKGcVpo+WC745ZrPa5q3n/0JM0MVfrCmbU8S+3RyFOKQFFvaH7qOdAUiLmja7k4+tEV4s5qzmJJ+QtbK8Wkao04e695WbSZrhlN9LGEuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713440907; c=relaxed/simple;
	bh=gE136ijLAtKzyRYGVhVe2CMoT2C2wSdXn/ajEG1GWyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpJ5/SAxQU6526Eh0KmEdi9j9sT1pVyKmvdxSglSixKBpri6Ntup1WUWZXNKomuFGsRMI/ukg/izxOeRzoeAJ7MwHWpwRCbK3ZEqlXyUdP5biz3UjnEpvSkhrsa6sHZQX8pP4ACqfj7Qcv4dMSEw3+xKSIE4h6F/2iojW+c0cpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vsNt5fbK; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso649649276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 04:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713440905; x=1714045705; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NuxTFXDlrm+BFnpHmLBiKm3zNo8+3C9CrzDgCHuzRNk=;
        b=vsNt5fbKOxQkX010Y7B0jwogqFOgePEz+AGFZqPHSmeQeVOrlEEzKl0hO76Amvsgal
         u5r3LP4eECgjWFfcpzb1WXottf2q0j0Guicou9cmWr/eMkcFlz3Z36hIRDrYna8OXzMN
         XDty0nq04+OmzrtmoYhZ3PnBC3gBPdKAS17/67qiBSZ6AsArf2a85CruazPsx075v9a2
         iPXaSOXj97eSc9qBn4xj3QeVwkAIxx1kPiilbhz9R8sw4SRMRZvC7L6/peb7gKWYXf9x
         zTvcvrjjbEC6mlaf8RAYf8IhZ8nCTHkXToozwom+fqc0YB63v43gMgkZuyL45CqI4Ruh
         V+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713440905; x=1714045705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuxTFXDlrm+BFnpHmLBiKm3zNo8+3C9CrzDgCHuzRNk=;
        b=a5vg2yYDTSN1F0gvvhsnNg4TIf6QaVvcHqDcnPt16OuFIw/365Sl8rfXoMMqh0hQzm
         42HVSFYf/j2LXLDI7hYJ+LzVS+n7cP5H3+ZgnCJa1DESzo6rWOb6y6r55kNuRdNUyljh
         IWtz547K1tXLV3v2/eqsX1fiMSMxcAln+JB8BhG2HkvLt+dCPT9iLgMhmdQ8vxAMF8ft
         Ix1ddQf7TgORWolz9SCNDuDmHZOpQO86NJnWcqPBn7d3uCqEpPp3kBu6lyp8rWy4gpHH
         Da0L9yVY34qFY8m88qqm3lDudUL3tgiaCBRvQIJMJCJdkcvA+sv4y+0gNHgRTyBsCkSM
         qAcg==
X-Forwarded-Encrypted: i=1; AJvYcCVQvh6uslReVfghiM1Sl6Cj/PYdNhg1EheNRACr8zmKvSlr53TO7y7WYHOZYwew4ONSQmMw7RqY5e5fQl0/ZVrZE6xMNX2eGRWIZ4RHcg==
X-Gm-Message-State: AOJu0YztWSqKrHyN3idDMviFb6SmNXlK1Lt0Pz6SyxaRgK6CoYgOfi3u
	b9E0kC6PV7WVPnqoex975V7d86C1XlexMSzZiVFJVe2wWwXg1Tpg8eUZYGSlJyqUuTb37rMr7Nc
	KdQim+az3dvtf7JKNjHr/Qg6wEZrmgwZJjuMsBw==
X-Google-Smtp-Source: AGHT+IGKBPlfH5drQwVfSarXKWibHJIXInY29SG6VZ1jJJB3cdumDdDbAMYX6JlD836WHkNKoYSwv0xG3WG+/ElPO7w=
X-Received: by 2002:a25:b121:0:b0:dc6:d1a9:d858 with SMTP id
 g33-20020a25b121000000b00dc6d1a9d858mr1686669ybj.8.1713440904861; Thu, 18 Apr
 2024 04:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-3-c84f820b7e5b@linaro.org>
 <hi7vzqm5ebypzs6m6bw64ghgfwsdzuaxy65jpah37iw5ww7fku@n3c5sucic27i>
 <bfd6aa32-a28e-47a4-82c7-76c5dd99a44d@linaro.org> <7ynodjzjuxwwqkjgns5jtnkckw52qyldfpsqpjh7645swva4xk@7wucftyjyyy3>
 <2b5f33ba-2108-464c-b4d2-eff2cc6e59cf@linaro.org>
In-Reply-To: <2b5f33ba-2108-464c-b4d2-eff2cc6e59cf@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 18 Apr 2024 14:48:13 +0300
Message-ID: <CAA8EJpqW-YxJdw-+QDEdhqjwAPK1dzmW1dW6=18wcRQgp+Oq6w@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] drm/msm/adreno: Implement SMEM-based speed bin
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Apr 2024 at 14:31, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 18.04.2024 1:07 PM, Dmitry Baryshkov wrote:
> > On Thu, Apr 18, 2024 at 11:51:16AM +0200, Konrad Dybcio wrote:
> >> On 18.04.2024 1:43 AM, Dmitry Baryshkov wrote:
> >>> On Wed, Apr 17, 2024 at 10:02:55PM +0200, Konrad Dybcio wrote:
> >>>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
> >>>> abstracted through SMEM, instead of being directly available in a fuse.
> >>>>
> >>>> Add support for SMEM-based speed binning, which includes getting
> >>>> "feature code" and "product code" from said source and parsing them
> >>>> to form something that lets us match OPPs against.
> >>>>
> >>>> Due to the product code being ignored in the context of Adreno on
> >>>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>> ---
> >>
> >> [...]
> >>
> >>>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >>>> @@ -6,6 +6,8 @@
> >>>>   * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
> >>>>   */
> >>>>
> >>>> +#include <linux/soc/qcom/socinfo.h>
> >>>> +
> >>>
> >>> Stray leftover?
> >>
> >> Looks like
> >>
> >> [...]
> >>
> >>>> +
> >>>> +#ifdef CONFIG_QCOM_SMEM
> >>>
> >>> Please extract to a separate function and put the function under ifdef
> >>> (providing a stub otherwise). Having #ifndefs inside funciton body is
> >>> frowned upon.
> >>
> >> Hm, this looked quite sparse and straightforward, but I can do that.
> >>
> >> [...]
> >>
> >>>> +/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin */
> >>>> +#define ADRENO_SKU_ID_FCODE               GENMASK(15, 0)
> >>>> +#define ADRENO_SKU_ID(fcode)      (SOCINFO_PC_UNKNOWN << 16 | fcode)
> >>>
> >>> If we got rid of PCode matching, is there a need to actually use
> >>> SOCINFO_PC_UNKNOWN here? Or just 0 would be fine?
> >>
> >> The IDs need to stay constant for mesa
> >>
> >> I used the define here to:
> >>
> >> a) define the SKU_ID structure so that it's clear what it's comprised of
> >> b) make it easy to add back Pcode in case it becomes useful with future SoCs
> >> c) avoid mistakes - PC_UNKNOWN happens to be zero, but that's a lucky
> >>    coincidence
> >>
> >> We don't *match* based on PCODE, but still need to construct the ID properly
> >>
> >> Another option would be to pass the real pcode and add some sort of
> >> "pcode_invalid" property that if found would ignore this part of the
> >> SKU_ID in mesa, but that sounds overly and unnecessarily complex.
> >
> > It's fine, just add a comment please. Maybe we can rename PC_UNKNOWN to
> > PC_PRODUCTION?
>
> I don't think that's right. The SoC "product code" may actually mean something
> (again, not necessarily for Adreno specifically), and with Adreno in mind, it
> being only meaningful for engineering samples may change in the future.

Ack


-- 
With best wishes
Dmitry

