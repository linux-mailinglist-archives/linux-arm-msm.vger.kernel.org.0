Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236C54D7D7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Mar 2022 09:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237546AbiCNIVl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Mar 2022 04:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237650AbiCNIVk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Mar 2022 04:21:40 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26DF93F325
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 01:20:30 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id r22so20671105ljd.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 01:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=0jsGDZGuE1wFeDgrRVvKz3gMkQvG2OtkGgkBW7bJIIY=;
        b=SzgtULj3Rl6JojXcMunC64uc+o+TjwdnMSkBlloSVDnK5jPfszaNn21wkMHEK/ITNa
         yiZY0GzFsJZtjWswmSdhnjRams5TUswISNTAwjR2cUpwGpnJwkHfTH/JXY9U9HLdYmjp
         QMqTNlhF5/LGN9hfHybecV8wonADSuwQ0smkLc/4EFHBZVFCwNUDkvZ2VXlB6rhMocoK
         VNpqDUOWAotRn/RnW8sXBrEfkv1TER0RrYutQ0FkZ82KSw6QFPwU2sVgk7CIOTLlr39H
         2LQ/c25FuJzeRB85Jp0UJDl7epcDBXFGEwiBPqNgGawRFG88sUdJ4mhZOWx9mT2V/g9s
         heDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0jsGDZGuE1wFeDgrRVvKz3gMkQvG2OtkGgkBW7bJIIY=;
        b=fMQnaRYEha4lhNVqge0a3g3mEuy+iRXMxqbyLe7pkr1gs8PxwyfVi8pCsaS7lanhOO
         NCFNYSHKsbP9PFBqc7u/7kZRuT5U3WA4rEbP6S0EUsmRSnu7yq1HtnUjRYo8twffYubs
         5te4cGfXQQIOJzDz0bqG+8XU8rs8TL63YpCw39GssYB690t7izOrKo1xp976m9FOknva
         iycaAyv7Ifd9VedTWFbaPPxeL9qBcXxtNYE2AZDoj9B+fRmDsmV3p3cP0EJeWGyYKkYZ
         +bZBNxGzgNmlGDQ+IW3Ck0kRUSMZtK/KlwXy4MVNxhqLgCrPKtKAcvG3+xZlGOnvNt6P
         zVIg==
X-Gm-Message-State: AOAM532sTYljNiL4PfeRZcoKx12dcv1DtU9HpzkguyJ0Z9S1lRwlPiBz
        jeP1OLW9OFVvkrIAHz4BwVS1+w==
X-Google-Smtp-Source: ABdhPJzS/POZUDP6+CYrgOXdz6HjJeNcuxARNO8TOkiRP249gvnf2SkXE8Ah7YjoekbbvAGqtJdJgw==
X-Received: by 2002:a05:651c:243:b0:247:eb1b:939d with SMTP id x3-20020a05651c024300b00247eb1b939dmr13654168ljn.250.1647246028276;
        Mon, 14 Mar 2022 01:20:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u13-20020a056512094d00b0043e6c108925sm3140943lft.136.2022.03.14.01.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 01:20:27 -0700 (PDT)
Message-ID: <169795c1-607e-ee60-7ac7-538ed888bedf@linaro.org>
Date:   Mon, 14 Mar 2022 11:20:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 12/16] clk: qcom: clk-krait: add 8064 errata workaround
Content-Language: en-GB
To:     Ansuel Smith <ansuelsmth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20220313190419.2207-1-ansuelsmth@gmail.com>
 <20220313190419.2207-13-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220313190419.2207-13-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/03/2022 22:04, Ansuel Smith wrote:
> Add 8064 errata workaround where the sec_src clock gating needs to be

Could you please be more specific whether the errata applies only to the 
ipq8064 or to the apq8064 too? 8064 is not specific enough.

> disabled during switching. To enable this set disable_sec_src_gating in
> the mux struct.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>   drivers/clk/qcom/clk-krait.c | 16 ++++++++++++++++
>   drivers/clk/qcom/clk-krait.h |  1 +
>   drivers/clk/qcom/krait-cc.c  |  1 +
>   3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-krait.c b/drivers/clk/qcom/clk-krait.c
> index d8af281eba0e..82fe7031e1f4 100644
> --- a/drivers/clk/qcom/clk-krait.c
> +++ b/drivers/clk/qcom/clk-krait.c
> @@ -18,13 +18,23 @@
>   static DEFINE_SPINLOCK(krait_clock_reg_lock);
>   
>   #define LPL_SHIFT	8
> +#define SECCLKAGD	BIT(4)
> +
>   static void __krait_mux_set_sel(struct krait_mux_clk *mux, int sel)
>   {
>   	unsigned long flags;
>   	u32 regval;
>   
>   	spin_lock_irqsave(&krait_clock_reg_lock, flags);
> +
>   	regval = krait_get_l2_indirect_reg(mux->offset);
> +
> +	/* 8064 Errata: disable sec_src clock gating during switch. */
> +	if (mux->disable_sec_src_gating) {
> +		regval |= SECCLKAGD;
> +		krait_set_l2_indirect_reg(mux->offset, regval);
> +	}
> +
>   	regval &= ~(mux->mask << mux->shift);
>   	regval |= (sel & mux->mask) << mux->shift;
>   	if (mux->lpl) {
> @@ -33,6 +43,12 @@ static void __krait_mux_set_sel(struct krait_mux_clk *mux, int sel)
>   	}
>   	krait_set_l2_indirect_reg(mux->offset, regval);
>   
> +	/* 8064 Errata: re-enabled sec_src clock gating. */

And here too

> +	if (mux->disable_sec_src_gating) {
> +		regval &= ~SECCLKAGD;
> +		krait_set_l2_indirect_reg(mux->offset, regval);
> +	}
> +
>   	/* Wait for switch to complete. */
>   	mb();
>   	udelay(1);
> diff --git a/drivers/clk/qcom/clk-krait.h b/drivers/clk/qcom/clk-krait.h
> index 9120bd2f5297..f930538c539e 100644
> --- a/drivers/clk/qcom/clk-krait.h
> +++ b/drivers/clk/qcom/clk-krait.h
> @@ -15,6 +15,7 @@ struct krait_mux_clk {
>   	u8		safe_sel;
>   	u8		old_index;
>   	bool		reparent;
> +	bool		disable_sec_src_gating;
>   
>   	struct clk_hw	hw;
>   	struct notifier_block   clk_nb;
> diff --git a/drivers/clk/qcom/krait-cc.c b/drivers/clk/qcom/krait-cc.c
> index 1bdc89c097e6..533a770332be 100644
> --- a/drivers/clk/qcom/krait-cc.c
> +++ b/drivers/clk/qcom/krait-cc.c
> @@ -154,6 +154,7 @@ krait_add_sec_mux(struct device *dev, struct clk *qsb, int id,
>   	mux->shift = 2;
>   	mux->parent_map = sec_mux_map;
>   	mux->hw.init = &init;
> +	mux->disable_sec_src_gating = true;
>   
>   	init.name = kasprintf(GFP_KERNEL, "krait%s_sec_mux", s);
>   	if (!init.name)


-- 
With best wishes
Dmitry
