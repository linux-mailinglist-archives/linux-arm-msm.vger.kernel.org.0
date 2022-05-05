Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB1F51BA9C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 10:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343617AbiEEIjm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 04:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349687AbiEEIjE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 04:39:04 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6E312746
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 01:35:23 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id g20so4348892edw.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 01:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8kO7QCHGCne68GYXczGxAGiwBY8jMQXd1Ly9yp866KU=;
        b=Tq2Lj5sQBF9LAGbNoqQ2JGXC62P7kgvSvfVs08YDTPHhMEgdxVdBLz6X7JolcE6LtP
         ndphpXlJi0GcCk0hxQ1wjPkH347gEUYF2Rcw/3DTz25oBUdNG2pW3bVGNEweroW8yBEm
         YEwphZeqEWsXhRIEdzsBrDUhlXkqle6I8i5NTrTKeLMGJ1zNrvM1n4Lmggac0rqcOvV8
         lDnCX3V51kzrXd9dtjJMOmh90I/N0tlRBKQFlUmfL0NEbuRRlSQe/vRgCTiZq3/nIRhK
         vF5PcKa0cfY+eJn+n1TqUxKvriO1vb3v4fzFXEaR0pCfpip1LxZrkagACCPABd4iNq1o
         uZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8kO7QCHGCne68GYXczGxAGiwBY8jMQXd1Ly9yp866KU=;
        b=PM3VkHhTbgihXW8bU+vH25v73FhXwjWFWjik3BUTvSwQnKISuBsere0QNaM3NbYoSx
         x2T3Eay2/wiiwAIE+pjmkCS7VyUSZ1wE/NUT8+LcdLZ2NCFAm2JsUC1Qpog3b4XZ8oGO
         mj/1bf/T0cQGJtyuZEtHskaAljcQnrw0ae6Rh5U8+Zca04yz+hWZSXRvdt49y87uOqtF
         DCvIPJUrlIBKn4bCyPeSo8qHiUYbAMTXQ8TohoaEYagUnMUoKTCma85xtoF8rfUqHNqy
         29JelBbU51xWQQmFYAUsb1ahgovuwBTX0Kld2tlvw2qkPI2GMhkErxm5BN2tJzSNlG3r
         iOgg==
X-Gm-Message-State: AOAM530e8PZdH06uzOwQ1F/gPj10IpYH+eqR6vO5JnT1SVhBIQyqBo7l
        WlSZ5EZbTDmqkfGwY6fSDk6LLg==
X-Google-Smtp-Source: ABdhPJwIqe09rAc0tNzIO2qX2RWAxzun0hwQjzf2mMISopdokDXCWkTsEVXDFrgW7UE7FTAKReYbgg==
X-Received: by 2002:a05:6402:27c9:b0:427:ba7f:6288 with SMTP id c9-20020a05640227c900b00427ba7f6288mr22398071ede.416.1651739722273;
        Thu, 05 May 2022 01:35:22 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b21-20020aa7c915000000b0042617ba6380sm510483edt.10.2022.05.05.01.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 01:35:21 -0700 (PDT)
Message-ID: <ec1afdc4-54be-71cd-1873-6959e132a45d@linaro.org>
Date:   Thu, 5 May 2022 10:35:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/4] dt-bindings: leds: qcom-lpg: Add compatible for
 PM660L LPG block
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220504205704.699500-1-marijn.suijten@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220504205704.699500-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/05/2022 22:57, Marijn Suijten wrote:
> Document the availability of an LPG configuration for the PM660L PMIC in
> the Qualcomm Light Pulse Generator driver.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +

Hmm, there is no such file in next-20220503...


Best regards,
Krzysztof
