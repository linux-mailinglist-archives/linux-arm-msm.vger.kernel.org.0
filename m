Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646023AE5C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 11:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbhFUJS4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 05:18:56 -0400
Received: from mga02.intel.com ([134.134.136.20]:17479 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230161AbhFUJSz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 05:18:55 -0400
IronPort-SDR: XyePhxm1nkJun3Xy0gNIRPvtT6XTyi7jgTOSl4Z6UNYvw8v6+WsbPZZ0OduErklIBCvwAeI274
 mOKLyvgI7IzA==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="193942767"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; 
   d="scan'208";a="193942767"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2021 02:16:40 -0700
IronPort-SDR: iQmkomCwDDdVXXDaqkNApQLjRWgLJtyXG4+cnhHyF0BlK9tAHMpsCJ1Fdp9xpNHUNCeP3fGcLy
 ANjGWplN0H2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; 
   d="scan'208";a="405563804"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.79]) ([10.237.72.79])
  by orsmga006.jf.intel.com with ESMTP; 21 Jun 2021 02:16:35 -0700
Subject: Re: [PATCH V1] mmc: sdhci: Update the software timeout value for sdhc
To:     Doug Anderson <dianders@chromium.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>,
        sartgarg@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
References: <1623835535-30871-1-git-send-email-sbhanu@codeaurora.org>
 <585e003c-0342-4691-ab6d-8c6a930f9404@codeaurora.org>
 <CAD=FV=UVYxfZ_U+-spCcHpe6hGxKHG4SWbc6-DfzH8Ax13DNOQ@mail.gmail.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <1c61c5dc-4857-6089-0588-81c36dee1fd6@intel.com>
Date:   Mon, 21 Jun 2021 12:16:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UVYxfZ_U+-spCcHpe6hGxKHG4SWbc6-DfzH8Ax13DNOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/06/21 1:49 am, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jun 18, 2021 at 8:31 AM Veerabhadrarao Badiganti
> <vbadigan@codeaurora.org> wrote:
>>
>>
>> On 6/16/2021 2:55 PM, Shaik Sajida Bhanu wrote:
>>> Whenever SDHC run at clock rate 50MHZ or below, the hardware data
>>> timeout value will be 21.47secs, which is approx. 22secs and we have
>>> a current software timeout value as 10secs. We have to set software
>>> timeout value more than the hardware data timeout value to avioid seeing
>>> the below register dumps.
>>>
>>> [  332.953670] mmc2: Timeout waiting for hardware interrupt.
>>> [  332.959608] mmc2: sdhci: ============ SDHCI REGISTER DUMP ===========
>>> [  332.966450] mmc2: sdhci: Sys addr:  0x00000000 | Version:  0x00007202
>>> [  332.973256] mmc2: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000001
>>> [  332.980054] mmc2: sdhci: Argument:  0x00000000 | Trn mode: 0x00000027
>>> [  332.986864] mmc2: sdhci: Present:   0x01f801f6 | Host ctl: 0x0000001f
>>> [  332.993671] mmc2: sdhci: Power:     0x00000001 | Blk gap:  0x00000000
>>> [  333.000583] mmc2: sdhci: Wake-up:   0x00000000 | Clock:    0x00000007
>>> [  333.007386] mmc2: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
>>> [  333.014182] mmc2: sdhci: Int enab:  0x03ff100b | Sig enab: 0x03ff100b
>>> [  333.020976] mmc2: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
>>> [  333.027771] mmc2: sdhci: Caps:      0x322dc8b2 | Caps_1:   0x0000808f
>>> [  333.034561] mmc2: sdhci: Cmd:       0x0000183a | Max curr: 0x00000000
>>> [  333.041359] mmc2: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x00000000
>>> [  333.048157] mmc2: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
>>> [  333.054945] mmc2: sdhci: Host ctl2: 0x00000000
>>> [  333.059657] mmc2: sdhci: ADMA Err:  0x00000000 | ADMA Ptr:
>>> 0x0000000ffffff218
>>> [  333.067178] mmc2: sdhci_msm: ----------- VENDOR REGISTER DUMP
>>> -----------
>>> [  333.074343] mmc2: sdhci_msm: DLL sts: 0x00000000 | DLL cfg:
>>> 0x6000642c | DLL cfg2: 0x0020a000
>>> [  333.083417] mmc2: sdhci_msm: DLL cfg3: 0x00000000 | DLL usr ctl:
>>> 0x00000000 | DDR cfg: 0x80040873
>>> [  333.092850] mmc2: sdhci_msm: Vndr func: 0x00008a9c | Vndr func2 :
>>> 0xf88218a8 Vndr func3: 0x02626040
>>> [  333.102371] mmc2: sdhci: ============================================
>>>
>>> So, set software timeout value more than hardware timeout value.
>>>
>>> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
>>> ---
>>>   drivers/mmc/host/sdhci.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
>>> index bf238ad..1386f7d 100644
>>> --- a/drivers/mmc/host/sdhci.c
>>> +++ b/drivers/mmc/host/sdhci.c
>>> @@ -1670,7 +1670,14 @@ static bool sdhci_send_command(struct sdhci_host *host, struct mmc_command *cmd)
>>>       else if (!cmd->data && cmd->busy_timeout > 9000)
>>>               timeout += DIV_ROUND_UP(cmd->busy_timeout, 1000) * HZ + HZ;
>>>       else
>>> -             timeout += 10 * HZ;
>>> +            /*
>>> +             * In some of the conditions hardware data timeout value could be
>>> +             * approx 21.5 seconds and driver is setting software data timeout
>>> +             * value less than the hardware data timeout value and software data
>>> +             * timeout value should be more than the hardware data timeout value.
>>> +             * So, set software data timeout value more than 21.5 sec i.e. 22sec.
>>> +             */
>>> +             timeout += 22 * HZ;
>>
>> This timeout is qcom SDHC specific.
>> I think right way is to, define your own set_timeout op and update
>> host->data_timeout
>> in that as per qcom SDHC requirements.
> 
> It is? Off-thread Shaik was indicating that the problem had to do with
> the inaccuracy of the "SDHCI_TIMEOUT_CONTROL" register. That seems to
> be in the common SDHCI code. Specifically looking at
> sdhci_calc_timeout() it can be seen that the possible hardware values
> for the timeout double each time, so if you need a hardware timeout
> that's slightly higher than one of the possible values you might end
> up with a hardware timeout that's almost double what you want.
> 
> Assuming that the problem actually is with the inaccuracy of
> SDHCI_TIMEOUT_CONTROL (I didn't walk through and validate), it
> actually seems like we should generally be doubling the value we were
> programming for the software timeout (in other words, not just ones
> that are <= 9 seconds). I haven't done all the math, but I presume the
> reason that we need 22 instead of 20 is some type of extra fudge
> factor somewhere?
> 
> Maybe the only reason that Qualcomm hits this is due to the PLL that's
> sourcing the SDHCI controller at a non-standard rate?
> 
> I suppose another reason maybe why people aren't hitting it is just
> the random chance of what rate the integer overflow in
> mmc_set_data_timeout() leaves you at? I pointed this out to Shiak and
> was hoping a patch would be included for that, but I can always try to
> write one later if not. To be concrete, I have
> card->csd.taac_ns=5000000 and card->csd.r2w_factor=5. Multiplying
> things out (and accounting for mult=100 for SD cards), I end up with a
> timeout_ns of 0x3b9aca000 (16 seconds) which doesn't fit in the 32-bit
> data->timeout_ns earlier. The truncation was making it look like the
> card requested a max timeout of 3,115,098,112 ns = ~3.1 seconds.

The software timeout is meant to catch cases where the hardware
timeout has failed, but SDHCI also supports a mechanism to use
software timeouts when the timeout is too big for the hardware
 - refer SDHCI_QUIRK2_DISABLE_HW_TIMEOUT and sdhci_calc_sw_timeout()

Historically, R/W timeouts were never longer than 2.5 seconds.
(5ms x 5 x 100 == 2.5s), so 10s has been enough ever since the
driver was written around 2006

Longer timeouts are for erase etc, but they are now always set
in cmd->busy_timeout.

So 22s is a strangely long timeout for R/W operations, and I would say
even 10s is longer than we really want.

One option would be to make it a variable that host controllers
can re-assign if needed e.g.

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 6aaf5c3ce34c..e5b4317937ed 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -1670,7 +1670,7 @@ static bool sdhci_send_command(struct sdhci_host *host, struct mmc_command *cmd)
 	else if (!cmd->data && cmd->busy_timeout > 9000)
 		timeout += DIV_ROUND_UP(cmd->busy_timeout, 1000) * HZ + HZ;
 	else
-		timeout += 10 * HZ;
+		timeout += host->fallback_timeout_secs * HZ;
 	sdhci_mod_timer(host, cmd->mrq, timeout);
 
 	if (host->use_external_dma)
@@ -3936,6 +3936,8 @@ struct sdhci_host *sdhci_alloc_host(struct device *dev,
 	 */
 	host->adma_table_cnt = SDHCI_MAX_SEGS * 2 + 1;
 
+	host->fallback_timeout_secs = 10;
+
 	return host;
 }




