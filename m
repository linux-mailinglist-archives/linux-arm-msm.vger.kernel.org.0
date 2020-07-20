Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40D57226EEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 21:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730564AbgGTTTh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 15:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729027AbgGTTTh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 15:19:37 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B23EFC061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 12:19:36 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id x9so21455942ljc.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 12:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c27QdDaalrBPTYx6Hz4qEdOcDXJQt2hGAF2f+ujhjF4=;
        b=KuwTS0CtDg/KT6Vr6p1o4UTZ7HWalRZpW11IdhJWv6Yc5j/TD5gQ7zm5Jjh6B8XI5h
         yfJNFC7eK2lRmItt7PjIn51fAIMXuBYxgWFd3bm23wg5S6Tq4aHjL48ntwLG1xpskAHd
         IC9EtdXCtrNqzLjo5l8RV9NjG1QYz/6dbUsCE6VVhWXw48lAjBR5EyNpzl8NDfqOktSX
         EPmX6U04po198OszhbuhONTWOov4Xd3WFtEE0kzJi4eP9qCQ8vQq88ZBwSDh8+1T4FRD
         hbv4wlJXAUpI8yWYfRaNYst5gn2EOYKYC/8BLagM5mfRI31ySXxAV9tBd5D4Cr90agjs
         Lvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c27QdDaalrBPTYx6Hz4qEdOcDXJQt2hGAF2f+ujhjF4=;
        b=Wc2h4gqIFxbQM6BJuoLivxXZV6EUw6mT0kgVwFMpsM7XecLX2G2Ro9yhW/HPdF97MA
         tfrslB9Cabg8tUW/Naog2myvlwp+gG6ohn7KUFM8GRKtWFVeYC6uIEYikp1e6BA8CMtB
         9Pskr6r0PeA47ZEbf/45EnbQMnbmFPfbzKvn4b/pri3jkD7m2F+HyeHpQ1Ww7nDne7um
         YRfjmyPCK3quthUvqvbMgjh0baYmhVj/23SeLv0JGK0utPTmcj3AqLUqut7s4IFasUvd
         5G52pRxWnotw0EBeUdyny/Ysk1q77x5FJ9m5QrxSpY2nLdIdiMm5ihmYZqiOcCMyNB6r
         rQow==
X-Gm-Message-State: AOAM533zWydgaBE43EGkMVJ19iT61H6loEh1IzCaNy3kGy6DcPqG1Lnv
        CbGWtJ6CkSGiErxm05vz/MmTUmkXWPIeMdeO1rFUQA==
X-Google-Smtp-Source: ABdhPJytd1L3t3odiIQNSjrPSpGOSnIfawPzcqrPm7XkSZxsxS8d6ysT2xoLHLvMBq1OahMA3S7JIs4XecxrzglTgn8=
X-Received: by 2002:a2e:7401:: with SMTP id p1mr11812893ljc.366.1595272774987;
 Mon, 20 Jul 2020 12:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuzqA0N6O-52uH9aHjsfF6HfhuxMby1Y6Yz7jGMAHW0zw@mail.gmail.com>
 <CAK8P3a1SHQKNNCVj9Gp25BLuXUC2nf7FuVrqfpPYQkvMbhjzFg@mail.gmail.com>
 <ad7ba016-c3eb-a833-e4d3-4cdcb53ca786@arm.com> <CAF6AEGsBRxFC918nNzJZnxMpFnNC6qcNGvMjjM8U3AAn6CusNA@mail.gmail.com>
In-Reply-To: <CAF6AEGsBRxFC918nNzJZnxMpFnNC6qcNGvMjjM8U3AAn6CusNA@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 21 Jul 2020 00:49:23 +0530
Message-ID: <CA+G9fYv9K3FqR6D9=2jvQ3s_eSTL=K-x4QW4-P7=AgfjjHCBwA@mail.gmail.com>
Subject: Re: [Freedreno] arm64: Internal error: Oops: qcom_iommu_tlb_inv_context
 free_io_pgtable_ops on db410c
To:     Rob Clark <robdclark@gmail.com>
Cc:     Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Sean Paul <sean@poorly.run>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Vinod Koul <vinod.koul@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Andy Gross <agross@kernel.org>, lkft-triage@lists.linaro.org,
        open list <linux-kernel@vger.kernel.org>,
        Eric Anholt <eric@anholt.net>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        "Guohanjun (Hanjun Guo)" <guohanjun@huawei.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 20 Jul 2020 at 21:27, Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Jul 20, 2020 at 4:28 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 2020-07-20 08:17, Arnd Bergmann wrote:
> > > On Mon, Jul 20, 2020 at 8:36 AM Naresh Kamboju
> > > <naresh.kamboju@linaro.org> wrote:
<>
> > >> [    5.444121] Unable to handle kernel NULL pointer dereference at
> > >> virtual address 0000000000000018
> > >> [    5.456615]   ESR = 0x96000004
> > >> [    5.464471]   SET = 0, FnV = 0
> > >> [    5.464487]   EA = 0, S1PTW = 0
> > >> [    5.466521] Data abort info:
> > >> [    5.469971]   ISV = 0, ISS = 0x00000004
> > >> [    5.472768]   CM = 0, WnR = 0
> > >> [    5.476172] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000bacba000
> > >> [    5.479349] [0000000000000018] pgd=0000000000000000, p4d=0000000000000000
> > >> [    5.485820] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> > >> [    5.492448] Modules linked in: crct10dif_ce adv7511(+)
> > >> qcom_spmi_temp_alarm cec msm(+) mdt_loader qcom_camss videobuf2_dma_sg
> > >> drm_kms_helper v4l2_fwnode videobuf2_memops videobuf2_v4l2 qcom_rng
> > >> videobuf2_common i2c_qcom_cci display_connector socinfo drm qrtr ns
> > >> rmtfs_mem fuse
> > >> [    5.500256] CPU: 0 PID: 286 Comm: systemd-udevd Not tainted 5.8.0-rc5 #1
> > >> [    5.522484] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> > >> [    5.529170] pstate: 20000005 (nzCv daif -PAN -UAO BTYPE=--)
> > >> [    5.535856] pc : qcom_iommu_tlb_inv_context+0x18/0xa8
> > >> [    5.541148] lr : free_io_pgtable_ops+0x28/0x58
<>
> > >> [    5.628297] Call trace:
> > >> [    5.633592]  qcom_iommu_tlb_inv_context+0x18/0xa8
> > >
> > > This means that dev_iommu_fwspec_get() has returned NULL
> > > in qcom_iommu_tlb_inv_context(), either because dev->iommu
> > > is NULL, or because dev->iommu->fwspec is NULL.
> > >
> > > qcom_iommu_tlb_inv_context() does not check for a NULL
> > > pointer before using the returned object.
> > >
> > > The bug is either in the lack of error handling, or the fact
> > > that it's possible to get into this function for a device
> > > that has not been fully set up.
> >
> > Not quite - the device *was* properly set up, but has already been
> > properly torn down again in the removal path by iommu_release_device().
> > The problem is that qcom-iommu kept the device pointer as its TLB cookie
> > for the domain, but the domain has a longer lifespan than the validity
> > of that device - that's a fundamental design flaw in the driver.
>
> fwiw, I just sent "iommu/qcom: Use domain rather than dev as tlb
> cookie".. untested but looks like a straightforward enough change to
> switch over to using the domain rather than dev as cookie

The proposed patch tested and confirmed the reported problem fixed.

ref:
https://lore.kernel.org/linux-iommu/CA+G9fYtj1RBYcPhXZRm-qm5ygtdLj1jD8vFZSqQvwi_DNJLBwQ@mail.gmail.com/T/#m36a1fca18098f6c34275d928f9ba9c40c6d7fd63
https://lkft.validation.linaro.org/scheduler/job/1593950#L3392


>
> BR,
> -R


- Naresh
