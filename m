Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B357A55171D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 13:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241912AbiFTLRD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 07:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241736AbiFTLQ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 07:16:56 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0184AC13
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:16:55 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id u12so20392934eja.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WJBeayfN70JGoffNjmiqYlNbDws6ZWaDe5A70Prce0U=;
        b=dMa68tUjOtbfvics8Eq53gAqn7KA9HHqdMiH0TKeIXeryrs9p03xoEuP2SyPQet0ne
         pik1VXlAU9o5vduBEs4/jtxAtIr6WaD43Hl105ziie9CSpOYxHINlsY7cgYU1b2Db4og
         7HJp87NPGJ2PcUowyYIdmbApFnJglKsdllU0WZtGj8vUMJqi5uYkvijxzNO3OpHyZn7B
         nP8lOaxukkyvHmWXiA+qILYw6fAv2v0WlXz0BgoJ2mBQqvZ3vvXWdO9yTkQTkKYIrpCS
         NK59mGahuZsY6IPF9lTOF7Q7s3iSqOyQVeO/SvZ61TKdKtwNG/KHcnaJ1q1Ysh7HUWLN
         f2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WJBeayfN70JGoffNjmiqYlNbDws6ZWaDe5A70Prce0U=;
        b=XtGKpOwZnkS8+nUPtcug7BIyzx9VxQXwnXajDBfKIeNvYEoIgKwyo2Q63wH+PBc7d+
         f3J4Ri4XdOCLiByatp926JXMiYFHfVquzuFqwAmNyqSdajfSiv7FG/jvtazjqoDItniM
         maYBACXpyF/teUKQZLQ3gIASdJaOmXoZ+epL7NFHVq0npWE5ZJb/tYC5BrcrTt0IxCWB
         0xMe8lL/wkhair0YvoldQm5vS1MR1LBM+psSUk9tTFzJF/OhbF1jvRz3AqZscOnNHiBP
         8iXzHxDSdRiUJyFic5/7pV9/8qlz+lJI91Iaix9rB8A5Gb+DGvdfTIATr3ho4xoBX+Up
         Ux0Q==
X-Gm-Message-State: AJIora/1Q1gYl+SzCPJy30xmRf1SREDGTSgnA9VEMJtlwzmLjkuDJHas
        oW1znJaI5Mn0jFTl+28ONV4iSw==
X-Google-Smtp-Source: AGRyM1udPz63US+Ec8QUUIH0+Nm/1rKvwOKOeUEUossI8Rz8gSlcVcWePrDnjoW8TSg1m+h8O3SZgA==
X-Received: by 2002:a17:906:2c4d:b0:70f:ede5:d456 with SMTP id f13-20020a1709062c4d00b0070fede5d456mr20727014ejh.366.1655723813616;
        Mon, 20 Jun 2022 04:16:53 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id t1-20020a056402524100b0042bae6fbee2sm10335318edd.74.2022.06.20.04.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 04:16:52 -0700 (PDT)
Message-ID: <3839018a-74c8-aef0-47f0-3580544a5056@linaro.org>
Date:   Mon, 20 Jun 2022 13:16:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom,gcc-msm8660: separate GCC
 bindings for MSM8660
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
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

On 20/06/2022 13:07, Dmitry Baryshkov wrote:
> Create a separate DT bindings for Global Clock Controller on MSM8660
> platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
