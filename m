Return-Path: <linux-arm-msm+bounces-1688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 324E87F5E6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 12:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E26A8281C53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 11:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21278241ED;
	Thu, 23 Nov 2023 11:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VTEy762o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F1A91A5
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 03:55:43 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-507973f3b65so1063540e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 03:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700740541; x=1701345341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rEhXyXecSsXMQIg/YxUPDQVBwLqafKsHNHP/Yqj+n9A=;
        b=VTEy762owftzuyIGOvZXtYoFv1DEzFUGmSh1NycxhyQftzetC8RjjIsinMGLEVvpAF
         X2Zo9xZvFJAfL+AziMU8UT04owj6tF0Q/5cp3Oo+X6S+agRlclo8SDrsEbEunaK90aKF
         khbUOdh77V+YfcDIyaHHjcWwrXJZ3yeHIyFe6W6wOMuOoKVXdzB8QG1BYRiB6wqykdls
         e4s9s8JwfJ+aBUkcV4CeRZfcuAYSFnYPZgUURJVWfGAd51oORLFHVFiY6EyjIlFoXxp9
         Jtr54zcWjWGUl8EBYxsIMS9xJOQnboNJgO25WJ1NCHmnvCix+62rva+yZHuzArIvkRAZ
         n+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700740541; x=1701345341;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEhXyXecSsXMQIg/YxUPDQVBwLqafKsHNHP/Yqj+n9A=;
        b=BdqGmVB9D9LolTUbHuK6aVCvXBSTRVY6KNj7pxIe7F/wCNF5tgR2zBZvbVSjxT5pq8
         AtQ/LnQ6nJetM6AJZrcTr6qSRZlU05WIpUVGfdu5rUzVgMiCimcMxyAq4Xs2kFF6ebD2
         QOBvUtbM+ecihsCO9PbU6nPyDfJwz2Bw0VdLxNuTpspXmU0uVPTYTJxz767+TMZxjWhh
         fkotM+pPZWZjcvLW8kR78kIxLnhyhIiB8tfAan/x2O5g6LAheDplH2Dj0j7vfeMxGBax
         GtlEbkSK2qXBKZVvUqD8AhJI1JN3mD0Y2VMlMixBsmMCLXIRsTRyX+BIk4Zz6YeOQb0P
         +wWw==
X-Gm-Message-State: AOJu0YzvafrmZKw/qUHam9R+Hu/ClvogULe5KNBHBldlliA+CljQqvoV
	ULlvc3mQTqifvv9cqUQR0/AHSw==
X-Google-Smtp-Source: AGHT+IEQmg9QqvwxWaq3S4vi5vqQ2B4nJxRaKyvDHdI7fGHr0Y0QeQwLVtigFPh+zv9FMG5fnt/9Fw==
X-Received: by 2002:a19:740f:0:b0:500:9f7b:e6a4 with SMTP id v15-20020a19740f000000b005009f7be6a4mr3036004lfe.32.1700740541278;
        Thu, 23 Nov 2023 03:55:41 -0800 (PST)
Received: from [172.30.204.221] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k41-20020a0565123da900b0050aaa64ed60sm170104lfv.54.2023.11.23.03.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 03:55:40 -0800 (PST)
Message-ID: <1e02f4f8-ebd3-4f57-98a9-48d7e08c0ad4@linaro.org>
Date: Thu, 23 Nov 2023 12:55:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: Add driver support for
 DWMAC5 fault IRQ Support
Content-Language: en-US
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>
Cc: kernel@quicinc.com
References: <cover.1700737841.git.quic_jsuraj@quicinc.com>
 <62eaaace3713751cb1ecac3163e857737107ca0e.1700737841.git.quic_jsuraj@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <62eaaace3713751cb1ecac3163e857737107ca0e.1700737841.git.quic_jsuraj@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/23/23 12:38, Suraj Jaiswal wrote:
> Add IRQ support to listen HW fault like ECC,DPP,FSM
> fault and print the fault information in the kernel
> log.
> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 ++
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c | 18 +++++++++++++++++
>   .../ethernet/stmicro/stmmac/stmmac_platform.c | 20 +++++++++++++++++++
>   4 files changed, 41 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 6b935922054d..c4821c7ab674 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -347,6 +347,7 @@ enum request_irq_err {
>   	REQ_IRQ_ERR_SFTY_UE,
>   	REQ_IRQ_ERR_SFTY_CE,
>   	REQ_IRQ_ERR_LPI,
> +	REQ_IRQ_ERR_SAFETY,
>   	REQ_IRQ_ERR_WOL,
>   	REQ_IRQ_ERR_MAC,
>   	REQ_IRQ_ERR_NO,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index cd7a9768de5f..8893d4b7fa38 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -33,6 +33,7 @@ struct stmmac_resources {
>   	int irq;
>   	int sfty_ce_irq;
>   	int sfty_ue_irq;
> +	int safety_common_intr;
>   	int rx_irq[MTL_MAX_RX_QUEUES];
>   	int tx_irq[MTL_MAX_TX_QUEUES];
>   };
> @@ -331,6 +332,7 @@ struct stmmac_priv {
>   	/* XDP BPF Program */
>   	unsigned long *af_xdp_zc_qps;
>   	struct bpf_prog *xdp_prog;
> +	int safety_common_intr;
other interrupts use _irq yet you seem to use _intr, plus the
aforementioned "safety" vs "fault" naming

[...]

>   
> +int stmmac_get_fault_intr_config(struct platform_device *pdev, struct stmmac_resources *res)
> +{
> +	int ret = 0;
get rid of ret and return directly

> +
> +	res->safety_common_intr = platform_get_irq_byname(pdev, "safety");
> +
stray newline?

> +	if (res->safety_common_intr < 0) {
> +		if (res->safety_common_intr != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "safety IRQ configuration information not found\n");
> +		ret = 1;
> +	}
> +
> +	return ret;
> +}
> +
>   int stmmac_get_platform_resources(struct platform_device *pdev,
>   				  struct stmmac_resources *stmmac_res)
>   {
> +	int ret = 0;
Missing newline between declarations and code
Unnecessary initialization

>   	memset(stmmac_res, 0, sizeof(*stmmac_res));
>   
>   	/* Get IRQ information early to have an ability to ask for deferred
> @@ -702,6 +718,10 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>   	if (stmmac_res->irq < 0)
>   		return stmmac_res->irq;
>   
> +	ret = stmmac_get_fault_intr_config(pdev, stmmac_res);
> +	if (ret)
> +		dev_err(&pdev->dev, "Fault interrupt not present\n");
Since you're getting the return value, perhaps the errno should
be propagated

Konrad

