Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1554C778
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 08:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfFTG0q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 02:26:46 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33322 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfFTG0q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 02:26:46 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5K6Qf3k043755;
        Thu, 20 Jun 2019 01:26:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561012001;
        bh=ojwATia8TEiy+wBWqxMCof1vsBQdy9/5roRADid+l7M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=w7PdRtoAbFDtPkfRisscvNCkd4sWUihoBp7aH4qQEI3D9KE+Ii42IT9tJyqZCnRN8
         HSFOSNpX2nfyBiO7m1GK1mCeRbF4zhy0I0ftsDvAaBiH7upbx8jgQ20C7reEE4d13O
         7II5T2CQZ6E0+bt6Q0s/HZiHYDX0TlsDZcPBcoeA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5K6QfVl101008
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 Jun 2019 01:26:41 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 20
 Jun 2019 01:26:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 20 Jun 2019 01:26:40 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5K6Qa3Q114861;
        Thu, 20 Jun 2019 01:26:38 -0500
Subject: Re: [PATCH v1] phy: qcom-qmp: Raise qcom_qmp_phy_enable() polling
 delay
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
CC:     MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <92d97c68-d226-6290-37d6-f46f42ea604b@free.fr>
 <a3a50cf5-083a-5aa8-e77c-6feb2f2fd866@codeaurora.org>
 <134f4648-682e-5fed-60e7-bc25985dd7e9@free.fr>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <e9d7667d-7ed4-d97e-b010-d61b214e6451@ti.com>
Date:   Thu, 20 Jun 2019 11:55:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <134f4648-682e-5fed-60e7-bc25985dd7e9@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 14/06/19 6:08 PM, Marc Gonzalez wrote:
> + Doug (who is familiar with usleep_range quirks)
> 
> On 14/06/2019 11:50, Vivek Gautam wrote:
> 
>> On 6/13/2019 5:02 PM, Marc Gonzalez wrote:
>>
>>> readl_poll_timeout() calls usleep_range() to sleep between reads.
>>> usleep_range() doesn't work efficiently for tiny values.
>>>
>>> Raise the polling delay in qcom_qmp_phy_enable() to bring it in line
>>> with the delay in qcom_qmp_phy_com_init().
>>>
>>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>>> ---
>>> Vivek, do you remember why you didn't use the same delay value in
>>> qcom_qmp_phy_enable) and qcom_qmp_phy_com_init() ?
>>
>> phy_qcom_init() thingy came from the PCIE phy driver from downstream
>> msm-3.18 PCIE did something as below:
> 
> FWIW and IMO, drivers/pci/host/pci-msm.c is a good example of how not to write
> a device driver. It's huge (7000+ lines) because it handles multiple platforms
> via ifdefs, and lumps everything together (phy, core IP, SoC specific glue)
> in a single file.
> 
>> -----
>> do {
>>          if (pcie_phy_is_ready(dev))
>>                  break;
>>          retries++;
>>          usleep_range(REFCLK_STABILIZATION_DELAY_US_MIN,
>>                                   REFCLK_STABILIZATION_DELAY_US_MAX);
>> } while (retries < PHY_READY_TIMEOUT_COUNT);
>>
>> REFCLK_STABILIZATION_DELAY_US_MIN/MAX ==> 1000/1005
>> PHY_READY_TIMEOUT_COUNT ==> 10
>> -----
> 
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/drivers/pci/host/pci-msm.c?h=LE.UM.1.3.r3.25#n4624
> 
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/drivers/pci/host/pci-msm.c?h=LE.UM.1.3.r3.25#n1721
> 
> readl_relaxed(dev->phy + PCIE_N_PCS_STATUS(dev->rc_idx, dev->common_phy)) & BIT(6)
> is equivalent to:
> the check in qcom_qmp_phy_enable()
> 
> readl_relaxed(dev->phy + PCIE_COM_PCS_READY_STATUS) & 0x1
> is equivalent to:
> the check in qcom_qmp_phy_com_init()
> 
> I'll take a closer look, using some printks, to narrow down the run-time
> execution path.
> 
>> phy_enable() from the usb phy driver from downstream.
>>   /* Wait for PHY initialization to be done */
>>   do {
>>           if (readl_relaxed(phy->base +
>>                   phy->phy_reg[USB3_PHY_PCS_STATUS]) & PHYSTATUS)
>>                   usleep_range(1, 2);
>> else
>> break;
>>   } while (--init_timeout_usec);
>>
>> init_timeout_usec ==> 1000
>> -----
>> USB never had a COM_PHY status bit.
>>
>> So clearly the resolutions were different.
>>
>> Does this change solve an issue at hand?
> 
> The issue is usleep_range() being misused ^_^
> 
> Although usleep_range() takes unsigned longs as parameters, it is
> not appropriate over the entire 0-2^64 range.
> 
> a) It should not be used with tiny values, because the cost of programming
> the timer interrupt, and processing the resulting IRQ would dominate.
> 
> b) It should not be used with large values (above 2000000/HZ) because
> msleep() is more efficient, and is acceptable for these ranges.

Documentation/timers/timers-howto.txt has all the information on the various
kernel delay/sleep mechanisms. For < ~10us, it recommends to use udelay
(readx_poll_timeout_atomic). Depending on the actual timeout to be used, the
delay mechanism in timers-howto.txt should be used.

Thanks
Kishon
