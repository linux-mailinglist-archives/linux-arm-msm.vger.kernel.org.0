Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7404B28E189
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 15:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731287AbgJNNnO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 09:43:14 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15288 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731190AbgJNNnN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 09:43:13 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id B2632521067FF2E8F636;
        Wed, 14 Oct 2020 21:43:11 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.134) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Wed, 14 Oct 2020
 21:43:08 +0800
Subject: Re: [PATCH 1/2] arm64: dts: broadcom: remove an unused property
 dma-ranges
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
To:     Arnd Bergmann <arnd@arndb.de>,
        Florian Fainelli <f.fainelli@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        "Scott Branden" <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20201013060623.1711-1-thunder.leizhen@huawei.com>
 <20201013060623.1711-2-thunder.leizhen@huawei.com>
 <fa40441b-6ae1-6018-3da6-424d0252c1ba@gmail.com>
 <CAK8P3a3MtCDpbCgNEnLf1QcE+1O0oGZtob2KY7G-77oA95bLJQ@mail.gmail.com>
 <b25dd804-c691-b987-9f6a-de043aa45755@huawei.com>
Message-ID: <e0c1e997-06fd-6947-fccf-ae0a0f936a49@huawei.com>
Date:   Wed, 14 Oct 2020 21:43:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <b25dd804-c691-b987-9f6a-de043aa45755@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.134]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2020/10/14 21:36, Leizhen (ThunderTown) wrote:
> 
> 
> On 2020/10/14 15:38, Arnd Bergmann wrote:
>> On Wed, Oct 14, 2020 at 5:15 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>> On 10/12/2020 11:06 PM, Zhen Lei wrote:
>>>> stingray-usb.dtsi is finally included by three dts files:
>>>> bcm958802a802x.dts, bcm958742k.dts and bcm958742t.dts. I searched all
>>>> these three entire expanded dts files, and each of them contains only one
>>>> dma-ranges. No conversion range is specified, so it cannot work properly.
>>>> I think this property "dma-ranges" is added by mistake, just remove it.
>>>> Otherwise, the following error will be reported when any YAML detection
>>>> is performed on arm64.
>>>>
>>>> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
>>>> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
>>>> its #address-cells (1) differs from / (2)
>>>> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
>>>> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
>>>> its #size-cells (1) differs from / (2)
>>>>
>>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>>
>>> This looks fine to me, Scott, Ray do you want to Ack this patch before I
>>> take it?
>>
>> Does it mean that there are no devices on this bus that can do DMA?
>>
>> Usually there should be a dma-ranges property to identify that DMA
>> is possible and what the limits are, though we have failed to enforce
>> that.
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
> 
>>
>> Also note that the #address-cells=<1> means that any device under
>> this bus is assumed to only support 32-bit addressing, and DMA will
>> have to go through a slow swiotlb in the absence of an IOMMU.
> 
> The dma_alloc_coherent() will allocate memory with GFP_DMA32 flag and
> try the 0-4G first. The reserved swiotlb buffer memory is used only
> when the allocation failed.

----- Sorry, my mistake, please ignore the following.

> 
>  memory@80000000:
>     device_type: ["memory"]
>     reg: [[0x0, 0x80000000, 0x0, 0x80000000], [0x8, 0x80000000, 0x1, 0x80000000]]
> 
> If this is the actual physical memory size, the #address-cells should be set to <1>.
> 
>>
>>       Arnd
>>
>> .
>>

