Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBED9745B9E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 13:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbjGCLwK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 07:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbjGCLwK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 07:52:10 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67659B
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 04:52:08 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f954d7309fso5425683e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 04:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688385127; x=1690977127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwhpkGVhycvgLRtfT/QjK3e5tJxe8JynEywT8PmMXoQ=;
        b=cztpHutUScwu5ESp7at38WFcRO4V673nIQbF7Psv2jN/qDILNAIvWZ82pa6B6MVwsW
         MmUqC+kEd9sHgjm1uZ0o6uF1JUbmCXlB3G5/b8dEA9xKGs83hi3f3mRt6CGL537cBJ6l
         Eerdi61Jd0ABwmu+IKGdGBAK88hLXn+T4GoKI4INaHCyAjIs4Wyy2/pxlvRrmQawbqxt
         2IK/0GaQ2iJTS/p2UTBI+Xx38Yx7ZonVFvwsMYP87AOpIWkOD3vFvrf6yBMZCQibsYZH
         tqub+eDCfGHR09WCpCX76F5VDM5VO5fSfCfgMTHhYeqZZAtNjEyUikAlmycwSEZHToB7
         RIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688385127; x=1690977127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwhpkGVhycvgLRtfT/QjK3e5tJxe8JynEywT8PmMXoQ=;
        b=RiW0/2m6zuJ/EJbFKV62r7m5pO6V2sI1CuAkQqkWST8xMAeHqCM+IcRkQQeBtJEMab
         YOhHvbxkDj5cKUqfoPGWS7wQJepPs8UM3udG9RXtzCxAxWgMmduIiLMm0JPkARnXfpYP
         glGSbiM0rmhCpDVtpNTfajtA8wprmIXjS+y1Fpk/TZy66/ZOeZ2+I/KEMsmnwnja6KKn
         O/LCMk+otjfu6cl/2/TEYlnk/vQ+8CpcyMo5Q3Uv2riNXdHYHKxJIY3OJ/mAAp31ptHr
         snBtCnPNWB0sGRykkpKDvlvK0ZLNnM1G/Y66UZ5Y/iSSyyumLOysYRArrIaqmVRWR/Ko
         ovuA==
X-Gm-Message-State: AC+VfDz+B+n58JjOSQY2dZrjL9I/knASFnakXSzQixjhh6dGQ1T9I+O9
        vDO9wslNSnZs2uJWNCi0XyR0nA==
X-Google-Smtp-Source: ACHHUZ4P/cUGL+flvYWD0mUXSdLiXjdNCTyOLe/ESDPbxzNgTWp2cewgyXDPAv8ukgEaB3QD+Ngf9w==
X-Received: by 2002:a05:6512:398e:b0:4fa:6887:ba30 with SMTP id j14-20020a056512398e00b004fa6887ba30mr4984213lfu.7.1688385127209;
        Mon, 03 Jul 2023 04:52:07 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id u28-20020ac248bc000000b004fb96166e5dsm2643470lfg.173.2023.07.03.04.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 04:52:06 -0700 (PDT)
Message-ID: <d09c29f4-9cd5-9e60-ede1-dfa5034fd0af@linaro.org>
Date:   Mon, 3 Jul 2023 13:52:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 16/27] ARM: dts: qcom: pm8921: reorder nodes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
 <20230702134320.98831-17-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230702134320.98831-17-dmitry.baryshkov@linaro.org>
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

On 2.07.2023 15:43, Dmitry Baryshkov wrote:
> Move pm8921 device nodes to follow the alphanumberic sorting order.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
[...]

> -		rtc@11d {
> -			compatible = "qcom,pm8921-rtc";
> -			interrupt-parent = <&pm8921>;
> -			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
> -			reg = <0x11d>;
> -			allow-set-time;
> +		pm8921_gpio: gpio@150 {
> +
questionable newline

Konrad
> +			compatible = "qcom,pm8921-gpio",
> +				     "qcom,ssbi-gpio";
> +			reg = <0x150>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&pm8921_gpio 0 0 44>;
> +			#gpio-cells = <2>;
> +
>  		};
>  
>  		pm8921_xoadc: xoadc@197 {
