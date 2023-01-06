Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66B59660394
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 16:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjAFPmF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 10:42:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbjAFPmE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 10:42:04 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E343D5FA
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 07:42:03 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id r2so1603705wrv.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 07:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mua+I7i7capVR8PnOjxe25hKYpxTPGJab57EbFL/wtk=;
        b=nuU1GJg5j8lcEuJkVBVka/IRJWkF24X6QfVZW1pgliLAMTwX1bT0UJz26KULCmVVAQ
         YpDPc+90JKHY0E1X5KzKPSgk7YpwMLS0nyIN9VtbzeaJLLHhDIHRNf58jBrqDcWFge4A
         EENDykKYAyt22wzTATSu5lA5SNQr7KdUmfvLPgF4XJtqu3lllhCQDV0fn83bjoi8+fBX
         Xd5dZUxuUzP0HiCNOm1/k/spLWO09mT5MPFMD/kseybmqKaxOHf0SCpKMK8mXi3IJUYB
         6gN9rfbMVLUt20E2MFYsgAwQBk+vQx3QKZ1sQ4J0gBVZnPG/jx9h1wH2NbBK8pl8+8jM
         gfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mua+I7i7capVR8PnOjxe25hKYpxTPGJab57EbFL/wtk=;
        b=rLSdJLObhy8sO6dvLuYv3zXAiCDIEzE4I/wTZOLFAfoFD4tt7Qb4A1P8mgZHi3pjP1
         RgPklLsCwP8hntsa2GeyW0gxW6MqsEzv+me7XHREM5UppPCBIJrJw67Z0HoqiIZ3uyfj
         50ycvaa2VImWltpNjQTY2nDHx+S+K8wi7ppl5D1KAhWFShF1j/B5T+nYSl80lRv3xA1O
         M1VU6cMT99lnoLamaDxDyEkk+TzjHvBDPMVkKHzRnntJ3vrDbd5iCPKlqloe9mmgVUPG
         /PCGMvvxwZwQRG6VtY4+GkoXRM1lWoKPzhU6XMJ1CryJhL2wQRnT3iPN9Cl5qR1NaNhb
         SuYw==
X-Gm-Message-State: AFqh2krN48uSgOO1e2dNO8z04sgxmLm9wmBUO+I0JETaUXLA4loJJ8WX
        l3ah1VI5kdbCWZ+GMN3OazlpuQ==
X-Google-Smtp-Source: AMrXdXthHSBcdfCq/c1/NtHLooTO6GDoaKX0aolAquOz2BrXGfeRChcgS3iWnJZZScDBw4WDusRAzA==
X-Received: by 2002:adf:fa0f:0:b0:28f:b480:f4 with SMTP id m15-20020adffa0f000000b0028fb48000f4mr18079341wrr.12.1673019722207;
        Fri, 06 Jan 2023 07:42:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z9-20020a5d44c9000000b0023c8026841csm1449300wrr.23.2023.01.06.07.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 07:42:01 -0800 (PST)
Message-ID: <f8c8076e-2ac3-f67b-7641-d0c324784cb5@linaro.org>
Date:   Fri, 6 Jan 2023 16:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/6] dt-bindings: display/msm: document the SM8550 DSI PHY
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v1-1-9ccd7e652fcd@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v1-1-9ccd7e652fcd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/01/2023 10:08, Neil Armstrong wrote:
> Document the SM8550 DSI PHY which is very close from the 7nm
> and 5nm DSI PHYs found in earlier platforms.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> index bffd161fedfd..f72727f81076 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -15,6 +15,7 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - qcom,dsi-phy-4nm-8550
>        - qcom,dsi-phy-5nm-8350
>        - qcom,dsi-phy-5nm-8450

Poor patterns once allowed like to keep growing... I commented here:
https://lore.kernel.org/all/ccbb47e4-d780-0b1d-814e-27e86b6c369c@linaro.org/

so let's wait for response about other compatibles.

>        - qcom,dsi-phy-7nm
> 

Best regards,
Krzysztof

