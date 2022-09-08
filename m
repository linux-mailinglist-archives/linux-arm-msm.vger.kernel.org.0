Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D7D5B1AA8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 12:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbiIHKym (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 06:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiIHKyl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 06:54:41 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6BA14083
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 03:54:39 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id z25so27102937lfr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 03:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bCjsbMYZ00s3E9QUzikbHsFvxZCZ1zkIocwZxv7IphA=;
        b=xnXcsywD7K3tfuoeLQmbTCrHSULkd9jjsAbbkODi36eIdKZYGf270bvN7pW4YmSTmE
         ALtFZIG9C/QKdmeZq3XdKUdu3VyALOORD83WBndMnn5y72Mt356vngP/31C40Fqw9u6b
         FD2n3GnjEFtyKsiVm8aKrxIXPczOl5pNud3qMSeQcaAwdv3pGPkeMCRkCfHrvz9ZxUE1
         r93fKphlsx0vGf2/jjvm44xVxOsnWYgs1alRF2spfmV9PdE7G1f5rmVyyrNrIZCp3feE
         bbq5cay3jd4RSY9XLGC4FcjET1ggS7BK3cR7MGQoGUNFR5qrreZTmtANE41RXbkn1tRn
         H0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bCjsbMYZ00s3E9QUzikbHsFvxZCZ1zkIocwZxv7IphA=;
        b=iggc5sjS5REJrxd/+/TQAMGUHaYCDSkyQUkXZRfZ6iYlknfg4xIVm6MIW0W4BNpPpc
         oBUN9wvopakySwCMxCB+CJfvTTFRwSP6HCoHU0MlT6kX6CqXUofxxF5sVHyIsxYe9iMl
         GimuAvmmBqmYeHx3P9bvp9JZM2Gc04dL0UUxqiuTZjPTOuUVict+7aNYLpd2bF7yiq5d
         9Bd+loIZIO4c7gyxn9lPys4mBo3ZWv2BFAIdj2kbBhqbvKi8SssaZoH29yAqkJPdCmA0
         d8KxskDiIohoPoa4ZTm9RRwfO7lSgHxutreDiliQ62sO801i99tsM05vx+URRgywM1sS
         sSaw==
X-Gm-Message-State: ACgBeo2VWHrFP3VYFzJfwLdcq6r+/ngUYco3vzeff609POW0U1aOw15o
        QNEbLA285hapjWsEaaYfeCxnxg==
X-Google-Smtp-Source: AA6agR5rfdSWsMUsiO6kMYy0JFg5VhOo46XNZ5k5GrnOkUDIdPzN4hKQ+17pXP0rav/iy2DwBCot9A==
X-Received: by 2002:a05:6512:22d5:b0:494:7988:f591 with SMTP id g21-20020a05651222d500b004947988f591mr2458085lfu.548.1662634477415;
        Thu, 08 Sep 2022 03:54:37 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g11-20020a2eb5cb000000b002637c04b472sm3110010ljn.83.2022.09.08.03.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 03:54:36 -0700 (PDT)
Message-ID: <e015754f-2f33-ab7d-4f18-e1bef39a8390@linaro.org>
Date:   Thu, 8 Sep 2022 12:54:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/9] dt-bindings: arm: Add support for DSB element
Content-Language: en-US
To:     Tao Zhang <quic_taozha@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jinlong Mao <quic_jinlmao@quicinc.com>,
        Leo Yan <leo.yan@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Hao Zhang <quic_hazha@quicinc.com>,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org
References: <1662626705-13097-1-git-send-email-quic_taozha@quicinc.com>
 <1662626705-13097-2-git-send-email-quic_taozha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1662626705-13097-2-git-send-email-quic_taozha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2022 10:44, Tao Zhang wrote:
> Add property "qcom,dsb-elem-size" to support DSB element for TPDA.
> Specifies the DSB element size supported by each monitor connected
> to the aggregator on each port. Should be specified in pairs (port,
> dsb element size).
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
> index eb9bfc5..1bb3fdf 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
> @@ -40,6 +40,13 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  qcom,dsb-elem-size:
> +    description: |
> +      Specifies the DSB element size supported by each monitor
> +      connected to the aggregator on each port. Should be specified
> +      in pairs (port, dsb element size).
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

So it is rather uint32-matrix (need to describe the items subschema).
What about maxItems?

Best regards,
Krzysztof
