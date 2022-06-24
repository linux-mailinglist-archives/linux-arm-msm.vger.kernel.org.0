Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3D2559DEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 18:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiFXP7b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 11:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiFXP7Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 11:59:24 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B75A5250F
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 08:59:24 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id o16so3725290wra.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 08:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CKOpi0ClXGqd/rmnAcMlopcGiNa7zGgVxNOiay2qwK0=;
        b=DqTAOo5Oi4BxSjCcZ/a6cTm6P8UgpLSfeKSAfwxKJLBUNe9BZS1S7Qna7VwWVwmh6z
         lV8pSpCfFdHR8cBE4YOGAQU9yBkm/jjM3jQjlwHy1E9sRf8+PAa6T+g9ErwOjPmlIFBK
         INNcv3cLspdy/CB7M7r0Sdwy8lz3Dp5Kgmi7nGxBCIgM00vFCjfTgoTonCV2CGZacaOB
         UXCZkI6elwrqY5K2CEF9oAT/W2Y5JblAxZ8Im/R73kvYbvQ9/DRcANsRa57AU6npRoOm
         h7I2+HdjDx1sm7r4YIV11BknBVKrlBkRzDz3EAkyFBemcPEhBLmSXYhQTxchDy8blTKN
         BIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CKOpi0ClXGqd/rmnAcMlopcGiNa7zGgVxNOiay2qwK0=;
        b=Bx/xrRYLNrRQJ3/lKAT9EdF2sI/60r9eP8fb62Vt3m3R5xzMeTxX+x6t3iDxWqANkZ
         IQy4ZE+VVBg/ak/U+lai/Yebn/yY59uO7hnlG30+OvLk6CeIGIRGCMTmpbT2qOxzfBmv
         2kIr5EMU/OQivR83ASBol1b2V/pwfAuMjXFusaejxymRNA6u3mjjqttd0bDs7nGBHACd
         91ZEfwNfRt88TsUxNqjeCdYQnCWkDfux/hC/l3fRb5xuYef4urzQj8RhUwbVrmnkLb3C
         geAuh4jqUGm85XQc/YERxUFvUAUo8/mw7ood6iQMgj9MjOQK28LtQ+CQx/Co4IkqpBnk
         2V/Q==
X-Gm-Message-State: AJIora+PycWscULZWnOHjG9AgtWf9AYmFxj4RM20T2ln+WYDXv1hhV+J
        1NTLihRVoJN0BFWA0WwcY3U6GA==
X-Google-Smtp-Source: AGRyM1vfennQfIgzz9neI4us2LxPYyGKBmR3d0Q1LAz2l/LplrP+yIM4iIjeZ19IdWIPNIpiI6r8tQ==
X-Received: by 2002:a5d:5847:0:b0:219:b512:3be2 with SMTP id i7-20020a5d5847000000b00219b5123be2mr13873727wrf.651.1656086362677;
        Fri, 24 Jun 2022 08:59:22 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b15-20020adff90f000000b0021b90cc66a1sm2753338wrr.2.2022.06.24.08.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 08:59:22 -0700 (PDT)
Message-ID: <665cbbe8-36ec-0484-f0a4-98fc47cfc0d9@linaro.org>
Date:   Fri, 24 Jun 2022 17:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 1/4] dt-bindings: clock: qcom: add bindings for dispcc
 on SM8450
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
References: <20220623114737.247703-1-dmitry.baryshkov@linaro.org>
 <20220623114737.247703-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623114737.247703-2-dmitry.baryshkov@linaro.org>
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

On 23/06/2022 13:47, Dmitry Baryshkov wrote:
> Add device tree bindings for the display clock controller on Qualcomm
> SM8450 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,dispcc-sm8450.yaml    | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
