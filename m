Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 367755E9C7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 10:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234265AbiIZIws (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 04:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233581AbiIZIwr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 04:52:47 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F8703C8FB
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:52:42 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id x29so6652762ljq.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fGOUmGA2OvkzH4gvUMT4q+s0GP6cvg309dpR1Lh/Q+I=;
        b=skb5eGkVIdaKEYWcUY328JzdIAklewPFvYCdAc9LEKW8gXr/a9ch8k2DOGhSTR95V0
         d2HYYBAb4QZQDjTNF4yU7fhJEVHqLu/zsezYY4xal/iYzOemN2yC83GU98jCy2jjdjaf
         ZilZWUn/eHqWilld82MA8Vw4QXcCrxqN13I2LvSFskMCW8OoJ3pDbJI/osefOz6/rB61
         /WQo6RXjRQ960cSKF+h+qzVWHQU1uZzfXIqX3J4Ut/c6PLx9NuFGDcAMQMY1EBmpKyMx
         DsiPrq193ByR9aKDQHzNUpcSkQT666x8wjuXL+wLHmdNPAImsw3IOyaTeYK4jeso5GU6
         FXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fGOUmGA2OvkzH4gvUMT4q+s0GP6cvg309dpR1Lh/Q+I=;
        b=LoQHdaqT2iD54YREmAPA1RpIRDMjPtJPAX7Nq3Se2Th4dCiN5qfhuI1JeelBc8kCSz
         P5cvjQhJ2DzwtDYGoqd6FbUsfirZTvbJtL0h2ej54Bd0SzRDeKqb406/UKN0ng4mnftA
         CgidJ2InDa7EhB9rBu/8oXjNoU59rzq4LGP0wZJTdTD/Ns3kELoAxvS3NgX8M3nNYeIL
         8pekDlR7XqHqeU9EP0LhOQx91Z+uRIRkRN1yf38DBeF7JbIkKaNL55m/A4afzG97TP2i
         peEDuUIyk9ejiBGvNsnoBGIS9hZ1JjaNB6JQH5P+4Q2dNdoorMG8LtcowiXPjMhAzWYp
         l2jg==
X-Gm-Message-State: ACrzQf158TcC1Uj0nIMm9ZIfPglKjHQhYdLnwNgNuys4qO9wMxNtQd3p
        J97/vRou4H1lkfBBRF92sXi7DQ==
X-Google-Smtp-Source: AMsMyM5Ajk5AfaxbDN4rp47XT2gP6+CpxrPeMIKuEZ5BcAw18tpOiyaSnSrH60Dd9k26MtzzZRQq0Q==
X-Received: by 2002:a2e:740f:0:b0:26b:da32:1b9c with SMTP id p15-20020a2e740f000000b0026bda321b9cmr7015359ljc.262.1664182360566;
        Mon, 26 Sep 2022 01:52:40 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t18-20020a056512209200b0048b969ac5cdsm2466676lfr.5.2022.09.26.01.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:52:40 -0700 (PDT)
Message-ID: <69231c08-999e-d8a6-69a0-f18b24776cfb@linaro.org>
Date:   Mon, 26 Sep 2022 10:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] ARM: dts: qcom: msm8974: Align dsi phy-names with
 schema
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925172443.92900-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220925172443.92900-1-luca@z3ntu.xyz>
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

On 25/09/2022 19:24, Luca Weiss wrote:
> Use dsi instead of dsi-phy as required by the binding.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-

Already sent:

https://lore.kernel.org/all/20220924090108.166934-3-dmitry.baryshkov@linaro.org/

Best regards,
Krzysztof

