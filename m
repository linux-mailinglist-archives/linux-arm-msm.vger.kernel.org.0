Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412FA435EC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 12:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhJUKOq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 06:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbhJUKOp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 06:14:45 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8BFC061749
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 03:12:28 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id t11so39371plq.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 03:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mLXdN65a9yMzasIFL/pu8eCKhHpdkrcq8V8iLJo3a/w=;
        b=U8w48ov7GHrfm/1TMbrWYueZW3K6lUWZvNOnuIZSTc93grjLmizeX7BSHfvIbrAiV9
         aC/UD9A2Y6futk68kQUKn7e6Q5oWYsHCznRnmOmTGRN3OZqR4ZNHxRoFws9BhBI8uCJn
         yqa5Ut247+eLhdboCQOfEksSfjo2hC1FA8+6g9IicA4lxXQkZCKMvq1+lka+VQ/nzeEp
         oDvFY33m6l0Q9Lr+kcDviQWEBNRgzHDDf1F2MXZgTqpyNWYcsoUy3syUhDplzBUnCR6u
         rFUIVRtMab/N6EaCAYHUbRZF9KliEK2db5Xe2817/w8I6FCVeQRbqK40/SHEwx0jDy7N
         dfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mLXdN65a9yMzasIFL/pu8eCKhHpdkrcq8V8iLJo3a/w=;
        b=kYnbvkN+PbrXOt70nHQ/1PTGKjSIed1+TKzbAlioivumaEXixzAvpqWZgxe87Is5qE
         qPqrXi1/MvYm0QwFztM3XFJTt4iNQDS0SARVcaBb1SsFia4nhh+2An5xEiuH+EBug+sp
         hIipj9/azE07V3LqGPlkTzDN4Yoe2mlqRLM5kKST/zkgN3+HhLRQhNbsTLFyguaDAESw
         PlnT7K+v9HO7WzfbibfKmAaN1GMVDsjPzF+yW3UvdC9D78aKmSz+lWh/P2Gmq1CdlqMz
         +hNu0qosLYNJHPTV4PRfUU76+K5wEjyc2WcqEEHi5aZcn0UB2269K+ksSAVmt4qdGmtv
         oPrA==
X-Gm-Message-State: AOAM532tQlUaNnlXBuxUniSj0rt/Pu2krI+1w3G4fgmZGtLqnwN2/r8O
        J9DeCSQCNNtLwpok6IipNVX7fw==
X-Google-Smtp-Source: ABdhPJxtuCIkykTHbT5+QP8ZAi7+Pb18thx/un/NRJOBpLpkIA41cm2bw4v8M8yexpUkHGBik0dpcw==
X-Received: by 2002:a17:902:7c8d:b0:13a:768b:d6c0 with SMTP id y13-20020a1709027c8d00b0013a768bd6c0mr4435639pll.83.1634811148390;
        Thu, 21 Oct 2021 03:12:28 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id o72sm5345173pjo.50.2021.10.21.03.12.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 03:12:28 -0700 (PDT)
Date:   Thu, 21 Oct 2021 18:12:20 +0800
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
Message-ID: <20211021101218.GG7231@dragon>
References: <1634107104-22197-1-git-send-email-mkshah@codeaurora.org>
 <1634107104-22197-3-git-send-email-mkshah@codeaurora.org>
 <20211015135809.GB7231@dragon>
 <0802823a-4be2-6d55-b259-5084a809c7bb@codeaurora.org>
 <20211019094720.GD7231@dragon>
 <38c6bc38-8d5b-a65d-1a26-eb9f268c7644@codeaurora.org>
 <20211021015701.GF7231@dragon>
 <66d5fc8d-15ac-290c-8bb9-67900fe125a1@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66d5fc8d-15ac-290c-8bb9-67900fe125a1@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 21, 2021 at 03:11:26PM +0530, Maulik Shah wrote:
> Hi Shawn,
> 
> On 10/21/2021 7:27 AM, Shawn Guo wrote:
> > On Tue, Oct 19, 2021 at 06:16:57PM +0530, Maulik Shah wrote:
> > > Hi Shawn,
> > > 
> > > On 10/19/2021 3:17 PM, Shawn Guo wrote:
> > > > On Mon, Oct 18, 2021 at 07:45:30PM +0530, Maulik Shah wrote:
> > > > > > > +static void qcom_create_soc_sleep_stat_files(struct dentry *root, void __iomem *reg,
> > > > > > > +					     struct stats_data *d,
> > > > > > > +					     const struct stats_config *config)
> > > > > > > +{
> > > > > > > +	char stat_type[sizeof(u32) + 1] = {0};
> > > > > > > +	size_t stats_offset = config->stats_offset;
> > > > > > > +	u32 offset = 0, type;
> > > > > > > +	int i, j;
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * On RPM targets, stats offset location is dynamic and changes from target
> > > > > > > +	 * to target and sometimes from build to build for same target.
> > > > > > > +	 *
> > > > > > > +	 * In such cases the dynamic address is present at 0x14 offset from base
> > > > > > > +	 * address in devicetree. The last 16bits indicates the stats_offset.
> > > > > > > +	 */
> > > > > > > +	if (config->dynamic_offset) {
> > > > > > > +		stats_offset = readl(reg + RPM_DYNAMIC_ADDR);
> > > > > > > +		stats_offset &= RPM_DYNAMIC_ADDR_MASK;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	for (i = 0; i < config->num_records; i++) {
> > > > > > > +		d[i].base = reg + offset + stats_offset;
> > > > > > > +
> > > > > > > +		/*
> > > > > > > +		 * Read the low power mode name and create debugfs file for it.
> > > > > > > +		 * The names read could be of below,
> > > > > > > +		 * (may change depending on low power mode supported).
> > > > > > > +		 * For rpmh-sleep-stats: "aosd", "cxsd" and "ddr".
> > > > > > > +		 * For rpm-sleep-stats: "vmin" and "vlow".
> > > > > > 
> > > > > > It reports 'vmin' and 'xosd' on MSM8939, 'vmin' and 'vlow' on SDM660.
> > > > > > I know that 'vmin' is VDD Minimization mode, and 'xosd' is XO Shutdown
> > > > > > mode.  But I'm not sure about 'vlow' mode.  Could you share some
> > > > > > information regarding what this low power mode is, and how it differs
> > > > > > from 'vmin' and 'xosd'?
> > > > > 
> > > > > vlow and xosd are same.
> > > > > vmin is xosd plus voltage minimization of chip, memory rails.
> > > > 
> > > > Thanks much for the info, Maulik!
> > > > 
> > > > I'm running your driver on qcm2290 and trying to reach vlow mode.
> > > > 
> > > > # cat /sys/kernel/debug/qcom_sleep_stats/vlow
> > > > Count: 0
> > > > Last Entered At: 0
> > > > Last Exited At: 0
> > > > Accumulated Duration: 0
> > > > Client Votes: 0x81
> > > > # echo mem > /sys/power/state
> > > > [  551.446603] PM: suspend entry (s2idle)
> > > > [  551.450948] Filesystems sync: 0.000 seconds
> > > > [  551.462828] Freezing user space processes ... (elapsed 0.002 seconds) done.
> > > > [  551.472276] OOM killer disabled.
> > > > [  551.475556] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > > > [  551.484461] printk: Suspending console(s) (use no_console_suspend to debug)
> > > > [  551.561280] OOM killer enabled.
> > > > [  551.564461] Restarting tasks ... done.
> > > > [  551.569652] PM: suspend exit
> > > > # cat /sys/kernel/debug/qcom_sleep_stats/vlow
> > > > Count: 0
> > > > Last Entered At: 0
> > > > Last Exited At: 0
> > > > Accumulated Duration: 0
> > > > Client Votes: 0x818081
> > > > 
> > > > The count doesn't increases along with suspend/resume cycle at the
> > > > moment.  But as you can see, 'Client Votes' field changes.  If possible,
> > > > could you shed some light on what this means?
> > > 
> > > The count will increase only when all the subsystems (APSS/Modem,etc) are in
> > > power down mode and finally RPM decides to turn off xo clock.
> > > 
> > > > 
> > > > As the comparison, I'm also running the downstream 'rpm_master_stats'
> > > > driver in the same kernel, and the 'xo_count' field of APSS does
> > > > increase along with suspend/resume cycle.  May I ask some advices what
> > > > I'm possibly missing and thus getting different result between 'vlow'
> > > > and 'rpm_master_stats' report?
> > > 
> > > The vlow is a SoC level state whereas the rpm master stats indicate
> > > individual subsystem state. Since you are running suspend-resume the APSS is
> > > going to sleep so you see xo_count incremented for it but for MPSS i see it
> > > does not increase (modem is not entering to low power mode). similarly for
> > > ADSP/CDSP it does not increment. if all of these subsystems goes to power
> > > down and then there is sufficient sleep time for the SoC then you may see
> > > vlow/vmin incrementing.
> > > 
> > > Hope this clarifies.
> > 
> > Thanks Maulik!  It's very helpful.  I have a couple of further
> > questions, if you do not mind.
> > 
> > 1. We can understand most of vlow/vmin output.  But could you help
> >     decode 'Client Votes'?  It looks like the bits are shifting along
> >     with suspend/resume cycle.
> > 
> 
> Client votes are history of client votes on xo. Each byte represents xo
> clock votes from subsystems.
> 
> 
> > 2. In the rpm_master_stats output below, I know masters (processors)
> >     APSS, MPSS, ADSP and CDSP, but not really sure what TZ is.  If it's
> >     TrustZone, shouldn't it covered by APSS?
> 
> Yes it indicates for Trustzone but should be covered by APSS.

Thanks for confirming, Maulik!

Interestingly, while I'm seeing xo_count of APSS and TZ increase together
along with suspend on downstream kernel, with my upstream based kernel,
only APSS xo_count increases and TZ always stay at 0.  I guess that's
why I cannot reach vlow mode.  Do you have any suggestion why this
happens?  I must have something missing from my kernel.  Thanks!

Shawn

> > > > # cat /sys/kernel/debug/rpm_master_stats
> > > > APSS
> > > >           shutdown_req:0x37EA3CC74
> > > >           wakeup_ind:0x0
> > > >           bringup_req:0x37F041958
> > > >           bringup_ack:0x37F042D54
> > > >           xo_last_entered_at:0x286FF36AC
> > > >           xo_last_exited_at:0x28AF94178
> > > >           xo_accumulated_duration:0x3EDD55B
> > > >           last_sleep_transition_duration:0x122f
> > > >           last_wake_transition_duration:0x11f8
> > > >           xo_count:0x1
> > > >           wakeup_reason:0x0
> > > >           numshutdowns:0x641
> > > >           active_cores:0x1
> > > >                   core0
> > > > MPSS
> > > >           shutdown_req:0x0
> > > >           wakeup_ind:0x0
> > > >           bringup_req:0x0
> > > >           bringup_ack:0x0
> > > >           xo_last_entered_at:0x0
> > > >           xo_last_exited_at:0x0
> > > >           xo_accumulated_duration:0x0
> > > >           last_sleep_transition_duration:0x0
> > > >           last_wake_transition_duration:0x0
> > > >           xo_count:0x0
> > > >           wakeup_reason:0x0
> > > >           numshutdowns:0x0
> > > >           active_cores:0x1
> > > >                   core0
> > > > ADSP
> > > >           shutdown_req:0x0
> > > >           wakeup_ind:0x0
> > > >           bringup_req:0x0
> > > >           bringup_ack:0x0
> > > >           xo_last_entered_at:0x0
> > > >           xo_last_exited_at:0x0
> > > >           xo_accumulated_duration:0x0
> > > >           last_sleep_transition_duration:0x0
> > > >           last_wake_transition_duration:0x0
> > > >           xo_count:0x0
> > > >           wakeup_reason:0x0
> > > >           numshutdowns:0x0
> > > >           active_cores:0x1
> > > >                   core0
> > > > CDSP
> > > >           shutdown_req:0x0
> > > >           wakeup_ind:0x0
> > > >           bringup_req:0x0
> > > >           bringup_ack:0x0
> > > >           xo_last_entered_at:0x0
> > > >           xo_last_exited_at:0x0
> > > >           xo_accumulated_duration:0x0
> > > >           last_sleep_transition_duration:0x0
> > > >           last_wake_transition_duration:0x0
> > > >           xo_count:0x0
> > > >           wakeup_reason:0x0
> > > >           numshutdowns:0x0
> > > >           active_cores:0x0
> > > > TZ
> > > >           shutdown_req:0x0
> > > >           wakeup_ind:0x0
> > > >           bringup_req:0x0
> > > >           bringup_ack:0x0
> > > >           xo_last_entered_at:0x0
> > > >           xo_last_exited_at:0x0
> > > >           xo_accumulated_duration:0x0
> > > >           last_sleep_transition_duration:0x0
> > > >           last_wake_transition_duration:0x0
> > > >           xo_count:0x0
> > > >           wakeup_reason:0x0
> > > >           numshutdowns:0x0
> > > >           active_cores:0x0
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of
> Code Aurora Forum, hosted by The Linux Foundation
