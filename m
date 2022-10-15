Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26F465FFA4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Oct 2022 15:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiJONfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Oct 2022 09:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiJONfX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Oct 2022 09:35:23 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABB728716
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 06:35:19 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id i12so4947702qvs.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 06:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jkcqe6Aw+7OJI225AGBLIYG3qr/n+NNf8k9rGsJk/18=;
        b=LVGdbQfPrOWvu7Q0dAfUe6/KaRakTMgliY5CBpGEvaanOsAmjuDEfVGJjqlsf540Pa
         Do0kPx8nxUudS2bms00RGubL6bLlFFoE2patSLR9vipd383En41/lIzP/uesrfqfw3aU
         cR9J+dJjTFMbWDeGjuI8ssiPGguI9MQdIysw6UYcALA8MhsSBRmTYa9r6rZam8N81iy6
         cEp5h0ufHIl4TZKTlaYnPZx3taunuXcS2HMp5cXMHPKcmh6VyXOIxkpQWzvbvkpNgEV5
         Q78IEJ4qvTXEPaEjyiAL4kEV6WitSn3DIDXTUWsd11GtSpvoaGGrdQCfjpXYCou2wafR
         xFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jkcqe6Aw+7OJI225AGBLIYG3qr/n+NNf8k9rGsJk/18=;
        b=jNxoecdIEtgHgEP3+CEh8EyVmaGXarcijdh3X2Rzs8vFHWeimAqZTLbboXR0VkTLn8
         gyD5ysP7+v22S85p2W9QCqfvO1FS9j5vdYJfFH9ITqqqLqCJbvdn4d+robxzeKIVUz3o
         er9XXNJdc7Ne0iSPU2KmQlc90ghjPV8aDIVS0st2bSbFX94gmP4UHtg1fJYjxnDp4QeW
         Ld/mqahCRyXWbKal7rUP2nuh+pEQIJS1IkkCkoSPsY1tYtUGKcK2cSWLuU/Wusk6riBb
         mSUrtTUKoAmwcJRmg3oJ80w/ZjVGoDHTuXHJYktUb0idK69hHAjB0/8GJB6pQfY/tJ3V
         1HtQ==
X-Gm-Message-State: ACrzQf3EYuF1VlsV8mQDlVtNBUG/xPUs5eb0AdAcZNcxDF0SOc6DjxaG
        KRkkAKgyT2mvYOTMqBPaE7Xm4w==
X-Google-Smtp-Source: AMsMyM7nMDg8msQoBQxxTGrTLeaCf0ztgZP886nRu6CW2CERS8+Rh6tZ2dm5e8Eopk0eUYeQlhcbug==
X-Received: by 2002:a05:6214:1c46:b0:4b3:f935:7cb9 with SMTP id if6-20020a0562141c4600b004b3f9357cb9mr1968222qvb.9.1665840918713;
        Sat, 15 Oct 2022 06:35:18 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:161:5720:79e9:9739? ([2601:42:0:3450:161:5720:79e9:9739])
        by smtp.gmail.com with ESMTPSA id w13-20020a05620a424d00b006ce441816e0sm4973747qko.15.2022.10.15.06.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 06:35:18 -0700 (PDT)
Message-ID: <7b25172f-9c59-5ff9-b6b3-38ca62a1d1f6@linaro.org>
Date:   Sat, 15 Oct 2022 09:35:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 2/4] dt-bindings: power: rpmpd: Add QDU1000/QRU1000 to
 rpmpd binding
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221014221121.7497-1-quic_molvera@quicinc.com>
 <20221014221121.7497-3-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014221121.7497-3-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/10/2022 18:11, Melody Olvera wrote:
> Add compatible and constants for the power domains exposed by the RPMH
> in the Qualcomm QDU1000 and QRU1000 platforms.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 2 ++
>  include/dt-bindings/power/qcom-rpmpd.h                  | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 5b4eda919911..ffac5fcf5f6f 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -28,6 +28,8 @@ properties:
>        - qcom,msm8998-rpmpd
>        - qcom,qcm2290-rpmpd
>        - qcom,qcs404-rpmpd
> +      - qcom,qdu1000-rpmhpd
> +      - qcom,qru1000-rpmhpd

Same question about fallback.

Best regards,
Krzysztof

