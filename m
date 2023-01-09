Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3A5166219B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 10:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbjAIJbh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 04:31:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237043AbjAIJbB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 04:31:01 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684AE6467
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 01:30:08 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so6113930wms.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 01:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gGEMDHLHYnrcaFvEu4QvBpxD5CV8NRVf54KR4uCbrnM=;
        b=TqFn7SMxQJax+AzzmJ4lJdlgRdocs+VQr+DEn84XE2DU55VzWMtF6K+UHbT/VxzBRp
         uuhn2WXj1/QeQp9dX/9ba5IZ+eoOvQqzZbUEYHDdPE+1jQdH1wa7A9oAZIKJ9AGMeR6P
         tabYUA+02Pu9ZNYnOa1b+4sWQ956+Tz7p/RuKKrmbkx49/7zD5zKtFPsAZy0MIGGu59w
         ss5rCP/swOMVk2XGuJQX85+cxnh5zORJMDLNpo64JBzBXNxGDmb1tMHfY3RpUwXH8ub6
         UafOIOXFkGCCFx87y4K/RnvVJP7bXRNjUpvztoLy0a0SLQz61Pk60whE/SivI1uRWQyO
         E5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gGEMDHLHYnrcaFvEu4QvBpxD5CV8NRVf54KR4uCbrnM=;
        b=oksO8rHoZAAa2wqzH5B9od272iQDjVfMD/8dBkj4rafIG1FGdog7ReB7d4yYQ4+EZo
         6z1t4Aq1yGTenwBVpROshKwH79PKFD2lCfka5BhaJ3rLUR+ef/o8mwpW+Ic2bWvukqFI
         oqhwniF9cct5HJFn2H5OWpMsV33Gy82vCF9pn3Kr6TUIzk5bRd4Cs115LC0pfVrtMRAN
         s5ww5Tvs0SMq8BieEhOyN8dIAUMr+QncOtD6tY4kNHLrWQPBWdsGJzjg/A26JNco8JLC
         rHsPvmzPq7cs+YjxBkK7uE9ndPPFB8Ecb0+886lgk74VA+2ZpWtqRqy6l28OQHohkSTy
         1mjA==
X-Gm-Message-State: AFqh2krm9dUhpAq+ATK0R88g1v0CBe/nuN6OFQdr31l9sueQ2n4Y/vVl
        a1yX9D+E1PMGe7ZFrsXQlcIJDA==
X-Google-Smtp-Source: AMrXdXspbWYZM83aPs7JQqmVF2zwjegRK3gDtccETa05r62+3m/rLfGTF/MWLDmtzoOoF2a491DtRg==
X-Received: by 2002:a05:600c:601b:b0:3d3:56ce:5693 with SMTP id az27-20020a05600c601b00b003d356ce5693mr45201138wmb.17.1673256607024;
        Mon, 09 Jan 2023 01:30:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p9-20020a05600c358900b003cffd3c3d6csm11509655wmq.12.2023.01.09.01.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 01:30:06 -0800 (PST)
Message-ID: <189e5ced-fea2-177b-fb7b-9bfc89b18d50@linaro.org>
Date:   Mon, 9 Jan 2023 10:30:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/4] soc: qcom: socinfo: Fix soc_id order
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230104115348.25046-1-stephan@gerhold.net>
 <20230104115348.25046-2-stephan@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230104115348.25046-2-stephan@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/01/2023 12:53, Stephan Gerhold wrote:
> The soc_id array is mostly ordered by the numeric "msm-id" defined in
> qcom,ids.h but some recent entries were added at the wrong place.
> 
> While it does not make a functional difference it does make it harder
> to regenerate the entire array after adding a bunch of new IDs.
> 
> Fixes: de320c07da3d ("soc: qcom: socinfo: Add MSM8956/76 SoC IDs to the soc_id table")
> Fixes: 147f6534b8ff ("soc: qcom: socinfo: Add SM8550 ID")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/soc/qcom/socinfo.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 10efdbcfdf05..7258527816b0 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -257,8 +257,6 @@ static const struct soc_id soc_id[] = {

Can you in the same or new patch add a comment that list is ordered by
numerical ID, not by model name?


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

