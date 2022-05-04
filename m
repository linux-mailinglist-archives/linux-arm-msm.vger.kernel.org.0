Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 172EC51A296
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 16:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351494AbiEDOzN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 10:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351624AbiEDOzL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 10:55:11 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F073620F69
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 07:51:34 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id y3so3329878ejo.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 07:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cYJgw3JrzjheaMSkC8T0ZAyp66ftKZO5asTk62SBmuM=;
        b=H75kTBx+3WzDC6XxgjXF3qW5QWn7yE/eHSFoVd8PDQtLFrPjeh9pQ9SmlUUY8TvS+P
         LUX+TpdG0dJF3Qi1XTrguq1eIHKI6abFWfbBBdvCrjIhRX/6mWZuQO5udAO0KWK+xQ/s
         1NHJFjmuBXiL8ZWHv3LXuDvs58WxCijv/qsiGfHVzVTC0bwfiNWrAkfJFlmu8NK9Kq6t
         Cs3qEUG19OSsfP1JUUwMvwnP9JgcoCs3hLUj+PWZLpblZ2gn25YBuamsxpHmdN76/ir/
         vj2LDSuMa660VGPvILBILNlPNAJnlzHnbNGWvfEmwO8H51tlE/uEvFneYqULz6xM6Eei
         jkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cYJgw3JrzjheaMSkC8T0ZAyp66ftKZO5asTk62SBmuM=;
        b=5/nVlJY5MKotUEKs4ykAlxMu1X1VdNshhRf8RNV/DQwHVrbynt1rhPqgBWaqaeXY8Q
         l/79y2qFOGVi8pVd4Pbw0m9ftW9IHDx0hAbf7KVbNKA7BumcvJL/XIL7OTLtikC2OFg/
         EZy78lXMo2FUU7kDuV1WJjyVM3jiErQj0/clYWoBxhW+7KbU7y/XDd3dX52gPrSkLA+R
         xlbjC7Ce9tiN56h46Ft4E68u44MmmSb/1MAJnAWm+c650YCFnQpvoooUW2Dud4aGKbOs
         TCYwlrn+m5pugsrW+ZbD8RrjeAVmCeVpXvVdpUD8A2aLwWuYiCqo891XJyI470skL3o0
         PG+A==
X-Gm-Message-State: AOAM532jdQFRt5qaR/HCoMXFDoZDUxJK/7dMva8/osAcDRc8reSQPk/U
        jEapkbsPwCaQwK3bOpVDs6dkEA==
X-Google-Smtp-Source: ABdhPJxC0DkmJtm9E7WLHBAIaUioMyP95DMDV8glNckHR3aXksxxgX+GOy3tzzYIShnFkq+DIVsAdw==
X-Received: by 2002:a17:907:2ce3:b0:6f3:a4c4:100a with SMTP id hz3-20020a1709072ce300b006f3a4c4100amr20450011ejc.218.1651675893381;
        Wed, 04 May 2022 07:51:33 -0700 (PDT)
Received: from [192.168.0.215] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d11-20020a056402078b00b0042617ba63c0sm9212407edy.74.2022.05.04.07.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 07:51:32 -0700 (PDT)
Message-ID: <782aaf8b-3e9e-acc1-88f8-d4d8ecbab3a0@linaro.org>
Date:   Wed, 4 May 2022 16:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/4] dt-bindings: interconnect: Add SC8180X QUP0 virt
 provider
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Steev Klimaszewski <steev@kali.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220503211925.1022169-1-bjorn.andersson@linaro.org>
 <20220503211925.1022169-2-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503211925.1022169-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/05/2022 23:19, Bjorn Andersson wrote:
> Add compatible for the QUP0 BCM provider found in SC8180X.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
