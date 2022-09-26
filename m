Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3AC5EA683
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 14:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234559AbiIZMtw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 08:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234103AbiIZMtb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 08:49:31 -0400
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7112238A09
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 04:25:00 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id bq9so9704786wrb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 04:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Xu/5Z8uMPMO2yci7z8jrtU2NcqkQNFyrubsUMl1cvok=;
        b=Wrsb/RrqeIHSfgNOoaNAPGEr1QPkpoJKADbKiDZZ/JWhf7N2Rhokr7E73pOZQL7B9D
         TB8Wyngq0f22pOm+EkrBl4vRkT7bHl0Wj5HognXPpygkVfI0bD9I/SmT0K+Ydtgoy77g
         VkWqDztpv9YH0MDytT4WGg5znzCL0SLb3tQLb5l25hvREF6Yi687gYjRXMO2mxyqRCGs
         EZnxnk6Sy6o6fTAJwYbmZi76yK+n+5GZpWo+Gac0/Zq67XgMJzirA+KG2DMYi273xOb6
         ZwzxqCuckzqfJdZo7ByS+VUTOic8aWJE3ZGyXmghzaCwyxK+EaulWcY9ddNg8aIfroOr
         E1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Xu/5Z8uMPMO2yci7z8jrtU2NcqkQNFyrubsUMl1cvok=;
        b=OZjBBKTj/9MrWFAAPJ5M66/LVeA0bDq7c0oKWXyJKngdCUhDbQ/p087Oan9lY500B0
         gr7Y2ljZZX6C79L2T4KD0mjuZdBbniK4e0D+6A16BFCWxdW1FpCsQlD/KbYYVy62t9jt
         ynLypgdTJVA/By+T1FgD16GhTE4j5AMiGzT9+q3WpRZfCwomc5I04T6X9Ro2LbyaJLX/
         znf1vjwqlLEUD9mzJDQQpy+dB2E/9gMPtqIaAxWdXjpvs7NxXga1waWuEwp+mTNDOug4
         3+yIkNabaY3TLNqw6jFpEkg81UfMH9YGRTuhUCM15o04qjqMMXhWCqYKkJNwHgG8WGEU
         UKqQ==
X-Gm-Message-State: ACrzQf1NYKE8lW6wi+RarVYwJjOJdeE6J+ebw2ci0XS7hqjJjYC9GLcj
        ZKm+6m6zAm5sPKJOLskHjA9EPA==
X-Google-Smtp-Source: AMsMyM7Ds9nj6E1F26CGgu3kkkLEuoPVM8MBMtY6RtwwtGf6pmp/VGQV05hOVu+0l1HltJcHBBNr0Q==
X-Received: by 2002:adf:d4c9:0:b0:228:de3a:220f with SMTP id w9-20020adfd4c9000000b00228de3a220fmr13754001wrk.597.1664191101710;
        Mon, 26 Sep 2022 04:18:21 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t5-20020a05600001c500b0022abcc1e3cesm14106296wrx.116.2022.09.26.04.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 04:18:21 -0700 (PDT)
Message-ID: <87b88a90-6509-048d-8424-495d1e78a219@linaro.org>
Date:   Mon, 26 Sep 2022 12:18:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 00/11] qcom,mdss-dsi-ctrl: Remove redundant phy-names from
 yaml and dtsi
Content-Language: en-US
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 01:00, Bryan O'Donoghue wrote:
> phy-names is both inconsistently used and not actually required by the driver.
> 
> Previous discussion with Krzysztof and Rob suggested to remove the property.
> 
> https://www.spinics.net/lists/linux-arm-msm/msg116525.html
> 
> - Mark as deprecated and not required in yaml
> - Drop from associated dtsi files => grep -r mdss-dsi arch/arm* | grep qcom
> 
> Bryan O'Donoghue (11):
>    dt-bindings: msm: dsi-controller-main: Drop redundant phy-names
>    ARM: dts: qcom: apq8064: Drop redundant phy-names from DSI controller
>    ARM: dts: qcom: msm8974: Drop redundant phy-names from DSI controller
>    arm64: dts: qcom: msm8916: Drop redundant phy-names from DSI
>      controller
>    arm64: dts: qcom: msm8996: Drop redundant phy-names from DSI
>      controller
>    arm64: dts: qcom: sc7180: Drop redundant phy-names from DSI controller
>    arm64: dts: qcom: sc7280: Drop redundant phy-names from DSI controller
>    arm64: dts: qcom: sdm660: Drop redundant phy-names from DSI controller
>    arm64: dts: qcom: sdm630: Drop redundant phy-names from DSI controller
>    arm64: dts: qcom: sdm845: Drop redundant phy-names from DSI controller
>    arm64: dts: qcom: sm8250: Drop redundant phy-names from DSI controller
> 
>   .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
>   arch/arm/boot/dts/qcom-apq8064.dtsi                             | 1 -
>   arch/arm/boot/dts/qcom-msm8974.dtsi                             | 1 -
>   arch/arm64/boot/dts/qcom/msm8916.dtsi                           | 1 -
>   arch/arm64/boot/dts/qcom/msm8996.dtsi                           | 2 --
>   arch/arm64/boot/dts/qcom/sc7180.dtsi                            | 1 -
>   arch/arm64/boot/dts/qcom/sc7280.dtsi                            | 1 -
>   arch/arm64/boot/dts/qcom/sdm630.dtsi                            | 1 -
>   arch/arm64/boot/dts/qcom/sdm660.dtsi                            | 1 -
>   arch/arm64/boot/dts/qcom/sdm845.dtsi                            | 2 --
>   arch/arm64/boot/dts/qcom/sm8250.dtsi                            | 2 --
>   11 files changed, 1 insertion(+), 14 deletions(-)
> 

Ping.

https://lore.kernel.org/lkml/20220925172443.92900-1-luca@z3ntu.xyz/T/

---
bod
