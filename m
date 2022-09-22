Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0BD45E62C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 14:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbiIVMtx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 08:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbiIVMtw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 08:49:52 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2CB48E95
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 05:49:50 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id z6so15442824wrq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 05:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=cYAVsAB50QNWUBHodvSlZMG3l4X65go68Bfx5yHoWV8=;
        b=oXbQu/tR/L9tnDkbqGc75Kdoz0HuYgViniy9jyakVAsj16zS0R1sZPjIW5fFzAD3nM
         gEEH9CNYQP5DqxJPYr7RhvlOSjegJKJHA5NfHSqsmFiLIbyS9Npw3QvXocFA1uxRIEcK
         lm5OA/bsr5hg4aKjY4+zyKZyoQUnGxi0Cr/D/w2vzjDj+6ARQaBC8QmbvjzAmkLGfp6w
         k5rO3ywTdZ/9l1luw+6O3ybnyWNc5ZciRraeXdQLp9xV9dXwOnp2ii1jG8wJdG+Qy8yP
         2ZbDLnaCEaONVOt4KBiz2bUqQviEt5fXlezh6gh7CxeeIV2HyBObB1wBWxRqEZUUMvK6
         eVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=cYAVsAB50QNWUBHodvSlZMG3l4X65go68Bfx5yHoWV8=;
        b=3GTdsnhwcBl0G/4OH4QwxqzHcTh3Io797CPIsUKmIS6GoDFM6pjtIXWw8YNrcES16E
         3Avm7MH2uOwBZCZghQO+OQ+N4S6Anw0cO5GFZxfhHMlSQBmgA5THD4/DPJJK595I08Uf
         tAgNlyrrWwy466vr/qJaYRE6Ae4Q0q/81EsPM20wvaMZmKrKVFoktSFuHYgTPloGZMlV
         g4TV9eXeFuPj52JRIvQqXh57qoNoq+tssTCrH9XPTstuXEcI2oO1RL8Os0p6A7tU0x5m
         fW8phHLpYOWxq2qIVhVUvWYOO5bpqT+6zeGP4iooCsqmOhcJXGQpE7SDPMhF1vJN6uRw
         ARvA==
X-Gm-Message-State: ACrzQf0rW6UBcn4BUJTF1aeMA2RKEVq7TtbkxnSplSPKm2hdYT2rWXeP
        NXCLyhn29CGU0OSEEPEQ1+asIw==
X-Google-Smtp-Source: AMsMyM7+jIq9BvpGJpNvPsQdjp+qir6rm1r9/fmP+p4ais3TtDbcBHtvcqDMWkNB1yejiZUTWt2q6w==
X-Received: by 2002:adf:dc4c:0:b0:22a:42eb:1e34 with SMTP id m12-20020adfdc4c000000b0022a42eb1e34mr2007734wrj.258.1663850989099;
        Thu, 22 Sep 2022 05:49:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6aa5:ee77:c3d6:a9d6? ([2a01:e0a:982:cbb0:6aa5:ee77:c3d6:a9d6])
        by smtp.gmail.com with ESMTPSA id g18-20020a05600c4ed200b003b482fbd93bsm6959952wmq.24.2022.09.22.05.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 05:49:48 -0700 (PDT)
Message-ID: <3801e9c9-20a8-066b-e55d-6ecc520c265f@linaro.org>
Date:   Thu, 22 Sep 2022 14:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/7] phy: qcom-qusb2: Use dev_err_probe() to simplify code
Content-Language: en-US
To:     Yuan Can <yuancan@huawei.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org, kishon@ti.com,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20220922111228.36355-1-yuancan@huawei.com>
 <20220922111228.36355-7-yuancan@huawei.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Organization: Linaro Developer Services
In-Reply-To: <20220922111228.36355-7-yuancan@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/09/2022 13:12, Yuan Can wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 27 +++++++++------------------
>   1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index 7529a7e6e5df..2ef638b32e8f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -973,20 +973,14 @@ static int qusb2_phy_probe(struct platform_device *pdev)
>   		return PTR_ERR(qphy->base);
>   
>   	qphy->cfg_ahb_clk = devm_clk_get(dev, "cfg_ahb");
> -	if (IS_ERR(qphy->cfg_ahb_clk)) {
> -		ret = PTR_ERR(qphy->cfg_ahb_clk);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get cfg ahb clk, %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(qphy->cfg_ahb_clk))
> +		return dev_err_probe(dev, PTR_ERR(qphy->cfg_ahb_clk),
> +				     "failed to get cfg ahb clk\n");
>   
>   	qphy->ref_clk = devm_clk_get(dev, "ref");
> -	if (IS_ERR(qphy->ref_clk)) {
> -		ret = PTR_ERR(qphy->ref_clk);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get ref clk, %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(qphy->ref_clk))
> +		return dev_err_probe(dev, PTR_ERR(qphy->ref_clk),
> +				     "failed to get ref clk\n");
>   
>   	qphy->iface_clk = devm_clk_get_optional(dev, "iface");
>   	if (IS_ERR(qphy->iface_clk))
> @@ -1003,12 +997,9 @@ static int qusb2_phy_probe(struct platform_device *pdev)
>   		qphy->vregs[i].supply = qusb2_phy_vreg_names[i];
>   
>   	ret = devm_regulator_bulk_get(dev, num, qphy->vregs);
> -	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get regulator supplies: %d\n",
> -				ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to get regulator supplies\n");
>   
>   	/* Get the specific init parameters of QMP phy */
>   	qphy->cfg = of_device_get_match_data(dev);


The error handling of devm_reset_control_get_by_index() could probably
be replaced with dev_err_probe() aswell.

Anyway:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
