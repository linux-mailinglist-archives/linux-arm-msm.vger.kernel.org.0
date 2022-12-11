Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBEF649626
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Dec 2022 21:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbiLKUPl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Dec 2022 15:15:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiLKUPk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Dec 2022 15:15:40 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4691365ED
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Dec 2022 12:15:39 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b3so15312148lfv.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Dec 2022 12:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Al7gvlUoTy7UGqDthGlSVzQcq2lj5xSL3RUL8nU3vo=;
        b=s8oWxL35Ulw71ZUxUjQUR0xwAYVzn4x+SP8fx5hkMGlzNJeT+GYVWWZ0fgE9+HhkE2
         U2G6XuNx4yIhBsG641w9OGVYiAsZzVQ8iZlJ1228jNHQwrThvbPHXcnMfedAvSR2BHya
         tMdeDpuL9cMTrXDvvpmkgfqtv3ju6gm2UpQTBRLJZoGQi7mHv1jedEit15qVdvLtb5v8
         zS8pakRIzEXpsX5TLsQ++paoBjyI7liuuSsu2MNtqCsPZxlReWfiNtFiLTJmhkGA2XT5
         6tJM/zGDVemJRzkB3OQ9nR3Zod89+ur/WD/jn9WZtv4zMdID1dcb2186Usc/Z9T2EWyC
         GzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Al7gvlUoTy7UGqDthGlSVzQcq2lj5xSL3RUL8nU3vo=;
        b=lDwlDKuNEeDUxqcrn5sbytvNUiRP4Rn0mK+XvyoLWVy9XJqpqNDLnVtXbwOzQLwRJR
         bLK1nW4M5JUoZN1+Zsflp2Y1wwAzyEKpSdqX+/PYTog2mY9UUxDSY9Q0QBkw0FO0mYLq
         ycC6F1T2+6bhr5cJpZlBLs8HP7AMRT6ykwN0HHBvuu6YpIUCWuT1oQQnsH/xHB6xDGWe
         giB0TNeq+Ipwu+sLEQiZWxhKI0PDkSQwwPM9MqKXE+5C/Jt0HeQemh4Rlvh3YSgFhpJW
         QJxbx418luI+U580/HwmAAH3NCX17XWk0WuoHVGdtmz1Cfc2Sz1Dfu3p1gJQThrLNRiO
         YP3g==
X-Gm-Message-State: ANoB5pnP2pedvWyHcLyfI6YfFJUgvOkulqiy0CfJZkQtivoesw2kV3lI
        cpPcZOUiedCDU4U1oIzENZUHyA==
X-Google-Smtp-Source: AA0mqf7tJ+q4PuxNS+LMfitslzfdrVXH4RbDvaPUfQNNnBwlF4Ckb7s23Ex4Hr78Jz/aFLdDKyvUIg==
X-Received: by 2002:ac2:47f4:0:b0:4b5:670e:b708 with SMTP id b20-20020ac247f4000000b004b5670eb708mr3443160lfp.14.1670789737703;
        Sun, 11 Dec 2022 12:15:37 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t1-20020ac24c01000000b004b501497b6fsm1331571lfq.148.2022.12.11.12.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Dec 2022 12:15:37 -0800 (PST)
Message-ID: <f260fd4e-a25b-6ae5-0952-63f68b5330fc@linaro.org>
Date:   Sun, 11 Dec 2022 21:15:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: drop 0x from unit address
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221210113340.63833-1-krzysztof.kozlowski@linaro.org>
 <5d21408f-cc99-35f3-c4ce-b13f02c1c1f3@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5d21408f-cc99-35f3-c4ce-b13f02c1c1f3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/12/2022 13:26, Konrad Dybcio wrote:
> 
> 
> On 10.12.2022 12:33, Krzysztof Kozlowski wrote:
>> By coding style, unit address should not start with 0x.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> We somehow keep running into solving the same style issues :P
> 
> https://lore.kernel.org/lkml/20220930191049.123256-8-konrad.dybcio@somainline.org/
> 

Eh, this should have been just applied long time ago...

Best regards,
Krzysztof

