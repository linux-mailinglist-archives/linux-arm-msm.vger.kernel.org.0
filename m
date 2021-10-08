Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C434267FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 12:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239840AbhJHKg3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 06:36:29 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:33856 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbhJHKg3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 06:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633689254;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=8D4gANPVn5NGKBKvljhYf71e+GYWJVAgFAZk0nSaJrw=;
    b=hxtvzktlZBbshcZss6tJNSMF5N5RiHvt8EG9A/fxsw32A/ev9MIqXHalR6eYYrq3Jo
    cHETEvf0VdWs7T1HOFZk/VTLBBgA2pgqlTsqPFbtT7fboSRPMPLGc1jwsEcM0BF9aAHg
    d0q58+tzftJohp1RBbwgxooJQALV1o334S64DFDnMNNF753p4YjaSdHHAtst1jt47j9m
    iadAJdudeVBrnKqb/sGqRpgTQXtqztXfHGZyosnLlK449Kf8zje3L0gwoRjUHvzVIn/J
    KBX5j8NtR73kca8tei17jU0vY8gtSKewiieWgJAMGoEOhCQl7142A+wG0na6eVkNTiJz
    y3cw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4pSA8p2M1A=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x98AYDhUg
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 8 Oct 2021 12:34:13 +0200 (CEST)
Date:   Fri, 8 Oct 2021 12:34:08 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, linux@roeck-us.net, rnayak@codeaurora.org,
        lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH v11 2/5] soc: qcom: Add Sleep stats driver
Message-ID: <YWAeoIu3ndsg5erY@gerhold.net>
References: <1633600649-7164-1-git-send-email-mkshah@codeaurora.org>
 <1633600649-7164-3-git-send-email-mkshah@codeaurora.org>
 <YV88fNYF0i1Wkr73@gerhold.net>
 <acaf7b6e-c5b7-ae27-c4ba-37f375f05f19@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acaf7b6e-c5b7-ae27-c4ba-37f375f05f19@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 08, 2021 at 02:45:20PM +0530, Maulik Shah wrote:
> On 10/7/2021 11:59 PM, Stephan Gerhold wrote:
> > On Thu, Oct 07, 2021 at 03:27:26PM +0530, Maulik Shah wrote:
> > > From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> > > 
> > > Let's add a driver to read the stats from remote processor and
> > > export to debugfs.
> > > 
> > > The driver creates "qcom_sleep_stats" directory in debugfs and
> > > adds files for various low power mode available. Below is sample
> > > output with command
> > > 
> > > cat /sys/kernel/debug/qcom_sleep_stats/ddr
> > > count = 0
> > > Last Entered At = 0
> > > Last Exited At = 0
> > > Accumulated Duration = 0
> > > 
> > > Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> > > Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> > > [mkshah: add subsystem sleep stats, create one file for each stat]
> > > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> > > ---
> > >   drivers/soc/qcom/Kconfig            |  10 ++
> > >   drivers/soc/qcom/Makefile           |   1 +
> > >   drivers/soc/qcom/qcom_sleep_stats.c | 259 ++++++++++++++++++++++++++++++++++++
> > >   3 files changed, 270 insertions(+)
> > >   create mode 100644 drivers/soc/qcom/qcom_sleep_stats.c
> > > 
> > > [...]
> > > +
> > > +static int qcom_subsystem_sleep_stats_show(struct seq_file *s, void *unused)
> > > +{
> > > +	struct subsystem_data *subsystem = s->private;
> > > +	struct sleep_stats *stat;
> > > +
> > > +	/* Items are allocated lazily, so lookup pointer each time */
> > > +	stat = qcom_smem_get(subsystem->pid, subsystem->smem_item, NULL);
> > > +	if (IS_ERR(stat))
> > > +		return -EIO;
> > > +
> > > [...]
> > > +
> > > +static void qcom_create_subsystem_stat_files(struct dentry *root)
> > > +{
> > > +	const struct sleep_stats *stat;
> > > +	int i;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(subsystems); i++) {
> > > +		stat = qcom_smem_get(subsystems[i].pid, subsystems[i].smem_item, NULL);
> > > +		if (IS_ERR(stat))
> > > +			continue;
> > > +
> > > +		debugfs_create_file(subsystems[i].name, 0400, root, (void *)&subsystems[i],
> > > +				    &qcom_subsystem_sleep_stats_fops);
> > 
> > This causes WARNINGs on MSM8996 and MSM8916:
> > 
> > [    0.503054] ------------[ cut here ]------------
> > [    0.503100] WARNING: CPU: 1 PID: 1 at drivers/soc/qcom/smem.c:587 qcom_smem_get+0x184/0x1b0
> > [    0.503184] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.15.0-rc4+ #378
> > [    0.503218] Hardware name: Xiaomi Mi Note 2 (DT)
> > [    0.503278] pc : qcom_smem_get+0x184/0x1b0
> > [    0.503307] lr : qcom_sleep_stats_probe+0xfc/0x20
> > [    0.503875] Call trace:
> > [    0.503896]  qcom_smem_get+0x184/0x1b0
> > [    0.503925]  qcom_sleep_stats_probe+0xfc/0x270
> > 
> > AFAICT from downstream the smem subsystem information is only read in
> > the rpmh_master_stat.c driver, should this be specific to RPMh?
> 
> Thanks for checking this on MSM8996. Probably it doesnot have SMEM items
> allocated so causes WARNINGs.
> 
> Keeping subsystem stats info in SMEM is not limited to only RPMH targets.
> Downstream has some RPM targets which also uses SMEM to store
> subsystem stats so the driver is kept generic.
> 

Thanks for clarifying. To be honest, I'm not sure if the WARN_ON() in
smem is very useful since this isn't really fundamentally different as
if the entry is not allocated. But at the end all that matters is that
there are no warnings when loading this driver on older targets.

> > 
> > There is a rpm_master_stat.c too but that looks quite different,
> > so I guess the approach is different with RPM?
> 
> Right. on existing upstream RPM targets i can skip to create/get SMEM items
> since
> they are not guranteed to be present and one should continue to use
> rpm_master_stats.c to get subsystem stats. (this uses entirely different
> data structure for sleep stats and are not part of RPM data ram/SMEM and are
> deprecated in downstream).
> 
> > 
> > Two more (unrelated) issues here:
> > 
> >    1. This will silently not register anything if SMEM probes after the
> >       qcom-sleep-stats driver (qcom_smem_get() will return -EPROBE_DEFER)
> >       and you will just skip registering the debugfs files.
> 
> I think module loading internally takes care of this.
> we're making a direct function call into the qcom_smem driver, so we
> already have a hard dependency on qcom_smem.ko being loaded.
> 

The driver can also be built-in and in this case this is not guaranteed.
This actually happened to me when I tried this on MSM8916: I did not get
the WARNINGs because all the qcom_smem_get() just returned -EPROBE_DEFER.
qcom_smem was then probed after qcom_sleep_stats. Of course, the smem
items are not present there anyway so it did not matter.

> > 
> >    2. In qcom_subsystem_sleep_stats_show() you say
> >       /* Items are allocated lazily, so lookup pointer each time */
> > 
> >       But, if the lookup fails here you don't register the debugfs file
> >       at all. Does this work if the subsystem is started after this driver?
> 
> Good catch. if the subsystem starts after this driver is loaded, the look up
> fails during probe and we don't create debugfs file for the subsystem.
> 
> one need to unload/load the driver again after sometime in bootup so by that
> time all the subsytems (modem, adsp, cdsp, etc) are up and we create debugfs
> file for them.
> 
> we have downstream fix for this to create the debugfs files irrespective of
> look up fails or not. i have plan to add it once the base driver gets
> merged.
> 

OK, I don't seem to have any recent Qualcomm platform that actually has
subsystem stats in SMEM so it doesn't bother me. I just wanted to
mention it for reference. :)

Thanks!
Stephan
