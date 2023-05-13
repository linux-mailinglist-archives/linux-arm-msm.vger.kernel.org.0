Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 522BC7015B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 May 2023 11:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238074AbjEMJb2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 May 2023 05:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238042AbjEMJb0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 May 2023 05:31:26 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1079661B7
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 May 2023 02:31:25 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f26f437b30so3131317e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 May 2023 02:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683970283; x=1686562283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lUD4atLoPUIqjUvA0YjSVxN7DgNyn2K6Ux+4HF37qDw=;
        b=sm3NRyP0J3NqxqEIFRQCRrwOLtg1vWJzmjaMYf+mIKUS7vg2RvP8n3PG8Vx6Cyt2CV
         QexpDhTkT6smrGSocC830PESlzbJyoPQjhm5CvC5AAkoeLcWLeK8ILai5HO/QQUWZW44
         Vsgth+luZZ1XF9GlrumMoLBBXrTEXc+F/c0A4vj9Pg+CXMKrbFhpnL1Vg5nVYDC7QSGe
         ffV3H8pZTxWmXMih8vbT95yey4xHnCqNxNlXKyHgwx++Dznn0zQght5u1e0xmcQh85Ik
         d/wGLggJBEaEdm2BnVxKXD+7KGZ3H5xpi7/OyNUSBhWepShQh61fpQX/HVT4n6YCualk
         wtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683970283; x=1686562283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lUD4atLoPUIqjUvA0YjSVxN7DgNyn2K6Ux+4HF37qDw=;
        b=aBx6Xvu6WKgZsyTPovySP11tA57GYeUVVHDc2ZLZ/Di6qzH42Jm6rCV+XBKe8g7Vpa
         c+9QnrEsaxthFBPkw85PtqHRjerCzs7SOA7D7ETy7ZYFJuZX3aHBfM6TN3F2AJ+fqp1g
         wD8+5YIFOKuZr2+owuHGpieQdXVAV9ApNej7BrfDDGySi+I5cFUONvsxcY4eDrwxkj3B
         5zPkZFWXZSFIAp7l+7bsZvKLJI6/oUnCONI2gOLaZE7vYUJFMNnupYaVIXBdrfcMpE9E
         nu5/ZuEwB11fasAqJdvB9kA3RVVqDTvd3VGh1JG79GKHSHEDBr4e2F2KcGsfZKZAwcju
         ZaVw==
X-Gm-Message-State: AC+VfDxeq5ld1sGtGBX+H6b6grQXkU7leiIsDrHMsHHjCaFXxJVg7rWS
        fdYZjpJ/h5qW/RuDTxx8tjzbVA==
X-Google-Smtp-Source: ACHHUZ5PNBp2uiCZ8ExV5VzLLfR+n+dW/07yLYvNPQq080llCfdeUDV4flAZk4NkLIP0rVzQ/cUWvA==
X-Received: by 2002:ac2:508b:0:b0:4f0:7d5:1723 with SMTP id f11-20020ac2508b000000b004f007d51723mr4313274lfm.42.1683970283339;
        Sat, 13 May 2023 02:31:23 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id w3-20020ac254a3000000b004f06aa3d856sm1774987lfk.3.2023.05.13.02.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 02:31:23 -0700 (PDT)
Message-ID: <c308dde1-52cc-10b4-876e-a6e51dbf09f8@linaro.org>
Date:   Sat, 13 May 2023 11:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 0/2] Add F(x)tec Pro1X (QX1050) DTS
Content-Language: en-US
To:     Dang Huynh <danct12@riseup.net>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230505-fxtec-pro1x-support-v3-0-0c9c7f58b205@riseup.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230505-fxtec-pro1x-support-v3-0-0c9c7f58b205@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.05.2023 03:05, Dang Huynh wrote:
> The F(x)tec Pro1X is a mobile phone released by FX Technologies Ltd
> in 2022.
> 
> The phone is exactly the same as the Pro1 released in 2019 with some
> changes:
> - MSM8998 -> SM6115
> - Camera button is no longer multistate
> - Only one 48MP back camera
> - A new keyboard layout picked by the community.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
> Changes in v3:
> - Corrected changes from previous version
"fix bug" is not very specific, please try listing them out
individually the next time around!

Konrad
> - DTS is now licensed under GPL2+ & BSD3 
> - Regulators now uses pm6125_* alias
> - Link to v2: https://lore.kernel.org/r/20230505-fxtec-pro1x-support-v2-0-0ea2378ba9ae@riseup.net
> 
> Changes in v2:
> - Corrected model property in DTS. 
> - Changes requested by Caleb and Krzysztof. 
> - Link to v1: https://lore.kernel.org/r/20230505-fxtec-pro1x-support-v1-1-1d9473b4d6e4@riseup.net
> 
> ---
> Dang Huynh (2):
>       dt-bindings: arm: qcom: Add Fxtec Pro1X
>       arm64: dts: qcom: Add Fxtec Pro1X (QX1050) DTS
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |   5 +
>  arch/arm64/boot/dts/qcom/Makefile               |   1 +
>  arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 250 ++++++++++++++++++++++++
>  3 files changed, 256 insertions(+)
> ---
> base-commit: 145e5cddfe8b4bf607510b2dcf630d95f4db420f
> change-id: 20230505-fxtec-pro1x-support-7f782f0480e9
> 
> Best regards,
