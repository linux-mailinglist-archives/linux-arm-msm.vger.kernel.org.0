Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80EF373FAC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 13:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbjF0LGi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 07:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjF0LGh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 07:06:37 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE6D1BE8
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:06:36 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b4826ba943so60842561fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687863994; x=1690455994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7T6ZJMLI39B+JUQgKYkpekF6UMLE5A24IN0jZjij7wo=;
        b=x51FWq0snfhlAwgK/eoCdSIm7wdfZTeXwrlwVNLrpIIccoV2/AKcOMmchdMLJsExhj
         BIjlMDdHu1rpZJj9leTfF6vr7BXDSt8OXtNJlFS6Ofa1FybkyKArGtOpzR+7FgZkzA24
         X5eIwLqTMXSId2Zcx2v1RdsEFNlD2J4rvxEJPqcaZ5BgbZef5pU4T6AadGTtNYjb2hz4
         iDjEf4PIGSQTcgEE0GAFAOATCvlQ8p3Gc32833GmiyMFD9SHTjIjRXrAQSocmN1poIKz
         bi3Ywb7E/xlToasrqkYviL3CbBn5jJnO9YjGLbQaV+/JFHhTe1iYnIaq1alZlyYA4O1Q
         YYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687863994; x=1690455994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7T6ZJMLI39B+JUQgKYkpekF6UMLE5A24IN0jZjij7wo=;
        b=EgiidG/eIHV/MQWxgZ6Arxm6S8Wh7btB3HEH40ZBTfve2UGS9x/KBiVk17SrKqwkgV
         CHlwCbdJmK+xMHZNci0qZMAwBo6Z6Y5PPmU+MdmvQQ7JafeVf/LsfjxnboP1Wft+paSs
         MeXVubvR0Z5bWad/fQHJfxAbxa9EBa2cpYs/YG2E/BBSJpdKj3oVOEFXJEMZlRirFlwS
         6Adv8hoLdQcScusE2JmQAfS2JdOBxcwuSRBLlmm26nqrz3q4Vfn4wEBcVrA8/jBZTbHg
         fi8ufIy7TkroOaide9DNOyMHfSCKK/Jiw/V8bv1elU0MoBMWFLa0Si9I1WvC9eV4+m59
         hYyQ==
X-Gm-Message-State: AC+VfDy3m292NtUpCES+/eQz+j3BWEV9ET60HvKEK4hu260vpMDowDev
        zlv/U0sHilDWDmXYt9Q636denw==
X-Google-Smtp-Source: ACHHUZ6/pcyL6KqBYKwP+HhpqYppX+qSbvyo+80WWe+XqFZ++BK7im8JpXvIJaoRnXNxPaPcA4UFXg==
X-Received: by 2002:a2e:7e0b:0:b0:2b4:6c76:332c with SMTP id z11-20020a2e7e0b000000b002b46c76332cmr16978025ljc.24.1687863994505;
        Tue, 27 Jun 2023 04:06:34 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id n3-20020a2e86c3000000b002b483003b1asm1628389ljj.69.2023.06.27.04.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 04:06:34 -0700 (PDT)
Message-ID: <1bb109ec-e946-b76b-38e6-543d0ed44a2f@linaro.org>
Date:   Tue, 27 Jun 2023 13:06:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 05/15] ARM: dts: qcom: mdm9615-wp8548-mangoh-green: group
 include clauses
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
 <20230627012422.206077-6-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230627012422.206077-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27.06.2023 03:24, Dmitry Baryshkov wrote:
> Group file inclusion to follow contemporary practice.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts
> index b269fdca1460..e3b4b93c3d38 100644
> --- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts
> @@ -6,11 +6,11 @@
>   * Author : Neil Armstrong <narmstrong@baylibre.com>
>   */
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>  
>  #include "qcom-mdm9615-wp8548.dtsi"
> -#include <dt-bindings/interrupt-controller/irq.h>
> -#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	model = "MangOH Green with WP8548 Module";
