Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9D514E9D00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Mar 2022 19:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244163AbiC1RGL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Mar 2022 13:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238845AbiC1RGK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Mar 2022 13:06:10 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEC04B41B
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 10:04:29 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id bq8so16058550ejb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 10:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6yQeqxmAC2aKz5WWofRTiroUa0cIPCXtz1ZK19EhWKo=;
        b=daxWCLSzVHGVhchsUZ6+YMjYVs1b6Fsm+tcDdFellj+t2WgqgjOdKLAWci/CZA5kTt
         YpUbcI/aiNTyqKr5AatPYmITMGtorqn7ES0eJ6ftJukevTX7gjRktmyM2KYU+jPIuMOo
         lRr1gySh1tvjJkDAfaSn+RFfZxDEI0XgwVFKQ3Jd0UwbgXJ421CA6h4nu98pFsDLh3iS
         Uplm1/6F6IsS2NZY2tmoLWY6NxpGAtzxX7vCCefkJ0eCtUEmzhGnTDDG9HvdC85/RgeI
         UmWlJrwlG+6aq9Gb59jmhagnkKLRvqeRsGPRkeNA/rmK3hTybLGNWQPHfY5ejaZOnwWR
         nyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6yQeqxmAC2aKz5WWofRTiroUa0cIPCXtz1ZK19EhWKo=;
        b=7dLjJTxnPLU3+xfg9ZlMZ5S8OSHaqfMteTNqpdONCODxwWvaX19aDEl9zYGs4P0T0v
         ER+hd10fVgISXymVXre7sQqmu7mgctCfZ4Xzxtf2hl1dgoN+Fi+tmETjKmv/ApeJDuYV
         WkODhYp4CmlMfPtqDm8IijJeov+lCsGoqA38QHxha9cyF9jGvM7d2i6hsZH8dugSLEM2
         8yr962uofVTob/mpJolYy1rrGORGSbVmQLvdV8E8/dBDCHwkWRDltZK6hKnAxdWlONhy
         mXJ02/wXpAB+gGaWqDZaLK0bAdCJ7ezepIyyyPYV30qlkBDXG45pYzcgBywlg/tUI63r
         66VQ==
X-Gm-Message-State: AOAM531n8qFiu3l/MgP80ywIFCr0d6Y3DNuk3rM0Vtv5XChrjTwM7vyI
        gotPaSCAvtV/vTz4CmB0gGlkcA==
X-Google-Smtp-Source: ABdhPJxOIHwbCP7io7cxTbL5Y9HAi1K2LbIG9adPMWYOr5vMxk3eG/GDERE2ELL/JaPwcEKHwv7GGQ==
X-Received: by 2002:a17:907:7704:b0:6cf:48ac:b4a8 with SMTP id kw4-20020a170907770400b006cf48acb4a8mr29021497ejc.305.1648487067801;
        Mon, 28 Mar 2022 10:04:27 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id 20-20020a17090601d400b006caff964e30sm6108433ejj.19.2022.03.28.10.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 10:04:27 -0700 (PDT)
Message-ID: <41fe6179-5628-6393-01c1-918baccec176@linaro.org>
Date:   Mon, 28 Mar 2022 19:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: display: msm: dsi: remove address/size cells
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
References: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
 <CAA8EJprWoxWwk5EWEfWdLquPR+2=u6V0-v1-+wHMHOk8HiEyNw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJprWoxWwk5EWEfWdLquPR+2=u6V0-v1-+wHMHOk8HiEyNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/03/2022 18:43, Dmitry Baryshkov wrote:
> On Mon, 28 Mar 2022 at 18:30, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> The DSI node is not a bus and the children do not have unit addresses.
>>
>> Reported-by: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> NAK.
> DSI panels are children of the DSI device tree node with the reg = <0>; address.
> This is the convention used by other platforms too (see e.g.
> arch/arm64/boot/dts/freescale/imx8mq-evk.dts).
> 
> With the DSI split link it is possible to attach two panels to a
> single DSI host, so addresses are necessary.

Yes, I noticed it slightly after I sent the patch. :(


Best regards,
Krzysztof
