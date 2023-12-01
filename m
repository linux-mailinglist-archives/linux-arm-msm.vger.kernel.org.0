Return-Path: <linux-arm-msm+bounces-2949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C29B18014FB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D52F81C208C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 21:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3AB58ABF;
	Fri,  1 Dec 2023 21:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jpe3Spfm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD8DD54
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 13:13:11 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5d33574f64eso26377357b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 13:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701465191; x=1702069991; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qFcscOKS+KeBuJ79kHtYrcnP4y16ClEYnsDu1e9phGc=;
        b=Jpe3SpfmoO/IkH+M3h9YJTZ+uipiR14//megvLEEI5PtoilTVTcouWbFVcKhYEtQRx
         FQKYbEN3QBtk1e4nrJ+ST/nwRGxWhSRjpJCkNYr5fi5/LUYKHDucbeLHiBqRbxkq64Tt
         2dJb9bxFkF0DNEGnPv2H8ZdqiMtHLE+4NA1dMvjbjbCXAqH4KxVj2Jm1U2/1NeXsHXTc
         2lpJ+16HybUQiPlFVXmvC1831iMvyl+DojaXiyxwENGNt8ZnffthfgCl0IoOhtaKusiB
         ksI9ZRsZPLPLY0iPB6DrRlqp1TV3j0BrCNAi/xrC9Fnj0sdbgOTQTetH5vHEqwtvc6o2
         nHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701465191; x=1702069991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFcscOKS+KeBuJ79kHtYrcnP4y16ClEYnsDu1e9phGc=;
        b=S83QromaDrqwc7wkQEjpDKkDegV9Zc/lrOmP5Hurd/fcFY0gpeviXT/Wt8P5xPGYaA
         j/lTHefdGGQu1f0hu7pCXBKzxh2ONN7W9m/ifLLOEURgoQAsynP+5c7chuqwxV97EeqU
         4+VbLsyzwA1jW0EDAC78JKZrqZekSNOJ3X/giA0/RppKH2qj18pZ0WpyD99QC13KIk/u
         nod8pDjpE9c/ZUhoFUtlf1RYMGN4JSDPLEuXJhYuJcGVAwNRY7AsInW/WuPqPwgq3tPm
         g5tBGTtT5XobFG3X34TeWKacERzo4gAfCnp6LJvUu1SPcXqe4w8xAaSbx7XuZK3L7QVR
         aggg==
X-Gm-Message-State: AOJu0Yyk5VSw+hJadkskNXgojNx1+4kWpK6CVLY9RP79jzCuq5VFpi8l
	HMvhgJU9EF36aysYXmZN7qDib/gUv7fJd6U5Gi+RvQ==
X-Google-Smtp-Source: AGHT+IEjhMbg+u8d2JTKNyFigsjKYOvhHdb/RZ1AFJXxaavi0QLf9ngcSuMDgs4UQpxI1yREp/yiDoEACIs+yDv+4TM=
X-Received: by 2002:a0d:ee41:0:b0:57a:cf8:5b4 with SMTP id x62-20020a0dee41000000b0057a0cf805b4mr25615864ywe.51.1701465191106;
 Fri, 01 Dec 2023 13:13:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <20231201014101.15802-2-quic_parellan@quicinc.com> <CAA8EJpqGx3eQ3o6bJhv3OBmHqtp67x8ODupZgKfSLSfFcRRmHQ@mail.gmail.com>
 <730d7e5b-e748-465d-cfee-06bfdcee5844@quicinc.com>
In-Reply-To: <730d7e5b-e748-465d-cfee-06bfdcee5844@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 23:13:00 +0200
Message-ID: <CAA8EJpoobZe-TzTdEU_+eKgsu6Any7C+LJU4ePDKgVkabT=gcg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/msm/dpu: Modify vblank_refcount if error in callback
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, marijn.suijten@somainline.org, steev@kali.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Dec 2023 at 21:14, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/30/2023 11:45 PM, Dmitry Baryshkov wrote:
> > On Fri, 1 Dec 2023 at 03:41, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>
> >> When the irq callback returns a value other than zero,
> >> modify vblank_refcount by performing the inverse
> >> operation of its corresponding if-else condition.
> >
> > I think it might be better to follow Bjorn's suggestion: once we have
> > the lock, we don't need atomics at all.
> > Then you rearrange the code to set the new value after getting return
> > code from dpu_core_irq_register_callback() /
> > dpu_core_irq_unregister_callback().
> >
>
> Even if we drop the atomics, we will have to replace it with a simple
> refcount. The refcount checks will be before calling
> dpu_core_irq_register_callback() / dpu_core_irq_unregister_callback().
>
> So we will still need the corresponding inverse refcount when either of
> those calls fail but just that they wont be atomics.

Within the critical section you can check the value before
register_callback and increment it afterwards if registration
succeeds.

>
> Am I missing something here?
>
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 9 +++++++--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++--
> >>   2 files changed, 14 insertions(+), 4 deletions(-)
> >



-- 
With best wishes
Dmitry

