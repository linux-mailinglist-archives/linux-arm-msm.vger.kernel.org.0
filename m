Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6A0354E6E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 10:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234886AbhDFIV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 04:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234590AbhDFIV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 04:21:57 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 950E7C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 01:21:48 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id il9-20020a17090b1649b0290114bcb0d6c2so9257288pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 01:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TwFsFCNcW5vZCqfgf1dZfUUUxKaXxEhnbEAc8ax4O88=;
        b=Z+48qpyvULt5yxcHpcIT3A57hY/9pg8jeWU6EpapPYdKvzpZ1kWxQxTJ/WFu71W4zj
         aLbcmK1TFmCQOBR/c8DPbx9aB7L6AD6PAUim7IZTdH6/Q8EwV2/vkoSjsSo1yPsmvVWZ
         UJmAeLRTb+Uhw7SGoTRzxbbFbWkJjoOorjkNGYB9MMzOTTJoYONpTnGCYFMhAKM02ftT
         5pltxJoHMmvyZLxDmVdEeS2d0Pi7Gzhp0mGvOtOUvjHT3jofZYfSYnjn/34Iau/KBcEe
         ZdUPSi7M5jnzdwyT9jc3xJ568/1BuvBziOQzfBlenoEaLgiKbZ+RE1P0PQqRstIq6DMd
         r+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TwFsFCNcW5vZCqfgf1dZfUUUxKaXxEhnbEAc8ax4O88=;
        b=oiwnAERVE/Yb4fjZbba/8gWVLEpQ3YgA4JcicZ7ZZ2fCJakGKGNJFkprJeb3uICwHV
         uudDVGKU9AVvM5fYqRkRrOlLVTC1rcYXZ4DufozxQVNco+xJ190xCIfOGnby3pjwc8xb
         +6n92scGMjfM53b9R66YuuO4tKEYOEK0WFDFIAeFksm/U5gbikvDLs6Nq8Xxv9xX/MO5
         LMp7NFlO1tsBbIdXgZqWpUDVgkKgMFO8Zgo5CtAGDCGSf2qvVD57XP2X3LUHZXrF/rXt
         w+GiPEzfZ+7ZTpx8x0R+xhdr1z7Ajm6Zxcfjs5notq3InwNWLsqnmGRrN6bslcHqvEX2
         wPXg==
X-Gm-Message-State: AOAM532stf0e2wwrr5F/3kp3C0USg1L3Znn02jJTiyX+jq5s4xs2cF6b
        TK+cZMlWcM6MYeYLoH2dC2A2gF0c7/rlaHb9AoAWMh8hmXLeag==
X-Google-Smtp-Source: ABdhPJxnmhOYv2euY9ksI01F5gqolna2hRG133/GTQM60+Km/YtV5G3gA+e1829miYTAi2A47IEP1kOYwIr8UHDoaH4=
X-Received: by 2002:a17:90a:e2ca:: with SMTP id fr10mr3351707pjb.18.1617697307888;
 Tue, 06 Apr 2021 01:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <1614963744-25962-1-git-send-email-loic.poulain@linaro.org>
 <20210331171252.GK15610@work> <CAMZdPi-M5fYPs7QfsBx4Gy6ywCLue5yqJLn0XthGhTeON1wWfw@mail.gmail.com>
 <20210331182700.GL15610@work> <fe857b91841caf67c53e6a9ad967eb84@codeaurora.org>
 <8456ccb0-f644-80b2-a555-af8d0ca4e351@codeaurora.org>
In-Reply-To: <8456ccb0-f644-80b2-a555-af8d0ca4e351@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 6 Apr 2021 10:29:58 +0200
Message-ID: <CAMZdPi8STuK0Z=f5ykKLWxyrDqMoBkbYwN6K+e9ZJiQyQPBCrg@mail.gmail.com>
Subject: Re: [PATCH 1/2] bus: mhi: core: Fix MHI runtime_pm behavior
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Hemant, Bhaumik,

On Tue, 6 Apr 2021 at 05:54, Hemant Kumar <hemantk@codeaurora.org> wrote:
>
> Hi Loic,
>
> On 4/5/21 11:46 AM, Bhaumik Bhatt wrote:
> > On 2021-03-31 11:27 AM, Manivannan Sadhasivam wrote:
> >> On Wed, Mar 31, 2021 at 07:38:55PM +0200, Loic Poulain wrote:
> >>> Hi Mani,
> >>>
> >>> Le mer. 31 mars 2021 =C3=A0 19:12, Manivannan Sadhasivam <
> >>> manivannan.sadhasivam@linaro.org> a =C3=A9crit :
> >>>
> >>> > On Fri, Mar 05, 2021 at 06:02:23PM +0100, Loic Poulain wrote:
> >>> > > This change ensures that PM reference is always get during packet
> >>> > > queueing and released either after queuing completion (RX) or onc=
e
> >>> > > the buffer has been consumed (TX). This guarantees proper update =
for
> >>> > > underlying MHI controller runtime status (e.g. last_busy timestam=
p)
> >>> > > and prevents suspend to be triggered while TX packets are flying,
> >>> > > or before we completed update of the RX ring.
> >>> > >
> >>> >
> >>> > Any reason why you didn't wait for RX completion also?
> >>>
> >>>
> >>> Because on TX we know the buffer completion is going to happen really
> >>> quickly (we send data) whereas we never know when when RX packet will=
 be
> >>> completed (we are waiting for data), so we want to be able to put the
> >>> MHI
> >>> device in suspend while RX is pending (the device will wake up the
> >>> host on
> >>> incoming data)
> >>>
> >>
> >> Device wakeup will only happen for device initiated suspend (M1) but f=
or
> >> host initiated suspend (M3), device will check for pending data to hos=
t
> >> and will initiate wakeup request before going for suspend. So I think =
it
> >> is safe to wait for RX data.
> >>
> >> Hemant/Bhaumik, any thoughts?
> >>
> >> Thanks,
> >> Mani
> >>
> > Agree with Loic here. Let's not depend on the device to determine host =
side
> > behavior and instead, assume that the device may or may not be followin=
g
> > protocol so as to reduce chances of higher power draw by host. Host sho=
uld
> > not care when RX comes, but host should care about TX completion as tha=
t's
> > where our requirement ends.
> >
> > There have been instances of delayed RX and in some cases, no TX comple=
tion
> > from a certain client (I think DIAG), where device thinks they have
> > received
> > garbage and decide not to respond with a TX completion.
> >
> > We want to be able to put device in suspend or at least initiate it whi=
le
> > host waits for incoming data. Once RX comes in, host will wake up to
> > process it.
> Agree with Bhaumik and Loic about not waiting for Rx data.
> >
> > What Loic does in this patch is done in one way using patch [1].
> > However, that
> > does not update the last_busy timestamp. I am mostly in favor of this p=
atch
> > going in but would like Loic to answer one question:
> >
> > In mhi_reset_data_chan(), why not do a runtime_put(mhi_cntrl) inside th=
e
> > pre-existing if (mhi_chan->dir =3D=3D DMA_TO_DEVICE) at the start of th=
e
> > while loop:
> > while (tre_ring->rp !=3D tre_ring->wp)? This would be balanced for each=
 TX.
> I got same question when i looked at the patch.

Very true, I've not seen any issue, because there is 'usually' not TX
pending on reset/remove but we indeed need to take care of balancing
that here as well. I'm going to follow up with a new patch.

Thanks,
Loic
