Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8391C4F0560
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 20:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244863AbiDBS0X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Apr 2022 14:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiDBS0W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Apr 2022 14:26:22 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F586DBD0F
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Apr 2022 11:24:29 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id u16so8590560wru.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 11:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MpP5tMzlVT97DCsXRGEb24iOg+E3Ct/YpLQmX1mvqMo=;
        b=HgXWNE/hFd3yEXhfRAlqQosWSph7ZcBbIdzrEVWa5k88aYzA5NqgBw6PTdAQqTvE3r
         pnsBONHYxFPRbcQ0EOhq5j7K/ulf/jL0nljM1dHaVgiu8unnZ3avcCLKbhpHiUk3NKt1
         n66ncWS7ZnJrbfgtqNV6d6p3G3mUG23ECU1artSWceXo3sRRQ7OY7OZiwSVKUM5e8h5g
         v+OOOQT9WrLTAA3HWgYcnTlxUn7c5MjU06EzJrHUyvEaR1bAShlGNw2F0C5d72kY0Rpi
         5+dDq4Co2/43+xlj1Q/cZJvOlkXyQu7cik71r2xzWKOe+FtVwFYshUBvCnzC/pwpUfS9
         MKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MpP5tMzlVT97DCsXRGEb24iOg+E3Ct/YpLQmX1mvqMo=;
        b=AoMwbBed5crTy41w7nQmjTRtGG8CB/mcAg8/yG52pb42Q0yrwjj9j6b/858EJwgJk6
         yKCCKjfCgUZYuK7xgbDJo+TSacCIvIpNf+shorZ+u1e+PqFH+/J9RHe8ggSfFOSTMyro
         ksICMS3P29+NTeuChTXUGYAnES7LboCfNnr7w1TpNN16LdhSxX+O4/KPRK4HX86vBDkO
         oYHLb001RyURk8LNIDPnoXWWrrfzHzDg+qX1IhY7GL+fRld/TGYYh+n8LODe5JMhRfbY
         yuJ1y4/IKOmUmvJRXRtYaSGHApG/ZiAUOrTPftIMVebzQmYN83ad0D4gHJFHgFaKbQYz
         khlw==
X-Gm-Message-State: AOAM532Xai9z0nrrZwlQE7/lG0AlaU8XjWzjiAy+UqINabzw+wvOZHrM
        /L2WrqAKAHTC/NIhJEOYTv/AUQ==
X-Google-Smtp-Source: ABdhPJxwj6OiIV5XsBWzlet7KuFQwDDTn3qzeMv3EQDAImRrUp/htKknULpYtWY9PjbEo8tdtAShIw==
X-Received: by 2002:a5d:4c82:0:b0:204:d78:7635 with SMTP id z2-20020a5d4c82000000b002040d787635mr11827185wrs.318.1648923867619;
        Sat, 02 Apr 2022 11:24:27 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id z5-20020a05600c0a0500b0037fa93193a8sm5899277wmp.44.2022.04.02.11.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 11:24:27 -0700 (PDT)
Message-ID: <dcca767e-2ad6-4d81-d273-3878b07bbc8c@linaro.org>
Date:   Sat, 2 Apr 2022 20:24:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] dt-bindings: i2c: Add Qualcomm Geni based QUP i2c
 bindings
Content-Language: en-US
To:     Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20220402051206.6115-1-singh.kuldeep87k@gmail.com>
 <20220402051206.6115-2-singh.kuldeep87k@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220402051206.6115-2-singh.kuldeep87k@gmail.com>
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

On 02/04/2022 07:12, Kuldeep Singh wrote:
> GENI(generic interface) based Qualcomm Universal Peripheral controller
> can support multiple serial interfaces like spi,uart and i2c.
> 

Few more comments.

(...)

> +
> +  clock-frequency:
> +    description: Desired I2C bus clock frequency in Hz

Skip description, it's common for I2C controllers.

> +    default: 100000
> +
> +  interconnects:
> +    maxItems: 3
> +
> +  interconnect-names:
> +    items:
> +      - const: qup-core
> +      - const: qup-config
> +      - const: qup-memory
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  required-opps:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  pinctrl-0: true
> +  pinctrl-1: true
> +
> +  pinctrl-names:
> +    minItems: 1
> +    items:
> +      - const: default
> +      - const: sleep
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

These are not needed, they come from schema.

Best regards,
Krzysztof
