Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A96B967842D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 19:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233842AbjAWSIU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 13:08:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233858AbjAWSIK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 13:08:10 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4753D30E93
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 10:08:08 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id y1so7143016wru.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 10:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HywhC1rnYCdzl2suE7CaWllvtTNopzHj0Hm6oTroUUc=;
        b=PHNnsjSibaznezsjgOuAXhGb/7LsiQkVglUfhijUs/kY7JPSIUnnIoviI9vCgV9Pkc
         KkYyLnCXS9IQErhVdcKMgHAygaXereh6N0GyOuw4eIXtTYUdlpbw/tqU15AKH+wVGPYk
         2n62zSR6fWmaDiwiTdBLuruuW51E4tozADEjWaVepkaVB88AQ+MyzrD/KFowRN8V/0AM
         46S419w1/fxiaZz6Ss1HhZBYfyxFlAa41YtjLja6D2FVv5FFVWlDBQXQHd4ufVxcEJMe
         TBN1rUiLTvLNDzFyH7Tc+i/TB1qv8XaDKGL8C5jBLhf7e2q4JriFGZjs6k4+NZDGSI9D
         gGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HywhC1rnYCdzl2suE7CaWllvtTNopzHj0Hm6oTroUUc=;
        b=MN/51xLrE1J4BJoK9vhdkFmVHFphuRzNpVU2oCzaQtw2SfTvQqXrFL6TkiAAY1v87P
         HjztpMXLCfA2JK3K7oWvgqMX3GmAmyfphTnfZEyGT7aE+b9dCqbaBmH+Gla08g2sp/EO
         V5t4LZi8SAcJvu6WyU1fYPFSPvdZin5AmR0y34IFQ1WTF7E0u4PpZ/ccuale4GuMxrzF
         aGf9JrlQvm1Vro5IsFSAS+5hwCwioU6AQ0pJVN95TUC73t2t2h8OgXBB114Q9OsNb6Ke
         lFtEYcxe2T5h4uaF5AJLHR6Th22vfsCnJKVWbFykwY5jhtJthu6UWQDHQ4pQ8EIqDyst
         DXUA==
X-Gm-Message-State: AFqh2konXRGsDm58pajNGMB9JRKthwU5xLJA+mwy8hkgTXtfoE73n53/
        23LuUgFaMUcGCENdxzg1Wb0NMg==
X-Google-Smtp-Source: AMrXdXvwTmRR5ZasZ0ZKL8w7VxEDeYu04REpAUHmib4HVD9I48Ihq5Wgl6+UuS8MlPeh2je9SgZnEw==
X-Received: by 2002:adf:dece:0:b0:2bd:f671:22b with SMTP id i14-20020adfdece000000b002bdf671022bmr21603513wrn.55.1674497286879;
        Mon, 23 Jan 2023 10:08:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u15-20020adfed4f000000b002bbdcd15e44sm18051wro.37.2023.01.23.10.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 10:08:06 -0800 (PST)
Message-ID: <05a6f073-7002-0156-1225-cd838e482307@linaro.org>
Date:   Mon, 23 Jan 2023 19:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: Add MSM8926 and Samsung
 Galaxy Tab 4 10.1 LTE
Content-Language: en-US
To:     Stefan Hansson <newbyte@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        matti.lehtimaki@gmail.com
References: <20230122144749.87597-1-newbyte@postmarketos.org>
 <20230122144749.87597-3-newbyte@postmarketos.org>
 <f67b23e8-a476-7f8c-b692-e85ebbe669f5@linaro.org>
 <1481d44d-f84c-db12-d95d-75f367e973de@linaro.org>
 <7c69e654-fe57-ad5c-9b41-15aaeaa73102@postmarketos.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7c69e654-fe57-ad5c-9b41-15aaeaa73102@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/01/2023 18:41, Stefan Hansson wrote:
>>>
>>> 2. You base on other SoC but you do not include its compatibles. Why? Is
>>> it intended? None of the properties applicable to other SoC will match
>>> here, thus I actually wonder if you run dtbs_check...
> 
> Sorry, I forgot about running dtbs_check. However, I'm not sure I 
> understand the question. What do you mean by that I don't include its 
> compatibles?

I understood you include the msm8226.dtsi which is a different SoC. If
you include it, you get all of its content. We do it only for compatible
devices, but your device does not indicate compatibility with msm8226.

> 
> I ran `$ make dtbs_check DT_SCHEMA_FILES=qcom.yaml` locally just now, 
> and it only gave me errors from the qcom-msm8974pro-oneplus-bacon dtb. 
> Maybe I'm running it wrong?

No clue, I cannot test because your patches do not apply cleanly.

Best regards,
Krzysztof

