Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEDB566785
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 12:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbiGEKNu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 06:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiGEKNt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 06:13:49 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0549585
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 03:13:48 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id t24so19749033lfr.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 03:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cLjhHLrbRBnYiVAOCNhcYbbg+1XpO08dGVEQiEigido=;
        b=NokVD5aeNj9stoX6SL9K7J5iP98z+qj56ikZljVqZfxNlvBdGGeYXxMh0F5JndN1FC
         GtOq9Ejxu35KdYEDvApSJA5U7E8l8jCd9wPmco0VlUftMK6OspoEKj0gsE3fkzJdKLRG
         Y5Lqu69MWowm2utmq73ikL5F63glMys4dDxIU4dVtr7VwlPhsq54UOrAyALxpu/izWK8
         KpX9f5FLxeVfLqcJ1U4k817QRBe/uxD1DUsNiyxsoy5QQuZmuWLG6Y/ccQS2jaKU/meQ
         +6NF0zGrSlSfPnlykGS1k0h/Y8yt1ptey2o4l/BFh8H17mwFekV/9ParMWFzH4gp2R/7
         CwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cLjhHLrbRBnYiVAOCNhcYbbg+1XpO08dGVEQiEigido=;
        b=FIqz5t3HwAl0PWat/qqrQnITB5xa9pinWjHEALQKldZcCaEEj8VQ7W0Ifa9tW9KNqy
         EVoAYk0gFKR6Rfv6gSxA2yOWNfz61s9NNvVCatFYxlaQTvV1EAentwx7O6Ey9ZGzuTz3
         qrYv8/ZM3sHNfsekZPaHgvXL7Ii+T4YTwllwKbbvafp5sacpuzH0dds0ytwaR+UEswN9
         2A3N/kj/AWFPRl/qlU98GKPhdYzH3MMCcrQ74ec8BJqjYodCwtRAEU8LOSGHlBhvF9mD
         zVAE02oCy7R/QYys8jGN+hxGhXvHqkfW13d7fLNjrKO4qgNBSGYlT0/K/LE1YiAS+Osh
         DeXg==
X-Gm-Message-State: AJIora+c1oMY+XPm85xFtvIJkGQK+6q/G/+TBvR/xUnAhF4Tl8N8PHQa
        wcbqeykaQT1lVR3zrEyudnNlMw==
X-Google-Smtp-Source: AGRyM1uZsAzZdN771jYqFkZTGKGgnuxS95JZHOFMEG9qBWCRtFMChuq0B2wnLKhmNJ/+m+DoTVFchw==
X-Received: by 2002:a05:6512:128f:b0:47f:879b:dc9c with SMTP id u15-20020a056512128f00b0047f879bdc9cmr23369198lfs.478.1657016026738;
        Tue, 05 Jul 2022 03:13:46 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id r25-20020a2e9959000000b0025a70f7ea3asm5468127ljj.138.2022.07.05.03.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 03:13:45 -0700 (PDT)
Message-ID: <1db53d76-575f-53f2-d52d-1241e5053f59@linaro.org>
Date:   Tue, 5 Jul 2022 12:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 13/43] dt-bindings: phy: qcom,qmp-pcie: clean up register
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
 <20220705094239.17174-14-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705094239.17174-14-johan+linaro@kernel.org>
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
> Only some USB and combo PHYs have a second dp_com control block.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-pcie-phy.yaml | 2 --
>  1 file changed, 2 deletions(-)

Squash it. This patch does not make any sense on its own.

Best regards,
Krzysztof
