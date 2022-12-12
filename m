Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6D8649906
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 07:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbiLLGoq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 01:44:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbiLLGop (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 01:44:45 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83214BC37
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Dec 2022 22:44:43 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id p24so11102522plw.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Dec 2022 22:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EOjA9NfakO0KzNqsNg9qNeYV4CGLM+TuQ0nmxpOQJ9w=;
        b=NjejaRF65HoJIwMgYJNZ2uHBni9SoDbWmw2/nUmggtYtnNlEULVD737xk/yG+5b03d
         dhVGEuBsfX1ImiMdFRS8N8OPcHSyuQNpjEormx3zxQIymbpRrfMN95k+AsubPB7RE16i
         EUvgH5gHy1AemZZl7GVhEq/hpmaaDiJur81ATJ9oiAubIFEsBFrpp8Md5E4yByeL9J+G
         FBKQZdhYtUPPtG/ter0AC6BRMcryh0KfTj+zHQs8HFVg7ow9cfA+D2rwfBaaESpGi5Wr
         X8xUYzhK+D5Fu8fxrEbaoQSqGksGXg5W155s3tIm82aC77v33yCbmGCHxCpL9wQwpiIu
         sxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOjA9NfakO0KzNqsNg9qNeYV4CGLM+TuQ0nmxpOQJ9w=;
        b=ry2C2ZEIhXvAthFIoQnefe7ACrX3j/BLDzu1k1iP2TyQIzqhVYLGU+YPuwtXpPW5Wf
         SbrIyZS0UjaDZSdy2lxbA/jVabC1NEVE/6ja7nEvicCkmctoxt7xSKlYblPHVj3dHKrj
         J8CRdwoTzaajwj7T+yjZwvDLQTvjHgwe54bdDRwSVOlqPo/0QAxc6xR9MEoyprfy5MEC
         BJg6Hyu8UETI32L2fXUV+/cln1hgh92bxTlem/TWMmAlVXechHrI0LPMHhPyvdiiuqBj
         EyopN9dWtVcFhTt0z+GXdaKpQ9bHzgGSSCIk5AlT/2wBixtxf4i6cDnu8Es39Qb+Yff9
         mbig==
X-Gm-Message-State: ANoB5pn6NFFogMFxwGUNoYSu5jkVHnveQqi6089mTLxdvAveMBs85391
        eAjijdjvxIIqv6+ffQ7mBxJSNA==
X-Google-Smtp-Source: AA0mqf6CHXOLXeo961oUYQ/dv8RCRHdTmBZ+IUt/DaTwfAsoYw7AYzzump04kUDuhfRp24a8KqE2bw==
X-Received: by 2002:a05:6a20:6b90:b0:ad:2f8b:ed7c with SMTP id bu16-20020a056a206b9000b000ad2f8bed7cmr11492531pzb.56.1670827482314;
        Sun, 11 Dec 2022 22:44:42 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902eb8800b001868d4600b8sm5411190plg.158.2022.12.11.22.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 22:44:40 -0800 (PST)
Date:   Mon, 12 Dec 2022 12:14:37 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        patches@linaro.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-hw: Fix reading "reg" with
 address/size-cells != 2
Message-ID: <20221212064437.pvk3ynghuahxort4@vireshk-i7>
References: <20221209150759.396255-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209150759.396255-1-konrad.dybcio@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09-12-22, 16:07, Konrad Dybcio wrote:
> Commit 054a3ef683a1 ("cpufreq: qcom-hw: Allocate qcom_cpufreq_data during
> probe") assumed that every reg variable is 4*u32 wide (as most new qcom

                                                        corresponding ")" is missing.

> SoCs set #address- and #size-cells to <2>. That is not the case for all of
> them though. Check the cells values dynamically to ensure the proper
> region of the DTB is being read.
> 
> Fixes: 054a3ef683a1 ("cpufreq: qcom-hw: Allocate qcom_cpufreq_data during probe")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index 340fed35e45d..22f48f789557 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -649,9 +649,10 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
>  {
>  	struct clk_hw_onecell_data *clk_data;
>  	struct device *dev = &pdev->dev;
> +	struct device_node *soc_node;
>  	struct device *cpu_dev;
>  	struct clk *clk;
> -	int ret, i, num_domains;
> +	int ret, i, num_domains, reg_sz;
>  
>  	clk = clk_get(dev, "xo");
>  	if (IS_ERR(clk))
> @@ -679,7 +680,22 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	/* Allocate qcom_cpufreq_data based on the available frequency domains in DT */
> -	num_domains = of_property_count_elems_of_size(dev->of_node, "reg", sizeof(u32) * 4);
> +	soc_node = of_get_parent(dev->of_node);

This must be dropped on failures later ?

> +	if (!soc_node)
> +		return -EINVAL;
> +
> +	ret = of_property_read_u32(soc_node, "#address-cells", &reg_sz);
> +	if (ret)
> +		return ret;
> +
> +	/* Reuse 'i', as it's only used later in the loop */

This can be dropped in my opinion.

> +	ret = of_property_read_u32(soc_node, "#size-cells", &i);

Should i be initialized ?

> +	if (ret)
> +		return ret;
> +
> +	reg_sz += i;
> +
> +	num_domains = of_property_count_elems_of_size(dev->of_node, "reg", sizeof(u32) * reg_sz);
>  	if (num_domains <= 0)
>  		return num_domains;
>  
> -- 
> 2.38.1

-- 
viresh
