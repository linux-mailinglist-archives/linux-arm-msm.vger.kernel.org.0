Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B12316396A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Nov 2022 15:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiKZOqd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Nov 2022 09:46:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiKZOqc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Nov 2022 09:46:32 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135D213CCF
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 06:46:31 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id z24so8201301ljn.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 06:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6cZq8OT8F2u1G+4KG5gAMpwVp5A0HMoWu/Eqh8dw+/I=;
        b=O/f4KfYlk4WCT/fyRp+lpMRV2476Va8uYDvN74Dii3D2KJinIBhs0Gw9QTEW898DI+
         OBNZr3b9HiW8hk/34tqUR0bdke9WGmA8/cnQ6HL+XoOkT/N6VKwA+GX17LCzNjZzTsUS
         cp7zcm1rguf4JKlilXLNBPA8UYruJpz2BdenOFaTqps8YIQQ6f/TR2tSiUJSiQSwEWq0
         7mTTMtYIuraGbbGGWDXOWz3j1Uz/8hRHW8jfRvCBABRDT9MmaHH/umQENZciqdJP2uF+
         EVpH0/z1W2RdNudceST+0Lok3UaGNMgZkxNzuzS+Y8vDesoXbUjBRNOKN4eKX6dbrHrD
         r54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6cZq8OT8F2u1G+4KG5gAMpwVp5A0HMoWu/Eqh8dw+/I=;
        b=TfpMDUj6jQnRFiXoBcAH8DJ14FBup1fvVSk6KFHesrNF7FSxiVqrxL68nYwrmj7nNm
         hQVT24mkz/IEfwmpWgLESiSHAIia9tEl5fC4LHDRGzl9EG++EGOgmzTLYCkJuNDiN+tV
         NAuLc0/nSQf43yz35YJaDSfRAVrNcjs4LeuJl1aYx52MfGBqzDl+4z2b5eiNPOdrUaSP
         Z0QSQseui0+hOv8Wzi5eL8XSG8QAVKxS4Q9ZAGQm095GrCM3WVHqqKJ9iDiF4kGUSdxw
         PNhStcq0pmnKLxA74oWnicQEIXDmiOH1K6lfx67RoFjAtTH134ANYlLpCVeXGQgZUVoQ
         bDWg==
X-Gm-Message-State: ANoB5pmdZ4mBoBCg3Wwj7pLYxtbM2lwAcNg2I6bTRvZbSpAX5Bx3Jwy8
        esEufQkLkKXKncH5afgjd8DBGw==
X-Google-Smtp-Source: AA0mqf7l3fakUd44VH4Y1atC95rlxJUi7tt32oesGR4CbTxFRdKiko9XXZCSiCq5OA1bGwKmQYKjyA==
X-Received: by 2002:a2e:3a1a:0:b0:278:f073:d3c0 with SMTP id h26-20020a2e3a1a000000b00278f073d3c0mr15168000lja.357.1669473989436;
        Sat, 26 Nov 2022 06:46:29 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b12-20020a05651c032c00b0027741daec09sm643691ljp.107.2022.11.26.06.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 06:46:29 -0800 (PST)
Message-ID: <b3a9f5e2-56ca-b112-e0f5-563404dcb05e@linaro.org>
Date:   Sat, 26 Nov 2022 15:46:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 08/18] dt-bindings: msm: dsi-controller-main: Add vdd*
 descriptions back in
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
 <20221124004801.361232-9-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124004801.361232-9-bryan.odonoghue@linaro.org>
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

On 24/11/2022 01:47, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml we didn't include descriptions for the
> existing regulator supplies.
> 
> - vdd
> - vdda
> - vddio
> 
> Add those descriptions into the yaml now as they were prior to the
> conversion. In the .txt description we marked these regulators as required,
> however, that requirement appears to have been in error.
> 
> Taking the example of sc7180-trogdor-wormdingler.dtsi. The avdd and avee
> come from GPIO controlled external regulators, not the SoC and in this case
> there's no need for vddio to power an I/O bus. Similarly the regulators for
> the LCD are controlled by the panel driver not by the dsi-ctrl driver.
> 
> It would be possible to connect a different type of panel to the DSI bus
> here in which case we may or may not want to make use of vdd, vdda or
> vddio.
> 
> This is also the case for older chipsets like apq8064, msm8916 etc the vdd*
> regulators in the dsi-ctrl block are helpers not dependencies.
> 
> Add the description of vdd, vdda and vddio back in for the existing
> upstream dts where vdd, vdda or vddio are already declared but, don't
> declare those regulators required - they are not SoC requirements.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 0fbb0c04f4b06..bcbcbdca1a78a 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -133,6 +133,18 @@ properties:
>        - port@0
>        - port@1
>  
> +  vdd-supply:
> +    description:
> +      vdd regulator device node

I see my comment was not really implemented. I asked:
1. vdd->VDD
2. Drop "device node". It's not a device node. It's a VDD regulator.


Best regards,
Krzysztof

