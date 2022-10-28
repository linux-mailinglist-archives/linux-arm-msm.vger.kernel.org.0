Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12CBA611D44
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 00:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbiJ1WM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 18:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiJ1WMe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 18:12:34 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE0424CCB2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 15:12:32 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id ay12so3715132qtb.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 15:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOtM93BCkgr7s+xUUwVdOwzEcENSf4X8lT2/R9kjZp4=;
        b=rvMkeI35GI2z8maVUjQDmM9ZE6+xNsWml0WE37P/XFyu8fPJAElt9Rm7PXBCKby61Z
         HH5GVPk5dHw6Uchn6cfnJUzdYp5nSyHVxi39K2fCvffxX4FRKv9olcGkvNRTwF96Q4xM
         g6nYuIWUjI6p6N0II5sDT/0ztVDzf/iaFXjI4KZWiOohesxFr1PakQ1fmEsT8bMSmNux
         bNg3QJYyOU2TA8wxvR34RcFZXK5zNFrjbgowwjqDYRIFCSC27sdhk/Iu06HXhELw3zNm
         4ir8Nzk5PrtyW7Dcn4aT609sguvs2VuLUmaYAWbXssD5FeDYVY9jLQvk+QFnkOZzlq2Y
         uPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VOtM93BCkgr7s+xUUwVdOwzEcENSf4X8lT2/R9kjZp4=;
        b=kIFX/GS71UFBpdV8/V/eg0PJVqrPdTNXc8Kte/0miRzrLiLpTX46r58cvo7OZ8MRSl
         78wAzxp6KIpD0KNmVlahE6wxJcyY73nhe0KJDoiuKe6jDW8DJfJxHacLshek367Vc2O1
         aENVED1lDcPhdmEgUueGO46XT5UUsf3lW9cJwoIOTRf3386GYqoDDHUZpw65sbXqDV3I
         f0p6hHQUddcOzEFOx9tGdFyL8MbqSmBDZr1CXtOBhLE17hQ8oV7kM7U4bZ0t4XDIeJOM
         FLMpMewScEKVjjcA9btkDQ2+5jMUCd/BOvWOEkN6TQ5odZnUAGPoUEcON+alMYqsEJxI
         pxbw==
X-Gm-Message-State: ACrzQf30Wvt0e3Fps4kNuyOsfMk1R1eVN+vzrGPMcUWh3id1xzxR8zbt
        k9zdTUa7nc+g79sabeRPgIcnvg==
X-Google-Smtp-Source: AMsMyM4CyRwjAQSegdxiPqR8wqQhTjHe3HBTvDa8+pco7gkNqnMADyxYp77z4+GQ9gtXebp8lO+8HA==
X-Received: by 2002:ac8:5988:0:b0:39a:dee7:ba40 with SMTP id e8-20020ac85988000000b0039adee7ba40mr1449611qte.635.1666995151909;
        Fri, 28 Oct 2022 15:12:31 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id v2-20020ac873c2000000b003a50248b89esm2159340qtp.26.2022.10.28.15.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 15:12:31 -0700 (PDT)
Message-ID: <a364b343-fa19-348c-bc38-e8b44061890b@linaro.org>
Date:   Fri, 28 Oct 2022 18:12:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 05/10] dt-bindings: interconnect: Add sm8350, sc8280xp and
 generic OSM L3 compatibles
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221028034155.5580-1-quic_bjorande@quicinc.com>
 <20221028034155.5580-6-quic_bjorande@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028034155.5580-6-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/10/2022 23:41, Bjorn Andersson wrote:
> Add EPSS L3 compatibles for sm8350 and sc8280xp, but while at it also
> introduce generic compatible for both qcom,osm-l3 and qcom,epss-l3.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  .../bindings/interconnect/qcom,osm-l3.yaml    | 22 +++++++++++++------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> index bf538c0c5a81..ae0995341a78 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> @@ -16,13 +16,21 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,sc7180-osm-l3
> -      - qcom,sc7280-epss-l3
> -      - qcom,sc8180x-osm-l3
> -      - qcom,sdm845-osm-l3
> -      - qcom,sm8150-osm-l3
> -      - qcom,sm8250-epss-l3
> +    oneOf:
> +      items:

oneOf expects a list, so this should be "    - items"

> +        - enum:
> +            - qcom,sc7180-osm-l3
> +            - qcom,sc8180x-osm-l3
> +            - qcom,sdm845-osm-l3
> +            - qcom,sm8150-osm-l3
> +        - const: qcom,osm-l3

The concept is good, but are you sure all SoCs will be compatible with
generic osm-l3? Why not using dedicated compatible of one soc, e.g. the
oldest here? We already did like that for BWMON, DMA and few others.

> +      items:
> +        - enum:
> +            - qcom,sc7280-epss-l3
> +            - qcom,sc8280xp-epss-l3
> +            - qcom,sm8250-epss-l3
> +            - qcom,sm8350-epss-l3
> +        - const: qcom,epss-l3
>  
>    reg:
>      maxItems: 1

Best regards,
Krzysztof

