Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67D084F048F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 17:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357375AbiDBPrc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Apr 2022 11:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357374AbiDBPrb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Apr 2022 11:47:31 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E368B160466
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Apr 2022 08:45:39 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id o10so11667785ejd.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hia4z0mt/UHcbuh1pWZ9Sjm78iTsXdI9nBZvSUy1WP0=;
        b=XhSEwRAKPqWTxlKJGeWlipGwbyoDCbUjcpakjyHczOKOzlsnAXL6KcslWCIIJIOlhS
         6H/9SJ6zm2fi1G3LmhCsaOtKN8ZyfFZskoIp6dVT/HkM9dGNLps8oaMBZ/EhLgn8lYZ7
         aaupip/PipRa9Oa2Ad3tg0Z9jA3rjw3peZ01c8ExU7JVX1zgs+brrO8DlZjapyXREGpZ
         pRklrWaQBGdS43sfF4apVOxSoVelb6lAtJ+IcPg+Eo3gwJ4UIns3Aj9tGYsFyR3lmZbH
         UgT/WO4dYneIUWGFJRu/z6/yo95K2bRi2qxA4j47jhY4yl3HRigPXGcBvMVDULPi5Ui1
         rADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hia4z0mt/UHcbuh1pWZ9Sjm78iTsXdI9nBZvSUy1WP0=;
        b=J7Zux3y7JXg9qY5v1LlBJk1NBiEDICMB2t44rvA3vLCZsrFJui8Pyn/9sm6W5MWdNF
         5bNecpa/6LV3D+YskHaxnrE14CQM8L0O69UcFu5a1FAkB9muUlsbx/1ZFkn20Qfopc0C
         e4aB1ou3c8ZQk8yoEaY7JeNIq73Xgy4T8QrNFt6SfXqf1tm72Spjok/2EY2f/zuBBJRr
         H0XhanjNi7sQirpnkgcfh5ThVznDmc/fMFKHlChzG8yy2EwBEm3DaRLyE1+EZE1OXe6p
         /avWSZecfyIYo/71PMMfy7fMlcjdoMhj33ClNdgYvP0EkZZh2L3aLbehWpDiTMV8V6zW
         LIzA==
X-Gm-Message-State: AOAM533d7TSZ7/wpla2xXxRWy5Q4uLNU8jhsUMkDTnZv/1BTnkh9rq8b
        YZsB5UuNZ8mWXoK7guB+J0A2gg==
X-Google-Smtp-Source: ABdhPJxPiHzMs0OqQ1LDOy3rGnJTT0bKNrBQ43F2LR5JkJdjTY7SITk36isFMjj3uA87WjfxuskqoA==
X-Received: by 2002:a17:906:6a81:b0:6da:d7e5:4fa with SMTP id p1-20020a1709066a8100b006dad7e504famr4303477ejr.223.1648914338465;
        Sat, 02 Apr 2022 08:45:38 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id fq31-20020a1709069d9f00b006e4b8ca9675sm2254416ejc.19.2022.04.02.08.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 08:45:38 -0700 (PDT)
Message-ID: <07291648-9541-c559-eb47-0936e17ff254@linaro.org>
Date:   Sat, 2 Apr 2022 17:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: soc: qcom,smp2p: convert to dtschema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20220401171035.1096670-1-krzysztof.kozlowski@linaro.org>
 <1648907211.818465.903498.nullmailer@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1648907211.818465.903498.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/04/2022 15:46, Rob Herring wrote:
> On Fri, 01 Apr 2022 19:10:35 +0200, Krzysztof Kozlowski wrote:
>> Convert the Qualcomm Shared Memory Point 2 Point bindings to DT Schema.
>>
>> Changes against original bindings: enforce only specific names of child
>> nodes, instead of any names.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/soc/qcom/qcom,smp2p.txt          | 110 -------------
>>  .../bindings/soc/qcom/qcom,smp2p.yaml         | 145 ++++++++++++++++++
>>  2 files changed, 145 insertions(+), 110 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
>>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
>>

I'll fix it in separate commits.

Best regards,
Krzysztof
