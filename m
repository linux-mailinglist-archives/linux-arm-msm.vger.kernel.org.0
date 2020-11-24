Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289062C1A4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 01:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgKXA6m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 19:58:42 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:19199 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726803AbgKXA6m (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 19:58:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606179521; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xGjRNhv80vQjOYumGcWeyL8YJfD6RyaFRbDX2JZur/c=;
 b=Fsek0CNfcKLQydQ3VyCsrzt6LWiGfJM4rsjxxL0OjBA5SBKj3IdrEj5WFBGGwRggCp+WdZo8
 5E/yJZymh64w1pr7G3CzM2jehZoHSbhklv/FehTs0cIWVBQGecFgYXUD/XiUv9UlNFE7sgKr
 oqokmxEQ4XQfJHpcvqopmkRSyZg=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fbc5ab27f0cfa6a16edd2f7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 00:58:26
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7D6FAC43460; Tue, 24 Nov 2020 00:58:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AD415C433C6;
        Tue, 24 Nov 2020 00:58:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 16:58:24 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/8] mhi: pci_generic: Enable burst mode for hardware
 channels
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1606140666-4986-4-git-send-email-loic.poulain@linaro.org>
References: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
 <1606140666-4986-4-git-send-email-loic.poulain@linaro.org>
Message-ID: <8f694ad374ff8db0ee951036c4b3c040@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,
On 2020-11-23 06:11 AM, Loic Poulain wrote:
> Hardware channels have a feature called burst mode that allows to
> queue transfer ring element(s) (TRE) to a channel without ringing
> the device doorbell. In that mode, the device is polling the channel
> context for new elements. This reduces the frequency of host initiated
> doorbells and increase throughput.
> 
> Create a new dedicated macro for hardware channels with burst enabled.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/pci_generic.c | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c 
> b/drivers/bus/mhi/pci_generic.c
> index 09c6b26..0c07cf5 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -78,6 +78,36 @@ struct mhi_pci_dev_info {
>  		.offload_channel = false,	\
>  	}
> 
> +#define MHI_CHANNEL_CONFIG_HW_UL(ch_num, ch_name, el_count, ev_ring) \
> +	{						\
> +		.num = ch_num,				\
> +		.name = ch_name,			\
> +		.num_elements = el_count,		\
> +		.event_ring = ev_ring,			\
> +		.dir = DMA_TO_DEVICE,			\
> +		.ee_mask = BIT(MHI_EE_AMSS),		\
> +		.pollcfg = 0,				\
> +		.doorbell = MHI_DB_BRST_ENABLE,	\
> +		.lpm_notify = false,			\
> +		.offload_channel = false,		\
> +		.doorbell_mode_switch = false,		\
> +	}						\
> +
> +#define MHI_CHANNEL_CONFIG_HW_DL(ch_num, ch_name, el_count, ev_ring) \
> +	{						\
> +		.num = ch_num,				\
> +		.name = ch_name,			\
> +		.num_elements = el_count,		\
> +		.event_ring = ev_ring,			\
> +		.dir = DMA_FROM_DEVICE,			\
> +		.ee_mask = BIT(MHI_EE_AMSS),		\
> +		.pollcfg = 0,				\
> +		.doorbell = MHI_DB_BRST_ENABLE,	\
> +		.lpm_notify = false,			\
> +		.offload_channel = false,		\
> +		.doorbell_mode_switch = false,		\
> +	}
> +
>  #define MHI_EVENT_CONFIG_DATA(ev_ring)		\
>  	{					\
>  		.num_elements = 128,		\
> @@ -112,8 +142,8 @@ static const struct mhi_channel_config
> modem_qcom_v1_mhi_channels[] = {
>  	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
>  	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
>  	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
> -	MHI_CHANNEL_CONFIG_UL(100, "IP_HW0", 128, 1),
> -	MHI_CHANNEL_CONFIG_DL(101, "IP_HW0", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 1),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
>  };
> 
>  static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
Did you somehow miss my email with comments on this macro from the 
previous
submission?

If not, then any reason you want to submit this way for now and change 
it
later when more HW channels are added?

I don't think it's a good idea to have doorbell_mode_switch as false for
channel 100 as we need to ring the DB every time we come out of M3.

The current proposal will become inconsistent when more HW channels with
different requirements are added so my suggestion was to accommodate 
these
now. Also, I realized we need to update the regular macros as well but 
it
can be dealt with separately.

If you would like recommendations or would want to discuss this 
configuration
thing further, please let me know.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
