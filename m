Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5548832DD2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2019 12:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727139AbfFCKob (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jun 2019 06:44:31 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40140 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfFCKoa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jun 2019 06:44:30 -0400
Received: by mail-ed1-f67.google.com with SMTP id r18so25244760edo.7;
        Mon, 03 Jun 2019 03:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QD/SNMFMpW44iu80hjCUJUbBKRNHNMSm+3pUXj35MI4=;
        b=kvUAmjkoz3Tf6DhGO/eZqqtpFH5o5rrbEYN391E6EupM5Z4afNu9GFOzdX8SvVnSJX
         jyKSDr0FC6VHKCreITXlld7LBh3ZzX5/oew/3xZmoiLx4NgU7YMoucT/MKeTiBKERvjg
         U8d81MtH9CLYukUKlNpzHQUarPVokebKGV9lIb0vA+iwxZKF6nnTTJBY/lUJaKZ6OXXo
         CBICoU2aCrZG4Ab+fh7iNhRJsv1EAvCXba2fsA2FpCO0nAwp02VAr4iSs0bmb0aYyj3x
         o60m8YLLyxldWzDNID6qrhJM6nYkJeHAwRP66Ba+aYXHPLQ78qLU7Rl7+n2AqUs9P7vV
         s3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QD/SNMFMpW44iu80hjCUJUbBKRNHNMSm+3pUXj35MI4=;
        b=HmcjzRSpelM0VqNk5Edj6JwAyNBlEmRjxpIVAJgW1bS7kQNwBwR0308Q2UHunw7eit
         peAovzE1XYWqJLIuQtD5neWAizKQKwa2Sxb4UxLtylm6o1iHjWkA5oIpaMq4RRbic/G7
         u8aqgT61GfyTsMzghOKAOLPbMGM+tmLr7SCHz/aZ+FW3F82ZJrmzRPCLDxqVL0rbiRMd
         u054esVJ5SDqC/PDku6iEayOjs41WdIt852b0X2/IWi256UaxI/gVEg+cy2BFdwrI5oc
         ZmKQ50FoojugQq8IJ3NjFFywYudrMOHB7gsNUqWx0Mh7jnVR7aZfkFEYXk+hchicYyic
         n0nw==
X-Gm-Message-State: APjAAAUJD9n2i8EbE2QD5H8Q7Y1AG+H9d2qZVtVk5ZGqY0GycAT1hEZQ
        dKUELPpFRQPpBhVmfTfNAHhcmCDTmge58YE+BRs=
X-Google-Smtp-Source: APXvYqyaYpoaBaIQQtmNJy9CQtgQ2W9Ux0fDgZusTgMraDzABR9/nfGK9YTtymsWZ2k02nQ5xVIiN/k7375XXuU9t/M=
X-Received: by 2002:a17:906:11d3:: with SMTP id o19mr23225993eja.278.1559558668459;
 Mon, 03 Jun 2019 03:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20181201165348.24140-1-robdclark@gmail.com> <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com> <4864dc3e-6e04-43e5-32c8-2cf5a0705fe5@codeaurora.org>
In-Reply-To: <4864dc3e-6e04-43e5-32c8-2cf5a0705fe5@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 3 Jun 2019 03:44:15 -0700
Message-ID: <CAF6AEGuFyk1DJWUcQTnW=xsEUhYTYJccjzHJFxvipK4M8UdrUA@mail.gmail.com>
Subject: Re: [PATCH] of/device: add blacklist for iommu dma_ops
To:     Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        David Airlie <airlied@linux.ie>,
        freedreno <freedreno@lists.freedesktop.org>,
        Archit Taneja <architt@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 3, 2019 at 12:57 AM Vivek Gautam
<vivek.gautam@codeaurora.org> wrote:
>
>
>
> On 6/3/2019 11:50 AM, Tomasz Figa wrote:
> > On Mon, Jun 3, 2019 at 4:40 AM Rob Clark <robdclark@gmail.com> wrote:
> >> On Fri, May 10, 2019 at 7:35 AM Rob Clark <robdclark@gmail.com> wrote:
> >>> On Tue, Dec 4, 2018 at 2:29 PM Rob Herring <robh+dt@kernel.org> wrote:
> >>>> On Sat, Dec 1, 2018 at 10:54 AM Rob Clark <robdclark@gmail.com> wrote:
> >>>>> This solves a problem we see with drm/msm, caused by getting
> >>>>> iommu_dma_ops while we attach our own domain and manage it directly at
> >>>>> the iommu API level:
> >>>>>
> >>>>>    [0000000000000038] user address but active_mm is swapper
> >>>>>    Internal error: Oops: 96000005 [#1] PREEMPT SMP
> >>>>>    Modules linked in:
> >>>>>    CPU: 7 PID: 70 Comm: kworker/7:1 Tainted: G        W         4.19.3 #90
> >>>>>    Hardware name: xxx (DT)
> >>>>>    Workqueue: events deferred_probe_work_func
> >>>>>    pstate: 80c00009 (Nzcv daif +PAN +UAO)
> >>>>>    pc : iommu_dma_map_sg+0x7c/0x2c8
> >>>>>    lr : iommu_dma_map_sg+0x40/0x2c8
> >>>>>    sp : ffffff80095eb4f0
> >>>>>    x29: ffffff80095eb4f0 x28: 0000000000000000
> >>>>>    x27: ffffffc0f9431578 x26: 0000000000000000
> >>>>>    x25: 00000000ffffffff x24: 0000000000000003
> >>>>>    x23: 0000000000000001 x22: ffffffc0fa9ac010
> >>>>>    x21: 0000000000000000 x20: ffffffc0fab40980
> >>>>>    x19: ffffffc0fab40980 x18: 0000000000000003
> >>>>>    x17: 00000000000001c4 x16: 0000000000000007
> >>>>>    x15: 000000000000000e x14: ffffffffffffffff
> >>>>>    x13: ffff000000000000 x12: 0000000000000028
> >>>>>    x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f
> >>>>>    x9 : 0000000000000000 x8 : ffffffc0fab409a0
> >>>>>    x7 : 0000000000000000 x6 : 0000000000000002
> >>>>>    x5 : 0000000100000000 x4 : 0000000000000000
> >>>>>    x3 : 0000000000000001 x2 : 0000000000000002
> >>>>>    x1 : ffffffc0f9431578 x0 : 0000000000000000
> >>>>>    Process kworker/7:1 (pid: 70, stack limit = 0x0000000017d08ffb)
> >>>>>    Call trace:
> >>>>>     iommu_dma_map_sg+0x7c/0x2c8
> >>>>>     __iommu_map_sg_attrs+0x70/0x84
> >>>>>     get_pages+0x170/0x1e8
> >>>>>     msm_gem_get_iova+0x8c/0x128
> >>>>>     _msm_gem_kernel_new+0x6c/0xc8
> >>>>>     msm_gem_kernel_new+0x4c/0x58
> >>>>>     dsi_tx_buf_alloc_6g+0x4c/0x8c
> >>>>>     msm_dsi_host_modeset_init+0xc8/0x108
> >>>>>     msm_dsi_modeset_init+0x54/0x18c
> >>>>>     _dpu_kms_drm_obj_init+0x430/0x474
> >>>>>     dpu_kms_hw_init+0x5f8/0x6b4
> >>>>>     msm_drm_bind+0x360/0x6c8
> >>>>>     try_to_bring_up_master.part.7+0x28/0x70
> >>>>>     component_master_add_with_match+0xe8/0x124
> >>>>>     msm_pdev_probe+0x294/0x2b4
> >>>>>     platform_drv_probe+0x58/0xa4
> >>>>>     really_probe+0x150/0x294
> >>>>>     driver_probe_device+0xac/0xe8
> >>>>>     __device_attach_driver+0xa4/0xb4
> >>>>>     bus_for_each_drv+0x98/0xc8
> >>>>>     __device_attach+0xac/0x12c
> >>>>>     device_initial_probe+0x24/0x30
> >>>>>     bus_probe_device+0x38/0x98
> >>>>>     deferred_probe_work_func+0x78/0xa4
> >>>>>     process_one_work+0x24c/0x3dc
> >>>>>     worker_thread+0x280/0x360
> >>>>>     kthread+0x134/0x13c
> >>>>>     ret_from_fork+0x10/0x18
> >>>>>    Code: d2800004 91000725 6b17039f 5400048a (f9401f40)
> >>>>>    ---[ end trace f22dda57f3648e2c ]---
> >>>>>    Kernel panic - not syncing: Fatal exception
> >>>>>    SMP: stopping secondary CPUs
> >>>>>    Kernel Offset: disabled
> >>>>>    CPU features: 0x0,22802a18
> >>>>>    Memory Limit: none
> >>>>>
> >>>>> The problem is that when drm/msm does it's own iommu_attach_device(),
> >>>>> now the domain returned by iommu_get_domain_for_dev() is drm/msm's
> >>>>> domain, and it doesn't have domain->iova_cookie.
> >>>>>
> >>>>> We kind of avoided this problem prior to sdm845/dpu because the iommu
> >>>>> was attached to the mdp node in dt, which is a child of the toplevel
> >>>>> mdss node (which corresponds to the dev passed in dma_map_sg()).  But
> >>>>> with sdm845, now the iommu is attached at the mdss level so we hit the
> >>>>> iommu_dma_ops in dma_map_sg().
> >>>>>
> >>>>> But auto allocating/attaching a domain before the driver is probed was
> >>>>> already a blocking problem for enabling per-context pagetables for the
> >>>>> GPU.  This problem is also now solved with this patch.
> >>>>>
> >>>>> Fixes: 97890ba9289c dma-mapping: detect and configure IOMMU in of_dma_configure
> >>>>> Tested-by: Douglas Anderson <dianders@chromium.org>
> >>>>> Signed-off-by: Rob Clark <robdclark@gmail.com>
> >>>>> ---
> >>>>> This is an alternative/replacement for [1].  What it lacks in elegance
> >>>>> it makes up for in practicality ;-)
> >>>>>
> >>>>> [1] https://patchwork.freedesktop.org/patch/264930/
> >>>>>
> >>>>>   drivers/of/device.c | 22 ++++++++++++++++++++++
> >>>>>   1 file changed, 22 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/of/device.c b/drivers/of/device.c
> >>>>> index 5957cd4fa262..15ffee00fb22 100644
> >>>>> --- a/drivers/of/device.c
> >>>>> +++ b/drivers/of/device.c
> >>>>> @@ -72,6 +72,14 @@ int of_device_add(struct platform_device *ofdev)
> >>>>>          return device_add(&ofdev->dev);
> >>>>>   }
> >>>>>
> >>>>> +static const struct of_device_id iommu_blacklist[] = {
> >>>>> +       { .compatible = "qcom,mdp4" },
> >>>>> +       { .compatible = "qcom,mdss" },
> >>>>> +       { .compatible = "qcom,sdm845-mdss" },
> >>>>> +       { .compatible = "qcom,adreno" },
> >>>>> +       {}
> >>>>> +};
> >>>> Not completely clear to whether this is still needed or not, but this
> >>>> really won't scale. Why can't the driver for these devices override
> >>>> whatever has been setup by default?
> >>>>
> >>> fwiw, at the moment it is not needed, but it will become needed again
> >>> to implement per-context pagetables (although I suppose for this we
> >>> only need to blacklist qcom,adreno and not also the display nodes).
> >> So, another case I've come across, on the display side.. I'm working
> >> on handling the case where bootloader enables display (and takes iommu
> >> out of reset).. as soon as DMA domain gets attached we get iommu
> >> faults, because bootloader has already configured display for scanout.
> >> Unfortunately this all happens before actual driver is probed and has
> >> a chance to intervene.
>
> Things are bad for MTP sdm845 too where the bootloader sets up iommu to
> display splash screen, and when the kernel resets the iommu, the mappings go
> for a toss resulting in fatal faults.
> Bjorn was working on something recently to address this. Adding him to
> the thread.
>

yeah, I was hitting it on the yoga c630 laptop, but it is the identical problem.

We'd worked around it so far with a hack in arm-smmu to temporarily
ioremap the display controller block and disable INTF1, which is
*defn* not a good solution ;-)

BR,
-R

>
> Best regards
> Vivek
>
> >> It's rather unfortunate that we tried to be clever rather than just
> >> making drivers call some function to opt-in to the hookup of dma iommu
> >> ops :-(
> > I think it still works for the 90% of cases and if 10% needs some
> > explicit work in the drivers, that's better than requiring 100% of the
> > drivers to do things manually.
> >
> > Adding Marek who had the same problem on Exynos.
> >
> > Best regards,
> > Tomasz
> >
> >> BR,
> >> -R
> >>
> >>> The reason is that in the current state the core code creates the
> >>> first domain before the driver has a chance to intervene and tell it
> >>> not to.  And this results that driver ends up using a different
> >>> context bank on the iommu than what the firmware expects.
> >>>
> >>> I guess the alternative is to put some property in DT.. but that
> >>> doesn't really feel right.  I guess there aren't really many (or any?)
> >>> other drivers that have this specific problem, so I don't really
> >>> expect it to be a scaling problem.
> >>>
> >>> Yeah, it's a bit ugly, but I'll take a small ugly working hack, over
> >>> elegant but non-working any day ;-)... but if someone has a better
> >>> idea then I'm all ears.
> >>>
> >>> BR,
> >>> -R
>
