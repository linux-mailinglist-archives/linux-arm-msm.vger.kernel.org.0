Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9ED72AB128
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 07:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729557AbgKIGSZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 01:18:25 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7616 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729552AbgKIGSZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 01:18:25 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CV15J5S3gzLwMf;
        Mon,  9 Nov 2020 14:18:12 +0800 (CST)
Received: from [127.0.0.1] (10.174.178.230) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 14:18:21 +0800
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by
 empty dma-ranges
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
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
 <07ab3bdd-dcb1-5a59-d813-f82451b3f028@huawei.com>
Message-ID: <5980552d-6e96-fd9f-c758-1b1e9f57100e@huawei.com>
Date:   Mon, 9 Nov 2020 14:18:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <07ab3bdd-dcb1-5a59-d813-f82451b3f028@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.230]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi, everybody:
  How do we deal with this problem? I updated the kernel to the latest and the problem still persists.

  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j24 dtbs 2>err.txt
  vim err.txt

arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)




On 2020/10/26 10:21, Leizhen (ThunderTown) wrote:
> 
> 
> On 2020/10/23 15:17, Arnd Bergmann wrote:
>> On Sun, Oct 18, 2020 at 4:10 AM Leizhen (ThunderTown)
>> <thunder.leizhen@huawei.com> wrote:
>>> On 2020/10/17 3:27, Florian Fainelli wrote:
>>>> On 10/16/20 11:23 AM, Arnd Bergmann wrote:
>>>>> On Fri, Oct 16, 2020 at 6:48 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>>>>> On 10/16/20 4:01 AM, Arnd Bergmann wrote:
>>>>>>> On Fri, Oct 16, 2020 at 11:09 AM Zhen Lei <thunder.leizhen@huawei.com> wrote:
>>>>>>>>
>>>>>>>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>>>>>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>>>>>>
>>>>>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>>>>>>
>>>>>>> I see that at least the 'bcd' and 'xhci' devices in fact try to
>>>>>>> use 64-bit DMA. It would be good to test this on actual
>>>>>>> hardware to ensure that it works correctly when this is enabled.
>>>>>>>
>>>>>>> Ideally avoiding the swiotlb bounce buffering should only
>>>>>>> make it faster here, but there are many chips on which
>>>>>>> 64-bit DMA is broken in some form.
>>>>>>
>>>>>> Is this change really an improvement though? This 'usb' pseudo bus node
>>>>>> could just keep being defined with #address-cells = <1> and #size-cells
>>>>>> = <1> so as to satisfy the 'reg' definition however we could just adjust
>>>>>> dma-ranges to indicate full 64-bit addressing capability. Would not that
>>>>>> work?
>>>>>
>>>>> When #address-cells is '1', you cannot specify dma-ranges that
>>>>> go beyond a 32-bit address range.
>>>>
>>>> Would not it be enough to remove the 'dma-ranges' property though? Sorry
>>>> for being slow here.
>>>
>>> Remove the 'dma-ranges' property should also work. After all, it is equivalent
>>> to the original empty dma-ranges scheme. In addition, since the IOMMU nodes are
>>> defined, it should be enabled.
>>
>> Are you sure? I was expecting the IOMMU not to get used here since
>> the devices do contain list an 'iommus' property.
> 
> OK，If the SMMU maybe disabled, then your proposal is necessary.
> 
>>
>>       Arnd
>>
>> .
>>

