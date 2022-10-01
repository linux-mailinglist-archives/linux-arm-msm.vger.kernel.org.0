Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC985F1B7C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 11:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiJAJko (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 05:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiJAJkl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 05:40:41 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3728D4457F
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Oct 2022 02:40:34 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id q17so7105655lji.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Oct 2022 02:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=NebNzeTAVEp7CE6tFGPFunqG+0G/HzUEgf53nY4lSIE=;
        b=vSkY4K5Xfe6Oij89OPIvlgxqqQJzUR06AundST6WuAPp5lAZAHTDP5aJHrDsZ1Lx1G
         UyOJ7A3d1W7Cyl645Ao41H2Rbsx0sdRJA5UckhqQ1R5S9RVr+KXShJyFo6yV5f178p5w
         RL/820eF3JNLta0mg6aTVq+sC575+7TDy9FVB8tel+eLBT1JKbV902jVy24S0Y/N+3/D
         Klh47gW4zUC0F3Ud9ORdJRxYCqVyKpVX/hQhwZCQI0/KDHNm58JztO4xpUxGBcrlK75y
         A1lzAvmB9mEIn+9ICBpiq9jb4e3ghjucMuksmVhtwaNcthJvjRi2reUDicxZMRUuFwrd
         9nHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=NebNzeTAVEp7CE6tFGPFunqG+0G/HzUEgf53nY4lSIE=;
        b=C204KYXwWLtQSf3V4JMK1U82CrH2WSzWVM3c7NupwB/MbKLrkR3QYRtAuhbypAu1Pz
         aGpMVQjJRzcDg/5YbJeLCebILDkzGERM0O0pLk7aFD9JONu+ym7kGG9cT6z5snc5IvLH
         ctEr+0n5BYAswDUkRBihLCOSZaJS8f2bXshy70HzSsrAm3BOPivzixsZKSKtzjw3kjNR
         QnR5yAzRJ05YZ5+i8sb+lMntUVnJ0LRdSR9RFqcNgPru5ONOg35cTjsACbIXyh7vHqXJ
         XrHF6qijboYabqoCfw/VuJkXBTcRK2hJBtu3KV9mNeDK/hgv20EsnGlPeKJm3amfY9/J
         YHEw==
X-Gm-Message-State: ACrzQf0udZk1zR+4Bk/SYPwRE4QHErpNkSH6PDooaAHZcdK/6CTbL44x
        c41DNWKMZ6+Avejn1IMV+Qr9kg==
X-Google-Smtp-Source: AMsMyM53ZwQ4w5c04teeXRq1TuZIiYrQFnkVu1piGvNVGGxXU/MmaQy98iKvPoKL3mz772Xnc/hMTA==
X-Received: by 2002:a05:651c:510:b0:26d:ca05:c4ee with SMTP id o16-20020a05651c051000b0026dca05c4eemr973746ljp.93.1664617232913;
        Sat, 01 Oct 2022 02:40:32 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n5-20020a0565120ac500b00492d7a7b4e3sm711730lfu.4.2022.10.01.02.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Oct 2022 02:40:32 -0700 (PDT)
Message-ID: <b3b2dc79-30cc-a768-e7bb-d5e8ff3f6ba0@linaro.org>
Date:   Sat, 1 Oct 2022 11:40:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] ARM: dts: qcom: mdm9615: drop unit ids from PMIC
 nodes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
 <20220930212052.894834-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930212052.894834-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 23:20, Dmitry Baryshkov wrote:
> On MDM9615 the PMICs are connected using SSBI devices, which do not have
> any addressing scheme. Drop the unused unit ids from PMIC device nodes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-mdm9615.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> index b47c86412de2..bb17a57a2b90 100644
> --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> @@ -283,7 +283,7 @@ qcom,ssbi@500000 {
>  			reg = <0x500000 0x1000>;
>  			qcom,controller-type = "pmic-arbiter";
>  
> -			pmicintc: pmic@0 {
> +			pmicintc: pmic {

I think several other platforms, also with PMIC over SSBI, have the same
problem. If that's correct, can you fix them in the same patchset?

Best regards,
Krzysztof

