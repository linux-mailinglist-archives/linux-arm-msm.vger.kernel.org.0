Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B89A251BB4F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 11:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351347AbiEEJEN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 05:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351298AbiEEJEJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 05:04:09 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932A71FCF5
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 02:00:29 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id y3so7405083ejo.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 02:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9AhHvge8RPPYxMTc08AdPjB0Im0yrHzhMR6FLazEcKY=;
        b=qCcqE7MjKRccPt6aVTkfa2QCmPSM6UECqx8iMHUMeYy7r7GtvA4hPANJ6oS5frF3Oy
         K7t+2k/Qj+7oxoz/8PppTw7UDI0HuNnIIxhhV9kJ0R11ryMFNziwtFc6LFyvAQSI226p
         jdggYUSFS/V8rKTveXc/9EH+uqfreR1WV8PB83QVHzofB0RuTuyNS0L6HJljo57wxO0b
         foLI8v6fh/oXQNRQoiOmtZRzDvkb2alBnjzS1u9J355JmXvsuKy8FtPqx43Fipa2u3K/
         SOeOJpvLDnmZwZuSDORaItASRxuR2eUTNcDkA9iVkiat4JaUVWWRcmdGDwJofVu5u9JO
         K61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9AhHvge8RPPYxMTc08AdPjB0Im0yrHzhMR6FLazEcKY=;
        b=jBB0agFZezT7V82upmmpmpF5DR6FkhWqLmoIV5++ekID3+LntoK93rqQ9axNj3/rql
         1I0WrvTQYlOmEJiRi6JuMqHQEDIcIv5GNXWsESTqzkBzjdnL865z0vVp2q2gS3aPpqVu
         cLD9cdRA2LMFI5BXRx8r3Zb7MH/PuUYupIQ4mX2wYMf0aqsBc2NSrB5vWtY6R3YVzznA
         pkvJtQgywnE7hXY9va1zUYAvtfNOmgmPqpcEIyEyKVUFytoIgLckFlapofhKoNA476Tc
         54YLgX+GWHNjw2DJ8d3M3Fl1r0tb32Z1pHpBLxIxCCNkfuDkYzol4TC2514aC4g96X5V
         vD/w==
X-Gm-Message-State: AOAM531ratbG1eAB34VC0FV8CC4N7NQ6+4gwhhypv+EfHIIfM6NDPkiN
        RE6OZYnJ7oPc7WgHbBalBth/MQ==
X-Google-Smtp-Source: ABdhPJyVYeKkXidgPkQrPg7qjd5RnUZ/ol5zwHrgIrLMcOzGQ7cFpuk9ivJ15p5PLg/Zb/0gPvZatg==
X-Received: by 2002:a17:906:300d:b0:6ec:c1b:9780 with SMTP id 13-20020a170906300d00b006ec0c1b9780mr24836204ejz.415.1651741228199;
        Thu, 05 May 2022 02:00:28 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z18-20020a05640240d200b0042617ba63a0sm537952edb.42.2022.05.05.02.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 02:00:27 -0700 (PDT)
Message-ID: <a099eb33-91a0-0262-f6c0-a77dc7aec146@linaro.org>
Date:   Thu, 5 May 2022 11:00:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] spi: dt-bindings: qcom,spi-geni-qcom: allow three
 interconnects
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220504125119.190526-1-krzysztof.kozlowski@linaro.org>
 <YnKVLxmz0hhQGNzI@sirena.org.uk>
 <cfba178d-ff36-910b-3067-ce32b701b643@linaro.org>
 <YnKZyCogvngR7zfc@sirena.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YnKZyCogvngR7zfc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/05/2022 17:20, Mark Brown wrote:
>> Thanks Mark, but as explained in commit below "---" - this is a fix for
>> commit in Qualcomm/Bjorn tree. Could you ack it instead?
> 
> I was expecting this to be a fix for some change in the DTs in the
> Qualcomm tree.  Why is there a change to the SPI bindings in there?  I
> don't seem to have reviewed it...

I don't know, Mark. The confusion was not intended. The second patch in
the set depended on SPI patch, so probably after three weeks Bjorn just
took entire set.

https://lore.kernel.org/all/20220404064017.68634-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof
