Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC97712E1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 22:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjEZUV1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 16:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjEZUVZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 16:21:25 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FB4F3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 13:21:24 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-30adb83aa69so603742f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 13:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685132483; x=1687724483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NU272Aqvy/lzyGaNXdkjcWOY+olPPaZAJ5pJ+n2dEo8=;
        b=nxyAxSKrqiapojPwLENobemhxMj1VPOmlrjW8M7O4YrVEau1qC80631ZBeCtLXXBe7
         8uHVzvrkGxULIeysK759dgRoSkSkdAdtMmp7giCvi/c7jXYZZBm1Wxzkr4z/Iw7aJ6yc
         4+FzagORcsbejWjHbmIUr8tmbvD6a9d1mIsbdln9NH2ZOsgCDJ0TEeqT1/gKDFaefMFB
         ZooI2cxoPP1nuNeJbNq4NeRxlvjkwPpIcCrJudW/1eTCXu6zRiHExoJKrEWdidmeIXAC
         x2X09XQpGMXj1rTNQYUSGMlksVaGxd0Q4grez2yLvfeUoYxwfuctL3fOs0EfukHBhcg1
         +j2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685132483; x=1687724483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NU272Aqvy/lzyGaNXdkjcWOY+olPPaZAJ5pJ+n2dEo8=;
        b=bEmJz+Gk67/ahrEneLToBdlei8gbmGK27q/bHySoCUtGe3L5J5F293OCCGTm1Qr1gn
         BQL+RZr2GH61EcXFTR1sXUE1Wq8SA8NMX/uZQSe5TKGVlyWszneTzgquPSFkssjCOSIl
         seJ4AmdNPV9PzBmmIxMD+TFietwE02cs8U2arxRoL/DGjGZhfWb6jNH5EeEm01YKhYYo
         Oq/6oB7wcoUEzpuHjlyutKSaIL5D9xuLRPtlSGAJyl8snBOXisloFZtIBU2r0ithtw4J
         Cnl/ZRVPX2DK7O/v0Ffnil9rF7/kQCs1VQ/1YOVaCHEOeHEy1d8lBlAxcHOLQuwILmH+
         z1sQ==
X-Gm-Message-State: AC+VfDy0FQoo6/DnAJLFkfqnn/KaAZj4zezCOQhdz1C/yvB+bO6MLXZK
        IySDqilRctMzprfYtbygqXch/w==
X-Google-Smtp-Source: ACHHUZ41LrbWky1oFHJv1+ifYyV+KuJV3r3qn51IGJDA1Evgvn5TJyDbppHHmSUf9pqxq5IeljQphA==
X-Received: by 2002:adf:f2cb:0:b0:302:5d34:38a7 with SMTP id d11-20020adff2cb000000b003025d3438a7mr2479976wrp.36.1685132482841;
        Fri, 26 May 2023 13:21:22 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id q25-20020a7bce99000000b003f4268f51f5sm6238448wmj.0.2023.05.26.13.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 13:21:22 -0700 (PDT)
Message-ID: <8d89c14f-b2c2-7db2-f637-aa6d90273f4d@linaro.org>
Date:   Fri, 26 May 2023 21:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] dt-bindings: media: camss: qcom,msm8996-camss: Add
 CAMSS power domain
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>
Cc:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hans Verkuil <hansverk@cisco.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230526180712.8481-1-y.oudjana@protonmail.com>
 <20230526180712.8481-2-y.oudjana@protonmail.com>
 <20230526-obstruct-venus-5833511a58af@spud>
 <838b134d-46cb-6237-49b0-0c287141ebb3@linaro.org>
 <20230526-street-pox-2ff5ee106c43@spud>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230526-street-pox-2ff5ee106c43@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/05/2023 21:19, Conor Dooley wrote:
> On Fri, May 26, 2023 at 09:05:47PM +0100, Bryan O'Donoghue wrote:
>> On 26/05/2023 20:46, Conor Dooley wrote:
>>>> +  - power-domain-names
>>> Why is this now required?
>>>
>>> Thanks,
>>> Conor.
>>>
>>
>> Its an accurate description of the power/clock tree to have the top power
>> domain be switched on prior to the clocks that depend on it.
> 
> But what does that have to do with the *names* now being required?

oh the names

no toss that

> 
>> I think Yassine, you could probably include the majority of your
>> cover-letter text in this commit to explain this change a bit better.
> 
> I think it would be good to have that regardless.
> 
> Cheers,
> Conor.
> 
>> bod
>    ^^^ I've been trying not to think about rugby since the weekend :(

Pockets O'Gara should have his paddy papers rescinded
