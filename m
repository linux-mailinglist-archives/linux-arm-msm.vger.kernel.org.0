Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0247975200D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 13:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234483AbjGMLhT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 07:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234290AbjGMLhS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 07:37:18 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E3C271F
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 04:37:00 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso5140205e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 04:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689248218; x=1691840218;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yg3+ltae9txCQHkNZ8ew/vDeWxnQVlh8GZjwxVSzsmE=;
        b=oR6Qq4tUXYxURj2kKLDigQN4hSxPreEHDACih7z6ejaLWNT/QElG/D79Mrsv/vN8Ny
         0r+3bdojlQyIJB3LRXSzcPJKDF/aM5sJ+YSL+TCEAZEeDugGMvAluBLARlsquemP2c7G
         z2SwQCcCmLjwvmDNrjwkFlcYyqvL+34h6CqznBAWjXdr7mP7WRdJzviKLXhITRKu9Ttb
         ZvZopjmcheoHuPhyIIFLJJ+ajtFLN0a1GN6ZnoWFid9e9mYEpsjnYpLALtsm59WrMUpi
         R3PaSl623Ya0ELHJdgSaXgq5g0X+0yaFSYvq139oVeo2geSlyFbXt84190zfLMR9P+wr
         lSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689248218; x=1691840218;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yg3+ltae9txCQHkNZ8ew/vDeWxnQVlh8GZjwxVSzsmE=;
        b=cfFGPEBEUlsoas8xxtP2d5ofF0/l6doQUU8dFBtwuBxUxY+pgoBIKzoukKLyR6Dquo
         25QUYGN9C6kDDex+ipSfc7U1vANaAVhmevUjZnsxjMzlV59n/7d1tpFZ8dSWjDrFxNFZ
         VqEoPUpE0N/nHWLTXbtFoiUheVSiOUEQhhuBzd6KmxfM2fL3VVrokstOHgdFBgYKf/RG
         tvnd5TLEd64xQpL1FLndy4w3/w+nbaB0UDp5Hb75XedVECO8CVM1w47PSr0TIdnf8dwR
         EwH83RN2gCUh6Rvdsa53s4Zh9BNnt4n2pPwxumVNmp/1vjvO8uuVhIoU8zfuDBJaQNPR
         92Xg==
X-Gm-Message-State: ABy/qLYq1pbTsjO+KMeZYlX7K2ipzo3/ySXjMexfKG8jDCxgBDPMS3VI
        1aZVl6XCgupJdMqHjqRH6iobww==
X-Google-Smtp-Source: APBJJlF8GdZS3ShkisOw1onsgke22P9SX9aKJjOQWKfqavy8b9fmDTouU4NBJmZYeT9YO95+hbJ4Tw==
X-Received: by 2002:a05:600c:2945:b0:3fb:739d:27b2 with SMTP id n5-20020a05600c294500b003fb739d27b2mr1180111wmd.8.1689248218586;
        Thu, 13 Jul 2023 04:36:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c029000b003fc04d13242sm15051331wmk.0.2023.07.13.04.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 04:36:57 -0700 (PDT)
Message-ID: <fb7e557c-c41d-26b9-9018-75c179483314@linaro.org>
Date:   Thu, 13 Jul 2023 13:36:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/6] dt-bindings: phy: qcom,m31: Document qcom,m31 USB
 phy
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will@kernel.org, p.zabel@pengutronix.de, arnd@arndb.de,
        geert+renesas@glider.be, neil.armstrong@linaro.org,
        nfraprado@collabora.com, broonie@kernel.org, rafal@milecki.pl,
        quic_srichara@quicinc.com, quic_varada@quicinc.org,
        quic_wcheng@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1689065318.git.quic_varada@quicinc.com>
 <77fe66271044a18871e1dfb80bbb481617197d18.1689065318.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <77fe66271044a18871e1dfb80bbb481617197d18.1689065318.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/07/2023 10:51, Varadarajan Narayanan wrote:
> Document the M31 USB2 phy present in IPQ5332.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v3:
> 	Incorporate review comments. Will bring in ipq5018 compatible
> 	string while posting ipq5018 usb patchset.
> 
> v1:
> 	Rename qcom,m31.yaml -> qcom,ipq5332-usb-hsphy.yaml
> 	Drop default binding "m31,usb-hsphy"
> 	Add clock
> 	Remove 'oneOf' from compatible
> 	Remove 'qscratch' region from register space as it is not needed
> 	Remove reset-names
> 	Fix the example definition
> ---
>  .../bindings/phy/qcom,ipq5332-usb-hsphy.yaml       | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq5332-usb-hsphy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq5332-usb-hsphy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq5332-usb-hsphy.yaml
> new file mode 100644
> index 0000000..2cfdd73
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq5332-usb-hsphy.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,ipq5332-usb-hsphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: M31 (https://www.m31tech.com) USB PHY
> +
> +maintainers:
> +  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
> +  - Varadarajan Narayanan <quic_varada@quicinc.org>

I was wondering why I keep receiving delays/bounces for my emails in
this thread... and here we have. Please correct your email.

Best regards,
Krzysztof

