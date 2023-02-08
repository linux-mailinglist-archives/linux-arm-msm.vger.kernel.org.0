Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3564368EA07
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 09:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbjBHIiw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 03:38:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbjBHIiu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 03:38:50 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE1C457E0
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 00:38:42 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id a2so15663342wrd.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 00:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HTBw1Zblvv2nrDTct5adacGjkowCixqI+GvXz5iW4TM=;
        b=jV5jcogrDrf5c27u6mYOwI1xN1OlcXwjJOWUnlgKGTP5h+a8cjk9W4E7Z0nGq/k6Kw
         AzIPdKFv5Mi+/7xJJqrR2p89L8x6le9/k5F/qKQGk5ZrAXEaaY7j7BHi7PGAlUPOT/EF
         SsiQnSLqCmmwi9EB36a+hBDsLBQ/mGJ9wTZCgd7/cp1t/rA0AithnLKDPPjMG0Mu5Y/O
         PvBnwjzZru6xuJHvL5heDCdq2GDwR2FqSEJbZiKANTNkA1PgVbAkBdy6fnPp36x9BGqU
         qYx1222YcXY6RfLpOq4kIChnhuEB96zJUS0AoGm7gcOO/rPIpzX4IeQFLAkWrU5diDsP
         YJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HTBw1Zblvv2nrDTct5adacGjkowCixqI+GvXz5iW4TM=;
        b=Feeb+Szo2eyZErvTLKsyU49IPRITox7I0zgZ+314jaS5WtFVwySso155w0ar3k6pnH
         ekKWG0JSPayO7G4wP0pojgno0EN0ruYLjgNUYhwhuEUY61bgRWYSWgLmtcpk1I2Uo90r
         HanZkcXvvhB8NUt5O0SKP/BMo5Xc7Y77P70D3xSYrL3+IvrlQL4URdrnC33UhCpFwb5/
         p69sHPLKGTZzpavAaB3ggyxoRgMW6PDnVSau0jMyMv6Zt4PTG/CbhLcPF/CzQ6vduUkq
         9xhBo9yq6Km2a5X8a8x25kqHg/aWaJGZfHplhqBGSFet8W9meFrJLuCcPjoecwkMDmWv
         +0qQ==
X-Gm-Message-State: AO0yUKUo7ITVKpyPdsBP0oneLpdWxg85uyeQFt7pljuqdUaF7ENjiU52
        Pm37LoPP1xygKUQfgvgbDmldgg==
X-Google-Smtp-Source: AK7set89BMaKU7qp6x+H63/n7/aMt8v9/7EhbTePh9/0iZ9YlDP5pQi+M4qn4sPZjbTtJEGE1jKDJA==
X-Received: by 2002:a05:6000:10d1:b0:2c3:f903:8d1c with SMTP id b17-20020a05600010d100b002c3f9038d1cmr1278667wrx.57.1675845521015;
        Wed, 08 Feb 2023 00:38:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d4b87000000b002c3e65c9533sm7641913wrt.67.2023.02.08.00.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 00:38:40 -0800 (PST)
Message-ID: <a45ab9ff-9820-7def-ff1b-2186592256c0@linaro.org>
Date:   Wed, 8 Feb 2023 09:38:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 3/7] dt-bindings: phy: qcom,snps-eusb2-phy: Add phys
 property for the repeater
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20230207135551.1418637-1-abel.vesa@linaro.org>
 <20230207135551.1418637-4-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207135551.1418637-4-abel.vesa@linaro.org>
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

On 07/02/2023 14:55, Abel Vesa wrote:
> The phys property is used for allowing the eusb2 to interface
> with the repeater, which is modelled as a phy driver.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

