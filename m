Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3892358EEB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 16:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232365AbiHJOsD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 10:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232797AbiHJOr6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 10:47:58 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E8E27332C
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 07:47:56 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id v7so16356666ljj.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 07:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=xAWbyrjApOISWNxRGXk8EYQy587Toi36q77R+G3hDzc=;
        b=eEDtTm8qxAkipar2MHl4PYLASIA8YnYRV2ynvJSiM4Cct5aihxVp5/IQCKXhqdp+H+
         crJH4GADLjpldQYcCFk4KHWZ0PCBK8UjwPs1PNt91XEnTqv273JxLSijKMf+R8APDndc
         eyxHSrbVogq5Bm81JJEY8hbY5PRrJW4WrfXx/yylwBNsp4FAJOvQObHs42d41jY2MG7A
         9iItnkHxxYqp1fz/CgS1Dz1WcMXDVR2q/0WMytQV2SqsaIyi8MdP8giUEa0MUAGMWP5u
         RG22sj9kqJaGPxZIAA69HQXNPliPxltu159ZYkwkBWTBAD4xhDRpJirL7ews7lJznrUy
         5rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=xAWbyrjApOISWNxRGXk8EYQy587Toi36q77R+G3hDzc=;
        b=IB/UwLXbtHeJs70bzSVMeqBsYie2Mum0JYS27AiV5QlcJOcuLyWiO7AwzOP92jNRy5
         4Ez7yi6jXbRTb5kurz8MIiI2Wuk1stSYLdOaKztZ2vRZ6VtARGXTWA6oRW0lmtqe2Wbp
         ojkH1pQ79DQl5ZT+AbOQ/55tCjhyj8l+JLfxjGlk+fsnZ26oyehfBtYphcrERrk28F2+
         rNacUvyFOnDHy7rB8ab/kjvPilTwhI4t6gQ/NQU56Tg4ZKnFOx9FMPvCHoqMNSsLxnOb
         Kzl84d5czRpLiByBj3wWCN45MF/1f/aCDme1EVgJDxfhKsaf+/qxVWkgps/WFGuSpcIB
         ssxA==
X-Gm-Message-State: ACgBeo0+Qxjbjl5c30Ac+JZbv3SaxiSJSUiRw21hm6tPxbfK7h8qdEFs
        pOP/bbkMJZSwWNMi6R3mt2MBSQ==
X-Google-Smtp-Source: AA6agR5+VKezNQWlbJ5jGG0wOWbGdljEwN+NvnLLR8ppNZnwuZNWvZOlx4TkI6EEuuwMpFiWwy3z/g==
X-Received: by 2002:a2e:b0c9:0:b0:25e:71e3:8441 with SMTP id g9-20020a2eb0c9000000b0025e71e38441mr9604841ljl.156.1660142874467;
        Wed, 10 Aug 2022 07:47:54 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id p12-20020a2ea4cc000000b0025d743eb0c5sm429749ljm.112.2022.08.10.07.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 07:47:53 -0700 (PDT)
Message-ID: <c5cc8752-d7e2-b870-6887-c025137ed8a1@linaro.org>
Date:   Wed, 10 Aug 2022 17:47:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/7] dt-bindings: msm/dp: Add SDM845 and SC8280XP
 compatibles
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
 <20220810035013.3582848-2-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220810035013.3582848-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/08/2022 06:50, Bjorn Andersson wrote:
> Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
> Qualcomm SDM845 and SC8280XP platforms.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 94bc6e1b6451..90f9302d1731 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -16,11 +16,14 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - qcom,sdm845-dp
>        - qcom,sc7180-dp

Alphabetical order, please.

The DTS warnings from the bot look unrelated to this patch.



Best regards,
Krzysztof
