Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DABE6B181D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 01:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjCIAsk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 19:48:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjCIAsj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 19:48:39 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9FD25F217
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 16:48:36 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id g17so283962lfv.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 16:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678322915;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2a30P1PX6QOf+PchF0vzQzUBOZcpznkObjqEwkUH+Tg=;
        b=Z2BTVDSLBXdlgfzUjVXJ9GWHe69ZXR/qHA3CEJRl3Ddv5xkwsn0Fke8wKFM5TET3ui
         PbKC0xuHmbAoOdUBo1SZl08Q83Da2XCGJiaxLwb1eqhdUwbv2xBnPoo8XnSpsjBDLprC
         XqLS5kOMGfOoUvYR4Bl8h/HJddp1LlZGKAs7igWtdA12MaUp0+N21J12AvT+W5wIs3RI
         u7w69r29KZlg9G7PmomTdzgezfegc9tdD75niO4N7CFL5foTHdrRd7o2IrvI+EvQr/ts
         K8d4U0e+KqlX5lD5kEWEUDMsfBQNG11rkA28p9Og3ixvDkdRG0HLBTCL9zdd/LyBJzbi
         4n2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678322915;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2a30P1PX6QOf+PchF0vzQzUBOZcpznkObjqEwkUH+Tg=;
        b=QcV5SmyGCzlvVEqF9ei4ck6xkP0SUINjmZqIQEViYM8i5fZjvah8nvhdCOLFQ/kfkW
         zsOHL9POTi7I1ct2p74+SinXS5FT3jiblvn6rrE1rAsc4a6MvrFvv7sBb2LyH3oQk0tu
         hwtjXMyMOu5UbSiGnTi6WxM3MGemQwYYrw0kd1EWLtu8AgZl/jqXy5aHPX24smfYrLRd
         p2gBVV0kwVeM5D3Pgv5yAwtUQxMjCL4qKmqoFfqgEfjy5XKn8B00v0XjcDvaRMU92+dE
         n3vI2cKLXMDkiSPjPePlM6+1TtRvepSNhi5se9bGlsDVKmRek+rCv+K+9n9BUkeltsrE
         Lnmw==
X-Gm-Message-State: AO0yUKXElRxEJpE34dHxUcbKoKszRTMEDWI+QQsnTWMOmq9Z9k6DH2pw
        mAgwwijcnz3Q0eJaxVbo3WEf0A==
X-Google-Smtp-Source: AK7set/YMMFE8EPJ6+fLX12pNe/yV/KCTANJ/Pe9Q6gRWKjPlKGmgcH8k6wanfzNA/5Oqk0XxsKrDQ==
X-Received: by 2002:a19:c214:0:b0:4ca:98ec:7d9a with SMTP id l20-20020a19c214000000b004ca98ec7d9amr5333013lfc.15.1678322915093;
        Wed, 08 Mar 2023 16:48:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m15-20020a056512014f00b004d34238ca44sm2473354lfo.214.2023.03.08.16.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 16:48:34 -0800 (PST)
Message-ID: <3d4a0cb2-e9b6-68a9-f844-4bea89f8a9b0@linaro.org>
Date:   Thu, 9 Mar 2023 02:48:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT v2 03/14] clk: qcom: smd-rpm: Add .is_prepared hook
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-3-ae80a325fe94@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-3-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/03/2023 23:35, Konrad Dybcio wrote:
> From: Shawn Guo <shawn.guo@linaro.org>
> 
> The RPM clocks are enabled/disabled through clk framework prepare/unprepare
> hooks.  Without .is_prepared hook, those unused RPM clocks will not be
> disabled by core function clk_unprepare_unused_subtree(), because
> clk_core_is_prepared() always returns 0.
> 
> Add .is_prepared hook to clk_ops and return the clock prepare (enable)
> state, so that those unused RPM clocks can be disabled by clk framework.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> [Konrad: rebase, don't duplicate the enable func]
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index ecacfbc4a16c..cce7daa97c1e 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -438,6 +438,7 @@ static const struct clk_ops clk_smd_rpm_ops = {
>   	.round_rate	= clk_smd_rpm_round_rate,
>   	.recalc_rate	= clk_smd_rpm_recalc_rate,
>   	.is_enabled	= clk_smd_rpm_is_enabled,
> +	.is_prepared	= clk_smd_rpm_is_enabled,

I still suppose that prepared and enabled statuses should be handled 
separately. Otherwise CCF might get confused about prepared-but-enabled 
clocks. With this patch in place, it will treat them as being not prepared.

>   };
>   
>   static const struct clk_ops clk_smd_rpm_branch_ops = {
> @@ -445,6 +446,7 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
>   	.unprepare	= clk_smd_rpm_unprepare,
>   	.recalc_rate	= clk_smd_rpm_recalc_rate,
>   	.is_enabled	= clk_smd_rpm_is_enabled,
> +	.is_prepared	= clk_smd_rpm_is_enabled,
>   };
>   
>   DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);

-- 
With best wishes
Dmitry

