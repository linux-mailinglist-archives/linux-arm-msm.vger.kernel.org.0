Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3CD04F05F9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 21:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbiDBT7r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Apr 2022 15:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231822AbiDBT7r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Apr 2022 15:59:47 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA72FFB70
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Apr 2022 12:57:53 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id i27so5275852ejd.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 12:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CTS+Ip4BTGEFZUlSMz44QvTyeeBYV9kdeaNljtycro8=;
        b=YWgHiPOBHJ6swM4FsJenjmz2o24qpjOZKscmp3Zk1ZwZ4lJsH+ADdisZOewKJpPsMd
         GFlXINxMCaAPEGpW1G5chekViYD8CyGGA25i6dmBy6Yngtdsmc5uE518+IdEhV2KbzKx
         1e8d8dR1PGPgrey3CCjakXigighu/SQqpmxLHryw+IcOHdgvGWDumUBZtLfaHstYQ45s
         ktbH0oHsN2g4iSASoX9gk0Nl4JcJqXyF1mowX/9iCbsjxpv8ZlbvKl7moZJMRgbPr/Oo
         QUki0FD/YdSWcHcJv9ao1LxLNCbvJn0eyF/fkqC/pUF2ywQ7OYyLQnI0Yw1gUMW2AZzY
         fBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CTS+Ip4BTGEFZUlSMz44QvTyeeBYV9kdeaNljtycro8=;
        b=S9pB/vmnpEoZ4ZXg0B4/RGqBEpyzT8lXnQjQiuqY0fGvb7287atgHnjv5c6mdZT+B1
         t5vvnDeBzQYS8v6h8UNnvzlwZPkdgoqAffiHdo2FeFeJ3UifhcRu1iobJnMHMAG/TFoZ
         Z4XucD06LRuyP2wn4/O2AwQ69rU8LOV5IwOyEHk0cvFHVcVWLe751+eChwm3Em+eOBkW
         Q0eUTPYXCO+8PXqm/5KF8LFMNbZmKMdkw2yNCvY4JPL2tySuUMXo4pB7MpP4RoP2+DJ4
         ukWwQ2dPp/vhzeP+YRdrrZzx8u97AEvVnz47yi7qIpvTHOMXF++79tCriQJECc+swiVe
         k4Bw==
X-Gm-Message-State: AOAM5302rQ/TCh6uSF9SfQw8jJfn5JJP/og+gFoZufz9j/6CnRMov3vT
        tJ3STMlRKmt0olfjiOyvO2/xLg==
X-Google-Smtp-Source: ABdhPJxfx3xopyMVaLrIzERU4TjCwEaY/+buz+oZUEOJcank761ouAdg/mVhW2nFrc8qBWKStXWNsg==
X-Received: by 2002:a17:907:3e0d:b0:6e0:daaa:63e0 with SMTP id hp13-20020a1709073e0d00b006e0daaa63e0mr4786049ejc.657.1648929472243;
        Sat, 02 Apr 2022 12:57:52 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id t19-20020a056402525300b0041952a1a764sm2834201edd.33.2022.04.02.12.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 12:57:51 -0700 (PDT)
Message-ID: <a25961c9-3e37-46d7-844d-01b0c8a1eaba@linaro.org>
Date:   Sat, 2 Apr 2022 21:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] dt-bindings: i2c: Add Qualcomm Geni based QUP i2c
 bindings
Content-Language: en-US
To:     Kuldeep Singh <singh.kuldeep87k@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20220402051206.6115-1-singh.kuldeep87k@gmail.com>
 <20220402051206.6115-2-singh.kuldeep87k@gmail.com>
 <b27db209-d146-e104-6f0c-b0d860e9cc8c@linaro.org>
 <20220402194453.GE35664@9a2d8922b8f1>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220402194453.GE35664@9a2d8922b8f1>
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

On 02/04/2022 21:44, Kuldeep Singh wrote:
> On Sat, Apr 02, 2022 at 02:29:59PM +0200, Krzysztof Kozlowski wrote:
>> On 02/04/2022 07:12, Kuldeep Singh wrote:
>>> GENI(generic interface) based Qualcomm Universal Peripheral controller
>>> can support multiple serial interfaces like spi,uart and i2c.
>>>
	
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  required-opps:
>>> +    maxItems: 1
>>
>> I have doubts this is correct property. Usually it is part of the
>> opp-table. I see sc7180 needs this, but I think it is a mistake. Do you
>> know how it is supposed to work?
> 
> Not sure how exactly it works. I took reference from
> Documentation/devicetree/bindings/clock/qcom,videocc.yaml on how to add
> required-opps.
>

I see now that power domains consumer bindings also mention it:
Documentation/devicetree/bindings/power/power_domain.txt
and it might be actually used via __genpd_dev_pm_attach().

Let's keep it then.

Best regards,
Krzysztof
