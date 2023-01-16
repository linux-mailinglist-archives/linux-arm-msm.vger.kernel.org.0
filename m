Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8873C66C24A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 15:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbjAPOfU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 09:35:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232475AbjAPOfF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 09:35:05 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B73051008
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 06:15:14 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id f34so42889722lfv.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 06:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CwWy52CuSIZ9eeAn8m8F4RjsGnVyeTFSxR7ttkWFgbc=;
        b=ji55DZWAclT0NfXHWD303ChamS+f7PR4Lw5pAEjqzKWaWS+BsPBM6A7kHRO/Znlj7l
         lxj8UWk2RLHKaJaRg1knZiKGhZm+cVhjd2tj9K5NA0yHIUTuj4reBFZZ7vukP4zEdYxK
         1GO6/l7/651rrIleSh4VIL60XTO9gC521dwVBfr00w4bgLIozbGFM7UK/sxb/U0ebumR
         j/vfbBh+kjZfG5olSzZh21w/cquXFcTbWxaTu51hZrFKYRVzRpleYnngNgGhckGTIlk7
         m31DBlEbkL2XUmjOeOKwE6ZJO4TlbA0Qv7oCUVQ80oxtdwLWafujhB6kTMxSp1eykzhA
         DPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CwWy52CuSIZ9eeAn8m8F4RjsGnVyeTFSxR7ttkWFgbc=;
        b=rbqoSFR6Xr9ZIf0fs5TX2lBQ5eZTS0/tgFeqXyk1jQwDi1NI7NACxJkYFiBS6XloxD
         M3TOp5c8UYr4+fcPUw4z3+fxWWivOf4HIb5DTe0m1OzvqBaJp7yUEMSgDDA2A1WQOps+
         vlbzov4zfk+PaEyZBJEbnjx88PbgbodQyfojPIuf7iwOcVZMd4EbEUzCH45zW3Ok9vFi
         iz/3X/3Vg6AVof+9Aj2im9Tj/43ifF2ec797u2I/L02CXk/35JzMfKdhZ//XVGlgzu+E
         N6t0P4xhF4xn2/Fc7TD9O4NmRY2McsCiSry2Qg3114k3qA9Oz/yxgRRntn+H4/DLDGTA
         MU/A==
X-Gm-Message-State: AFqh2koQ17m6SEZ5NhO9BVtRx07Y1mhcoZcedWe4lqY2fG52ARB6Sa/m
        dAGWj3u2eN99/ooeqZLT+WGKzHk6BpjNu31x
X-Google-Smtp-Source: AMrXdXtvsGUapjXBIvvMOjjcI8t13mJHnthpf1KoQB0yhdkbdaQS+os+FXdJ3ObnXejoWhEHBkSpHw==
X-Received: by 2002:a05:6512:340e:b0:4cb:35dd:e58e with SMTP id i14-20020a056512340e00b004cb35dde58emr15727231lfr.49.1673878512524;
        Mon, 16 Jan 2023 06:15:12 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id u3-20020a056512040300b004d1454463basm1442136lfk.94.2023.01.16.06.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 06:15:12 -0800 (PST)
Message-ID: <ab07ee73-0ad4-769f-cb3b-445f7a2cf089@linaro.org>
Date:   Mon, 16 Jan 2023 15:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630: Don't use underscores in
 node names
Content-Language: en-US
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230116141337.469871-1-konrad.dybcio@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230116141337.469871-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16.01.2023 15:13, Konrad Dybcio wrote:
> Rename the reserved-memory subnodes such that they don't use
> undescores.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
Ignore this revision, I didn't click ctrl-c quickly enough..

Konrad
>  arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> index 0259e90aad1c..763b1df692f2 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> @@ -133,12 +133,12 @@ ramoops@ffc00000 {
>  			status = "okay";
>  		};
>  
> -		debug_region@ffb00000 {
> +		debug@ffb00000 {
>  			reg = <0x00 0xffb00000 0x00 0x100000>;
>  			no-map;
>  		};
>  
> -		removed_region@85800000 {
> +		reserved@85800000 {
>  			reg = <0x00 0x85800000 0x00 0x3700000>;
>  			no-map;
>  		};
