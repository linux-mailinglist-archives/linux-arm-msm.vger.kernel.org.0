Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629E22C1F39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 09:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730249AbgKXH6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 02:58:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730055AbgKXH6q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 02:58:46 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D06C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 23:58:46 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id d18so19851588edt.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 23:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Au1b5xEDzIQY7a4tiuAjhL9rNsPayZdiZp6GNreqAUI=;
        b=JRPkl/eAGk+baWL5P1lk2A38NmrviAUJeFYzdjF67kqzl/cLizl7Zd5Omvh4L5SiG/
         pWcgPROPR7TTNWxxMxnp26XTqujKb+mPk5I1SjFEtv3PmDd/hm/0ukncjHGXE87Y5Yi6
         5QanV9guYTHB99tSWN+l3HUBtMtjK/Mgk6/lCYmj0+/Uz/htjT2toXiy7CHTf7lHuGw7
         PQvhxOCzHQB94J20mzli6cRcJVvtUIEpJ0NfW7Qjog6Rku7jOtEJFXNvwtD0qX1Q9rp9
         sssCIWShUrC2G74uVRji5OVFYKEIsl1DEVSrJdRg96NeACoktv2w7+dIN+FJazJHfVWq
         lrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Au1b5xEDzIQY7a4tiuAjhL9rNsPayZdiZp6GNreqAUI=;
        b=UEjBKATKS9gfLCPjQZ7kB8s2F9dBrJe0ikorMqeWVVQ/U/pnOYGi6U68FXDs3jW0ae
         YrMkVrI40UXxIVfKNRuyc8ZWVVUYu8vVFjD4NE3ryzBZ2E0MEnQTGZwnjQzE/WBDiMB1
         3nh0gcVaiga4TVtIai0njL6RU4XdFbPw7wCOHG0IZ6fZEx074WYT/JGskI3q8+ts6obS
         2Pn4MBjUIcujFvtaHq+pAbmw7s54PLXMLH8TFvOo9+XDd8jnZs8K0jU5arI2/Q8682lb
         Gh+RmD1xWlhcUMbThZ8nCU5rUScoXKjQR+zfAxhNJy2YLJ/Yy4++Zm+6bjhwovR1bU1M
         XK/w==
X-Gm-Message-State: AOAM53098PUSFtjsej63eaZgAg9fBC4/c9VLKVFYhOrUSDWh5PoTCyc4
        XjzoAp1cqfVUYm4a6ukF5opUGtBNBPyWPPguMLSWZQ==
X-Google-Smtp-Source: ABdhPJwbe4Y6SZhdJEpzYu5h/6CfqFK8nIj21cKx70HBpntJuD2gOulLL4OEyQzlwp2pSfajZmHVdjMiHf8kZSjpNas=
X-Received: by 2002:a05:6402:2373:: with SMTP id a19mr2706172eda.212.1606204725141;
 Mon, 23 Nov 2020 23:58:45 -0800 (PST)
MIME-Version: 1.0
References: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
 <1606140666-4986-4-git-send-email-loic.poulain@linaro.org> <8f694ad374ff8db0ee951036c4b3c040@codeaurora.org>
In-Reply-To: <8f694ad374ff8db0ee951036c4b3c040@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 24 Nov 2020 09:05:00 +0100
Message-ID: <CAMZdPi-rKrGfoX5=FbOuPKTny3U1mH-q8t=hEQmOKj=QDkmBRg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] mhi: pci_generic: Enable burst mode for hardware channels
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 Nov 2020 at 01:58, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> Hi Loic,
> On 2020-11-23 06:11 AM, Loic Poulain wrote:
> > Hardware channels have a feature called burst mode that allows to
> > queue transfer ring element(s) (TRE) to a channel without ringing
> > the device doorbell. In that mode, the device is polling the channel
> > context for new elements. This reduces the frequency of host initiated
> > doorbells and increase throughput.
> >
> > Create a new dedicated macro for hardware channels with burst enabled.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  drivers/bus/mhi/pci_generic.c | 34 ++++++++++++++++++++++++++++++++--
> >  1 file changed, 32 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/bus/mhi/pci_generic.c
> > b/drivers/bus/mhi/pci_generic.c
> > index 09c6b26..0c07cf5 100644
> > --- a/drivers/bus/mhi/pci_generic.c
> > +++ b/drivers/bus/mhi/pci_generic.c
> > @@ -78,6 +78,36 @@ struct mhi_pci_dev_info {
> >               .offload_channel = false,       \
> >       }
> >
> > +#define MHI_CHANNEL_CONFIG_HW_UL(ch_num, ch_name, el_count, ev_ring) \
> > +     {                                               \
> > +             .num = ch_num,                          \
> > +             .name = ch_name,                        \
> > +             .num_elements = el_count,               \
> > +             .event_ring = ev_ring,                  \
> > +             .dir = DMA_TO_DEVICE,                   \
> > +             .ee_mask = BIT(MHI_EE_AMSS),            \
> > +             .pollcfg = 0,                           \
> > +             .doorbell = MHI_DB_BRST_ENABLE, \
> > +             .lpm_notify = false,                    \
> > +             .offload_channel = false,               \
> > +             .doorbell_mode_switch = false,          \
> > +     }                                               \
> > +
> > +#define MHI_CHANNEL_CONFIG_HW_DL(ch_num, ch_name, el_count, ev_ring) \
> > +     {                                               \
> > +             .num = ch_num,                          \
> > +             .name = ch_name,                        \
> > +             .num_elements = el_count,               \
> > +             .event_ring = ev_ring,                  \
> > +             .dir = DMA_FROM_DEVICE,                 \
> > +             .ee_mask = BIT(MHI_EE_AMSS),            \
> > +             .pollcfg = 0,                           \
> > +             .doorbell = MHI_DB_BRST_ENABLE, \
> > +             .lpm_notify = false,                    \
> > +             .offload_channel = false,               \
> > +             .doorbell_mode_switch = false,          \
> > +     }
> > +
> >  #define MHI_EVENT_CONFIG_DATA(ev_ring)               \
> >       {                                       \
> >               .num_elements = 128,            \
> > @@ -112,8 +142,8 @@ static const struct mhi_channel_config
> > modem_qcom_v1_mhi_channels[] = {
> >       MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
> >       MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
> >       MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
> > -     MHI_CHANNEL_CONFIG_UL(100, "IP_HW0", 128, 1),
> > -     MHI_CHANNEL_CONFIG_DL(101, "IP_HW0", 128, 2),
> > +     MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 1),
> > +     MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
> >  };
> >
> >  static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
> Did you somehow miss my email with comments on this macro from the
> previous
> submission?
>
> If not, then any reason you want to submit this way for now and change
> it
> later when more HW channels are added?
>
> I don't think it's a good idea to have doorbell_mode_switch as false for
> channel 100 as we need to ring the DB every time we come out of M3.

My bad, I missed that point. I'm going to fix that. BTW would it no
make sense to always enabled that from MHI core (and not let the
controller driver to choose)?

>
> The current proposal will become inconsistent when more HW channels with
> different requirements are added so my suggestion was to accommodate
> these
> now. Also, I realized we need to update the regular macros as well but
> it
> can be dealt with separately.
>
> If you would like recommendations or would want to discuss this
> configuration
> thing further, please let me know.
>
> Thanks,
> Bhaumik
> ---
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> Forum,
> a Linux Foundation Collaborative Project
