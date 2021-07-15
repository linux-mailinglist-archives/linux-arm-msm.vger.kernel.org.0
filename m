Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2615C3C9872
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 07:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239885AbhGOFcZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 01:32:25 -0400
Received: from mga06.intel.com ([134.134.136.31]:65194 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238709AbhGOFcZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 01:32:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="271585155"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; 
   d="scan'208";a="271585155"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2021 22:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; 
   d="scan'208";a="460238295"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.79]) ([10.237.72.79])
  by orsmga008.jf.intel.com with ESMTP; 14 Jul 2021 22:29:27 -0700
Subject: Re: [PATCH V3] mmc: sdhci-msm: Update the software timeout value for
 sdhc
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>, ulf.hansson@linaro.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, sartgarg@codeaurora.org,
        rnayak@codeaurora.org, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
References: <1625500253-12815-1-git-send-email-sbhanu@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <7bd56312-96ab-debe-0f80-112af994b233@intel.com>
Date:   Thu, 15 Jul 2021 08:29:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625500253-12815-1-git-send-email-sbhanu@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/07/21 6:50 pm, Shaik Sajida Bhanu wrote:
> Whenever SDHC run at clock rate 50MHZ or below, the hardware data
> timeout value will be 21.47secs, which is approx. 22secs and we have
> a current software timeout value as 10secs. We have to set software
> timeout value more than the hardware data timeout value to avioid seeing
> the below register dumps.
> 
> [  332.953670] mmc2: Timeout waiting for hardware interrupt.
> [  332.959608] mmc2: sdhci: ============ SDHCI REGISTER DUMP ===========
> [  332.966450] mmc2: sdhci: Sys addr:  0x00000000 | Version:  0x00007202
> [  332.973256] mmc2: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000001
> [  332.980054] mmc2: sdhci: Argument:  0x00000000 | Trn mode: 0x00000027
> [  332.986864] mmc2: sdhci: Present:   0x01f801f6 | Host ctl: 0x0000001f
> [  332.993671] mmc2: sdhci: Power:     0x00000001 | Blk gap:  0x00000000
> [  333.000583] mmc2: sdhci: Wake-up:   0x00000000 | Clock:    0x00000007
> [  333.007386] mmc2: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
> [  333.014182] mmc2: sdhci: Int enab:  0x03ff100b | Sig enab: 0x03ff100b
> [  333.020976] mmc2: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
> [  333.027771] mmc2: sdhci: Caps:      0x322dc8b2 | Caps_1:   0x0000808f
> [  333.034561] mmc2: sdhci: Cmd:       0x0000183a | Max curr: 0x00000000
> [  333.041359] mmc2: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x00000000
> [  333.048157] mmc2: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
> [  333.054945] mmc2: sdhci: Host ctl2: 0x00000000
> [  333.059657] mmc2: sdhci: ADMA Err:  0x00000000 | ADMA Ptr:
> 0x0000000ffffff218
> [  333.067178] mmc2: sdhci_msm: ----------- VENDOR REGISTER DUMP
> -----------
> [  333.074343] mmc2: sdhci_msm: DLL sts: 0x00000000 | DLL cfg:
> 0x6000642c | DLL cfg2: 0x0020a000
> [  333.083417] mmc2: sdhci_msm: DLL cfg3: 0x00000000 | DLL usr ctl:
> 0x00000000 | DDR cfg: 0x80040873
> [  333.092850] mmc2: sdhci_msm: Vndr func: 0x00008a9c | Vndr func2 :
> 0xf88218a8 Vndr func3: 0x02626040
> [  333.102371] mmc2: sdhci: ============================================
> 
> So, set software timeout value more than hardware timeout value.
> 
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>

A couple of minor nitpicks below.  Fix those and you can add:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> 
> Changes since V2:
> 	- Updated 22 with 22LL to avoid compiler warning as suggested by
> 	  Adrian Hunter.
> 	- Added a check to update software data timeout value if its value is
> 	  less than the calculated hardware data timeout value as suggested
> 	  by Veerabhadrarao Badiganti.
> 
> Changes since V1:
> 	- Moved software data timeout update part to qcom specific file
> 	  as suggested by Veerabhadrarao Badiganti.
> ---
>  drivers/mmc/host/sdhci-msm.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e44b7a6..64fb85e 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2089,6 +2089,23 @@ static void sdhci_msm_cqe_disable(struct mmc_host *mmc, bool recovery)
>  	sdhci_cqe_disable(mmc, recovery);
>  }
>  
> +static void sdhci_msm_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
> +{
> +

Unnecessary blank line.

> +	u32 count, start = 15;
> +
> +	__sdhci_set_timeout(host, cmd);
> +	count = sdhci_readb(host, SDHCI_TIMEOUT_CONTROL);
> +	/*
> +	 * Update software timeout value if its value is less than hardware data
> +	 * timeout value. Qcom SoC hardware data timeout value was calculated
> +	 * using 4 * MCLK * 2^(count + 13). where MCLK = 1 / host->clock.
> +	 */
> +	if (cmd && cmd->data && host->clock > 400000 && host->clock <= 50000000
> +			&& ((1 << (count + start)) > (10 * host->clock)))

'&&' is better at the end of the previous line

Also fewer parenthesis is more readable e.g.

	if (cmd && cmd->data && host->clock > 400000 &&
	    host->clock <= 50000000 &&
	    (1 << (count + start)) > (10 * host->clock))

> +		host->data_timeout = 22LL * NSEC_PER_SEC;
> +}
> +
>  static const struct cqhci_host_ops sdhci_msm_cqhci_ops = {
>  	.enable		= sdhci_msm_cqe_enable,
>  	.disable	= sdhci_msm_cqe_disable,
> @@ -2438,6 +2455,7 @@ static const struct sdhci_ops sdhci_msm_ops = {
>  	.irq	= sdhci_msm_cqe_irq,
>  	.dump_vendor_regs = sdhci_msm_dump_vendor_regs,
>  	.set_power = sdhci_set_power_noreg,
> +	.set_timeout = sdhci_msm_set_timeout,
>  };
>  
>  static const struct sdhci_pltfm_data sdhci_msm_pdata = {
> 

