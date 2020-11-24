Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7A462C1FA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 09:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730433AbgKXIMD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 03:12:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730418AbgKXIMD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 03:12:03 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE26BC0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 00:12:02 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id o9so27196791ejg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 00:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RN5auLRG3ECy3WSq3ZaM+gP/vae241dpX3t+3Eawm8s=;
        b=ZQ7vk8x8OffGfAYmjDGtNac8/cbQe+4v3X2z0Q5o0kbETzLlqlip4pfkoQzAohg0++
         m9TT8aN19m+XXPHOZf1AldFpTdF0DGQ2SKr+y/6hy8QXn2cN+BRKmLrPCHjWLROl9GIZ
         kbOlKkddv1hkByZi+VENastPMNfbvoLC+2kpk0hl7vaA5+3ZgyffdSekLB19/J/pDLPp
         ZLJlcSTW+mNQj0V8qSDoz280M9paWURrTehd8Edvq0ABbvqzh9xhblM0APQg154Jxq73
         HdKRG1q3S9HXzYMxVYcQyuOxzoz48paWyChGiqg7Wx1eaclQAfsu2+t1p+qZbxQ29u/m
         a1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RN5auLRG3ECy3WSq3ZaM+gP/vae241dpX3t+3Eawm8s=;
        b=cc3Of96CWDWXJ2nIPdZcJwXLFGDOCaAiyNMcLn2yHyrJ4RD9lrEAj4kLmT4lp89iId
         2ryLWEs3iIU7429wdnIDaHX0aF0+B/buYJwIVKH8YHqdKVIsquZVjEfMch6mEYGF5/zM
         U0GtB9DAlHbU+SoGg1WCnOeaLm+QVR23t7az+gjpjRAv0zHYZ94/DsMX7RkUULFaJArl
         +rspVgxaPgRIqVC9XbegBJ6eSZC0khXDC2AgFtFOVFqa3W19FihMzwiu59urkBc6OtAF
         AjhOppyJDaxLzlJKMt7gY8kpEDe4VuQq3IKNLhhOWg38zrAT/2q/f/YmwWTrsdkNPYD1
         Iakw==
X-Gm-Message-State: AOAM533qbxPHxpL4fIYLZgva4zzScDqRCxifZJ17DyCx0MN7HzXWZNc+
        07tC0hwtjShQ9s3yVnTGSZPEw+hy1faGIdl/QnUbhg==
X-Google-Smtp-Source: ABdhPJxwqoGb395kzDYJBezee4aN+KomtKxX7LmGCja+HVo8vuqsxYwtSVM8xSNntb1YBbTS5hhLVtBmd2IzRT3dIzs=
X-Received: by 2002:a17:906:e254:: with SMTP id gq20mr3211638ejb.520.1606205521520;
 Tue, 24 Nov 2020 00:12:01 -0800 (PST)
MIME-Version: 1.0
References: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
 <1606140666-4986-4-git-send-email-loic.poulain@linaro.org>
 <8f694ad374ff8db0ee951036c4b3c040@codeaurora.org> <CAMZdPi-rKrGfoX5=FbOuPKTny3U1mH-q8t=hEQmOKj=QDkmBRg@mail.gmail.com>
In-Reply-To: <CAMZdPi-rKrGfoX5=FbOuPKTny3U1mH-q8t=hEQmOKj=QDkmBRg@mail.gmail.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 24 Nov 2020 09:18:17 +0100
Message-ID: <CAMZdPi_qZptA2cfHHSqC=T_CHAiomeHjY61aqp_+MXBMq2w_8Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] mhi: pci_generic: Enable burst mode for hardware channels
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 Nov 2020 at 09:05, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> On Tue, 24 Nov 2020 at 01:58, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
> >
> > Hi Loic,
> > On 2020-11-23 06:11 AM, Loic Poulain wrote:
> > > Hardware channels have a feature called burst mode that allows to
> > > queue transfer ring element(s) (TRE) to a channel without ringing
> > > the device doorbell. In that mode, the device is polling the channel
> > > context for new elements. This reduces the frequency of host initiated
> > > doorbells and increase throughput.
> > >
> > > Create a new dedicated macro for hardware channels with burst enabled.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > ---
> > >  drivers/bus/mhi/pci_generic.c | 34 ++++++++++++++++++++++++++++++++--
> > >  1 file changed, 32 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/bus/mhi/pci_generic.c
> > > b/drivers/bus/mhi/pci_generic.c
> > > index 09c6b26..0c07cf5 100644
> > > --- a/drivers/bus/mhi/pci_generic.c
> > > +++ b/drivers/bus/mhi/pci_generic.c
> > > @@ -78,6 +78,36 @@ struct mhi_pci_dev_info {
> > >               .offload_channel = false,       \
> > >       }
> > >
> > > +#define MHI_CHANNEL_CONFIG_HW_UL(ch_num, ch_name, el_count, ev_ring) \
> > > +     {                                               \
> > > +             .num = ch_num,                          \
> > > +             .name = ch_name,                        \
> > > +             .num_elements = el_count,               \
> > > +             .event_ring = ev_ring,                  \
> > > +             .dir = DMA_TO_DEVICE,                   \
> > > +             .ee_mask = BIT(MHI_EE_AMSS),            \
> > > +             .pollcfg = 0,                           \
> > > +             .doorbell = MHI_DB_BRST_ENABLE, \
> > > +             .lpm_notify = false,                    \
> > > +             .offload_channel = false,               \
> > > +             .doorbell_mode_switch = false,          \
> > > +     }                                               \
> > > +
> > > +#define MHI_CHANNEL_CONFIG_HW_DL(ch_num, ch_name, el_count, ev_ring) \
> > > +     {                                               \
> > > +             .num = ch_num,                          \
> > > +             .name = ch_name,                        \
> > > +             .num_elements = el_count,               \
> > > +             .event_ring = ev_ring,                  \
> > > +             .dir = DMA_FROM_DEVICE,                 \
> > > +             .ee_mask = BIT(MHI_EE_AMSS),            \
> > > +             .pollcfg = 0,                           \
> > > +             .doorbell = MHI_DB_BRST_ENABLE, \
> > > +             .lpm_notify = false,                    \
> > > +             .offload_channel = false,               \
> > > +             .doorbell_mode_switch = false,          \
> > > +     }
> > > +
> > >  #define MHI_EVENT_CONFIG_DATA(ev_ring)               \
> > >       {                                       \
> > >               .num_elements = 128,            \
> > > @@ -112,8 +142,8 @@ static const struct mhi_channel_config
> > > modem_qcom_v1_mhi_channels[] = {
> > >       MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
> > >       MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
> > >       MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
> > > -     MHI_CHANNEL_CONFIG_UL(100, "IP_HW0", 128, 1),
> > > -     MHI_CHANNEL_CONFIG_DL(101, "IP_HW0", 128, 2),
> > > +     MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 1),
> > > +     MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
> > >  };
> > >
> > >  static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
> > Did you somehow miss my email with comments on this macro from the
> > previous
> > submission?
> >
> > If not, then any reason you want to submit this way for now and change
> > it
> > later when more HW channels are added?
> >
> > I don't think it's a good idea to have doorbell_mode_switch as false for
> > channel 100 as we need to ring the DB every time we come out of M3.
>
> My bad, I missed that point. I'm going to fix that. BTW would it no
> make sense to always enabled that from MHI core (and not let the
> controller driver to choose)?

And let me know if there is any reason to not enable it
doorbell_mode_switch when burst mode is enabled. I would like macro
paramaeters as minimal as possible so that they simplify channel
configuration.

Regards,
Loic
