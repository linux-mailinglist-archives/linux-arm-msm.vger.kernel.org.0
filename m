Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3FE2C73C0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387440AbgK1Vty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:48484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731614AbgK1Syg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 13:54:36 -0500
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1056421D7F;
        Sat, 28 Nov 2020 09:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606557535;
        bh=IV7SKkTEc9uVMaziNS3MY2bbX2PI+wASsFkaPqx7XFY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YYiDQv9kz4m3Kpob/hfPm4MKiHYe/aOK4W63bLieTTH4rlm+wPA0MmEWZXz33kBxq
         krhPvcxzeJoMQ6ewyc0CnEu9w4eUaiEiXt3o44rZPqjjW4GpmVl4zICkvuLvn7di6y
         U32a3mZA5cqfmCsJTIfURM7rqg4Pyh3eyaqf6+UI=
Received: by mail-ot1-f49.google.com with SMTP id h19so6817308otr.1;
        Sat, 28 Nov 2020 01:58:55 -0800 (PST)
X-Gm-Message-State: AOAM531md5B8MYK6aAaumsYtjyvHRuN4anFakQFqFjNQOS8bGz50lDtH
        pDF8lwbDBNLBg5mOozXEBK7MoD8/GO75DbbjpF8=
X-Google-Smtp-Source: ABdhPJzwDIV2KH6ZUTuUCcaFbI59yHKYPRCBFYR0DnN7sy7J13urjT30Lbs97ypWwEBR/lTvSTpao8LQsEN4NpyzRk0=
X-Received: by 2002:a9d:be1:: with SMTP id 88mr9531159oth.210.1606557534394;
 Sat, 28 Nov 2020 01:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
 <20201016090833.1892-2-thunder.leizhen@huawei.com> <20201128045328.2411772-1-f.fainelli@gmail.com>
In-Reply-To: <20201128045328.2411772-1-f.fainelli@gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Sat, 28 Nov 2020 10:58:38 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1_5RgcPz+bgo1bbUBk8NTJd=1-Y5-=CsQYkFgLfTE3_A@mail.gmail.com>
Message-ID: <CAK8P3a1_5RgcPz+bgo1bbUBk8NTJd=1-Y5-=CsQYkFgLfTE3_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by
 empty dma-ranges
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 28, 2020 at 5:53 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On Fri, 16 Oct 2020 17:08:32 +0800, Zhen Lei <thunder.leizhen@huawei.com> wrote:
> > The scripts/dtc/checks.c requires that the node have empty "dma-ranges"
> > property must have the same "#address-cells" and "#size-cells" values as
> > the parent node. Otherwise, the following warnings is reported:
> >
> > arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
> > (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
> > its #address-cells (1) differs from / (2)
> > arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
> > (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
> > its #size-cells (1) differs from / (2)
> >
> > Arnd Bergmann figured out why it's necessary:
> > Also note that the #address-cells=<1> means that any device under
> > this bus is assumed to only support 32-bit addressing, and DMA will
> > have to go through a slow swiotlb in the absence of an IOMMU.
> >
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> > ---
>
> Applied to devicetree-arm64/next, thanks!

The notification may have gone missing, but I had merged it into v5.10-fixes
already, and as of today, it's in mainline, so you can drop it from your
next branch, or just leave it in if you want to avoid taking things out of
your tree.

      Arnd
