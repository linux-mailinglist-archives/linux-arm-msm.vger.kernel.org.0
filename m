Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B49D23B8F54
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 11:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235088AbhGAJDs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jul 2021 05:03:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:43840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235067AbhGAJDs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jul 2021 05:03:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81F756145A;
        Thu,  1 Jul 2021 09:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625130078;
        bh=eLdLZeJD5Ac5CQrBKTNtgXgFxT2Vv/eYU0/SXotP0pU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cE5iMhX/0x60qj7/PgY0MT6UDP/L1bnUzXIiioIAhlPlc7yO4nMBUN8MXuYh1t51b
         BpOVme3bBiFibwrFZTAcywEddcQ6GpHffAG3eFDV6Fpl835UI5aqwR9iSB9AlkeSkC
         Zqjj7dAVp/q9gIq/mYOeQ36kVhDokwWhdp67FkrRVaJjyMjIVXOkxdRqWcbcoIif/f
         mSDm62xy78q6e/x2/85DBjhyZ29lGBny3dapNHeXB068wuyn/p0H2zFQGpO2n6LraX
         O0PNPO9/wfdzPbyUhJjw4rbfmwcqHNVu+4meTIn2TCbiZaekQio8/Al9gqRufsNaIO
         I6nNxOLC+7ZVg==
Date:   Thu, 1 Jul 2021 10:01:13 +0100
From:   Will Deacon <will@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org,
        Amey Narkhede <ameynarkhede03@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu/arm: Cleanup resources in case of probe error path
Message-ID: <20210701090112.GA9489@willie-the-truck>
References: <20210608164559.204023-1-ameynarkhede03@gmail.com>
 <CGME20210630124816eucas1p27563f0a456c0196e20937619aa2f8d26@eucas1p2.samsung.com>
 <26f6a765-37c8-d63a-a779-384f095d5770@samsung.com>
 <20210630125940.GA8515@willie-the-truck>
 <4e3b1685-323e-2a7e-3aae-7c21b28fc65f@samsung.com>
 <bc07bd52-ed2e-0a44-80a7-36b581018b40@arm.com>
 <d3fee5f3-a435-7aa8-62ae-060e9b2aa532@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3fee5f3-a435-7aa8-62ae-060e9b2aa532@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 01, 2021 at 10:29:29AM +0200, Marek Szyprowski wrote:
> Hi Robin,
> 
> On 30.06.2021 16:01, Robin Murphy wrote:
> > On 2021-06-30 14:48, Marek Szyprowski wrote:
> >> On 30.06.2021 14:59, Will Deacon wrote:
> >>> On Wed, Jun 30, 2021 at 02:48:15PM +0200, Marek Szyprowski wrote:
> >>>> On 08.06.2021 18:45, Amey Narkhede wrote:
> >>>>> If device registration fails, remove sysfs attribute
> >>>>> and if setting bus callbacks fails, unregister the device
> >>>>> and cleanup the sysfs attribute.
> >>>>>
> >>>>> Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
> >>>> This patch landed in linux-next some time ago as commit 249c9dc6aa0d
> >>>> ("iommu/arm: Cleanup resources in case of probe error path"). After
> >>>> bisecting and some manual searching I finally found that it is
> >>>> responsible for breaking s2idle on DragonBoard 410c. Here is the log
> >>>> (captured with no_console_suspend):
> >>>>
> >>>> # time rtcwake -s10 -mmem
> >>>> rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jan  1 00:02:13 1970
> >>>> PM: suspend entry (s2idle)
> >>>> Filesystems sync: 0.002 seconds
> >>>> Freezing user space processes ... (elapsed 0.006 seconds) done.
> >>>> OOM killer disabled.
> >>>> Freezing remaining freezable tasks ... (elapsed 0.004 seconds) done.
> >>>> Unable to handle kernel NULL pointer dereference at virtual address
> >>>> 0000000000000070
> >>>> Mem abort info:
> >>>>      ESR = 0x96000006
> >>>>      EC = 0x25: DABT (current EL), IL = 32 bits
> >>>>      SET = 0, FnV = 0
> >>>>      EA = 0, S1PTW = 0
> >>>>      FSC = 0x06: level 2 translation fault
> >>>> Data abort info:
> >>>>      ISV = 0, ISS = 0x00000006
> >>>>      CM = 0, WnR = 0
> >>>> user pgtable: 4k pages, 48-bit VAs, pgdp=000000008ad08000
> >>>> [0000000000000070] pgd=0800000085c3c003, p4d=0800000085c3c003,
> >>>> pud=0800000088dcf003, pmd=0000000000000000
> >>>> Internal error: Oops: 96000006 [#1] PREEMPT SMP
> >>>> Modules linked in: bluetooth ecdh_generic ecc rfkill ipv6 ax88796b
> >>>> venus_enc venus_dec videobuf2_dma_contig asix crct10dif_ce adv7511
> >>>> snd_soc_msm8916_analog qcom_spmi_temp_alarm rtc_pm8xxx qcom_pon
> >>>> qcom_camss qcom_spmi_vadc videobuf2_dma_sg qcom_vadc_common msm
> >>>> venus_core v4l2_fwnode v4l2_async snd_soc_msm8916_digital
> >>>> videobuf2_memops snd_soc_lpass_apq8016 snd_soc_lpass_cpu v4l2_mem2mem
> >>>> snd_soc_lpass_platform snd_soc_apq8016_sbc videobuf2_v4l2
> >>>> snd_soc_qcom_common qcom_rng videobuf2_common i2c_qcom_cci 
> >>>> qnoc_msm8916
> >>>> videodev mc icc_smd_rpm mdt_loader socinfo display_connector rmtfs_mem
> >>>> CPU: 1 PID: 1522 Comm: rtcwake Not tainted 5.13.0-next-20210629 #3592
> >>>> Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> >>>> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
> >>>> pc : msm_runtime_suspend+0x1c/0x60 [msm]
> >>>> lr : msm_pm_suspend+0x18/0x38 [msm]
> >>>> ...
> >>>> Call trace:
> >>>>     msm_runtime_suspend+0x1c/0x60 [msm]
> >>>>     msm_pm_suspend+0x18/0x38 [msm]
> >>>>     dpm_run_callback+0x84/0x378
> >>> I wonder if we're missing a pm_runtime_disable() call on the failure 
> >>> path?
> >>> i.e. something like the diff below...
> >>
> >> I've checked and it doesn't fix anything.
> >
> > What's happened previously? Has an IOMMU actually failed to probe, or 
> > is this a fiddly "code movement unveils latent bug elsewhere" kind of 
> > thing? There doesn't look to be much capable of going wrong in 
> > msm_runtime_suspend() itself, so is the DRM driver also in a broken 
> > half-probed state where it's left its pm_runtime_ops behind without 
> > its drvdata being valid?
> >
> I finally had some time to analyze this issue. It turned out that with 
> this patch, iommu fails to probe for soc:iommu@1f08000 device, while it 
> worked fine before. This happens because this patch adds a check for the 
> return value of the bus_set_iommu() in 
> drivers/iommu/arm/arm-smmu/qcom_iommu.c. When I removed that check, it 
> probes successfully again. It looks that there are already iommu ops 
> registered for platform bus, before qcom_iommu probes. On the other 
> hand, if I remember correctly they are not used during the device 
> registration, but they are needed for some legacy stuff. I can send a 
> patch restoring old code flow if you think that this is a right solution.

Yes, let's just revert the qcom_iommu.c changes from that patch for now.
The pm runtime stuff looks dodgy anyway so I think this needs more thought.

Will
