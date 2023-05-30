Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC06A715C87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 13:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjE3LEF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 07:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbjE3LEE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 07:04:04 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF6B6EA
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 04:04:02 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-514ab6cb529so2212123a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 04:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685444641; x=1688036641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJpPcvlhDr55XVdV13FrZJDCixqh9Kz7L+e3bwYKNW0=;
        b=eYmzjC9fjdboCt4Xpc1iRgGhbX0DwkZwyCCYJEoSymGBuYMlTQ902mIbm3+WH3VYLA
         RTFkAhI1YXZvlZlryC5dxg0/KK/Qe3Czy5QvtLngJAFjxA5fgKVZfJGDLkV8kIhyAl/G
         hujYth1n/g/GjHkdWwotfFFTWShqfywSzRZPiMYgjdqEb+5Cude8j+tTtj/V+H2bMsdc
         ASD7wE5L+EdaA6yTgh+G+sIc8aDo5XvE75uuh6LNepuJAIcx+WchpxT5Go0Fzd31eziI
         W0/QWSyKlmEk8g2vJs1Ro/DGzpXY7ObUS0Hc4IrljLe43/5GTWi3roiT+8ha/jLU8IqN
         rF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685444641; x=1688036641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJpPcvlhDr55XVdV13FrZJDCixqh9Kz7L+e3bwYKNW0=;
        b=DPqZKUy0vXlEuWMktCTeTdXFw9C9iSqxnMgpCT31XJ1ZggSkHGV3L3JmeNM7c40VTp
         Noho+CQOWemKZVLpT8xwTqg0M2KWqmTCAr0GDEl6E6Jo6qrudh5Y3InkNmDatsIRnbRI
         l5UCLQHonhpSbBwN5uVnbF7NStQxzoWgfGC2JrqHPMDGwKvBkZaNsy0D26OY7JL4dI+s
         xCgG0mlTLumpsvMcHwYF4fifZcPXx/vhE6+Nx6WdLj6kEzlt45b7Gp5Bns/Zlf7x+tBf
         nm80spppY1kJGhKRXZ9uIajCICeb8R7InT37/rDAadwJt9zNdHPHnSx0kfL7Tx9Pslkg
         7/7w==
X-Gm-Message-State: AC+VfDxSODPso5PaJ2U8DvbxKHODioIV0e7yVWTw3ICQsC2otGgo8JYI
        e/WlliM2lptvp3yQ6Ww4uEnsHQ==
X-Google-Smtp-Source: ACHHUZ47aLpUcTUH2+3Tb4gKZeBxw7El92S1s3TQBI7H0P8ZOWBOqOvi1F1laf1lx80mffdjpGOLOg==
X-Received: by 2002:a17:906:6a04:b0:973:93c3:16a1 with SMTP id qw4-20020a1709066a0400b0097393c316a1mr9228224ejc.19.1685444641154;
        Tue, 30 May 2023 04:04:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id h26-20020a1709062dda00b00969f2d5267asm7225424eji.114.2023.05.30.04.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 04:04:00 -0700 (PDT)
Message-ID: <46944bf1-3a07-0db7-2702-f6b7d54b611a@linaro.org>
Date:   Tue, 30 May 2023 13:03:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2 06/13] clk: qcom: ipq5018: remove q6 bring up clocks
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jassisinghbrar@gmail.com,
        mathieu.poirier@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, quic_eberman@quicinc.com, quic_mojha@quicinc.com,
        kvalo@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com, quic_varada@quicinc.com,
        quic_devipriy@quicinc.com
References: <20230521222852.5740-1-quic_mmanikan@quicinc.com>
 <20230521222852.5740-7-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230521222852.5740-7-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/05/2023 00:28, Manikanta Mylavarapu wrote:
> Since Q6 firmware takes care of it's bring up clocks
> in multipd model, remove from gcc driver.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-ipq5018.c | 414 ---------------------------------
>  1 file changed, 414 deletions(-)
> 

So here is explanation - your patchset is not bisectable.

What's more, I really wonder now why these clocks were added if firmware
handles them?

Best regards,
Krzysztof

