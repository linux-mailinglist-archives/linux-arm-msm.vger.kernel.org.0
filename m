Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD093E8654
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 01:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235314AbhHJXLg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 19:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235309AbhHJXLf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 19:11:35 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B807C0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 16:11:13 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id r17-20020a0568302371b0290504f3f418fbso1059107oth.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 16:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6k/wx6m+QJ/KlUp48PSjkqVXsVZIRjT7zgrmzwo+LyQ=;
        b=OJMoA75yQfF6nIJT4ewyNMLTnvWZOgMWN8T989A9NATkVmWkcvEHkZ//Bbn/zE9y5K
         Z1Uispq+zjpJYh98KfUHe2JqgRI8s9r8zjUtY4VEagIcHTLQwR4ERyUWOrxTJP4lSeoN
         CyWrshuezwqkzMkQND0H44Am2oxZs7sJ+23nOp9WHQ3Tgg4nBnUpNlorVEERJEiBxOrt
         sr4IaD0me6krumvAf7VrApwnuiE/br4ETEzZTMqne1qiycmW6vPyQXfTvK7SfOUQB4uo
         ulurrn3w4C/7oWPbzBP/asuwu5bgTiDbiBybFldqv5zfKX7v7h38qWUKLk/TSpyYmFYw
         5f2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6k/wx6m+QJ/KlUp48PSjkqVXsVZIRjT7zgrmzwo+LyQ=;
        b=Pe6lX2tLTdeEd86PExfc57mScy+Jz3DtwkZPLs7yo14mXBexx3MzDtHcfZsatSRRP6
         Zco6zUYdVsIXtqqMAj9dwgT4Pdp48ENEzADkOiwg+Y4ayBoHmbJqHELbI87pCwe6Yzo8
         FpbA4u7uPca9wdourBkrcGa8KfE45gXF1o7DJVtNNqFaplKvO3xRnj3xaDceAoRyw0M3
         iJAMBCUCtzxt5Nb5J+QtHKYjjxxRxK4MS/CbG7DKgUuK2zpqAxJz7XDCw2M50khwTm7c
         pZSFr0aGY+WhkkFQCSQUjE6D1vZhXkA5anON7i2t5VZRHFFan3tsQ2jaLJ8iJGWjolzv
         2aHw==
X-Gm-Message-State: AOAM530JOp4upYNoC09N5htAvtvGA3eE5BpaPTiYMfwWOQeUuppJfZXp
        JY0fSfQdl8DpL8of0b1+FVyyZw==
X-Google-Smtp-Source: ABdhPJxorQVOzl3SFtPyjfr0z3XLe0f2nbmj0FKS3FiM+slX5zDmMsJ6o4Dlo0xQzYOLfYQRmQsFIQ==
X-Received: by 2002:a9d:7651:: with SMTP id o17mr22363483otl.205.1628637072682;
        Tue, 10 Aug 2021 16:11:12 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k26sm2359920otb.53.2021.08.10.16.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 16:11:12 -0700 (PDT)
Date:   Tue, 10 Aug 2021 18:11:10 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        clew@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V1 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P
 IRQ
Message-ID: <YRMHjmEG3l4SolTi@builder.lan>
References: <1628180254-758-1-git-send-email-deesin@codeaurora.org>
 <CAE-0n5203g4CkF5WP1fQYU57fntXbdyVBsMsTKU_xPkgvbt+7Q@mail.gmail.com>
 <bf2b00c5-0826-00d2-ca95-b4ae6a030211@codeaurora.org>
 <CAE-0n53ojhs+RMpsYtVjsrYbb_PRdkJOvxFhiTtJPMUDuoP_eA@mail.gmail.com>
 <8009f5a1458468dbf0b7b20dd166911c@codeaurora.org>
 <CAE-0n53TCo1UTVi3e18N5hF3+Y_bLiqgH1o5PEua7F9-bog_gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53TCo1UTVi3e18N5hF3+Y_bLiqgH1o5PEua7F9-bog_gQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 Aug 14:18 CDT 2021, Stephen Boyd wrote:

> Quoting Sibi Sankar (2021-08-10 10:24:32)
> > On 2021-08-09 23:28, Stephen Boyd wrote:
> > > Quoting Deepak Kumar Singh (2021-08-09 04:05:08)
> > >>
> > >> On 8/6/2021 1:10 AM, Stephen Boyd wrote:
> > >> > Quoting Deepak Kumar Singh (2021-08-05 09:17:33)
> > >> >> Some use cases require SMP2P interrupts to wake up the host
> > >> >> from suspend.
> > >> > Please elaborate on this point so we understand what sort of scenarios
> > >> > want to wakeup from suspend.
> > >>
> > >> Once such scenario is where WiFi/modem crashes and notifies crash to
> > >> local host through smp2p
> > >>
> > >> if local host is in suspend it should wake up to handle the crash and
> > >> reboot the WiFi/modem.
> > >
> > > Does anything go wrong if the firmware crashes during suspend and the
> > > local host doesn't handle it until it wakes for some other reason? I'd
> > > like to understand if the crash handling can be delayed/combined with
> > > another wakeup.
> >
> > If the modem firmware crashes
> > during suspend, the system comes
> > out of xo-shutdown and AFAIK stays
> > there until we handle the interrupt.
> >
> 
> So you're saying we waste power if we don't wakeup the AP and leave the
> SoC in a shallow low power state? That would be good to have indicated
> in the code via a comment and in the commit text so we know that we want
> to handle the wakeup by default.

Sounds like in a system without autosleep (or userspace equivalent) it
would be desirable to leave the SoC in this lower state than to wake up
the system handle the crash and then just idle?

But leaving the system in this state will result in you missing your
important phone calls...

Regards,
Bjorn
