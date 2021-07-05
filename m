Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE043BBDFE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 16:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhGEOMK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jul 2021 10:12:10 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:22183 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbhGEOMK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jul 2021 10:12:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625494173; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=NQxug9JfbMYViVOi+0BvRxMlkM0wrHN+X/oHYiZU1XM=;
 b=EIPvbf/1bQ/OmvT5mI1c1QF6Y4qqCcsaqiOx45DloYHPOUwmQLefq7ca1KzJzxJpHUf+cyhV
 zUriBf6lAR8pQ5l5OwMHT0kOgR9pnrikbU6Rg6LjAjHAJeKYKGuCEc4w+IZ/bXTmfZPlbD5j
 tvWuXebPkYKJj5N8rGI0VcVJCqk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60e31299f30429861473c681 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Jul 2021 14:09:29
 GMT
Sender: sbhanu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6E350C4323A; Mon,  5 Jul 2021 14:09:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbhanu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 588D8C433F1;
        Mon,  5 Jul 2021 14:09:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 05 Jul 2021 19:39:27 +0530
From:   sbhanu@codeaurora.org
To:     Adrian Hunter <adrian.hunter@intel.com>
Cc:     ulf.hansson@linaro.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, vbadigan@codeaurora.org,
        rampraka@codeaurora.org, sayalil@codeaurora.org,
        sartgarg@codeaurora.org, rnayak@codeaurora.org,
        cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH V2] mmc: sdhci: Update the software timeout value for sdhc
In-Reply-To: <467960e793b39ffd13e8d5c5c3b87057@codeaurora.org>
References: <1624804840-3479-1-git-send-email-sbhanu@codeaurora.org>
 <3217c101-534b-bfcb-7ba9-5749d73cf242@intel.com>
 <467960e793b39ffd13e8d5c5c3b87057@codeaurora.org>
Message-ID: <1d574e4cfc4c793166027d008948a0a5@codeaurora.org>
X-Sender: sbhanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-01 22:28, sbhanu@codeaurora.org wrote:
> On 2021-06-30 19:38, Adrian Hunter wrote:
>> On 27/06/21 5:40 pm, Shaik Sajida Bhanu wrote:
>>> Whenever SDHC run at clock rate 50MHZ or below, the hardware data
>>> timeout value will be 21.47secs, which is approx. 22secs and we have
>>> a current software timeout value as 10secs. We have to set software
>>> timeout value more than the hardware data timeout value to avioid 
>>> seeing
>>> the below register dumps.
>>> 
>>> [  332.953670] mmc2: Timeout waiting for hardware interrupt.
>>> [  332.959608] mmc2: sdhci: ============ SDHCI REGISTER DUMP 
>>> ===========
>>> [  332.966450] mmc2: sdhci: Sys addr:  0x00000000 | Version:  
>>> 0x00007202
>>> [  332.973256] mmc2: sdhci: Blk size:  0x00000200 | Blk cnt:  
>>> 0x00000001
>>> [  332.980054] mmc2: sdhci: Argument:  0x00000000 | Trn mode: 
>>> 0x00000027
>>> [  332.986864] mmc2: sdhci: Present:   0x01f801f6 | Host ctl: 
>>> 0x0000001f
>>> [  332.993671] mmc2: sdhci: Power:     0x00000001 | Blk gap:  
>>> 0x00000000
>>> [  333.000583] mmc2: sdhci: Wake-up:   0x00000000 | Clock:    
>>> 0x00000007
>>> [  333.007386] mmc2: sdhci: Timeout:   0x0000000e | Int stat: 
>>> 0x00000000
>>> [  333.014182] mmc2: sdhci: Int enab:  0x03ff100b | Sig enab: 
>>> 0x03ff100b
>>> [  333.020976] mmc2: sdhci: ACmd stat: 0x00000000 | Slot int: 
>>> 0x00000000
>>> [  333.027771] mmc2: sdhci: Caps:      0x322dc8b2 | Caps_1:   
>>> 0x0000808f
>>> [  333.034561] mmc2: sdhci: Cmd:       0x0000183a | Max curr: 
>>> 0x00000000
>>> [  333.041359] mmc2: sdhci: Resp[0]:   0x00000900 | Resp[1]:  
>>> 0x00000000
>>> [  333.048157] mmc2: sdhci: Resp[2]:   0x00000000 | Resp[3]:  
>>> 0x00000000
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
>>> [  333.102371] mmc2: sdhci: 
>>> ============================================
>>> 
>>> So, set software timeout value more than hardware timeout value.
>>> 
>>> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
>>> ---
>>> 
>>> Changes since V1:
>>> 	- Moved software data timeout update part to qcom specific file as
>>> 	  suggested by Veerabhadrarao Badiganti.
>>> ---
>>>  drivers/mmc/host/sdhci-msm.c | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>> 
>>> diff --git a/drivers/mmc/host/sdhci-msm.c 
>>> b/drivers/mmc/host/sdhci-msm.c
>>> index e44b7a6..58e651e 100644
>>> --- a/drivers/mmc/host/sdhci-msm.c
>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>> @@ -2089,6 +2089,14 @@ static void sdhci_msm_cqe_disable(struct 
>>> mmc_host *mmc, bool recovery)
>>>  	sdhci_cqe_disable(mmc, recovery);
>>>  }
>>> 
>>> +static void sdhci_msm_set_timeout(struct sdhci_host *host, struct 
>>> mmc_command *cmd)
>>> +{
>>> +
>>> +	__sdhci_set_timeout(host, cmd);
>>> +	if (cmd && (cmd->data) && (host->clock > 400000) && (host->clock <= 
>>> 50000000))
>> 
>> There are some redundant parenthesis there and cmd is never NULL i.e. 
>> could be:
>> 
>> 	if (cmd->data && host->clock > 400000 && host->clock <= 50000000)
> Sure
Hi,

We are passing cmd as NULL in sdhci_cqe_enable( ) for eMMC so, i think 
we should check cmd.

Thanks,
Sajida
>> 
>>> +		host->data_timeout = 22 * NSEC_PER_SEC;
>> 
>> That needs to be 22LL to make the compiler warning go away
>> 
> Sure
>>> +}
>>> +
>>>  static const struct cqhci_host_ops sdhci_msm_cqhci_ops = {
>>>  	.enable		= sdhci_msm_cqe_enable,
>>>  	.disable	= sdhci_msm_cqe_disable,
>>> @@ -2438,6 +2446,7 @@ static const struct sdhci_ops sdhci_msm_ops = {
>>>  	.irq	= sdhci_msm_cqe_irq,
>>>  	.dump_vendor_regs = sdhci_msm_dump_vendor_regs,
>>>  	.set_power = sdhci_set_power_noreg,
>>> +	.set_timeout = sdhci_msm_set_timeout,
>>>  };
>>> 
>>>  static const struct sdhci_pltfm_data sdhci_msm_pdata = {
>>> 
