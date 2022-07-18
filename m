Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B26C257842B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 15:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235229AbiGRNrC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 09:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235441AbiGRNqu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 09:46:50 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560D027FE7
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 06:46:31 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id bp17so19417553lfb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 06:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1Ca4WmtOXZ89SSKgkCTyyeuFvpbtZ/WHhtifhXbvcEo=;
        b=rb1wVT0dKmKGL97pEjcvYwz/fhSAmZNDc0P4/hdcXz+Fufj0XsGMDTNfdqNosxjrb/
         57AUxgA+P0U6Qi3HPr/LuS+AR4VkKsWCyA3nOiO25zhwMGvWP6UHSZgZ3Kkgy48b1+/a
         iLXztohSBaWRIPlwjdgq9YjDCDE6RuSc76qJYd2/OZxeK80wgSdqVtbWZvtpnPfku/XF
         7X6oOZAigrmYDSv/I5NK2Dj56r7N2aytqo2F4ObTzgLgtL1eADFzIkKVIhNiv040iT0A
         /tB/gsbgZM3btLohUMcR3B+lDMnBgC/VKIacpgbR1w/m3CI3LZr+AYCfbZntDqIXGPqf
         /NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1Ca4WmtOXZ89SSKgkCTyyeuFvpbtZ/WHhtifhXbvcEo=;
        b=zAqJNXOmePuInyjVBpG6HZ9Z8ckEb7yqUOz5QMizRwScMosgH0efdyzdKPrgQWN5dA
         bZXPQj4YQcfR6D2LL7vy9cV0pst+REfpUPz3YriYCtl2IMLT3mB5zPJ2Ra+NIVHe8BBo
         JGTw6TBkyiYkDn5dq+cdgTFy0MQPNtf1JXA2zlDY+Poh2nSDqtidQLrOgr/c0Myl7ooY
         6u/ipGYpEizoZXQbS9Do/SyxnWK3bmWdD/dLFnY8kHUZJVqmjPnbg4PC57wPFzgfmRPS
         zFwe1jfUF2i+cTCExJF6YEZKDE2tu0pDCafipxaAPVnw8Pc2ddnlhALumzuyqK0cn5cY
         zaww==
X-Gm-Message-State: AJIora/ckxbB26S74a3MPXSCJiv6Td0q90RaweHj4WJmsmz8EpprjKHU
        NgmbrRVRpNue0r+Yy+PhejC2Ww==
X-Google-Smtp-Source: AGRyM1uONSabiSDCR4AmrDqvp810Jrfu+iudY40VuKCfH8AAfC6slMQ6f4KBsjQXUXAjBHW7qOTadg==
X-Received: by 2002:a05:6512:12c9:b0:489:fa6e:d371 with SMTP id p9-20020a05651212c900b00489fa6ed371mr15583105lfg.37.1658151988393;
        Mon, 18 Jul 2022 06:46:28 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id q9-20020a2e84c9000000b0025d4f025ab9sm2112445ljh.70.2022.07.18.06.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 06:46:27 -0700 (PDT)
Message-ID: <6b9ff2dd-fa49-0e3e-f832-5af903749aa3@linaro.org>
Date:   Mon, 18 Jul 2022 15:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: Document samsung,matissewifi
 device
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220717213432.134486-1-matti.lehtimaki@gmail.com>
 <20220717213432.134486-3-matti.lehtimaki@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220717213432.134486-3-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/07/2022 23:34, Matti Lehtimäki wrote:
> Add binding documentation for Samsung Galaxy Tab 4 10.1 (2014) tablet
> which is based on Snapdragon 400 (apq8026) SoC.
> 
> Signed-off-by: Matti LehtimÃ¤ki <matti.lehtimaki@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 5c06d1bfc046..5a24dfd66823 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -104,6 +104,7 @@ properties:
>            - enum:
>                - asus,sparrow
>                - lg,lenok
> +              - samsung,matissewifi

samsung,matisse-wifi


Best regards,
Krzysztof
