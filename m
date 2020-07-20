Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 971CF226B54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 18:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730284AbgGTPnj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 11:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729188AbgGTPni (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 11:43:38 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90191C061794;
        Mon, 20 Jul 2020 08:43:37 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f139so25644644wmf.5;
        Mon, 20 Jul 2020 08:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=autVWWtMkcWJD2mnHeXx5OQfP35st6FKtCjEISqTu28=;
        b=JjmqZtktLvk5Qc3N7R2sS1d6oGjjgW6kfwGPqn1Syigos8hcDhGKPO5zhOGp+p3mdM
         7oFKNkkQZHy4DktD0yhGa/K5vU5uaVMuJjOzPVn+5YIFKs57KtNwbZbuRvelWsEaccIw
         zvfTew212u4gLW5o5Px6DA8QVeHMU1ytQhfyDQrdJkrZXhBXGRmM8Lrx+Vnn29D5nKJA
         NVj5ydC0Wf/yr/gH3kB+6lCRjT5wi6q/7Wfow+gFR8X8oIg1LvNCY9qKphQA1W8OPhZ7
         qbmvTMCpGd6c734qKKg3v1DXdQBwVnv0ndrx1jbr275X5hPbR8dk3/R7fplUPwwA13g9
         iwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=autVWWtMkcWJD2mnHeXx5OQfP35st6FKtCjEISqTu28=;
        b=JZYPmGnfhJTBst3WuOULUS4sxXOO0nLCmEfHsdxrsg8JLyC3pdeGJJPgFCL7gPn8MR
         ntXvSB2AFOV59MDOTw7AJQp8Zzdcmie5OS6FyWEaAyzAXtLTPs+GSHU3WCw036YKaTZp
         WIKlkOKWhxwOggzPJdrjwVPFaKWlXXCpmyz2qEdSC1NXdWtxNfXGJoSOfE9AnFPRVvb8
         OYSwvEZiNhddF8C6wBntEv0lfZEDkk+uG3R31Qp0Out3pHYUi/FeoeubH6z9gOkMUvPN
         TYVg9V70QoyxkbMjeLAPMa00MI39scJ2dhXm0TzcNLpOjTSSMe5hh/0myQhvNzLNTGJ0
         RWWA==
X-Gm-Message-State: AOAM5322DzB+zY9d5mZpblMNXubBuYTB7JtdGsOU4bcdwacSWeBkoR3i
        htTjxX2zhwOiJ60NWk93TnqafshCBag=
X-Google-Smtp-Source: ABdhPJzHR5BO0TIk52hY7BBc/k3XRAgpQOahFxFCGnpt58cP2vReN2cLRt0KiZXlFZBCmuhiMR+Qaw==
X-Received: by 2002:a7b:c857:: with SMTP id c23mr23660652wml.155.1595259815959;
        Mon, 20 Jul 2020 08:43:35 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
        by smtp.gmail.com with ESMTPSA id e5sm16981210wrc.37.2020.07.20.08.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2020 08:43:35 -0700 (PDT)
Subject: Re: [PATCH v7 2/4] mmc: mediatek: refine msdc timeout api
To:     Chun-Hung Wu <chun-hung.wu@mediatek.com>, mirq-linux@rere.qmqm.pl,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Al Cooper <alcooperx@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Pan Bian <bianpan2016@163.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mathieu Malaterre <malat@debian.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Kuohong Wang <kuohong.wang@mediatek.com>
Cc:     kernel-team@android.com, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
 <1595205759-5825-3-git-send-email-chun-hung.wu@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <eb1d5973-55f2-3fb4-bf9c-03b98bd6955b@gmail.com>
Date:   Mon, 20 Jul 2020 17:43:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595205759-5825-3-git-send-email-chun-hung.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20/07/2020 02:42, Chun-Hung Wu wrote:
> Extract msdc timeout api common part to have
> better code architecture and avoid redundant code.
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/mmc/host/mtk-sd.c | 32 ++++++++++++++++++++++----------
>   1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index ed37a3c..347ed72 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -723,21 +723,21 @@ static void msdc_unprepare_data(struct msdc_host *host, struct mmc_request *mrq)
>   	}
>   }
>   
> -/* clock control primitives */
> -static void msdc_set_timeout(struct msdc_host *host, u32 ns, u32 clks)
> +static u64 msdc_timeout_cal(struct msdc_host *host, u64 ns, u64 clks)
>   {
> -	u32 timeout, clk_ns;
> +	u64 timeout, clk_ns;
>   	u32 mode = 0;
>   
> -	host->timeout_ns = ns;
> -	host->timeout_clks = clks;
>   	if (host->mmc->actual_clock == 0) {
>   		timeout = 0;
>   	} else {
> -		clk_ns  = 1000000000UL / host->mmc->actual_clock;
> -		timeout = (ns + clk_ns - 1) / clk_ns + clks;
> +		clk_ns  = 1000000000ULL;
> +		do_div(clk_ns, host->mmc->actual_clock);
> +		timeout = ns + clk_ns - 1;
> +		do_div(timeout, clk_ns);
> +		timeout += clks;
>   		/* in 1048576 sclk cycle unit */
> -		timeout = (timeout + (0x1 << 20) - 1) >> 20;
> +		timeout = DIV_ROUND_UP(timeout, (0x1 << 20));
>   		if (host->dev_comp->clk_div_bits == 8)
>   			sdr_get_field(host->base + MSDC_CFG,
>   				      MSDC_CFG_CKMOD, &mode);
> @@ -747,9 +747,21 @@ static void msdc_set_timeout(struct msdc_host *host, u32 ns, u32 clks)
>   		/*DDR mode will double the clk cycles for data timeout */
>   		timeout = mode >= 2 ? timeout * 2 : timeout;
>   		timeout = timeout > 1 ? timeout - 1 : 0;
> -		timeout = timeout > 255 ? 255 : timeout;
>   	}
> -	sdr_set_field(host->base + SDC_CFG, SDC_CFG_DTOC, timeout);
> +	return timeout;
> +}
> +
> +/* clock control primitives */
> +static void msdc_set_timeout(struct msdc_host *host, u64 ns, u64 clks)
> +{
> +	u64 timeout;
> +
> +	host->timeout_ns = ns;
> +	host->timeout_clks = clks;
> +
> +	timeout = msdc_timeout_cal(host, ns, clks);
> +	sdr_set_field(host->base + SDC_CFG, SDC_CFG_DTOC,
> +		      (u32)(timeout > 255 ? 255 : timeout));
>   }
>   
>   static void msdc_gate_clock(struct msdc_host *host)
> 
