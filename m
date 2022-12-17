Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E355F64F9C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 16:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbiLQPQv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 10:16:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbiLQPQr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 10:16:47 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A8613F9F
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:16:46 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bf43so7748367lfb.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sdCuqxHb3n44bHgmX4xKgo7Ya1cdTdkrnUB0QPiyggE=;
        b=x1ThgDXJI7Wriv6cPdpqZtIkAGEFdRGR1rruha8nNKJRHBKnhXunGN3DNw7EvC5dwM
         OaEHzAb5nvEw4oi8h/Q5GPz4JpgII4uQWT5XDdjlJRahOzvDEVViG9mqWt7fREaGuClA
         kS/1prjPiLlhUuNs0eyemIMmpNvdqmIhunpyAUswX7ZtV1G91RHSb/8MYw57AChLLoRF
         GZlD9BFxDXUkxhGXSyd1H1KmoTjud67DZS9Ms2aIOGBrlw8XhMAHW/TE9+7E8cbuPHtm
         Sz9DQdpXKhqv7mARXV96f8GCB5tfl9iOovLfeX7fuK/jGikwQqJl4I2BkU6E/7I7Lydd
         kY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sdCuqxHb3n44bHgmX4xKgo7Ya1cdTdkrnUB0QPiyggE=;
        b=tPmTFdM4d19B8ZiN1lo1863+lFVFwaTZFBq7tTjz2eUa4sXEEIvwxbmRKyv0Gmgo/G
         U6gSmWykpslNNPORWicXnWIur6kasWJD8XM/TWzM+17rYEU5/5RpiExXXcqohVifmcdv
         vg9Bypt67Y2ktlqdgXqFiNFlHInq+dHduLds2LOH7bzQ1PNbCdXHFaR0bZt6EBsdLVF6
         80e9L4cVVYGdDlX3vOGcphHTgz3ZBq77vUt78rCEPJF4ZYYvgnHMpd5bps75XyxzFPZB
         7LRxsCxLCOxpWDPqIvL412tgOEtNzxf1OxjUnMK60as3fWVyV1i80/WN1cmQDCWcIwGj
         v8Fw==
X-Gm-Message-State: ANoB5pkN/7KNU1Ozd4GbtjLaWfVC0+OEC/I9OQtNFbpbgkUqWbOJLY1Z
        QIU5MteMKFb7WpMezsHwUdi9oA==
X-Google-Smtp-Source: AA0mqf5zNke67lY2UWhQNLP9BDPz9J85h1BRL4DxzfU7fMypeJ+bzkZHVE3Jq3DBufeeWUmhqINCNQ==
X-Received: by 2002:ac2:44a4:0:b0:4b5:8504:7072 with SMTP id c4-20020ac244a4000000b004b585047072mr9248570lfm.14.1671290206387;
        Sat, 17 Dec 2022 07:16:46 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id u2-20020ac24c22000000b004979db5aa5bsm535838lfq.223.2022.12.17.07.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:16:45 -0800 (PST)
Message-ID: <26115ec3-a892-5040-049c-92ee19c28df0@linaro.org>
Date:   Sat, 17 Dec 2022 16:16:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 14/15] arm64: dts: qcom: qcs404: add power-domains-cells
 to gcc node
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
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
 <20221217001730.540502-15-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217001730.540502-15-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.12.2022 01:17, Dmitry Baryshkov wrote:
> As gcc now provides two GDSCs, add #power-domain-cells property to the
> gcc device node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index ffc4b081bb62..b72542631337 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -729,6 +729,7 @@ gcc: clock-controller@1800000 {
>  			reg = <0x01800000 0x80000>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
>  
>  			assigned-clocks = <&gcc GCC_APSS_AHB_CLK_SRC>;
>  			assigned-clock-rates = <19200000>;
