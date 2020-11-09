Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800ED2AC2F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 18:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729982AbgKIR4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 12:56:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:46522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729533AbgKIR4p (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 12:56:45 -0500
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0CBE2068D;
        Mon,  9 Nov 2020 17:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604944604;
        bh=d6Nc5RiBiq3XeVeUekKRvwM0AjmxizMZD3zTXBs+VC4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FVYQvb7fC0tGjEnXYBJQ2BU5DlA5DqfngmMFCiFhFKfAgCxqRGKVSe2p8N2HqbQjq
         /Bnb9Po+fBPysQCXYwDJrdyHYwNF0iTLU4hNyl8lp+hbb10EMnMGCUwtGWDGPMa1tV
         ni2mTuAYNW6rsVUITrQg8PIcWLnCqm+RlqVrjSYw=
Received: by mail-ot1-f46.google.com with SMTP id i18so9824898ots.0;
        Mon, 09 Nov 2020 09:56:44 -0800 (PST)
X-Gm-Message-State: AOAM530QOW6il7fcYKdDBA5LKSrOX5TY7Y/P11NrIpY0C+FMjy9/xzZ8
        KlJd09pE0q3kKEIGo+P6bisBkca3Z1eACnXl3hs=
X-Google-Smtp-Source: ABdhPJzwwdrokAaOrQsqgDF/PuVm5uWw4aTF/jcoTVvzI+iPfxQKuJFv+zTFsqp2WSG5m2QtpOuWLLudtXJ7Iq25qbM=
X-Received: by 2002:a9d:65d5:: with SMTP id z21mr10432995oth.251.1604944603895;
 Mon, 09 Nov 2020 09:56:43 -0800 (PST)
MIME-Version: 1.0
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
 <20201016090833.1892-2-thunder.leizhen@huawei.com> <CAK8P3a2TSmsNSi-XFpT6AQ3jvVxJ1AW7Uf5tAo477wtwXZwUzg@mail.gmail.com>
 <e27dc152-7aef-10df-f391-bf56e13e23df@gmail.com> <CAK8P3a13ywHh7igdfDSPQz9Bw8YAnKWFLKARkk2NL5u6=6yb=w@mail.gmail.com>
 <0eee3fd2-7400-7de7-27a7-7fcaa0955854@gmail.com> <d42745b7-ef76-e584-0da2-751ac8c1cf3a@huawei.com>
 <CAK8P3a335TT1+bdHqB=FetPanXXfGv3dC7ZCkx+w+F3j00kj5A@mail.gmail.com>
 <07ab3bdd-dcb1-5a59-d813-f82451b3f028@huawei.com> <5980552d-6e96-fd9f-c758-1b1e9f57100e@huawei.com>
 <43986e17-f493-b3b6-2829-3ba7d92f2e8c@gmail.com>
In-Reply-To: <43986e17-f493-b3b6-2829-3ba7d92f2e8c@gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 9 Nov 2020 18:56:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a374KTVR6vC4civ0pNy8S9n4o8Ni9wCrdko-JO7aRO2GQ@mail.gmail.com>
Message-ID: <CAK8P3a374KTVR6vC4civ0pNy8S9n4o8Ni9wCrdko-JO7aRO2GQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by
 empty dma-ranges
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
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

On Mon, Nov 9, 2020 at 6:30 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 11/8/20 10:18 PM, Leizhen (ThunderTown) wrote:
> > Hi, everybody:
> >   How do we deal with this problem? I updated the kernel to the latest and the problem still persists.
> >
> >   make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j24 dtbs 2>err.txt
> >   vim err.txt
> >
> > arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
> > arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
> > arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
> > arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
> > arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
> > arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
> > arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
> > arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
>
> I was hoping that Ray or Scott could give this a try, and TBH, I am
> still not a big fan of having to mangle the 'reg' property to be
> compatible with #address-cells = <2> and #size-cells = <2>, I would have
> preferred omitting the 'dma-ranges' property entirely.
>
> We have plenty of time to get this patch applied for v5.11.

I would much prefer to get the warning fixed for v5.10, once we know what the
hardware can or cannot actually do, as it is one of the warnings that shows
up in every kernelci build.

      Arnd
