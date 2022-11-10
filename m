Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5EB623EA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 10:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiKJJcw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 04:32:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbiKJJcu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 04:32:50 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C8B13F06
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 01:32:49 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id j4so2165696lfk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 01:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DLrGG9afZTRSq/VDs9kPoqEhvBwGphXAIRIsk/T03ro=;
        b=q7EarRQldf8WBLHDdiSgrCFp0QRzCPuKTS33Qm5FyZoaCOJkYu8/Fdg/GjgeV3m0ku
         k1jcAhFH1foaHlBzwo91kz9LXNQ5W9ySh3pWbCEMC4A/h1AXmQ+/kslHQStyby3gEsrx
         BCExCT0zOpfMy2oZCkJiUD/wtgYjndrt0GyX37OzfrgE0ryJHDjy++GZqfGBy6/ad4cP
         2kyE2TK5R3zRTLpXPJgxoGmX+Rjz9Jr+o7eNBhh5/7f2ZF+ZYXFKJXRxn5G1k/VMjq0B
         n2Sk790N0pbz31ddPVTzdHkTXoC11yawP2yI0kv3X2NX37teF/LqaqJGdrEXMkRVw2Od
         qPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLrGG9afZTRSq/VDs9kPoqEhvBwGphXAIRIsk/T03ro=;
        b=nWB0w62nz+rpf44A7tKeYjlskaBNJcsPZUVVo0tc6yVkR62rstKl0CkYRnGF1gR7t0
         GHBMpM1VnGalnw6/dfXJI+pYPobZOMu9keHTcVp/AenQrQc+f3Q0shO2q2tdqqdqpoCe
         pIOqEOpFtsgPxNopJcto5PuJTAptL7v19EqpptAKY1bLOdx8vszx/qs1iTk2fM5QaCKM
         SApUE7bIxxc2/4IS+K5T5ihZOGpGelsirZDFZUWJQhRahb6j49j8SS6PRBHPQMrbWdED
         O93BiO/uWleve10RJ12a5i6OdAZ6BJeFpqRJ7bJ0R8ERDEW6JLxDhDJa/41UIDEeQKHd
         MDzA==
X-Gm-Message-State: ACrzQf0++ipd30WVLoeDuY8Gq0uQwkMm2PmSfR93LM9HZQ3b9shBKuER
        pf7S42hqigp/g4qbrn8lPXnLWg==
X-Google-Smtp-Source: AMsMyM7JWZHzAntJ2SR05J8xHKjMaMhEk0eTyeVRZ5R76RAGSWOpQX0URiu6j77VxJEuKPVp3JsPsw==
X-Received: by 2002:a05:6512:33cb:b0:4a2:9a62:bdd1 with SMTP id d11-20020a05651233cb00b004a29a62bdd1mr20566929lfg.105.1668072767918;
        Thu, 10 Nov 2022 01:32:47 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id d23-20020a2e3317000000b0026df5232c7fsm2577263ljc.42.2022.11.10.01.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 01:32:47 -0800 (PST)
Message-ID: <be450f51-6e1c-a3c1-904f-1f915f0dba5e@linaro.org>
Date:   Thu, 10 Nov 2022 10:32:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,adsp: Add SM6375 ADSP
 and CDSP
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221109170822.58281-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109170822.58281-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/11/2022 18:08, Konrad Dybcio wrote:
> Add entries for SM6375 ADSP and CDSP. They are effectively the same
> as SM6350 ADSP and SM8150 CDSP respectively.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

