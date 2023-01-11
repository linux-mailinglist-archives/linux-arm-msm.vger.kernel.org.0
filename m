Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08B8D666542
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 22:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbjAKVFD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 16:05:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232785AbjAKVEY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 16:04:24 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C638CC11
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 13:03:34 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id m6so25410207lfj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 13:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=reEl/2tn7HqgWtyP+mwEHL9BBRlOJ75/T5lu7Dkig44=;
        b=EiZwzr/qHQNG4/5ehdOW1E1eJtTiISL+KSlletoMZtH6vEHUjtpN4HUNYjb+f2Ngy7
         eu/lBeQqLBN0Mi2idW4TDHQHWv6AnyX+rYp/81NqBs0mTzo/CeeRq/VkTI8Cjy6eUGbN
         GIX3ktot9VauNQcj6XtIyKO+NSMi0NKpnue+Q96Xr2pHNoT64z+GAgZoa5E0VRLo7YDK
         s/RFw5rkcmFQbqM2DrL+cjrINh9BrrKI+oaxvSEIN3HwJZz+InKmY8ok3CyJ6W5MwYpO
         oxIDdzzaLOgZKe7ssrojZZTckaJVNm4VK1Yoyl4UupATQdwJ8ZdVj06VmBlQbpuwI+U3
         sifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=reEl/2tn7HqgWtyP+mwEHL9BBRlOJ75/T5lu7Dkig44=;
        b=0BmQLAHFenGdo+CVc/Sg8xBY/1wJK9GAsrZMUqYrBuoKba8+OUnXhVu1efdRglk02P
         zcmippxjgXwy9Uuw0mzpRaLBtAF6lQQw75MsovjYuQowu/hfLody39OXi13QHJ/bCG4x
         +ABjQzUyCLO67fTsyxWINa2lJdb0/0/DrR3ZmbLm+7aUK4QSFLEW2wUElKCFll4zwS+w
         CnungPJZ7QUotJNSZYbCcPnpO/JpOW+7SXnYjIwd+hTfuVfDgIj4lrSyrmSgnPjVwGPk
         MDbehsPqbQ0Zd/axPHiZypRFpyXD7c57sWD7DmxKjhuqqqmYukA4U268t5r/STXaBy3i
         pmvg==
X-Gm-Message-State: AFqh2kpwrW3OTOEQdRdzy7//R9Tsx8Ho83o5X0k71/htE+W5gvtsORAC
        tVIQ88c6Fg05y0sHmqWGDY4JUg==
X-Google-Smtp-Source: AMrXdXsHsXDOAUNHzUlp+2t0eXJAIBf4KrdVInvCFPnvWg617MkppmtCRTG3YRkUSlDc52wm9OQRyg==
X-Received: by 2002:a05:6512:3d1f:b0:4a4:68b8:f4d0 with SMTP id d31-20020a0565123d1f00b004a468b8f4d0mr23518429lfv.22.1673471013173;
        Wed, 11 Jan 2023 13:03:33 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id t13-20020a19ad0d000000b004cc82b7080bsm1907941lfc.200.2023.01.11.13.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 13:03:32 -0800 (PST)
Message-ID: <b4721d61-799e-2677-4273-0c92cb555cae@linaro.org>
Date:   Wed, 11 Jan 2023 22:03:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 06/13] clk: qcom: cpu-8996: simplify the
 cpu_clk_notifier_cb
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
 <20230111192004.2509750-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230111192004.2509750-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11.01.2023 20:19, Dmitry Baryshkov wrote:
> - Do not use the Alt PLL completely. Switch to smux when necessary to
>   prevent overvolting
Is this empirical evidence, or did Qualcomm recommendations change since
msm-3.18 was released?


> - Restore the parent in case the rate change aborts for some reason
> - Do not duplicate resetting the parent in set_parent operation.
These sound good.

Konrad
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/clk-cpu-8996.c | 31 +++++++++++++++++++------------
>  1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index 7e5246ca7e7f..ee7e18b37832 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -506,27 +506,34 @@ static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
>  {
>  	struct clk_cpu_8996_pmux *cpuclk = to_clk_cpu_8996_pmux_nb(nb);
>  	struct clk_notifier_data *cnd = data;
> -	int ret;
>  
>  	switch (event) {
>  	case PRE_RATE_CHANGE:
> -		ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, ALT_INDEX);
>  		qcom_cpu_clk_msm8996_acd_init(base);
> +
> +		/*
> +		 * Avoid overvolting. clk_core_set_rate_nolock() walks from top
> +		 * to bottom, so it will change the rate of the PLL before
> +		 * chaging the parent of PMUX. This can result in pmux getting
> +		 * clocked twice the expected rate.
> +		 *
> +		 * Manually switch to PLL/2 here.
> +		 */
> +		if (cnd->new_rate < DIV_2_THRESHOLD &&
> +		    cnd->old_rate > DIV_2_THRESHOLD)
> +			clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, SMUX_INDEX);
> +
>  		break;
> -	case POST_RATE_CHANGE:
> -		if (cnd->new_rate < DIV_2_THRESHOLD)
> -			ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
> -							   SMUX_INDEX);
> -		else
> -			ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
> -							   ACD_INDEX);
> -		break;
> +	case ABORT_RATE_CHANGE:
> +		/* Revert manual change */
> +		if (cnd->new_rate < DIV_2_THRESHOLD &&
> +		    cnd->old_rate > DIV_2_THRESHOLD)
> +			clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, ACD_INDEX);
>  	default:
> -		ret = 0;
>  		break;
>  	}
>  
> -	return notifier_from_errno(ret);
> +	return NOTIFY_OK;
>  };
>  
>  static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
