Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7840A70B85E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 11:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbjEVJDZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 05:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232698AbjEVJDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 05:03:03 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37432137
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 02:02:58 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2553663f71eso1196263a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684746177; x=1687338177;
        h=content-transfer-encoding:in-reply-to:references:subject:to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzleLO7MSIVONgXOoe/u8Y3w3EspUsfYYjCprTB4k/g=;
        b=l/RP/dtBIq81CyGgnIfU19Pv7C8KScdcSHZBdG2deAKCuuDWIENO/nF+eYpwZwZTe+
         Nuf6JvkaYmhJYmuavURM0fUPaXaiYqN9BDhz4ph/0w4wKnPdfgnQLTRykIZxxainkFJ8
         CCPs/PdcKjUP/QfPqVCNI2taUHVtdmQZbRm2soKIJ+VObSCOsfXR9uAgY/ZSK5zJriyq
         rZmYw9n1DwmRNm91bk4A3hi02FiwbmFLf6aePT0hgOcyDOS0de8pMe+vNdIGa5IZS0+3
         amv+/V14ue8wVdj/IoyIbCDq4+VSh8UxN+XPvyhG4BGLer1lxxvNMT7YbN6+m/ymb9a6
         Uwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684746177; x=1687338177;
        h=content-transfer-encoding:in-reply-to:references:subject:to:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fzleLO7MSIVONgXOoe/u8Y3w3EspUsfYYjCprTB4k/g=;
        b=cGzR3sGH/Nwh5xrtHKxg77bw14JxyBST8mDiSfdmk7dTXo0TqaXdjVNO/L8tsq4nF+
         b1vZGQQrvPU1uRJszFZ1LOVUDQ/BZIvRoTHKKfqeHh5SWUVhcLhIDUCQCa4YGX0idRfI
         cig5YauCKm0H6dhkKYBz/QakLnfIhQLXLrU+zSm48OnnJqnnVYxUncgtFD9cPS/p289j
         KyOi9TqdUFCxscckaw8O0ocQk4R6IPbAI65Lzjjsgysb1qZ8OMw9mhVyVLPts9qpYM8G
         uwiGscEzy+B/SqiB2smKFIEt1Mk1Qsq3w6mE48QmR7JN8hozORiozJIcGAhJI0t+GgPz
         4yvA==
X-Gm-Message-State: AC+VfDwFV/jwzfWjLFChpTcmVd5alA9g307t9gT5x5Kg7NvSpPDiDiw1
        qo5BstH3Ntscnkue7NmKk9bfLg==
X-Google-Smtp-Source: ACHHUZ5hmzgd3uQouu5IJy5vUgDsLRB/aYSGM8TclXQmiUfNzep8YlZ/mhBBIoAQR5KM0bwbVrU+ng==
X-Received: by 2002:a17:902:c407:b0:1ac:451d:34b with SMTP id k7-20020a170902c40700b001ac451d034bmr14623045plk.9.1684746177237;
        Mon, 22 May 2023 02:02:57 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c60:d309:883d:817e:8e91:be39? ([2401:4900:1c60:d309:883d:817e:8e91:be39])
        by smtp.gmail.com with ESMTPSA id y19-20020a170902ed5300b001a9873495f2sm4310279plb.233.2023.05.22.02.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 02:02:56 -0700 (PDT)
Message-ID: <535de61e-b6bd-b15b-87e7-f36ea1a37a86@linaro.org>
Date:   Mon, 22 May 2023 14:32:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From:   bhupesh.sharma@linaro.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,qmp-usb: fix bindings error
References: <20230521195200.11967-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230521195200.11967-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/22/23 1:22 AM, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> Merge two allOf clauses, which sneaked in in two different patches.
> 
> /home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml:109:1: found duplicate key "allOf" with value "[]" (original value: "[]")
> /home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml:109:1: [error] duplication of key "allOf" in mapping (key-duplicates)
> /home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml:109:1: found duplicate key "allOf" with value "[]" (original value: "[]")
> /home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml: ignoring, error parsing file
> 
> Fixes: 2daece5eb51e ("dt-bindings: phy: qcom,qmp-usb: Drop legacy bindings and move to newer one (SM6115 & QCM2290)")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 28 ++++---------------
>   1 file changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> index 2c3e2ede6671..f99fbbcd68fb 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> @@ -84,29 +84,6 @@ allOf:
>               - const: cfg_ahb
>               - const: pipe
>   
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sa8775p-qmp-usb3-uni-phy
> -              - qcom,sc8280xp-qmp-usb3-uni-phy
> -    then:
> -      properties:
> -        clocks:
> -          maxItems: 4
> -        clock-names:
> -          items:
> -            - const: aux
> -            - const: ref
> -            - const: com_aux
> -            - const: pipe
> -      required:
> -        - power-domains
> -
> -additionalProperties: false
> -
> -allOf:
>     - if:
>         properties:
>           compatible:
> @@ -130,6 +107,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,sa8775p-qmp-usb3-uni-phy
>                 - qcom,sc8280xp-qmp-usb3-uni-phy
>       then:
>         properties:
> @@ -141,6 +119,10 @@ allOf:
>               - const: ref
>               - const: com_aux
>               - const: pipe
> +      required:
> +        - power-domains
> +
> +additionalProperties: false
>   
>   examples:
>     - |

Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Thanks.
