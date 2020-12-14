Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3277E2DA0CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 20:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502063AbgLNTro (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 14:47:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:41358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502651AbgLNTre (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 14:47:34 -0500
X-Gm-Message-State: AOAM531DRRlvufKRAOkXba7tZfqH6G/poFFbg9eiAZpAEmvJi4CszD4r
        X9alM2ON5MwaHJ8YEAbuDjsaBjJv6+Q6+rCokEQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607975211;
        bh=iceNd6VKbkYU3nfVma/61jZjDtVc/NaK9/C3nnbBU+s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YqOE4WkisE4n/EA2GnnXtjTtyvTCfho3/J/05vyZ2nsT70AO7ql79KlyA+i9606SD
         MPbennpTkRpYhfCT4z6VX4rxQUjPy41QhfJw1LjEGnvKwZGUl6rZsD1g9BkV9vZSo8
         zE5OsIeE0JwN9Tw2mq4leC/p106L+/+Tjg8/7uHzVx9VhBOX27Bs/ttvos1NBncu6j
         9IadRHjAqDuVuKAzQrW0sWXCgdK63OXRkorda7DMTE58Fr43Fc1a6+2WBZ0712/eD/
         kJwTdG3dLLiOn7UqIPp2EFThm+2sfSZyb7U6NrvN62Nwgbj/wUsZ6lelV03cLqFhQC
         ZEfAsgGEclKTQ==
X-Google-Smtp-Source: ABdhPJzYGX1MMWPJFOHz30xp0aU5ph8u4S7t+0cxYtTT/8ErnPkWs3IM3N63LP5Kxy3d1xhce/zozUnaGS1ftZEokd4=
X-Received: by 2002:aca:3b41:: with SMTP id i62mr4305679oia.67.1607975210247;
 Mon, 14 Dec 2020 11:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
 <20201016090833.1892-2-thunder.leizhen@huawei.com> <20201128045328.2411772-1-f.fainelli@gmail.com>
 <CAK8P3a1_5RgcPz+bgo1bbUBk8NTJd=1-Y5-=CsQYkFgLfTE3_A@mail.gmail.com> <9c6c6b7e-8c39-8c49-5c87-9b560c027841@broadcom.com>
In-Reply-To: <9c6c6b7e-8c39-8c49-5c87-9b560c027841@broadcom.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 14 Dec 2020 20:46:33 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2XYk8D80XARrpUSBHk1yye3KHXOdaQge4HNSZZOC=xKw@mail.gmail.com>
Message-ID: <CAK8P3a2XYk8D80XARrpUSBHk1yye3KHXOdaQge4HNSZZOC=xKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by
 empty dma-ranges
To:     Ray Jui <ray.jui@broadcom.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
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
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Bharat Gooty <bharat.gooty@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 14, 2020 at 8:09 PM Ray Jui <ray.jui@broadcom.com> wrote:
> On 11/28/2020 1:58 AM, Arnd Bergmann wrote:
> > On Sat, Nov 28, 2020 at 5:53 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>
> >> On Fri, 16 Oct 2020 17:08:32 +0800, Zhen Lei <thunder.leizhen@huawei.com> wrote:
> >>> The scripts/dtc/checks.c requires that the node have empty "dma-ranges"
> >>> property must have the same "#address-cells" and "#size-cells" values as
> >>> the parent node. Otherwise, the following warnings is reported:
> >>>
> >>> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
> >>> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
> >>> its #address-cells (1) differs from / (2)
> >>> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
> >>> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
> >>> its #size-cells (1) differs from / (2)
> >>>
> >>> Arnd Bergmann figured out why it's necessary:
> >>> Also note that the #address-cells=<1> means that any device under
> >>> this bus is assumed to only support 32-bit addressing, and DMA will
> >>> have to go through a slow swiotlb in the absence of an IOMMU.
> >>>
> >>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> >>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> >>> ---
> >>
> >> Applied to devicetree-arm64/next, thanks!
> >
> > The notification may have gone missing, but I had merged it into v5.10-fixes
> > already, and as of today, it's in mainline, so you can drop it from your
> > next branch, or just leave it in if you want to avoid taking things out of
> > your tree.
>
> It looks like this patch might have caused a regression on Stingray USB.
> Bharat, could you please confirm?

Well, this is what I had asked about originally, I assumed that
Florian had asked someone with access to the datasheet.

> The fix would be to properly define the dma-ranges to be 32-bit (0x0 ~
> 0xffffffff) since IOMMU is disabled on this device and the device's DMA
> engine is on a 32-bit bus.

That's not how dma-ranges work, they tell you what the capabilities
of the bus are, while the capabilities of the device are identified by
the properties of that device.

The device claims to be compatible with "generic-xhci", so the
driver asks for a 64-bit mask to be set according to the xhci
specification. If this device is not xhci compliant, then it should
not ask for a 64-bit mask.

However, if this is a 64-bit capable bus master on a 32-bit bus,
then the dma-ranges property should list the capabilities of the
bus, so the kernel can force the driver to fall back to 32-bit addressing.

      Arnd
