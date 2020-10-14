Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59AC928E1D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 16:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731485AbgJNOCl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 10:02:41 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:57313 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730583AbgJNOCl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 10:02:41 -0400
Received: from mail-qv1-f54.google.com ([209.85.219.54]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M59am-1kRatn1vPQ-0019re; Wed, 14 Oct 2020 16:02:39 +0200
Received: by mail-qv1-f54.google.com with SMTP id ev17so1545202qvb.3;
        Wed, 14 Oct 2020 07:02:39 -0700 (PDT)
X-Gm-Message-State: AOAM531oX9u0yrRqrvygvSJ07XifikFxAkE2U/s/r3zne/72NcG6/GFf
        qZbpBFg1ECZYqZ4WL2nFwpI8NaI6lJZaclB+Icg=
X-Google-Smtp-Source: ABdhPJwgfI56FrNLiz4CpSplDkSHoEZ4Zvt+zTgBjQFaC37WzSoizPQNv2FK+09dOqqroEW1nEyt+Y67obGqrjFMkVY=
X-Received: by 2002:a0c:9b9e:: with SMTP id o30mr5218986qve.16.1602684158004;
 Wed, 14 Oct 2020 07:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201013060623.1711-1-thunder.leizhen@huawei.com>
 <20201013060623.1711-2-thunder.leizhen@huawei.com> <fa40441b-6ae1-6018-3da6-424d0252c1ba@gmail.com>
 <CAK8P3a3MtCDpbCgNEnLf1QcE+1O0oGZtob2KY7G-77oA95bLJQ@mail.gmail.com> <b25dd804-c691-b987-9f6a-de043aa45755@huawei.com>
In-Reply-To: <b25dd804-c691-b987-9f6a-de043aa45755@huawei.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 14 Oct 2020 16:02:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a24XPt55MuCnRPkH0QRVgmAbttghDnLkd5TQ-s6fi=GHg@mail.gmail.com>
Message-ID: <CAK8P3a24XPt55MuCnRPkH0QRVgmAbttghDnLkd5TQ-s6fi=GHg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: broadcom: remove an unused property dma-ranges
To:     "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
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
X-Provags-ID: V03:K1:yMjNHsWJyLt7APjhALcVLrZhskf/oJ5Oax0jR4w6+N9hCiIMucA
 c4HWvp1aBR8pMI4NEFkU+wiottlK8JdC9ve6uhg01BNoraKDspiQl0y8xZUsIZBAR+qPkXO
 P2JV5L+7ne43So6/PWKfZP9iWWVGDNuWXji0bQfKJ6AQcpR5xyq5ngJfFmAiKr5hcG/M9B7
 6WyZVwQJH0sJVij76saUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:J13trCvz2KM=:EzBrB1GiOkqBi6ILWaTVOk
 Z1GvMuwPupXH9REyUQAPwOh7y9vmF/jEZbGGfLqQbQOvinJgzZuXGzYiGSmiZv4JbWeQwpE8T
 2YZD9leS6PY8tMcMVR2Z0oQjmfV5XKbgMIBTIiQFHdhH8E5xVgdguEjePJYA7LhRhLxNnHtx2
 wt1LV+UYK4QlzEpqhGumQfvneROUw29l084RzEF/W2xsJSJMmbU/EXEGCs1XDAqFhykuy9VSB
 Q+KUte7Ikl1n6Hu5J9I6qqOdruNUvyOP+ALfWzzHO2mJeB0W3Qaa1LAUrPUkyVletbp0tBhdG
 2F5DR92wy+26ykwF7QasW3pw8BE7fulxlEgeho+YP02fWOpKK50gCL/0I+XEyij0FFELJUB15
 ck9qD2ta4PIJRu4b5bRC0n9D94Pr4ancyoEsfvh4uOg2WcuHBOvyZ2dDVWf0NVyVOH0vr5Vl2
 +Y/Cq1fWYuAIKXANVxcPi8biyE6kydHdxmIxFNA8fQgVPgZxyrft4KVJAbNJO3+8sdJ0oFTc9
 lpIwwvoFnHCoI/iTPjY++XNmGcodac1Y6toaGR0dnktDyRpDMUDbxK55gdihKoqIg==
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 14, 2020 at 3:36 PM Leizhen (ThunderTown)
<thunder.leizhen@huawei.com> wrote:
> On 2020/10/14 15:38, Arnd Bergmann wrote:
> > On Wed, Oct 14, 2020 at 5:15 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >> On 10/12/2020 11:06 PM, Zhen Lei wrote:
> >>> stingray-usb.dtsi is finally included by three dts files:
> >>> bcm958802a802x.dts, bcm958742k.dts and bcm958742t.dts. I searched all
> >>> these three entire expanded dts files, and each of them contains only one
> >>> dma-ranges. No conversion range is specified, so it cannot work properly.
> >>> I think this property "dma-ranges" is added by mistake, just remove it.
> >>> Otherwise, the following error will be reported when any YAML detection
> >>> is performed on arm64.
> >>>
> >>> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
> >>> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
> >>> its #address-cells (1) differs from / (2)
> >>> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
> >>> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
> >>> its #size-cells (1) differs from / (2)
> >>>
> >>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> >>
> >> This looks fine to me, Scott, Ray do you want to Ack this patch before I
> >> take it?
> >
> > Does it mean that there are no devices on this bus that can do DMA?
> >
> > Usually there should be a dma-ranges property to identify that DMA
> > is possible and what the limits are, though we have failed to enforce
> > that.
>
> Documentation/devicetree/bindings/iommu/iommu.txt +79
> When an "iommus" property is specified in a device tree node, the IOMMU will
> be used for address translation. If a "dma-ranges" property exists in the
> device's parent node it will be ignored. An exception to this rule is if the
> referenced IOMMU is disabled, in which case the "dma-ranges" property of the
> parent shall take effect.
>
> The dma-ranges is only required by IOMMU disabled case. And should exist in
> the parent node of IOMMU device. But this deleted dma-ranges is under the usb
> bus node.

The USB hosts here don't use an IOMMU though, right?

> > Also note that the #address-cells=<1> means that any device under
> > this bus is assumed to only support 32-bit addressing, and DMA will
> > have to go through a slow swiotlb in the absence of an IOMMU.
>
> The dma_alloc_coherent() will allocate memory with GFP_DMA32 flag and
> try the 0-4G first. The reserved swiotlb buffer memory is used only
> when the allocation failed.

The swiotlb is primarily about the streaming mappings with dma_map_*(),
which has to copy all data sent to the device. dma_alloc_coherent()
is a rare operation and less impacted by DMA limitations.

      Arnd
