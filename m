Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00CB4751BFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 10:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234546AbjGMIpZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 04:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233755AbjGMIpC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 04:45:02 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D4326A8
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 01:44:33 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fba74870abso838430e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689237872; x=1691829872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SzJltP0N9vbWqDkRbI3S5sA4acByDrw2zIcLcbamrWE=;
        b=fihFzxnSouY7eJl+SOC8Q198uWbB8fOqxCQtcEV/RntbNx45AGqWVlyRgCzQq9b1kk
         vV+o1XKq5ljuIslE1hbE5J1Q9ikKQCJ2Mse43Cf/42PA4HHGRVHgQQvBF1bIDib0bMAF
         rW4t3yOBI4XtWv+KwGN7My7lqWy2w3V66ww/JySBK7ORb2bpMff29NTq8Qr9IbwBeuRj
         Xt4FrJwYXrThovxvL6AweP8v/TPzB33+fE1Hv7cTOWkC6lxptE9NiFDAR1h0LzKTa+iF
         byCO6v66AZSJj6IS72js7iQQ0VbkwU/mHNk8GJ2IImxHwUcfLYkKD6uQ714o/ZAkji9H
         mJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689237872; x=1691829872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzJltP0N9vbWqDkRbI3S5sA4acByDrw2zIcLcbamrWE=;
        b=gA59OTdVd8C1TGT2yGxg2snoKGyzwiewEJLrvgNA5j9mSOxJhoj1orIhO+zcXSSEWU
         zklptdFqzx4XCC6205mGw29r1qSuSGgLYX0dGeSTtzpSiV97osWDd4JUcTYzcrp/Sggh
         8Fz8uDJ5vlpBmyo8vSj3nm9aTKLcUpVHW3g2eSq/7mlX3YDZ+YAA0p45D/T0sGYeai1I
         y8KYG2ENRdPvmq0lnKlwZa+XSqHJMiyUW2Gv31VcsYJwkWLf32RllkYKZQbBHC//A5wQ
         SQjt+VTedqqYKp8MTHQ6fNAqjGR1YnBZG8PL7NEwiNWOmOF897QXrIuxZqr1r+kc4mAZ
         wXuQ==
X-Gm-Message-State: ABy/qLZCp8BnhVxlCD+ewEy9wKWFQaVwYa/7oIpA4AP9YKOk3iVppwPx
        RHCCRhAiIOD223wIemHtueOO7w==
X-Google-Smtp-Source: APBJJlHALJqskp/z/AnSv5g+cG2G4saX7cXknnKeVpNsyj7DiLrjb6QxwzsioyawQtaJIFmI5uwrSA==
X-Received: by 2002:a05:6512:2346:b0:4fb:7447:e71a with SMTP id p6-20020a056512234600b004fb7447e71amr705159lfu.63.1689237871805;
        Thu, 13 Jul 2023 01:44:31 -0700 (PDT)
Received: from [192.168.1.101] (abyl63.neoplus.adsl.tpnet.pl. [83.9.31.63])
        by smtp.gmail.com with ESMTPSA id p11-20020ac246cb000000b004fb957ac245sm1041160lfo.59.2023.07.13.01.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 01:44:31 -0700 (PDT)
Message-ID: <1d0802a7-5ce8-9dbf-4b72-953d53d35718@linaro.org>
Date:   Thu, 13 Jul 2023 10:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 40/58] mmc: sdhci-msm: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     Yangtao Li <frank.li@vivo.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230713080807.69999-1-frank.li@vivo.com>
 <20230713080807.69999-40-frank.li@vivo.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230713080807.69999-40-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13.07.2023 10:07, Yangtao Li wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

>  drivers/mmc/host/sdhci-msm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 1c935b5bafe1..80e376802ee0 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2668,7 +2668,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int sdhci_msm_remove(struct platform_device *pdev)
> +static void sdhci_msm_remove(struct platform_device *pdev)
>  {
>  	struct sdhci_host *host = platform_get_drvdata(pdev);
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -2687,7 +2687,6 @@ static int sdhci_msm_remove(struct platform_device *pdev)
>  	if (!IS_ERR(msm_host->bus_clk))
>  		clk_disable_unprepare(msm_host->bus_clk);
>  	sdhci_pltfm_free(pdev);
> -	return 0;
>  }
>  
>  static __maybe_unused int sdhci_msm_runtime_suspend(struct device *dev)
> @@ -2740,7 +2739,7 @@ static const struct dev_pm_ops sdhci_msm_pm_ops = {
>  
>  static struct platform_driver sdhci_msm_driver = {
>  	.probe = sdhci_msm_probe,
> -	.remove = sdhci_msm_remove,
> +	.remove_new = sdhci_msm_remove,
>  	.driver = {
>  		   .name = "sdhci_msm",
>  		   .of_match_table = sdhci_msm_dt_match,
