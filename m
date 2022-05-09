Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E571551F7FE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 11:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237068AbiEIJQW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 05:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237071AbiEIIoQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 04:44:16 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC54B1AB7B1
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 01:40:22 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id c12so7925654edv.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 01:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=HxhOGtQf6WluCi49sQ42WpKK1M3738iJw/Ad2aCa2VM=;
        b=XgeTONWuKoYjTxbuoXtsky7Y+hE20RHlkAEEYCCM8PodBuBG0llJK0iXuxQh+f1ihG
         UVTunqpn/uDaBIneesFgNS6IiHb1JZvsE/h9947cJ2A13vmuYGIIir4vsd/sB538mR9A
         86D8zEjUQG6YDgJNBOjUi9ZdWsAHUzf+kxcmuHZlotKFe6mTKsMupDoDXgoEjhr1zPQu
         hBo0wpcrlbr9213/zUh2YaBA2P6P2jiSQieB8n/1y12gM8exgXXTYHC7kJ5t7j4f6lMV
         w1NdXedF2gDek/slQEUHymYx8MoGsFA6vnHiiqt4ocSDGwxM6huL1hOIZSwHYdsbRXIK
         xLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=HxhOGtQf6WluCi49sQ42WpKK1M3738iJw/Ad2aCa2VM=;
        b=c83xCF6JVPgw+ODtLz9LNbuUDdlOprGveN/j2ZzUGrOzjjUmjYNGrpjB5D9+MnOWxY
         YPK2vUwU++gqsN8hF6acHDsYLQ3XmhXbchCJ+iWRlloZwEvblPsBUmPLROMmOoDT4waV
         b2Jq12+Nvm/qyrZLKlM/ZlU6JhITk2NG+sjbxJ0LXuUO9hd0d4bSZIe+bo4r/vI/8+Vg
         yHwL+NFCEZZhoCMLkRsTBOLYYMGkTZDYcvQcyEFow5Zmjn+ZqU0UJS/Vs9BzqVPmPn7c
         NOa6CttjgEAZC9dxRxzkH5pF9fP7VTlLTWrgjCBwXtZCVjJ9xuwHYap6j6P1jX+ST9VC
         ucWw==
X-Gm-Message-State: AOAM531kBSqwDACTxNLn4lMYpGjJTRErdz846bxnAKoWrP2GBPV7VJSy
        oj0oQRP6CBIUcWpAo8h3b2WbVQ==
X-Google-Smtp-Source: ABdhPJwGm9qVTNeCVY755repJ14G7TtzwPzTGnWz+T7AdDHMM52tb66IK7LZ1siC3g005v4szeEQgA==
X-Received: by 2002:a05:6402:350f:b0:428:43a1:647d with SMTP id b15-20020a056402350f00b0042843a1647dmr16183322edd.62.1652085621304;
        Mon, 09 May 2022 01:40:21 -0700 (PDT)
Received: from [192.168.0.243] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a12-20020a50f0cc000000b00425d6c76494sm6005508edm.1.2022.05.09.01.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 01:40:20 -0700 (PDT)
Message-ID: <fef5f229-f247-d032-fc76-46ed7083dbf4@linaro.org>
Date:   Mon, 9 May 2022 10:40:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] dt-bindings: qcom,pdc: convert to YAML
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220103074348.6039-1-luca.weiss@fairphone.com>
 <bef4922d-4a32-f184-44a1-8f5430190938@linaro.org>
In-Reply-To: <bef4922d-4a32-f184-44a1-8f5430190938@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/05/2022 10:38, Krzysztof Kozlowski wrote:
> On 03/01/2022 08:43, Luca Weiss wrote:
>> Convert the PDC interrupt controller bindings to YAML.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>> Changes since v1:
>> * Adjust description of second reg-name as suggested by Maulik Shah
>>
>> @Rob Herring: Hope it's ok to keep your R-b given the above changes
>>
>> This patch depends on the following patch, which fixed sm8250 & sm8350
>> compatibles and adds sm6350.
>> https://lore.kernel.org/linux-arm-msm/20211213082614.22651-4-luca.weiss@fairphone.com/
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Luca,
> I think this needs resending as dependency was merged. Alternatively,
> maybe Bjorn could pick it up through QCom SoC?

Correction - it seems that Rob took the dependency in April, so this
should go via Rob's tree as well.

Luca, can you resend without Rob's Review tag and ask him to pick it up?


Best regards,
Krzysztof
