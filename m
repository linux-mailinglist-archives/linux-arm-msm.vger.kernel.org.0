Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54ED2621E6C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 22:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbiKHVTG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 16:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiKHVTF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 16:19:05 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355EB20F79
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 13:19:04 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id a29so4397540lfj.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 13:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQwnQ8NpeZLBscTReFAMRDKeg2Xy01IPGHxR2PrdCJ4=;
        b=cDZLmpYpNykeQrDiVpl7jLFkkAs/jZ7zoz++cIuULXDYdFSdwIxi6fvbbAtGV3lOpd
         oZr7Dowmld23p7bFh7305P2HIpNjS1BTD7aSdKLxpkCvcDpk0pXdAc9H4Qw080gMqGF5
         foRleQBNm1v4nRLjNDKOc6t7nsYA1G79wGB6jDd4kDZuyJsEZgpkySZqqI1pSPr8gZ5P
         xQ/8yRBWQeAxQv37q/oqFPIelptanZ1JTMV8JjbLoc115EiG+HG3gKdP2Lzia6HJjpWT
         f3Ny+csQv69RETicalIN1FdiLjhRTYb62veB32EdcJ+daNqCCjm5A2iCMPu14WuzI3bL
         r40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQwnQ8NpeZLBscTReFAMRDKeg2Xy01IPGHxR2PrdCJ4=;
        b=vHerQ4EJLk/7mmO7rmNNGOldbkPQ/4UHga0AoNWIPkUN6aXU3fIKSQnb+Vd/dmBypo
         vFbLwjntu2TQFuBdjXI/ZPJUZaUSGZLfj537yPUxTS3Bm/CbQySX2PaFm08NvHtyQY2C
         2goNYw9hHx10bdzE5PZq1THx36xv8L2P6pgYLFw1n0Knfs6JRBeBo6hC4+1bv/yKBprb
         o2FPJ7D1l+QbarYQ0n4kaJt0ba7CXR99DTK0Yr/5W8Tm+9aRqyXOC1YnD7pOCw/NqOIY
         VdHOCXkSUmxuhOxT9F02rNousjrKNT4aRqQE+pSXAdax5VKMSW5jmQziR2ZYQ47VbWHb
         9HXw==
X-Gm-Message-State: ACrzQf0P6w+JJ1Xjmmxu3DnrW4k0gpe+u0hOU/kgrya3cEBGaa07EMVS
        P+xGlCzDzIJuBFZzdWrHyTXSnaTMDH2DYA==
X-Google-Smtp-Source: AMsMyM59w6eBjCcc3dLBExDPqenzbDr7VjN9Nr2l4I282/K7+tZRnMD+ekzNxBH+Q/TzBw9vDT5+8g==
X-Received: by 2002:a05:6512:3d19:b0:4a2:a949:7cfd with SMTP id d25-20020a0565123d1900b004a2a9497cfdmr18986607lfv.282.1667942342571;
        Tue, 08 Nov 2022 13:19:02 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id d9-20020a05651233c900b0049fb08e91cesm1927678lfg.214.2022.11.08.13.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 13:19:01 -0800 (PST)
Message-ID: <a62f5550-08fa-8669-6fd1-9aba23d974c7@linaro.org>
Date:   Tue, 8 Nov 2022 22:19:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 08/18] dt-bindings: msm: dsi-controller-main: Document
 clocks on a per compatible basis
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-9-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107235654.1769462-9-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/11/2022 00:56, Bryan O'Donoghue wrote:
> Each compatible has a different set of clocks which are associated with it.
> Add in the list of clocks for each compatible.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml      | 177 +++++++++++++++---
>  1 file changed, 150 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 9db3e63acda3d..c975df0ca22fc 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -9,24 +9,22 @@ title: Qualcomm Display DSI controller
>  maintainers:
>    - Krishna Manikandan <quic_mkrishn@quicinc.com>
>  
> -allOf:
> -  - $ref: "../dsi-controller.yaml#"
> -
>  properties:
>    compatible:
> -    enum:
> -      - qcom,dsi-ctrl-6g-qcm2290
> -      - qcom,mdss-dsi-ctrl
> -      - qcom,mdss-dsi-ctrl-apq8064
> -      - qcom,mdss-dsi-ctrl-msm8916
> -      - qcom,mdss-dsi-ctrl-msm8974
> -      - qcom,mdss-dsi-ctrl-msm8996
> -      - qcom,mdss-dsi-ctrl-sc7180
> -      - qcom,mdss-dsi-ctrl-sc7280
> -      - qcom,mdss-dsi-ctrl-sdm630
> -      - qcom,mdss-dsi-ctrl-sdm660
> -      - qcom,mdss-dsi-ctrl-sdm845
> -      - qcom,mdss-dsi-ctrl-sm8250
> +    items:
> +      - enum:
> +          - qcom,dsi-ctrl-6g-qcm2290
> +          - qcom,mdss-dsi-ctrl-apq8064
> +          - qcom,mdss-dsi-ctrl-msm8916
> +          - qcom,mdss-dsi-ctrl-msm8974
> +          - qcom,mdss-dsi-ctrl-msm8996
> +          - qcom,mdss-dsi-ctrl-sc7180
> +          - qcom,mdss-dsi-ctrl-sc7280
> +          - qcom,mdss-dsi-ctrl-sdm630
> +          - qcom,mdss-dsi-ctrl-sdm660
> +          - qcom,mdss-dsi-ctrl-sdm845
> +          - qcom,mdss-dsi-ctrl-sm8250
> +      - const: qcom,mdss-dsi-ctrl

This is not explained in commit msg and looks like part of previous commit.


Best regards,
Krzysztof

