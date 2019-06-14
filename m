Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9BE545CF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 14:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbfFNMiG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 08:38:06 -0400
Received: from ns.iliad.fr ([212.27.33.1]:39624 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727544AbfFNMiG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 08:38:06 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 8613C20A5C;
        Fri, 14 Jun 2019 14:38:03 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 379C620564;
        Fri, 14 Jun 2019 14:38:03 +0200 (CEST)
Subject: Re: [PATCH v1] phy: qcom-qmp: Raise qcom_qmp_phy_enable() polling
 delay
To:     Vivek Gautam <vivek.gautam@codeaurora.org>,
        Kishon Vijay Abraham <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <92d97c68-d226-6290-37d6-f46f42ea604b@free.fr>
 <a3a50cf5-083a-5aa8-e77c-6feb2f2fd866@codeaurora.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <134f4648-682e-5fed-60e7-bc25985dd7e9@free.fr>
Date:   Fri, 14 Jun 2019 14:38:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a3a50cf5-083a-5aa8-e77c-6feb2f2fd866@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Fri Jun 14 14:38:03 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Doug (who is familiar with usleep_range quirks)

On 14/06/2019 11:50, Vivek Gautam wrote:

> On 6/13/2019 5:02 PM, Marc Gonzalez wrote:
> 
>> readl_poll_timeout() calls usleep_range() to sleep between reads.
>> usleep_range() doesn't work efficiently for tiny values.
>>
>> Raise the polling delay in qcom_qmp_phy_enable() to bring it in line
>> with the delay in qcom_qmp_phy_com_init().
>>
>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>> ---
>> Vivek, do you remember why you didn't use the same delay value in
>> qcom_qmp_phy_enable) and qcom_qmp_phy_com_init() ?
> 
> phy_qcom_init() thingy came from the PCIE phy driver from downstream
> msm-3.18 PCIE did something as below:

FWIW and IMO, drivers/pci/host/pci-msm.c is a good example of how not to write
a device driver. It's huge (7000+ lines) because it handles multiple platforms
via ifdefs, and lumps everything together (phy, core IP, SoC specific glue)
in a single file.

> -----
> do {
>          if (pcie_phy_is_ready(dev))
>                  break;
>          retries++;
>          usleep_range(REFCLK_STABILIZATION_DELAY_US_MIN,
>                                   REFCLK_STABILIZATION_DELAY_US_MAX);
> } while (retries < PHY_READY_TIMEOUT_COUNT);
> 
> REFCLK_STABILIZATION_DELAY_US_MIN/MAX ==> 1000/1005
> PHY_READY_TIMEOUT_COUNT ==> 10
> -----

https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/drivers/pci/host/pci-msm.c?h=LE.UM.1.3.r3.25#n4624

https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/drivers/pci/host/pci-msm.c?h=LE.UM.1.3.r3.25#n1721

readl_relaxed(dev->phy + PCIE_N_PCS_STATUS(dev->rc_idx, dev->common_phy)) & BIT(6)
is equivalent to:
the check in qcom_qmp_phy_enable()

readl_relaxed(dev->phy + PCIE_COM_PCS_READY_STATUS) & 0x1
is equivalent to:
the check in qcom_qmp_phy_com_init()

I'll take a closer look, using some printks, to narrow down the run-time
execution path.

> phy_enable() from the usb phy driver from downstream.
>   /* Wait for PHY initialization to be done */
>   do {
>           if (readl_relaxed(phy->base +
>                   phy->phy_reg[USB3_PHY_PCS_STATUS]) & PHYSTATUS)
>                   usleep_range(1, 2);
> else
> break;
>   } while (--init_timeout_usec);
> 
> init_timeout_usec ==> 1000
> -----
> USB never had a COM_PHY status bit.
> 
> So clearly the resolutions were different.
> 
> Does this change solve an issue at hand?

The issue is usleep_range() being misused ^_^

Although usleep_range() takes unsigned longs as parameters, it is
not appropriate over the entire 0-2^64 range.

a) It should not be used with tiny values, because the cost of programming
the timer interrupt, and processing the resulting IRQ would dominate.

b) It should not be used with large values (above 2000000/HZ) because
msleep() is more efficient, and is acceptable for these ranges.

Regards.
