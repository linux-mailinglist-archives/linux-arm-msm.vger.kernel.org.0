Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9124797716
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 18:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235338AbjIGQVT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 12:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235222AbjIGQUb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 12:20:31 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD60559C5
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 09:16:45 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-98377c5d53eso137220166b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 09:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694103351; x=1694708151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9cqyTbMBftf/joQMRKfMkLzU0Opm2y7wHA3eqP28zpI=;
        b=aJ3nk5/GM5Bh+x1GvXR5GvboIgfitGOMXnjXEOW9Tor8YGsvH/LSxIRTC4NBBbINTy
         9Pewc+sfE6h/pX9RUPhJWxpVrEj0rGsgMJaAEiok/pbDfwzh11iIRXduSxB3Dv38xuXD
         I8IkVn3jAfDHPyPl0z19jcNLKwooIxcqdt0RiHCZNZVDiik7TrI0U1/yAvD/JyQNSPub
         74luCJg1Ea+plOQrx3W2RWP03gu9aR6AuQM49P08LSsJV50qrMhvPkSEw9Efz6XHtrWh
         n9xDsa7txWpDn1KUyWCk+SzAeULT8lFPYMQQHpVmaqx7xbtpaoBy3dYhj0qJwoEy41Gw
         wGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103351; x=1694708151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cqyTbMBftf/joQMRKfMkLzU0Opm2y7wHA3eqP28zpI=;
        b=I4Kda2E1iGZVRQiHcR4GCmLcyt/me6+wOXQtKFP0/HkfIBRW6RrFEb/68tcGANJlIH
         oml7rhN3WxYMBhRwSyR5AY/2eiAEr8x0ggz+MwJ7Nd0+hk5gkAbte9OcQd9iVpCcrbL7
         FZx2nk/jVcPbLKgCUrZfgm7r6XhZRGLQ3MWbuposxJjDavCmRSlj8cn8oQG+/aFdDXu6
         2rI73zCr/KoEXcl3zI77Mg9UBHluVAfOpgkwCCnRLlx+uimYQW59IzJMyaZ984a5aK9E
         JVV7Nl2kJ5JMpvEDJwmI0tFMOcRmVwLd9Dm/fiA4sILAp1jFCJHg7RzJBXrIMBuvq3dj
         MeFQ==
X-Gm-Message-State: AOJu0YzSG264wy7elGtHJ38kC8883KTvO5CoqiBPK/4w3bOtEIuNVle0
        IAWIGNHU20k1MiJZ3+h23DrZmxSWvfgBfHia3bshOw==
X-Google-Smtp-Source: AGHT+IElMhH6SZyz3Q6I00GiHi9+hHjfTot2J8HBhVaHsG4aeOjUaubp+sXD76/MBLaMZ8727VrnoQ==
X-Received: by 2002:a17:906:73ce:b0:9a1:edb0:2a8c with SMTP id n14-20020a17090673ce00b009a1edb02a8cmr3878447ejl.39.1694075088243;
        Thu, 07 Sep 2023 01:24:48 -0700 (PDT)
Received: from [192.168.37.232] (178235177204.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.204])
        by smtp.gmail.com with ESMTPSA id lu7-20020a170906fac700b00992e14af9b9sm9949024ejb.134.2023.09.07.01.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 01:24:47 -0700 (PDT)
Message-ID: <4f51bd22-0f7d-4e94-8d84-98091fc2dd53@linaro.org>
Date:   Thu, 7 Sep 2023 10:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/10] clk: qcom: clk-alpha-pll: introduce stromer plus
 ops
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>,
        ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1693996662.git.quic_varada@quicinc.com>
 <18a3bc0c5b371deec5c4bbe6ceacf8afcf0bc640.1693996662.git.quic_varada@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <18a3bc0c5b371deec5c4bbe6ceacf8afcf0bc640.1693996662.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7.09.2023 07:21, Varadarajan Narayanan wrote:
> Stromer plus APSS PLL does not support dynamic frequency scaling.
> To switch between frequencies, we have to shut down the PLL,
> configure the L and ALPHA values and turn on again. So introduce the
> separate set of ops for Stromer Plus PLL.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
[...]

> +
> +	/* Wait five micro seconds or more */
> +	udelay(5);
> +	regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_RESET_N,
> +			   PLL_RESET_N);
> +
> +	/* The lock time should be less than 50 micro seconds worst case */
> +	udelay(50);
https://www.kernel.org/doc/Documentation/timers/timers-howto.txt

> +
> +	ret = wait_for_pll_enable_lock(pll);
> +	if (ret) {
> +		pr_err("alpha pll running in 800 MHz with source GPLL0\n");
> +		return ret;
> +	}
Would that not be SoC-specific information?

Konrad
