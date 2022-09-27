Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0646B5EC182
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 13:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbiI0Leu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 07:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231679AbiI0Les (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 07:34:48 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3809D580BB
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 04:34:46 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id i26so15227579lfp.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 04:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=3MfChP6/8iEzK8T0JnULh4yZmSkySd9MxkyDxH83NPQ=;
        b=BvyxpoRSuU/O5vaE3mB3wCfIHe5cNksauflDPAW2L3ejUWZRGNfENIeHbNfCjwTAH2
         wlSQpVTqfopHEdJGQNnTNc6kowj+AxmQL04J7Uhfs3KLVcLnIgxxOCo6J/FWOz1hbAkb
         iVC1OX70qX8xjX1NeoDUAX2Gnydbg3VejsRCRx9qC81ZdepBMPozxHSQCNCAb3ZshgAQ
         U2YE3TEeifLQ8BHB0jMRl3Z+eoupyn+jB3rdT4yQVAaV/YioAB6evXovHCgqYVAtg6x3
         OL/sab3+D1KOfgrAEAhfgWHum1qkk+f7q0PMEx4HEk8Kd38O8nm7CDHajv3B33rXEOOE
         Gm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3MfChP6/8iEzK8T0JnULh4yZmSkySd9MxkyDxH83NPQ=;
        b=S9jL//dIL/hHyzTtp8wMfFK3gnt+S/yB7eGB8Ja59v6kox0rxOfhrKiQsvQKfDcEKM
         b/OmhslPjjQAVVxi5WrXiXV6d6voTA+vcTFAdFDl4gy342xewhb4ZS4DIkIDLXFO3tGT
         J8bbYOQoVNfphQW1YNAlWtwVhdkrmEkqwxijyFZ6G6BiysE+MUkZ78rKY/LNPOQtYGaZ
         ztxkthQ6M+M7E6uKsEKHy0OfegNDHwhBlyrLK+VWWFWG48lV+bGP9q+C/B21FvORRc/6
         +MT0SfPWCHxU2AunUJKG1k264NowlsAWbbA2XCIl66CTw6NGozrUCHG8x3xQ929VZR/H
         cA+g==
X-Gm-Message-State: ACrzQf06quZ+fnTNL9hRbm/72DL2YxnxhsrrzRSb74yBceyKy9Hdwak2
        zHvWS5QryFvp5Dea6A840YXpoQ==
X-Google-Smtp-Source: AMsMyM461lTDlOqI2S790XgAjwElyYSz1rqAvbpweu5NTI7zT49mx5xxnbrm3DEWp70uRuFf4GnwXg==
X-Received: by 2002:a05:6512:36c1:b0:497:abef:cce5 with SMTP id e1-20020a05651236c100b00497abefcce5mr11044689lfs.472.1664278484579;
        Tue, 27 Sep 2022 04:34:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f13-20020a2e9e8d000000b0026c0d7a9f5bsm135925ljk.96.2022.09.27.04.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 04:34:43 -0700 (PDT)
Message-ID: <8b55caf1-715e-e5f0-6a2a-41e605d2e1e6@linaro.org>
Date:   Tue, 27 Sep 2022 13:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 01/12] dt-bindings: pinctrl: qcom,sc8280xp-lpass-lpi: fix
 gpio pattern
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
 <20220922195651.345369-2-krzysztof.kozlowski@linaro.org>
 <20220926203340.GA2752484-robh@kernel.org>
 <CAL_JsqL+XeqHO-C1GXY6pHQrsXSm=YkSdTpkjV9bHZGpFU=eJw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_JsqL+XeqHO-C1GXY6pHQrsXSm=YkSdTpkjV9bHZGpFU=eJw@mail.gmail.com>
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

On 26/09/2022 22:40, Rob Herring wrote:
> On Mon, Sep 26, 2022 at 3:33 PM Rob Herring <robh@kernel.org> wrote:
>>
>> On Thu, Sep 22, 2022 at 09:56:40PM +0200, Krzysztof Kozlowski wrote:
>>> Fix double ']' in GPIO pattern to properly match "pins" property.
>>> Otherwise schema for pins state is not applied.
>>
>> Huh? The schema is applied, but would fail, right?
>>
>> Perhaps the example should have some child nodes to demonstrate this.
> 
> NM, I see you've done that in subsequent patches. So other than the
> confusing commit msg:
> 
> Acked-by: Rob Herring <robh@kernel.org>

Yes, I'll adjust the commit msg.

Best regards,
Krzysztof

