Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 737355B4F3C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 15:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbiIKN5e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 09:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbiIKN5b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 09:57:31 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CF2B32DA3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:57:30 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z25so10754415lfr.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=sUy2r7OpYbVTxjP66h3aOfUcbCczz3Xb2QL907aFIfY=;
        b=EeEQNO20u/AcC8mN1VXzTnmX4WBQlRAKnxPq0MFZyt6FjMvOtn61bEaHA3Ql1a87DO
         hQ0L0yl1Z5BZ+RQvJ+gAhBK2YRSZANff6Yc76SMzARAE9ef2IOg8WZUkLrEIjvWfdH0h
         g46zfTFzuwyeeToN/o+JSLgxk0QmCfbm01PYtWXUhvME4sAXg+Mbm70tUpeSCyyyEO4D
         rpr8+1gF7e1XO2SvCYDEpGqbwGPvtqfcQw11+Jcf7py3rJXV0Qm6DyVO3mvLeBWLL+5q
         Y9UqhYLR/CeIhOsOMd1IP05kCq/nfMjPOV/tocyCjb2jxqOoB/lGyjAELH8oJSUCfGj1
         Lyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=sUy2r7OpYbVTxjP66h3aOfUcbCczz3Xb2QL907aFIfY=;
        b=1xH3C4z8kZQ4fjXqlKPzEspH3SfTaWmkD5NgPTCLOqDr326fT9Q7UuKbK+2OSqEfhc
         DuXiub0U0Ou6Uz6ttlK1dgBVBylW6+JdOzYyD9yKWW5xjIv3FShB9jyeViCSyEAwKOaU
         6ENkdq4RMCLF8/a8cQpM9g1oCreUoy5kwBc8tw9zVgbJgFXFNVD7fF/qXM6RwRS4fxSz
         H5g5Hqj+eTIbkOL32nZqJbHqcNjXPXR9CUJDA4ZzLIc2FSnnLrJthqt7694GTR2501+X
         cew9EGuedfV5W2yu8ZKPfpSKrjEuUdTJk0i30X32d2qGyuLrT4FTLjLAfBDOKhRfCYsK
         3nfA==
X-Gm-Message-State: ACgBeo29OR0SvHoOxulAVBk/4HVoA7VpT6YYfG6kxhZ6QJTHH+C7vLRL
        z3xtxUldF3jYBidL1vB/enZRdA==
X-Google-Smtp-Source: AA6agR6k3QkKGyQsoo4V+rbvrB3g6fJSbouAlVs4pVeVAPh5/JHC7Aw11e1/EuJMHp+jP5VGi1CLMA==
X-Received: by 2002:a19:5505:0:b0:497:ad71:39f4 with SMTP id n5-20020a195505000000b00497ad7139f4mr6224530lfe.226.1662904648482;
        Sun, 11 Sep 2022 06:57:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o5-20020ac25e25000000b00492b0d23d24sm615623lfg.247.2022.09.11.06.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 06:57:27 -0700 (PDT)
Message-ID: <f013accb-96f7-a025-1d41-e2e97f8b2aa8@linaro.org>
Date:   Sun, 11 Sep 2022 15:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
 <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
 <20220908193705.GA3002673-robh@kernel.org>
 <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
 <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com>
 <2204eab4-b22d-8ee7-4595-49139cb387a8@linaro.org>
 <CAA8EJpqHL-gO=zSG6Ek=-y4njGF5R66z0MwLeKZ9U4Ag1j51Og@mail.gmail.com>
 <e7a132e7-a819-ebe2-e6e5-c01cbfacef15@linaro.org>
 <CAA8EJpoPPRAQPfVQmSfrrDrroMp0bzvJ=-vHMRx72aKTBgPOTA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJpoPPRAQPfVQmSfrrDrroMp0bzvJ=-vHMRx72aKTBgPOTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/09/2022 15:45, Dmitry Baryshkov wrote:
> On Sun, 11 Sept 2022 at 14:27, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 10/09/2022 14:54, Dmitry Baryshkov wrote:
>>>>
>>>> However I think there is no such problem, as Dmitry said, that ref
>>>> changes anything. There will be always failure - either from parent
>>>> schema (using $ref) or from device child schema (the one which actually
>>>> misses the property).
>>>
>>> Initially I stumbled upon this issue with the dsi and dsi_phy nodes
>>> for msm8996 devices. If I have $ref here, dsi1/dsi1_phy nodes will
>>> emit warnings regarding the missing -supply properties despite nodes
>>> being disabled. If I use `compatible' here, the schema checks pass.
>>> Thus I'd prefer to leave `compatible' here. Not to mention that it
>>> also allows specifying a tighter binding than just using the $ref.
>>
>> I don't think we understood each other. I claim that error will be there
>> anyway, just from different schema. So your change fixes nothing in
>> total schema check...
> 
> If the node is disabled, there will be no different schema check.

As I wrote before, there was.

Best regards,
Krzysztof
