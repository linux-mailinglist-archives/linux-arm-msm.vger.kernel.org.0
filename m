Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7946884FC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 18:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbjBBRAQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 12:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbjBBRAF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 12:00:05 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1E95EF85
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 09:00:03 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so1936677wms.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 09:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RhWcv5ExWaP3//OnTLElwVyp8DmK2Pshcf2EZSENjBg=;
        b=S59BU50BWaDwXZXUjhHPMPQGa7RFaMvglYDORCeXz5DaTmSlUJ2pEeHpVpvG1odNcn
         2/pJ/ApUNg8czmIkCXmqq94V4vHr0lpDUY1HXzt63FSvGvTx/543eX5t3veDdyCnIfAk
         5/6DMQ9TqnW/4suGIJVNiXNXj1ypi5g3KnXflobuo6jM3mSUP69IEQxmPX0K0dZF7Bec
         5UJUrww+pMs2a7TzET06rDEcgb+YhC+41FHr1MlwZAeobNe7ABaVjgqsFEAoLElR58SP
         TtJ7XRHL8jHflHSjoptLYiEFMOf6TltMRO3uKW653hr0XZv25puj4uxx0hS0nXvs17vg
         idFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RhWcv5ExWaP3//OnTLElwVyp8DmK2Pshcf2EZSENjBg=;
        b=lJiF2F7X0G7w8B2Np1OfkQfg6sR3CoFg+k4859gG9DX/14Y3KvNN68pbZ4lyn86Hnx
         uKCgumDWuipHAK4HZ0CkWcbjpC6mId/R66eb5ob+iFnW+Sa4Tqbftza2vsfyQt4Ih8zf
         Ux4jl5qbYbXvoI+lHwXhregxcp4tHs6qx07BNSTPKeY5cbHrdRXGUWbIZFbRDQ/RdEwv
         yQBlQaXx9HLd1Q30Q3XnqTSzi14P/uzqiTxaDO8BOfcBdAAatxLpL3Ngw/bDMfOXr5ny
         Z2ccAhN+g2iBhAdMHSX3qq43ujakOf0aIqbWqoxZNlioNdFM13ysZ96V2Dgha0VuOrqW
         x0fw==
X-Gm-Message-State: AO0yUKXGf1GcpAD/odZzBzarcBgtUX8v2iA5ZJB92zVJ+jRiL3Ukmnn5
        bMk56vyYXTu3BqrPATsWdUW0K5yDpE819Xs5
X-Google-Smtp-Source: AK7set8Mz6f9IAFqisS/S6MhfAxrzntIV6lhfSiMTdk8c1G+CNehf5jH9DotPDB/8tObaNdLMHytCw==
X-Received: by 2002:a05:600c:1e13:b0:3d9:f836:3728 with SMTP id ay19-20020a05600c1e1300b003d9f8363728mr6856891wmb.11.1675357202092;
        Thu, 02 Feb 2023 09:00:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id he7-20020a05600c540700b003df5be8987esm3632611wmb.20.2023.02.02.09.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 09:00:01 -0800 (PST)
Message-ID: <9bc34d9a-e4f3-272e-1ebd-c717509b709b@linaro.org>
Date:   Thu, 2 Feb 2023 18:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v3 1/7] dt-bindings: mfd: qcom,spmi-pmic: Add pattern
 property for phy
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
References: <20230202133816.4026990-1-abel.vesa@linaro.org>
 <20230202133816.4026990-2-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202133816.4026990-2-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/02/2023 14:38, Abel Vesa wrote:
> The phy pattern property will be used for providing eUSB2 repeater
> functionality. This will be modelled as a Qualcomm PHY driver.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++

You need to re-order your patches to keep everything bisectable.

Best regards,
Krzysztof

