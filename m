Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBC615EAD66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 18:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbiIZQ7t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 12:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiIZQ7W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 12:59:22 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618FAB1F
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 08:59:18 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id bq9so10954129wrb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date;
        bh=+NjNC0XHNaA+OHqZjwq1VajndeOfx0RI8JRbdcGv3U8=;
        b=OhF+G3roMVIacdGLTEqMWgbKgOHCAoUxTkvjqwSlCmcbcXEjZ4993f2RhLN7FkS03W
         jDZ9Mr0DfPvbKL2OhFOEymuNMEMpvNYJ0onUn7oVOEuYtYCHUQtKvGrcEW9SLNo1h3b5
         3QhAgi84SSs6itwQF8n7xrQ0I4OEUitOyae7d5UHhPIDza7ZBEtaQOI9biWylRQQPUGM
         2KTlE9PH3RqbhgVx8aCKpErTy/es+Wdchtr7gbX2KqbF4lCZIhAcRdzzb6Q1OCw/13h2
         coMmQy4WfVCVvAKwPuALJwNQC2kQozReFxc9GYKLyltzlCBIACTjD2r7BQDIENBrWtFm
         xCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=+NjNC0XHNaA+OHqZjwq1VajndeOfx0RI8JRbdcGv3U8=;
        b=Cs+1kmL8lQ6kpCrQ31DO4oeoREbZ7WiOPlWRw1yk2RzaqY29VZqJSSDm41K7bLc7Gx
         TyHk8Jpe1pskyy4jTd6XFxyC5sSY/GHZxL2PYvlQtLnAA2xuaAc9H4nNBMcYRnD3ADwl
         +VwUZ2B4ioWU7o37GbVPQELLQcHwNbwe1GMdAZ/G7GFLoZ4zqG+o0CunirwvmZAsfQwj
         yMaOYbuKETHm3pT02zaFlfCoRVT340Eyxgp0TRns87qkDdob3eetwkEQOY0yM5jdyWzT
         67HTCUj8CKQVYTwh7pLcpFrJQ1339EYsGAgeOIaykNMemjfq6zptqFvLDS76pQ3WSfiu
         Whuw==
X-Gm-Message-State: ACrzQf1nyyFfXibe+xjlDEJmxNjtparVr/4GThX5uIKV/cWoxtuhB/rE
        PZShBO2NJrigNUuW3VGifawNoA==
X-Google-Smtp-Source: AMsMyM6CTAg5OV1bU86u0EJGtxygcSaHG7hkGKgJ+bHI9GFDzN/PE4wY/mjYLhvX51voSXTOMBdnNw==
X-Received: by 2002:adf:f543:0:b0:228:c692:127a with SMTP id j3-20020adff543000000b00228c692127amr14585681wrp.246.1664207956991;
        Mon, 26 Sep 2022 08:59:16 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c3b8500b003b5054c6f87sm11567196wms.21.2022.09.26.08.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 08:59:16 -0700 (PDT)
Message-ID: <096ed938-e216-039b-3529-961206fde1ee@linaro.org>
Date:   Mon, 26 Sep 2022 16:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v4 1/2] dt-bindings: mfd: qcom,spmi-pmic: Drop PWM reg
 dependency
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220828132648.3624126-1-bryan.odonoghue@linaro.org>
 <20220828132648.3624126-2-bryan.odonoghue@linaro.org>
 <3434c098-3a5c-c4d1-28ee-1636f394092e@linaro.org>
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3434c098-3a5c-c4d1-28ee-1636f394092e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/09/2022 16:15, Krzysztof Kozlowski wrote:
> On 28/08/2022 15:26, Bryan O'Donoghue wrote:
>> The PWM node is not a separate device and is expected to be part of parent
>> SPMI PMIC node, thus it obtains the address space from the parent. One IO
>> address in "reg" is also not correct description because LPG block maps to
>> several regions.
>>
>> Fixes: 3f5117be9584 ("dt-bindings: mfd: convert to yaml Qualcomm SPMI PMIC")
>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 8 ++++----
> 
> This still waits for merging... probably because maintainers were not
> Cced. Bryan, please use scripts/get_maintainers.pl to Cc necessary
> people. Otherwise your patch won't be applied.

Maitainers were cc'd

I have Andy, Bjorn, Rob and yourself on the list here.

scripts/get_maintainer.pl 
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml

Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
Bjorn Andersson <bjorn.andersson@linaro.org> (maintainer:ARM/QUALCOMM 
SUPPORT)
Konrad Dybcio <konrad.dybcio@somainline.org> (reviewer:ARM/QUALCOMM SUPPORT)
Lee Jones <lee@kernel.org> (supporter:MULTIFUNCTION DEVICES (MFD))
Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED 
DEVICE TREE BINDINGS)
Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org> (maintainer:OPEN 
FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Stephen Boyd <sboyd@kernel.org> (in file)
linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE 
TREE BINDINGS)
linux-kernel@vger.kernel.org (open list)

---
bod
