Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADBC2C6939
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 17:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731265AbgK0QPE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 11:15:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731187AbgK0QPE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 11:15:04 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC51C0613D1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 08:15:03 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id v22so6225658edt.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 08:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GLjB+sMScZFpxq9evM0/LCP+EuEe8tWdWv0NTwzAgvA=;
        b=Cd03yXLx/fSex0adcoh/ctEuGkMmNeB6Vio/Vw3rkfGafNIv6xUo7vPLQDnyTiB6uJ
         YMC0RlifQ3RElZD0twotZO6NnZKsDfdRUFQ+nyu4lmQUVLf4mYWvYrfX5oX2B+19nO8B
         R+icMLqT8n94Sko30smY4tGScQ3+ZsWo+9HV+2wWvqQHe5zERwkWIzQne79e8XS4BMV9
         2OIpJwS6tnYCJbFoUiMURYmis2I0hvHpeNBGLVuDFo3HodL0tZj9m6qMUBcZzi5n6/8+
         PJZzqDYO91pXmgoC6EfbeegAKguvsejLQL0QUiqw+j8CC9dmRouV6PqKJNoMwLTC+1LT
         I22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GLjB+sMScZFpxq9evM0/LCP+EuEe8tWdWv0NTwzAgvA=;
        b=L4GKbgsnt0Jum7awC58Pz+CPKK5htIYD4GFRz4cHY+ftYsrTY19iNlvSzW8VsgkdYC
         acH5hAyNc9MeAHeGbOMw+ObtrOTWsEy7ATKbvDobaE+vvOwBQ6/6XEKesny5whIXND6m
         t7UnOBfDTAYX4j/A3sdqiQZVz2qSyvERsn8kyzg+8RCjhQlRHRfkGYOqF5G1rGTaT0bM
         jGE7leByWk9JfzbbLQjAsNH7xabDw2Bqwt4lRNEpBd0L0Gy5DLljQa2KMmxsRrQR3x7r
         6xp7Db/QG2P0Bi1MDReIixeB+9h+6ejyJ6xGBu0p1+jDuGES8f3y+FAQVxyeO/5dLViE
         dQ+Q==
X-Gm-Message-State: AOAM530AxLOESvCHx4qX/8Qe93cN0vKFpPB4XHmj0IplRazFQ3u6Yxif
        tXdRvmDlB44kNKpE3TjPm5s1BkAxXfgcg0RgBybbk6s/svOrEQ==
X-Google-Smtp-Source: ABdhPJzC+C/jEPWmmxRandHP6xagUXIRL/ixIb4KN4wUTm2jQmiYZQBq4Y1G6lvOJyfa8WH3oH+UNIu3TPbGwgxrdME=
X-Received: by 2002:a05:6402:2373:: with SMTP id a19mr8527113eda.212.1606493702464;
 Fri, 27 Nov 2020 08:15:02 -0800 (PST)
MIME-Version: 1.0
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
 <1605279602-18749-3-git-send-email-loic.poulain@linaro.org>
 <ad4fa874-163a-227b-3291-727b1ee27f06@codeaurora.org> <CAMZdPi8pOVB6rsERsbyLEkRuf4tjNaC-eZa1mFnyiTBws1K9=Q@mail.gmail.com>
 <f964e9ff-b2f3-dde4-13d8-9fc711b899da@codeaurora.org>
In-Reply-To: <f964e9ff-b2f3-dde4-13d8-9fc711b899da@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 27 Nov 2020 17:21:20 +0100
Message-ID: <CAMZdPi83hzkW7bpWddFsF6PeRqna6T8ye0QZ51NHz2r5AxpgHA@mail.gmail.com>
Subject: Re: [PATCH 2/8] mhi: pci-generic: Perform hard reset on remove
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeffrey,

On Wed, 25 Nov 2020 at 18:41, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> >>> @@ -329,6 +336,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
> >>>        mhi_power_down(mhi_cntrl, true);
> >>>        mhi_unprepare_after_power_down(mhi_cntrl);
> >>>        mhi_unregister_controller(mhi_cntrl);
> >>> +
> >>> +     /* MHI-layer reset could not be enough, always hard-reset the device */
> >>> +     mhi_pci_reset(mhi_cntrl);
> >>
> >> Referring to MHI spec:
> >> Hosts writes this register to trigger a reset. This can be used when the
> >> host detects a timeout in the MHI protocol and can use the reset as a
> >> last resort to recover the device. Host should first attempt an MHI
> >> Reset procedure before resetting the entire device.
> >>
> >> What issue are you facing which requires you to do full device reset ?
> >> Based on the spec recommendation, looks like this should be a last resort.
> >
> > On module unload/reload, the device does not go through cold reset and
> > can be in error state on further reload, causing mhi power up to fail.
> > This patch simply resets the device in remove so that it is in the
> > exact same condition as before probing (not only MHI layer, but all
> > the device context), I think it makes sense and prevents any
> > unexpected state on further reloading. Note also that unloading the
> > module (or unbinding the device) is not something that usually
> > happens, except when the user does it explicitly for any reason.
>
> This seems unnecessary to me.  Qaic has the same usecase, and the MHI
> state machine reset is sufficient.  Perhaps you have a unique edge case
> though.
>
> However, you are implementing the soc_reset functionality in your
> driver, when its a common MHI functionality, and is something I would
> like to use.  If you dig back, I proposed a sysfs extension to expose
> that to userspace, but I have a desire to use it from my driver, same as
> you.
>
> Would you please make MHI core changes to expose the soc_reset
> functionality out so that multiple drivers can use a common implementation?

I overlooked this reply, going to move that into MHI core, as you suggested.

Thanks,
Loic
