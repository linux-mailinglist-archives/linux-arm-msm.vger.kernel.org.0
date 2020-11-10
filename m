Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E8B2AD471
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 12:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgKJLIk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 06:08:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgKJLIk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 06:08:40 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B250C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 03:08:38 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id l5so5768227edq.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 03:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DHp9Qr/oN/1M5mUr34BLzHSuue5OEsKuWWvTqbOdF+A=;
        b=hWytcaBG2v1uaXdRkR+Qbx2dTeyCzTCzrlK3iu0q5LOdGJx7wPMrvmcG4ERH4k6ndP
         NsPLXgzLIRNIUE3f1PJTZVfqHrJlNOLrpa5VFIwKC8KwQkNnoQ5v3J76gNsPyKK7GUc2
         puf0eXfePu+WpmcKjBHiddRadqi9YyXIDRRsdQETepaGRD/Ul3r0Iv+aa5WyB+DUpLlc
         u+ZvSFqisy/oZiMKB42EQqZs+MI3ub5kexSKth0bFdTfMSm8rN3B/KVb9FsgVm1PNRz2
         V271vXALPZtlXZFAnQ2Za6kbuen8whu7sgd0I+Dz7gIHG/WnrPvMPqM5z+c4SfRkkOvh
         IOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DHp9Qr/oN/1M5mUr34BLzHSuue5OEsKuWWvTqbOdF+A=;
        b=npqQPhDeil3DGDq8zf4thjI53hfMOOiK12wHZGQ9xUn2QGhdQOH4e2948iU7ATDstT
         ZlD1AqnXe14I4fGsUWcOiWc/9QtQLhA8QANRWuCeKVaUtx9H0inTOF8kabE8+/I9VQ53
         S35qHpcyZbsAQH8qcs5dHDMYYLIYvCE3nCVWAOCbsE6VpaPbonOvGWrkDiH4G6rlNnwV
         s32zomJKtAC7Zf0pddM1/IttxqM/CEA6TTFygZa2gUYLGAWcx1ZnlQ+FmiLGrqbiGGCE
         3Dk6aCTrTbfecO4AUyLlqO0MLZp4ui+kX4Kfikeq9jwOTh/3pNQkYcblqMvxlVR8JL1b
         /MtA==
X-Gm-Message-State: AOAM5339bYoxHkCKqzWRUj5S9LgT2a6zfZVdQ+3VbeqwxvECtq4L1Qpt
        n2AckBGx8CtLB1ZnTpHhM1EpY0Pds+C0TnT70HhOhg==
X-Google-Smtp-Source: ABdhPJx9xh/Q6tTtlIQ7UiBqsLq/6qQsw+vRlYyudqQnEjfVha5qM+4pNhvjGz8Ar3Qm3iH7QIyxFtGcNNS80o7Xvpo=
X-Received: by 2002:a05:6402:8cc:: with SMTP id d12mr20476369edz.134.1605006516989;
 Tue, 10 Nov 2020 03:08:36 -0800 (PST)
MIME-Version: 1.0
References: <1604961850-27671-1-git-send-email-bbhatt@codeaurora.org> <1604961850-27671-4-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1604961850-27671-4-git-send-email-bbhatt@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 10 Nov 2020 12:14:27 +0100
Message-ID: <CAMZdPi_dwT+hj26sxJdMS1v-X-MNd1ys34QD=Bf_O+dvmjOD2Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] bus: mhi: core: Add support to pause or resume
 channel data transfers
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhaumik,

On Mon, 9 Nov 2020 at 23:44, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> Some MHI clients may want to request for pausing or resuming of the
> data transfers for their channels. Enable them to do so using the new
> APIs provided for the same.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/main.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/mhi.h         | 16 ++++++++++++++++
>  2 files changed, 57 insertions(+)
>
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 1226933..01845c6 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1560,6 +1560,47 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
>  }
>  EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
>
> +static int mhi_update_transfer_state(struct mhi_device *mhi_dev,
> +                                    enum mhi_ch_state_type to_state)
> +{
> +       struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +       struct mhi_chan *mhi_chan;
> +       int dir, ret;
> +
> +       for (dir = 0; dir < 2; dir++) {
> +               mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
> +
> +               if (!mhi_chan)
> +                       continue;
> +
> +               /*
> +                * Bail out if one of the channels fail as client will reset
> +                * both upon failure
> +                */
> +               mutex_lock(&mhi_chan->mutex);
> +               ret = mhi_update_channel_state(mhi_cntrl, mhi_chan, to_state);
> +               if (ret) {
> +                       mutex_unlock(&mhi_chan->mutex);
> +                       return ret;
> +               }
> +               mutex_unlock(&mhi_chan->mutex);
> +       }
> +
> +       return 0;
> +}
> +
> +int mhi_pause_transfer(struct mhi_device *mhi_dev)
> +{
> +       return mhi_update_transfer_state(mhi_dev, MHI_CH_STATE_TYPE_STOP);
> +}
> +EXPORT_SYMBOL_GPL(mhi_pause_transfer);
> +
> +int mhi_resume_transfer(struct mhi_device *mhi_dev)
> +{
> +       return mhi_update_transfer_state(mhi_dev, MHI_CH_STATE_TYPE_START);
> +}
> +EXPORT_SYMBOL_GPL(mhi_resume_transfer);

Look like it is stop and start, not pause and resume?

TBH maybe we should rework/clarify MHI core and having well-defined
states, maybe something like that:

1. When MHI core detects device for a driver, MHI core resets and
initializes the channel(s), then call client driver probe function
    => channel UNKNOWN->DISABLED state
    => channel DISABLED->ENABLED state
2. When driver is ready for sending data, drivers calls mhi_start_transfer
    => Channel is ENABLED->RUNNING state
3. Driver performs normal data transfers
4. The driver can suspend/resume transfer, it stops (suspend) the channel, can
    => Channel is RUNNING->STOP
    => Channel is STOP->RUNNING
   ...
5. When device is removed, MHI core reset the channel
    => channel is (RUNNING|STOP) -> DISABLED

Today mhi_prepare_for_transfer performs both ENABLE and RUNNING
transition, the idea would be to keep channel enabling/disabling in
the MHI core (before/after driver probe/remove) and channel start/stop
managed by the client driver.

Regards,
Loic
