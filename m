Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A021C214251
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2020 02:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgGDARW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 20:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbgGDARW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 20:17:22 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9753C08C5E0
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2020 17:17:21 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id h23so25084743qtr.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2020 17:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Sc+30ByNFobcHBkZTiqUdpRu8ho9UsCfKtEoIVOlDOw=;
        b=mHrF12ogWdgTgj7FflwvcLoq1J+K/fEmMs81vpZlfJQkNO9lcvZCj1rS1UOyUR1UJD
         2AYPyMrcNoXKf4Oe13I2UKA378N2BmlPad1ZIH8NYGSQuqq246qIyPbUkImNOMpRbs6w
         jIWABWq4GWWyNhho34m6diCvrfquP50LF2j5fktmMOtJ3qH9FKNnL9HWK3eUVMJ/Y09N
         ECudMA73BpffXxCnWGcQry5OHXxR2bvC7HsCDRfzcdVfu+aObIQpaOq8qF+IU/uyBMaF
         2x14YfErSVQ1jIQq7s/rHPEQelWiXF37fU9MFVQmXVvCQzrBuXwV8hgnTKTUsBVGE2n7
         e4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Sc+30ByNFobcHBkZTiqUdpRu8ho9UsCfKtEoIVOlDOw=;
        b=E6rzYyBvKFk0HVgXVpgjAU3Ff2eVlfmnjaYoJyZ6eMiZyTS682w++YvM7b9ks7Y6Bo
         7DBhLRT2r/VqxfPT8KSMVmWudiaVOrP/bvlnVqRIRs1BcLb+Z1ZS/Ma8MOj/r9JIxgUV
         VAjvsgVpH5j38YYhQ4ZNSl+Y8te8DVdkqIin5kzLXC1e/2OT46BNy7eEqhaEyFtU9Sa5
         ct6V//4BNMiFQRjqN5NOU3UCS7WwLT/rTnfAxJPxSRwf3nOsCt8mH7jOyzACrgXtcSZD
         nLQJiVlMwwr6pnqMxisyxv7AVUm89J/Qf5wtcHIulC3H7bGnmb6lUij+Lztg16aNDDLQ
         BmQg==
X-Gm-Message-State: AOAM533Lw4zqPUm3WFDNOASkyKOW9kZ8TkfVD3wcwNH7d8cpXICoRjn1
        X2X/PuAOGe6b9dR/0l+MUilXpg==
X-Google-Smtp-Source: ABdhPJypT5r9rmmMqGp3Xeu5e8JCPMftFx006aSWWKHRm2iYB0QETcLl2YVfHOTnl7d3E+NxXptIAw==
X-Received: by 2002:ac8:f6f:: with SMTP id l44mr37998235qtk.4.1593821840815;
        Fri, 03 Jul 2020 17:17:20 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id 19sm10800170qky.72.2020.07.03.17.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 17:17:20 -0700 (PDT)
Date:   Fri, 3 Jul 2020 20:17:09 -0400
From:   Qian Cai <cai@lca.pw>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Drake <drake@endlessm.com>,
        linux-rockchip@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        jonathan.derrick@intel.com
Subject: Re: [PATCH v3 00/34] iommu: Move iommu_group setup to IOMMU core code
Message-ID: <20200704001709.GA1502@lca.pw>
References: <20200429133712.31431-1-joro@8bytes.org>
 <20200701004020.GA6221@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701004020.GA6221@lca.pw>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 30, 2020 at 08:40:28PM -0400, Qian Cai wrote:
> On Wed, Apr 29, 2020 at 03:36:38PM +0200, Joerg Roedel wrote:
> > Hi,
> > 
> > here is the third version of this patch-set. Older versions can be found
> > here:
> > 
> > 	v1: https://lore.kernel.org/lkml/20200407183742.4344-1-joro@8bytes.org/
> > 	    (Has some more introductory text)
> > 
> > 	v2: https://lore.kernel.org/lkml/20200414131542.25608-1-joro@8bytes.org/
> > 
> > Changes v2 -> v3:
> > 
> > 	* Rebased v5.7-rc3
> > 
> > 	* Added a missing iommu_group_put() as reported by Lu Baolu.
> > 
> > 	* Added a patch to consolidate more initialization work in
> > 	  __iommu_probe_device(), fixing a bug where no 'struct
> > 	  device_iommu' was allocated in the hotplug path.
> > 
> > There is also a git-branch available with these patches applied:
> > 
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=iommu-probe-device-v3
> > 
> > Please review. If there are no objections I plan to put these patches
> > into the IOMMU tree early next week.
> 
> Looks like this patchset introduced an use-after-free on arm-smmu-v3.
> 
> Reproduced using mlx5,
> 
> # echo 1 > /sys/class/net/enp11s0f1np1/device/sriov_numvfs
> # echo 0 > /sys/class/net/enp11s0f1np1/device/sriov_numvfs 
> 
> The .config,
> https://github.com/cailca/linux-mm/blob/master/arm64.config
> 
> Looking at the free stack,
> 
> iommu_release_device->iommu_group_remove_device
> 
> was introduced in 07/34 ("iommu: Add probe_device() and release_device()
> call-backs").

FYI, I have just sent a patch to fix this,

https://lore.kernel.org/linux-iommu/20200704001003.2303-1-cai@lca.pw/

> 
> [ 9426.724641][ T3356] pci 0000:0b:01.2: Removing from iommu group 3
> [ 9426.731347][ T3356] ==================================================================
> [ 9426.739263][ T3356] BUG: KASAN: use-after-free in __lock_acquire+0x3458/0x4440
> __lock_acquire at kernel/locking/lockdep.c:4250
> [ 9426.746477][ T3356] Read of size 8 at addr ffff0089df1a6f68 by task bash/3356
> [ 9426.753601][ T3356]
> [ 9426.755782][ T3356] CPU: 5 PID: 3356 Comm: bash Not tainted 5.8.0-rc3-next-20200630 #2
> [ 9426.763687][ T3356] Hardware name: HPE Apollo 70             /C01_APACHE_MB         , BIOS L50_5.13_1.11 06/18/2019
> [ 9426.774111][ T3356] Call trace:
> [ 9426.777245][ T3356]  dump_backtrace+0x0/0x398
> [ 9426.781593][ T3356]  show_stack+0x14/0x20
> [ 9426.785596][ T3356]  dump_stack+0x140/0x1b8
> [ 9426.789772][ T3356]  print_address_description.isra.12+0x54/0x4a8
> [ 9426.795855][ T3356]  kasan_report+0x134/0x1b8
> [ 9426.800203][ T3356]  __asan_report_load8_noabort+0x2c/0x50
> [ 9426.805679][ T3356]  __lock_acquire+0x3458/0x4440
> [ 9426.810373][ T3356]  lock_acquire+0x204/0xf10
> [ 9426.814722][ T3356]  _raw_spin_lock_irqsave+0xf8/0x180
> [ 9426.819853][ T3356]  arm_smmu_detach_dev+0xd8/0x4a0
> arm_smmu_detach_dev at drivers/iommu/arm-smmu-v3.c:2776
> [ 9426.824721][ T3356]  arm_smmu_release_device+0xb4/0x1c8
> arm_smmu_disable_pasid at drivers/iommu/arm-smmu-v3.c:2754
> (inlined by) arm_smmu_release_device at drivers/iommu/arm-smmu-v3.c:3000
> [ 9426.829937][ T3356]  iommu_release_device+0xc0/0x178
> iommu_release_device at drivers/iommu/iommu.c:302
> [ 9426.834892][ T3356]  iommu_bus_notifier+0x118/0x160
> [ 9426.839762][ T3356]  notifier_call_chain+0xa4/0x128
> [ 9426.844630][ T3356]  __blocking_notifier_call_chain+0x70/0xa8
> [ 9426.850367][ T3356]  blocking_notifier_call_chain+0x14/0x20
> [ 9426.855929][ T3356]  device_del+0x618/0xa00
> [ 9426.860105][ T3356]  pci_remove_bus_device+0x108/0x2d8
> [ 9426.865233][ T3356]  pci_stop_and_remove_bus_device+0x1c/0x28
> [ 9426.870972][ T3356]  pci_iov_remove_virtfn+0x228/0x368
> [ 9426.876100][ T3356]  sriov_disable+0x8c/0x348
> [ 9426.880447][ T3356]  pci_disable_sriov+0x5c/0x70
> [ 9426.885117][ T3356]  mlx5_core_sriov_configure+0xd8/0x260 [mlx5_core]
> [ 9426.891549][ T3356]  sriov_numvfs_store+0x240/0x318
> [ 9426.896417][ T3356]  dev_attr_store+0x38/0x68
> [ 9426.900766][ T3356]  sysfs_kf_write+0xdc/0x128
> [ 9426.905200][ T3356]  kernfs_fop_write+0x23c/0x448
> [ 9426.909897][ T3356]  __vfs_write+0x54/0xe8
> [ 9426.913984][ T3356]  vfs_write+0x124/0x3f0
> [ 9426.918070][ T3356]  ksys_write+0xe8/0x1b8
> [ 9426.922157][ T3356]  __arm64_sys_write+0x68/0x98
> [ 9426.926766][ T3356]  do_el0_svc+0x124/0x220
> [ 9426.930941][ T3356]  el0_sync_handler+0x260/0x408
> [ 9426.935634][ T3356]  el0_sync+0x140/0x180
> [ 9426.939633][ T3356]
> [ 9426.941810][ T3356] Allocated by task 3356:
> [ 9426.945985][ T3356]  save_stack+0x24/0x50
> [ 9426.949986][ T3356]  __kasan_kmalloc.isra.13+0xc4/0xe0
> [ 9426.955114][ T3356]  kasan_kmalloc+0xc/0x18
> [ 9426.959288][ T3356]  kmem_cache_alloc_trace+0x1ec/0x318
> [ 9426.964503][ T3356]  arm_smmu_domain_alloc+0x54/0x148
> [ 9426.969545][ T3356]  iommu_group_alloc_default_domain+0xc0/0x440
> [ 9426.975541][ T3356]  iommu_probe_device+0x1c0/0x308
> [ 9426.980409][ T3356]  iort_iommu_configure+0x434/0x518
> [ 9426.985452][ T3356]  acpi_dma_configure+0xf0/0x128
> [ 9426.990235][ T3356]  pci_dma_configure+0x114/0x160
> [ 9426.995017][ T3356]  really_probe+0x124/0x6d8
> [ 9426.999364][ T3356]  driver_probe_device+0xc4/0x180
> [ 9427.004232][ T3356]  __device_attach_driver+0x184/0x1e8
> [ 9427.009447][ T3356]  bus_for_each_drv+0x114/0x1a0
> [ 9427.014142][ T3356]  __device_attach+0x19c/0x2a8
> [ 9427.018749][ T3356]  device_attach+0x10/0x18
> [ 9427.023009][ T3356]  pci_bus_add_device+0x70/0xf8
> [ 9427.027704][ T3356]  pci_iov_add_virtfn+0x7b4/0xb40
> [ 9427.032571][ T3356]  sriov_enable+0x5c8/0xc30
> [ 9427.036918][ T3356]  pci_enable_sriov+0x64/0x80
> [ 9427.041485][ T3356]  mlx5_core_sriov_configure+0x58/0x260 [mlx5_core]
> [ 9427.047917][ T3356]  sriov_numvfs_store+0x1c0/0x318
> [ 9427.052784][ T3356]  dev_attr_store+0x38/0x68
> [ 9427.057131][ T3356]  sysfs_kf_write+0xdc/0x128
> [ 9427.061565][ T3356]  kernfs_fop_write+0x23c/0x448
> [ 9427.066260][ T3356]  __vfs_write+0x54/0xe8
> [ 9427.070346][ T3356]  vfs_write+0x124/0x3f0
> [ 9427.074433][ T3356]  ksys_write+0xe8/0x1b8
> [ 9427.078519][ T3356]  __arm64_sys_write+0x68/0x98
> [ 9427.083127][ T3356]  do_el0_svc+0x124/0x220
> [ 9427.087300][ T3356]  el0_sync_handler+0x260/0x408
> [ 9427.091994][ T3356]  el0_sync+0x140/0x180
> [ 9427.095992][ T3356]
> [ 9427.098168][ T3356] Freed by task 3356:
> [ 9427.101995][ T3356]  save_stack+0x24/0x50
> [ 9427.105996][ T3356]  __kasan_slab_free+0x124/0x198
> [ 9427.110777][ T3356]  kasan_slab_free+0x10/0x18
> [ 9427.115210][ T3356]  slab_free_freelist_hook+0x110/0x298
> [ 9427.120512][ T3356]  kfree+0x128/0x668
> [ 9427.124252][ T3356]  arm_smmu_domain_free+0xf4/0x1a0
> [ 9427.129206][ T3356]  iommu_group_release+0xec/0x160
> [ 9427.134074][ T3356]  kobject_put+0xf4/0x238
> [ 9427.138247][ T3356]  kobject_del+0x110/0x190
> [ 9427.142507][ T3356]  kobject_put+0x1e4/0x238
> [ 9427.146767][ T3356]  iommu_group_remove_device+0x394/0x938
> [ 9427.152242][ T3356]  iommu_release_device+0x9c/0x178
> iommu_release_device at drivers/iommu/iommu.c:300
> [ 9427.157196][ T3356]  iommu_bus_notifier+0x118/0x160
> [ 9427.162065][ T3356]  notifier_call_chain+0xa4/0x128
> [ 9427.166934][ T3356]  __blocking_notifier_call_chain+0x70/0xa8
> [ 9427.172670][ T3356]  blocking_notifier_call_chain+0x14/0x20
> [ 9427.178233][ T3356]  device_del+0x618/0xa00
> [ 9427.182406][ T3356]  pci_remove_bus_device+0x108/0x2d8
> [ 9427.187535][ T3356]  pci_stop_and_remove_bus_device+0x1c/0x28
> [ 9427.193271][ T3356]  pci_iov_remove_virtfn+0x228/0x368
> [ 9427.198399][ T3356]  sriov_disable+0x8c/0x348
> [ 9427.202746][ T3356]  pci_disable_sriov+0x5c/0x70
> [ 9427.207398][ T3356]  mlx5_core_sriov_configure+0xd8/0x260 [mlx5_core]
> [ 9427.213830][ T3356]  sriov_numvfs_store+0x240/0x318
> [ 9427.218698][ T3356]  dev_attr_store+0x38/0x68
> [ 9427.223045][ T3356]  sysfs_kf_write+0xdc/0x128
> [ 9427.227478][ T3356]  kernfs_fop_write+0x23c/0x448
> [ 9427.232173][ T3356]  __vfs_write+0x54/0xe8
> [ 9427.236259][ T3356]  vfs_write+0x124/0x3f0
> [ 9427.240346][ T3356]  ksys_write+0xe8/0x1b8
> [ 9427.244433][ T3356]  __arm64_sys_write+0x68/0x98
> [ 9427.249041][ T3356]  do_el0_svc+0x124/0x220
> [ 9427.253215][ T3356]  el0_sync_handler+0x260/0x408
> [ 9427.257908][ T3356]  el0_sync+0x140/0x180
> [ 9427.261907][ T3356]
> [ 9427.264084][ T3356] The buggy address belongs to the object at ffff0089df1a6e00
> [ 9427.264084][ T3356]  which belongs to the cache kmalloc-512 of size 512
> [ 9427.277980][ T3356] The buggy address is located 360 bytes inside of
> [ 9427.277980][ T3356]  512-byte region [ffff0089df1a6e00, ffff0089df1a7000)
> [ 9427.291094][ T3356] The buggy address belongs to the page:
> [ 9427.296571][ T3356] page:ffffffe02257c680 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff0089df1a1400
> [ 9427.306823][ T3356] flags: 0x7ffff800000200(slab)
> [ 9427.311520][ T3356] raw: 007ffff800000200 ffffffe02246b8c8 ffffffe02257ff88 ffff000000320680
> [ 9427.319949][ T3356] raw: ffff0089df1a1400 00000000002a000e 00000001ffffffff ffff0089df1a5001
> [ 9427.328374][ T3356] page dumped because: kasan: bad access detected
> [ 9427.334630][ T3356] page->mem_cgroup:ffff0089df1a5001
> [ 9427.339670][ T3356]
> [ 9427.341846][ T3356] Memory state around the buggy address:
> [ 9427.347322][ T3356]  ffff0089df1a6e00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [ 9427.355228][ T3356]  ffff0089df1a6e80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [ 9427.363133][ T3356] >ffff0089df1a6f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [ 9427.371038][ T3356]                                                           ^
> [ 9427.378337][ T3356]  ffff0089df1a6f80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [ 9427.386242][ T3356]  ffff0089df1a7000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> [ 9427.394146][ T3356] ==================================================================
> [ 9427.402052][ T3356] Disabling lock debugging due to kernel taint
> 
> > 
> > Thanks,
> > 
> > 	Joerg
> > 
> > Joerg Roedel (33):
> >   iommu: Move default domain allocation to separate function
> >   iommu/amd: Implement iommu_ops->def_domain_type call-back
> >   iommu/vt-d: Wire up iommu_ops->def_domain_type
> >   iommu/amd: Remove dma_mask check from check_device()
> >   iommu/amd: Return -ENODEV in add_device when device is not handled by
> >     IOMMU
> >   iommu: Add probe_device() and release_device() call-backs
> >   iommu: Move default domain allocation to iommu_probe_device()
> >   iommu: Keep a list of allocated groups in __iommu_probe_device()
> >   iommu: Move new probe_device path to separate function
> >   iommu: Split off default domain allocation from group assignment
> >   iommu: Move iommu_group_create_direct_mappings() out of
> >     iommu_group_add_device()
> >   iommu: Export bus_iommu_probe() and make is safe for re-probing
> >   iommu/amd: Remove dev_data->passthrough
> >   iommu/amd: Convert to probe/release_device() call-backs
> >   iommu/vt-d: Convert to probe/release_device() call-backs
> >   iommu/arm-smmu: Convert to probe/release_device() call-backs
> >   iommu/pamu: Convert to probe/release_device() call-backs
> >   iommu/s390: Convert to probe/release_device() call-backs
> >   iommu/virtio: Convert to probe/release_device() call-backs
> >   iommu/msm: Convert to probe/release_device() call-backs
> >   iommu/mediatek: Convert to probe/release_device() call-backs
> >   iommu/mediatek-v1 Convert to probe/release_device() call-backs
> >   iommu/qcom: Convert to probe/release_device() call-backs
> >   iommu/rockchip: Convert to probe/release_device() call-backs
> >   iommu/tegra: Convert to probe/release_device() call-backs
> >   iommu/renesas: Convert to probe/release_device() call-backs
> >   iommu/omap: Remove orphan_dev tracking
> >   iommu/omap: Convert to probe/release_device() call-backs
> >   iommu/exynos: Use first SYSMMU in controllers list for IOMMU core
> >   iommu/exynos: Convert to probe/release_device() call-backs
> >   iommu: Remove add_device()/remove_device() code-paths
> >   iommu: Move more initialization to __iommu_probe_device()
> >   iommu: Unexport iommu_group_get_for_dev()
> > 
> > Sai Praneeth Prakhya (1):
> >   iommu: Add def_domain_type() callback in iommu_ops
> > 
> >  drivers/iommu/amd_iommu.c       |  97 ++++----
> >  drivers/iommu/amd_iommu_types.h |   1 -
> >  drivers/iommu/arm-smmu-v3.c     |  38 +---
> >  drivers/iommu/arm-smmu.c        |  39 ++--
> >  drivers/iommu/exynos-iommu.c    |  24 +-
> >  drivers/iommu/fsl_pamu_domain.c |  22 +-
> >  drivers/iommu/intel-iommu.c     |  68 +-----
> >  drivers/iommu/iommu.c           | 387 +++++++++++++++++++++++++-------
> >  drivers/iommu/ipmmu-vmsa.c      |  60 ++---
> >  drivers/iommu/msm_iommu.c       |  34 +--
> >  drivers/iommu/mtk_iommu.c       |  24 +-
> >  drivers/iommu/mtk_iommu_v1.c    |  50 ++---
> >  drivers/iommu/omap-iommu.c      |  99 ++------
> >  drivers/iommu/qcom_iommu.c      |  24 +-
> >  drivers/iommu/rockchip-iommu.c  |  26 +--
> >  drivers/iommu/s390-iommu.c      |  22 +-
> >  drivers/iommu/tegra-gart.c      |  24 +-
> >  drivers/iommu/tegra-smmu.c      |  31 +--
> >  drivers/iommu/virtio-iommu.c    |  41 +---
> >  include/linux/iommu.h           |  21 +-
> >  20 files changed, 531 insertions(+), 601 deletions(-)
> > 
> > -- 
> > 2.17.1
> > 
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu
