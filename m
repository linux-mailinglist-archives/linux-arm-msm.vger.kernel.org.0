Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D31B4FF814
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 15:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235913AbiDMNrQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 09:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235920AbiDMNrP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 09:47:15 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A54D75F240
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 06:44:53 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id bg10so4070686ejb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 06:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2jtZIB/IVpZD2JDZRTfQ4w1vkKRIDRhkH1q1iqYE4AE=;
        b=JkqBbEmSdK0vs6ZM2OOyNoUI2SkJoeJsQRvFJ4xdFYF34DZUMNXdeAsXvV2CxGhHwi
         D4k4DGIch+Gu4j5Vgs3B/TBiXIM0UGuiW39RjR5sS4LMyblap9IW6O0m+Ssa7ozv6vFT
         nGvKRxO36wkll9iDz1+1E0+xAwa5fJkOf5MHAi7wOHnSJYseli/me2Cb01JfAl7yltY0
         dMpw3yN1/u/5RZnqZVDvs1HVzT5VXdu+37pK5n/TMMq5EsEtevM0AotFAD3sQrNQggCO
         VVW6FmlqPgygBFNsj0aJvoxMXCTg3S5l6sjTjGunaDzKpTffnXiMSrwdu9rhZh77nE+H
         Xqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2jtZIB/IVpZD2JDZRTfQ4w1vkKRIDRhkH1q1iqYE4AE=;
        b=4YVb8AfUjQ+aNr7AcpDrZT8Aq58yDAO+kH0ul2lqoHmZEA71hIrSLqJ8msFmlamZ8X
         HPVSkRdOO1EZvk3AgFsCzeu5LO2sX7qsqs7Sry50BlwMQLnNeOm5ud8LjrFmXnMYA0KR
         F7EqH52LxE+jMrvL/2FAZiDbuhH8Vz8c7hqLPNK8BmIYEeNEjlB4v0+lEB9FjMNipsuK
         fep9yW90Eo1iRb9qA2u6e54WSvu0ZQxNRwbyH2AFUQj5KGG+jnOsv9Fh0rT+rHi0NGLQ
         QV652iGNDqeNsgLKNffpr2suizsLEDR7/ObDfjEqPFZEIocfEXsF0OC+J9F4u4USRh0d
         pTMg==
X-Gm-Message-State: AOAM531De1u6VzA6i09XOLt2OSkIsUyFLPPWB2Y2SSWUZFrI/5+yFAtH
        txdNmdjDCMQgDBzDWxdOa5MivQ==
X-Google-Smtp-Source: ABdhPJw574Ms3y6EsF7d/GyVo36j8uqmyM74s+vb9xThkVjmnlSg+Z8+rkNl/oMb2R1sUzQOTSycSw==
X-Received: by 2002:a17:907:da9:b0:6da:beb8:fdac with SMTP id go41-20020a1709070da900b006dabeb8fdacmr38655115ejc.364.1649857492258;
        Wed, 13 Apr 2022 06:44:52 -0700 (PDT)
Received: from [192.168.0.205] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id l3-20020a509dc3000000b00420195722c7sm256664edk.6.2022.04.13.06.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 06:44:51 -0700 (PDT)
Message-ID: <b9f9e72d-c202-9050-92b3-8a0fc64adb26@linaro.org>
Date:   Wed, 13 Apr 2022 15:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: Add Qualcomm SDX65 DT
 bindings
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, djakov@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1649854415-11174-1-git-send-email-quic_rohiagar@quicinc.com>
 <1649854415-11174-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1649854415-11174-2-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/04/2022 14:53, Rohit Agarwal wrote:
> Add interconnect IDs for Qualcomm SDX65 platform.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
