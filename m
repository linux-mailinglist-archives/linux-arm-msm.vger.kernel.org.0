Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5CF505B94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 17:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345485AbiDRPpQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 11:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345471AbiDRPoo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 11:44:44 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EAB4507C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 08:10:31 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id lc2so27309598ejb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=8eEBlJjFdUmWzuzGoXrrvhfqXeGbJkQSJU2hZzKNYCI=;
        b=EHozyYSTs+5oPjLpwLz6skDmf0dsTBEPko7/7suTBa+gI2A+zwXn00kXLAUzuBr1RO
         PT7F4dLcn6sndBN6fDlyRtkvYfxO8npN+n5jlUMfg7js3R6iRy1tNlyDmkv2JhIN7kNp
         Iw8ZSPVRUnBR8fNsdil1SonXyqmdwdwelG6+ZJbIezoWBe4rj3dVxvpJHHo9zsaZHWZ5
         xGYgtzzP44UQzZrFlnYjWdJM5O6z+fuiBzOCiR1L8fp/uJLxk7RkjuGSfcUFoFjcfV0M
         kvnx2pnC2ncF18255EmrLtRCeToBxxMWBlzJSrP6Bi+nMGjR37L7xJmIgD6MbHl8EuLL
         vtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8eEBlJjFdUmWzuzGoXrrvhfqXeGbJkQSJU2hZzKNYCI=;
        b=lJNYZuIAZx6DdL8xx40p27WhsF+yJbLIq2N01rz+iy58YOZNzn5mj0foxSiD8qnSaG
         UpNBCzHDmt/3kzH1xWe71ABZIComzLl9LRuHCEGah3Rr8rEkTd4sEMfjCjigAza3/yRW
         tbsriTbJJzA+9vvC/9AdyxDwBPyRBfyc5gtmA1NYtJIMsthxeaRgnO4IuhtZ/BJU1LCv
         RbCgknvN+GQZ+MOFmyILLmxaBDf3I8+5K3+Uhz8awtcQkjmX97JmT8FMOEsVlhdDg0uu
         EHR0+9VtGrV1xo+Q/HWOixsmyjb0TqDTEU2dyRUr7cL3+OuP3Xb2SS22rPGv+1EFcMDG
         bGPw==
X-Gm-Message-State: AOAM532YCZ/lI3EiLRNTWVIZhWWW6EVdk4OmFoLsd01ER5bNKgQhk1ou
        BfeuwnzVc9NuVY+p1HWj28g76g==
X-Google-Smtp-Source: ABdhPJwNJnrCTL6Ja5pljID2zs7UqXpsSz+qhAsvZEoVY7eD0haejH7NWyA6OB7wc0H3iRkKr7oU0Q==
X-Received: by 2002:a17:906:301a:b0:6e8:a0b2:340a with SMTP id 26-20020a170906301a00b006e8a0b2340amr9345551ejz.248.1650294629608;
        Mon, 18 Apr 2022 08:10:29 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u6-20020a170906124600b006e843964f9asm4640720eja.55.2022.04.18.08.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 08:10:28 -0700 (PDT)
Message-ID: <d68442c5-f1ed-d502-aae5-2770f9653c81@linaro.org>
Date:   Mon, 18 Apr 2022 17:10:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 06/10] ARM: dts: qcom: msm8974: override nodes by label
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20220401201035.189106-1-krzysztof.kozlowski@linaro.org>
 <20220401201035.189106-7-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220401201035.189106-7-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/04/2022 22:10, Krzysztof Kozlowski wrote:
> Using node paths to extend or override a device tree node is error
> prone.  If there was a typo error, a new node will be created instead of
> extending the existing node.  This will lead to run-time errors that
> could be hard to detect.
> 
> A mistyped label on the other hand, will cause a dtc compile error
> (during build time).  This also reduces the indentation making the code
> easier to read.
> 
> Re-order the overrides by label name.  The pre/post DTBS are the same.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../arm/boot/dts/qcom-apq8074-dragonboard.dts |  614 +++++-----
>  .../boot/dts/qcom-msm8974-fairphone-fp2.dts   |  581 +++++----
>  .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 1075 ++++++++--------
>  .../boot/dts/qcom-msm8974-samsung-klte.dts    | 1083 ++++++++---------
>  .../dts/qcom-msm8974-sony-xperia-amami.dts    |  569 +++++----
>  .../dts/qcom-msm8974-sony-xperia-castor.dts   |  908 +++++++-------
>  .../dts/qcom-msm8974-sony-xperia-honami.dts   |  636 +++++-----
>  arch/arm/boot/dts/qcom-msm8974.dtsi           |   16 +-
>  8 files changed, 2730 insertions(+), 2752 deletions(-)
> 

Hi Bjorn,

I see you applied other arm-dts patches from this set, except this one.
Any comments here? This is quite a big one, so maybe it had trouble
making through the discussion lists?


Best regards,
Krzysztof
