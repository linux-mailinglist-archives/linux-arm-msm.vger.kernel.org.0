Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF87F65D095
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 11:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233995AbjADKZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 05:25:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjADKZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 05:25:29 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671AC193FB
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 02:25:28 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id z26so49760289lfu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 02:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SkvlyIDBBLE3c6VFSzp/qwH9+7yXujGKr61f2e7e0Tg=;
        b=oaT+YCsmoamerfi2Hp0NJNqo3mIXE1XpficzOTHmOVFkxqRGVXkKxWPKKm0A6/ReRd
         072n1gard7TQhUoco6F0d27gznrJ+E6XX+tA8Frtpehy7KPDGdhcpqGtbipzdRDbBZK1
         HAi1R7xChIG9UOUBiwPxrfq75mEtIagT72BqBWr+moCWlUaoDtoN4an4zPg6IcJiKJd8
         koSjs63rMAi1ErR541M0Xxkv7MCSjLP3/IiEg8ISH5m6qEvmLSuDrGZgT7h6FxugkLWN
         ZRLorkfdwhn28HQusEpjSy+loqnowehgxRIstMn34PVyHESEbUUDKLty9lfIrmSdiu6M
         CdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkvlyIDBBLE3c6VFSzp/qwH9+7yXujGKr61f2e7e0Tg=;
        b=IMzFgtJqBw4B96mRNF8L1nG/ydt0h9kpM97D3XeMKzAQSrXQcZZJ29h6LX++e2GMMA
         IFCj8PGkru9LNSnOLwLFz0Q/ScClGXH1T3S5fQic7FjYUBQSYUoEIEJ/TJBIXucX4UQ1
         mvOm4IFTW7NyzI0k1bReNRYfMf+yN4xKlgSIVjKVk/UIUo4TwTJIJuWKdX9icR9M6ZA3
         kLzEnti8t546x1WDoCVA46RngRxmtOvLK184HanSIHfI7m/liljLhbp8xXcFkQzJ3AaN
         BkonuDS5OMoCOu0N6mkEkYH4WZekpvbbLmJNuJPrbCs+Ml/TcOWQmfrd/wtlaQox1vzS
         DntQ==
X-Gm-Message-State: AFqh2krur/8P6htMJSVOqAZycCb42f95apj5LhrubUBoXA41S7orAo/W
        1g406eyGtBBeTJnECvfVRGHfMQ==
X-Google-Smtp-Source: AMrXdXtV1E8poWSfqn0UCsPxNz4xnxOVwSfAs3RPxewRSgdlDsQOJ+iU9JaZ67jvbRsSLRqals4G1w==
X-Received: by 2002:a05:6512:e9f:b0:4cb:3b24:8390 with SMTP id bi31-20020a0565120e9f00b004cb3b248390mr2594744lfb.59.1672827926823;
        Wed, 04 Jan 2023 02:25:26 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id h13-20020a05651211cd00b004a2511b8224sm5031845lfr.103.2023.01.04.02.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 02:25:26 -0800 (PST)
Message-ID: <26c5c81b-2f94-cb84-3c42-60e2d43489bc@linaro.org>
Date:   Wed, 4 Jan 2023 11:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550-mtp: enable display hardware
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230104-topic-sm8550-upstream-dts-display-v1-0-aeab9751928f@linaro.org>
 <20230104-topic-sm8550-upstream-dts-display-v1-2-aeab9751928f@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230104-topic-sm8550-upstream-dts-display-v1-2-aeab9751928f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4.01.2023 10:18, Neil Armstrong wrote:
> Enable MDSS/DPU/DSI0 on SM8550-MTP device.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index 8586e16d6079..5b7e301cc2a2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -359,6 +359,28 @@ vreg_l3g_1p2: ldo3 {
>  	};
>  };
>  
> +&dispcc {
> +	status = "okay";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l3e_1p2>;
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l1e_0p88>;
> +	status = "okay";
> +};
> +
> +&mdss_mdp {
> +	status = "okay";
> +};
> +
>  &pm8550_gpios {
>  	sdc2_card_det_n: sdc2-card-det-state {
>  		pins = "gpio12";
> 
