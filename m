Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AAF15F3CEB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Oct 2022 08:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiJDGvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 02:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiJDGvl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 02:51:41 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C662EF0B
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 23:51:25 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id a10so14303172ljq.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 23:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=g+2kBKCFqg27fMdvA7YfCO4+hmBpxqYEDzgwYKdhvKg=;
        b=eRwN/H2mREJisZVjpmVJV5JEGZAry/ktEVZaYtUIpo2gLkdPbLGOOoOrFuMXGm+224
         8dTXDwNqG7rZ5Xdv8W24ypL4xMnfQi5fXXvZ7nygb7aGdrbN/fKy4OFY0NktjXB1JBLR
         ma7ezR7oDofG2yTcL9EHmWdsVBbuRZSr2oxPWQIIhr2CsVtyQ22BNLuQeQ2/B8FYKhzo
         yth6j4epISgBljGZnQkWSSanZafoBgDDenkPnPtQmRcLtMkFXKEAulCtM5jPBd4//Zcw
         AjrpLzVCrTLCuD97aYDGrDVvjjoTbkWknFwoTMTLm8rdPuctho0LlHw2+XhbWHSOsNTA
         aFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=g+2kBKCFqg27fMdvA7YfCO4+hmBpxqYEDzgwYKdhvKg=;
        b=7XzYGILZFXy7iynE86V8VaclSZIq6ipSzjSBSxvEpmC15gA6YGEGftCqFTMzjvN6et
         /JCBpBmTJd9SOQ3N1pieLV/M+k/o0J1eJRqBE+sc1E9vVgHrfiGJ4Oj8mGbThiyQmYVU
         ZZGmsiehRT55QhZFTqcY2dQt4nm+EjkVeoZP9hWfFmi2oc5IHqIg4QcHyfybedDZBHvQ
         JTIOThM+dAQZUycqtj6hIINYBuY2JUZ6CAQVNcQ/aMf7ze+IRWBSxEIw8MF3WgA54pIN
         5XJdSP/RfS3JgpieYTBModlq513TcIXM0UuDBoTL1eWTNlfWunHEcAkiBCodEFZwjeDm
         vYhw==
X-Gm-Message-State: ACrzQf27nL1aDJgLPA+Cl1RfUunmcRnxZmEWY8kzRJ28Za/aF8aD7vui
        emSFBDgwPyGekTjQP/uthVGVnw==
X-Google-Smtp-Source: AMsMyM7QVUE1ju3kFrqWCNbg0f/6jKhJcOftXpheLrGr9bnXzOrPVa2fNCUhZbOLTT+S7Jaa66GLvg==
X-Received: by 2002:a2e:bc28:0:b0:26b:d979:fc72 with SMTP id b40-20020a2ebc28000000b0026bd979fc72mr7907465ljf.292.1664866283592;
        Mon, 03 Oct 2022 23:51:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e16-20020a05651c111000b0026dde66326dsm527458ljo.109.2022.10.03.23.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 23:51:23 -0700 (PDT)
Message-ID: <92bd8960-7b50-46c2-3374-9d0e0237c985@linaro.org>
Date:   Tue, 4 Oct 2022 08:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-db845c: correct SPI2 pins
 drive strength
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        "# 4.0+" <stable@vger.kernel.org>
References: <20220930182212.209804-1-krzysztof.kozlowski@linaro.org>
 <20220930182212.209804-2-krzysztof.kozlowski@linaro.org>
 <CAD=FV=WSbpV4aqyHgSX6rwanQmZYG1hdNourjP5DEmsfdq6aDA@mail.gmail.com>
 <11a99a84-47ec-ca3e-5781-0f17ed33dbf9@linaro.org>
 <CAD=FV=URMX9umJfqYOhnnnjsr09As-6mKAHs0YNZFK8n2K337g@mail.gmail.com>
 <c0bf359a-1ee9-04e2-2c58-9e7e8f3e12f7@linaro.org>
 <CAD=FV=WmXbBvnC_phmTNRfYa68TObOYVRQWe-X4kv4aQPD5rFg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=WmXbBvnC_phmTNRfYa68TObOYVRQWe-X4kv4aQPD5rFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/10/2022 01:03, Doug Anderson wrote:
>>> If this really has to be one-off then the subnode shouldn't be called
>>> "pinmux". A subnode called "pinmux" implies that it just has muxing
>>> information in it. After your patch this is called "pinmux" but has
>>> _configuration_ in it.
>>>
>>
>> It is a poor argument to keep some convention which is both
>> undocumented, not kept in this file and known only to some folks
>> (although that's effect of lack of documentation). Even the bindings do
>> not say it should be "pinconf" but they mention "config" in example. The
>> existing sdm845.dts uses config - so why now there should be "pinconf"?
>> By this "convention" we have both "pinmux" and "mux", perfect. Several
>> other pins do not have pinmux/mux/config at all.
>>
>> This convention was never implemented, so there is nothing to keep/match.
>>
>> Changing it to "config" (because this is the most used "convention" in
>> the file and bindings) would also mean to add useless "pins" which will
>> be in next patch removed.
> 
> I certainly won't make the argument that the old convention was great
> or even that consistently followed. That's why it changed. ...but to
> me it's more that a patch should stand on its own and not only make
> sense in the context of future patches. After applying ${SUBJECT}
> patch you end up with a node called "pinmux" that has more than just
> muxing information in it. That seems less than ideal.

OK, let me make it part of "config" then to match other nodes from DTSI.

Best regards,
Krzysztof

