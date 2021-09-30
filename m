Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9A0C41E02C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 19:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352677AbhI3R3H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 13:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352671AbhI3R3G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 13:29:06 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5376C06176D
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 10:27:23 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so8290772otb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 10:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z0so+JpsMJmiwyWtbeW90mFJLYHMDOO/l6yFYEdQKko=;
        b=iW4lCl11Mi4Ci5B0nPgW66wXSJ3oFJsldUJwON53VvaTEvskQ0xywG9m6GzDqKnYJK
         vVXIeGN2yD6fEVa2qXKf2aAJ8C4Z2OLMo4JL7/RslUIES1SMNA3RZtRRLSywxhG/UW/q
         3iZED9J0w4UB54aRlDTkQRFq30s5gjOWZopxSTvJm2SIiHwQnFWdcZPGHqATy2vquJ3w
         kH78TZJEGZJH9ylkyvpSFPmvf9RnchizGC5DaxbUXHbPgHGYpaG7vmA8Z/p04i4hZeuP
         kbzwdi4u5y6ZScxYAJFChGhHd821q9H6MgWjyYUgC9Q8x84hXAyCE3O5NcReag4g3rYe
         HJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z0so+JpsMJmiwyWtbeW90mFJLYHMDOO/l6yFYEdQKko=;
        b=Y8X2O6KLVJHasVTCmnD+dwBfDJj+6xFNkwbI120EUkzhVHlMcvi8QIAriH7f8DH7Ii
         txDH5siIIpeuAN8sMXSUNRTs5jwOzRBXj78Vs727h0upJrisF3224r+cdPg0fzBHXsGQ
         8bwitw4RL2dgrIL5hxaEPI2ohc6N8ZzS7iZIRCTkg0pe+A3d7Hq/mm97czI02ttwOdf0
         VePB3vORQ2OQtvYGWQHR42rwyUYsHggrP0DoiHPM+Say7o3lcDs6oxc9OOXoCVB6+bC0
         s1r5CuL082a/ZpvAn/mI4IqsKhsC9Z2MnZzzosSbfsro22a3smUWTOr43cV6M87Ma/4v
         NnEg==
X-Gm-Message-State: AOAM530Eaxsnd4FsEWUeZKi8V2UxldNRVQ67rZFJXCoFf85c1yJQx+gj
        fVdD8Op+r5p+UF/PJ39J5vqYYA==
X-Google-Smtp-Source: ABdhPJwSU3M+Xbhrp3j+ZjQM+GRN/gcA3Mg0AQ+a0cVqJja6qTMcgUzhFJH7Voq5lUYa0AWdtNng9g==
X-Received: by 2002:a05:6830:1da6:: with SMTP id z6mr6450386oti.234.1633022842874;
        Thu, 30 Sep 2021 10:27:22 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p2sm700562ooe.34.2021.09.30.10.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 10:27:22 -0700 (PDT)
Date:   Thu, 30 Sep 2021 10:29:11 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     clew@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V1 1/1] soc: qcom: smp2p: add feature negotiation and ssr
 ack feature support
Message-ID: <YVXz54+pZfC+hGFI@ripper>
References: <1633019111-9318-1-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633019111-9318-1-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 30 Sep 09:25 PDT 2021, Deepak Kumar Singh wrote:

> This patch adds feature negotiation and ssr ack feature between
> local and remote host. Local host can negotiate on common features
> supported with remote host.
> 

This states that you're negotiating features, but doesn't capture the
actual ssr ack; why it's there and how it works.

> Signed-off-by: Chris Lew <clew@codeaurora.org>

Author of the patch should be Chris, please commit with --author
"Chris.."

> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/soc/qcom/smp2p.c | 128 ++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 103 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index 38585a7..c1a60016 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -41,8 +41,11 @@
>  #define SMP2P_MAX_ENTRY_NAME 16
>  
>  #define SMP2P_FEATURE_SSR_ACK 0x1
> +#define SMP2P_FLAGS_RESTART_DONE_BIT 0
> +#define SMP2P_FLAGS_RESTART_ACK_BIT 1
>  
>  #define SMP2P_MAGIC 0x504d5324
> +#define SMP2P_FEATURES	SMP2P_FEATURE_SSR_ACK

Rename this SMP2P_ALL_FEATURES?

>  
>  /**
>   * struct smp2p_smem_item - in memory communication structure
> @@ -136,6 +139,10 @@ struct qcom_smp2p {
>  
>  	unsigned valid_entries;
>  
> +	bool ssr_ack_enabled;
> +	bool ssr_ack;
> +	bool open;

How about renaming this "negotiation_done"?

> +
>  	unsigned local_pid;
>  	unsigned remote_pid;
>  
> @@ -163,22 +170,59 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
>  	}
>  }
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

	return restart != smp2p->ssr_ack;

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

I think this would be cleaner as:

	smp2p->ssr_ack = !smp2p->ssr_ack;

	val = out->flags & ~BIT(SMP2P_FLAGS_RESTART_ACK_BIT);
	if (smp2p->ssr_ack)
		val |= BIT(SMP2P_FLAGS_RESTART_ACK_BIT);
	out->flags = val;

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

		out->features &= in->features;
> +
> +		if (features & SMP2P_FEATURE_SSR_ACK)

		if (out->features & SMP2P_FEATURE_SSR_ACK)

> +			smp2p->ssr_ack_enabled = true;
> +
> +		smp2p->open = true;
> +	}
> +}
> +
> +static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
>  {
>  	struct smp2p_smem_item *in;
>  	struct smp2p_entry *entry;
> -	struct qcom_smp2p *smp2p = data;
> -	unsigned smem_id = smp2p->smem_items[SMP2P_INBOUND];
> -	unsigned pid = smp2p->remote_pid;
> -	size_t size;
>  	int irq_pin;
>  	u32 status;
>  	char buf[SMP2P_MAX_ENTRY_NAME];
> @@ -187,18 +231,6 @@ static irqreturn_t qcom_smp2p_intr(int irq, void *data)
>  
>  	in = smp2p->in;
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
>  	/* Match newly created entries */
>  	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
>  		list_for_each_entry(entry, &smp2p->inbound, node) {
> @@ -237,7 +269,52 @@ static irqreturn_t qcom_smp2p_intr(int irq, void *data)
>  			}
>  		}
>  	}
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
> +
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

How about "ack_restart" or "need_ack"?

While valid, can you please move the declaration to the top of the
function, to follow the style.

Regards,
Bjorn

> +
> +		do_restart = qcom_smp2p_check_ssr(smp2p);
> +		qcom_smp2p_notify_in(smp2p);
> +
> +		if (do_restart)
> +			qcom_smp2p_do_ssr_ack(smp2p);
> +	}
>  
> +out:
>  	return IRQ_HANDLED;
>  }
>  
> @@ -393,6 +470,7 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
>  	out->remote_pid = smp2p->remote_pid;
>  	out->total_entries = SMP2P_MAX_ENTRY;
>  	out->valid_entries = 0;
> +	out->features = SMP2P_FEATURES;
>  
>  	/*
>  	 * Make sure the rest of the header is written before we validate the
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
