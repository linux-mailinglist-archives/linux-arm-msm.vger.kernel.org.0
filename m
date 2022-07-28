Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2B5C583E13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jul 2022 13:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235511AbiG1Lvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jul 2022 07:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbiG1Lvm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jul 2022 07:51:42 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D9D4240A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 04:51:41 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id h12so1685580ljg.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 04:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HngEx766XF0q0vilbt+l+gfmBxuo29lUMwZCzwVmrOg=;
        b=ebLs6ETxPmb6zA1+qdNVjmFzmg8yzejD43m6KTnTZpq96fKB+oh7kN+TRkHsGoIyvo
         DS3YkuCa7jhh1VS8576jitv6s/E5/9TxkXZ006dvqLf/oStjEzQ+TSe3sYi3CeX/4ChR
         LTYOBvnGlQVcegv2iwutzjOxd/MsxTBXHYomlO/tzAcGK0fURTonoyqs/3hyFAEyTdTi
         CnbqAL7yGW4T3O0bOWomud9kUMeAgI/Eq8VB5gaEemQkBoeOxdpv446z1d8gfRKIsfed
         4DbHRGfOUybXk1uPxnNECIuRHVCk76EkedY6Vw7AUiPDSqlGLB7fYcTKNJqNzgka3hGq
         HFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HngEx766XF0q0vilbt+l+gfmBxuo29lUMwZCzwVmrOg=;
        b=gClWBqQ6suWJv5VuQjg8rkN6Yn0OihuuvFaxBO3DIK/3tDAmeWA20YOIrQMfF6TIGI
         9GTnJJ0Agxbfe+J5gd2u4rg2E/Utb9Dfi9Kop31WS6bzPIJvMGOKkdkYDczGGsYqd75Y
         aIaWrDjCk9vIXe7ZCQeyc6Q1k8h/NY8h6FrbtZVinpvrTkZviepQ7tn04kfpIfEqemjQ
         3OkCJXGGWZELpVwhcfU/tLeO4L2c0eQR+gegU9CAyASoYBImsjFY05Z2z/r5uRwX46bi
         Ik5SVHzvYSwuY3IIme+aq5mOjtUXxjg45NsevNu7/VumWsMjgvhi3wp92SC48YaB3ib/
         DTwQ==
X-Gm-Message-State: AJIora9Vl0EjhV//Vdt29wngOcPVJH8L1u7333MH7XREpJBNHTCSp8Cu
        lGrOMt8NyebjqtLdeUX8mLx7y996wWgaDw==
X-Google-Smtp-Source: AGRyM1vTzXOUd9y+5DfwtExVlhF+xb36pwBnskwkNsYJzpZ+YgDHS5vRdOk3WW6EESV3bK4bBCZ6SA==
X-Received: by 2002:a2e:a54e:0:b0:25d:a9a4:f324 with SMTP id e14-20020a2ea54e000000b0025da9a4f324mr9182008ljn.408.1659009099326;
        Thu, 28 Jul 2022 04:51:39 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id w6-20020a2e9bc6000000b0025e1ef5bc1bsm101625ljj.115.2022.07.28.04.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 04:51:38 -0700 (PDT)
Message-ID: <66e15d42-96fd-5b02-b7c8-a284d3f8d21f@linaro.org>
Date:   Thu, 28 Jul 2022 13:51:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] ARM: dts: qcom: msm8960: add reference to sleep_clk
Content-Language: en-US
To:     Shinjo Park <peremen@gmail.com>
Cc:     David Heidelberg <david@ixit.cz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220728111603.30503-1-peremen@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220728111603.30503-1-peremen@gmail.com>
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

On 28/07/2022 13:16, Shinjo Park wrote:
> Change the reference of sleep_clk to the same as qcom-apq8064.dtsi.

You add label, not change something.

> 
> Signed-off-by: Shinjo Park <peremen@gmail.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm/boot/dts/qcom-msm8960.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
> index e8cd1c9c0..991eb1948 100644
> --- a/arch/arm/boot/dts/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
> @@ -71,7 +71,7 @@ pxo_board: pxo_board {
>  			clock-output-names = "pxo_board";
>  		};
>  
> -		sleep_clk {
> +		sleep_clk: sleep_clk {

Since you touch the line, make the device node sleep-clk (device node
names should not have underscores) and mention this in commit msg.

Best regards,
Krzysztof
