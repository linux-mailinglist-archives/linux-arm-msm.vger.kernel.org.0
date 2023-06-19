Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD921735121
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 11:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbjFSJ5P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 05:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231722AbjFSJ45 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 05:56:57 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A2B6E66
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:56:54 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f62cf9755eso4045315e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687168612; x=1689760612;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jEB+6HRgDgKrgxjDAFwou0bm0SyjRLdUU0ZM4Yt8SJQ=;
        b=kHe8MPNWhdEi7bbibJpTjZkk7g+oJ32pCsTK7RyH8AY5dTYSMAaF69C6YJJvvYSfkA
         MFlXKtSHvRjCzmgOspNRJ52UWdQ1bDaCf9LFGifqyGH1BHbMOkqd6T6geoECm1xbsoJp
         rTp4xpYlAEN4wlGrTS+rEZuIfc2DXBKsneRBwRA1QbIPQ4XVP64a1Liu6gXXd/mBpEz9
         EZm5+Qa01pwgyc+34ThHIY0tsELW6FVI8CxfdKZfLmAiSsISIu0jfMjF9Q+SbMKCyjeE
         O+G+cCoZnhXR4sOEJflmoabqkvwHqePzRk5LBvJQDePqWppd/s52ifPGUQ9wb1bZ2J7L
         sqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687168612; x=1689760612;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEB+6HRgDgKrgxjDAFwou0bm0SyjRLdUU0ZM4Yt8SJQ=;
        b=W8IoRtStAdFrT28OKfmXGCC7dOWggfMcwN+1NadaUgg6VEKPkDciJvSvPvvbwXNKfB
         esjsreZXMrnDeeYBkqHjtBWJ0LQXxkP4h6zZ+d+zV48ne55cyXi2VDp69H5hdUSHSC5V
         vZ4lorYFGqRP0M9lhM0j8IvfzH3qWF2IHzB+owAg5klcUt/ZCFugRxGSdLgRmaYf112k
         N0U0rqddFVkctSgOLwTk2pUCbxsYmMQTt3nbUWyVqM1RoP6WZk+pSBPlJAQct4XYhHQh
         ZA43EZkRBe/SnFyZbWXb2BmYK2Aemeddu83eCNeDuLpX4q6WMEjDwpmnbXUpEyPpoXY+
         lFDQ==
X-Gm-Message-State: AC+VfDzs3cIFnKMEZBNBCrjFQ7AzjvwZVneGfIvxdW4gyTjDO4rHAboD
        ris6lInYB9v15JiucCLMP9al8Q==
X-Google-Smtp-Source: ACHHUZ53S7dP0hAu3ZhG+uHhwky//K+M3G3ddJkMSQC8DJMNmbGf2zOTPrv7rG0KK8YVOJ52+OO5PA==
X-Received: by 2002:a19:6544:0:b0:4ed:cc6d:61fe with SMTP id c4-20020a196544000000b004edcc6d61femr4670418lfj.24.1687168612307;
        Mon, 19 Jun 2023 02:56:52 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id c26-20020ac244ba000000b004ec8b638115sm4173747lfm.193.2023.06.19.02.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 02:56:52 -0700 (PDT)
Message-ID: <32fcbd97-f37a-0792-eb7e-f80f0dfd0fee@linaro.org>
Date:   Mon, 19 Jun 2023 11:56:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sm6125-pdx201: correct ramoops
 pmsg-size
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20230618114442.140185-1-krzysztof.kozlowski@linaro.org>
 <20230618114442.140185-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230618114442.140185-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18.06.2023 13:44, Krzysztof Kozlowski wrote:
> There is no 'msg-size' property in ramoops, so assume intention was for
> 'pmsg-size':
> 
>   sm6125-sony-xperia-seine-pdx201.dtb: ramoops@ffc00000: Unevaluated properties are not allowed ('msg-size' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Downstream copypasta

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> index 2b4840446cb0..9e44ac229619 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> @@ -79,7 +79,7 @@ pstore_mem: ramoops@ffc00000 {
>  			reg = <0x0 0xffc40000 0x0 0xc0000>;
>  			record-size = <0x1000>;
>  			console-size = <0x40000>;
> -			msg-size = <0x20000 0x20000>;
> +			pmsg-size = <0x20000>;
>  		};
>  
>  		cmdline_mem: memory@ffd00000 {
