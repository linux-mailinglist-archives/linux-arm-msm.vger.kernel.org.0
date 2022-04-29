Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86B48514E64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 16:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239401AbiD2O4z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 10:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239464AbiD2O4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 10:56:53 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE3BB6D28
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 07:53:35 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id j4so14485039lfh.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 07:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=ieX4ERtpLD9xXlnppJiXnBM5MolbjWhutaLWoLmtuWI=;
        b=WJasDlX+L7lTDi5DRlU/Iore/2d+AmazQHpymgaYf5mJzUIoye3IFFkLJAvwLqSY4X
         YMpcGw9iVNUQUc5I2Pb2d0hcYhjJ+1Uu8gxuVBehkJKOImZwR5rp0bJvdYwuWUAsP2JB
         lOa5a8Hkl5croJBMPERWm8+LGDIL588sdVkMELH5PQ9nZyIZLr0SGJGk2a0bKTVeG64+
         2sLbtxRJp+9YBzOndjhgj0bZI9u5ma4lZO58ltKUR2Xxb7eWsmiHG8RrrpsO9B9oZ7OT
         riTIR2WQujE/PXMZX5xg6rVVD5QSKYKXGl8NjROU6MjKf5rk/KJxHq0SZAMZS8GGCHV6
         Ftgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ieX4ERtpLD9xXlnppJiXnBM5MolbjWhutaLWoLmtuWI=;
        b=HAfpF5M7KzIfw77plqgTcy3dAqzOwn9EANLYS2fdSyjuVTGtjxrsYS2N7F/ZLqC1LL
         8joW9ihJQPaYqenGD6tcCJeaOA/G2IKohX47VnmN32DrQ2XeKpOqxyNryLFxu9zWuXkc
         pORBI7BmmxzoUjx3ophseHSLWC9XS1AJhAjXmIqj42gWPQZzlP58/HWqINJ17+7AkLot
         OAazNW+rkCv9X3UxgqlOYSzRJOUwHJtsL5Zsi/ozH4+tl5p5+D0Ts5RLKX8FlXMuvK5u
         j530P1NsGNPCiCUZkvVexkVEjAv1o/10OfD6FOCV+WaA6NujYZtjcUBgU1JjB9hSBiru
         /DZw==
X-Gm-Message-State: AOAM532eXDi1ZJxU9bNQHBVNPf2/2Cnq/ql+bmdxIPUmXlkPXgqX5To6
        qQrGyNAdWNWcMmfsEC/3ftEesw==
X-Google-Smtp-Source: ABdhPJzSI2kOIfH8vfPEQ4hDiW6Y4SzEOOnLZqvrg4nFXU0ts2KCEezMrgV4P/DO5KsC3zUS5mFBNQ==
X-Received: by 2002:a05:6512:3c8a:b0:472:2513:db16 with SMTP id h10-20020a0565123c8a00b004722513db16mr10659036lfv.497.1651244013521;
        Fri, 29 Apr 2022 07:53:33 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bd6-20020a05651c168600b0024f3d1daeb5sm283625ljb.61.2022.04.29.07.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 07:53:33 -0700 (PDT)
Message-ID: <b7de49e0-c0cf-5062-8426-dcb54272d350@linaro.org>
Date:   Fri, 29 Apr 2022 17:53:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/4] clk: qcom: clk-krait: add hw_parent check for
 div2_round_rate
Content-Language: en-GB
To:     Ansuel Smith <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sricharan R <sricharan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220429120108.9396-1-ansuelsmth@gmail.com>
 <20220429120108.9396-4-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220429120108.9396-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/04/2022 15:01, Ansuel Smith wrote:
> Check if hw_parent is present before calculating the round_rate to
> prevent kernel panic. On error -EINVAL is reported.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

I see that other clock drivers do not perform this check. Which path 
leads to this oops?

> ---
>   drivers/clk/qcom/clk-krait.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-krait.c b/drivers/clk/qcom/clk-krait.c
> index 90046428693c..6c367ad6506a 100644
> --- a/drivers/clk/qcom/clk-krait.c
> +++ b/drivers/clk/qcom/clk-krait.c
> @@ -84,7 +84,12 @@ EXPORT_SYMBOL_GPL(krait_mux_clk_ops);
>   static long krait_div2_round_rate(struct clk_hw *hw, unsigned long rate,
>   				  unsigned long *parent_rate)
>   {
> -	*parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw), rate * 2);
> +	struct clk_hw *hw_parent = clk_hw_get_parent(hw);
> +
> +	if (!hw_parent)
> +		return -EINVAL;
> +
> +	*parent_rate = clk_hw_round_rate(hw_parent, rate * 2);
>   	return DIV_ROUND_UP(*parent_rate, 2);
>   }
>   


-- 
With best wishes
Dmitry
