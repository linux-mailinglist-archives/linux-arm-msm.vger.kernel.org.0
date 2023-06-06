Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58550723C1A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 10:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237198AbjFFIqR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 04:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235786AbjFFIqQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 04:46:16 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46794100
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 01:46:15 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9741a0fd134so967064566b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 01:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686041174; x=1688633174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhXwQM1axbZVP2R8OTg/nTjRF7LjBSXFyA1Pe1rgXwU=;
        b=rz3hnPVFfhJzaBCsj7KdnoW0gEFzBX+E4PmxU2fSGOXzX9Z736UZEzGJVbPU95rVXF
         yWbhRTdZQWTQUmRR6Al75izbMAIlNO/eI3RTB4MKzlhjY+6DitK2Ozp8ne9ElMAv8GKr
         Nqbb1sS5lku0wui9HJAOnwLD4DfDzzj2cM2j8VFtnMU/n90z0lAy1JNUb/KpNHxwz6cr
         cpCjh2bApJio4b/SQcgC5OixLa4idbENmrjA/k/8P+SxNnORYDSp6z3CCyhLWbBxpU9q
         MuDzunhAflP9gXTmwyPVs7k1gj01Z6Vth9HXUd9tAWbAIaJ0NFsaL3l2aIuDZb6VuQAM
         6f9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686041174; x=1688633174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhXwQM1axbZVP2R8OTg/nTjRF7LjBSXFyA1Pe1rgXwU=;
        b=Q6D1Ua9TDMm+kh+/nG+7NZXO4ij2ZpaeEYvpWqrEMWxrghDvZpYkerCdyMwLowCCpR
         zpLTPx4Dk58pxai7Rx8wyK6VcB8U0gJAw1xCti8uhYYgONy3NBBXjJqUz9zE1SXuX+yb
         q+/1CAy1tK+9bzQfctTd5IKxbGC5LZ07Dgu12Z7Kk+K61l6B0pxaJx7MjzZcigDGMfu1
         dJl0X/lCEuf4U9bVOxGcAur5oRyZbRljjvPWvfe5IWG+wUI0TDex6P1ELQ2XAWr4u8t0
         pT7xlkgQTtGYpqdjjmZaZA5ryn3mG8AnelHtqoa8Ag22Xfvnr37+FPr7eXIZWvIFB0YJ
         Xerg==
X-Gm-Message-State: AC+VfDyHzvujSXgGFmltljHRCRXpzIZ13Uqh8PQnzJqPgCz7JVJiVf5V
        n919DlfElbXCdt2KNGU4nsPD+w==
X-Google-Smtp-Source: ACHHUZ6XPMkYalRlyNWE2pAPL43aV20Dl8/aCIgapDRm3k9iQeuNZMX/aNkFgm3+1GqDSzEW+qa8mg==
X-Received: by 2002:a17:907:9496:b0:970:19a2:7303 with SMTP id dm22-20020a170907949600b0097019a27303mr1672203ejc.19.1686041173683;
        Tue, 06 Jun 2023 01:46:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e4-20020a170906504400b0095342bfb701sm5455841ejk.16.2023.06.06.01.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 01:46:13 -0700 (PDT)
Message-ID: <2c3fa1f1-1859-0914-b39f-05f1f4186179@linaro.org>
Date:   Tue, 6 Jun 2023 10:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4 2/4] dt-bindings: phy: qcom,usb-hs-phy: Add compatible
Content-Language: en-US
To:     Rudraksha Gupta <guptarud@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20230606040529.122433-1-guptarud@gmail.com>
 <20230606040529.122433-3-guptarud@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606040529.122433-3-guptarud@gmail.com>
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

On 06/06/2023 06:05, Rudraksha Gupta wrote:
> Adds qcom,usb-hs-phy-msm8960 compatible
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> index aa97478dd016..bdeffb52340b 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> @@ -13,7 +13,9 @@ if:
>    properties:
>      compatible:
>        contains:
> -        const: qcom,usb-hs-phy-apq8064
> +        anyOf:

Look at existing bindings how this is done. This should be enum.
Best regards,
Krzysztof

