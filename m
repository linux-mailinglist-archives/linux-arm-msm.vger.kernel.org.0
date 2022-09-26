Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDB35E9CD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 11:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233855AbiIZJD4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 05:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234667AbiIZJD0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 05:03:26 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E603F325
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 02:03:24 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id p5so6613913ljc.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 02:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=tCNC35ApD2VH3qxIiJ+Puwz9/tMlWDVaDICre/1ZzDI=;
        b=jmPNrXKXqkzMMtNFr/jZyxiQRDnze6dbi4p9GZgMvUrgfQklPl26AqB0IBkioLb+18
         TeVEmWpsoEB9HlELusyht7lgeSL0Lreft/k7j2cRoGOilmAI3HlE43NgUepo/P8zHBww
         N0Pm9FmZamdW/CTZMrmaGNx0NgNL29lsTXIsBtqSmIKMYPI3UMVN5e2mZ5Z0LwszUlFd
         vS/rLUzuguIsKWi5EoOlmVg2g2o3ZLh8EU8UkOvRAl6YU0jK77xOslkVffCx9WvmHqNf
         pE4Rae1P9RtX97qSbgjLLBs3mPoFM1wOx0z9HLY/nDsqZqpONjVwQTIv1jC31z+lEW2h
         oNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=tCNC35ApD2VH3qxIiJ+Puwz9/tMlWDVaDICre/1ZzDI=;
        b=mr4RxKZ3N1LrpXsJBX9bdoNU8D7j+/mOuZo/J7prTL0PslNijSkOhRud+ZuwHMomtJ
         XKhlR8sC50e9G1lWTKVgt+YeKeY/OdQjrBs0QmLAKcGUemKpJ4lqj+WGpMOERb+EtscP
         AcQW6QuI6ecF+ql8XuUeax05D+9zwxldAjeKJMyQUQMyvDIBMLrBN8v4CY2J0965VkWO
         oLg4ccK3/nDbjf+mWJkewIg0taUUh4TuYbyLFeyi5nljTk0RQtC3VlKRuowHTyNGjQio
         sVm+g/imNp4OTKROxtH2UBY3ZtLMlhHGlo6GE0z03KegPRr8mc7j3TeI+txf9EhPq46n
         b1Cg==
X-Gm-Message-State: ACrzQf3pb5zS7RJcl/xCxJUs9qZergGBItZp6G/2YTzseGr5FGADdJ1z
        Te5oqH4VaMA3fM1yioTbTI948A==
X-Google-Smtp-Source: AMsMyM4s2SIF33dWWjNYy4UViC5Bxb3CHL2HruNH56QSRaEuAPTizUg2gG7XElF3GVfe/LSTnmxGtw==
X-Received: by 2002:a2e:9657:0:b0:26c:5b63:83f7 with SMTP id z23-20020a2e9657000000b0026c5b6383f7mr7563095ljh.392.1664183002480;
        Mon, 26 Sep 2022 02:03:22 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id by40-20020a05651c1a2800b0026c446918acsm2293600ljb.134.2022.09.26.02.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 02:03:22 -0700 (PDT)
Message-ID: <bdb3ade1-d375-0767-e221-6fa5ba13877f@linaro.org>
Date:   Mon, 26 Sep 2022 11:03:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] ARM: dts: qcom: msm8974: Remove bogus *-cells from
 smd-edge
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925173203.96117-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220925173203.96117-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/09/2022 19:32, Luca Weiss wrote:
> The bindings check complains that #address-cells and #size-cells
> shouldn't be in the smd-edge node. Remove it.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 2 --


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

