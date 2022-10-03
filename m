Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC28F5F3493
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 19:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiJCRdW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 13:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbiJCRcg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 13:32:36 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA3438A35
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 10:32:29 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id bu25so17614690lfb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 10:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=zk/FIFXjXpMILVIlFIoyKaAbby/6KJ8jb8SmUTjwY5Y=;
        b=a/O73w00KNm0068Ren0MjKieUEKT53hh9gpmgrlhb7nZi/HJ5ppD1WYJjQbqcw5jnk
         DHNXBpZGFJWnYfCeJRzy9G7LvuR0K4JGSX2kaEFm+x2cslXjhbh+QD037DE0+a63lcsu
         2OtXWa69+nyWDovRPq64ojsfqjIVYIQ1p8J0moOnqYuKlrP/dY0sjQ9Nu9i0U2MOmPmD
         VlDbDWnzqm9tG/CDYSB6nD4ISPIF2ZZqrG0yXxDCcdEgJqIfa5zNSmxGTjsNeDlwdLmw
         gEYF34wI/X8FVWUE3nkw0LNHZe6WsdPmTyH9XO84v4WxzccVYMkY9h0jyWckQsKupTFs
         HFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zk/FIFXjXpMILVIlFIoyKaAbby/6KJ8jb8SmUTjwY5Y=;
        b=3qAvG0XQL09zMTw0r9WhyRdC12azXazk+g3zN7y+uYiyvTpBHPKYAb90BXSZeaZj9K
         /VLNgiASFBL3Va/y8VppzQ1oxYg7uEgMztEjknkj+eNzRSTZTvXQ4ldc3YrkBoja9doQ
         mvuaqmvxvaOpJhbzUVLT1NYto+U3wXLOlhQQ+aBCfZaboVuitjLOp/7DjOTor1wUyHNY
         jMcbLvPzhp1Io6Ted60NiMfu7W9E6+cg3ZfQyR706ePj57On1w8GK2ofSDDczO+5wRVa
         uIAd9MI8lptkfRc3wmbCxuae+ItCns9Xn5OjXVna3MIaSJeDVM9t75inaBSaL4UtPMR2
         H38A==
X-Gm-Message-State: ACrzQf2JNmAZtTQlv07l6nOkV9tnilJqIGdogtzaQfmKgdzBkfDqZIfJ
        rDfur0dlYJ8OMCElhCp74/WvTkWMhUpUQA==
X-Google-Smtp-Source: AMsMyM6Fp5A19LILl+oYBQki9vEji3xbEl4A1Bqn0ONCv0kCWo5r/nBlPmeh5GX6uQd0akuJjP8pHA==
X-Received: by 2002:a05:6512:11e9:b0:49d:7909:ff9b with SMTP id p9-20020a05651211e900b0049d7909ff9bmr7268070lfs.568.1664818347441;
        Mon, 03 Oct 2022 10:32:27 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n5-20020a0565120ac500b0048a9e899693sm1543877lfu.16.2022.10.03.10.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 10:32:27 -0700 (PDT)
Message-ID: <c1e79572-e5d0-079f-76db-c9e8d4edbcd3@linaro.org>
Date:   Mon, 3 Oct 2022 19:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: YAML-ify SSBI bindings
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
 <d1a26c97-75db-5d09-4c4f-77ed4fed1683@linaro.org>
 <CAA8EJpoUtfWFR315jiC8PzPQydM9kT3kQYeqyOav-P9=qZKO2w@mail.gmail.com>
 <4658c7bc-b26f-d22b-73ea-9deb7d29f90f@linaro.org>
 <20221003171714.GA2462016-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221003171714.GA2462016-robh@kernel.org>
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

On 03/10/2022 19:17, Rob Herring wrote:
> On Mon, Oct 03, 2022 at 08:46:09AM +0200, Krzysztof Kozlowski wrote:
>> On 02/10/2022 15:46, Dmitry Baryshkov wrote:
>>>>> +    enum:
>>>>> +      - ssbi
>>>>> +      - ssbi2
>>>>> +      - pmic-arbiter
>>>>> +
>>>>> +  pmic:
>>>>> +    type: object
>>>>
>>>> This is quite unspecific... Can we make it a ref to some PMICs schemas?
>>>
>>> Yes, I thought about listing all compats, but probably a $ref:
>>> ../mfd/qcom-pm8xxx.yaml# makes more sense.
>>
>> Then full path - /schemas/mfd/qcom-....
> 
> While effectively it's always a QCom PMIC, this is a bus binding, so 
> shouldn't it just be 'additionalProperties: { type: object }' without 
> any reference to the type of device?

If we treat it as generic bus, then maybe also "pmic" is not
appropriate. What if other devices are connected?

Bindings were saying it is Qualcomm SoC specific bus, so I don't think
we can have here anything else than Qualcomm PMIC.

Best regards,
Krzysztof

