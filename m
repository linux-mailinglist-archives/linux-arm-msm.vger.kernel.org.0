Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77B3572FE89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 14:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236343AbjFNMZu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 08:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244577AbjFNMZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 08:25:29 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38AD01FD7
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 05:25:28 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-311099fac92so615062f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 05:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686745526; x=1689337526;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6iG5vTOdWzF2uLO8FkovF7ShHOsamQjYeEGdvdvyCPc=;
        b=D5VWS3vk0HgW8LDAcGE7BQZKTJtIFTU2fyJhZFJzB2fyCfLBt1e7mvFizFfdPvkjuA
         sYkB86TEHdehY5mu38+NmNxcWnjtEHUU3bA5VB1sVl8iiAV3ETpl4mk1kOrLq1yrBKW/
         QQYqOfV7ULhEGyk90oNvgan6ePjNzLPa+gax189cAGgjHe6LAky2ajemkNFgaZXJemd7
         1O3HlJ0fTzXGMdrJjxGVqN+vb/V3ZHrauj3SDBmFi9IU4e5fvI6YhoVc4rBajLFl8QdN
         G0OOu1SYxNkAnsGgBTEuXVfKmZnBvt9VDkpFapWcHn8UZOxuUQS5MVefYywfxOpxtEhm
         RJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686745526; x=1689337526;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6iG5vTOdWzF2uLO8FkovF7ShHOsamQjYeEGdvdvyCPc=;
        b=eIWTRMohHJFYqcNp22x13bi45806Y+eCKU8qqTP2iyWH3++Dwa3NWQqFJi1Uy32nFi
         uGNLRBnrRHhl8Owg5EMc9CCfaReC+F5T+J5hsxRsReC9PMkGSoPvF3IKkEBJTUwo3fLi
         zYSpebNhSWCbnmCqnl3paQc0tBc2cswrXzbeUJWUblDKGv4WySEnUj+GBU2xCq1ZgTFL
         fVeLYB3kT+QYHQg8+xk2IH7aKlEx5TeJd4g2Mi5T26h56uil8DXEc5isY3VCh3Vt/JtO
         QHbg5i2OB4DBAm1vcLnFEWOrKtmaFpE2REqRy3B5tsnpvaTGudPE1S1vzGswD396Qfhv
         4Bkg==
X-Gm-Message-State: AC+VfDxiDZgiZi3zajsq6hlrntLA4+o0ARD8L5yPLSNumNmhVkk66H9q
        +NwTMiRplsI0HsBQ6MdYXIi5j+USh8rCa87niAa1Hg==
X-Google-Smtp-Source: ACHHUZ4b1hlq4+ngmHH2dYvVKpDzL+96FL9kDu7anUXdRx9Z9DD4wc+TS6V9DMBamdmIZyFXLQWJlw==
X-Received: by 2002:adf:e406:0:b0:307:9702:dfc8 with SMTP id g6-20020adfe406000000b003079702dfc8mr8934737wrm.48.1686745526648;
        Wed, 14 Jun 2023 05:25:26 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i4-20020a5d5584000000b0030fc576633dsm7421237wrv.16.2023.06.14.05.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 05:25:26 -0700 (PDT)
Message-ID: <ce4a3201-3d42-b6fe-9e1a-63ea74588531@linaro.org>
Date:   Wed, 14 Jun 2023 13:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/8] arm64: dts: qcom: msm8939: Disable lpass_codec by
 default
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230530-msm8939-regulators-v1-0-a3c3ac833567@gerhold.net>
 <20230530-msm8939-regulators-v1-2-a3c3ac833567@gerhold.net>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230530-msm8939-regulators-v1-2-a3c3ac833567@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/06/2023 08:16, Stephan Gerhold wrote:
> Update for recent changes to msm8916.dtsi in commit a5cf21b14666
> ("arm64: dts: qcom: msm8916: Disable audio codecs by default") and
> make lpass_codec disabled by default for devices that are not using
> the audio codec functionality inside MSM8939.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>   arch/arm64/boot/dts/qcom/apq8039-t2.dts | 4 ++++
>   arch/arm64/boot/dts/qcom/msm8939.dtsi   | 1 +
>   2 files changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8039-t2.dts b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
> index 2a39216ceef5..c8442242137a 100644
> --- a/arch/arm64/boot/dts/qcom/apq8039-t2.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
> @@ -135,6 +135,10 @@ &lpass {
>   	status = "okay";
>   };
>   
> +&lpass_codec {
> +	status = "okay";
> +};
> +
>   &mdss {
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> index 3c1505b69a6b..895cafc11480 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> @@ -1608,6 +1608,7 @@ lpass_codec: audio-codec@771c000 {
>   				 <&gcc GCC_CODEC_DIGCODEC_CLK>;
>   			clock-names = "ahbix-clk", "mclk";
>   			#sound-dai-cells = <1>;
> +			status = "disabled";
>   		};
>   
>   		sdhc_1: mmc@7824900 {
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
