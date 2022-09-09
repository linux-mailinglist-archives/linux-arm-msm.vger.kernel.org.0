Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94EA05B3D3B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 18:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbiIIQoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 12:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiIIQoQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 12:44:16 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7429A14481D
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 09:44:15 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id q21so3736171lfo.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 09:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=U7UrK1+HGzEIxbJhZktE8rdEJk1xuFEQXHSaI9c28OU=;
        b=g3YFVfIz6AsEqhLdHS5c+6sx9LmlotKHb6suIWJTk5XVoKnJXFupiMRBQEvWWBVzHL
         A97E2s1bR+qGYNbKuEMDZZgTQ6vTIhQ726EATEtOJJC1ZgtgKgaSgPvLXEuMzsL7fi9s
         IiuVe3iJ5F238GblBqj5uLyrCEKECAIhxDEDzPCUoxiQk8vmWt76TqIzj/dDDKTaw6ec
         jNjFH/DUAylAYvg9rzRT3sluzv7AEaDN+ynShKj7WGBYrpJfbmESdslaJ6pPbJ0kNfTe
         i70dTxafUbhOe0oN6FMlKekK8PP9NwrdEPJZQcthWTsVM73Lv5clJfXzfTbyYQiX69nP
         9QZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=U7UrK1+HGzEIxbJhZktE8rdEJk1xuFEQXHSaI9c28OU=;
        b=m1Yx74bxqWniveo5vEXgirifCW81qgfyFYGuu3d1x0Nh3e2QAUs/y+69fBw2AJbJ5r
         FKgooUUVLyG624sKH+xMTRB9b4EdxxTJXSmDzNERSb2VKtby5Ob5JA/X/iLYfR2kGc3x
         n8U3d3gjZFtsjxXECkx2N1pMtYCwemNCHH67Sc7xvaAlRMymXt+N9aCwALAXPgxiWtX6
         QU/o6upC6Z9J2Lbl3iAvRIqy1FewykV2VyQ1YAiHkJ3K+nWlb9gvw0IwKB+oNbVUbBDU
         UaJy0R2Q+5pBNmzNU/hAQqUs01HY0sY0BRxVdrae+vhF2JpD8L6cb8Zsbe7xu2yjEYuV
         5Tow==
X-Gm-Message-State: ACgBeo2P1gJzdn2uOrHC43MbFPkDJJxh6BbQU45lA92h/KVhTU5oO1dZ
        mMMcgIARFsFFhjNGMz/3sSfn+Q==
X-Google-Smtp-Source: AA6agR4agaDUB6B07saXimeKTtI4I8JOYnVnquMHco4KrFonNA0i9ora3u5f5ZpLA6c8Tyh0QPv04w==
X-Received: by 2002:a05:6512:10cd:b0:498:fe5b:8ab3 with SMTP id k13-20020a05651210cd00b00498fe5b8ab3mr1099189lfg.613.1662741853756;
        Fri, 09 Sep 2022 09:44:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w13-20020ac254ad000000b00492c017de43sm144013lfk.127.2022.09.09.09.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:44:13 -0700 (PDT)
Message-ID: <c3b4638e-05f7-cc73-b893-422f92909f6e@linaro.org>
Date:   Fri, 9 Sep 2022 18:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/6] dt-bindings: phy: qcom,hdmi-phy-other: use pxo clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>
References: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
 <20220909132010.3814817-2-dmitry.baryshkov@linaro.org>
 <d72fc00c-85ba-8b48-1fcf-42fe9e8daeee@linaro.org>
 <59242592-4e3d-b7c2-e0bb-b39df780c26b@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <59242592-4e3d-b7c2-e0bb-b39df780c26b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2022 17:03, Dmitry Baryshkov wrote:
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 1
>>> +          maxItems: 2
>>> +        clock-names:
>>> +          minItems: 1
>>> +          items:
>>> +            - const: slave_iface
>>> +            - const: pxo
>>
>> Why pxo is optional? Commit msg does not say much here.
> 
> It's optional as it is not present in current DT files. The driver will 
> fallback to 'pxo_board' if the clock is not present.
> 
>> It seems you also miss the DTS change adding the clock.
> 
> Oh, I'll add it to v2.

How about adding it to DTS and making it required in the bindings? I did
not check the driver, but isn't the driver fail if clock is missing thus
the clock is really required?


Best regards,
Krzysztof
