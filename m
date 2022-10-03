Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D32445F28A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 08:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbiJCGqO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 02:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiJCGqN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 02:46:13 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2549332079
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Oct 2022 23:46:12 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id l14so619191lja.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Oct 2022 23:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=GBss2BvV7ncDn+of25u5GesYBMaFx1PDINKixp5pMKQ=;
        b=rzkaZ6gGKlJkRBRLQQgopCIDLehxUIZuoDHUhuLMPLx9y7toK0VW1yeLXFr6qxq5N2
         SNQQV2S1DHwabvbNlGhUFLXtHnkfpLBzwzRx7o9Nga24jt8Ps0yFPkS2kCrEz9s2p+/O
         FRxpZX+XozR3wJYd9Nb/mHfYDno5R4LhpB2IgtkanKDRagtNIdk/2apAL8vJaLC9hOnv
         vITW8NjHu1fe376Q/e+XDlCoAxg2LfwsEePqxdOb9i8MIcP1O127kMYip0Vg1/0S92O1
         tfZ+1ba55UsOMLBom1Z20KeyeTmbdvDA9sqGiP+QrZ+2xT0a7jd2YrMBicvlyVHIcYR/
         o4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=GBss2BvV7ncDn+of25u5GesYBMaFx1PDINKixp5pMKQ=;
        b=M4yECUulmqrcsujdNjsj2xdYcaVjzOCgItaAHbZiScGVWNEoeLyvL+L5HS5ToGYk2K
         UMpEzidJPl5VSTa/gZgG3pIxyp+LON7Oszx4rhO2OBvhTXAnrlGOeW47JCSMocmpM4ne
         QjgLFKafvCdPtszqy3NXG/4nDhfrL9fJW0qc9X+KjD8EyGyGO0HY5aFhAA/xGDsjLBhE
         fjWiWvJBFWdEGS7N2okWTHgkBeV/4SsilFfkBI8h//mGjtqdHk3/81IjFbL5LuUufefg
         z+zyJce0IrtLCTtgwch/fkH8ytZj5fN6cRjYWBBnLqPYn/LWcYjLPFhUbW44wDaOBBnE
         vIqg==
X-Gm-Message-State: ACrzQf0V180q9KvQD6xxNJbFmWvifeLLbgFzFBZhZfiLU60CDNwKoo/S
        iV8vCpOYaCqgb3s+NG68933Lcg==
X-Google-Smtp-Source: AMsMyM6VTbrIdbgrlC/jqlj+9Qf8O2sbZGi2mGlLv5ZeU8YFBKgyJMfDrqPekzIAJBH+LU115CeeQg==
X-Received: by 2002:a2e:9c8b:0:b0:26d:d04f:acc9 with SMTP id x11-20020a2e9c8b000000b0026dd04facc9mr1794424lji.347.1664779570538;
        Sun, 02 Oct 2022 23:46:10 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f5-20020a056512228500b0049c86ca95bfsm1332705lfu.52.2022.10.02.23.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 23:46:10 -0700 (PDT)
Message-ID: <4658c7bc-b26f-d22b-73ea-9deb7d29f90f@linaro.org>
Date:   Mon, 3 Oct 2022 08:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: YAML-ify SSBI bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
 <d1a26c97-75db-5d09-4c4f-77ed4fed1683@linaro.org>
 <CAA8EJpoUtfWFR315jiC8PzPQydM9kT3kQYeqyOav-P9=qZKO2w@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJpoUtfWFR315jiC8PzPQydM9kT3kQYeqyOav-P9=qZKO2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/10/2022 15:46, Dmitry Baryshkov wrote:
>>> +    enum:
>>> +      - ssbi
>>> +      - ssbi2
>>> +      - pmic-arbiter
>>> +
>>> +  pmic:
>>> +    type: object
>>
>> This is quite unspecific... Can we make it a ref to some PMICs schemas?
> 
> Yes, I thought about listing all compats, but probably a $ref:
> ../mfd/qcom-pm8xxx.yaml# makes more sense.

Then full path - /schemas/mfd/qcom-....

> 
>>

Best regards,
Krzysztof

