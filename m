Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2C425667A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 12:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbiGEKS6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 06:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbiGEKS5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 06:18:57 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A16D13F99
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 03:18:56 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id g11so4505437lfb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 03:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Y5xxTy64j/IXBvCi+UqEMeFH3+HKluv0ERR26SN793Q=;
        b=ShbD8KVHYEBcL9LRw9qfy6xw+WbCyxIo4MmO6Rco9eNztxwwK+J8EdEpAtS/CSUMnV
         Yl7ja7yrdX+V9ziX5WX7k8C1npjSj1jgJXkOaJubu0OA/1lWKYPiZn+k0U4GJB+p7tM2
         FEiVR2XKuMAGXOB8NeYhzTrdnGSf3m/Tg54XkMoW4lcMVHRwcsIc3kqjfhCntjTGL5K1
         oJOiUFO1ovQqnC2dWlqPmB7ggNstNVUdShx0PxSrodZigDSxnM12cA4jMKOrmyvauJSp
         CNrDou6negNaeAfGGrqTP8PXDCj144N2eWegeRrKY2/xBQi4Q6u/roPrj+x5CawMZiiI
         cXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y5xxTy64j/IXBvCi+UqEMeFH3+HKluv0ERR26SN793Q=;
        b=NOKl2QqfjsO+aP3DVHBAweiXprPuSS6aOpjZhd69OxraV+RbW2nZrL96lXBsi6Qct9
         2TT/HHW/JpsMCOz1ZCfxIPPuUXQ/MmuaKqcl1wwM/BYRHaYpZU8+skDmG2WeX5/RGeNa
         WOH+VWSum3ia6lXZzkxmyJRyLrVtBayYNMyivdx8cX2UR9n1/878uvjY7LM0HBdMknC/
         lcgsPt/X3xzsseiyknu58nTVU6+bjgV6TkeofN4nY9FTdA93QNw0wgQd44Po205aax9e
         x44OFYeaif8gIFm5a97t5mKvunX1h74xnBN5d4+kcTaBmJPcErpGCKKQk4HzMHvVKoxD
         9S1Q==
X-Gm-Message-State: AJIora/QWMOO58TraTmeScgIN1Jbv+TEjASlfu7tiXk+1BIKObGobHwl
        Us6opGsyu24VDi1qkZeEyM7hPzkXb39UFA==
X-Google-Smtp-Source: AGRyM1vi/9AQ0rFfXa1qV1eAVB2hWBksCtW/Bu9a8xbqhzOHB3YAxZ1ou0nh9spOXllZ6Lw7YYpMzw==
X-Received: by 2002:a05:6512:1053:b0:481:18b4:a90 with SMTP id c19-20020a056512105300b0048118b40a90mr21331495lfb.22.1657016334548;
        Tue, 05 Jul 2022 03:18:54 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id z6-20020a2eb526000000b0025a94f8fadasm5283789ljm.67.2022.07.05.03.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 03:18:53 -0700 (PDT)
Message-ID: <4ed57143-d182-fef2-7570-a8b000a88f58@linaro.org>
Date:   Tue, 5 Jul 2022 12:18:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 18/43] dt-bindings: phy: qcom,qmp-pcie: add example node
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705094239.17174-1-johan+linaro@kernel.org>
 <20220705094239.17174-19-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705094239.17174-19-johan+linaro@kernel.org>
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

On 05/07/2022 11:42, Johan Hovold wrote:
> Add an example node based on a cleaned up version of sm8250.dtsi.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  .../bindings/phy/qcom,qmp-pcie-phy.yaml       | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 

Should be squashed.


Best regards,
Krzysztof
