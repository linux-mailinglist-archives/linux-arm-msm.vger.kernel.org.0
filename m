Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 697A95F33A2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 18:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbiJCQdw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 12:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbiJCQdq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 12:33:46 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A538036794
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 09:33:44 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id b7so9944288wrq.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 09:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=Iscn6XwVqUYJxh3JN5/Hh+NrgygASttiVRFwByK+9Mo=;
        b=OGoilK5NXEN8KK7OXeuywBmUyEIS4+NBxyAIMhFz/VNP8LJp/xlTMeQYi6UMrQNQnJ
         IsMUmmsmN9ngve65UchN0Bz1Rp8svxmKLeyyzWSY+TA+VEsnvvZfq6VmSdd4eVRArlQc
         Q5K35CGWZvEY4IcA2spiIS+W6IKX2tnhBQ7Dk74vn0CimP1SHWVPoXHnqQVEZI8nsmvm
         0V37N09NYDSTV2uQ313n5VIyPUwWO6FOH1UtE99phl0evRDr8kXXImbErHMUOsPbkIxg
         MHXAN9HV6nA03+hT4SpvqpPjMyc1Ny8dnIPBXjHJNO60/xMusHG6K4kQoeXJeNGcsBny
         yGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=Iscn6XwVqUYJxh3JN5/Hh+NrgygASttiVRFwByK+9Mo=;
        b=01JJhNQnAq/GyBo4LeUo/vLAbnOYgcSl/o4C555KLgyN6P2esa0RbEzUvipZf5/eZL
         hXY6rED3MzO4YRZ1y3ujyEPFVP+QhfuTmvq9Epn6aMgyWR+ArK4gkcqOiIY20MYjz+OK
         nmA0iQOYjN6vkpqRaDyfXTBsB3jYDGHNyA8o8P8xerxQO0ri2AqN1+M67fLvE+FTXr3c
         dgw+O1XJ5fuyECev5RJEN4+QLXa5wTB6TX1bQR3kzWNw3NJPw5KPPT5GE6AaijlcKQkU
         IOIMTEGFMJi/VO58Y0oEWpBwa78LjWVjy+Y1hJAN54Y3oShiJQOP/ftt+Z+afvlJzd++
         J2WQ==
X-Gm-Message-State: ACrzQf3PAOaxOxWc+/7teD+CTa73CToIV95Ccugs/U+hKVwQLhqBv7Tl
        iS0trtNUgR0ilaLWOgzoGNG/Hw==
X-Google-Smtp-Source: AMsMyM5qKvVb7ZGekk/uyDjaK0bciQg6ihZiQgvbvkL7T8dvkEBTVLljR9D8AehSZDZzSc0NMv8CQQ==
X-Received: by 2002:a5d:4dc1:0:b0:22e:461:dcf3 with SMTP id f1-20020a5d4dc1000000b0022e0461dcf3mr8850611wru.42.1664814823280;
        Mon, 03 Oct 2022 09:33:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf? ([2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c4f5500b003a5f54e3bbbsm18888384wmq.38.2022.10.03.09.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 09:33:42 -0700 (PDT)
Message-ID: <a0f30bb6-4c48-e7b5-d068-aecf98f35699@linaro.org>
Date:   Mon, 3 Oct 2022 18:33:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/23] ARM: dts: qcom: apq8064-ifc6410: fix user1 LED node
 name
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
 <20220930185236.867655-5-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220930185236.867655-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 20:52, Dmitry Baryshkov wrote:
> There are no address-cells for the gpio-leds child nodes, so rename
> led@1 node to led-user1.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> index f718b37192e9..610fb8d652c3 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> @@ -38,7 +38,7 @@ leds {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&notify_led>;
>   
> -		led@1 {
> +		led-user1 {
>   			label = "apq8064:green:user1";
>   			color = <LED_COLOR_ID_GREEN>;
>   			gpios = <&pm8921_gpio 18 GPIO_ACTIVE_HIGH>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
