Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CABD23DD40D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 12:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbhHBKmZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 06:42:25 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:12437 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233243AbhHBKmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 06:42:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627900935; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=darOhbQjZjiDGZ9KoG4mUCBwsmYEbyLqHS1GzH5OshY=;
 b=FOZzwJ/ARGVVxAW9kHC7zPFO4NP9PfVLrrfwjDFD0LtAsVnnUIzWdvEkGeAiI7zrQmmXFjBR
 n4l4PaGlCHvXy5Rdbh5pZOaB1AekvWvA+ZlzHf0c2PMJcXzT3P3Kdm4FFoFLp+aD0mZbtjDZ
 Q2AEV47t0yIjHL0JN5Bma8eUDJM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6107cbe917c2b4047d403f4f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Aug 2021 10:41:45
 GMT
Sender: sbhanu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 85C22C4323A; Mon,  2 Aug 2021 10:41:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbhanu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D3AFC433F1;
        Mon,  2 Aug 2021 10:41:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 Aug 2021 16:11:43 +0530
From:   sbhanu@codeaurora.org
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, sartgarg@codeaurora.org,
        rnayak@codeaurora.org, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH V4] mmc: sdhci-msm: Update the software timeout value for
 sdhc
In-Reply-To: <1626435974-14462-1-git-send-email-sbhanu@codeaurora.org>
References: <1626435974-14462-1-git-send-email-sbhanu@codeaurora.org>
Message-ID: <d95ea0583c39b8e73f391502adb39b09@codeaurora.org>
X-Sender: sbhanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Gentle Reminder

Thanks,
Sajida

On 2021-07-16 17:16, Shaik Sajida Bhanu wrote:
> Whenever SDHC run at clock rate 50MHZ or below, the hardware data
> timeout value will be 21.47secs, which is approx. 22secs and we have
> a current software timeout value as 10secs. We have to set software
> timeout value more than the hardware data timeout value to avioid 
> seeing
> the below register dumps.
> 
> [  332.953670] mmc2: Timeout waiting for hardware interrupt.
> [  332.959608] mmc2: sdhci: ============ SDHCI REGISTER DUMP 
> ===========
> [  332.966450] mmc2: sdhci: Sys addr:  0x00000000 | Version:  
> 0x00007202
> [  332.973256] mmc2: sdhci: Blk size:  0x00000200 | Blk cnt:  
> 0x00000001
> [  332.980054] mmc2: sdhci: Argument:  0x00000000 | Trn mode: 
> 0x00000027
> [  332.986864] mmc2: sdhci: Present:   0x01f801f6 | Host ctl: 
> 0x0000001f
> [  332.993671] mmc2: sdhci: Power:     0x00000001 | Blk gap:  
> 0x00000000
> [  333.000583] mmc2: sdhci: Wake-up:   0x00000000 | Clock:    
> 0x00000007
> [  333.007386] mmc2: sdhci: Timeout:   0x0000000e | Int stat: 
> 0x00000000
> [  333.014182] mmc2: sdhci: Int enab:  0x03ff100b | Sig enab: 
> 0x03ff100b
> [  333.020976] mmc2: sdhci: ACmd stat: 0x00000000 | Slot int: 
> 0x00000000
> [  333.027771] mmc2: sdhci: Caps:      0x322dc8b2 | Caps_1:   
> 0x0000808f
> [  333.034561] mmc2: sdhci: Cmd:       0x0000183a | Max curr: 
> 0x00000000
> [  333.041359] mmc2: sdhci: Resp[0]:   0x00000900 | Resp[1]:  
> 0x00000000
> [  333.048157] mmc2: sdhci: Resp[2]:   0x00000000 | Resp[3]:  
> 0x00000000
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
> [  333.102371] mmc2: sdhci: 
> ============================================
> 
> So, set software timeout value more than hardware timeout value.
> 
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
> 
> Changes since V3:
> 	- Addressed minor comments from Adrain Hunter and retained his
> 	  Acked-by Signed-off.
> 
> Changes since V2:
> 	- Updated 22 with 22LL to avoid compiler warning as
> 	  suggested by Adrian Hunter.
> 	- Added a check to update software data timeout value if its value
> 	  is less than the calculated hardware data timeout value as suggested
> 	  by Veerabhadrarao Badiganti.
> Changes since V1:
> 	- Moved software data timeout update part to qcom specific file
> 	  as suggested by Veerabhadrarao Badiganti.
> ---
>  drivers/mmc/host/sdhci-msm.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c 
> b/drivers/mmc/host/sdhci-msm.c
> index e44b7a6..290a14c 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2089,6 +2089,23 @@ static void sdhci_msm_cqe_disable(struct
> mmc_host *mmc, bool recovery)
>  	sdhci_cqe_disable(mmc, recovery);
>  }
> 
> +static void sdhci_msm_set_timeout(struct sdhci_host *host, struct
> mmc_command *cmd)
> +{
> +	u32 count, start = 15;
> +
> +	__sdhci_set_timeout(host, cmd);
> +	count = sdhci_readb(host, SDHCI_TIMEOUT_CONTROL);
> +	/*
> +	 * Update software timeout value if its value is less than hardware 
> data
> +	 * timeout value. Qcom SoC hardware data timeout value was calculated
> +	 * using 4 * MCLK * 2^(count + 13). where MCLK = 1 / host->clock.
> +	 */
> +	if (cmd && cmd->data && host->clock > 400000 &&
> +	    host->clock <= 50000000 &&
> +	    ((1 << (count + start)) > (10 * host->clock)))
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
