Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72EAF5ED797
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 10:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbiI1IWT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 04:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiI1IWS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 04:22:18 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C646A263B
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 01:22:17 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id j16so19277902lfg.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 01:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=7cDBrWt7yRl5mShXjiaIXy93PiYYOpRWqoYuvjsI5d0=;
        b=i+pjksXSEdZoZGUoyfN2MObf6JtJZ5x1kNTUxPl5efmU/rGX198OXD6sIAYZF8x/eq
         Wu0cFD4awLKaXGfOQOw8yM9AH9UwVWwxffZ6wN0LRdOhdoj5cZ08XVF2uqMK1+hR6NHg
         YBKB0ao+cd/O0F3k5GMio60frevcjCaq8OCv3WMkhH/Zuumy3fi4ectg3May+3MUVLEb
         3NIj6j90wAsBfVIE5mrpO2IRkg7cZGPGKMsIIaOrHVTfVTTXARcSgQOPeG2LfrmsUT7b
         rSBtv7BbYbOdoNLo6R750ULrVqXp8YHoxUGDkcdeyhChvTTQbNZz4dqoR4uDEyWdTDtK
         NqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=7cDBrWt7yRl5mShXjiaIXy93PiYYOpRWqoYuvjsI5d0=;
        b=QCyLQg2jfHoX0u3RNmN71WDkul6V71FPGUoOEctoeh4OVMW3Ww5OUEqd6Wymagbyiw
         hGBDMglm/eqbuC/Je8I+xt1DmgdGMGML6LFtVmpe7Hp31YqgCph2E8Cl4q9B0vOTCai1
         0ADqWh5jvSfHp3uxmDPPkT1AviYPQdzDVyc1P2eB8LNObIuovs9uDepIZloQMDVkgRN9
         EDTNEI5Fbc6b4p72OV6iaJAYEamgtu0czIKEuqiB45t7S8DUZeBNpqkMDWO7Yw/z4i5M
         OyQwihPpVyBTt6Z5/JTgNd7EidFJakSIr2+a/Dw9qmJCF0VPWeW1KESFfBaGkiajrFro
         IlyQ==
X-Gm-Message-State: ACrzQf3H2rKHcBpp4DdXzF8ZOM9CXBXythVWNmGyWmf8s1GwvF2DeMlf
        YvU9AiyezmjOLZd6V7Sf/bsWbg==
X-Google-Smtp-Source: AMsMyM7Je6R4XFdaEj2qXU3mrUyPPzB1fpTL6pOP2mnierhcsRogi9xyzaf9QG5684k/rfejiziYaw==
X-Received: by 2002:a05:6512:110b:b0:49a:d211:bb2f with SMTP id l11-20020a056512110b00b0049ad211bb2fmr12363718lfg.24.1664353336173;
        Wed, 28 Sep 2022 01:22:16 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b1-20020ac247e1000000b00498f51af149sm402552lfp.308.2022.09.28.01.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 01:22:15 -0700 (PDT)
Message-ID: <7ee54a90-cd75-8797-eeac-1eae6283b755@linaro.org>
Date:   Wed, 28 Sep 2022 10:22:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 2/2] MAINTAINERS: Mark Lee as Maintainer not Supporter
 for MFD yaml
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        lee@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220927235108.227566-1-bryan.odonoghue@linaro.org>
 <20220927235108.227566-3-bryan.odonoghue@linaro.org>
 <32557cfb-f379-c408-1e91-8a5441069be0@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <32557cfb-f379-c408-1e91-8a5441069be0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 02:01, Bryan O'Donoghue wrote:
>>   
>>   MULTIFUNCTION DEVICES (MFD)
>>   M:	Lee Jones <lee@kernel.org>
>> -S:	Supported
>> +S:	Maintained
>>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
>>   F:	Documentation/devicetree/bindings/mfd/
>>   F:	drivers/mfd/
> 
> Hmm.
> 
> Actually maybe Documentation/process/submitting-patches.rst should be 
> updated to state that anybody appearing as "supported" in 
> get_maintainers.pl should be mailed, instead.

Supporter is a maintainer, just not only in spare time.

Best regards,
Krzysztof

