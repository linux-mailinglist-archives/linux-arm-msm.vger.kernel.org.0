Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC71298587
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 03:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1421380AbgJZCVO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Oct 2020 22:21:14 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:3004 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1421377AbgJZCVO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Oct 2020 22:21:14 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CKJVN40gBzhb9K;
        Mon, 26 Oct 2020 10:21:16 +0800 (CST)
Received: from [127.0.0.1] (10.174.178.230) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Mon, 26 Oct 2020
 10:21:09 +0800
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by
 empty dma-ranges
To:     Arnd Bergmann <arnd@kernel.org>
CC:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
 <20201016090833.1892-2-thunder.leizhen@huawei.com>
 <CAK8P3a2TSmsNSi-XFpT6AQ3jvVxJ1AW7Uf5tAo477wtwXZwUzg@mail.gmail.com>
 <e27dc152-7aef-10df-f391-bf56e13e23df@gmail.com>
 <CAK8P3a13ywHh7igdfDSPQz9Bw8YAnKWFLKARkk2NL5u6=6yb=w@mail.gmail.com>
 <0eee3fd2-7400-7de7-27a7-7fcaa0955854@gmail.com>
 <d42745b7-ef76-e584-0da2-751ac8c1cf3a@huawei.com>
 <CAK8P3a335TT1+bdHqB=FetPanXXfGv3dC7ZCkx+w+F3j00kj5A@mail.gmail.com>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <07ab3bdd-dcb1-5a59-d813-f82451b3f028@huawei.com>
Date:   Mon, 26 Oct 2020 10:21:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a335TT1+bdHqB=FetPanXXfGv3dC7ZCkx+w+F3j00kj5A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.230]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2020/10/23 15:17, Arnd Bergmann wrote:
> On Sun, Oct 18, 2020 at 4:10 AM Leizhen (ThunderTown)
> <thunder.leizhen@huawei.com> wrote:
>> On 2020/10/17 3:27, Florian Fainelli wrote:
>>> On 10/16/20 11:23 AM, Arnd Bergmann wrote:
>>>> On Fri, Oct 16, 2020 at 6:48 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>>>> On 10/16/20 4:01 AM, Arnd Bergmann wrote:
>>>>>> On Fri, Oct 16, 2020 at 11:09 AM Zhen Lei <thunder.leizhen@huawei.com> wrote:
>>>>>>>
>>>>>>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>>>>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>>>>>
>>>>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>>>>>
>>>>>> I see that at least the 'bcd' and 'xhci' devices in fact try to
>>>>>> use 64-bit DMA. It would be good to test this on actual
>>>>>> hardware to ensure that it works correctly when this is enabled.
>>>>>>
>>>>>> Ideally avoiding the swiotlb bounce buffering should only
>>>>>> make it faster here, but there are many chips on which
>>>>>> 64-bit DMA is broken in some form.
>>>>>
>>>>> Is this change really an improvement though? This 'usb' pseudo bus node
>>>>> could just keep being defined with #address-cells = <1> and #size-cells
>>>>> = <1> so as to satisfy the 'reg' definition however we could just adjust
>>>>> dma-ranges to indicate full 64-bit addressing capability. Would not that
>>>>> work?
>>>>
>>>> When #address-cells is '1', you cannot specify dma-ranges that
>>>> go beyond a 32-bit address range.
>>>
>>> Would not it be enough to remove the 'dma-ranges' property though? Sorry
>>> for being slow here.
>>
>> Remove the 'dma-ranges' property should also work. After all, it is equivalent
>> to the original empty dma-ranges scheme. In addition, since the IOMMU nodes are
>> defined, it should be enabled.
> 
> Are you sure? I was expecting the IOMMU not to get used here since
> the devices do contain list an 'iommus' property.

OK，If the SMMU maybe disabled, then your proposal is necessary.

> 
>       Arnd
> 
> .
> 

