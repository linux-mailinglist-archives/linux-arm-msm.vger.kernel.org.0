Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEB9F6787C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 21:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232253AbjAWU3k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 15:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbjAWU3i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 15:29:38 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF03F46AD
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 12:29:37 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id az20so33785300ejc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 12:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gr6klha8/Id8ExFH/v5Gi5EMkpwOsJKAIe/E57pBKZ4=;
        b=zAcCn6ZVLjksbePgoAYGaI73TDbFCiqgKdHvU/OnM/jQlgiMWe9aP4502DPIGiq858
         Keb/LXQYHiqp9Mq1+2w40t9d3nhO0YyymLArX/oovX1x+2/Dn6KRtItIkUqs6FjQElGA
         e+qz+hTTtZqypesoylhy35PvWc0BWSIe/qlQYQaXZkLM5ln4VG6pW7wwQnp+iBCB9Ru2
         5z/uw4gQV4XORNSc9g8YH+LHQlV604BHfYGMuBHUsZcanFUackrA0xrK0WSkdhB3ktyl
         LdPtkw56xBzm5/vjZ8i/+lMC0XfbGB3sWw6QJK+mRzaUgHbr2bYAnNg7uK7N3ZhxE/qK
         pqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gr6klha8/Id8ExFH/v5Gi5EMkpwOsJKAIe/E57pBKZ4=;
        b=NSo8YkJc4YvlW7nX7gY9UOiVHUS/GEVi7/D1Bgo/4X5Q0Ey0wfZlKQAK52OCRyVFmj
         LBGfpDbQh9RbTXJL85kP1gG/6eIjj2RFBp+jByN9TBmfo4DbeTlsBgwrTCdranoWaKx2
         uJX7ptRI8kVHO91ov58G7WuVAoinsgmeMlIfL4MzSr/aZhYtIuVVinsUXED9ko2TI90F
         tQ4yT3fe9rxoENRjz1NWWM8iO3g5HYc+hKAxNJTOAJBmRjb0sVTN2ggGKSIsiL64Nd8C
         aNvO5Lkh4fG9Sb2+NYjd2ZzoTYkE0iTG87+IW4/aa2djdiH/mSUbIFwcTSDl4MJE0mvH
         b9tw==
X-Gm-Message-State: AFqh2krvmRDWLDxvoJm89tLXQeJjAHGs6FDurT7sVKX+5hVLG5iLF5mB
        Qm1UKPyFbYQ/TzkN9zxxy240lA==
X-Google-Smtp-Source: AMrXdXu7vIAA8Y6FYEtVy3pEYSsr760pGFB47wXWb5AxbyrvZ2ygdyPSpJkgAK0w8njBLHePCxIpzA==
X-Received: by 2002:a17:907:8c88:b0:86e:d375:1f04 with SMTP id td8-20020a1709078c8800b0086ed3751f04mr28777054ejc.30.1674505776467;
        Mon, 23 Jan 2023 12:29:36 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id r17-20020a1709061bb100b0079800b8173asm22390326ejg.158.2023.01.23.12.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 12:29:36 -0800 (PST)
Message-ID: <50e8efcf-3435-b508-e532-d935db6cb041@linaro.org>
Date:   Mon, 23 Jan 2023 21:29:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 3/3] clk: qcom: rpmh: fix double RPMH_IPA_CLK assignment
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230123201812.1230039-1-krzysztof.kozlowski@linaro.org>
 <20230123201812.1230039-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230123201812.1230039-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.01.2023 21:18, Krzysztof Kozlowski wrote:
> RPMH_IPA_CLK is assigned twice:
> 
>   drivers/clk/qcom/clk-rpmh.c:578:35: error: initialized field overwritten [-Werror=override-init]
> 
> Fixes: aa055bf158cd ("clk: qcom: rpmh: define IPA clocks where required")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=19aeacf505a08ae8fc1e087f9d85b7caf29b09b4

Konrad
>  drivers/clk/qcom/clk-rpmh.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 393b83f6020e..45ee370f3307 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -575,7 +575,6 @@ static struct clk_hw *sc8280xp_rpmh_clocks[] = {
>  	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
>  	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
>  	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
> -	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
