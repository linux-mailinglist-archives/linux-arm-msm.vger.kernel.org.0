Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D2240EA2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 20:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245333AbhIPSqf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 14:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344269AbhIPSq2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 14:46:28 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C84EDC08E88D
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 10:19:32 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id y4so5005675pfe.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 10:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vfppOddBimlXKR9WfYAKpD75AZ1AT5Ln0YqbfJSrBQA=;
        b=XCkNHl8kcS/0Qgn6DtGioUwi3UGpp9yaSUkX6AIaAHVxHt6CWjhcgvE5uF0tFMJgTu
         GJ3qlQyId2bhiwxToQ9QXgA/LE1nFwFzIp1Qe319B6aUnxWfHHdLIUORYz4v50AvfcGv
         CPPhv3fd0Yd3Uzg7MgtWJveVEA3r054tjVv6p19Ui/dzOn8aoobt2VyaThJExdk6Y4oU
         h5eOXmGL5rZ2SpdIjKzi4MXwuAjSewzyUVq0BHjqXbek1y7X+pxbs/e+zm4SyboglDRT
         03uFXeQfhBae9LoI5cF13wjc0B2XppuOTkD56EnPO6UP6yl5tegpWn5qHb8VtpVRVLD0
         hsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vfppOddBimlXKR9WfYAKpD75AZ1AT5Ln0YqbfJSrBQA=;
        b=wHXGByh3RqaAMul8M/6aC6GhKj9j6N2vo4x10Ogoj6u8fSO6+BBovwKKwObFnbvdtg
         CepJN0+8C962770epQR4bOMyqTSa3X3x6MnC1ngOhY+traCD/WnciRgEvVCi2QR2f9un
         EYJPzKCy2eZZiJ3kPXjU61V27MTum5Jf4fgFiKcX4YHKIaTmeV8pw+qkD9MkdjNfLJ9J
         faV5n2BIRP1wQoDl1yPZS94LaiC85y3LZUy3+WUiuexEH52qii6nTNvYNUr5OI4VepTO
         EPIllSg7rW9Cij79NR/yngPQXuyomXxGr8uLCLKAndHpu6a0M9G0wmUJ00Iegq7LUEZX
         8V/w==
X-Gm-Message-State: AOAM53118a/j6cOYNkiLxjKsTPr4lIZ5rM408xIkxnaGXeeEKAXUZKFo
        inAsTZuS6BygO5eEG8nu9eBy
X-Google-Smtp-Source: ABdhPJwVVDHmLdlkvPxa0RTx6TeaN8ENWRxxpE5tjoHD788yzE86ICDdkUJKi9NvVNz7J3GzX/2j1g==
X-Received: by 2002:aa7:9841:0:b0:439:c4cb:fe9a with SMTP id n1-20020aa79841000000b00439c4cbfe9amr6279540pfq.13.1631812772167;
        Thu, 16 Sep 2021 10:19:32 -0700 (PDT)
Received: from thinkpad ([117.193.213.12])
        by smtp.gmail.com with ESMTPSA id o2sm3876721pgc.47.2021.09.16.10.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 10:19:31 -0700 (PDT)
Date:   Thu, 16 Sep 2021 22:49:27 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-wireless@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
Message-ID: <20210916171927.GB9027@thinkpad>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <20210916111218.GA12918@thinkpad>
 <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
 <20210916163529.GA9027@thinkpad>
 <87k0jgxyjp.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k0jgxyjp.fsf@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 16, 2021 at 07:42:02PM +0300, Kalle Valo wrote:
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
> > On Thu, Sep 16, 2021 at 01:18:22PM +0200, Loic Poulain wrote:
> >> Le jeu. 16 sept. 2021 à 13:12, Manivannan Sadhasivam <
> >> manivannan.sadhasivam@linaro.org> a écrit :
> >> 
> >
> > [...]
> >
> >> > If things seems to work fine without that patch, then it implies that
> >> > setting M0
> >> > state works during resume. I think we should just revert that patch.
> >> >
> >> > Loic, did that patch fix any issue for you or it was a cosmetic fix only?
> >> 
> >> 
> >> It fixes sdx modem resuming issue, without that we don’t know modem needs
> >> to be reinitialized.
> >> 
> >
> > Okay. Then in that case, the recovery mechanism has to be added to the ath11k
> > MHI controller.
> 
> What does that mean in practise, do you have any pointers or examples? I
> have no clue what you are proposing :)
> 

Take a look at the mhi_pci_recovery_work() function below:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/pci_generic.c#n610

You need to implement something similar that basically powers up the MHI
endpoint (QCA6390) in case pm_resume() fails. At minimum, you need to call
below functions:

# Check if the device is powered on. If yes, then power it down to bring it back
mhi_power_down()
mhi_unprepare_after_power_down()

# Power up the device
mhi_prepare_for_power_up()
mhi_sync_power_up()

This implies that the WLAN device has been powered off during suspend, so the
resume fails and we are bringing the device back to working state.

> > If that's too much of work for Kalle, then I'll look into it. But I might get
> > time only after Plumbers.
> 
> I'm busy, as always, so not sure when I'm able to do it either. I think
> we should seriously consider reverting 020d3b26c07a and adding it back
> after ath11k is able to handle this new situation.
> 

Since Loic said that reverting would cause his modem (SDX device) to fail during
resume, this is not possible.

Thanks,
Mani

> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
