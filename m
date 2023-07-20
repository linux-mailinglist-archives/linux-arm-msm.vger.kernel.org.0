Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D64A75B3D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 18:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbjGTQIS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 12:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbjGTQIJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 12:08:09 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA0AE74
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 09:08:07 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fde022de07so586166e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 09:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689869285; x=1690474085;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aXvy5ZC1HOxeejpe4siA1tnVneLqwXtPQ5iB8GhYx/k=;
        b=kwiAwKtkmCZlWdDovbreCPXgueUAsxe/nsUj9CcVLkfyhwwYzntbckVyb1SSvXcLan
         1qW/3OFDboJ6ph77z/8EY0lQhmjtLl0Zg027tZQ7SEBqIoG4f9hII18Pv0MjTi2MTk4W
         lXYzzCqg0Ahzl70KTIITUW9kWeBuBp4noHEg/Bq11iaYBmENnrB/ymmNM00ZXObKYhid
         UHVXi5EpDLymAlfEXLrgbvOHLbYyQNcxv+k211YKKSDDCeGN1nS6feHoxBryHXrAzOjt
         EpA+eBcjLFXf6t+LIWApQAMwq/ld49K0RzVBzUE+XTdU90zHB61q0Zg79Q7dy0j+NTuT
         xizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689869285; x=1690474085;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aXvy5ZC1HOxeejpe4siA1tnVneLqwXtPQ5iB8GhYx/k=;
        b=PKy5vhVtxFl+3B7vSvLIcuyTyxKrzWEuI/sUS8QA4F7VBwnRUJjrdYnZNe5J4fXZJX
         wEIerkKFtgAhusp/h6xOvB13iZAF6zEKLHkMFtrkYLAVaufp7L8z/dgw70vwuteWnQMv
         MbPhLb5fj+373T9dxDjLPcMIiSgV7Urm/NaVGbrfHUVcUdnVOwCzZZj0iPfZfTqM1NPK
         KQX5WuTFGfnaZAZw9ldO0xsBknbEHCRFGKTlJjLgBPN7FusApMDnEKydKRJcMc/pqPwb
         CtZ1TIWWYfsrOyXqeYDGDOqDa0kC2mTGZxRTSbJv+txuTMAmQgfko2/V9iJcjXYBZoEY
         TUDA==
X-Gm-Message-State: ABy/qLYeM7T2gpriKOEZaUGA4KMwkIUEZmjNbYEYsgpLXxQr5N/0OzrV
        UdLhPuYRJZ3n/gApMDkcIFaaKCmRng9Pn9dmr18s+A==
X-Google-Smtp-Source: APBJJlGKvQoBcib8DKD/y9Wc/LkdvC52HopIr7MqwgHWGpSO0ksacRWg4dgb+axR47TowdRlrIldUw==
X-Received: by 2002:a05:6512:159c:b0:4fb:89bb:ca19 with SMTP id bp28-20020a056512159c00b004fb89bbca19mr2091910lfb.66.1689869285421;
        Thu, 20 Jul 2023 09:08:05 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id h22-20020ac25976000000b004fbb821959bsm265474lfp.303.2023.07.20.09.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 09:08:04 -0700 (PDT)
Message-ID: <d68cc9a4-d4a4-17b1-c6fd-d128b82a818e@linaro.org>
Date:   Thu, 20 Jul 2023 18:08:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-rcg2: Fix wrong RCG clock rate for high
 parent frequencies
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     quic_saahtoma@quicinc.com
References: <20230720083304.28881-1-quic_devipriy@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230720083304.28881-1-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20.07.2023 10:33, Devi Priya wrote:
> If the parent clock rate is greater than unsigned long max/2 then
> integer overflow happens when calculating the clock rate on 32-bit systems.
> As RCG2 uses half integer dividers, the clock rate is first being
> multiplied by 2 which will overflow the unsigned long max value. So, use
> unsigned long long for rate computations to avoid overflow.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index e22baf3a7112..42d00b134975 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -156,18 +156,18 @@ static int clk_rcg2_set_parent(struct clk_hw *hw, u8 index)
>   *            hid_div       n
>   */
>  static unsigned long
> -calc_rate(unsigned long rate, u32 m, u32 n, u32 mode, u32 hid_div)
> +calc_rate(unsigned long parent_rate, u32 m, u32 n, u32 mode, u32 hid_div)
>  {
> +	u64 rate = parent_rate;
This should not be necessary.. You're being passed a copy of
the original value, which you can operate on.

Otherwise, LGTM

Konrad
