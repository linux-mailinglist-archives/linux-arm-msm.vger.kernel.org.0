Return-Path: <linux-arm-msm+bounces-11951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BBE85CBC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 00:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98F72285EBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E67154443;
	Tue, 20 Feb 2024 23:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dm+CWoFC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CC915442A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 23:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708470491; cv=none; b=qldwlURWm3nBXnnkzm6sT9LU9PpdPbFDe23Aucyu2GyDJORjIbQOYG7eBRTZYraH9F+WAVsdHqXVEQqqHZk+pGOJ2zJrRbDKt0jzf4cvncwZ4y5GA7NJmfyPS/RRF8Z+iW79TMIwQtjwLAU7WhRgtwV9+wlLMnVB77xFMS4vBzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708470491; c=relaxed/simple;
	bh=ph4a2df0VI65NePySmrE3vWJDqYEA8i+KxjYQ0+xJSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtqejyfnDCJ+SyveUVmmY0L3OyZbv5xOYJTirOdEUMXiVK9JcJJC9Ww/s10mkDLBOKdIWgnqtP8R4dj9dNxEYPnwgCPYwFxbkfAKHw3m0OYK4L5kciHcvTx0K2htBlDv40hWevbCyqyW9AzjDHQti9ameuRo5eKfHTcFj1K9IlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dm+CWoFC; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-607e54b6cf5so37933357b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 15:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708470488; x=1709075288; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JMa4Xpq2gA3A1LeF8lVok8xN9ReJjb3LesYcCiypUgg=;
        b=dm+CWoFCrdWsWNX26MHFbEWWvi1wBc+7Pqe3cIqUIVnuASnImXkHwEHI3Xu7qTszd8
         PekAgvAVXccj+iPTCFGFU//Nq9rTzdpRkrW5kG2GabFSg0vhKhHsqrN4czl9p0abE4n+
         6RBKdFOp4B1Ja3676o3vt3svnuUvO+F1MKw9ntjC2ck3XGTiDrWitk9vv6zEnp4SwjGw
         +uH9R6LYhPIj0mKsxrgzrAxeXb/28GkQyh96duTtIbo7EBf91mpmpUUYso7+DCbyYXY4
         /vTZdAUktdW57L47VazehjwpFF04w9jSaYmF8pK70PVt3CHroC+KR6hdfj8931AN9viD
         oS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708470488; x=1709075288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JMa4Xpq2gA3A1LeF8lVok8xN9ReJjb3LesYcCiypUgg=;
        b=QLs1daJ3RlqTSWdYIY6/U49tJDqfBmFgn5j6rJ+HtC5A24xUqJDOR/KCWzwa8pnWiG
         dOZgjPnz8VZrN4CRHXpwGgjQDcn/Clp8Vd1cTXDhPJ0wN+iL06Neon57raeS3NmwPBy5
         A8LU3zuIohhCD9Kh8dRhKvlkwJiHIj4niCJelcwPQ/3Lg2xGcs/vu80Cgt39btr8JBLs
         6g38C68D4aFlyGuw8BNcqlLeEP+olcayo+gT6SViX/5tK4oj0ndsEpRUtM4u07NlgJbJ
         tdvTLPk0uvew+aLQiL6NDL2a3tIwX3sotj2DLCrd1dZjMb51WYWKUnDtMKDfb/Nwnh49
         K99w==
X-Forwarded-Encrypted: i=1; AJvYcCVPMisSfEtsa5FUXCRgfjIdG7r803ZFXO6IaeSS1oaH5qoK7NaU+RHb0mzWXsTvXlcu81i1BY4TY45X8P7rAsX6W0TAsHvmmNRwf2Z1nw==
X-Gm-Message-State: AOJu0Yx80IoCzKjSrHcpjYzD28i3Tzu/z8cBQTbHo4Tim0/qWc3FnCHG
	k11cB7oG358YJuGwy8RIOffbipmbRWl/ymTJShYFMfbZk/O81wS1x61pyit6qf7Iw6DLxGNv2oW
	wpJLgmr0AbKthdNTKsMBa3XqatEs6w15w86+95w==
X-Google-Smtp-Source: AGHT+IG3a3isXkLnhLjbaA3WAfu3COn5KIElhpETaOROfN3a/zrBXCsfeHPjiW3NbxHm8CHzA7JRzyjBs0Q6pVYoj00=
X-Received: by 2002:a0d:d514:0:b0:607:cc6a:e1e5 with SMTP id
 x20-20020a0dd514000000b00607cc6ae1e5mr11574717ywd.2.1708470488239; Tue, 20
 Feb 2024 15:08:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208-fd-dpu-debug-timeout-v2-1-9f907f1bdd87@linaro.org>
 <1cb90bff-ce5b-c6d1-a3df-24f6306f833a@quicinc.com> <CAA8EJpotiHKT_NYphDs0-vhpvsybgTW281XDYbteUx8qOX=v4g@mail.gmail.com>
 <63bba15b-6d8d-5ba8-d99d-8cd2dd763262@quicinc.com> <CAA8EJpqHmVBry9FyJ6HRB+qdVcVNN3Q7rHZz1daZL1Sz6yeZ=A@mail.gmail.com>
 <69d152d2-6a25-9ff4-ce6b-c4790247a661@quicinc.com> <CAA8EJpo3XynBrm0S_BA_SxGOw963WQT9jh=YvLcT1N24FyEUsw@mail.gmail.com>
 <09928fb7-c5c3-7a36-1ce2-9f4012507d06@quicinc.com>
In-Reply-To: <09928fb7-c5c3-7a36-1ce2-9f4012507d06@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 01:07:56 +0200
Message-ID: <CAA8EJpqEE2QjN5K=_FmUPRNGcXCnCcumJeJ6ShKbT3WHYaUp-g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: make "vblank timeout" more useful
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Feb 2024 at 01:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/20/2024 2:42 PM, Dmitry Baryshkov wrote:
> > On Wed, 21 Feb 2024 at 00:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/19/2024 3:52 AM, Dmitry Baryshkov wrote:
> >>> On Wed, 14 Feb 2024 at 22:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2/14/2024 11:20 AM, Dmitry Baryshkov wrote:
> >>>>> On Wed, 14 Feb 2024 at 20:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 2/8/2024 6:50 AM, Dmitry Baryshkov wrote:
> >>>>>>> We have several reports of vblank timeout messages. However after some
> >>>>>>> debugging it was found that there might be different causes to that.
> >>>>>>> To allow us to identify the DPU block that gets stuck, include the
> >>>>>>> actual CTL_FLUSH value into the timeout message and trigger the devcore
> >>>>>>> snapshot capture.
> >>>>>>>
> >>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>>> ---
> >>>>>>> Changes in v2:
> >>>>>>> - Added a call to msm_disp_snapshot_state() to trigger devcore dump
> >>>>>>>       (Abhinav)
> >>>>>>> - Link to v1: https://lore.kernel.org/r/20240106-fd-dpu-debug-timeout-v1-1-6d9762884641@linaro.org
> >>>>>>> ---
> >>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
> >>>>>>>      1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>>>>> index d0f56c5c4cce..a8d6165b3c0a 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>>>>> @@ -489,7 +489,8 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
> >>>>>>>                  (hw_ctl->ops.get_flush_register(hw_ctl) == 0),
> >>>>>>>                  msecs_to_jiffies(50));
> >>>>>>>          if (ret <= 0) {
> >>>>>>> -             DPU_ERROR("vblank timeout\n");
> >>>>>>> +             DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
> >>>>>>> +             msm_disp_snapshot_state(phys_enc->parent->dev);
> >>>>>>
> >>>>>>
> >>>>>> There is no rate limiting in this piece of code unfortunately. So this
> >>>>>> will flood the number of snapshots.
> >>>>>
> >>>>> Well... Yes and no. The devcoredump will destroy other snapshots if
> >>>>> there is a pending one. So only the console will be flooded and only
> >>>>> in case when MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE is enabled.
> >>>>>
> >>>>
> >>>> Yes, true but at the same time this makes it hard to capture a good dump
> >>>> as potentially every vblank you could timeout so this destroy/create
> >>>> cycle wont end.
> >>>
> >>> Excuse me, maybe I miss something. On the first timeout the snapshot
> >>> is created. It is held by the kernel until it is fully read out from
> >>> the userspace. Other snapshots will not interfere with this snapshot.
> >>>
> >>
> >> For every new snapshot a new devcoredump device will be created which
> >> should remain till it has been read. But now this will be created every
> >> blank. IMO, this is really too much data for no reason.
> >
> > No-no-no. If there is a devcoredump for a device, the next one will
> > not be created. See dev_coredumpm().
> > So all the snapshots will be created and then destroyed immediately.
> >
>
> hmm ... I have certainly seen devcd_count go higher than one (but not
> more than 2). I am wondering whether this was because of some race
> condition of the previous destroy / new create.
>
> But anyway, this part is clear now. thanks.
>
> >>
> >> Subsequent vblank timeouts are not going to give any new information
> >> compared to the existing snapshot of the first vblank timeout thats why
> >> we should just create the snapshot when the first error happens and stop.
> >>
> >> For other frame done timeouts, infact subsequent timeouts without any
> >> sort of recovery in between are quite misleading because hardware was
> >> already not able to fetch the previous frame so it will most likely not
> >> fetch the next one either till it has recovered. Typically thats why
> >> these vblank timeouts happen in a flurry as the hardware never really
> >> recovered from the first timeout.
> >>
> >>> Or are you worried that snapshotting takes time, so taking a snapshot
> >>> will also interfere with the vblank timings for the next vblank?
> >>>
> >>
> >> Yes this is another point.
> >
>
> snapshots will still be captured every vblank timeout and reading
> through the entire DPU reg space every vblank timeout is certainly
> something we can avoid.

Ack.

-- 
With best wishes
Dmitry

