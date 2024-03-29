Return-Path: <linux-arm-msm+bounces-15656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D2F8911EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 04:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC2231C244D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 03:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A8A38F98;
	Fri, 29 Mar 2024 03:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="of5M1ogG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9B228F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 03:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711682637; cv=none; b=BQXKbJFg7FBfqLCbTO/P7i5fc3ymg48cXUH7dGTxXucPoNdp8IfstNVS1/MGTHnhXo2orZDRrhSRm1l/6QlABwQLMK30lwkRvLxUVaiP0G8nreXmF62Eb5QBpnpffE6EIbT3PwKLXIqyjTvz2NBQT/RQ8F4Mdcwb+tOGaKN2at0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711682637; c=relaxed/simple;
	bh=mA9CbGYa0dEPKv87glx4EYjewFsFC/k1tR3vCkpTS/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrTMdj00kKZ8Jh0MjV1DStPJAvD9a2bHlCareod6LqVyGo4RjxCAeVbHuvre7ISYoj9qaBJL/WWN5Rq9bSmHHu15xP8TxIuK1sBbuX9KokWyy0ef8dcWTeAvvrd7pVz1Lwg53XV5qUsJGegP6UCwBIxy+B/wBxMTe+4F6xQr/8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=of5M1ogG; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso1535311276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 20:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711682633; x=1712287433; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2cGkeY7zQxQRxLqhm5ORukRN8aDetleyVVG2pLEXZBE=;
        b=of5M1ogGJ3Khjfh6rhEnIi1zrW9dURxybsYkc8jgZW36k4zaTUlJjjV0x1G/LI1/Qv
         8cBsBmrHhXhGZxQJzUgWhKqPapezxaKHaMaLIeRDM5tAVmrLG333O6glPrey2kJzqAOn
         aIDK0ZMH+9TEXKzhbWHY180BOqLTSmKayK6Ip+TFjJkhxSp0pyJHuKZCCidhCsgrKT9F
         /Lpy3IA2VumlZgaT1pqJ12jHSBlVEf0dn+3UMSjNb5uEvrAX+okw6B7+hnd5AZgyE3i1
         6N7nVuyADJsNieGNh2zBrXbzIMZ1Ma6UY0c7udlB37DSFUY2Yb+iNupiSBcEmt6NYC/3
         GlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711682633; x=1712287433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cGkeY7zQxQRxLqhm5ORukRN8aDetleyVVG2pLEXZBE=;
        b=Rtt6QiL5dlEbZ1O+X67nDpDdnpJnBNqMRo5aal53omiA4DCYgdB4daHltUsGJWHBug
         9XVBKrSH0bN9Kmwpr1z79/CwErgArPyHNMI8nC5zrnJhw5i1oGLxdmID1myZ74L7Y899
         1ySngPx4GGSjBXr84eKaNGcUYoh0TFsVSQ1NagA4g+sqzQVeFe7IOyhusYzphBm1DQxm
         ucQ+LY+Rgcg+dqndn4xX5c5+h/qePuSjOxYOyijehpPbbeTyRNysBhcg903W0uBUz/2v
         doSvIrtjWcvXw2TOz80VX6Oh0JxINNPnUo0+Mri3bjsNuN29j1FlHiSW4If0cPBIIw9b
         HdxA==
X-Forwarded-Encrypted: i=1; AJvYcCWfDf6WHoysMNTVh1AvAWxQlSKRcpRrBMcmMUOfUuj5kEz4PEyiGgyAuO5xmisqrN57S1xU9AVywvFE/dGFSpMhXhrYYE6EH++0+GvJPQ==
X-Gm-Message-State: AOJu0YwuOkNVh+OYxlnDF58JH4dELVE0Sz04QCO81Qe7RLXvq7CJ9D4X
	9MlTxsNec1vJvSzee7oYp9M8/mEb8I3OJUVbnV4DyEnnpsruXGBr1/x47A/xXz2k1CUU3wIqU6y
	I0iSldNIspSthRVh4fJwVztf/XEgU34zwPgMRrQ==
X-Google-Smtp-Source: AGHT+IE9Q72EecKSUjdkAGdBSxPtFtYMJ5UUWxsvxQNwZ6y2SKoPJRd/NHT8zNBwM36IvFA+QfBgnXwSpg9cS3MuxQc=
X-Received: by 2002:a25:df09:0:b0:dcd:aa73:e349 with SMTP id
 w9-20020a25df09000000b00dcdaa73e349mr1168492ybg.12.1711682632909; Thu, 28 Mar
 2024 20:23:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1711656246-3483-1-git-send-email-quic_khsieh@quicinc.com>
 <1711656246-3483-2-git-send-email-quic_khsieh@quicinc.com>
 <55debb0a-c7af-ef71-c49a-414c7ab4f59d@quicinc.com> <CAE-0n503FwcwreZ14MMKgdzu8QybWYtMdLOKasiCwmE8pCJOSw@mail.gmail.com>
 <23de89e9-3ef3-c52d-7abf-93dc2dbb51a4@quicinc.com> <CAA8EJppEWXnsQzDD1tdNuMb1ijEVtE7LQct9jt1fwVwMd8ch_Q@mail.gmail.com>
 <27cadd17-10a3-3b8c-2b29-6698ccdce531@quicinc.com> <CAA8EJpqYVDG9pBj39m40rPwUNgE7x07HfCt6C3yaMN7eOaWk6Q@mail.gmail.com>
 <efbe5aa8-8bbe-26cd-ca70-1974241a3537@quicinc.com>
In-Reply-To: <efbe5aa8-8bbe-26cd-ca70-1974241a3537@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 05:23:41 +0200
Message-ID: <CAA8EJprES3q3w6GuQ8dW5vicnzbO_eZ6wpNfWe5njTPRDZm5KQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm/dp: use dp_hpd_plug_handle() and
 dp_hpd_unplug_handle() directly
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, abel.vesa@linaro.org, 
	agross@kernel.org, airlied@gmail.com, daniel@ffwll.ch, dianders@chromium.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	vkoul@kernel.org, quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com, 
	marijn.suijten@somainline.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Mar 2024 at 04:16, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/28/2024 5:10 PM, Dmitry Baryshkov wrote:
> > On Fri, 29 Mar 2024 at 01:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/28/2024 3:50 PM, Dmitry Baryshkov wrote:
> >>> On Thu, 28 Mar 2024 at 23:21, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 3/28/2024 1:58 PM, Stephen Boyd wrote:
> >>>>> Quoting Abhinav Kumar (2024-03-28 13:24:34)
> >>>>>> + Johan and Bjorn for FYI
> >>>>>>
> >>>>>> On 3/28/2024 1:04 PM, Kuogee Hsieh wrote:
> >>>>>>> For internal HPD case, hpd_event_thread is created to handle HPD
> >>>>>>> interrupts generated by HPD block of DP controller. It converts
> >>>>>>> HPD interrupts into events and executed them under hpd_event_thread
> >>>>>>> context. For external HPD case, HPD events is delivered by way of
> >>>>>>> dp_bridge_hpd_notify() under thread context. Since they are executed
> >>>>>>> under thread context already, there is no reason to hand over those
> >>>>>>> events to hpd_event_thread. Hence dp_hpd_plug_handle() and
> >>>>>>> dp_hpd_unplug_hanlde() are called directly at dp_bridge_hpd_notify().
> >>>>>>>
> >>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>>>>>> ---
> >>>>>>>      drivers/gpu/drm/msm/dp/dp_display.c | 5 +++--
> >>>>>>>      1 file changed, 3 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>
> >>>>>> Fixes: 542b37efc20e ("drm/msm/dp: Implement hpd_notify()")
> >>>>>
> >>>>> Is this a bug fix or an optimization? The commit text doesn't tell me.
> >>>>>
> >>>>
> >>>> I would say both.
> >>>>
> >>>> optimization as it avoids the need to go through the hpd_event thread
> >>>> processing.
> >>>>
> >>>> bug fix because once you go through the hpd event thread processing it
> >>>> exposes and often breaks the already fragile hpd handling state machine
> >>>> which can be avoided in this case.
> >>>
> >>> Please add a description for the particular issue that was observed
> >>> and how it is fixed by the patch.
> >>>
> >>> Otherwise consider there to be an implicit NAK for all HPD-related
> >>> patches unless it is a series that moves link training to the enable
> >>> path and drops the HPD state machine completely.
> >>>
> >>> I really mean it. We should stop beating a dead horse unless there is
> >>> a grave bug that must be fixed.
> >>>
> >>
> >> I think the commit message is explaining the issue well enough.
> >>
> >> This was not fixing any issue we saw to explain you the exact scenario
> >> of things which happened but this is just from code walkthrough.
> >>
> >> Like kuogee wrote, hpd event thread was there so handle events coming
> >> out of the hpd_isr for internal hpd cases. For the hpd_notify coming
> >> from pmic_glink or any other extnernal hpd cases, there is no need to
> >> put this through the hpd event thread because this will only make things
> >> worse of exposing the race conditions of the state machine.
> >>
> >> Moving link training to enable and removal of hpd event thread will be
> >> worked on but delaying obvious things we can fix does not make sense.
> >
> >  From the commit message this feels like an optimisation rather than a
> > fix. And granted the fragility of the HPD state machine, I'd prefer to
> > stay away from optimisations. As far as I understood from the history
> > of the last revert, we'd better make sure that HPD handling goes only
> > through the HPD event thread.
> >
>
> I think you are mixing the two. We tried to send the events through
> DRM's hpd_notify which ended up in a bad way and btw, thats still not
> resolved even though I have seen reports that things are fine with the
> revert, we are consistently able to see us ending up in a disconnected
> state with all the reverts and fixes in our x1e80100 DP setup.
>
> I plan to investigate that issue properly in the next week and try to
> make some sense of it all.
>
> In fact, this patch is removing one more user of the hpd event thread
> which is the direction in which we all want to head towards.

As I stated earlier, from my point of view it doesn't make sense to
rework the HPD thread in small steps.

> On whether this is an optimization or a bug fix. I think by avoiding hpd
> event thread (which should have never been used for hpd_notify updates,
> hence a bug) we are avoiding the possibility of more race conditions.

I think that the HPD event thread serializes handling of events, so
avoiding it increases the possibility of a race condition.

>
> So, this has my R-b and it holds. Upto you.

I'd wait for a proper description of the issue that was observed and
how it is solved by this patch.

-- 
With best wishes
Dmitry

