Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8419435878
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 03:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhJUB71 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 21:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhJUB71 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 21:59:27 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 268BDC06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 18:57:11 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id n11so17423409plf.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 18:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KSXCMZKLQewPqE2LqdEUOe2maVmThStqtFi+a82qLfk=;
        b=B7SjQoyrw69NZKpRgWY9HKW4ZrXDFK4fGw3CnbA+1AaVIP4ZmYkNhWoypL6JtKDBtX
         oRWY8Oht8uqoTHrZJOsT1rFSxaamOC8eyw3a4O8BtPQOv6+Re0JGKPzVE5XxPC4hK93I
         MEdlLGTur8e/5qVXc+fvrcVQdIgOLhAr4G3Ii5JyfwOE5wqTWudwvnKI1Cvfp0Qys+U5
         ++IvpRmFFrPrUKnvEDQIJ0xDwmbRqK4pOb0h5BBd+BeuvNoPCa/u40LxMcchFCz5+uXI
         WmhCZarn15DT2hITY25A1qU7izdv+oYWQB/CK4Yf9akVaxkjqvZOdfJ5dzOyAb52Aqqa
         BaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KSXCMZKLQewPqE2LqdEUOe2maVmThStqtFi+a82qLfk=;
        b=J3v0kfMldz8J04avji71+VRpjj3zYEbYp/xztmj8jqEqhfX1/0hQMbIt/wnp792pnn
         tW6b9SUevb0vhnXLgDUSO5iOyXNjZSXFbm3cRZMzOmAnBuItcQjiB3JLo0zF13bhQ5a0
         DZ6/MQghY1Uyv+xVjzV8XxLj/Y7S+lRF222V1OtLjbx8Wk2DjFfGsGZ/5UoZDK4TF93V
         TZMD71bSoN1ckxHWxNJr421ifvh75irCHv0cyS0szAYa8F3yq9NQhRs2t7oHV06c2QhN
         ync93fN1FVQa4G8RhkQutxE3e3moellnP/srvrIZBF/Nf+ibqES96ZvsdXuHvSOnpS/f
         t5+w==
X-Gm-Message-State: AOAM530kOwQx2Gi226Slm01bAobm1cOWL4X1BfrbevrnH0OyEq12+HUk
        3nGsCUTcjA6uoIpUoq0D38zCOw==
X-Google-Smtp-Source: ABdhPJxhV6qX3zwhzhbJhwqRe9Ul/x9aPC6AgQXIjMV/wSt1XKycgeHUovzTXe2RTVdlloiQYTorhg==
X-Received: by 2002:a17:90a:b391:: with SMTP id e17mr3101624pjr.137.1634781431301;
        Wed, 20 Oct 2021 18:57:11 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id z126sm3410064pgz.55.2021.10.20.18.57.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 18:57:11 -0700 (PDT)
Date:   Thu, 21 Oct 2021 09:57:02 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, linux@roeck-us.net, rnayak@codeaurora.org,
        lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v12 2/5] soc: qcom: Add Sleep stats driver
Message-ID: <20211021015701.GF7231@dragon>
References: <1634107104-22197-1-git-send-email-mkshah@codeaurora.org>
 <1634107104-22197-3-git-send-email-mkshah@codeaurora.org>
 <20211015135809.GB7231@dragon>
 <0802823a-4be2-6d55-b259-5084a809c7bb@codeaurora.org>
 <20211019094720.GD7231@dragon>
 <38c6bc38-8d5b-a65d-1a26-eb9f268c7644@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38c6bc38-8d5b-a65d-1a26-eb9f268c7644@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 19, 2021 at 06:16:57PM +0530, Maulik Shah wrote:
> Hi Shawn,
> 
> On 10/19/2021 3:17 PM, Shawn Guo wrote:
> > On Mon, Oct 18, 2021 at 07:45:30PM +0530, Maulik Shah wrote:
> > > > > +static void qcom_create_soc_sleep_stat_files(struct dentry *root, void __iomem *reg,
> > > > > +					     struct stats_data *d,
> > > > > +					     const struct stats_config *config)
> > > > > +{
> > > > > +	char stat_type[sizeof(u32) + 1] = {0};
> > > > > +	size_t stats_offset = config->stats_offset;
> > > > > +	u32 offset = 0, type;
> > > > > +	int i, j;
> > > > > +
> > > > > +	/*
> > > > > +	 * On RPM targets, stats offset location is dynamic and changes from target
> > > > > +	 * to target and sometimes from build to build for same target.
> > > > > +	 *
> > > > > +	 * In such cases the dynamic address is present at 0x14 offset from base
> > > > > +	 * address in devicetree. The last 16bits indicates the stats_offset.
> > > > > +	 */
> > > > > +	if (config->dynamic_offset) {
> > > > > +		stats_offset = readl(reg + RPM_DYNAMIC_ADDR);
> > > > > +		stats_offset &= RPM_DYNAMIC_ADDR_MASK;
> > > > > +	}
> > > > > +
> > > > > +	for (i = 0; i < config->num_records; i++) {
> > > > > +		d[i].base = reg + offset + stats_offset;
> > > > > +
> > > > > +		/*
> > > > > +		 * Read the low power mode name and create debugfs file for it.
> > > > > +		 * The names read could be of below,
> > > > > +		 * (may change depending on low power mode supported).
> > > > > +		 * For rpmh-sleep-stats: "aosd", "cxsd" and "ddr".
> > > > > +		 * For rpm-sleep-stats: "vmin" and "vlow".
> > > > 
> > > > It reports 'vmin' and 'xosd' on MSM8939, 'vmin' and 'vlow' on SDM660.
> > > > I know that 'vmin' is VDD Minimization mode, and 'xosd' is XO Shutdown
> > > > mode.  But I'm not sure about 'vlow' mode.  Could you share some
> > > > information regarding what this low power mode is, and how it differs
> > > > from 'vmin' and 'xosd'?
> > > 
> > > vlow and xosd are same.
> > > vmin is xosd plus voltage minimization of chip, memory rails.
> > 
> > Thanks much for the info, Maulik!
> > 
> > I'm running your driver on qcm2290 and trying to reach vlow mode.
> > 
> > # cat /sys/kernel/debug/qcom_sleep_stats/vlow
> > Count: 0
> > Last Entered At: 0
> > Last Exited At: 0
> > Accumulated Duration: 0
> > Client Votes: 0x81
> > # echo mem > /sys/power/state
> > [  551.446603] PM: suspend entry (s2idle)
> > [  551.450948] Filesystems sync: 0.000 seconds
> > [  551.462828] Freezing user space processes ... (elapsed 0.002 seconds) done.
> > [  551.472276] OOM killer disabled.
> > [  551.475556] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > [  551.484461] printk: Suspending console(s) (use no_console_suspend to debug)
> > [  551.561280] OOM killer enabled.
> > [  551.564461] Restarting tasks ... done.
> > [  551.569652] PM: suspend exit
> > # cat /sys/kernel/debug/qcom_sleep_stats/vlow
> > Count: 0
> > Last Entered At: 0
> > Last Exited At: 0
> > Accumulated Duration: 0
> > Client Votes: 0x818081
> > 
> > The count doesn't increases along with suspend/resume cycle at the
> > moment.  But as you can see, 'Client Votes' field changes.  If possible,
> > could you shed some light on what this means?
> 
> The count will increase only when all the subsystems (APSS/Modem,etc) are in
> power down mode and finally RPM decides to turn off xo clock.
> 
> > 
> > As the comparison, I'm also running the downstream 'rpm_master_stats'
> > driver in the same kernel, and the 'xo_count' field of APSS does
> > increase along with suspend/resume cycle.  May I ask some advices what
> > I'm possibly missing and thus getting different result between 'vlow'
> > and 'rpm_master_stats' report?
> 
> The vlow is a SoC level state whereas the rpm master stats indicate
> individual subsystem state. Since you are running suspend-resume the APSS is
> going to sleep so you see xo_count incremented for it but for MPSS i see it
> does not increase (modem is not entering to low power mode). similarly for
> ADSP/CDSP it does not increment. if all of these subsystems goes to power
> down and then there is sufficient sleep time for the SoC then you may see
> vlow/vmin incrementing.
> 
> Hope this clarifies.

Thanks Maulik!  It's very helpful.  I have a couple of further
questions, if you do not mind.

1. We can understand most of vlow/vmin output.  But could you help
   decode 'Client Votes'?  It looks like the bits are shifting along
   with suspend/resume cycle.

2. In the rpm_master_stats output below, I know masters (processors)
   APSS, MPSS, ADSP and CDSP, but not really sure what TZ is.  If it's
   TrustZone, shouldn't it covered by APSS?

Thanks for sharing your insights!

Shawn

> > # cat /sys/kernel/debug/rpm_master_stats
> > APSS
> >          shutdown_req:0x37EA3CC74
> >          wakeup_ind:0x0
> >          bringup_req:0x37F041958
> >          bringup_ack:0x37F042D54
> >          xo_last_entered_at:0x286FF36AC
> >          xo_last_exited_at:0x28AF94178
> >          xo_accumulated_duration:0x3EDD55B
> >          last_sleep_transition_duration:0x122f
> >          last_wake_transition_duration:0x11f8
> >          xo_count:0x1
> >          wakeup_reason:0x0
> >          numshutdowns:0x641
> >          active_cores:0x1
> >                  core0
> > MPSS
> >          shutdown_req:0x0
> >          wakeup_ind:0x0
> >          bringup_req:0x0
> >          bringup_ack:0x0
> >          xo_last_entered_at:0x0
> >          xo_last_exited_at:0x0
> >          xo_accumulated_duration:0x0
> >          last_sleep_transition_duration:0x0
> >          last_wake_transition_duration:0x0
> >          xo_count:0x0
> >          wakeup_reason:0x0
> >          numshutdowns:0x0
> >          active_cores:0x1
> >                  core0
> > ADSP
> >          shutdown_req:0x0
> >          wakeup_ind:0x0
> >          bringup_req:0x0
> >          bringup_ack:0x0
> >          xo_last_entered_at:0x0
> >          xo_last_exited_at:0x0
> >          xo_accumulated_duration:0x0
> >          last_sleep_transition_duration:0x0
> >          last_wake_transition_duration:0x0
> >          xo_count:0x0
> >          wakeup_reason:0x0
> >          numshutdowns:0x0
> >          active_cores:0x1
> >                  core0
> > CDSP
> >          shutdown_req:0x0
> >          wakeup_ind:0x0
> >          bringup_req:0x0
> >          bringup_ack:0x0
> >          xo_last_entered_at:0x0
> >          xo_last_exited_at:0x0
> >          xo_accumulated_duration:0x0
> >          last_sleep_transition_duration:0x0
> >          last_wake_transition_duration:0x0
> >          xo_count:0x0
> >          wakeup_reason:0x0
> >          numshutdowns:0x0
> >          active_cores:0x0
> > TZ
> >          shutdown_req:0x0
> >          wakeup_ind:0x0
> >          bringup_req:0x0
> >          bringup_ack:0x0
> >          xo_last_entered_at:0x0
> >          xo_last_exited_at:0x0
> >          xo_accumulated_duration:0x0
> >          last_sleep_transition_duration:0x0
> >          last_wake_transition_duration:0x0
> >          xo_count:0x0
> >          wakeup_reason:0x0
> >          numshutdowns:0x0
> >          active_cores:0x0
