Return-Path: <linux-arm-msm+bounces-4228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C6080CBF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 14:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59D811C20754
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 13:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122EE47A6D;
	Mon, 11 Dec 2023 13:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Za08vkgj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBB844A5;
	Mon, 11 Dec 2023 05:55:36 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50be03cc8a3so5816450e87.1;
        Mon, 11 Dec 2023 05:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702302934; x=1702907734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/C7XRUm9qYzlb99kHURD4mz8PnbMXnLMuSDz0HuUZU=;
        b=Za08vkgjwEDpY3n1lzAMkKtEm6e/7DRsL0F7rQxtdRyosVer4DkUD0yIHYECbb10t/
         NCkqXDhi5gvPUzFjdqSodzdWEFQul4vtfGu2jQED05KSmfkl9RvTWghPULIrvzGawm4s
         qUyRkt8xct7JiArFOa8RF8pdEZr9SWXETzJ2ECTrUCJiJ3W+Nsg2+V+ipppH0Va9gV9R
         VgGIwsT0rp/dO+Vo2wt9wkiH0SMH1g0NtaAUq70bPdYh/4GWlCvcNk8/y/3BunHlT0Z+
         jeQJB6IaqmC3ByiGKkgSIPmsqEXDCftcTK2fraP9NqTr9OcCvEEb+D5A3VkNMaDgRH6A
         YHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702302934; x=1702907734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/C7XRUm9qYzlb99kHURD4mz8PnbMXnLMuSDz0HuUZU=;
        b=ScL66YoZIK4Qg8RCdfG9ZCnei+tVs+uWU3HwvRas/lW1+dUuqPSRYt90OG0MZP/i9i
         eaWiRm+/NGwQ3EB7TacEi+1KHSlPzqNUq2nuZFH9PPlcqnr31t/f+AchyuN7umdrnwHM
         dcw4NRKdZ/CRapxVQ9U3pTw3UiQeH1yiIyvp8VYj3o6njfKkMxIWLhsCGMuzp3tFpYyR
         2zduejizX14J1wsM+GtPA6wKjCoWzy5EvGPM5HT4vI4KWGB5PA1q1YScS4jaUmw7bU74
         jo0e+fInV3k8gq9CVooi7PisBUrLl1qtxMfHwym+1fuEzNCCQHR7qWwDpXS57JD6/OrG
         6OWg==
X-Gm-Message-State: AOJu0YxSYP9KvFZEQHFEXWayz16Gto0v7+CnrgHcuacs8pb0UtdFb69O
	OCx63vrT3G/NPd6py1XHOyg=
X-Google-Smtp-Source: AGHT+IGknyyl6hqy37057FSHne2s8bshLzwd0cwoLKxfp2llKbxhKDspkZNjGsBlV5gxqynEerQROA==
X-Received: by 2002:a19:4319:0:b0:50b:f147:faf7 with SMTP id q25-20020a194319000000b0050bf147faf7mr1602044lfa.66.1702302933389;
        Mon, 11 Dec 2023 05:55:33 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id u10-20020a056512128a00b0050bbb90533bsm1094171lfs.186.2023.12.11.05.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 05:55:32 -0800 (PST)
Date: Mon, 11 Dec 2023 16:55:29 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Prasad Sodagudi <psodagud@quicinc.com>, 
	Andrew Halaney <ahalaney@redhat.com>, Rob Herring <robh@kernel.org>, kernel@quicinc.com
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add driver support for
 DWMAC5 safety IRQ support
Message-ID: <fa362vwmgtfs2iofwteuk3mwh22eu7nds4dh2rw3cax5edh4kp@gf3bhl526yla>
References: <20231211080153.3005122-1-quic_jsuraj@quicinc.com>
 <20231211080153.3005122-4-quic_jsuraj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211080153.3005122-4-quic_jsuraj@quicinc.com>

Hi Suraj

> [PATCH net-next v5 3/3] net: stmmac: Add driver support for DWMAC5 safety IRQ support
On Mon, Dec 11, 2023 at 01:31:53PM +0530, Suraj Jaiswal wrote:
> Add IRQ support to listen HW safety IRQ like ECC(error
> correction code), DPP(data path parity), FSM(finite state
> machine) fault and print the fault information in the kernel
> log.

I guess the subject and the patch log are a bit misleading. Safety
IRQs have been supported by the kernel since commit 8bf993a5877e
("net: stmmac: Add support for DWMAC5 and implement Safety Features").
Meanwhile based on the patch body what you are doing here is adding
the common safety IRQ line support. Please fix it.

> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h   |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  2 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_platform.c  |  9 +++++++++
>  4 files changed, 30 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 721c1f8e892f..cb9645fe16d8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -347,6 +347,7 @@ enum request_irq_err {

>  	REQ_IRQ_ERR_SFTY_UE,
>  	REQ_IRQ_ERR_SFTY_CE,
>  	REQ_IRQ_ERR_LPI,
> +	REQ_IRQ_ERR_SAFETY,

1. For the sake of unification please use the REQ_IRQ_ERR_SFTY id
instead, since the individual UE and CE IRQs have already been defined
that way.

2. For readability please group up the IRQs of the same type. Like
this:
+	REQ_IRQ_ERR_SFTY,
  	REQ_IRQ_ERR_SFTY_UE,
 	REQ_IRQ_ERR_SFTY_CE,
* Note it would be also better to have the common IRQ ID being defined
* above the individual ones.

>  	REQ_IRQ_ERR_WOL,
>  	REQ_IRQ_ERR_MAC,
>  	REQ_IRQ_ERR_NO,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 9f89acf31050..aa2eda6fb927 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -33,6 +33,7 @@ struct stmmac_resources {
>  	int irq;
>  	int sfty_ce_irq;
>  	int sfty_ue_irq;

> +	int safety_common_irq;

ditto:

+	int sfty_irq;
 	int sfty_ce_irq;
 	int sfty_ue_irq;

Note there is no need in the "common" word in the name, just sfty_irq
is enough to infer that it's a common IRQ number.

>  	int rx_irq[MTL_MAX_RX_QUEUES];
>  	int tx_irq[MTL_MAX_TX_QUEUES];
>  };
> @@ -299,6 +300,7 @@ struct stmmac_priv {
>  	unsigned long active_vlans[BITS_TO_LONGS(VLAN_N_VID)];

>  	int sfty_ce_irq;
>  	int sfty_ue_irq;
> +	int safety_common_irq;

ditto:
+	int sfty_irq;
 	int sfty_ce_irq;
 	int sfty_ue_irq;

>  	int rx_irq[MTL_MAX_RX_QUEUES];
>  	int tx_irq[MTL_MAX_TX_QUEUES];
>  	/*irq name */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 47de466e432c..e4a0d9ec8b3f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3592,6 +3592,10 @@ static void stmmac_free_irq(struct net_device *dev,
>  		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
>  			free_irq(priv->wol_irq, dev);
>  		fallthrough;

> +	case REQ_IRQ_ERR_SAFETY:
> +		if (priv->safety_common_irq > 0 && priv->safety_common_irq != dev->irq)
> +			free_irq(priv->safety_common_irq, dev);

s/SAFETY/SFTY
s/common_//
s/safety/sfty

> +		fallthrough;
>  	case REQ_IRQ_ERR_WOL:
>  		free_irq(dev->irq, dev);
>  		fallthrough;
> @@ -3798,6 +3802,18 @@ static int stmmac_request_irq_single(struct net_device *dev)
>  		}
>  	}
>  

> +	if (priv->safety_common_irq > 0 && priv->safety_common_irq != dev->irq) {

s/common_//
s/safety/sfty

> +		ret = request_irq(priv->safety_common_irq, stmmac_safety_interrupt,

s/safety_common_irq/sfty_irq

> +				  0, "safety", dev);

The rest of the IRQ names are determined as:

		int_name = priv->int_name_sfty;
		sprintf(int_name, "%s:%s", dev->name, "safety");
		ret = request_irq(priv->sfty_irq,
				  stmmac_safety_interrupt,
				  0, int_name, dev);

For maintainability it would be better to keep the code unified and
have the same pattern implemented here too.

> +		if (unlikely(ret < 0)) {
> +			netdev_err(priv->dev,
> +				   "%s: alloc safety failed %d (error: %d)\n",

> +				   __func__, priv->safety_common_irq, ret);
> +			irq_err = REQ_IRQ_ERR_SAFETY;

s/common_//
s/safety/sfty
s/SAFETY/SFTY

> +			goto irq_error;
> +		}
> +	}
> +
>  	return 0;
>  
>  irq_error:
> @@ -7464,6 +7480,8 @@ int stmmac_dvr_probe(struct device *device,
>  	priv->lpi_irq = res->lpi_irq;
>  	priv->sfty_ce_irq = res->sfty_ce_irq;
>  	priv->sfty_ue_irq = res->sfty_ue_irq;

> +	priv->safety_common_irq = res->safety_common_irq;
> +

s/common_//
s/safety/sfty

>  	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
>  		priv->rx_irq[i] = res->rx_irq[i];
>  	for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 1ffde555da47..41a4a253d75b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -726,6 +726,15 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
>  	}
>  

> +	stmmac_res->safety_common_irq =
> +		platform_get_irq_byname_optional(pdev, "safety");

Please define the IRQ resource name as "sfty" to be looking as the
individual safety IRQ names.

> +
> +	if (stmmac_res->safety_common_irq < 0) {
> +		if (stmmac_res->safety_common_irq == -EPROBE_DEFER)

s/common_//
s/safety/sfty

-Serge(y)

> +			return -EPROBE_DEFER;
> +		dev_info(&pdev->dev, "IRQ safety IRQ not found\n");
> +	}
> +
>  	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
>  
>  	return PTR_ERR_OR_ZERO(stmmac_res->addr);
> -- 
> 2.25.1
> 
> 

