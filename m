Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB74C425AC6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 20:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbhJGSbi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 14:31:38 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:36278 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbhJGSbh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 14:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633631361;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=y+ZVoE7qvcX3dWBAXSBwFesU2ut2MT+SqkKvb13XGbo=;
    b=DwMUQt1GkP+JDXX3EyCgGOsJaQEWrgh9jv+3dgC31T6rLd2fH0zc19/ccPF+gvOjHn
    bW7lNOE/WHfj5i+0Srlh8u1DA1Mv2+fkxgtZji15ck+TR0VV/pU38a6Fc4xIeyDvqkuf
    5X830QxC2K9ijIhaPVh9DWMATknZqMqf0LMNIjFSVLAo2S6T0QLqcd1XZ5PCUNy7BABe
    h4xLIe0mir3STtrRrIPxzwy/phAIb2nsijnL+ih6efj5BkjZWJK3HwLndFAt4qAXuptd
    owZ/W1ACDc/2DX2PMe6GU9XfRo8wyrPxinCoZyxgP7LsYdix2L9vg3Wgo7zSynpZzvIa
    0AlA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4pSA8pmE1A=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x97ITLfFt
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 7 Oct 2021 20:29:21 +0200 (CEST)
Date:   Thu, 7 Oct 2021 20:29:16 +0200
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
Message-ID: <YV88fNYF0i1Wkr73@gerhold.net>
References: <1633600649-7164-1-git-send-email-mkshah@codeaurora.org>
 <1633600649-7164-3-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633600649-7164-3-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Maulik,

On Thu, Oct 07, 2021 at 03:27:26PM +0530, Maulik Shah wrote:
> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> 
> Let's add a driver to read the stats from remote processor and
> export to debugfs.
> 
> The driver creates "qcom_sleep_stats" directory in debugfs and
> adds files for various low power mode available. Below is sample
> output with command
> 
> cat /sys/kernel/debug/qcom_sleep_stats/ddr
> count = 0
> Last Entered At = 0
> Last Exited At = 0
> Accumulated Duration = 0
> 
> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> [mkshah: add subsystem sleep stats, create one file for each stat]
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/Kconfig            |  10 ++
>  drivers/soc/qcom/Makefile           |   1 +
>  drivers/soc/qcom/qcom_sleep_stats.c | 259 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 270 insertions(+)
>  create mode 100644 drivers/soc/qcom/qcom_sleep_stats.c
> 
> [...]
> +
> +static int qcom_subsystem_sleep_stats_show(struct seq_file *s, void *unused)
> +{
> +	struct subsystem_data *subsystem = s->private;
> +	struct sleep_stats *stat;
> +
> +	/* Items are allocated lazily, so lookup pointer each time */
> +	stat = qcom_smem_get(subsystem->pid, subsystem->smem_item, NULL);
> +	if (IS_ERR(stat))
> +		return -EIO;
> +
> [...]
> +
> +static void qcom_create_subsystem_stat_files(struct dentry *root)
> +{
> +	const struct sleep_stats *stat;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(subsystems); i++) {
> +		stat = qcom_smem_get(subsystems[i].pid, subsystems[i].smem_item, NULL);
> +		if (IS_ERR(stat))
> +			continue;
> +
> +		debugfs_create_file(subsystems[i].name, 0400, root, (void *)&subsystems[i],
> +				    &qcom_subsystem_sleep_stats_fops);

This causes WARNINGs on MSM8996 and MSM8916:

[    0.503054] ------------[ cut here ]------------
[    0.503100] WARNING: CPU: 1 PID: 1 at drivers/soc/qcom/smem.c:587 qcom_smem_get+0x184/0x1b0
[    0.503184] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.15.0-rc4+ #378
[    0.503218] Hardware name: Xiaomi Mi Note 2 (DT)
[    0.503278] pc : qcom_smem_get+0x184/0x1b0
[    0.503307] lr : qcom_sleep_stats_probe+0xfc/0x20
[    0.503875] Call trace:
[    0.503896]  qcom_smem_get+0x184/0x1b0
[    0.503925]  qcom_sleep_stats_probe+0xfc/0x270

AFAICT from downstream the smem subsystem information is only read in
the rpmh_master_stat.c driver, should this be specific to RPMh?

There is a rpm_master_stat.c too but that looks quite different,
so I guess the approach is different with RPM?

Two more (unrelated) issues here:

  1. This will silently not register anything if SMEM probes after the
     qcom-sleep-stats driver (qcom_smem_get() will return -EPROBE_DEFER)
     and you will just skip registering the debugfs files.

  2. In qcom_subsystem_sleep_stats_show() you say
     /* Items are allocated lazily, so lookup pointer each time */

     But, if the lookup fails here you don't register the debugfs file
     at all. Does this work if the subsystem is started after this driver?

Thanks,
Stephan
