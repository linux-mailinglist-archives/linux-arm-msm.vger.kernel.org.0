Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8192A5ED690
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 09:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233835AbiI1HnI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 03:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233179AbiI1HmU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 03:42:20 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 305DF220DF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:39:37 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id o5so7985322wms.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=eZ9vmIYK1QfwhenZBRouVIsuSBTYdFiZ0xlDO4qNIH8=;
        b=YP59cW8lrVF2vOFhawusd/K5/JXcFlmeVWcAqT73dIHoqw4dH5sezATt8Hll/hbLvX
         lYD8qnVkefTQ1h0d4S4jN64oaBrp6dsd6vKNCLiOwi8EX09JwxAPeEN2p9pH6SA9IYMN
         DmxlZx1WEqGi2zNwBX7QxROa+6QyYLs+uS5vViRyZaRG8y9aKlmCZtz8Dj7c44RGqkro
         M+j1HygCMomNO+hRirBWBUvA85CmmVfWvQmVpJlpfCWJ3IbB/cSH6M7IAr6qXlRDujaV
         bExBan0gvXm+tRx8uqrS3R1YhpiVvUfOOaqQ8xkPUhyUYlKG1XKcJs+pVYZKUjqOsgbh
         DX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=eZ9vmIYK1QfwhenZBRouVIsuSBTYdFiZ0xlDO4qNIH8=;
        b=voQpIdaoCkWrq99bnVgC6P48bT+NaKd5Ph+9PXAURi0/Djm8tECxUPJZl8ElypKOGc
         Ze4tCUZYkxzH0y2ULUYd/EDuPaqQDl4upCbwGoS3yxybmlCgIYNUlesKYbk2ScETNuN6
         glXv8jX5AbKbbAa9Rm/JbQ2pewJt2lDNyD+bdWGk+eTmHPgOQIsXYwtTinaj8Tlia8fj
         OmTtYZn3zwvFhrsZ2zV7RjdJ9cDU5ovicIFsau7OjAAUd7PiqZEXaRvMP2Qs6GHmOSg+
         LpPR4Bve1aSdJrIs5K49aQBKPcGqRSBfB2TaODaxnXeVjLDynWk/yEB9rqkXygvVQSF5
         QxgQ==
X-Gm-Message-State: ACrzQf3G6QRPYVHWZBO3xiLr8IycSsCBWJ5FU+jndmyk6fc3ene6+IZF
        BImM0UHdd4o4WyeZrfl0mh3PQg==
X-Google-Smtp-Source: AMsMyM5jD0OFaMJHJ0m2ZOXngKxrXR6qa0WEz8XJGfH4kTaEpvtxFwKJlI7b68KFB4UtiSXWq7mv4g==
X-Received: by 2002:a05:600c:2212:b0:3b4:9ab8:b24e with SMTP id z18-20020a05600c221200b003b49ab8b24emr5583208wml.127.1664350776087;
        Wed, 28 Sep 2022 00:39:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11d4:7c71:accf:6521? ([2a01:e0a:982:cbb0:11d4:7c71:accf:6521])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c3b0700b003a1980d55c4sm912020wms.47.2022.09.28.00.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 00:39:35 -0700 (PDT)
Message-ID: <ec137750-1c8f-d190-701a-48a9866aeefd@linaro.org>
Date:   Wed, 28 Sep 2022 09:39:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 04/12] arm64: dts: qcom: sm8250: align LPASS pin
 configuration with DT schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
 <20220927153429.55365-5-krzysztof.kozlowski@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220927153429.55365-5-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2022 17:34, Krzysztof Kozlowski wrote:
> DT schema expects LPASS pin configuration nodes to be named with
> '-state' suffix and their optional children with '-pins' suffix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 44 ++++++++++++++--------------
>   1 file changed, 22 insertions(+), 22 deletions(-)
> 

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
