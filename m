Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 675AC6DE52F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 22:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjDKUAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 16:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjDKUAA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 16:00:00 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05DB846B2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 12:59:53 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id b33so5367484ljf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 12:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681243191;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j9qtSHs0SP57vAWqNUMxfmXt+r2xsPc5lidR3ZWNooc=;
        b=wjBfSusmCOMD/Bym8gKSDfrUATRRKBMYOab8AsnFjvQ3BjlIz1TpUm2t95YT8DU4K8
         qLxNzG+MnZpeGfWwPX5ERKdTK+kgxDOgbVR43HUK4Cca+yPj/iMI8gWbPVF+dNWH2Lh2
         q+oZs7wF6+P34tJ8Kli104JwjeiUL+LxziS9t/xIMXIgL3aKfl/kxJqJPVBgXBu12KFg
         E2xNpv3yLc7Lk6ihNOequ34/0pgXYql6E0PwUBxwBdanHlrzmYxtitalmpyyVm64wp1J
         2lflvh3+M5XumvSlJQ2SeHYgeWd959qJtbJT/7NdfaIByme/+ysS9UDCUN+Zd92U0QMA
         Y13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681243191;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9qtSHs0SP57vAWqNUMxfmXt+r2xsPc5lidR3ZWNooc=;
        b=aotjbymR2hjywQDN94G4D6VDAHdzvEK4ILmrOBZPddzRNx1fuT/TS9C76rvfHEb7zM
         r4dwqh4bdJlMGk+5zoqPQh+vS/auVcBqier8LygajK5/9tG0sTKDA8WVboGCbU2ytjU/
         be2uKJJ2UZZxeXrpyOnSOipdd3WxLR53dmbCNdA1W76IE9J/6nfzkSkg+BCETzMBotOM
         VLjOwu/7SL1GUHG8/epjGAUmib78e7UoX7sn5PhgYs0j2LlLJ49koD78t7UwOL1qKBDF
         gTirfvlphJCEchxgFiclmVBUDyBmkbQk0JV57+ZhUB82/sI/6ziSgr4m5nhwiU5l6iYp
         r4JQ==
X-Gm-Message-State: AAQBX9eoExVWo0MeGgWxUVLZRplza0sQfr73rL/7EyxMMSA29B4qbizZ
        YZQPkbl8BHSx9uzKoAJUnq7p3g==
X-Google-Smtp-Source: AKy350aTJEC8pGCYsZJdEbCysEXopUYBF9NO+Ul5rUuNQniusvd++uUrhEYZVwH1jPIehTm6BF+xLg==
X-Received: by 2002:a2e:9109:0:b0:299:f770:db5e with SMTP id m9-20020a2e9109000000b00299f770db5emr4565988ljg.16.1681243191376;
        Tue, 11 Apr 2023 12:59:51 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id f7-20020a2e9e87000000b002a6168181d7sm2936558ljk.7.2023.04.11.12.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 12:59:51 -0700 (PDT)
Message-ID: <f565161d-ed02-d23b-f407-bd50245921ad@linaro.org>
Date:   Tue, 11 Apr 2023 21:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/3] ARM: dts: qcom: mdm9615: remove superfluous
 "input-enable"
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230410181005.25853-1-krzysztof.kozlowski@linaro.org>
 <20230410181005.25853-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230410181005.25853-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10.04.2023 20:10, Krzysztof Kozlowski wrote:
> Pin configuration property "input-enable" was used with the intention to
> disable the output, but this is done by default by Linux drivers.  Since
> patch ("dt-bindings: pinctrl: qcom: tlmm should use output-disable, not
> input-enable") the property is not accepted anymore.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts b/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts
> index a8304769b509..b269fdca1460 100644
> --- a/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts
> +++ b/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts
> @@ -49,7 +49,6 @@ gpioext1_pins: gpioext1-state {
>  		gpioext1-pins {
>  			pins = "gpio2";
>  			function = "gpio";
> -			input-enable;
>  			bias-disable;
>  		};
>  	};
