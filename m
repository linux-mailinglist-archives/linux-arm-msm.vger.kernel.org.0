Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC2A65BF77E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 09:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbiIUHTa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 03:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbiIUHTX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 03:19:23 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 861AE73921
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:19:21 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id cc5so8334304wrb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=E6f+URSdOX05jCBtwcXT8Rm2Ummjdbd9pwKRLdE+3/Q=;
        b=e6FCHYiWX/YiGw9hnCUu4ucp+blseaG8xhAH+iFbbu8fBpmcHIThynILwHqc3tglLW
         bL8BzDFNpBk6dO0zUm1dsCGInrNRT8sPLnRWp5mMhOU32kL621xrgnfDHX1s+fo6rqxy
         Y+U1YzodHWqNQPCRWs1WfG/BZWr3XsRLG1+JoEBmgnRS1oDr+Hn+twtbfojmqRPY1gYE
         3h9cx7iHymtrjV7mY8z3UwMbq07Dktek0O8pDnTvJ7F/ThNP48b0fTAihyxDA6E0LDmv
         /xo+yefKGLRtCNXNqs3gRhrov4Kg7KvRrgFWAa0whEEG7tdKecnDNnf9uXZGw48PB8U1
         xN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=E6f+URSdOX05jCBtwcXT8Rm2Ummjdbd9pwKRLdE+3/Q=;
        b=8G81hCyqCVh5SJF2BHjng+BW97bqHKW0pNHZYHKVEeq4rxnHT+L+zCqypyoFJK0trf
         ltvYiQ/9rvI/zbKgK+20Y/y5m5K8TmFCKtzOfhGeIQkunsV4PCQBAeb4ED8wQbUUZYyf
         1vAsY5WAv2MOVoGfhPR+AX9zNxi3RU8FRfcoOS2+iOpo0BM+3Juh48Fgd/R5RQ9vG12h
         c6i7ZyCr5qPx+ka7ASRTsnxfyobeHzEYjg/kzica4tWOO+TnJoNEZ4+KQRRUQH5lMbMc
         sFSve+7R3PL9RTqrj1DAar3gp+Zt7ijfHi5Sc+LaCgalpV5m/XYu0gI7LT/ESU8B1fy2
         qUew==
X-Gm-Message-State: ACrzQf3wruXCVhveb9skkETVQAPpPaOwxNSfKPGZCfPO811ihEldmEXQ
        mBqps5kSY65BAPgkX7GB1HjPzg==
X-Google-Smtp-Source: AMsMyM5hIRfNw0jpDUXcuH3Ju/IpGBuQ5fddogkkUOJUpeUZkCIeoi0sQ98v1nRtIfDZ/iAizXdVWg==
X-Received: by 2002:a5d:4a48:0:b0:22a:e55d:535d with SMTP id v8-20020a5d4a48000000b0022ae55d535dmr13418791wrs.308.1663744760016;
        Wed, 21 Sep 2022 00:19:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8ce3:ff4e:ae9b:55f3? ([2a01:e0a:982:cbb0:8ce3:ff4e:ae9b:55f3])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c154c00b003b4931eb435sm2044258wmg.26.2022.09.21.00.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:19:19 -0700 (PDT)
Message-ID: <e012e586-286d-e553-8c13-97feba66c80c@linaro.org>
Date:   Wed, 21 Sep 2022 09:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] clk: qcom: rpmhcc: add sdm670 clocks
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220920223734.151135-1-mailingradian@gmail.com>
 <20220920223734.151135-3-mailingradian@gmail.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro
In-Reply-To: <20220920223734.151135-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2022 00:37, Richard Acayan wrote:
> The Snapdragon 670 uses the RPMh mailbox for most of the clocks used in
> SDM845 but omits two. Add clock data for SDM670 so the driver doesn't fail
> to resolve a clock.
> 
> Link: https://android.googlesource.com/kernel/msm/+/443bd8d6e2cf54698234c752e6de97b4b8a528bd%5E%21/#F7
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/clk/qcom/clk-rpmh.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index c07cab6905cb..82d87a0602fe 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -382,6 +382,26 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
>   	.num_clks = ARRAY_SIZE(sdm845_rpmh_clocks),
>   };
>   
> +static struct clk_hw *sdm670_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> +	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> +	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
> +	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> +	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> +	[RPMH_CE_CLK]		= &sdm845_ce.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
> +	.clks = sdm670_rpmh_clocks,
> +	.num_clks = ARRAY_SIZE(sdm670_rpmh_clocks),
> +};
> +
>   DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
>   DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
>   DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> @@ -715,6 +735,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
>   	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
>   	{ .compatible = "qcom,sc8280xp-rpmh-clk", .data = &clk_rpmh_sc8280xp},
>   	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
> +	{ .compatible = "qcom,sdm670-rpmh-clk", .data = &clk_rpmh_sdm670},
>   	{ .compatible = "qcom,sdx55-rpmh-clk",  .data = &clk_rpmh_sdx55},
>   	{ .compatible = "qcom,sdx65-rpmh-clk",  .data = &clk_rpmh_sdx65},
>   	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
