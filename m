Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC0E965CD25
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 07:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbjADGgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 01:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbjADGf7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 01:35:59 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECDBE45
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 22:35:57 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id a11-20020a17090a740b00b00223f7eba2c4so5638819pjg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 22:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jjU6a1BIpzw50Rh+s83xc47mktrNM3TuYh2UZCXGX4k=;
        b=i8Z2zuVQLdlS/yxxfAVQFry4zW3eGi0PoTYqKD5oo5xmb48Owl73lLYAw95CNWIJtl
         J1uu9HRnK0oYJ66KuH/zY4MkV+luT7RaJijwQ1AHhrAxLiGYDXEEt+DfW5zJOGs1XcgY
         v9EoE6zL25MQ0czH/kWLmSQKtUfNr7brJ/k5op9Ky/4miITK/UoSXxJSfBUNcW9CQTBu
         pwbbrrr9w9Y7pc65Oblf6hVA5LOU89aples/H2e6/RYPJgbqwdG59XBa4jwUtZ+0Yrmr
         iCbrtD5giGMnbIBpDfFPponhYV3XsOUNi23BpBRYzIT43lo7Q1ih32GaZE0MKJcAGkQp
         9gvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjU6a1BIpzw50Rh+s83xc47mktrNM3TuYh2UZCXGX4k=;
        b=bEXY/5dbxJS1xoQJY22DVMNsqcEZ+DgP7fRUNNcioTavvsMZ+El4HFVlnjipOjEknH
         Kg5kIEi0aC4ZF9e/pAkr6299cKeZfWt0iOE8AaimXa9qUagPQMBLm041p+JpkvRrHpHB
         0eXmuDgpzXTZIFYQHRb3TtE0Xi1erMuPoJg/hE78I7B/jpYyMnBqdgSQajmcOn7FVfrC
         rtmr2R1k/iYkt/M0psxIq2n7tWhRED0ks+0D/htSzp0nTph+LecJAQz5++URRlVrQjTd
         3FGWaT/yfGg/Tpg1lk1yKXoT0rx//ZcT5OoXOJOrKK1+sqkOLMJYfPXKC0tyC8fVlBj0
         wMvA==
X-Gm-Message-State: AFqh2kpVtkg6540kFYTuAs1hnKA0dWeI0hulO2reeYpIF/av0e55ZC1l
        Ft3aGXxfeoJVoSjdyIHfk1hCWQ==
X-Google-Smtp-Source: AMrXdXsQxSKmqH1ZRszJvE7YCY36ZUkR/DKopj7I1yyLVB0Jfz2BfuVJgFClf5x7+GMbi4cWShUc6g==
X-Received: by 2002:a17:902:d48f:b0:192:a664:1b2d with SMTP id c15-20020a170902d48f00b00192a6641b2dmr24928193plg.30.1672814156735;
        Tue, 03 Jan 2023 22:35:56 -0800 (PST)
Received: from localhost ([122.172.82.107])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902a3c700b001894dc5fdf2sm23115190plb.296.2023.01.03.22.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 22:35:56 -0800 (PST)
Date:   Wed, 4 Jan 2023 12:05:53 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Add SM6375 to cpufreq-dt-platdev blocklist
Message-ID: <20230104063553.2rkoxxkkrsmbmqdg@vireshk-i7>
References: <20230103171129.191193-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103171129.191193-1-konrad.dybcio@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03-01-23, 18:11, Konrad Dybcio wrote:
> The Qualcomm SM6375 platform uses the qcom-cpufreq-hw driver, so add
> it to the cpufreq-dt-platdev driver's blocklist.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 8ab672883043..1a7b2420e735 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -150,6 +150,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "qcom,sdm845", },
>  	{ .compatible = "qcom,sm6115", },
>  	{ .compatible = "qcom,sm6350", },
> +	{ .compatible = "qcom,sm6375", },
>  	{ .compatible = "qcom,sm8150", },
>  	{ .compatible = "qcom,sm8250", },
>  	{ .compatible = "qcom,sm8350", },

Applied. Thanks.

-- 
viresh
