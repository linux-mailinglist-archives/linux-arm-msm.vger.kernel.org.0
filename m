Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292ED700D7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 18:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237683AbjELQ5G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 12:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbjELQ5F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 12:57:05 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E02A5E8
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 09:57:01 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-965e93f915aso1743228966b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 09:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683910620; x=1686502620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KoFgSe/dfR9cPbJoIcRRFNKD0IGyc+Tftfo8TVK6UiY=;
        b=eMzQ4F4PVJs7BB6ELlNK351hGf6g5cYsZTL7j7iyqKVD2cqTi4wMoeOMYpjCScD3oS
         vup+AQTrCUahX57GbKgw47MbMsArcI9XwNCxWHTzqfjr1Nr94NcZ6L729E7ikpK2N4+p
         MbIbOjRYByzP8EAn/shvL8gHEnQyJyYtp+FN0fp+LxMgwjygsU72q9Y0WPJcyu5neJ0I
         xI+6dNyVxOBv8Sb59l7s8bGT6cZjVO0Rjf15EBYpetACKYRGRpZkKcnph556gZo8r4rC
         d5rhvmY+1EO/V10zolgfFvrrSyDEY0GyXSWjIZ8sMp5TAo5bkL64v+NZu0UTu7AEmjAf
         YG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683910620; x=1686502620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KoFgSe/dfR9cPbJoIcRRFNKD0IGyc+Tftfo8TVK6UiY=;
        b=OEXY21LfVSE3vkSvxP3IFerl63S4KAg6Mis8xa9t1dhYYX8LCvz2E+vKTxzyn89CvG
         cGo5JcLLMSKt8AQXIv1dj2WcHTzlVDDHm8pTYnd3hCITn7XQP5pc/SF8/76DLUPtLhzt
         yiq5v9Aq4aLvCPFHtglNaJGoGexMkOxtEBV+PQdXRqz5MND+a5qe1mKo55Ycn+CWTZ1l
         jOawolPIE/Q15x1neSkF2fyfO1OC4qdsxoVZ1/WLz9DTMv0k//OHu1xALiANDDUUZeWw
         MlaAKSHUbboXYgC7E1LYaFgRRCO+u9IHAA8XM/ZscrxQual9FIak7Odq0ZnG3LjD3ioL
         vBAw==
X-Gm-Message-State: AC+VfDzzgezT6bGhNNLcL2WMc1srOx346OFDkqnUX4o9Mr/+TDTOG0w1
        uF8HE5VpSD0zrGlu9Vf6XfgXnQ==
X-Google-Smtp-Source: ACHHUZ642+iMIpj37OuG39p+YvMxP3rY6+4CTIA5tKpoMZsQWgp/MuqvAyro2dqBQ2CctZ01VjN1jg==
X-Received: by 2002:a17:907:2d11:b0:96a:8c13:8dc0 with SMTP id gs17-20020a1709072d1100b0096a8c138dc0mr4959132ejc.37.1683910620061;
        Fri, 12 May 2023 09:57:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id h10-20020a1709070b0a00b00965ac1510f8sm5626529ejl.185.2023.05.12.09.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 09:56:59 -0700 (PDT)
Message-ID: <4766aabc-9b03-3241-82e3-8c4799ea7978@linaro.org>
Date:   Fri, 12 May 2023 18:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 02/10] dt-bindings: nvmem: qfprom: Add compatible for
 QDU1000/QRU1000
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230512122134.24339-1-quic_kbajaj@quicinc.com>
 <20230512122134.24339-3-quic_kbajaj@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512122134.24339-3-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/05/2023 14:21, Komal Bajaj wrote:
> Document the QFPROM on QDU1000/QRU1000 SOCs.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 8d8503dd934b..59082f6e8c9f 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -26,6 +26,7 @@ properties:
>            - qcom,msm8996-qfprom
>            - qcom,msm8998-qfprom
>            - qcom,qcs404-qfprom
> +          - qcom,qdu1000-qfprom

Above qcs, to keep alphabetical order.

That's a new patch? Nothing in changelog suggested it...


Best regards,
Krzysztof

