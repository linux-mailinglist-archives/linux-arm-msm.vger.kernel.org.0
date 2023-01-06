Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2511B65FF7E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 12:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbjAFLYH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 06:24:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbjAFLYG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 06:24:06 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16D2687BD
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 03:24:04 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso850763wms.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 03:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PEg+Tg/pTh4GbjMfPQBUxtL2ybBQ9NqwtbWRDq+TidQ=;
        b=PkYckz6bOIqLkZTi1FNso6007BDV6/zoxPJr7fIrOkFiuMPkZ6DgZErwqj6hV44fx5
         KpHUlEMA0FBIWQFBs83mn8qPT7bs9p9MUumXiriv79NvCxXeu0GRQ4MI5/OI07x0RkeH
         3x6VDOBHEl2Gn4KFnlySYAkDpLrBtK9ZN0cMwoMwwHDsxJCVYf+1yJ3lBFmSvnxKpi+N
         Ke/5sGzkEXI9TU53FvieREHmART1pQ4pUhhnDF4fc/QNRkcm+s7RrfyHn2fHuI0M+1x/
         i8AGMuKqaDeknO+jMqHgDuN1BRROKY7qFVEgiOx1/4Rze3/TWX21Q0N4/elfNKRH5kNJ
         zUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEg+Tg/pTh4GbjMfPQBUxtL2ybBQ9NqwtbWRDq+TidQ=;
        b=sjRzsNHKC+azezIrl04NmX0xdLYG0NzTbYAGXU3urkSPSjvlHJh6kKmpopt3ieZtUx
         yH0bzNslhauUjY1n6BU8Ly6ngE7f6awUjsUpo3y8E5aL7JPVrrn38oiB9NzY78QCmMpW
         yBHwBfc3StjJ678db0NCnbGOLOq58tMK4jgl4MAcSQtJVK8jbdC887G4fv9ySkmAquV4
         LR0O3nGzjkVQGyy/FQuSfvK39Z2lM2dz3agwbacjB34AfywuPLQswTCHeNjyFx4lUibA
         GjhrjD6r5GPclUlxqCub9BfIVnaZi1xsxAfV7Q+KiV3vcrxrlPxFMgDs6SoB2G0EwHZ6
         frCg==
X-Gm-Message-State: AFqh2krLv1CqrJGZVl+GjYitv0ZUnTMJit8VnrdrPbPhRASKN+y8TtJV
        BTSthFkPtzSuXKE0oDtCpTGYHA==
X-Google-Smtp-Source: AMrXdXvd2AW16vBPKDxOBXfOsprz19R/+2Q4Of7k6uSER2sb14ev4yiGlRknxxT/DYMDqKR4FvnLfw==
X-Received: by 2002:a05:600c:1c12:b0:3d3:5841:e8af with SMTP id j18-20020a05600c1c1200b003d35841e8afmr39220308wms.25.1673004243330;
        Fri, 06 Jan 2023 03:24:03 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r126-20020a1c2b84000000b003d35c845cbbsm5801507wmr.21.2023.01.06.03.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 03:24:02 -0800 (PST)
Message-ID: <d5ead4a2-3b98-68cd-f444-2bdbdb265876@linaro.org>
Date:   Fri, 6 Jan 2023 12:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/8] dt-bindings: qcom: Document samsung,gt58 and gt510
Content-Language: en-US
To:     Nikita Travkin <nikita@trvn.ru>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Siddharth Manthan <siddharth.manthan@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230105123240.1089375-1-nikita@trvn.ru>
 <20230105123240.1089375-2-nikita@trvn.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105123240.1089375-2-nikita@trvn.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/01/2023 13:32, Nikita Travkin wrote:
> gt58 and gt510 are Samsung Galaxy Tab A 8.0/9.7 (2015) tablets.
> Document their compatibles.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

