Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 932077C43C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 00:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjJJWZP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 18:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjJJWZO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 18:25:14 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3985AC
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 15:25:11 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so5885829f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 15:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696976710; x=1697581510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NeNBxG8cx8l82M9jSYOd85ZbB8rCa8c/Jq+U7184yFk=;
        b=S5SQskA9ABRG0dDXhy6Gx7nBdCHs1pv1tDkKgteOlp8L3Qz8iqsTSLWFivlPPEWBT9
         n5kTWMM0teXCXnNonvbRNxB0N+9ANxMF3mFX597d9pO0Z7VVU0ST+f8qQx17OjOABdRr
         0RjeeJaqBUSuFjzB9pFG7mnAeCE8FaSyI3yrjdBoLF+SLpux9YMlA9eq9MFYieC9N56S
         6W7slgA3MklyPwtSfz4LBYQzswIXvTMJE9tmYKo4WCg8ORF5P6BK4HrFex7Idk/13MFf
         eydxOOaGXGQr/bHOmMSDzCwEu4JM6XJiMCgtrhXVQ1cjx6nGtjQCPZzEtFrPR3eKl7Wj
         1bUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696976710; x=1697581510;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NeNBxG8cx8l82M9jSYOd85ZbB8rCa8c/Jq+U7184yFk=;
        b=uRGrDKPElizNjwdjsavu5TNJ3thljC335j3Lr1JgBzcb4vYs0G4dBjJ9uy/wsIBASc
         t5dOQsG62j4Sx9IZjvWh0OeHhcgAROuhdgzmD/jbzKq429SpsumHGY7PRWWO6s7smoz7
         0iYn+sHT6nyy06Vx04cbac3w6+mwq5TYg0Wt6XjnLvFe9SSxhf1ZsCky5IGXznQDaj5N
         DAJkz60lQEu7F+BzgFdqcgBISiatOag/YSVSImw3pKx+6lKV5XCescMAxpC7CNsK7z4T
         95LmniQzJVNLGg6qusbgV5nWuQq3svnLBnjlfXSAAncLLegYcjy5Ri9ffKyPSewJF5JK
         b1/g==
X-Gm-Message-State: AOJu0Yw4I0tL7Dw4HvaY4yltymTpAeMQJTisyNFtnMYRi9ESS7TE5OJh
        GZ21C04kR5gKfvaa65ucget05g==
X-Google-Smtp-Source: AGHT+IHEuN5PvxZFSfB7Vg7qUsAC5xOyLico4McU8PvylCjZQ+dpzhndsn+K3J3VxezRxLJ+ps/4iw==
X-Received: by 2002:adf:f48c:0:b0:317:e025:5a5c with SMTP id l12-20020adff48c000000b00317e0255a5cmr16832072wro.48.1696976710127;
        Tue, 10 Oct 2023 15:25:10 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id c6-20020adfed86000000b003279518f51dsm13806929wro.2.2023.10.10.15.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 15:25:09 -0700 (PDT)
Message-ID: <767bc246-a0a0-4dad-badc-81ed50573832@linaro.org>
Date:   Tue, 10 Oct 2023 23:25:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: i2c: qcom-cci: Document sc8280xp
 compatible
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        loic.poulain@linaro.org, rfoss@kernel.org, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231006120159.3413789-1-bryan.odonoghue@linaro.org>
 <20231006120159.3413789-2-bryan.odonoghue@linaro.org>
 <ZSWpm/7xnoFkUn31@shikoro>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZSWpm/7xnoFkUn31@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/10/2023 20:44, Wolfram Sang wrote:
> On Fri, Oct 06, 2023 at 01:01:55PM +0100, Bryan O'Donoghue wrote:
>> Add sc8280xp compatible consistent with recent CAMSS CCI interfaces.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Applied to for-next, thanks!
> 

Hey Wolfram.

This patch was superseded could you please drop ?

https://lore.kernel.org/linux-arm-msm/20231010122539.1768825-1-bryan.odonoghue@linaro.org/

---
bod
