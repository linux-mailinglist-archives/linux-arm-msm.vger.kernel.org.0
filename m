Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B49F6DA01F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 20:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240169AbjDFSok (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 14:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239306AbjDFSoi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 14:44:38 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D008B7AAC
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 11:44:35 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id 11so3654852ejw.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 11:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680806674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q8g90x98LXVZKTYfPdZhxPdL74gdette1vAfoZX+cdM=;
        b=kcgv6yi0QLB7ShwPAKe9m7cXZfGh1sUgla0uyOzsjY5uGcAxJ2IfbzNF6bmQ0ubrOT
         hhIF9q51mp03MMNIKiCfDrSaHbREV/TXY2/y6sqI7RhB1zF7bWgfaxHljti5KIbe0rij
         ZUZDZhu/oxeQG6YOUEL82wi+TwrKYfuAuaQrsj2VffzSYfCIRjl/vorFTCnbCobQ1d1R
         HOmivUXAjWRgclFMneyzgagcvPXeS06eqh5Xmp59lmC4Zh1BmorYzYtwmx+9wleBgfMx
         7DXnFvUwl3VzQPAypx9+42kU2zL/TRdQ5G87765BGRWghf4XpEOju5u3CZaX/JnuRJ+q
         nXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680806674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q8g90x98LXVZKTYfPdZhxPdL74gdette1vAfoZX+cdM=;
        b=szrxiN9qIBXrm1FLRipyNUwjUyGKdxy2wtQxg6IlGNhw7u5cgHwpGf2exNvPI19l2v
         DRpHB2kB1OyUfQa1q4sIDwm2vWLOfjjku7wLuTmOrKz2xNnqwmaSFz9NUptA5KCX/nHU
         XWY0gk+6fG/nrEsXE9wdiit2m/8OL8vPK2DXbUnqyAtwUiLcKvofH96M7JP7QjZ+/qeN
         qDppKDyCAz2yFG2H7o8g4SgMIm1l1ohiFa9NyDpegDb8fRvCltSRQreJ1ny0AGOmKL1l
         vR38YYWtS3Kf3d2Eu4cXQj1GlNKXSrrBR77/LKHVAIjCOCHotK+THlXVgSlsElf5igdZ
         xJKg==
X-Gm-Message-State: AAQBX9f6FdOs7HMe/ceWnWLxB4DZp1S93pas2Ect5+qu40vFTQZqf7FJ
        eO003rlYIS+9UnPMUkPknXCzIA==
X-Google-Smtp-Source: AKy350btA+NYro6fqR3M06UURUJD1z7vnVctka0f92M2FXEcjuP+Gr0jLKj/kQbkTtek6kiTjEYioQ==
X-Received: by 2002:a17:906:c2c2:b0:933:2f77:ca78 with SMTP id ch2-20020a170906c2c200b009332f77ca78mr7081258ejb.28.1680806674282;
        Thu, 06 Apr 2023 11:44:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id h6-20020a17090634c600b00934823127c8sm1136596ejb.78.2023.04.06.11.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 11:44:33 -0700 (PDT)
Message-ID: <4fd0edf8-519d-082c-29df-b96c3d5466e9@linaro.org>
Date:   Thu, 6 Apr 2023 20:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/8] clk: qcom: gcc-ipq9574: Add USB related clocks
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1677749625.git.quic_varada@quicinc.com>
 <cover.1679388632.git.quic_varada@quicinc.com>
 <24293be77ccdcf5e9b1fa0fd219de6152f234616.1679388632.git.quic_varada@quicinc.com>
 <20230406184506.65d2gjycuvrley6f@ripper>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406184506.65d2gjycuvrley6f@ripper>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/04/2023 20:45, Bjorn Andersson wrote:
> On Tue, Mar 21, 2023 at 02:24:22PM +0530, Varadarajan Narayanan wrote:
>> diff --git a/drivers/clk/qcom/gcc-ipq9574.c b/drivers/clk/qcom/gcc-ipq9574.c
> [..]
>> diff --git a/include/dt-bindings/clock/qcom,ipq9574-gcc.h b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
>> index c89e96d..96b7c0b 100644
>> --- a/include/dt-bindings/clock/qcom,ipq9574-gcc.h
>> +++ b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
>> @@ -214,4 +214,6 @@
>>  #define GCC_SNOC_PCIE1_1LANE_S_CLK			205
>>  #define GCC_SNOC_PCIE2_2LANE_S_CLK			206
>>  #define GCC_SNOC_PCIE3_2LANE_S_CLK			207
>> +#define GCC_USB0_PIPE_CLK				208
>> +#define GCC_USB0_SLEEP_CLK				209
> 
> Please split out the dt binding/include change in a separate patch, to
> better facilitate picking both the clock and dts patch for the same
> kernel version.

Uh, bindings must be split to their own patch as they are exported from
kernel repo.

Best regards,
Krzysztof

