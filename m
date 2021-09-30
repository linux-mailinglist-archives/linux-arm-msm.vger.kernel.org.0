Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08CEE41DDE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 17:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346029AbhI3Pqu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 11:46:50 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:45564 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346042AbhI3Pqq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 11:46:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633016704; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=uGUTYZfYt5gnSnL/YNTvC3u00AGC/+SA5QqjzrPCBbg=; b=WtyCcmEadlxzpJWm+8WsMgV5TPpBQI1GKpHFgHZdpsHgmRfATRSvx/JVRlYpgLBQpPvVTJKa
 lwMWcb4yRcI/pOenkIh4MxgSIXeXkoCzG2LMgMtkUenROkFxaeU1nS2aOCCVsfm9hzWa1PNZ
 FJ98fJzm7tx7bJ+NQDcfqex+Mbo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6155db72713d5d6f9605bf0a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 30 Sep 2021 15:44:50
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 27C1DC43616; Thu, 30 Sep 2021 15:44:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.3] (unknown [122.163.140.115])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C0C4C43460;
        Thu, 30 Sep 2021 15:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3C0C4C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 1/1] soc: qcom: smp2p: add feature negotiation and ssr ack
 feature support
To:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        clew@codeaurora.org, mathieu.poirier@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
References: <1633015924-881-1-git-send-email-deesin@codeaurora.org>
 <1633015924-881-3-git-send-email-deesin@codeaurora.org>
From:   Deepak Kumar Singh <deesin@codeaurora.org>
Message-ID: <c9dd7bc4-a1a6-b6c4-874c-8eebdd206196@codeaurora.org>
Date:   Thu, 30 Sep 2021 21:14:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1633015924-881-3-git-send-email-deesin@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Please ignore this patch. This is inadvertently uploaded.

Thanks,

Deepak

On 9/30/2021 9:02 PM, Deepak Kumar Singh wrote:
> This patch adds feature negotiation and ssr ack feature between
> local and remote host. Local host can negotiate on common features
> supported with remote host.
> ---
>   drivers/soc/qcom/smp2p.c | 151 ++++++++++++++++++++++++++++++++---------------
>   1 file changed, 104 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index 38585a7..1c6ad1c 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -14,7 +14,6 @@
>   #include <linux/mfd/syscon.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> -#include <linux/pm_wakeirq.h>
>   #include <linux/regmap.h>
>   #include <linux/soc/qcom/smem.h>
>   #include <linux/soc/qcom/smem_state.h>
> @@ -41,8 +40,11 @@
>   #define SMP2P_MAX_ENTRY_NAME 16
>   
>   #define SMP2P_FEATURE_SSR_ACK 0x1
> +#define SMP2P_FLAGS_RESTART_DONE_BIT 0
> +#define SMP2P_FLAGS_RESTART_ACK_BIT 1
>   
>   #define SMP2P_MAGIC 0x504d5324
> +#define SMP2P_FEATURES	SMP2P_FEATURE_SSR_ACK
>   
>   /**
>    * struct smp2p_smem_item - in memory communication structure
> @@ -113,7 +115,6 @@ struct smp2p_entry {
>    * struct qcom_smp2p - device driver context
>    * @dev:	device driver handle
>    * @in:		pointer to the inbound smem item
> - * @out:	pointer to the outbound smem item
>    * @smem_items:	ids of the two smem items
>    * @valid_entries: already scanned inbound entries
>    * @local_pid:	processor id of the inbound edge
> @@ -136,6 +137,10 @@ struct qcom_smp2p {
>   
>   	unsigned valid_entries;
>   
> +	bool ssr_ack_enabled;
> +	bool ssr_ack;
> +	bool open;
> +
>   	unsigned local_pid;
>   	unsigned remote_pid;
>   
> @@ -163,22 +168,59 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
>   	}
>   }
>   
> -/**
> - * qcom_smp2p_intr() - interrupt handler for incoming notifications
> - * @irq:	unused
> - * @data:	smp2p driver context
> - *
> - * Handle notifications from the remote side to handle newly allocated entries
> - * or any changes to the state bits of existing entries.
> - */
> -static irqreturn_t qcom_smp2p_intr(int irq, void *data)
> +static bool qcom_smp2p_check_ssr(struct qcom_smp2p *smp2p)
> +{
> +	struct smp2p_smem_item *in = smp2p->in;
> +	bool restart;
> +
> +	if (!smp2p->ssr_ack_enabled)
> +		return false;
> +
> +	restart = in->flags & BIT(SMP2P_FLAGS_RESTART_DONE_BIT);
> +	if (restart == smp2p->ssr_ack)
> +		return false;
> +
> +	return true;
> +}
> +
> +static void qcom_smp2p_do_ssr_ack(struct qcom_smp2p *smp2p)
> +{
> +	struct smp2p_smem_item *out = smp2p->out;
> +	u32 ack;
> +	u32 val;
> +
> +	ack = !smp2p->ssr_ack;
> +	smp2p->ssr_ack = ack;
> +	ack = ack << SMP2P_FLAGS_RESTART_ACK_BIT;
> +
> +	val = out->flags & ~BIT(SMP2P_FLAGS_RESTART_ACK_BIT);
> +	val |= ack;
> +	out->flags = val;
> +
> +	qcom_smp2p_kick(smp2p);
> +}
> +
> +static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
> +{
> +	struct smp2p_smem_item *out = smp2p->out;
> +	struct smp2p_smem_item *in = smp2p->in;
> +	u32 features;
> +
> +	if (in->version == out->version) {
> +		features = in->features & out->features;
> +		out->features = features;
> +
> +		if (features & SMP2P_FEATURE_SSR_ACK)
> +			smp2p->ssr_ack_enabled = true;
> +
> +		smp2p->open = true;
> +	}
> +}
> +
> +static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
>   {
>   	struct smp2p_smem_item *in;
>   	struct smp2p_entry *entry;
> -	struct qcom_smp2p *smp2p = data;
> -	unsigned smem_id = smp2p->smem_items[SMP2P_INBOUND];
> -	unsigned pid = smp2p->remote_pid;
> -	size_t size;
>   	int irq_pin;
>   	u32 status;
>   	char buf[SMP2P_MAX_ENTRY_NAME];
> @@ -187,18 +229,6 @@ static irqreturn_t qcom_smp2p_intr(int irq, void *data)
>   
>   	in = smp2p->in;
>   
> -	/* Acquire smem item, if not already found */
> -	if (!in) {
> -		in = qcom_smem_get(pid, smem_id, &size);
> -		if (IS_ERR(in)) {
> -			dev_err(smp2p->dev,
> -				"Unable to acquire remote smp2p item\n");
> -			return IRQ_HANDLED;
> -		}
> -
> -		smp2p->in = in;
> -	}
> -
>   	/* Match newly created entries */
>   	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
>   		list_for_each_entry(entry, &smp2p->inbound, node) {
> @@ -210,7 +240,7 @@ static irqreturn_t qcom_smp2p_intr(int irq, void *data)
>   		}
>   	}
>   	smp2p->valid_entries = i;
> -
> +	
>   	/* Fire interrupts based on any value changes */
>   	list_for_each_entry(entry, &smp2p->inbound, node) {
>   		/* Ignore entries not yet allocated by the remote side */
> @@ -237,7 +267,52 @@ static irqreturn_t qcom_smp2p_intr(int irq, void *data)
>   			}
>   		}
>   	}
> +}
> +
> +/**
> + * qcom_smp2p_intr() - interrupt handler for incoming notifications
> + * @irq:	unused
> + * @data:	smp2p driver context
> + *
> + * Handle notifications from the remote side to handle newly allocated entries
> + * or any changes to the state bits of existing entries.
> + */
> +static irqreturn_t qcom_smp2p_intr(int irq, void *data)
> +{
> +	struct smp2p_smem_item *in;
> +	struct qcom_smp2p *smp2p = data;
> +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
> +	unsigned int pid = smp2p->remote_pid;
> +	size_t size;
>   
> +	in = smp2p->in;
> +
> +	/* Acquire smem item, if not already found */
> +	if (!in) {
> +		in = qcom_smem_get(pid, smem_id, &size);
> +		if (IS_ERR(in)) {
> +			dev_err(smp2p->dev,
> +				"Unable to acquire remote smp2p item\n");
> +			goto out;
> +		}
> +
> +		smp2p->in = in;
> +	}
> +
> +	if (!smp2p->open)
> +		qcom_smp2p_negotiate(smp2p);
> +
> +	if (smp2p->open) {
> +		bool do_restart;
> +
> +		do_restart = qcom_smp2p_check_ssr(smp2p);
> +		qcom_smp2p_notify_in(smp2p);
> +
> +		if (do_restart)
> +			qcom_smp2p_do_ssr_ack(smp2p);
> +	}
> +
> +out:
>   	return IRQ_HANDLED;
>   }
>   
> @@ -393,6 +468,7 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
>   	out->remote_pid = smp2p->remote_pid;
>   	out->total_entries = SMP2P_MAX_ENTRY;
>   	out->valid_entries = 0;
> +	out->features = SMP2P_FEATURES;
>   
>   	/*
>   	 * Make sure the rest of the header is written before we validate the
> @@ -539,26 +615,9 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>   		goto unwind_interfaces;
>   	}
>   
> -	/*
> -	 * Treat smp2p interrupt as wakeup source, but keep it disabled
> -	 * by default. User space can decide enabling it depending on its
> -	 * use cases. For example if remoteproc crashes and device wants
> -	 * to handle it immediatedly (e.g. to not miss phone calls) it can
> -	 * enable wakeup source from user space, while other devices which
> -	 * do not have proper autosleep feature may want to handle it with
> -	 * other wakeup events (e.g. Power button) instead waking up immediately.
> -	 */
> -	device_set_wakeup_capable(&pdev->dev, true);
> -
> -	ret = dev_pm_set_wake_irq(&pdev->dev, irq);
> -	if (ret)
> -		goto set_wake_irq_fail;
>   
>   	return 0;
>   
> -set_wake_irq_fail:
> -	dev_pm_clear_wake_irq(&pdev->dev);
> -
>   unwind_interfaces:
>   	list_for_each_entry(entry, &smp2p->inbound, node)
>   		irq_domain_remove(entry->domain);
> @@ -583,8 +642,6 @@ static int qcom_smp2p_remove(struct platform_device *pdev)
>   	struct qcom_smp2p *smp2p = platform_get_drvdata(pdev);
>   	struct smp2p_entry *entry;
>   
> -	dev_pm_clear_wake_irq(&pdev->dev);
> -
>   	list_for_each_entry(entry, &smp2p->inbound, node)
>   		irq_domain_remove(entry->domain);
>   
