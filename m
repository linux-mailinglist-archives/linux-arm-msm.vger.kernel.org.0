Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC4B25805C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 22:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237209AbiGYUfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 16:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237198AbiGYUfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 16:35:24 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D32DE17
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 13:35:21 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id a23so17436825lfm.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 13:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kF+g+F7mYcIUaJYAQWrmzn8M6Wb/+yPNGEuaPjJTuM4=;
        b=c1E4ypsrj4lfQjVDS1PjLkofXsBCBIYDZ1iSIrtIkmc6jnYy+Q+NdEG9xEhHz7sCTb
         7S8gZR6Kr0566YVA6fqyBfHCGzMq0XTU6LjPzw+gKr9GarCxMwFKil9NrN5y5MNqZi25
         23ZJNUw8tky4+kkjcWOway9aElUecKZBb9L80dv2B1iSCGvkn3+n5Evi0EkUBb6kQcoa
         k4Dg9URTwEyonbgRpBNIgMlnNq9XkMWZVoHVhPinK1jsRrVO6eO9XgfrAGw2XsL+bgcn
         jgo9TAy/07Pet6Ww4BN6yscaYs/KCpunHCdXKQKkwd3FEsFvJjZHS9XJFEyAOogPD16E
         rUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kF+g+F7mYcIUaJYAQWrmzn8M6Wb/+yPNGEuaPjJTuM4=;
        b=tsbvrRZ9uF3XdGZTQqUy6E5aa/ukEtyxOiZfTCZhCWsVXd+z88civS7d6ek0JdmssA
         t2cuaTaQAoXKkfvCHIx0yHvvG7PaSx44NAu8mV7NMmgqB+wHSA6OvAZZuLP2w6pMiczj
         U/nDvaq38Y5k34xqBLLtU91sB6ChZaKNuqtRkS4jbqk5ZlicklW8t6osJBoEJVvqNgyS
         aCaTXjwQ+C1Qa0Rldn7kN7Bj2XCbc6jkfCuO9HBSmQEOB/bkWtiw+/AtntHF1rQ2Wut6
         AVoTKcOzRWKX73Gw9UeiLX1qHaddvcE26qfRrGySrQWbOJpb8I9p6yppic7UvC1aqY8U
         L99Q==
X-Gm-Message-State: AJIora99KWsII0ePUmirccgk6qp+ENnU9wbiFOQr0U+8He/nTIm38jWO
        Eci+I9xLlKiwCKVrkk3xq29qkA==
X-Google-Smtp-Source: AGRyM1ttV6py/cPAH9tBoi/teqtLFo+O1OebISYGtEbEAaJj118/1dMgrgbrEF7axMWM/vp84mGJqg==
X-Received: by 2002:a05:6512:2302:b0:489:da47:6a90 with SMTP id o2-20020a056512230200b00489da476a90mr4974106lfu.12.1658781319674;
        Mon, 25 Jul 2022 13:35:19 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id s7-20020a05651c200700b0025deb36756dsm2339404ljo.103.2022.07.25.13.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 13:35:19 -0700 (PDT)
Message-ID: <ea2cc75c-611f-f612-e692-325fb7e98d6b@linaro.org>
Date:   Mon, 25 Jul 2022 22:35:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: ufs: qcom,ufs: add SC8280XP binding
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220711101441.4896-1-johan+linaro@kernel.org>
 <Yt5+EU529KriiAvE@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yt5+EU529KriiAvE@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2022 13:27, Johan Hovold wrote:
> On Mon, Jul 11, 2022 at 12:14:41PM +0200, Johan Hovold wrote:
>> Add SC8280XP to the DT schema.
>>
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>> ---
> 
> Rob,
> 
> Will you be picking this one up?
> 
> There doesn't seem to be any other maintainers listed for this file in
> case it's expected to go through some other tree.
> 

The preference is that it should go via subsystem and get_maintainers.pl
points Alimi, Avri and Bart. However in the past it seems indeed Rob was
picking it up...


Best regards,
Krzysztof
