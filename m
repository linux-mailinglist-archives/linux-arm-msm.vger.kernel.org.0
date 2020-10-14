Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7D3328DA93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 09:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbgJNHih (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 03:38:37 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:42293 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727731AbgJNHih (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 03:38:37 -0400
Received: from mail-qt1-f181.google.com ([209.85.160.181]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M4Ja3-1kSsTy0Wtl-000I06; Wed, 14 Oct 2020 09:38:35 +0200
Received: by mail-qt1-f181.google.com with SMTP id q26so1670257qtb.5;
        Wed, 14 Oct 2020 00:38:34 -0700 (PDT)
X-Gm-Message-State: AOAM532b/m+tW/2OY/xlWLiJMNalNt+bWlJiKrvZ5S1ZrGmFe3q7LuX5
        LE86W+TSlUyW/ILM1fLhCdp0myuMHsuycwI6m0U=
X-Google-Smtp-Source: ABdhPJwjyqIWrdxjuToCcPKQ4Ok9IiPdkBThdZ93fTCE8qQlBXLLbjnIKJxr1TI7zS716oYktyaEvunRagv7aQiCUpo=
X-Received: by 2002:ac8:4808:: with SMTP id g8mr3478648qtq.18.1602661113831;
 Wed, 14 Oct 2020 00:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201013060623.1711-1-thunder.leizhen@huawei.com>
 <20201013060623.1711-2-thunder.leizhen@huawei.com> <fa40441b-6ae1-6018-3da6-424d0252c1ba@gmail.com>
In-Reply-To: <fa40441b-6ae1-6018-3da6-424d0252c1ba@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 14 Oct 2020 09:38:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3MtCDpbCgNEnLf1QcE+1O0oGZtob2KY7G-77oA95bLJQ@mail.gmail.com>
Message-ID: <CAK8P3a3MtCDpbCgNEnLf1QcE+1O0oGZtob2KY7G-77oA95bLJQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: broadcom: remove an unused property dma-ranges
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Zhen Lei <thunder.leizhen@huawei.com>,
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
X-Provags-ID: V03:K1:Jf1KNQ25SJqWboWIRMiPQ4MGu6/jPkDNhlKqcLifghuW3yXSSmi
 nKqyZqhahUf9n8W9vP6Q2CzxcgAWgijA7qfxm4RvlmnfovGbos0SMDo7dd6QEOD+4tueAb/
 wjjwOMEh+B9w7je8oll61Ac//X2C7Vj2+SCq8QsgNktpznLjjmJc4pG2P2wZljh+QSUZ+LD
 Rqn0aqee/G8eOS76GSh2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WFnra6oy8zY=:OdDRQ8iAlxmID1m1BFkCWy
 niOe8ROoZME5jSXPPs/cP9DfzO0fsNbaUnGipxGyco1YgSwK+nWVm2VCT+qsnmHW/Zu2pCySO
 DpWaLFHQK+3rmYdCKxqNn8YeHHrgfqKCbJshGU+wWXGPmWZMVZ6SPqAEFwBD6kj08FO9+dajs
 OdasJcEB/zjr1sJ2hT6b6G8flS9fsIjR8SSDpz7j3sfjFpmjHbo42WZgr+EkOAeS/PqnGnVhc
 ZJFLuQmH/sapewpGiYjIeVb0IMMcrn7FUSsaECfUp53en2j7tx23YKMUWV35lxRPL1ICRnpb7
 7v9PUxJ0ITOYt4ctts0IH2i6qA3Wl6WKsiNpzwkd3U5sfA3Y4Q9RbeNLdabt6ecA/7zKPa6GK
 dJGLy3mCKWq1aE/+N+vGKOmY+geVrqCHCd3ep9PG9daP8x/KVfw/y7jWRl1Z3TK/OPKDkcu4I
 6hAgSs3I+j4l4xGi+Kyyq434SOSHF8SsvrZOUVm8000R1Am8ZIrVhh7NfejnXgag0cdOpIctg
 GnKrpbtoX7tkpAmZIpMcZ5DswAo5MjTNGu5XrOXbDR5/nRBfRaq4Mtb+f/IsymW4WJ57lWTxn
 OV2FYg+LqMpLBeya7uxeHn2JyNySyhzWwwQvQGyEK8Ssp+htXp7DxkOOxRoI1g6ERYjHCRIaO
 275nXECDojHtMeBNF45fHAFCIJA1YG8SgaGp6fPxvu/f76UNbTf0Z+BHCLsGKj8VxqTq/GhTK
 T66QCGtHAYUgk5KYoC9t4ye261emYCqQ111jvcAUvR4JGBlKRJVRWGVRbIwz/mHJJHcqFxl9W
 +ABOrv3kepsB0MwxZFGf2Jz+s7pq36RdlB+xLgmbIhanGPA0PGEEAjkE4KacXs38OMQR/a+c+
 cQBNFJCmJHoG4cqiK/obPEAjsNI854JiTuK1j48ek=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 14, 2020 at 5:15 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 10/12/2020 11:06 PM, Zhen Lei wrote:
> > stingray-usb.dtsi is finally included by three dts files:
> > bcm958802a802x.dts, bcm958742k.dts and bcm958742t.dts. I searched all
> > these three entire expanded dts files, and each of them contains only one
> > dma-ranges. No conversion range is specified, so it cannot work properly.
> > I think this property "dma-ranges" is added by mistake, just remove it.
> > Otherwise, the following error will be reported when any YAML detection
> > is performed on arm64.
> >
> > arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
> > (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
> > its #address-cells (1) differs from / (2)
> > arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
> > (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
> > its #size-cells (1) differs from / (2)
> >
> > Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>
> This looks fine to me, Scott, Ray do you want to Ack this patch before I
> take it?

Does it mean that there are no devices on this bus that can do DMA?

Usually there should be a dma-ranges property to identify that DMA
is possible and what the limits are, though we have failed to enforce
that.

Also note that the #address-cells=<1> means that any device under
this bus is assumed to only support 32-bit addressing, and DMA will
have to go through a slow swiotlb in the absence of an IOMMU.

      Arnd
