Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2316128FF7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 09:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404869AbgJPHxX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 03:53:23 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15228 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404867AbgJPHxX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 03:53:23 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id F2A0DE3BEB72781C2BA9;
        Fri, 16 Oct 2020 15:53:20 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.134) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Fri, 16 Oct 2020
 15:53:17 +0800
Subject: Re: [PATCH 1/2] arm64: dts: broadcom: remove an unused property
 dma-ranges
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     devicetree <devicetree@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20201013060623.1711-1-thunder.leizhen@huawei.com>
 <20201013060623.1711-2-thunder.leizhen@huawei.com>
 <fa40441b-6ae1-6018-3da6-424d0252c1ba@gmail.com>
 <CAK8P3a3MtCDpbCgNEnLf1QcE+1O0oGZtob2KY7G-77oA95bLJQ@mail.gmail.com>
 <b25dd804-c691-b987-9f6a-de043aa45755@huawei.com>
 <CAK8P3a24XPt55MuCnRPkH0QRVgmAbttghDnLkd5TQ-s6fi=GHg@mail.gmail.com>
 <989f3efa-4fd0-8061-266c-56de03ce9029@huawei.com>
Message-ID: <1b50ccfd-e402-d81a-31d8-56aab86dfc03@huawei.com>
Date:   Fri, 16 Oct 2020 15:53:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <989f3efa-4fd0-8061-266c-56de03ce9029@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.134]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2020/10/16 15:06, Leizhen (ThunderTown) wrote:
> 
> 
> On 2020/10/14 22:02, Arnd Bergmann wrote:
>> On Wed, Oct 14, 2020 at 3:36 PM Leizhen (ThunderTown)
>> <thunder.leizhen@huawei.com> wrote:
>>> On 2020/10/14 15:38, Arnd Bergmann wrote:
>>>> On Wed, Oct 14, 2020 at 5:15 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>>>> On 10/12/2020 11:06 PM, Zhen Lei wrote:
>>>>>> stingray-usb.dtsi is finally included by three dts files:
>>>>>> bcm958802a802x.dts, bcm958742k.dts and bcm958742t.dts. I searched all
>>>>>> these three entire expanded dts files, and each of them contains only one
>>>>>> dma-ranges. No conversion range is specified, so it cannot work properly.
>>>>>> I think this property "dma-ranges" is added by mistake, just remove it.
>>>>>> Otherwise, the following error will be reported when any YAML detection
>>>>>> is performed on arm64.
>>>>>>
>>>>>> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
>>>>>> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
>>>>>> its #address-cells (1) differs from / (2)
>>>>>> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
>>>>>> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
>>>>>> its #size-cells (1) differs from / (2)
>>>>>>
>>>>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>>>>
>>>>> This looks fine to me, Scott, Ray do you want to Ack this patch before I
>>>>> take it?
>>>>
>>>> Does it mean that there are no devices on this bus that can do DMA?
>>>>
>>>> Usually there should be a dma-ranges property to identify that DMA
>>>> is possible and what the limits are, though we have failed to enforce
>>>> that.
>>>
>>> Documentation/devicetree/bindings/iommu/iommu.txt +79
>>> When an "iommus" property is specified in a device tree node, the IOMMU will
>>> be used for address translation. If a "dma-ranges" property exists in the
>>> device's parent node it will be ignored. An exception to this rule is if the
>>> referenced IOMMU is disabled, in which case the "dma-ranges" property of the
>>> parent shall take effect.
>>>
>>> The dma-ranges is only required by IOMMU disabled case. And should exist in
>>> the parent node of IOMMU device. But this deleted dma-ranges is under the usb
>>> bus node.
>>
>> The USB hosts here don't use an IOMMU though, right?
> 
> Generally, USB devices are accessed through the IOMMU. However, even in this
> case, dma-ranges is not necessarily required. There are many examples of this
> in arch/arm64/boot/dts/. For example: arch/arm64/boot/dts/arm/juno.dt.yaml.
> 
> Not sure, but maybe I found the answer.
> 
> vi drivers/of/address.c +457
> 457                                               Thus we treat the absence of
> 458          * "ranges" as equivalent to an empty "ranges" property which means
> 459          * a 1:1 translation at that level.
> 
> 466          * This quirk also applies for 'dma-ranges' which frequently exist in
> 467          * child nodes without 'dma-ranges' in the parent nodes. --RobH
> 
> 475         if (ranges == NULL || rlen == 0) {
> 476                 offset = of_read_number(addr, na);
> 477                 memset(addr, 0, pna * 4);
> 478                 pr_debug("empty ranges; 1:1 translation\n");
> 479                 goto finish;
> 480         }
> 
> By the way: At first, I thought that these errors was detected by YAML. Now,
> I found that it was generated by "make dtbs". That's why it was reported by
> any YAML. Thus, the need to fix these errors is even more urgent.
> 
> 
>>
>>>> Also note that the #address-cells=<1> means that any device under
>>>> this bus is assumed to only support 32-bit addressing, and DMA will

Hi, Arnd:
  I known what you mean now. I will rewrite the patch. Thanks.

>>>> have to go through a slow swiotlb in the absence of an IOMMU.
>>>
>>> The dma_alloc_coherent() will allocate memory with GFP_DMA32 flag and
>>> try the 0-4G first. The reserved swiotlb buffer memory is used only
>>> when the allocation failed.
>>
>> The swiotlb is primarily about the streaming mappings with dma_map_*(),
>> which has to copy all data sent to the device. dma_alloc_coherent()
>> is a rare operation and less impacted by DMA limitations.
> 
> OK, I got it.
> 
>>
>>       Arnd
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
>> .
>>
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> .
> 

