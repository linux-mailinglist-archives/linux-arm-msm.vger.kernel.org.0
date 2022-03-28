Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08E8C4E9BAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Mar 2022 17:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240128AbiC1Pxr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Mar 2022 11:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236370AbiC1Pxr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Mar 2022 11:53:47 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB1F228
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 08:52:06 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id q20so8673060wmq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 08:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GwP5ugk0tQduHftN8yL0lI1uYPDme19MV0QPD5H1y78=;
        b=arWhFvK2N7y5+CW4x51ZmDby82Ql23kNGRMi9uYrw1Cn13SAVJ07VNWWsyMqWmigJS
         p+I5GLteb7CmWLTs1zVORSuj0Sk/wcBrmkq/lO9aLiHtOMtrir04BDA9K918CKOhfWXq
         bzocvFVuU3o8hK+duUP7iMV4gdg7vjJ3b3xWLsIXAynNnn/L6+vuBU0Jdv12OZivb1u4
         5CCEytWu7yHvK52J/SUILF4y8456JdSsFQggVYsoajxFR+PW/AulYRv0YPJdnMx3g3Va
         ThzbvYWkBn0Jpv+DHFhQ515GNWJTMZvg0bj8LX6ji0IZUSEcD/cnszu3Ceku5BTNOYRm
         T6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GwP5ugk0tQduHftN8yL0lI1uYPDme19MV0QPD5H1y78=;
        b=cyGqD/ObuKeBBwRCACQk2Ve76yZj6jwR+8ggfbaAwgn2A3vpMgLpp+eVUFnJu3gxg8
         ISvVaI18JYn7TYAy//KMTb+d2gQ62j4Q7xCW+GyQrB9U6S9FhCLIU7Og9T/vm5ztHDuj
         JBWYEJCpeHrquzp2f+j7U0wXuuHlAvwB0MMweXBr1YmrVPcWiS+0eB4Worbo6qQLVQMq
         FtEhvA2cX+kZl39oJQ4cicR5fQC6PILS45jX+rfkTNTXdwnE2Wqu/zbBp/6hxUMzQGYu
         US5Ai2IV8S5z1wi6WHGs8gMMz+lKS3Z9DauvaRPxUimAeDlQLnax7rFDsKwL9VDuQiKe
         lc4A==
X-Gm-Message-State: AOAM531OuVRlVB+DBe5d+mm9F6K075YYSeu5MiID64yVHJsaSnrQljaf
        3DajFJjgNDDJlJ/L6q8MkuGmmQ==
X-Google-Smtp-Source: ABdhPJyyUqsamosO4tTuybJr4KEp61RxvQgbNiyY0IkIVr55UV/cpGdkMnRiwYF0QSghJUBEDuttAA==
X-Received: by 2002:a05:600c:3546:b0:38c:a8ff:843b with SMTP id i6-20020a05600c354600b0038ca8ff843bmr27702630wmq.24.1648482724879;
        Mon, 28 Mar 2022 08:52:04 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id m3-20020a5d6243000000b001e33760776fsm12628577wrv.10.2022.03.28.08.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 08:52:04 -0700 (PDT)
Message-ID: <a43825b5-b7c7-e805-c9dc-0498d752d4f2@linaro.org>
Date:   Mon, 28 Mar 2022 17:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: display: msm: dsi: remove address/size cells
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>
References: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/03/2022 17:29, Krzysztof Kozlowski wrote:
> The DSI node is not a bus and the children do not have unit addresses.

Eh, actually MIPI DSI is a serial bus, so address/size cells seem right
and my patch is not correct.

> 
> Reported-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml          | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 7095ec3c890d..57f238f72326 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -51,10 +51,6 @@ properties:
>    phy-names:
>      const: dsi
>  
> -  "#address-cells": true
> -
> -  "#size-cells": true
> -
>    syscon-sfpb:
>      description: A phandle to mmss_sfpb syscon node (only for DSIv2).
>      $ref: "/schemas/types.yaml#/definitions/phandle"
> @@ -154,9 +150,6 @@ examples:
>             reg = <0x0ae94000 0x400>;
>             reg-names = "dsi_ctrl";
>  
> -           #address-cells = <1>;
> -           #size-cells = <0>;
> -
>             interrupt-parent = <&mdss>;
>             interrupts = <4>;
>  


Best regards,
Krzysztof
