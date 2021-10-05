Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D9F422DF1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 18:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236205AbhJEQah (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 12:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235663AbhJEQag (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 12:30:36 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B56BAC06174E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 09:28:45 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id o27-20020a9d411b000000b0054e0e86020aso3721881ote.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ir6DkdWtmjRNR6ExHYqn+a9vXD19g6DcdlRUrP0OMvg=;
        b=ONn6QNPs1EdFuWCvTz8Hmf7PrNoRGokW6l1k4bZkI0Spf4vEnXdid5QvY4dtHBxxFc
         6a0laioXiu4JPvF73PSkLd0Gc3pBn9YdoRoMeRZppmgUXKsvdwA8Z2g5/B8x9hs+y9el
         ZxXnalq4NyWRAR+1XDWvglot6XOv+Y6zKnvyCR8S5ni1cp2IWnCLfxF13ogiy0WHAx+N
         5bSsn6iD3w8wxmCb5Civi+rYqs5af5Pr3o93YQ8POKLjtb5MIo9nHFBa0wAZGMhyyvth
         6QUE+SAhIprvcIeoH+IEOCXiNPgvWxh2ssdPQYAyeKnaFyx5h7gMALRk6iv0OhkaHWyE
         OUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ir6DkdWtmjRNR6ExHYqn+a9vXD19g6DcdlRUrP0OMvg=;
        b=VfWLa+GwDododks67yDAcsXDGZ6204nkqlA/+oBFRHVNXEci81kB6HUI7tJX0DN3sT
         78byOClPtoBaYekjiGcrrww+Iav1LOln7r5lilcqDfJXwBStkT3J45QNXCD4Duae9xz4
         NpYUoxd3V6JiJ8BVmIj4I4uGB0URu/eoI8+Cc32jq19n4D+Mdm98ZQyTLuf2MXJhBvXg
         I3+PfxllM1o3QYtkHPL2vsjF9P+cHcord0eQBon0R8yRTV4oihZmF16bmvj7MEEgdhVf
         /20KbuAja5g7pr+IRP5SK+lXPq4dzTPbC9W3Dn3jx0IevzovYPN32inGVjiFCxD0nBeG
         lvpA==
X-Gm-Message-State: AOAM530yTcoD6G/Agq3+my0N8gtej3+X/5vegDuDu//9yDwdaoyRwzlT
        6JUR69nYuepkDZic1CYv2sHgzw==
X-Google-Smtp-Source: ABdhPJyh5t8/doL4KAEfiH3jLqBNMr/cf9gc3P+JfSEqM+kh30l+SKol6YsrZKGpEU/NxDA7msHN8w==
X-Received: by 2002:a9d:2f24:: with SMTP id h33mr15746718otb.254.1633451325022;
        Tue, 05 Oct 2021 09:28:45 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id c5sm78939otd.25.2021.10.05.09.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 09:28:44 -0700 (PDT)
Date:   Tue, 5 Oct 2021 09:30:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     clew@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V2 1/1] soc: qcom: smp2p: add feature negotiation and ssr
 ack feature support
Message-ID: <YVx9o3R2SSkNif5k@ripper>
References: <1633450403-21281-1-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633450403-21281-1-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 05 Oct 09:13 PDT 2021, Deepak Kumar Singh wrote:

> From: Chris Lew <clew@codeaurora.org>
> 
> This patch adds feature negotiation and ssr ack feature between
> local host and remote processor. Local host can negotiate on common
> features supported with remote processor.
> 
> When ssr ack feature bit is set, the remote processor will tell local
> host when it is reinitialized. All clients registered for falling edge
> interrupts will be notified when the smp2p entries are cleared for ssr.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/soc/qcom/smp2p.c | 121 +++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 96 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index 38585a7..11b9511 100644
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
> +#define SMP2P_ALL_FEATURES	SMP2P_FEATURE_SSR_ACK
>  
>  /**
>   * struct smp2p_smem_item - in memory communication structure
> @@ -136,6 +139,10 @@ struct qcom_smp2p {
>  
>  	unsigned valid_entries;
>  
> +	bool ssr_ack_enabled;
> +	bool ssr_ack;
> +	bool negotiation_done;
> +
>  	unsigned local_pid;
>  	unsigned remote_pid;
>  
> @@ -163,22 +170,53 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
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
> +
> +	return restart != smp2p->ssr_ack;
> +}
> +
> +static void qcom_smp2p_do_ssr_ack(struct qcom_smp2p *smp2p)
> +{
> +	struct smp2p_smem_item *out = smp2p->out;
> +	u32 val;
> +
> +	smp2p->ssr_ack = !smp2p->ssr_ack;
> +
> +	val = out->flags & ~BIT(SMP2P_FLAGS_RESTART_ACK_BIT);
> +	if (smp2p->ssr_ack)
> +		val |= BIT(SMP2P_FLAGS_RESTART_ACK_BIT);
> +	out->flags = val;
> +
> +	qcom_smp2p_kick(smp2p);
> +}
> +
> +static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
> +{
> +	struct smp2p_smem_item *out = smp2p->out;
> +	struct smp2p_smem_item *in = smp2p->in;
> +
> +	if (in->version == out->version) {
> +		out->features &= in->features;
> +
> +		if (out->features & SMP2P_FEATURE_SSR_ACK)
> +			smp2p->ssr_ack_enabled = true;
> +
> +		smp2p->negotiation_done = true;
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
> @@ -187,18 +225,6 @@ static irqreturn_t qcom_smp2p_intr(int irq, void *data)
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
> @@ -237,7 +263,51 @@ static irqreturn_t qcom_smp2p_intr(int irq, void *data)
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
> +	bool ack_restart;
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
> +	if (!smp2p->negotiation_done)
> +		qcom_smp2p_negotiate(smp2p);
> +
> +	if (smp2p->negotiation_done) {
> +		ack_restart = qcom_smp2p_check_ssr(smp2p);
> +		qcom_smp2p_notify_in(smp2p);
> +
> +		if (ack_restart)
> +			qcom_smp2p_do_ssr_ack(smp2p);
> +	}
>  
> +out:
>  	return IRQ_HANDLED;
>  }
>  
> @@ -393,6 +463,7 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
>  	out->remote_pid = smp2p->remote_pid;
>  	out->total_entries = SMP2P_MAX_ENTRY;
>  	out->valid_entries = 0;
> +	out->features = SMP2P_ALL_FEATURES;
>  
>  	/*
>  	 * Make sure the rest of the header is written before we validate the
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
