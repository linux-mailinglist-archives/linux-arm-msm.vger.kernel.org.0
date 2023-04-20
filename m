Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C81F36E950A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 14:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjDTMuA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 08:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbjDTMuA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 08:50:00 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496A910D2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 05:49:58 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id fy21so6050244ejb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 05:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681994997; x=1684586997;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86inLg404iy6XZr71SasfCq+JcTZG2gc/SGQxXWY/6o=;
        b=ewdl5zIzTb8Mb0OWtnf8fTIKE8H0qqG6mX9jAgtmwfdnUfORpwAQluc2xLkCrrbD6I
         z+xRcFlNRGEYEQ5IuiTscCoq/5gl88w/CRG+eBGnkMaZOoibewDxQkXy2VVRTbzlaBKq
         MUaQjvweyhGGi6IvJVOO3j3olh9q8tAh15GRlSNPiZKhwH0vqvLmqk3FFbLUJkX5loUB
         aRhfZNeA3aOK0vushyxTKhGd2VZHLGuKOwWBVf+/N0fYOJ4y0AAGCM2KxDJ5gVFnC2gp
         iHOmsM5nbquivT3o43u/ZgDhncRWA4bE6ezOoaOrxJJljYYaQRbckSkwhXfYRCx9OiUf
         O4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681994997; x=1684586997;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86inLg404iy6XZr71SasfCq+JcTZG2gc/SGQxXWY/6o=;
        b=XTW3J2yBdIxq98pDXCktZnvKr7WAU1T+QaZSmWTuO6AuVFtD9AFf0GNTLYvAKnpVDy
         A7pfAniZZihQ+jT5/LMRJ7kBFdzsY3RdGqlQkwG9+rw+G5BukI9UhKV3I9WB9dp4dK9N
         RA95JzjB7XG8t44tNjN3+3UFJnSg64HvLJ80bbESOghROMNH2nZ0TTkMj/QCMPrJ/7Cw
         TX1U8kErLds47Z5jkZthLOXyHAUk8YRSTPE2itMAuEGrrYqyG1I/rEpU5KnhPkVQAvwW
         MvkD5lAmFNtflvbdDqCSsM7YbnW7+pyNE5rltfedrKLpz1YpYRhuLARfchhsQLscb28M
         HpBg==
X-Gm-Message-State: AAQBX9cvWFvQfKWBytxs6L9ywYHEreavUUQHoqBepVPUUnVre3aECL4h
        dn2cOXhK938k6nd3NwoA7lsEzw==
X-Google-Smtp-Source: AKy350Yx+YoxEu26bUs+n4hWzHl2DS/ZsBBqF9kIcEeumzVXzc+55WJ2bfeR5ZuzHO7Iv3lxtaHQqw==
X-Received: by 2002:a17:906:53d2:b0:930:b130:b7b with SMTP id p18-20020a17090653d200b00930b1300b7bmr1640306ejo.6.1681994996750;
        Thu, 20 Apr 2023 05:49:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bcb8:77e6:8f45:4771? ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id o9-20020a170906774900b0094f8ec35070sm697649ejn.113.2023.04.20.05.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 05:49:56 -0700 (PDT)
Message-ID: <daa2de06-9906-cc4c-600e-9f16351d7d43@linaro.org>
Date:   Thu, 20 Apr 2023 14:49:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ARM: dts: qcom: ipq4019: fix broken NAND controller
 properties override
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     stable@vger.kernel.org
References: <20230420072811.36947-1-krzysztof.kozlowski@linaro.org>
 <ab7c0eab-4b80-2186-de92-dea3df58c298@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ab7c0eab-4b80-2186-de92-dea3df58c298@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/04/2023 12:42, Konrad Dybcio wrote:
> 
> 
> On 20.04.2023 09:28, Krzysztof Kozlowski wrote:
>> After renaming NAND controller node name from "qpic-nand" to
>> "nand-controller", the board DTS/DTSI also have to be updated:
>>
>>   Warning (unit_address_vs_reg): /soc/qpic-nand@79b0000: node has a unit name, but no reg or ranges property
>>
>> Cc: <stable@vger.kernel.org>
> Cc: <stable@vger.kernel.org> # 5.12
> 
> (g show 9e1e00f18afc:Makefile | head, rounded up to first release)

You do not have to do this. The Fixes tag defines backporting.

Best regards,
Krzysztof

