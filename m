Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D0B2F3D48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 01:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393304AbhALVgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 16:36:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:37334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437001AbhALUlP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 15:41:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0979D23132;
        Tue, 12 Jan 2021 20:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610484035;
        bh=SONHjUo9FngGURhRhDZ/F9U2Tf3HyJ/zuHETooyr/lU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iLgsljOnI/5lDJNAKtBJTZ1kR0cJOSaOJNgsngw3gKcYlLylHi8hZRq/TPajQQIYf
         7Dt6ZTRrkBUaeIpSNdtPLT9F35S23Keb6NuVdM5c98TjG9eW5bbbUxlx6eUSOqwp/U
         1oyYefh8ogUGOy7Z1MNmrrR7tmb5mg6/4/TI5XGabh8E7i8SNkb2r8BGSLE7pWo04u
         zR0i1ZCW9cXjLJFPWblRVZ+uYXO8W3fxiJmgfgc4qR8WVHzPoItDQZVOj6jv+nNPt6
         chZ3TiGRX8tm05WnT5CjWWvHQNTh5Y/zmbD+HCdTPPCisIur93wuaoMNu5BSFIvOEu
         6S947NstpK0rA==
Received: by mail-ot1-f46.google.com with SMTP id i6so3630391otr.2;
        Tue, 12 Jan 2021 12:40:35 -0800 (PST)
X-Gm-Message-State: AOAM531eN1q2korDs+GuFZIcrx/DguylYyP6WzWStV3hY8Tfc72bi6dg
        sGD9IheCNmkCUoDwv6Ovl3vSRkHndAe+hMSW+/Q=
X-Google-Smtp-Source: ABdhPJzz9s9YF4E0Qe6yvRnCZ2edeoO0zESUgmHyRFrTzwD1XCWloAfGGeXkv/k8suIIl/HQcDEwUw2Lo6OKNR89Cpg=
X-Received: by 2002:a05:6830:1e14:: with SMTP id s20mr836509otr.210.1610484033785;
 Tue, 12 Jan 2021 12:40:33 -0800 (PST)
MIME-Version: 1.0
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
 <20201016090833.1892-2-thunder.leizhen@huawei.com> <20201128045328.2411772-1-f.fainelli@gmail.com>
 <CAK8P3a1_5RgcPz+bgo1bbUBk8NTJd=1-Y5-=CsQYkFgLfTE3_A@mail.gmail.com>
 <9c6c6b7e-8c39-8c49-5c87-9b560c027841@broadcom.com> <CAK8P3a2XYk8D80XARrpUSBHk1yye3KHXOdaQge4HNSZZOC=xKw@mail.gmail.com>
 <CACvutz9v+TBUbrCo3X-u5ebbs04nR0y0yQN3qWfSAyZVy9RM2g@mail.gmail.com>
 <c38cf11a-ed1d-d150-52fb-e3b4a0a30712@gmail.com> <CAK8P3a1TViQopQNFE4+Dtac0v2CneGiy22WYu5BuYv8HX2r8Lg@mail.gmail.com>
 <18112862-a42e-95b1-39a3-2e414667f39b@broadcom.com>
In-Reply-To: <18112862-a42e-95b1-39a3-2e414667f39b@broadcom.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 12 Jan 2021 21:40:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2+EfOKAo3HLb+_qd-gnqWD55dyW0juSw1TM8jHKiZYoQ@mail.gmail.com>
Message-ID: <CAK8P3a2+EfOKAo3HLb+_qd-gnqWD55dyW0juSw1TM8jHKiZYoQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by
 empty dma-ranges
To:     Ray Jui <ray.jui@broadcom.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Bharat Gooty <bharat.gooty@broadcom.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Scott Branden <sbranden@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 12, 2021 at 7:28 PM Ray Jui <ray.jui@broadcom.com> wrote:
> On 2020-12-15 7:49 a.m., Arnd Bergmann wrote:
> > On Tue, Dec 15, 2020 at 4:41 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>
> >> On 12/15/2020 5:19 AM, Bharat Gooty wrote:
> >>> Since the IOMMU is disabled and DMA engine is on 32-bit bus, We can not
> >>> give the complete DDR for the USB DMA.
> >>> So restricting the usable DAM size to 4GB.
> >>
> >> Thanks, can you make this a proper patch submission along with a Fixes:
> >> tag that is:
> >>
> >> Fixes: 2013a4b684b6 ("arm64: dts: broadcom: clear the warnings caused by
> >> empty dma-ranges")
> >
> > Yes, that would be helpful, though I would appreciate a better description
> > that explains what is actually going on: is it the device or the bus that
> > has the 32-bit limitation, and if it is indeed a bug in the device, why do
> > you pretend that this is a 64-bit device on a 32-bit bus instead (this
> > could also use a comment in the dts file)?
> >
> >         Arnd
> >
>
> Sorry for the delay in reply. Bharat finally got time to do some
> investigation to confirm the following:
>
> These USB controllers indeed can address 64-bit. However, on the bus
> internally, only 40-bits are connected to the interconnect of CCN. As a
> result, the 'dma-ranges' should be modified to address 40-bit in size.

a 40-bit range is effectively the same as a 64-bit range though, so I
think you'll still need a driver quirk if the device cannot use the whole 40
bit addressing but is limited to 32 bits because of a bug in its dma engine.

> We also have a somewhat related question, is it true that since v5.10,
> defining of 'dma-ranges' on the bus node where its child device node has
> implication of IOMMU usage (through 'iommus' or 'iommu-map') is now
> mandatory? My understanding is that the 'dma-ranges' in this scheme will
> define the IOVA address to system address mapping required by all
> devices on that bus. Please help to confirm if my understanding is correct

I have not actually seen that change. In general, you should always
have a dma-ranges property in the parent of a DMA master, I think
we just never enforced that and fall back to a 32-bit mask by default.

      Arnd
