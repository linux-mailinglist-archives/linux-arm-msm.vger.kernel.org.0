Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D42EB552469
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 21:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244706AbiFTTL3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 15:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244585AbiFTTL2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 15:11:28 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6201D167D7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 12:11:26 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id v1so22895792ejg.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 12:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=p8Cq4R+8FtRcvZYSme69qC94a9sE8Xu5aJ+c94otTdk=;
        b=o919jSIV76WguZgSYpOa1+5sKIJBkfT6eHCmTxwi7OxB3whAEpiI+hHjiOROiBQaWo
         LJLqq4ubHd/EWli2QCr6HdrFNd0YD2SD7mlwS5wNXxHBRXpetDvsOr0WKlvJ7hEeJKfB
         9eCL7bs6/7lOEba5m7mVwFYU9ar1XWSg4RbXlzb0NN4yjtX/809yGFEU4djrUEEei4ai
         Xp02NTsnMThyNop+yyGqSiPuR0rlR0ALum9PxvNJBL2RiXkXMRgV/xry6W9Fvuolij18
         nI7w+lL8XDT/nE4NVKAZf/lxdsp4p8zK3tNy9wbOX9aTkZxq4OdzdfpqjFLh5HagCbIi
         33ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p8Cq4R+8FtRcvZYSme69qC94a9sE8Xu5aJ+c94otTdk=;
        b=EWCjor7s7yN4tmguRHL3a4T+PgcbkDNptUDdREnA2SxfumDpuRkPzaP32FDHelVwiC
         ACJi91hbRGjeJttrstSWwR4vhEO8Z4A57QZZ8v843Y6Kl/qo9D99kgV+HnX/bwe9hZSP
         f9zMUbBqIVB3QSd7V+pFnO714wRcTuWxwbQkm16WeL9FBl8NUPnwjv6awJ0P9quAc8l4
         A24/TFodVyvvOyWJu54MVd4OjWvvvsBrdjvVH3gbwVEJKUVwf19TifaN488AtbFR4LRW
         ZO5UiIpjKHpZXi3Iml7HHqP7hSfpJWYduaffXBp/Uc30o48TPdeyy2OeF3xucL6cZKgq
         352w==
X-Gm-Message-State: AJIora+UfRHsaAWIDDsEsp/+BT9FaHxe3IRXV/ERzCg/TD7YbHQ/jJFv
        qyvF/l5ZtByuX7KT2hxsYjiUVg==
X-Google-Smtp-Source: AGRyM1tgyOsdlguQWQfFO7W7cyKpleASmH1jchFTWI935o6WNHeRhKRm+G+JUR/RRE6d1Bwufw1msQ==
X-Received: by 2002:a17:906:4a13:b0:715:85cc:9224 with SMTP id w19-20020a1709064a1300b0071585cc9224mr22375632eju.267.1655752284923;
        Mon, 20 Jun 2022 12:11:24 -0700 (PDT)
Received: from [192.168.0.212] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g8-20020a170906538800b006ff05d4726esm6372433ejo.50.2022.06.20.12.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 12:11:24 -0700 (PDT)
Message-ID: <a0dbea42-7a6b-142b-17a0-c819040b7129@linaro.org>
Date:   Mon, 20 Jun 2022 21:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/6] ARM: dts: qcom: use dedicated QFPROM compatibles
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220505113802.243301-1-krzysztof.kozlowski@linaro.org>
 <20220505113802.243301-2-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220505113802.243301-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/05/2022 13:37, Krzysztof Kozlowski wrote:
> Use dedicated compatibles for QFPROM on APQ8064, IPQ8064 and MSM9874,
> which is expected by the bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
>  arch/arm/boot/dts/qcom-apq8084.dtsi | 2 +-
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 2 +-
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

I'll take the bindings (patch #1) but what about DTS here? Any comments?


Best regards,
Krzysztof
