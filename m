Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD166D5861
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 08:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233354AbjDDGEB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 02:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbjDDGEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 02:04:00 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B5B10F
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 23:03:59 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id ew6so125957798edb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 23:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680588238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITQbTYHkWoQmQdgwcAwJqiyeakrDEM6GM3zR7BrphYk=;
        b=UnQLeYQ8fqD+hzO06oqyAV+9WkUUYl1Lt2S8sG7HrFOGqswoE2n+Q3ZC+HyFHcwvxB
         fdzafJgzmDfT7I7rlOFw2Wl5P/2zM7DcPApOmiDk5D+FtnisTFx/e94EYWLat7PklMTQ
         y32IhYOyiX1mM5YmVgElIJxBHUGrafUTTfEbe5FCbk0a9wWYY5i5JP+exhHguNdwqekf
         2txgUtbQyskTl3awYc58vJwoHgERGqFovj5bqzFmFTxrWWRoqtgcAiXwIGkVggg3OSpG
         z/x9SP+QQDIlNJhPqEzYdzts9xU88AaPMi11p3LilKzcn1b141f/sVKXNoAPNCInBgJG
         QwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680588238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITQbTYHkWoQmQdgwcAwJqiyeakrDEM6GM3zR7BrphYk=;
        b=Z1wHh7qRwRGODM/d7neccUwwb+o/I1YY72gnHSBwqCDioOoVjFA37lU8N/Y6E7GVNa
         qR+yw3sIg7Fooclzw9HVkCpKWLgESfJ2GOJ5X/CPd6KZhVy1C7l2GLMoy95ag6YJagf5
         yCZX8zUfSSwL8StzmBu27/uFdl1kQuwFPSh6AJwMUyPPp4Q38XI5q7/MlzuPC0bsQo6L
         ctVKBrbmrlebVq2ojxrkfj0c3dDpcMoLGTitais+gmdapYgOKuSj4MRmjuqKfZ+0WAGL
         xu/V5wek+2+r4L10eBoMUiBsS55pPn4VGdfxvhkG4aXzNrApg9EzMnG9SG0vs/gBMaM7
         WFug==
X-Gm-Message-State: AAQBX9cgSlrbgabt7Um4HPexOeBLeUtmkLFqN29cV4PXa93Acuz50tZN
        hTCiOwP/EpAN8gxgTuAfgoAiA7Wp7CgmwRtaBR8=
X-Google-Smtp-Source: AKy350ZDbET+D27JH4HJrrFIomqIN72tXDuXuwx6o4ED2+R14BuHvZqPELiopTfjNX6tWFYqm3Thkg==
X-Received: by 2002:a05:6402:48a:b0:502:3ff1:2fcc with SMTP id k10-20020a056402048a00b005023ff12fccmr1503841edv.35.1680588238121;
        Mon, 03 Apr 2023 23:03:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:233a:5c18:b527:381e? ([2a02:810d:15c0:828:233a:5c18:b527:381e])
        by smtp.gmail.com with ESMTPSA id 23-20020a508757000000b004fc856b208asm5427817edv.51.2023.04.03.23.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 23:03:57 -0700 (PDT)
Message-ID: <af9b1432-b86b-dc65-6fbc-799364b4ca32@linaro.org>
Date:   Tue, 4 Apr 2023 08:03:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/9] dt-bindings: arm: qcom: Add QRB2210/QCM2290 and RB1
 board
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230403-topic-rb1_qcm-v1-0-ca849b62ba07@linaro.org>
 <20230403-topic-rb1_qcm-v1-2-ca849b62ba07@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230403-topic-rb1_qcm-v1-2-ca849b62ba07@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/04/2023 19:36, Konrad Dybcio wrote:
> Document QRB210, a QRB version of QCM2290.
> 
> Document QTI Robotics RB1 as a QRB2210 device.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 05badce5fedc..f663af451eb2 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -47,6 +47,8 @@ description: |
>          msm8996
>          msm8998
>          qcs404
> +        qcm2290
> +        qrb2210
>          qdu1000
>          qru1000
>          sa8155p
> @@ -353,6 +355,12 @@ properties:
>            - const: swir,wp8548
>            - const: qcom,mdm9615
>  
> +      - description: Qualcomm Technologies, Inc. Robotics RB1

This should be rather enum for all QRB2210-based boards.

> +        items:
> +          - const: qcom,qrb2210-rb1


Best regards,
Krzysztof

