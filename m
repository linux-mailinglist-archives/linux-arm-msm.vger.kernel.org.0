Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3AA6CCDAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 00:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjC1Wvo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 18:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjC1Wvm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 18:51:42 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51870171B
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:51:41 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id o20so11285047ljp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680043899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z8tukPuzbITFwXQ+VQmbw/TCmsc9V0UeeBpsR6Rb3oI=;
        b=OtF1JlgkKDz8NjUSR/BK3P6QXzAl+hBGkksGiF1fVNIbn3onWJOz4wHxUB/YFK+xVx
         lJk++yEFXkis/CipcmZZ5Rfll/i8E38H1zjQUycYIdxSHxO0JcjVcSPQqpX51Y3BOkaD
         9+1l0+XDoTF2I0KmdKKAWVjyv+Ram8EE/iz83s3MA82lW86CdJTgzf3xvXigi8TIelfY
         NhNBSSxf3Lk9yBM76u7+IUuBkwpqI89wDJDqFfoN+i4Zl30iiowz75W7Ti/4Aja2osXK
         iRsfXrBadKQGzBV3siFONw5SmMQpqf3Of511Vr/u5EQ+ksD5R/jkkJ6pt0G2Ue/A6LzM
         Kvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680043899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8tukPuzbITFwXQ+VQmbw/TCmsc9V0UeeBpsR6Rb3oI=;
        b=Fztx053KouUSMfztw6/jOvy0EB02hXgkJBQRBe/5BnhWK+FeKnsOTCiKdfQD7pq6yk
         hD+3ZMnOUKFky29mmLhE46VTQW683fHcatX5DJbouUXjbOoKGe5Mh6zUuXyFtc8b8CbK
         RDqbZsJLJSQY2dpUcoYf/gh5nJXAuZDBpN6P2gHfcB3FesXbL/L1Hw2dou+/+cw8XpfC
         ccehDmJoqa57DaMO+sZ1v2AyDxy4q+nU9M0XGraCBP0Bb7322QYRswYN/55SIEYWTMM4
         NmFpZcsbdyS2qCRCwPCfkGESUsDszMEqcn5TylZzk3vg0CIip8/5omX2DBZi9QM+mLuM
         smlA==
X-Gm-Message-State: AAQBX9e7TyafRk8VOPm4gPDCs580o88CKXLxYDSAmq7yDfRWxGIhrq1y
        qbnmf7q1E7nwDzWgPBt+XSu8bZihipKe9G8jUPA=
X-Google-Smtp-Source: AKy350YNJYE5GTFBKI8Z5WeXPAyu+utX3qFWTssdO/6m8d6sSYKpsMMIP1XF5VZYmXFfF3vDzDClfw==
X-Received: by 2002:a05:651c:22d:b0:29b:6521:8869 with SMTP id z13-20020a05651c022d00b0029b65218869mr5218365ljn.20.1680043899545;
        Tue, 28 Mar 2023 15:51:39 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v18-20020a2e9252000000b002934abfb109sm5267873ljg.45.2023.03.28.15.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 15:51:39 -0700 (PDT)
Message-ID: <880c0932-117f-61cd-dd97-c36076869c3b@linaro.org>
Date:   Wed, 29 Mar 2023 01:51:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8250: drop incorrect domain idle
 states properties
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>
References: <20230324073813.22158-1-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230324073813.22158-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/03/2023 09:38, Krzysztof Kozlowski wrote:
> Domain idle states do not use 'idle-state-name' and 'local-timer-stop':
> 
>    sm8250-hdk.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name', 'local-timer-stop' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Link: https://lore.kernel.org/all/20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-4-3ead1e418fe4@linaro.org/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 79d67b466856..9cf2de87c632 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -354,12 +354,10 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
>   		domain-idle-states {
>   			CLUSTER_SLEEP_0: cluster-sleep-0 {
>   				compatible = "domain-idle-state";
> -				idle-state-name = "cluster-llcc-off";
>   				arm,psci-suspend-param = <0x4100c244>;
>   				entry-latency-us = <3264>;
>   				exit-latency-us = <6562>;
>   				min-residency-us = <9987>;
> -				local-timer-stop;

Hmm, so we support setting the broadcast timer when using plain PSCI 
idle states, but not when using the domain-based idle states.

Ulf, Rafael, Daniel, is that an omission for the domain-based idle 
support? Or is it handled in some other way?

>   			};
>   		};
>   	};

-- 
With best wishes
Dmitry

