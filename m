Return-Path: <linux-arm-msm+bounces-45756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9ECA1891B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 01:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D83F9169CD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 00:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E432D749C;
	Wed, 22 Jan 2025 00:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FRGQg7tM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287DEAD4B
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 00:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737506885; cv=none; b=e4EbN/64+MlpFfbux0FIwuXZyWLhJjnuh1WlEcsWnAmczfC8vG6QfhoOzBggmVGaIUi+/bUwYvSgEgDEzSyCYquhuwOGOZNpgoA8hJvsVVabkdL4/I6b09y8ze77QKkXWNRwbdpTWhz8A9/djsNmKvNTEychFZaCpWOt0NkDZYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737506885; c=relaxed/simple;
	bh=vdZJctZ3WzqtTVwnfVoZ/7H1nVuWBlw1V0drZSrJmso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lvBrs2N56OwnUqb5Bt61F8VDmtPevduPtc421jiZCVHVZ5ijA/6MPhoBL+9kMhS7QfaTCghi6YO/3FPPIYGS16SLcOuaeruXJIzRb54M4ZbzIw3h46Bsb4pcGJTQnLm3no8W9Su89UJktN1aesRGbephmO8SVRrFr/ZEjmEVpzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FRGQg7tM; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e54bd61e793so11367194276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 16:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737506883; x=1738111683; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bS/VJzcWrGagiRuYTKYIke8OIbozTbnJXMaBNiiZ+ik=;
        b=FRGQg7tMAq4uKfCuDaY2bR6e85TMEq12NxBjvPb8aXGFm1tqf9z0ZdBkzPFTXTgRWE
         cDIpVZvIrnkh6/bOwiOqv7n8zRdGcM5Zsr6ioyMjlRrYTJwGC3/ftqo8B350BmvPWgm4
         4ozpGkqn4DgVELRPVINUVh/+Uqajp//4r4Acjl0nBjvf9PQNOZw6BwVYSIciB+cZig2L
         ksvVX6rdZ+v+mNwwbl1b4ZxuCkIMLtsa0P0Qh5ETUsl6frNDAvoayTeQ5qbdy899kkAg
         8YVslmodQgto+dV3OM7qSDz1ilyqk/qlnSXum7vQo6hEC+9JEM84B5O2xMCmdIybnyZq
         9tRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737506883; x=1738111683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bS/VJzcWrGagiRuYTKYIke8OIbozTbnJXMaBNiiZ+ik=;
        b=h0znDW+jfVTYJP1vSAwshQ/k0JNCvyiQkNWwNRb7LVF9smVyonOSArqAQn0EjvWaFt
         sD42RyWjBwQvMx6gol5blaWwhZ5A+xij5H3XPOpAGEwTURVjTxNvW+avflNnmWHsjNlo
         sByy0lTpc32JeXzsybP6VVqZWh/wUPw3IO/7eszM3+QyUtv5QCBpCEGGug+niX2/MbSt
         M/fvMqsdB5oXA0axu5tdsaOEZgOZvcf223INnzI55JnigbdLJf3UDoVBXYGWxT42Vold
         ir8FpgODo4Na8w6MOMJjDqNI3Bo5ItJVRTlrFrWV+cER1SLJ/Vk/SA1EWteEG7fZryUv
         5ftA==
X-Forwarded-Encrypted: i=1; AJvYcCUWyGOZZtbDHfHmTk1vhIMMxEdZ44jZvzb3t6Ssr/tLl2PLew0dajdd/Lbv1fhZ1R8C1cvlp+WbLIKmsxmv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8rR9+VRGOWceqswB9738DhzH7CyFkpwJ+mSCAfODQZ9XcBel1
	/utYHldCHC77V2ytw3MawMTrQZEKu4maR1Qixud1Q+HI5MNwNT5laivM3ek6d+iM3QkRC0s0yli
	LX3hxvxHcAxJ1QmORFGkyjz9ak/0XdVicplpITw==
X-Gm-Gg: ASbGnctYnLuNYVc9ibCQGmu45pwY706J9e6aVufITJimVyuRmCwA9DrPWCvk5ihm2Sp
	8BC6TGZcGFs2KOABCleqqKIZutBfnQ4TtjOpQkchwdryPw63YrA==
X-Google-Smtp-Source: AGHT+IHNpwH/nJ7G4ykzYu3i50l1wE++Ejfd+7Gv4N2WyGLqHaSWjWRicmVmxYN3bG9NzUJx8uqflaT725+edwJPpWM=
X-Received: by 2002:a05:690c:f81:b0:6ef:6f24:d092 with SMTP id
 00721157ae682-6f6eb654456mr170084847b3.1.1737506882961; Tue, 21 Jan 2025
 16:48:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-9-988f0662cb7e@linaro.org> <b75ded72-f1b5-4e7e-b0b4-0720ef90b60f@quicinc.com>
In-Reply-To: <b75ded72-f1b5-4e7e-b0b4-0720ef90b60f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Jan 2025 02:47:52 +0200
X-Gm-Features: AbW1kvZ-0yr3fWq8rqcIL8gp-85OSXfCPUU70sc3IT5wMW2A1gZtKwrekj6S85c
Message-ID: <CAA8EJppbPGOc_n1r7Ji=ToLKFCjeFoVjz+dRdudjU_ODpNWO6w@mail.gmail.com>
Subject: Re: [PATCH 09/35] drm/msm/dpu: remove DSPP_SC7180_MASK
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Abhinav,

On Wed, 22 Jan 2025 at 02:28, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> > Stop declaring DPU_DSPP_PCC as a part of the DSPP features, use the
> > presence of the PCC sblk to check whether PCC is present in the hardware
> > or not.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 2 --
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 2 --
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 2 --
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 2 --
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 --
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c              | 2 +-
> >   28 files changed, 1 insertion(+), 66 deletions(-)
> >
>
> <snip>
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> > index 0f5a74398e66642fba48c112db41ffc75ae2a79f..11fb1bc54fa92a5d9926addb437bc4b8f283723b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> > @@ -90,7 +90,7 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
> >       /* Assign ops */
> >       c->idx = cfg->id;
> >       c->cap = cfg;
> > -     if (test_bit(DPU_DSPP_PCC, &c->cap->features))
> > +     if (c->cap->sblk->pcc.base)
> >               c->ops.setup_pcc = dpu_setup_dspp_pcc;
> >
> >       return c;
> >
>
> Change LGTM, only one note (hopefully has already been taken into
> consideration). There are  two different versions of PCC, one with
> version 0x10007 and the other 0x40000.
>
> If for some reason we need to distinguish these two versions while
> programming, is the plan to use version to distinguish them? Because the
> presence of PCC alone is not enough for using the "correct" PCC.

Yes, we can either use mdss_ver or sblk->version to distinguish between those.

-- 
With best wishes
Dmitry

