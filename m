Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D515A6D4194
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 12:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbjDCKJa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 06:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbjDCKJa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 06:09:30 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2674559FF
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 03:09:29 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id g17so37349849lfv.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 03:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680516567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lEKBIQMVSwi7thWGtQAMQlcGo3/5DT7we91ULSwa0lY=;
        b=zsO93/BXsw5KQimncatEXOZFyOcU8LDkmEDih+q3xT2EMWLwsV5LlJ1OErYxJrrhYv
         hYolkArUXzP1tZm4M1bZm3AYBzFV7HojQaNx3tEumtejRsZeJPrBhJsEOdVxe3RsuLOG
         7Xh8thaEFoT0wrgEaZf0jDB3uSNnYcIGCOF77x07q6zsnRGZMzGYEGcM0bbnlTFkgJzf
         HgE+E5qcrzWiQuOs842NRGZroqRi8ivNsAe2LgWlhukgRSw1qW8fz4v0Czz+Abjr4HNk
         IefRjAG8tmt0WO4dTxeX1H+g6frpFM1DgR+uNJFtlrbepX3tZ+tmQQr06PcbuJZAlk26
         1/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680516567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lEKBIQMVSwi7thWGtQAMQlcGo3/5DT7we91ULSwa0lY=;
        b=7Q74QoKkCWLUtVnc/i5TPl38p0UJH4OAe6x/zd19iI8BSOnWUkv+vNjPJxDbVtL8WM
         R0/+1Lwg0vdGu0MV6+DORrJ6vZMrDlVO0VcxHoGHF293dztw6uWNcfWYciGf1ewdZzlj
         lxDZl2DTEl/ukhry6/FUM+I2civwl9ACZX0ppSkQ6SIVl/aTAo43Kfc3I38CjzY5zEg+
         AJYWueKVabki2CVQ+lT57evX8nXKpYdUVEaZQZlelngIAihtEVnp7ndeal1uakuuCssg
         lmmLPTE+pbD9KAwYKmTIj131ChXZG/0Lu/YMQR5cTjuqz22mbVjLU2uXuwyd/8k7Kmp6
         N8YQ==
X-Gm-Message-State: AAQBX9cdM8Uh/Iww7NNbzYY3f71rXDRPvdieP93L6Lx5OaehJpK58RKP
        jBrEwVJyXFcdEnCimjgnDEJKuA==
X-Google-Smtp-Source: AKy350YJlSUS28rlZPFdnniaUqY7Rg6PwE1ZZ8qVKe/m/UYMOMzGbG/65uo81f6WkfTOqZpLkEIsCQ==
X-Received: by 2002:ac2:4903:0:b0:4eb:2b32:feab with SMTP id n3-20020ac24903000000b004eb2b32feabmr3303232lfi.50.1680516567353;
        Mon, 03 Apr 2023 03:09:27 -0700 (PDT)
Received: from [192.168.1.101] (abxj135.neoplus.adsl.tpnet.pl. [83.9.3.135])
        by smtp.gmail.com with ESMTPSA id t16-20020ac24c10000000b004db3d57c3a8sm1709326lfq.96.2023.04.03.03.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 03:09:27 -0700 (PDT)
Message-ID: <3072147a-c9b6-7884-9836-76164653c766@linaro.org>
Date:   Mon, 3 Apr 2023 12:09:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 07/22] arm64: dts: qcom: pmk8350: port sdam_6 device
 from sc8280xp-pmics
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
References: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
 <20230401220810.3563708-8-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230401220810.3563708-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2.04.2023 00:07, Dmitry Baryshkov wrote:
> sc8280xp-pmics.dtsi contains a copy of pmk8350 with one extra device,
> nvram (sdam). Port its definition from sc8280xp-pmics.dtsi into main
> pmk8350.dtsi file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Downstream uses the name `pmk8350_sdam_22` for this reg and
sdam_1 corresponds to 0x7000, with 0x100 increments. Was the
sc8280xp definition wrong wrt this, or do they differ?

Konrad
>  arch/arm64/boot/dts/qcom/pmk8350.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> index 455ffffb5f5c..26e40dbfc173 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> @@ -66,6 +66,15 @@ pmk8350_rtc: rtc@6100 {
>  			status = "disabled";
>  		};
>  
> +		pmk8350_sdam_6: nvram@8500 {
> +			compatible = "qcom,spmi-sdam";
> +			reg = <0x8500>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0x8500 0x100>;
> +			status = "disabled";
> +		};
> +
>  		pmk8350_gpios: gpio@b000 {
>  			compatible = "qcom,pmk8350-gpio", "qcom,spmi-gpio";
>  			reg = <0xb000>;
