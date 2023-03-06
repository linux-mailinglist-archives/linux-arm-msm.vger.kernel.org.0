Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 740B56ABD73
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 11:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbjCFK5C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 05:57:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjCFK5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 05:57:00 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C2C25B92
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 02:56:58 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id r27so12111870lfe.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 02:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678100217;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t16VJ8HN3i2Mxttb1V2YQz28AmL+/99D0f1GpXqEHuU=;
        b=dLgujvQz4qltbrfDfuCNPQISB1tezs52IbxJi2ndkui64xQxlY9BXjNmX5CF/5dFXj
         isBEqwL9n6chsJceaI3T21O/H5h65xzHGw0fo0rhJp1BthyyOc/HNWUX3PuFkbRaUccf
         ig457BgwN/KZXySmsRCL+z52SAvT/NL0h3qVKw88cjjtVim7FYGALVekrnHrOde1peab
         pw7XIxhG4NySGD69mYbpS3ppgdZouZoc9nnrPFLW0vn7bATDcgkjJmnABuRdVon8LzIO
         hrEniqQIYnnSnz/x6YR+9U91qiTVrpUfkY4Pb8/rSAxRh6FqJEHs8sYrdJCB+43BTmEE
         m8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678100217;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t16VJ8HN3i2Mxttb1V2YQz28AmL+/99D0f1GpXqEHuU=;
        b=JTccGpBvaOO3xbZH1+MNSd6M7+oVO3M+iCyWNSkUDqT2ZMAee1Jg8ofWYfiy7WQVFZ
         cghv5xHex+ATyfyDQwk7S7C0J6D2AzReuT+AuLHXV6dYsLb4IfcOu7KbUQDgGo4w0Lom
         9/gnWNMz4BJeMgmBMf370Ipf8xQmSMIlbuIOiVcUNd5m1YE6kqznwgHUDik21rCKIMKk
         GoKuyHMGs1mBPu/pKBj0ZDK1t+R0BT0KCCCpe9PU2zw+1Yjm/Vh8ptSxkrtfq9+tWyOX
         Oix7BbNlhXf2KSM2dNGCDrqGbWsaS6HaT1PQJSRTZMV4Z9aODGCqzpKKlFKFSjKijhEl
         JF1Q==
X-Gm-Message-State: AO0yUKUgIKXO3oWGL6rqZTPbWRz7F11gkEgKqarAwL2NNutMC+kpBBoo
        TTPHEC1qYsmepzgfA7ajYqJxnQ==
X-Google-Smtp-Source: AK7set9BEwHzuIsRJnewmr9Wn1WXxKvRQG/F70MHUYG1zPBNs7JV7KHYTUD/Fz+kviavtjFnUqmA6Q==
X-Received: by 2002:ac2:5dec:0:b0:4d6:df2e:16f6 with SMTP id z12-20020ac25dec000000b004d6df2e16f6mr2735079lfq.36.1678100216836;
        Mon, 06 Mar 2023 02:56:56 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id g18-20020ac25392000000b004d19e442d53sm1576841lfh.249.2023.03.06.02.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 02:56:56 -0800 (PST)
Message-ID: <586bafd0-5ead-83d7-226f-d26e46d44c09@linaro.org>
Date:   Mon, 6 Mar 2023 11:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/11] arm64: dts: qcom: sdm845-db845c: drop SPI label
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230305125954.209559-1-krzysztof.kozlowski@linaro.org>
 <20230305125954.209559-4-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230305125954.209559-4-krzysztof.kozlowski@linaro.org>
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



On 5.03.2023 13:59, Krzysztof Kozlowski wrote:
> The SPI controller nodes do not use/allow label property:
> 
>   sdm845-db845c.dtb: spi@888000: Unevaluated properties are not allowed ('label' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Doesn't even seem to be used downstream, hm.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index d4866feef2c4..acd4f9ca6c09 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -819,7 +819,6 @@ can@0 {
>  
>  &spi2 {
>  	/* On Low speed expansion */
> -	label = "LS-SPI0";
>  	status = "okay";
>  };
>  
