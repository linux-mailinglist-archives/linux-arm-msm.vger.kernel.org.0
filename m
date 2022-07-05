Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62D5F566788
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 12:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbiGEKOG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 06:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbiGEKOF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 06:14:05 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9DD13FB1
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 03:14:04 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id bx13so13914524ljb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 03:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YExG+e7a0Sa7NJEj+5xnmdh+Unak83hrCasOVIHdEy0=;
        b=tC5uSfTj4Fy60naqPgp97OwT5AkHHkfee+8eLp9FoH20tHMHMBXKU6LRfhi1UyHp6r
         tfak6nHwHQpcDAFT1DyLkYQ+e5CZbeOkExJKZ4TuDAddCQvMqNr6HQc+GEguOi8Ew0Am
         Yvy1+wrD71g2WKI5CSDwKbAdQgl7eh/YIRg0rMbRzj3JU8yuAWVuJuaC2UhSRwr3efyF
         9yHEBsyT7rfs/QYHGn/hBkeoG5oV6AuFloT5fCSHcyTqSJ520bWvAQPDYC8R+YAUXFhC
         1fV1YnanYXK92pbnwVwkloKN/pOmmiPim0RA/ArsFxmj4AAhEF2U1LeGDx8DfCefa+Hc
         +KOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YExG+e7a0Sa7NJEj+5xnmdh+Unak83hrCasOVIHdEy0=;
        b=D6uLm8j4lF3bQQ5NCjOblOQRj3hIJnPtrgWY6s9fHl2M03Efl6uM4LYI3ymIRFIuL4
         nf2nOfoNXVIQ/UNXpqlq8hGj8aWA0H7VXJyPeYnEDpmp6hV6y+l48fDKZmVsMPpSYuDZ
         S5SVqye10RkBB2a8Eu+6vhhdq/OP0gGqlkRk/Vv/rF3pNOGhEWByW84KRBbXSv9STJf8
         UNWVBUDx9O7ACajuF1aUTIu5ScXKhtKRfWnKn+IzKSvACNHW1QT2Igw0LNQUsUSPkFEp
         +kjhqcJwoqoZxrvunf2RK5RaMnuy08tUK0mfxWQNe5GgGByMmdfZvGaE3MjyS1BBS6Jl
         r1Nw==
X-Gm-Message-State: AJIora9oDigWfGldnRwhUdD7SM6zqSDcanlb0YPfb/yCBCRXvL3LwCs5
        0N8wFHLc+RyxXiYfztbWy5T2IkQ0lXdhpg==
X-Google-Smtp-Source: AGRyM1vW5Lmj5rXm5hrCoWS2Wi54jz7pYqa6w/8RzgATIbyj3LK6r4kZKzxJzLIg4Aujo3fpMmE2ww==
X-Received: by 2002:a05:651c:244:b0:253:ecad:a4ee with SMTP id x4-20020a05651c024400b00253ecada4eemr18710012ljn.21.1657016042713;
        Tue, 05 Jul 2022 03:14:02 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id i16-20020a2ea370000000b0025d0fbe3e46sm2004851ljn.13.2022.07.05.03.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 03:14:02 -0700 (PDT)
Message-ID: <9b3864e7-b6d9-8601-989a-50ac4db32f7c@linaro.org>
Date:   Tue, 5 Jul 2022 12:14:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 14/43] dt-bindings: phy: qcom,qmp-pcie: clean up clock
 constraints
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705094239.17174-1-johan+linaro@kernel.org>
 <20220705094239.17174-15-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705094239.17174-15-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 11:42, Johan Hovold wrote:
> The PCIe PHY binding requires two, three or four clocks.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-pcie-phy.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Squash it.

Best regards,
Krzysztof
