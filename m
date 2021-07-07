Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 278F03BEDA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 20:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhGGSFf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 14:05:35 -0400
Received: from mga04.intel.com ([192.55.52.120]:29716 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229519AbhGGSFe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 14:05:34 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="207529865"
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; 
   d="scan'208";a="207529865"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2021 11:02:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; 
   d="scan'208";a="628102843"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.79]) ([10.237.72.79])
  by orsmga005.jf.intel.com with ESMTP; 07 Jul 2021 11:02:48 -0700
Subject: Re: [PATCH V2] mmc: sdhci: Update the software timeout value for sdhc
To:     sbhanu@codeaurora.org
Cc:     ulf.hansson@linaro.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, vbadigan@codeaurora.org,
        rampraka@codeaurora.org, sayalil@codeaurora.org,
        sartgarg@codeaurora.org, rnayak@codeaurora.org,
        cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
References: <1624804840-3479-1-git-send-email-sbhanu@codeaurora.org>
 <3217c101-534b-bfcb-7ba9-5749d73cf242@intel.com>
 <467960e793b39ffd13e8d5c5c3b87057@codeaurora.org>
 <1d574e4cfc4c793166027d008948a0a5@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <e68593c2-bd4f-b4e6-e562-fc10223c750a@intel.com>
Date:   Wed, 7 Jul 2021 21:03:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1d574e4cfc4c793166027d008948a0a5@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/07/21 5:09 pm, sbhanu@codeaurora.org wrote:
> On 2021-07-01 22:28, sbhanu@codeaurora.org wrote:
>> On 2021-06-30 19:38, Adrian Hunter wrote:
>>> On 27/06/21 5:40 pm, Shaik Sajida Bhanu wrote:
>>>> Whenever SDHC run at clock rate 50MHZ or below, the hardware data
>>>> timeout value will be 21.47secs, which is approx. 22secs and we have
>>>> a current software timeout value as 10secs. We have to set software
>>>> timeout value more than the hardware data timeout value to avioid seeing
>>>> the below register dumps.
>>>>
>>>> [  332.953670] mmc2: Timeout waiting for hardware interrupt.
>>>> [  332.959608] mmc2: sdhci: ============ SDHCI REGISTER DUMP ===========
>>>> [  332.966450] mmc2: sdhci: Sys addr:  0x00000000 | Version:  0x00007202
>>>> [  332.973256] mmc2: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000001
>>>> [  332.980054] mmc2: sdhci: Argument:  0x00000000 | Trn mode: 0x00000027
>>>> [  332.986864] mmc2: sdhci: Present:   0x01f801f6 | Host ctl: 0x0000001f
>>>> [  332.993671] mmc2: sdhci: Power:     0x00000001 | Blk gap:  0x00000000
>>>> [  333.000583] mmc2: sdhci: Wake-up:   0x00000000 | Clock:    0x00000007
>>>> [  333.007386] mmc2: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
>>>> [  333.014182] mmc2: sdhci: Int enab:  0x03ff100b | Sig enab: 0x03ff100b
>>>> [  333.020976] mmc2: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
>>>> [  333.027771] mmc2: sdhci: Caps:      0x322dc8b2 | Caps_1:   0x0000808f
>>>> [  333.034561] mmc2: sdhci: Cmd:       0x0000183a | Max curr: 0x00000000
>>>> [  333.041359] mmc2: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x00000000
>>>> [  333.048157] mmc2: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
>>>> [  333.054945] mmc2: sdhci: Host ctl2: 0x00000000
>>>> [  333.059657] mmc2: sdhci: ADMA Err:  0x00000000 | ADMA Ptr:
>>>> 0x0000000ffffff218
>>>> [  333.067178] mmc2: sdhci_msm: ----------- VENDOR REGISTER DUMP
>>>> -----------
>>>> [  333.074343] mmc2: sdhci_msm: DLL sts: 0x00000000 | DLL cfg:
>>>> 0x6000642c | DLL cfg2: 0x0020a000
>>>> [  333.083417] mmc2: sdhci_msm: DLL cfg3: 0x00000000 | DLL usr ctl:
>>>> 0x00000000 | DDR cfg: 0x80040873
>>>> [  333.092850] mmc2: sdhci_msm: Vndr func: 0x00008a9c | Vndr func2 :
>>>> 0xf88218a8 Vndr func3: 0x02626040
>>>> [  333.102371] mmc2: sdhci: ============================================
>>>>
>>>> So, set software timeout value more than hardware timeout value.
>>>>
>>>> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
>>>> ---
>>>>
>>>> Changes since V1:
>>>>     - Moved software data timeout update part to qcom specific file as
>>>>       suggested by Veerabhadrarao Badiganti.
>>>> ---
>>>>  drivers/mmc/host/sdhci-msm.c | 9 +++++++++
>>>>  1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>>> index e44b7a6..58e651e 100644
>>>> --- a/drivers/mmc/host/sdhci-msm.c
>>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>>> @@ -2089,6 +2089,14 @@ static void sdhci_msm_cqe_disable(struct mmc_host *mmc, bool recovery)
>>>>      sdhci_cqe_disable(mmc, recovery);
>>>>  }
>>>>
>>>> +static void sdhci_msm_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
>>>> +{
>>>> +
>>>> +    __sdhci_set_timeout(host, cmd);
>>>> +    if (cmd && (cmd->data) && (host->clock > 400000) && (host->clock <= 50000000))
>>>
>>> There are some redundant parenthesis there and cmd is never NULL i.e. could be:
>>>
>>>     if (cmd->data && host->clock > 400000 && host->clock <= 50000000)
>> Sure
> Hi,
> 
> We are passing cmd as NULL in sdhci_cqe_enable( ) for eMMC so, i think we should check cmd.

Very true.
