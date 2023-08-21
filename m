Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 743C478237F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Aug 2023 08:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233343AbjHUGQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Aug 2023 02:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjHUGQz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Aug 2023 02:16:55 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE929A7
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 23:16:53 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-991c786369cso387787466b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 23:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692598612; x=1693203412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v2DHyxVTCML6SgQFmf5PrsWXwq96mK2/2B8sy/Z+uk8=;
        b=C2TLrPHZmARwktMNeniUL0KRM2S0lGuotVl5NAtWMyV2lPtA9ulYwCm28+Lxg6mW7t
         tc6Xh4ksk/vbqObq6ch/Ati18gnFFMzH14RIALu5McnjYOL3qjUG7c47tp4baaNcT4BL
         20Zd0s2s1Z93Dcc68qNYv4RppsTuk09AO95KsqlZlgE8tJlvaFZ7KXchNUznWT0Sr75F
         eA2IuDL7SIfGtYAM3bcWEFF1h5jaN0f1667Dz9iZs6EabBS/DKe+aaLd/Z0BJgkmG4mY
         g4s+pe9fn+iAwCU8Y0FEBxn2DvK6lYUMowp+k4luRedN2Kq9xhi+yCW2wpzI7K+GlMvG
         w2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692598612; x=1693203412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2DHyxVTCML6SgQFmf5PrsWXwq96mK2/2B8sy/Z+uk8=;
        b=RoT+VsMJMvJv/lVwYjdh3Ormz31BljDKzcVS9EEwVA8CsIM/GJ9IEacC437ozDjpYb
         jTpavQ7y/hx1BmyAvmRcOC13JX/B0pLh1C2Bv1OHa3vXgYflD6Park2+X/KJicQhWmBS
         +yuP2q9bXmY4VxiUyedZq+aoFk0VxCTyN8nKVY/rc6yfeCfoanPN5o0xURuaaRdUpCKM
         5jzDdL10W4S5TaxTfIPq+UL45I5RP9MEZLj320VlnomTBJWEl1wQQNQtDb93197Ef8q8
         +fDsIBaywApFsQ0vJLO7CsL6GVOwDUSqXXbvl7ot9SbSMXHVon9IbDWhKACgYglIerLx
         dQOQ==
X-Gm-Message-State: AOJu0YxS8NRRh4MhR66hY/BWca/ztvkaLTbk97mO3p1+gqJ2I+yCZyTr
        Wl4RmkQ524AEK09nCVSaPv0qfA==
X-Google-Smtp-Source: AGHT+IEOgpV7Sr7hyl2V7Utgz/9q0+j+gDRYIgrp8qYMaflN3noIyg4RZtchBkGl08PCwFfZja/qyA==
X-Received: by 2002:a17:906:3caa:b0:99d:f7f3:5218 with SMTP id b10-20020a1709063caa00b0099df7f35218mr4050827ejh.25.1692598612112;
        Sun, 20 Aug 2023 23:16:52 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id um6-20020a170906cf8600b0098d2f703408sm5966631ejb.118.2023.08.20.23.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Aug 2023 23:16:51 -0700 (PDT)
Message-ID: <09b4909d-686d-3e3d-f4c5-12e5cba3dd19@linaro.org>
Date:   Mon, 21 Aug 2023 08:16:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 01/16] dt-bindings: phy: migrate QMP USB PHY bindings
 to qcom,sc8280xp-qmp-usb3-uni-phy.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20230821002535.585660-1-dmitry.baryshkov@linaro.org>
 <20230821002535.585660-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230821002535.585660-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/08/2023 02:25, Dmitry Baryshkov wrote:
> Migrate legacy bindings (described in qcom,msm8996-qmp-usb3-phy.yaml)
> to qcom,sc8280xp-qmp-usb3-uni-phy.yaml. This removes a need to declare
> the child PHY node or split resource regions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> index f99fbbcd68fb..60cbcf3c19b3 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> @@ -16,20 +16,33 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,ipq6018-qmp-usb3-phy
> +      - qcom,ipq8074-qmp-usb3-phy
>        - qcom,ipq9574-qmp-usb3-phy
> +      - qcom,msm8996-qmp-usb3-phy
> +      - qcom,msm8998-qmp-usb3-phy
>        - qcom,qcm2290-qmp-usb3-phy
>        - qcom,sa8775p-qmp-usb3-uni-phy
>        - qcom,sc8280xp-qmp-usb3-uni-phy
> +      - qcom,sdm845-qmp-usb3-uni-phy
> +      - qcom,sdx55-qmp-usb3-uni-phy
> +      - qcom,sdx65-qmp-usb3-uni-phy
>        - qcom,sm6115-qmp-usb3-phy
> +      - qcom,sm8150-qmp-usb3-uni-phy
> +      - qcom,sm8250-qmp-usb3-uni-phy
> +      - qcom,sm8350-qmp-usb3-uni-phy
> +
>  

Just one blank line

>    reg:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 4
> +    minItems: 4
> +    maxItems: 5

The clocks become now variable, so you need to constrain the number in
allOf:if:then per each variant. At least one if: cases lack such
constrains (qcom,ipq9574-qmp-usb3-phy, if I am looking at correct revision)


Best regards,
Krzysztof

