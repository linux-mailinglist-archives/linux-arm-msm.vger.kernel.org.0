Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8248521905F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 21:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgGHTTj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 15:19:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55032 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbgGHTTj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 15:19:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594235977; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=qojzIDTgjnm9ZArhrXmC1tciIgZFOaaeo03EvGhAwOw=; b=mC+lWPP5t4AurDfj6LVGF2SdKMuktBZbqy2khcOG0jtKgicWG75QXsFL1JuuvsUP+3BL8Day
 I3LD2WPDvh+gjYXfilFoF/HydOJh60oRsIXy1AARVurLiZnXuUGtUsiseaecdQ5ts9Ek5zdc
 7szlN+46gifNWeXmVSt8z7dlWE4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f061c42c431f7323bd7f0ee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Jul 2020 19:19:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C18FAC4339C; Wed,  8 Jul 2020 19:19:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 342F1C433C6;
        Wed,  8 Jul 2020 19:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 342F1C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 8 Jul 2020 13:19:23 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        John Stultz <john.stultz@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Yong Wu <yong.wu@mediatek.com>
Subject: Re: [Freedreno] [PATCH v2 2/6] iommu/io-pgtable: Allow a pgtable
 implementation to skip TLB operations
Message-ID: <20200708191923.GA21059@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        John Stultz <john.stultz@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Yong Wu <yong.wu@mediatek.com>
References: <20200626200414.14382-1-jcrouse@codeaurora.org>
 <20200626200414.14382-3-jcrouse@codeaurora.org>
 <99ecd948-7476-b9b4-12b4-1ced0084654f@arm.com>
 <CAF6AEGv2YXu44r9O0ZRkNM2ny4oMStxn4=GoCS3CLpPAKh_KZw@mail.gmail.com>
 <CAF6AEGttgRQ3Ug2Nw_vJgjjjUOc0OLPSs+xLv-XFHNrHTOL8sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGttgRQ3Ug2Nw_vJgjjjUOc0OLPSs+xLv-XFHNrHTOL8sg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 07, 2020 at 07:58:18AM -0700, Rob Clark wrote:
> On Tue, Jul 7, 2020 at 7:25 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Tue, Jul 7, 2020 at 4:34 AM Robin Murphy <robin.murphy@arm.com> wrote:
> > >
> > > On 2020-06-26 21:04, Jordan Crouse wrote:
> > > > Allow a io-pgtable implementation to skip TLB operations by checking for
> > > > NULL pointers in the helper functions. It will be up to to the owner
> > > > of the io-pgtable instance to make sure that they independently handle
> > > > the TLB correctly.
> > >
> > > I don't really understand what this is for - tricking the IOMMU driver
> > > into not performing its TLB maintenance at points when that maintenance
> > > has been deemed necessary doesn't seem like the appropriate way to
> > > achieve anything good :/
> >
> > No, for triggering the io-pgtable helpers into not performing TLB
> > maintenance.  But seriously, since we are creating pgtables ourselves,
> > and we don't want to be ioremap'ing the GPU's SMMU instance, the
> > alternative is plugging in no-op helpers.  Which amounts to the same
> > thing.
> 
> Hmm, that said, since we are just memcpy'ing the io_pgtable_cfg from
> arm-smmu, it will already be populated with arm-smmu's fxn ptrs.  I
> guess we could maybe make it work without no-op helpers, although in
> that case it looks like we need to fix something about aux-domain vs
> tlb helpers:

I had a change that handled these correctly but I abandoned it because the
TLB functions didn't kick the power and I didn't think that would be desirable
at the generic level for performance reasons. Since the GPU SMMU is on the same
power domain as the GMU we could enable it in the GPU driver before calling
the TLB operations but we would need to be clever about it to prevent bringing
up the GMU just to unmap memory.

Jordan

> [  +0.004373] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000019
> [  +0.004086] Mem abort info:
> [  +0.004319]   ESR = 0x96000004
> [  +0.003462]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  +0.003494]   SET = 0, FnV = 0
> [  +0.002812]   EA = 0, S1PTW = 0
> [  +0.002873] Data abort info:
> [  +0.003031]   ISV = 0, ISS = 0x00000004
> [  +0.003785]   CM = 0, WnR = 0
> [  +0.003641] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000261d65000
> [  +0.003383] [0000000000000019] pgd=0000000000000000, p4d=0000000000000000
> [  +0.003715] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [  +0.002744] Modules linked in: xt_CHECKSUM xt_MASQUERADE
> xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_mangle
> ip6table_nat iptable_mangle iptable_nat nf_nat nf_conntrack
> nf_defrag_ipv4 libcrc32c bridge stp llc ip6table_filter ip6_tables
> iptable_filter ax88179_178a usbnet uvcvideo videobuf2_vmalloc
> videobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc
> hid_multitouch i2c_hid some_battery ti_sn65dsi86 hci_uart btqca btbcm
> qcom_spmi_adc5 bluetooth qcom_spmi_temp_alarm qcom_vadc_common
> ecdh_generic ecc snd_soc_sdm845 snd_soc_rt5663 snd_soc_qcom_common
> ath10k_snoc ath10k_core crct10dif_ce ath mac80211 snd_soc_rl6231
> soundwire_bus i2c_qcom_geni libarc4 qcom_rng msm phy_qcom_qusb2
> reset_qcom_pdc drm_kms_helper cfg80211 rfkill qcom_q6v5_mss
> qcom_q6v5_ipa_notify socinfo qrtr ns panel_simple qcom_q6v5_pas
> qcom_common qcom_glink_smem slim_qcom_ngd_ctrl qcom_sysmon drm
> qcom_q6v5 slimbus qmi_helpers qcom_wdt mdt_loader rmtfs_mem be2iscsi
> bnx2i cnic uio cxgb4i cxgb4 cxgb3i cxgb3 mdio
> [  +0.000139]  libcxgbi libcxgb qla4xxx iscsi_boot_sysfs iscsi_tcp
> libiscsi_tcp libiscsi scsi_transport_iscsi fuse ip_tables x_tables
> ipv6 nf_defrag_ipv6
> [  +0.020933] CPU: 3 PID: 168 Comm: kworker/u16:7 Not tainted
> 5.8.0-rc1-c630+ #31
> [  +0.003828] Hardware name: LENOVO 81JL/LNVNB161216, BIOS
> 9UCN33WW(V2.06) 06/ 4/2019
> [  +0.004039] Workqueue: msm msm_gem_free_work [msm]
> [  +0.003885] pstate: 60c00005 (nZCv daif +PAN +UAO BTYPE=--)
> [  +0.003859] pc : arm_smmu_tlb_inv_range_s1+0x30/0x148
> [  +0.003742] lr : arm_smmu_tlb_add_page_s1+0x1c/0x28
> [  +0.003887] sp : ffff800011cdb970
> [  +0.003868] x29: ffff800011cdb970 x28: 0000000000000003
> [  +0.003930] x27: ffff0001f1882f80 x26: 0000000000000001
> [  +0.003886] x25: 0000000000000003 x24: 0000000000000620
> [  +0.003932] x23: 0000000000000000 x22: 0000000000001000
> [  +0.003886] x21: 0000000000001000 x20: ffff0001cf857300
> [  +0.003916] x19: 0000000000000001 x18: 00000000ffffffff
> [  +0.003921] x17: ffffd9e6a24ae0e8 x16: 0000000000012577
> [  +0.003843] x15: 0000000000012578 x14: 0000000000000000
> [  +0.003884] x13: 0000000000012574 x12: ffffd9e6a2550180
> [  +0.003834] x11: 0000000000083f80 x10: 0000000000000000
> [  +0.003889] x9 : 0000000000000000 x8 : ffff0001f1882f80
> [  +0.003812] x7 : 0000000000000001 x6 : 0000000000000048
> [  +0.003807] x5 : ffff0001c86e1000 x4 : 0000000000000620
> [  +0.003802] x3 : ffff0001ddb57700 x2 : 0000000000001000
> [  +0.003809] x1 : 0000000000001000 x0 : 0000000101048000
> [  +0.003768] Call trace:
> [  +0.003665]  arm_smmu_tlb_inv_range_s1+0x30/0x148
> [  +0.003769]  arm_smmu_tlb_add_page_s1+0x1c/0x28
> [  +0.003760]  __arm_lpae_unmap+0x3c4/0x498
> [  +0.003821]  __arm_lpae_unmap+0xfc/0x498
> [  +0.003693]  __arm_lpae_unmap+0xfc/0x498
> [  +0.003704]  __arm_lpae_unmap+0xfc/0x498
> [  +0.003608]  arm_lpae_unmap+0x60/0x78
> [  +0.003653]  msm_iommu_pagetable_unmap+0x5c/0xa0 [msm]
> [  +0.003711]  msm_gem_purge_vma+0x48/0x70 [msm]
> [  +0.003716]  put_iova+0x68/0xc8 [msm]
> [  +0.003792]  msm_gem_free_work+0x118/0x190 [msm]
> [  +0.003739]  process_one_work+0x28c/0x6e8
> [  +0.003595]  worker_thread+0x4c/0x420
> [  +0.003546]  kthread+0x148/0x168
> [  +0.003675]  ret_from_fork+0x10/0x1c
> [  +0.003596] Code: 2a0403f8 a9046bf9 f9400073 39406077 (b9401a61)
> 
> BR,
> -R
> 
> >
> > Currently (in a later patch in the series) we are using
> > iommu_flush_tlb_all() when unmapping, which is a bit of a big hammer.
> > Although I think we could be a bit more clever and do the TLB ops on
> > the GPU (since the GPU knows if pagetables we are unmapping from are
> > in-use and could skip the TLB ops otherwise).
> >
> > On the topic, if we are using unique ASID values per set of
> > pagetables, how expensive is tlb invalidate for an ASID that has no
> > entries in the TLB?
> >
> > BR,
> > -R
> >
> > >
> > > Robin.
> > >
> > > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > > ---
> > > >
> > > >   include/linux/io-pgtable.h | 11 +++++++----
> > > >   1 file changed, 7 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> > > > index 53d53c6c2be9..bbed1d3925ba 100644
> > > > --- a/include/linux/io-pgtable.h
> > > > +++ b/include/linux/io-pgtable.h
> > > > @@ -210,21 +210,24 @@ struct io_pgtable {
> > > >
> > > >   static inline void io_pgtable_tlb_flush_all(struct io_pgtable *iop)
> > > >   {
> > > > -     iop->cfg.tlb->tlb_flush_all(iop->cookie);
> > > > +     if (iop->cfg.tlb)
> > > > +             iop->cfg.tlb->tlb_flush_all(iop->cookie);
> > > >   }
> > > >
> > > >   static inline void
> > > >   io_pgtable_tlb_flush_walk(struct io_pgtable *iop, unsigned long iova,
> > > >                         size_t size, size_t granule)
> > > >   {
> > > > -     iop->cfg.tlb->tlb_flush_walk(iova, size, granule, iop->cookie);
> > > > +     if (iop->cfg.tlb)
> > > > +             iop->cfg.tlb->tlb_flush_walk(iova, size, granule, iop->cookie);
> > > >   }
> > > >
> > > >   static inline void
> > > >   io_pgtable_tlb_flush_leaf(struct io_pgtable *iop, unsigned long iova,
> > > >                         size_t size, size_t granule)
> > > >   {
> > > > -     iop->cfg.tlb->tlb_flush_leaf(iova, size, granule, iop->cookie);
> > > > +     if (iop->cfg.tlb)
> > > > +             iop->cfg.tlb->tlb_flush_leaf(iova, size, granule, iop->cookie);
> > > >   }
> > > >
> > > >   static inline void
> > > > @@ -232,7 +235,7 @@ io_pgtable_tlb_add_page(struct io_pgtable *iop,
> > > >                       struct iommu_iotlb_gather * gather, unsigned long iova,
> > > >                       size_t granule)
> > > >   {
> > > > -     if (iop->cfg.tlb->tlb_add_page)
> > > > +     if (iop->cfg.tlb && iop->cfg.tlb->tlb_add_page)
> > > >               iop->cfg.tlb->tlb_add_page(gather, iova, granule, iop->cookie);
> > > >   }
> > > >
> > > >
> > > _______________________________________________
> > > Freedreno mailing list
> > > Freedreno@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
