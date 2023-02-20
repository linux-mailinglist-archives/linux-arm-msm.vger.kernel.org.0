Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C77F69C7E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Feb 2023 10:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbjBTJp4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Feb 2023 04:45:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231527AbjBTJpz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Feb 2023 04:45:55 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2EC613DD3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 01:45:52 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id s22so844284lfi.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 01:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IVZVTrISVfToJ38Ubz2se/iuQvK1/cb+dyYHoraOOD4=;
        b=dbJbqIrojKHSpY4zAPnffHOiT5FaaFmzu+Gt6V/dTg+RyNshLG4xkfHP4M55HhZZrP
         1NoJbDaFUZlkzh2yymeFTJbSDgkdXJdp1DNv1kTgf5cRLUUdDZrcbJOZ1eETCnt/EsFC
         2iLlpVjaKe9xw6tVk3qXm5JUs+w43Ni7ZSHvxmuSqOWljBiyQDbWoE4K6fnVBbSGGSO+
         AxY+ZFTZKN3Sf+RkuQhYdFseQWdMc5aiEKRz+zZUOGgT6deprHB8pGRzl5tA0NohOzt2
         gQchXy32BzbVA6IxwrWFLaqcvK3yJ4eAILQtvlqglSY8Bbs3KEbT3b/gHr6hkQ7RoGut
         8g5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IVZVTrISVfToJ38Ubz2se/iuQvK1/cb+dyYHoraOOD4=;
        b=4bvzzQNO0ayBh0MDz4APo05d/8iu9lr/PHFcqKvJtQwgAnH5CPn4LW/ldsSHzSjdS6
         3Mes7aJckaRssNS9ODqMM7v3RBUm16V3v+S3VSjE540KmYgnfmbENgjkotDBxZQlDGTT
         VlTn11Oeotqi7S9i/dtXl+wPdLgJLQJwh2R2anHl/8S77yuOah5GFFHiqMm32iELY+Zs
         fRWUDQTAbxgDP2GKBpT/H9uvmp/FW2prIF3wiZWqe5e0svNy4S4wsowQrXD74DjdJWj3
         TenrxqTS9ed9/2nWwrOqmabCaeWAmeKmOAur8emj846LFA1VDK8TmAWjPF8Iw0uF6CnS
         cxiA==
X-Gm-Message-State: AO0yUKV67t9WR4uBrU/fjhR/2yjzRgqFZTDSeKdSxlDFKU79aUkHsP+1
        U91Ga0WxpF2z+vLi4DZstOvY0Q==
X-Google-Smtp-Source: AK7set+qhWV9WJNSt4Qa+5pNppVI75lSFA9WYHiZ7tIo3UbICi2RPJtEuG/EHdgrS9DxJdK4CUMrxg==
X-Received: by 2002:a19:740f:0:b0:4b5:7762:5df2 with SMTP id v15-20020a19740f000000b004b577625df2mr373657lfe.36.1676886351246;
        Mon, 20 Feb 2023 01:45:51 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
        by smtp.gmail.com with ESMTPSA id f14-20020ac251ae000000b004db3eff4b12sm1471522lfk.171.2023.02.20.01.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 01:45:50 -0800 (PST)
Message-ID: <149b32d8-515d-2e9d-c3be-5ec10f47a432@linaro.org>
Date:   Mon, 20 Feb 2023 10:45:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: apq8096-db820c: fix indentation
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230220094339.47370-1-krzysztof.kozlowski@linaro.org>
 <20230220094339.47370-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230220094339.47370-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.02.2023 10:43, Krzysztof Kozlowski wrote:
> Correct indentation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> index ce189dea2760..eb18811b2676 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> @@ -1070,7 +1070,7 @@ cpu {
>  
>  		platform {
>  			sound-dai = <&q6routing>;
> -	};
> +		};
>  
>  		codec {
>  			sound-dai = <&wcd9335 AIF4_PB>;
