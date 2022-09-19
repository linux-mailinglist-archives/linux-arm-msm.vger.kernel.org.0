Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD5B5BCACE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Sep 2022 13:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbiISLdA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 07:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiISLc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 07:32:59 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 669FD286D5
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 04:32:57 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id z2so4782772edi.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 04:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bOWk3RjHkqMSzicYJtFh+umyQ3wXl5bxYNan6eeyfig=;
        b=PT9MGs6w3U+7R7ygTNLxPxdbUerib98TShD73OnbSX40JziwrKplkFl/TlcXrn9J0W
         JLgoE9jXCHO+voFVRTG4FjDnT73C25WmKjgZzWrlhdx/69rJhoMVzLWErodmWKBsfK8i
         fajc8et4dZHB5fFH3vonDznVJ8aJfFGFbJBVo0g9VEsP+gnB2joWHnr61Ok/KAnDYNbE
         CfnEJvGJOhBPV0GE3qW7UczKXCI+/VU9PTGqkFmPWxRZqFPCVmiQfcIkpPv69GYw8583
         NWurr6rjcmEcfPmILH5LEB4TBs/HrYWhxqEo7Y+D5sNSueQiImtBJyMeJHm2C48bcPGt
         bnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bOWk3RjHkqMSzicYJtFh+umyQ3wXl5bxYNan6eeyfig=;
        b=qIG/GjOie+/od7NbRnnGvu5wOmqZwePRzort95UKZV2QNzQrH792mhlMiwhX8B3f4+
         NNxCJSh6+46hzNe7orhWrBBsNY2nITyC5G/dYQ3sv4r/iyqP1buZycT3K3vawDA+QP9w
         wh8uxvHe/RIkCpT/AFIZQGq4T661kGqmPSM9wfzCxveWs3Qaaq/XNGUFyaSzYpmmabOy
         wWJS04a4DzH0iENd0lJtj7zwtNbrlHJKY4kkjBVzT1dgFJy8mcZqkDc4oEaBJKU15nji
         evP/i0kFVnG/oU3uA5+2Q7Vd/ec+HxoPrxJkCSaPITli7ev+hodDDfNf3kD6HoxFhQi5
         yJBQ==
X-Gm-Message-State: ACrzQf36JMrRShpAAf6bjZCjR+hNMfLVXY45luSQE9dRnpaLeavieCsf
        6FfwHsNMk2D6um/8N3p15XL7SA==
X-Google-Smtp-Source: AMsMyM6dntwaytIaW3Dyt8jp8HjcAYLZXOgvtJjeZFVs+HTltDDJE8Fj/FOixfD4EatRUzNcRKLTtQ==
X-Received: by 2002:aa7:d3d3:0:b0:44e:baab:54d9 with SMTP id o19-20020aa7d3d3000000b0044ebaab54d9mr14747420edr.43.1663587175896;
        Mon, 19 Sep 2022 04:32:55 -0700 (PDT)
Received: from [192.168.174.234] (92.40.199.52.threembb.co.uk. [92.40.199.52])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906310a00b0073d6d6e698bsm15618860ejx.187.2022.09.19.04.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 04:32:55 -0700 (PDT)
Message-ID: <28e9805a-6602-08cb-381f-9c7dc8bacdd9@linaro.org>
Date:   Mon, 19 Sep 2022 12:34:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 2/2] mfd: qcom-spmi-pmic: Add more PMIC SUBTYPE IDs
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
References: <20220915113523.44074-1-luca.weiss@fairphone.com>
 <20220915113523.44074-2-luca.weiss@fairphone.com>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20220915113523.44074-2-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15/09/2022 12:35, Luca Weiss wrote:
> Add more IDs that are found in the downstream msm-4.19 kernel under the
> path include/linux/qpnp/qpnp-revid.h.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>

Kind Regards,
Caleb
> ---
> Changes since v2:
> * Convert hex numbers lowercase
> * Remove SMB* IDs added in v1, given it's not sure they're actually spmi
>    pmics or just i2c pmics (keep SMB2351 because it supports spmi)
> 
>   include/soc/qcom/qcom-spmi-pmic.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/include/soc/qcom/qcom-spmi-pmic.h b/include/soc/qcom/qcom-spmi-pmic.h
> index fde0148d0077..c47cc71a999e 100644
> --- a/include/soc/qcom/qcom-spmi-pmic.h
> +++ b/include/soc/qcom/qcom-spmi-pmic.h
> @@ -26,6 +26,8 @@
>   #define PM8901_SUBTYPE		0x0f
>   #define PM8950_SUBTYPE		0x10
>   #define PMI8950_SUBTYPE		0x11
> +#define PMK8001_SUBTYPE		0x12
> +#define PMI8996_SUBTYPE		0x13
>   #define PM8998_SUBTYPE		0x14
>   #define PMI8998_SUBTYPE		0x15
>   #define PM8005_SUBTYPE		0x18
> @@ -36,8 +38,17 @@
>   #define PM8150B_SUBTYPE		0x20
>   #define PMK8002_SUBTYPE		0x21
>   #define PM8009_SUBTYPE		0x24
> +#define PMI632_SUBTYPE		0x25
>   #define PM8150C_SUBTYPE		0x26
> +#define PM6150_SUBTYPE		0x28
>   #define SMB2351_SUBTYPE		0x29
> +#define PM8008_SUBTYPE		0x2c
> +#define PM6125_SUBTYPE		0x2d
> +#define PM7250B_SUBTYPE		0x2e
> +#define PMK8350_SUBTYPE		0x2f
> +#define PMR735B_SUBTYPE		0x34
> +#define PM6350_SUBTYPE		0x36
> +#define PM2250_SUBTYPE		0x37
>   
>   #define PMI8998_FAB_ID_SMIC	0x11
>   #define PMI8998_FAB_ID_GF	0x30
