Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C135B554601
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 14:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243716AbiFVKDk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 06:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244144AbiFVKDQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 06:03:16 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8D713FA5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 03:03:14 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id m32-20020a05600c3b2000b0039756bb41f2so8639876wms.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 03:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=zL+2CjvSrdsL4OQ+/F/1vKu4W/7f37t6bDH+weGK1Ek=;
        b=RK3R5MNLkIXfDq2koc29JTbbfyFfY/7u6OcbZzKFfcDEuwdm+Hm3daeyThx6Gt5xuw
         +H1e+/G102pxH7ZmnUKa3U6tgTokPjtuG+3UozRBc4mp1++pu0AxUU33Z4g7AMlpuqBB
         Xdh/aO2rSk9o+L1wSkANXIs1ItBXuIN3svNtfg7QZI2tdwZDDYjvkumDICi+ukehecxF
         8llg/Ce0AqBQdKTbB5Oh2FsR2nthwLqE7c9voEKyRzeTDURGCWPxgmNLm9wPu0W9VzIM
         rt1kbDF7aknOm6KXcX8/xkuvnigEVVQUotG+1EuWWpLZwik2nCQFuOfE8bKXkma5qrA1
         B3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zL+2CjvSrdsL4OQ+/F/1vKu4W/7f37t6bDH+weGK1Ek=;
        b=JWKS6kMZ1jDbvtPaOR64vO69RvPdcxZ/BfcXhOPgqJcRGr71RLeYyC1VZ5Wg4PtGJn
         OnPMipA88D/qWibXXvoVhYfVWKib7r4DVBOOfk85D1hYKYuH0u7Hxvm9tFDnOhLUGL/w
         +Or4tXJQNsHmm6SzXPK+12GTJqIj2HaCZjGXKRP/XVzVhBTUNXK9XAkfNgewiZV7TFfZ
         8fNaAoPBlg/kA7FkHKgDjd6pNZXpFyVPqJmO/FeZ5TZXihwVFGoDZEDnsWVzz5sI2E8R
         8Hvzj/L/tyRw1c6b9WaApZ32tSV9uW7AJ0WUMje+0c7GHK9Z5+QOGOxbmuOfhp//0NGm
         /jRA==
X-Gm-Message-State: AJIora9uPH3ZkHUpa713crZtMA4rO9ux0MGbOanHHXVbh6pyszIQEeco
        P6M7uM0/1IFWs/C2h2JoqXl3Tw==
X-Google-Smtp-Source: AGRyM1t9ODJpeuEdEbqjQ738bcvn0AFBEmzkLoAAWR3yJyXm93p8zwoUbj6ZqWOK4rgc047LqSQVVA==
X-Received: by 2002:a7b:c752:0:b0:39c:4853:24f8 with SMTP id w18-20020a7bc752000000b0039c485324f8mr2981837wmk.184.1655892193339;
        Wed, 22 Jun 2022 03:03:13 -0700 (PDT)
Received: from [192.168.0.224] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u12-20020a05600c19cc00b0039c4e2ff7cfsm25787419wmq.43.2022.06.22.03.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 03:03:12 -0700 (PDT)
Message-ID: <1e2ce3ed-0f16-c727-a4a3-befa347e16d0@linaro.org>
Date:   Wed, 22 Jun 2022 12:03:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sdm630: order clocks according to
 bindings
Content-Language: en-US
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220509144714.144154-1-krzysztof.kozlowski@linaro.org>
 <20220509144714.144154-2-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220509144714.144154-2-krzysztof.kozlowski@linaro.org>
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

On 09/05/2022 16:47, Krzysztof Kozlowski wrote:
> The CAMSS DTSI device node, which came after the bindings were merged,
> got the clocks ordered differently then specified in the bindings:
> 
>   sdm636-sony-xperia-ganges-mermaid.dtb: camss@ca00000: reg-names:4: 'csid3' was expected
> 
> Reordering them to match bindings should not cause ABI issues, because
> the driver relies on names, not ordering.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 168 +++++++++++++--------------
>  1 file changed, 84 insertions(+), 84 deletions(-)
> 

The media/bindings patch was accepted. What about DTS? Any comments?


Best regards,
Krzysztof
