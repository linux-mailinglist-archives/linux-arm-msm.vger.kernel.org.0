Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B56FA5B38FE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 15:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbiIINam (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 09:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbiIINak (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 09:30:40 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45023B9410
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 06:30:39 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i26so2664026lfp.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 06:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=0iwWRUH0uVdaXEkP4fyReHjF9IcUCpvLt0X1N7qJbAU=;
        b=me7zJxjXe/dbRZGdMGLErW1K64o934AvJ0TcqsZytC6byxtY9fKM0CfQk0CsZnxy0I
         hygm0lYum5+lK4wNVmlkCjLgLui4+DqqRStO/AxBerJdRjy2Ti31JDHxj4TMLPqcdDCq
         +dlv3xeQxd36c+lItopodK6Qbh2+WiAi9/TpPPFRE8lq2dMxpncIl2ZezoaSqzCy6ovf
         GJr5KbBhe6Sx89Js6Y5Ezy+5nfgGD+iq/88eqmdVXmfSmdirvdfPOHrm35XpPUZEX+BL
         R0Fs5511uvb1tGFlWcEB6W7l4zwWCK+5AT8wRAjsRbwBW4+hxuIO9YFLq4QCP5u1j8qc
         N2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0iwWRUH0uVdaXEkP4fyReHjF9IcUCpvLt0X1N7qJbAU=;
        b=BLHR0DT0FR2bnS3b2Ya5KGb7cVYCaA00FAfjf3nAMOZdXdWSDVoQYBQV03XTP9+cxm
         bAFuUrUUk1B0kpitT0D6lc4zl7y6H44mlIpEM3+nNm9CVfmWIpD1wfIUqqUOQ6Mf92AU
         DiBNQtMAJ5KjRUCXrHKnAnNlkVujXqufbabw5yid8iulby2d3/EWs6aeMSdlxkZJtriw
         DiF/KzpBkooo8dma5grekfMoIlqckzsjn14gIW1J6/ftPl82B+GYECTMUQyRJ+5YREt9
         ZRoayOPnAQuGzrC4JRMVTi1ISWUYRWO6fu2jAK/25lxdc7ES4ONtAn7nXGFOV3gyINrS
         RKGw==
X-Gm-Message-State: ACgBeo19YvCVqSiBs/5wq2hxhjfCaS3V+A2TqSV5gVTV905Y5bieLVwv
        RCd3D421/coSw/M0NwcpfA0ldQ==
X-Google-Smtp-Source: AA6agR7vnlhxULbMqWjy339Ll2KHSeX5XyixafcQzw/B5BqiTWG7Qjf+aajlF8XgVHs00A+7ADOxqw==
X-Received: by 2002:a05:6512:1188:b0:494:b306:c80 with SMTP id g8-20020a056512118800b00494b3060c80mr4802792lfr.390.1662730237402;
        Fri, 09 Sep 2022 06:30:37 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o17-20020ac25b91000000b00492f294f06bsm86512lfn.110.2022.09.09.06.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 06:30:36 -0700 (PDT)
Message-ID: <d72fc00c-85ba-8b48-1fcf-42fe9e8daeee@linaro.org>
Date:   Fri, 9 Sep 2022 15:30:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/6] dt-bindings: phy: qcom,hdmi-phy-other: use pxo clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>
References: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
 <20220909132010.3814817-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909132010.3814817-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2022 15:20, Dmitry Baryshkov wrote:
> Add pxo clock to the 8960 bindings (used by the HDMI PLL)
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/phy/qcom,hdmi-phy-other.yaml     | 23 ++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
> index fdb277edebeb..2c21e120ff8d 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
> @@ -53,7 +53,6 @@ allOf:
>            contains:
>              enum:
>                - qcom,hdmi-phy-8660
> -              - qcom,hdmi-phy-8960
>      then:
>        properties:
>          clocks:
> @@ -63,6 +62,24 @@ allOf:
>              - const: slave_iface
>          vddio-supply: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,hdmi-phy-8960
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 2
> +        clock-names:
> +          minItems: 1
> +          items:
> +            - const: slave_iface
> +            - const: pxo

Why pxo is optional? Commit msg does not say much here.

It seems you also miss the DTS change adding the clock.

Best regards,
Krzysztof
