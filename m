Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 263406569FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 12:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiL0LdY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 06:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiL0LdX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 06:33:23 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC2F6FB
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:33:21 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id g13so19231747lfv.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+uwmeC8cgwwNhOwqaWBQr6Qls/0UIDT6UTLmfxOw6Y=;
        b=R+ugUEyQS77A2PYAeNNxIs1XIgHvOTEZx+2vR4zx+FrLs5xDfMMa3AulwXPKyzl9j2
         /VEYdQLRauNmmq7VaXZIV2ZzY2jfJFj3w9dzuNleAe2pWwKmL9uEZ8L3orGkWntSxmDc
         vGhvdUxaOIYHDbTdwEX0L869h62oMQP5ROUrq671m3TQvmx10DVZ9ydqdRwp8CfSTHXr
         mHM10ddXEiwNqbhAfN+ODK7T6tWeZ6NzZyNwNTlZz3y/ngxc4S9lzNcCbqU1kjv7SJT4
         Tx+Ccw8vehCtNloVR0Dl73/SqSRsXCZq+oYOC5J5ZpSLa34ljTNZqmEwJa4RfGssK8X5
         N2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+uwmeC8cgwwNhOwqaWBQr6Qls/0UIDT6UTLmfxOw6Y=;
        b=zK8LJ025EtAvXvU9DIAEhNkRURhGUDsKC0+0jSGsEVCYkTAJhMN4AoGmgR//F6Lhmj
         QH7VtgqCHpaPh8SICx+KC2YZ8YBXrwcwxtVo0tW2PCnY6qn+2OLuJ7RAy0eZb642EFgF
         n7sBVPqHQL9kO1bMmq26eRb8YliI7tJHvrDh5c5QYFTDYk5ovuzcYQ3meqaoyOdffzdV
         pZGChjkdNyh8slJXo3JtvGoj96MMuhRYNKxkqYiwN2mLj0AKeyEBxF2/i2yeQI33Oo7X
         05NLUq4iSH2puRwAuTHBm6mnxlnkGuSim9NC731fhb4ZFnE0ZJFXmKH9TPuTILi0+d4K
         wUZg==
X-Gm-Message-State: AFqh2koOVKr04YV/fnwEZLHYtohOum1AbY5bbTBbph2CAH48nUsz839e
        wdY3ZxperjG75qS5VpKWe+Rkqg==
X-Google-Smtp-Source: AMrXdXv+l9z4RnHC8eYh6g1MxUZacAJCU7efctHJRWdCKFPT3HsDfvdF+ppXe/VC9C+s1zDhqpZ+RA==
X-Received: by 2002:ac2:551d:0:b0:4ca:fe5f:bc0e with SMTP id j29-20020ac2551d000000b004cafe5fbc0emr5275440lfk.21.1672140800075;
        Tue, 27 Dec 2022 03:33:20 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b004ae24559388sm2199521lfo.111.2022.12.27.03.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 03:33:19 -0800 (PST)
Message-ID: <5c8b8aa0-3286-e46d-635e-7eed9bd3b13c@linaro.org>
Date:   Tue, 27 Dec 2022 12:33:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 16/16] arm64: dts: qcom: qcs404: add xo clock to rpm
 clock controller
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
 <20221226042154.2666748-17-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221226042154.2666748-17-dmitry.baryshkov@linaro.org>
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



On 26.12.2022 05:21, Dmitry Baryshkov wrote:
> Populate the rpm clock controller node with clocks and clock-names
> properties.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 9206ab13977f..4721b3139df0 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -230,6 +230,8 @@ rpm_requests: glink-channel {
>  			rpmcc: clock-controller {
>  				compatible = "qcom,rpmcc-qcs404", "qcom,rpmcc";
>  				#clock-cells = <1>;
> +				clocks = <&xo_board>;
> +				clock-names = "xo";
>  			};
>  
>  			rpmpd: power-controller {
