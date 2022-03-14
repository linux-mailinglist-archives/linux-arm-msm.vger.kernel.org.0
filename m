Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD844D8C34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Mar 2022 20:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243985AbiCNTUY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Mar 2022 15:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232224AbiCNTUX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Mar 2022 15:20:23 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3CBE01C
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 12:19:12 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id o6so23407619ljp.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 12:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TjvDabmipcoDVAowxyOIFgn1uuT4hi0ow4KrPPUg6D4=;
        b=S/rZzB/TDKyf3X2mQGLC8ujbKUEER7DEPaN0ikq6Pk1hyxxZEmgym3bC7rAz2KUHiZ
         49fx9kVfTB9XFd8rFcJ4T6W/FpxJlDSQHiXJfat+uxXkwNLIPmJ5BHN9rcni9iJ7RqQA
         uoHf7uQnNmQhozpb3GRZDxBHakYHt5ycw7loLCdXJzVHjqJya/TkpiwhVbu8OaU5skwD
         FohPPTUsXCLEgZgFrE2ed4wKkWumJDPk9BUXDbgnLdsSdRWIsZHORYI1gFaa03bBKN2J
         DpQJfRZLLoxFaPgUw6a1eSmYRQKWQAapsBdamFdhw8bwM6cLGa1cyWPjfx7tdoSGStKT
         N26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TjvDabmipcoDVAowxyOIFgn1uuT4hi0ow4KrPPUg6D4=;
        b=hyqhL4b38I45DXDW1MvggGoonIZn437OG5LRBE3BLEYlNYV0+b0RLmNGXVUaBCvYRy
         6xQdi7dG/6H4LYBKkOm6Uf59R10nNOJyDccaA/wzOztPjyMf0mQuzXyYg0oJhufbvyP5
         ngNtNFyv8Y/ymNJzWYljV4ecQ4ESmk+ZtW2oCDVLRu6DhhpDqMOSRdIRreLXKF3cjpCI
         7jwpgxKugoiP3yJdse4iyhT9wWVIlW4RNdQgtix04TXQxa8ZotZgaytX8jc+LCsfjfTz
         WupNZd5+kAidAR8aWEGnkwrwTydYzmxpdLqUyOhpbBZl0xKSqVpvyOU8RwXxYWvMaAIw
         PC8w==
X-Gm-Message-State: AOAM531c98Hs2H6BCo0Gmc3DCXP5GyH01NmLvrAUu0gxT5ZIE8y7beXx
        4p/GAMlF7oM3o/0mmx3o9Uf1UQ==
X-Google-Smtp-Source: ABdhPJxhuKx8oc4rbiN4ALuz3yTIjPTRav3swyG7A2AzuUxZce2+DV9c0nr98TQgOH4sA8dq1b+RYA==
X-Received: by 2002:a2e:9617:0:b0:247:d94b:c73b with SMTP id v23-20020a2e9617000000b00247d94bc73bmr14939709ljh.78.1647285549670;
        Mon, 14 Mar 2022 12:19:09 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g19-20020a2e3913000000b00247dea5b468sm4115825lja.115.2022.03.14.12.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 12:19:08 -0700 (PDT)
Message-ID: <a97aabce-f694-2b20-801e-b9b56cca95a9@linaro.org>
Date:   Mon, 14 Mar 2022 22:19:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v11 3/9] mfd: qcom-spmi-pmic: read fab id on supported
 PMICs
Content-Language: en-GB
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
References: <20220309210014.352267-1-caleb.connolly@linaro.org>
 <20220309210014.352267-4-caleb.connolly@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220309210014.352267-4-caleb.connolly@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/03/2022 00:00, Caleb Connolly wrote:
> The PMI8998 and PM660 expose the fab_id, this is needed by drivers like
> the RRADC to calibrate ADC values.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/mfd/qcom-spmi-pmic.c      | 7 +++++++
>   include/soc/qcom/qcom-spmi-pmic.h | 1 +
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
> index bfe1304aee1b..b12a07da6183 100644
> --- a/drivers/mfd/qcom-spmi-pmic.c
> +++ b/drivers/mfd/qcom-spmi-pmic.c
> @@ -19,6 +19,7 @@
>   #define PMIC_REV4		0x103
>   #define PMIC_TYPE		0x104
>   #define PMIC_SUBTYPE		0x105
> +#define PMIC_FAB_ID		0x1f2
>   
>   #define PMIC_TYPE_VALUE		0x51
>   
> @@ -175,6 +176,12 @@ static int pmic_spmi_load_revid(struct regmap *map, struct device *dev,
>   	if (ret < 0)
>   		return ret;
>   
> +	if (pmic->subtype == PMI8998_SUBTYPE || pmic->subtype == PM660_SUBTYPE) {
> +		ret = regmap_read(map, PMIC_FAB_ID, &pmic->fab_id);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>   	/*
>   	 * In early versions of PM8941 and PM8226, the major revision number
>   	 * started incrementing from 0 (eg 0 = v1.0, 1 = v2.0).
> diff --git a/include/soc/qcom/qcom-spmi-pmic.h b/include/soc/qcom/qcom-spmi-pmic.h
> index 5400e6509fe8..ff839b230e62 100644
> --- a/include/soc/qcom/qcom-spmi-pmic.h
> +++ b/include/soc/qcom/qcom-spmi-pmic.h
> @@ -50,6 +50,7 @@ struct qcom_spmi_pmic {
>   	unsigned int major;
>   	unsigned int minor;
>   	unsigned int rev2;
> +	unsigned int fab_id;
>   	const char *name;
>   };
>   


-- 
With best wishes
Dmitry
