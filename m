Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2CC420267
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Oct 2021 17:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhJCPt6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Oct 2021 11:49:58 -0400
Received: from mga14.intel.com ([192.55.52.115]:65215 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230426AbhJCPt6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Oct 2021 11:49:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="225502392"
X-IronPort-AV: E=Sophos;i="5.85,343,1624345200"; 
   d="scan'208";a="225502392"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2021 08:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,343,1624345200"; 
   d="scan'208";a="710370568"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.76]) ([10.237.72.76])
  by fmsmga006.fm.intel.com with ESMTP; 03 Oct 2021 08:48:07 -0700
Subject: Re: [RFC PATCH] mmc: sdhci: Map more voltage level to SDHCI_POWER_330
To:     Shawn Guo <shawn.guo@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210926132847.22268-1-shawn.guo@linaro.org>
 <CAPDyKFoVJSkODW8bjHcTVywiNPMQndHhg2B9haQTP_3M3-B3hQ@mail.gmail.com>
 <20211003135822.GA13320@dragon>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <68124891-469f-20ea-a1c8-87e9a865e8f7@intel.com>
Date:   Sun, 3 Oct 2021 18:47:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003135822.GA13320@dragon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/10/2021 16:58, Shawn Guo wrote:
> On Thu, Sep 30, 2021 at 01:00:03PM +0200, Ulf Hansson wrote:
>> On Sun, 26 Sept 2021 at 15:28, Shawn Guo <shawn.guo@linaro.org> wrote:
>>>
>>> On Thundercomm TurboX CM2290, the eMMC OCR reports vdd = 23 (3.5 ~ 3.6 V),
>>> which is being treated as an invalid value by sdhci_set_power_noreg().
>>> And thus eMMC is totally broken on the platform.
>>>
>>> [    1.436599] ------------[ cut here ]------------
>>> [    1.436606] mmc0: Invalid vdd 0x17
>>> [    1.436640] WARNING: CPU: 2 PID: 69 at drivers/mmc/host/sdhci.c:2048 sdhci_set_power_noreg+0x168/0x2b4
>>> [    1.436655] Modules linked in:
>>> [    1.436662] CPU: 2 PID: 69 Comm: kworker/u8:1 Tainted: G        W         5.15.0-rc1+ #137
>>> [    1.436669] Hardware name: Thundercomm TurboX CM2290 (DT)
>>> [    1.436674] Workqueue: events_unbound async_run_entry_fn
>>> [    1.436685] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>> [    1.436692] pc : sdhci_set_power_noreg+0x168/0x2b4
>>> [    1.436698] lr : sdhci_set_power_noreg+0x168/0x2b4
>>> [    1.436703] sp : ffff800010803a60
>>> [    1.436705] x29: ffff800010803a60 x28: ffff6a9102465f00 x27: ffff6a9101720a70
>>> [    1.436715] x26: ffff6a91014de1c0 x25: ffff6a91014de010 x24: ffff6a91016af280
>>> [    1.436724] x23: ffffaf7b1b276640 x22: 0000000000000000 x21: ffff6a9101720000
>>> [    1.436733] x20: ffff6a9101720370 x19: ffff6a9101720580 x18: 0000000000000020
>>> [    1.436743] x17: 0000000000000000 x16: 0000000000000004 x15: ffffffffffffffff
>>> [    1.436751] x14: 0000000000000000 x13: 00000000fffffffd x12: ffffaf7b1b84b0bc
>>> [    1.436760] x11: ffffaf7b1b720d10 x10: 000000000000000a x9 : ffff800010803a60
>>> [    1.436769] x8 : 000000000000000a x7 : 000000000000000f x6 : 00000000fffff159
>>> [    1.436778] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000ffffffff
>>> [    1.436787] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff6a9101718d80
>>> [    1.436797] Call trace:
>>> [    1.436800]  sdhci_set_power_noreg+0x168/0x2b4
>>> [    1.436805]  sdhci_set_ios+0xa0/0x7fc
>>> [    1.436811]  mmc_power_up.part.0+0xc4/0x164
>>> [    1.436818]  mmc_start_host+0xa0/0xb0
>>> [    1.436824]  mmc_add_host+0x60/0x90
>>> [    1.436830]  __sdhci_add_host+0x174/0x330
>>> [    1.436836]  sdhci_msm_probe+0x7c0/0x920
>>> [    1.436842]  platform_probe+0x68/0xe0
>>> [    1.436850]  really_probe.part.0+0x9c/0x31c
>>> [    1.436857]  __driver_probe_device+0x98/0x144
>>> [    1.436863]  driver_probe_device+0xc8/0x15c
>>> [    1.436869]  __device_attach_driver+0xb4/0x120
>>> [    1.436875]  bus_for_each_drv+0x78/0xd0
>>> [    1.436881]  __device_attach_async_helper+0xac/0xd0
>>> [    1.436888]  async_run_entry_fn+0x34/0x110
>>> [    1.436895]  process_one_work+0x1d0/0x354
>>> [    1.436903]  worker_thread+0x13c/0x470
>>> [    1.436910]  kthread+0x150/0x160
>>> [    1.436915]  ret_from_fork+0x10/0x20
>>> [    1.436923] ---[ end trace fcfac44cb045c3a8 ]---
>>>
>>> Fix the issue by mapping MMC_VDD_35_36 (and MMC_VDD_34_35) to
>>> SDHCI_POWER_330 as well.
>>>
>>> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
>>> ---
>>> I'm not sure if this is the right solution, as I do not have SDHCI
>>> specification.  Hence it's a RFC.
>>>
>>>  drivers/mmc/host/sdhci.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
>>> index 8eefa7d5fe85..2427481535a3 100644
>>> --- a/drivers/mmc/host/sdhci.c
>>> +++ b/drivers/mmc/host/sdhci.c
>>> @@ -2042,6 +2042,8 @@ void sdhci_set_power_noreg(struct sdhci_host *host, unsigned char mode,
>>>                         break;
>>>                 case MMC_VDD_32_33:
>>>                 case MMC_VDD_33_34:
>>> +               case MMC_VDD_34_35:
>>> +               case MMC_VDD_35_36:
>>>                         pwr = SDHCI_POWER_330;
>>
>> The SDHCI specification doesn't state exactly what level
>> SDHCI_POWER_330 corresponds to. It's 3.3V typically.
>>
>> I don't have any strong opinion about this change, although I am a
>> little bit puzzled over why this solves the problem for you.
>>
>> Unless the host (sdhci) announces that it supports MMC_VDD_34_35 or
>> MMC_VDD_35_36 through its mmc->ocr_avail mask, the mmc core shouldn't
>> try to use it. Can you perhaps check what value the mmc->ocr_avail
>> gets assigned to in sdhci_setup_host() for your mmc host?
> 
> Hi Ulf,
> 
> Thanks for the comment!
> 
> ocr_avail is 0xfff800, which is a result of mmc_regulator_get_ocrmask()
> call.  On this platform, the vmmc has a 3.6V max voltage.  I can enforce
> `regulator-max-microvolt` to be 3.3V to fix the problem, but I'm not
> sure it's more correct than this RFC change.

The host controller lines are not necessarily connected directly to the
card, and the 3.3V selection is not necessarily actually 3.3V either.
So I have no problem with the change, but the question of whether it is
right for you really depends on your hardware.  For the patch, I would
suggest adding a comment in the code, that the driver that allows
3.4V-3.6V is assumed to know that the hardware supports it.
