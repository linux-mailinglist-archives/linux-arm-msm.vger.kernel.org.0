Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C295D784587
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 17:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237112AbjHVP30 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 11:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237117AbjHVP3Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 11:29:25 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454EE10CE
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 08:29:00 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99c1f6f3884so601373566b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 08:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692718138; x=1693322938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=riCUTte2KwgQTf0uug7M8nFjfmUWA0ZM7Rw0YBzTJ94=;
        b=v4O8cGKSnt2n+DNt9sASR+Hx6cTgwCB36bVGmHRtK9MqxG15rhCxKFq/V7hWigYvrs
         lKkTkSnetHB/St5a4CUQ9GQZS4XE6xZEgHXXBOBFmoXO+OZ/VWkrXxpzDeS7+BlP/Msc
         tiBwdsbl4rtOHa3bPgJT/JNa/ydLkpuFoM/DUsX2FXr1xEknj701C4+iMt5Yx2TRjl/s
         oXANLd3ywPqkwGeTjARhhHDCmII+t+cyu7ynkkkNqNrnrr/jCZUH76Sgl6uUlETOBkqF
         A+ZbN7JamJlaCA8kV9huOa5r1d3bEMlLPZaA2LAyd2s/Tky5X1OMY4G1SXIr+twj9JcG
         ILfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692718138; x=1693322938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=riCUTte2KwgQTf0uug7M8nFjfmUWA0ZM7Rw0YBzTJ94=;
        b=K4TtVow2EwYNLBeYrImj+MOYoEsq+QbNpSdq2EK2VyrJXu86199eEVIw5hj+lJ7uuM
         1mE4GDo4pJc3d7HWkyD2SXIcl0XKrdAxXFWRjs76TqE75RPAlVesulY0DZCtW6oTjQkp
         Zp8iBwNjad3QRSX0+o053dXIob6CEEqnJPiIAXffCeXUZsengWYALQ5d7d5wnToYgYxW
         RLHfyiMah8z5mHNIjqAfdoUIzbu+QPf8plDSNF1aPGnJ/eFOVU7lgurz1XxzDeOou+8e
         oXhs05O6U5/5mkiOcepo93gqZbhmHyocW3LIPdNX4q6fBtAfA6jKA5cKPp4t5SAFigCV
         6kqw==
X-Gm-Message-State: AOJu0YxNsBrHKYjmm8+2Pe3ROetprRgZW+lzoi3HqIiXZ8WZlJ32bevP
        C2/HXOjnY2XE4TxsIimu6FmZKQ==
X-Google-Smtp-Source: AGHT+IGu8FIe9AS50nTf9oIl5I4jY7m5Jzrz+yG59/b26Lg38Fc6IBWuOUcOD2aQyIFcCaiNvGZdcA==
X-Received: by 2002:a17:907:770f:b0:9a1:8b23:3c88 with SMTP id kw15-20020a170907770f00b009a18b233c88mr5846641ejc.17.1692718138642;
        Tue, 22 Aug 2023 08:28:58 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id h6-20020a1709063b4600b00992f2befcbcsm8391884ejf.180.2023.08.22.08.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 08:28:58 -0700 (PDT)
Message-ID: <8f2d647b-9972-deb9-e96f-779d2564ceee@linaro.org>
Date:   Tue, 22 Aug 2023 17:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] dt-bindings: crypto: qcom,prng: document SM8550
Content-Language: en-US
To:     Om Prakash Singh <quic_omprsing@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230822-topic-sm8550-rng-v1-0-8e10055165d1@linaro.org>
 <20230822-topic-sm8550-rng-v1-1-8e10055165d1@linaro.org>
 <8479869b-9984-41e3-9812-c7f5727cfd2c@linaro.org>
 <b73106c5-74e4-479d-8733-b99454768c15@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b73106c5-74e4-479d-8733-b99454768c15@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/08/2023 16:54, Om Prakash Singh wrote:
> PRNG Block on most of newer target from Qualcomm have some configuration 
> where clock is configured by security firmware.
> 
> Adding separate compatible string for each platform is overhead.

I don't think PRNG is here different than others and for all others we
expect it. I understand that this is an overhead, like every work is
overhead.

> 
> We need to introduce common compatible string that can be used for all 
> platforms with same configuration.

It is already introduced, isn't it?

> 
> I would suggest to use "qcom,rng-ee" for newer platform, dropping "p" 
> also signifies it is not a Pseudo Random Number Generator.
> 

Best regards,
Krzysztof

