Return-Path: <linux-arm-msm+bounces-11937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B333485CAE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61EED2862B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 22:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1D2154425;
	Tue, 20 Feb 2024 22:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l/zntwdq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AEA153BF7
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 22:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708468983; cv=none; b=HgiPhuqnPHr98ZMzYX0zp/m0W8tO9hpHjTlNP145Pexl648iPvrpmWJfNhQ6nBatFnZWBERgcuwqcnM1rmZb4UmmkZuxi/cFJXrfjpgzijtCEPUMa3yqGFsrBTkB3uq5Q/H4hthH9u1tZzRE8xLIbPefKzpxonUgZ87oW+BbkFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708468983; c=relaxed/simple;
	bh=DM/Mmtd0AI+H5Zh0+7h5Vn6CoAFtz2Xdt29XywQuhQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k7wFQmYbQJ2zkQcNdwrtB9qZp+pFqIYECNUG9JzuA22vzPsGIMS7H3+IzJfjQjptjRXXP53Un0tdhxSHiHf/+em8oSTXOcvrXsWY+zwDcngw6gbl7xyr8W5N6cdrPMCNvfb+lSU/SjjuYDBVpI0wnKUoXCuUPet96xMxGP80M/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l/zntwdq; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso6328130276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 14:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708468981; x=1709073781; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zH7DieykUQS2/nGJ68tfo7BTZhJKxdg5ci7aGgyYEiA=;
        b=l/zntwdqraL7XB3wjNSFxN/CIg3/lkYxn4GMnpyPOtX+BtTTnld7CO0fCTVoElOL8e
         sODQTAYwQlfEh0stlqGqZ7fuE/dSjcJKRQMeVQgVqSWZZasIDfCJuZdEdNoN0uEwQ11x
         kKkGgM/vCSjDk8QbAfrvD0z2W2anFg0gEjDGUjKiIg0JmFkueIHt0PKiPwaLA07zjnuo
         CCwNg6l41Jq614upd2WHoMY1O5agNdy+gU/Uef4dbClqJWfNLtOdyJyS9ph/yg6f/SX2
         RKlANMQvwKa68334eL20XVgb8etNRJKFNo/L9sElMKldkufzQmrD+GBkSaDeDakoGOL/
         tuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708468981; x=1709073781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zH7DieykUQS2/nGJ68tfo7BTZhJKxdg5ci7aGgyYEiA=;
        b=aQxkKrEu/0i3ATTWUob009N95OmQlRUZTuQdPMxM3KxDUObk0zTsRRGNGZNULaCWDj
         trfCZKeAdzRImZW0QxdDpe8j+ygz76WETwTlfa0vCi1H+QGiyHrwlftWCZ4K2ywOmCnn
         fYmXghFRDk+rURr7ukyucJRlfOuKfTTjcAV8nm9FQPrtGqO7zJEzzLyVO4MrACMOL1Lp
         l1a9M1J2Pr4pwPqrXDe20NEBF2fNsh7lGsDMaZtXo0Dfzjy7XiUy79AZth8r29u4TNUZ
         /mAw1Tj9t8+xEGbTxlsdZW6qJjYMMqTBZ7cya02UNZe+bp1kXcypMkU3bQPSAU7OpHAx
         Os9g==
X-Forwarded-Encrypted: i=1; AJvYcCViBlQNBOecD9Mx2wMB3j+USg/RKUHJRv4Y0HjG6NkSjEJlBQHjOYrse7yi3XdqBXjK+Gde2efrCrFlcMgH6Zsxo7Q/yp0Zd/3wlDHwhQ==
X-Gm-Message-State: AOJu0YxI2cNnuhcicdhbuf0uEvenGnVN2gaqvG/Ce3pw4sCi0J2jZ8WE
	dr3epK4tPGYrqMyUdPWwI4hEPIqWV+J2RskeofyzVJqTBd7kqF7/ECa69Am9LLC91kXO3enJXvq
	QVUUoZ5xvQqRrnWIVFQkFaRgXaTVzaHBgQKgxgQ==
X-Google-Smtp-Source: AGHT+IEoDDdMq6RX7QZdIBZt/yu5wB3n1Hn/zQ9cCylZvzZPzgSLW7DihxL8w0hx3qePCPboZ22CG6tWeZr3qSWXOLc=
X-Received: by 2002:a5b:c81:0:b0:dcb:fb49:cb93 with SMTP id
 i1-20020a5b0c81000000b00dcbfb49cb93mr14196899ybq.45.1708468981109; Tue, 20
 Feb 2024 14:43:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208-fd-dpu-debug-timeout-v2-1-9f907f1bdd87@linaro.org>
 <1cb90bff-ce5b-c6d1-a3df-24f6306f833a@quicinc.com> <CAA8EJpotiHKT_NYphDs0-vhpvsybgTW281XDYbteUx8qOX=v4g@mail.gmail.com>
 <63bba15b-6d8d-5ba8-d99d-8cd2dd763262@quicinc.com> <CAA8EJpqHmVBry9FyJ6HRB+qdVcVNN3Q7rHZz1daZL1Sz6yeZ=A@mail.gmail.com>
 <69d152d2-6a25-9ff4-ce6b-c4790247a661@quicinc.com>
In-Reply-To: <69d152d2-6a25-9ff4-ce6b-c4790247a661@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 00:42:50 +0200
Message-ID: <CAA8EJpo3XynBrm0S_BA_SxGOw963WQT9jh=YvLcT1N24FyEUsw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: make "vblank timeout" more useful
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Feb 2024 at 00:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/19/2024 3:52 AM, Dmitry Baryshkov wrote:
> > On Wed, 14 Feb 2024 at 22:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/14/2024 11:20 AM, Dmitry Baryshkov wrote:
> >>> On Wed, 14 Feb 2024 at 20:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2/8/2024 6:50 AM, Dmitry Baryshkov wrote:
> >>>>> We have several reports of vblank timeout messages. However after some
> >>>>> debugging it was found that there might be different causes to that.
> >>>>> To allow us to identify the DPU block that gets stuck, include the
> >>>>> actual CTL_FLUSH value into the timeout message and trigger the devcore
> >>>>> snapshot capture.
> >>>>>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>> Changes in v2:
> >>>>> - Added a call to msm_disp_snapshot_state() to trigger devcore dump
> >>>>>      (Abhinav)
> >>>>> - Link to v1: https://lore.kernel.org/r/20240106-fd-dpu-debug-timeout-v1-1-6d9762884641@linaro.org
> >>>>> ---
> >>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
> >>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>>> index d0f56c5c4cce..a8d6165b3c0a 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>>> @@ -489,7 +489,8 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
> >>>>>                 (hw_ctl->ops.get_flush_register(hw_ctl) == 0),
> >>>>>                 msecs_to_jiffies(50));
> >>>>>         if (ret <= 0) {
> >>>>> -             DPU_ERROR("vblank timeout\n");
> >>>>> +             DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
> >>>>> +             msm_disp_snapshot_state(phys_enc->parent->dev);
> >>>>
> >>>>
> >>>> There is no rate limiting in this piece of code unfortunately. So this
> >>>> will flood the number of snapshots.
> >>>
> >>> Well... Yes and no. The devcoredump will destroy other snapshots if
> >>> there is a pending one. So only the console will be flooded and only
> >>> in case when MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE is enabled.
> >>>
> >>
> >> Yes, true but at the same time this makes it hard to capture a good dump
> >> as potentially every vblank you could timeout so this destroy/create
> >> cycle wont end.
> >
> > Excuse me, maybe I miss something. On the first timeout the snapshot
> > is created. It is held by the kernel until it is fully read out from
> > the userspace. Other snapshots will not interfere with this snapshot.
> >
>
> For every new snapshot a new devcoredump device will be created which
> should remain till it has been read. But now this will be created every
> blank. IMO, this is really too much data for no reason.

No-no-no. If there is a devcoredump for a device, the next one will
not be created. See dev_coredumpm().
So all the snapshots will be created and then destroyed immediately.

>
> Subsequent vblank timeouts are not going to give any new information
> compared to the existing snapshot of the first vblank timeout thats why
> we should just create the snapshot when the first error happens and stop.
>
> For other frame done timeouts, infact subsequent timeouts without any
> sort of recovery in between are quite misleading because hardware was
> already not able to fetch the previous frame so it will most likely not
> fetch the next one either till it has recovered. Typically thats why
> these vblank timeouts happen in a flurry as the hardware never really
> recovered from the first timeout.
>
> > Or are you worried that snapshotting takes time, so taking a snapshot
> > will also interfere with the vblank timings for the next vblank?
> >
>
> Yes this is another point.

-- 
With best wishes
Dmitry

