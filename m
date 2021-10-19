Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6A54332CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 11:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235116AbhJSJto (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 05:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234764AbhJSJtn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 05:49:43 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07E9C061768
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 02:47:30 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id ls18so14267328pjb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 02:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rb8ExGG2m6SToBzEBDnEJVncQUD0CuENj6IXXVw/aPM=;
        b=q12/aHJIbvh4jCgzlU0YpjBa724C+4452crxCrhVOHnvH7LUzsW0H3nEWB9Y0/mVSn
         nF/PDPZ1dvcbuSiIs1PKqz8eZFk0up71EkAk4ewJVvblI6S7jnUG+Lj+v2VPZM9TI/tz
         f/RNNLy9poVSvWi0WRw7AgR8xL9Y9df/v1fmf2NZRUbBuosMZgv8Q3iJDlHpCoRz63JG
         ghq2877rXcPLS/Md6qNM6K/Wor84a6hi6a1JpdAjTxDbIWbzVul0XO491giT5Y7T5NSh
         LbuM7zA4R+krhr7LSPKfg4g1O4Buszhj6AoeWu7jdoRvPrBxTlJtbyIwORI6W6UYOdya
         +XWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rb8ExGG2m6SToBzEBDnEJVncQUD0CuENj6IXXVw/aPM=;
        b=tKI0o+ZItEPGTItE+6lUh/0ewGeK6rVoNwIfwmLNIk67bAa79M8Prt50tpxYl8yip+
         38zLUJQOYexUGr7xgRvPbkUAsDcBZpKAsKPIjSUBe9u7GtQ/twiNL0My4IfNEfgFkPhB
         +5ontnhoYfrbh8LIi8oNiWlSyJqvOoDLSKGt0BtHJC/vOPvhy5FafQrmtgBjY/0epMwT
         DOPFmhb80+WkjbCEi0hMF4Aq+MIfolsNYftcbdK57fz1c3g9pn/s33kHBQ2oX9xkO3+A
         4m9UaNwWgU+nYUabxHlGhJQzR5Y7TwlM3OxlNq3f+5vgePSz9i7RTFLToYR2r8X9St9a
         37nw==
X-Gm-Message-State: AOAM533t1n4JBgvtlARJI/1AWulSHkhL/P8wCAbSKIjoLUQxwMzhUqiu
        BYat88kDXXtUEYLhqzpGaZD4ww==
X-Google-Smtp-Source: ABdhPJyIBnnZqluV3NjfjUtyBpQBjEurCCCZ/4HqDgEPEknf2y4RPBYdBg7T4hopVIKhIOJYriHoMQ==
X-Received: by 2002:a17:90b:18f:: with SMTP id t15mr5398140pjs.19.1634636850019;
        Tue, 19 Oct 2021 02:47:30 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id nu16sm2328393pjb.56.2021.10.19.02.47.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Oct 2021 02:47:29 -0700 (PDT)
Date:   Tue, 19 Oct 2021 17:47:21 +0800
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
Message-ID: <20211019094720.GD7231@dragon>
References: <1634107104-22197-1-git-send-email-mkshah@codeaurora.org>
 <1634107104-22197-3-git-send-email-mkshah@codeaurora.org>
 <20211015135809.GB7231@dragon>
 <0802823a-4be2-6d55-b259-5084a809c7bb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0802823a-4be2-6d55-b259-5084a809c7bb@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 18, 2021 at 07:45:30PM +0530, Maulik Shah wrote:
> > > +static void qcom_create_soc_sleep_stat_files(struct dentry *root, void __iomem *reg,
> > > +					     struct stats_data *d,
> > > +					     const struct stats_config *config)
> > > +{
> > > +	char stat_type[sizeof(u32) + 1] = {0};
> > > +	size_t stats_offset = config->stats_offset;
> > > +	u32 offset = 0, type;
> > > +	int i, j;
> > > +
> > > +	/*
> > > +	 * On RPM targets, stats offset location is dynamic and changes from target
> > > +	 * to target and sometimes from build to build for same target.
> > > +	 *
> > > +	 * In such cases the dynamic address is present at 0x14 offset from base
> > > +	 * address in devicetree. The last 16bits indicates the stats_offset.
> > > +	 */
> > > +	if (config->dynamic_offset) {
> > > +		stats_offset = readl(reg + RPM_DYNAMIC_ADDR);
> > > +		stats_offset &= RPM_DYNAMIC_ADDR_MASK;
> > > +	}
> > > +
> > > +	for (i = 0; i < config->num_records; i++) {
> > > +		d[i].base = reg + offset + stats_offset;
> > > +
> > > +		/*
> > > +		 * Read the low power mode name and create debugfs file for it.
> > > +		 * The names read could be of below,
> > > +		 * (may change depending on low power mode supported).
> > > +		 * For rpmh-sleep-stats: "aosd", "cxsd" and "ddr".
> > > +		 * For rpm-sleep-stats: "vmin" and "vlow".
> > 
> > It reports 'vmin' and 'xosd' on MSM8939, 'vmin' and 'vlow' on SDM660.
> > I know that 'vmin' is VDD Minimization mode, and 'xosd' is XO Shutdown
> > mode.  But I'm not sure about 'vlow' mode.  Could you share some
> > information regarding what this low power mode is, and how it differs
> > from 'vmin' and 'xosd'?
> 
> vlow and xosd are same.
> vmin is xosd plus voltage minimization of chip, memory rails.

Thanks much for the info, Maulik!

I'm running your driver on qcm2290 and trying to reach vlow mode.

# cat /sys/kernel/debug/qcom_sleep_stats/vlow
Count: 0
Last Entered At: 0
Last Exited At: 0
Accumulated Duration: 0
Client Votes: 0x81
# echo mem > /sys/power/state 
[  551.446603] PM: suspend entry (s2idle)
[  551.450948] Filesystems sync: 0.000 seconds
[  551.462828] Freezing user space processes ... (elapsed 0.002 seconds) done.
[  551.472276] OOM killer disabled.
[  551.475556] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  551.484461] printk: Suspending console(s) (use no_console_suspend to debug)
[  551.561280] OOM killer enabled.
[  551.564461] Restarting tasks ... done.
[  551.569652] PM: suspend exit
# cat /sys/kernel/debug/qcom_sleep_stats/vlow
Count: 0
Last Entered At: 0
Last Exited At: 0
Accumulated Duration: 0
Client Votes: 0x818081

The count doesn't increases along with suspend/resume cycle at the
moment.  But as you can see, 'Client Votes' field changes.  If possible,
could you shed some light on what this means?

As the comparison, I'm also running the downstream 'rpm_master_stats'
driver in the same kernel, and the 'xo_count' field of APSS does
increase along with suspend/resume cycle.  May I ask some advices what
I'm possibly missing and thus getting different result between 'vlow'
and 'rpm_master_stats' report?

# cat /sys/kernel/debug/rpm_master_stats 
APSS
        shutdown_req:0x37EA3CC74
        wakeup_ind:0x0
        bringup_req:0x37F041958
        bringup_ack:0x37F042D54
        xo_last_entered_at:0x286FF36AC
        xo_last_exited_at:0x28AF94178
        xo_accumulated_duration:0x3EDD55B
        last_sleep_transition_duration:0x122f
        last_wake_transition_duration:0x11f8
        xo_count:0x1
        wakeup_reason:0x0
        numshutdowns:0x641
        active_cores:0x1
                core0
MPSS
        shutdown_req:0x0
        wakeup_ind:0x0
        bringup_req:0x0
        bringup_ack:0x0
        xo_last_entered_at:0x0
        xo_last_exited_at:0x0
        xo_accumulated_duration:0x0
        last_sleep_transition_duration:0x0
        last_wake_transition_duration:0x0
        xo_count:0x0
        wakeup_reason:0x0
        numshutdowns:0x0
        active_cores:0x1
                core0
ADSP
        shutdown_req:0x0
        wakeup_ind:0x0
        bringup_req:0x0
        bringup_ack:0x0
        xo_last_entered_at:0x0
        xo_last_exited_at:0x0
        xo_accumulated_duration:0x0
        last_sleep_transition_duration:0x0
        last_wake_transition_duration:0x0
        xo_count:0x0
        wakeup_reason:0x0
        numshutdowns:0x0
        active_cores:0x1
                core0
CDSP
        shutdown_req:0x0
        wakeup_ind:0x0
        bringup_req:0x0
        bringup_ack:0x0
        xo_last_entered_at:0x0
        xo_last_exited_at:0x0
        xo_accumulated_duration:0x0
        last_sleep_transition_duration:0x0
        last_wake_transition_duration:0x0
        xo_count:0x0
        wakeup_reason:0x0
        numshutdowns:0x0
        active_cores:0x0
TZ
        shutdown_req:0x0
        wakeup_ind:0x0
        bringup_req:0x0
        bringup_ack:0x0
        xo_last_entered_at:0x0
        xo_last_exited_at:0x0
        xo_accumulated_duration:0x0
        last_sleep_transition_duration:0x0
        last_wake_transition_duration:0x0
        xo_count:0x0
        wakeup_reason:0x0
        numshutdowns:0x0
        active_cores:0x0

Any comment or suggestion would be much appreciated!

Shawn
