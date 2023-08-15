Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4A177D440
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Aug 2023 22:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238195AbjHOUhr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Aug 2023 16:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238366AbjHOUhT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Aug 2023 16:37:19 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D9F213E
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 13:36:45 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99c93638322so1205599966b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 13:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692131802; x=1692736602;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X6Sjc5kCdevNBIooFIAdaXcgvp9MHaLBrm4GmR4a5kI=;
        b=fAj5Uun6fMmg8JwRtrO+awU+LcEYYn3b1AiRgb2/esrYZBkNM8tV10/hR44o06tYxe
         x6tW13BtvxlFQHUYSqCIZV5Ry835ARs2CNw903bBXAvZ+OehESNUGsUEsnaUYN1sTHdq
         shby10LOk+9SulpTwmNO7xf04GJoS2R8Ey3J9g6DxAo6+MKv19y5GR/Dmo7R97yAG+mL
         F5k2GyoQ+ROmnqMzBPGvHOv7I5DwPEr+mJOC2jM2/HNe2rq9pxwgYcUGWrCIAJMvNhAe
         dJ5rKDHjV9bKla4CBC1ge739eOZnuCIEhDBfWTLKGMk5tOMBE2eYhAYPy7bzn2RJ5Siw
         +gfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692131802; x=1692736602;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6Sjc5kCdevNBIooFIAdaXcgvp9MHaLBrm4GmR4a5kI=;
        b=JrMHIbeZWltz8BhK4at9NBVUrE7qo1e8qkIWAyiAAyYlmpH8Bx7M5i8ezuK5F2bOVK
         P8ufqu5Fi6n5c4dQLJuagD7RR5X4KvK/hv3Plb2gyqAknoabp2a52zMx+c+z/2pUBNG1
         Hbyj8Vz/HgdFLP5erKmVU8VR+hWcRCBEwl3gh9TE7q1luXC5GPJspnR+ao3FW3TRU2Uv
         +PtPEzuiOxJ3QMcHVttJ1fOH0rlqgjryY2KNLRdZ6+XSmTPpF1ErsJRPEEoGnzAq4L2T
         gOHk/pBF8wEGC78cW1Sd5xz+NLrZ9jkF71d1zv5MZrpzfyxjAt7IZc9ifRZ8DGVC011C
         /Ivg==
X-Gm-Message-State: AOJu0YyeUP2ihqXgtYlEeqZbVmoH1Ya6VsMlNE8/v8w8aGorivMB37kG
        zyxfaNAcQKXcWb/yeCm6pbmX2Q==
X-Google-Smtp-Source: AGHT+IH4wM7nrkfOFTqG/v7+FSAdJxm80o8iaJuv9GJHnk6yEmOMGbDxs3H4ETByecHIE/WMvpi9VA==
X-Received: by 2002:a17:906:6a04:b0:99b:dd23:4f01 with SMTP id qw4-20020a1709066a0400b0099bdd234f01mr3314224ejc.33.1692131802432;
        Tue, 15 Aug 2023 13:36:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id f8-20020a17090624c800b009894b476310sm7407880ejb.163.2023.08.15.13.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 13:36:42 -0700 (PDT)
Message-ID: <102328fa-5699-4731-d639-079bce8863a5@linaro.org>
Date:   Tue, 15 Aug 2023 22:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/7] dt-bindings: soc: qcom: Add qcom,pbs bindings
Content-Language: en-US
To:     Anjelique Melendez <quic_amelende@quicinc.com>, pavel@ucw.cz,
        lee@kernel.org, thierry.reding@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org
Cc:     luca.weiss@fairphone.com, konrad.dybcio@linaro.org,
        u.kleine-koenig@pengutronix.de, quic_subbaram@quicinc.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org
References: <20230814235918.10396-1-quic_amelende@quicinc.com>
 <20230814235918.10396-2-quic_amelende@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230814235918.10396-2-quic_amelende@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/08/2023 01:59, Anjelique Melendez wrote:
> Add binding for the Qualcomm Programmable Boot Sequencer device.
> 
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> ---
>  .../bindings/soc/qcom/qcom,pbs.yaml           | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,pbs.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pbs.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pbs.yaml
> new file mode 100644
> index 000000000000..b502ca72266a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pbs.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,pbs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Programmable Boot Sequencer
> +
> +maintainers:
> +  - Anjelique Melendez <quic_amelende@quicinc.com>
> +
> +description: |
> +  The Qualcomm Technologies, Inc. Programmable Boot Sequencer (PBS)
> +  supports triggering power up and power down sequences for clients
> +  upon request.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,pmi632-pbs
> +      - const: qcom,pbs
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    pmic@0 {

This should be rather just "pmic", because the examples have
address-cells=1 and size-cells=1, which is not correct in this context.

Anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

