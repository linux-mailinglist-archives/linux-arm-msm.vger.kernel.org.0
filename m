Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADFA05EF3C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 12:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235011AbiI2K6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 06:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234980AbiI2K6S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 06:58:18 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FCE149798
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 03:58:15 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id m4so1580696wrr.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 03:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=Y8k6HyDBszj64BwC2qtIEEe07MYDoltxAmzJSGk1N7Q=;
        b=UWUdzlqcGG0YM1C4iLI1uCwf/PSjh8asWIA/a72AXk5m12lMrD+jp5PsRMPGAaRTkv
         6XqZ29axUx6TWRbU9Gt7FjLASu8DeLD9zNvneoRr5dHzx3LfG6V7Fa/lum3xTplYv2e+
         D9s5GT/B+PRBnPfgHsqs48jjMKvu5tvUOnTQphJdmQNumbHcuIJm2otmvKJbtnVnuiEF
         paEiN2YelFE5xsyDqObNeSSFin/WL+eFgfvN6lNZByLS0dEv/KvcE/ZjAkR5Tq0wkWcB
         9GwKE56HzmgZZa87kynkvpwrUv1FUsmXvNOyb1RhhrTg3Z3YSsTBAQ3xI8gOsbyGOsH1
         gthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=Y8k6HyDBszj64BwC2qtIEEe07MYDoltxAmzJSGk1N7Q=;
        b=JaNb4xupeXzMQcBWqtfkqXzm4CGW1nmsD/tMdYw9HbVFzXSPPZWeyxlMrrKqu9m24G
         Am6l4IX4fwjNQ4TXdcc2wW5DELaGF2S3IHLnDdS/x/YIa0H8hvxD2LuZcqwopgk0XP/t
         fDjxdVbMIB1qZV4p5aoUOzaUXFnBHD5EXIHGdj1THd4a+h4V0pI1v80C6igTMAYPqGzR
         VaMndNJCKGiBXf/O/ZxdN6lBeTBhyG1gSUU06abQl6LWJld6A7AyNPmFSYjOowuc4Mqh
         VZaO73Ik+fub9/ZhNbQCEuBFkuvDmPilrRbSH7iXpmMgFwLgp3my+bTIxwzLqeH3kWtK
         2Gyg==
X-Gm-Message-State: ACrzQf2IHi36iS5eFOZtXZLY3EBxND+O0eJwHVSCNN/dPVyT08lf3dwG
        YGs2nKrP3pYNATYV0yA62F4CGQ==
X-Google-Smtp-Source: AMsMyM5v3FbJzIRC6hkNrwDFoQ5L7cPjj1FEELj2rfhU8paSOOTL+CdsUEX5xNZFZHqxpySU2T2rwg==
X-Received: by 2002:adf:dbcc:0:b0:22c:c8ef:2bf0 with SMTP id e12-20020adfdbcc000000b0022cc8ef2bf0mr1819107wrj.254.1664449094558;
        Thu, 29 Sep 2022 03:58:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1f17:3ea3:4e46:dff? ([2a01:e0a:982:cbb0:1f17:3ea3:4e46:dff])
        by smtp.gmail.com with ESMTPSA id w11-20020adfd4cb000000b0022cd27bc8c1sm1749479wrk.9.2022.09.29.03.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 03:58:14 -0700 (PDT)
Message-ID: <9c65e8fe-cbda-979e-2ee6-86a0016ce55e@linaro.org>
Date:   Thu, 29 Sep 2022 12:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 7/7] arm: dts: qcom: mdm9615: remove useless amba
 subnode
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v1-7-b6e63a7df1e8@linaro.org>
 <1d859da3-89c6-d08f-bc10-e5f39c1cd2d4@linaro.org>
 <a3dda998-77a9-e33e-b2ed-aabc2916df89@linaro.org>
 <bc1f3007-b603-407a-5b9a-9bf4a70b1f75@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <bc1f3007-b603-407a-5b9a-9bf4a70b1f75@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2022 11:05, Krzysztof Kozlowski wrote:
> On 29/09/2022 10:19, Neil Armstrong wrote:
>> On 28/09/2022 20:05, Krzysztof Kozlowski wrote:
>>   > On 28/09/2022 11:14, Neil Armstrong wrote:
>>   >> Since amba node type has been deprecated, remove this subnode and
>>   >
>>   > How device node can be deprecated? simple-bus is still supported, isn't it?
>> The amba subnode remained after the amba compatible was changed to simple-bus, there's no need for such subnode anymore.
> 
> OK, but it is quite different than a node type being deprecated.

Well it's still related, it's because of the deprecation we have a now useless subnode,
anyway will re-word for v2.

> 
> Best regards,
> Krzysztof
>

Thanks,
Neil


