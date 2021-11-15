Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0129C44FDCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 05:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237359AbhKOEGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Nov 2021 23:06:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237364AbhKOEGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Nov 2021 23:06:03 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772FBC061767
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 20:03:08 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id o4so32107255oia.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 20:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hJ/kPFaMFBXC9iFz4oTcvMGtTFuxx7SBObBu2dq6Ghc=;
        b=M0lnck0wNApxatXdEso/4Nac5+gIBFI/iMkhUgGrjbqqxLpVSBIkcId77SyXeiE/0d
         adN13MK1HDUFya5ZmjzNaUDix+By05Ji6WPvJ4GBmr0Tc79X2MJBUMXpe3VrfyoHn+Cd
         hk6CAs8oW91W55yTRvMiZNxpCD1smro2g7PdlIMlBShvxLa1Rsp/XBfLVPap6YhLAf/y
         PIoU3/mz0DrKDWtu8/WeuJT+X2WY/d+V/4HYY1FfmHaeKsOF+c3dvl2dCEEt7Q1AmfOr
         xTwJzf5WRWgDg2+Qr4vZ3HjTAgwyv5hIBuQTXKpAEciaVUQgBP0e8FjdNM+kSJQZGxdr
         +Dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hJ/kPFaMFBXC9iFz4oTcvMGtTFuxx7SBObBu2dq6Ghc=;
        b=wnAq42kuo42MSVIMOf+jdUM7qbCRAsrIk8OQvtZUT+pA49Odsy1HPUAa/CtDd5gsLY
         yRqmCR6pXPzEVphWtISf1fkcOJBVNe3wLvImJoaBUJ8ZjKnEp1vn8WVd4mAPfLeQpm38
         xONa2flwhRCkuktk47k1HYoeubBpoyQXA1c5STn5oPqTZpIq/otLgbsCzVoSAfpQTFCs
         HOW74EVMge4xLteFUDFyZLKzKr4vlZ6i/9xU+Xd5HRqFG0P1m47pAvPlgHRZU5OTOrRo
         +1v4xyV0/nBZeHDItvIBC2rLMYDQJ7gUsg3iKgEEyrPrUVsjcKxCCzF3Bwok83VfHTP9
         JB0Q==
X-Gm-Message-State: AOAM533QUtuKe4oOIXdMn9k/TLOg0shS6CybE90mjAIl3SgOT9dRSB7F
        eoQzrqVU74qfetMopmzgWg35UA==
X-Google-Smtp-Source: ABdhPJw7mqvrKQdnHEWT/5xRFMDSB8QK16xrJ14s3Zo781J5XYJFPP1LaTD5/GLsxZSxjZAULcbYTA==
X-Received: by 2002:aca:2b02:: with SMTP id i2mr28668746oik.140.1636948987351;
        Sun, 14 Nov 2021 20:03:07 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s17sm1047063ooj.42.2021.11.14.20.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 20:03:06 -0800 (PST)
Date:   Sun, 14 Nov 2021 22:03:01 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Huang Yiwei <quic_hyiwei@quicinc.com>
Cc:     agross@kernel.org, mani@kernel.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_psodagud@quicinc.com, quic_tsoni@quicinc.com,
        quic_aiquny@quicinc.com, quic_eberman@quicinc.com
Subject: Re: [PATCH] mailbox: qcom-ipcc: Update the QCOM_IPCC driver
Message-ID: <YZHb9c8HXoV3fE2w@yoga>
References: <20211115031830.6795-1-quic_hyiwei@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115031830.6795-1-quic_hyiwei@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 14 Nov 21:18 CST 2021, Huang Yiwei wrote:

> Update the QCOM_IPCC driver with below main features:
> Dynamic alloc for channel arrangement instead of static alloced
> array.
> Multiple instance can be supported.
> IPCC interrupt wake up support from suspend.
> More protocol and client ID support added.
> 

Whenever you have "this patch changes x, y, z" you should split that up
in multiple patches, each changing one thing in a clean fashion.

So please respin this as 4 patches, to make it possible to review.

Regards,
Bjorn

> Signed-off-by: Huang Yiwei <quic_hyiwei@quicinc.com>
> ---
>  drivers/mailbox/qcom-ipcc.c             | 101 ++++++++++++++++++------
>  include/dt-bindings/mailbox/qcom-ipcc.h |   9 ++-
>  2 files changed, 85 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> index f1d4f4679b17..80bac21ccbc3 100644
> --- a/drivers/mailbox/qcom-ipcc.c
> +++ b/drivers/mailbox/qcom-ipcc.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.
>   */
>  
>  #include <linux/bitfield.h>
> @@ -13,8 +13,6 @@
>  
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  
> -#define IPCC_MBOX_MAX_CHAN		48
> -
>  /* IPCC Register offsets */
>  #define IPCC_REG_SEND_ID		0x0c
>  #define IPCC_REG_RECV_ID		0x10
> @@ -52,9 +50,10 @@ struct qcom_ipcc {
>  	struct device *dev;
>  	void __iomem *base;
>  	struct irq_domain *irq_domain;
> -	struct mbox_chan chan[IPCC_MBOX_MAX_CHAN];
> -	struct qcom_ipcc_chan_info mchan[IPCC_MBOX_MAX_CHAN];
> +	struct mbox_chan *chans;
> +	struct qcom_ipcc_chan_info *mchan;
>  	struct mbox_controller mbox;
> +	int num_chans;
>  	int irq;
>  };
>  
> @@ -166,25 +165,37 @@ static struct mbox_chan *qcom_ipcc_mbox_xlate(struct mbox_controller *mbox,
>  	struct qcom_ipcc *ipcc = to_qcom_ipcc(mbox);
>  	struct qcom_ipcc_chan_info *mchan;
>  	struct mbox_chan *chan;
> -	unsigned int i;
> +	struct device *dev;
> +	int chan_id;
> +
> +	dev = ipcc->dev;
>  
>  	if (ph->args_count != 2)
>  		return ERR_PTR(-EINVAL);
>  
> -	for (i = 0; i < IPCC_MBOX_MAX_CHAN; i++) {
> -		chan = &ipcc->chan[i];
> -		if (!chan->con_priv) {
> -			mchan = &ipcc->mchan[i];
> -			mchan->client_id = ph->args[0];
> -			mchan->signal_id = ph->args[1];
> -			chan->con_priv = mchan;
> -			break;
> -		}
> +	for (chan_id = 0; chan_id < mbox->num_chans; chan_id++) {
> +		chan = &ipcc->chans[chan_id];
> +		mchan = chan->con_priv;
>  
> -		chan = NULL;
> +		if (!mchan)
> +			break;
> +		else if (mchan->client_id == ph->args[0] &&
> +				mchan->signal_id == ph->args[1])
> +			return ERR_PTR(-EBUSY);
>  	}
>  
> -	return chan ?: ERR_PTR(-EBUSY);
> +	if (chan_id >= mbox->num_chans)
> +		return ERR_PTR(-EBUSY);
> +
> +	mchan = devm_kzalloc(dev, sizeof(*mchan), GFP_KERNEL);
> +	if (!mchan)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mchan->client_id = ph->args[0];
> +	mchan->signal_id = ph->args[1];
> +	chan->con_priv = mchan;
> +
> +	return chan;
>  }
>  
>  static const struct mbox_chan_ops ipcc_mbox_chan_ops = {
> @@ -192,15 +203,49 @@ static const struct mbox_chan_ops ipcc_mbox_chan_ops = {
>  	.shutdown = qcom_ipcc_mbox_shutdown,
>  };
>  
> -static int qcom_ipcc_setup_mbox(struct qcom_ipcc *ipcc)
> +static int qcom_ipcc_setup_mbox(struct qcom_ipcc *ipcc,
> +				struct device_node *controller_dn)
>  {
> +	struct of_phandle_args curr_ph;
> +	struct device_node *client_dn;
>  	struct mbox_controller *mbox;
>  	struct device *dev = ipcc->dev;
> +	int i, j, ret;
> +
> +	/*
> +	 * Find out the number of clients interested in this mailbox
> +	 * and create channels accordingly.
> +	 */
> +	ipcc->num_chans = 0;
> +	for_each_node_with_property(client_dn, "mboxes") {
> +		if (!of_device_is_available(client_dn))
> +			continue;
> +		i = of_count_phandle_with_args(client_dn,
> +						"mboxes", "#mbox-cells");
> +		for (j = 0; j < i; j++) {
> +			ret = of_parse_phandle_with_args(client_dn, "mboxes",
> +						"#mbox-cells", j, &curr_ph);
> +			of_node_put(curr_ph.np);
> +			if (!ret && curr_ph.np == controller_dn) {
> +				ipcc->num_chans++;
> +				break;
> +			}
> +		}
> +	}
> +
> +	/* If no clients are found, skip registering as a mbox controller */
> +	if (!ipcc->num_chans)
> +		return 0;
> +
> +	ipcc->chans = devm_kcalloc(dev, ipcc->num_chans,
> +					sizeof(struct mbox_chan), GFP_KERNEL);
> +	if (!ipcc->chans)
> +		return -ENOMEM;
>  
>  	mbox = &ipcc->mbox;
>  	mbox->dev = dev;
> -	mbox->num_chans = IPCC_MBOX_MAX_CHAN;
> -	mbox->chans = ipcc->chan;
> +	mbox->num_chans = ipcc->num_chans;
> +	mbox->chans = ipcc->chans;
>  	mbox->ops = &ipcc_mbox_chan_ops;
>  	mbox->of_xlate = qcom_ipcc_mbox_xlate;
>  	mbox->txdone_irq = false;
> @@ -212,6 +257,8 @@ static int qcom_ipcc_setup_mbox(struct qcom_ipcc *ipcc)
>  static int qcom_ipcc_probe(struct platform_device *pdev)
>  {
>  	struct qcom_ipcc *ipcc;
> +	static int id;
> +	char *name;
>  	int ret;
>  
>  	ipcc = devm_kzalloc(&pdev->dev, sizeof(*ipcc), GFP_KERNEL);
> @@ -228,27 +275,33 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
>  	if (ipcc->irq < 0)
>  		return ipcc->irq;
>  
> +	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "ipcc_%d", id++);
> +	if (!name)
> +		return -ENOMEM;
> +
>  	ipcc->irq_domain = irq_domain_add_tree(pdev->dev.of_node,
>  					       &qcom_ipcc_irq_ops, ipcc);
>  	if (!ipcc->irq_domain)
>  		return -ENOMEM;
>  
> -	ret = qcom_ipcc_setup_mbox(ipcc);
> +	ret = qcom_ipcc_setup_mbox(ipcc, pdev->dev.of_node);
>  	if (ret)
>  		goto err_mbox;
>  
>  	ret = devm_request_irq(&pdev->dev, ipcc->irq, qcom_ipcc_irq_fn,
> -			       IRQF_TRIGGER_HIGH, "ipcc", ipcc);
> +			IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND, name, ipcc);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);
> -		goto err_mbox;
> +		goto err_req_irq;
>  	}
>  
> -	enable_irq_wake(ipcc->irq);
>  	platform_set_drvdata(pdev, ipcc);
>  
>  	return 0;
>  
> +err_req_irq:
> +	if (ipcc->num_chans)
> +		mbox_controller_unregister(&ipcc->mbox);
>  err_mbox:
>  	irq_domain_remove(ipcc->irq_domain);
>  
> diff --git a/include/dt-bindings/mailbox/qcom-ipcc.h b/include/dt-bindings/mailbox/qcom-ipcc.h
> index eb91a6c05b71..fb405e211028 100644
> --- a/include/dt-bindings/mailbox/qcom-ipcc.h
> +++ b/include/dt-bindings/mailbox/qcom-ipcc.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
>  /*
> - * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.
>   */
>  
>  #ifndef __DT_BINDINGS_MAILBOX_IPCC_H
> @@ -8,8 +8,13 @@
>  
>  /* Signal IDs for MPROC protocol */
>  #define IPCC_MPROC_SIGNAL_GLINK_QMP	0
> +#define IPCC_MPROC_SIGNAL_TZ		1
>  #define IPCC_MPROC_SIGNAL_SMP2P		2
>  #define IPCC_MPROC_SIGNAL_PING		3
> +#define IPCC_MPROC_SIGNAL_MAX		4 /* Used by driver only */
> +
> +#define IPCC_COMPUTE_L0_SIGNAL_MAX	32 /* Used by driver only */
> +#define IPCC_COMPUTE_L1_SIGNAL_MAX	32 /* Used by driver only */
>  
>  /* Client IDs */
>  #define IPCC_CLIENT_AOP			0
> @@ -29,6 +34,8 @@
>  #define IPCC_CLIENT_PCIE1		14
>  #define IPCC_CLIENT_PCIE2		15
>  #define IPCC_CLIENT_SPSS		16
> +#define IPCC_CLIENT_TME			23
>  #define IPCC_CLIENT_WPSS		24
> +#define IPCC_CLIENT_MAX			25 /* Used by driver only */
>  
>  #endif
> -- 
> 2.17.1
> 
