Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7DCC66DFFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 15:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbjAQOJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 09:09:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjAQOJV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 09:09:21 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D1C3BDBB
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 06:09:16 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id v10so44007338edi.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 06:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8lRKNEyZBQ0MEz5uWRwQDY0cEHSnPNZLloQPoR0gCIA=;
        b=Ocn4aUWP4m1u7SHcpx51JCkpswLgA9s1SPQ+8kNx8RMzL5jQL8ym9RHgpIqoauuWr3
         CumVoCg6SU99qDrSXSCy0+6uGv1Xmq4C+xvNC+NuHoGKjHMmGjC1gB65fRZXelVlJ/DU
         OEvy3SokQBpnk/vNiwM4r6j9hMLLBwCjSYUjmnuCEWaCgeGmgR1PROeq5neCTNBwJcsQ
         bfxIYrAM8xZVQi9ffgEEDGLzx96VXF4L0qULKwE0TZQm43c4wBXeMwn3Q6ObUbFh2AhG
         Z8Zp6A5Am/98qXzJM3Amna0xRaIk1oPXPcN/XnqkLR8dXoPnt5WyQPx9/0vI8xyXe8Tm
         20IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8lRKNEyZBQ0MEz5uWRwQDY0cEHSnPNZLloQPoR0gCIA=;
        b=FarW0zZCAnGIJI6oL3l7Y/Hcat0/bbTIlrQx78vgsFos152JpLYd4ZbfD/AigB+70i
         I7xBpqLefl+CSvgPuC2YFhgPm83998ZmPpEuhJ+BRNbxuYubsUCJHvp1EKNsDREayubT
         LHn4ip9+KNEQKqGCtF5t93uRClqmkMr7p+KuIzSWD+464bmWRM7E5d0/qdEpB+5swSqI
         IWXeuECHxhjG1nZEGOMJxCwPMlESfbNaFAVbhwCBEdMVCsFfLhPAnw8Dz01MgUIsBjyp
         IWSvJWpfsK/QuRK5e7B23uD7w+21jQQs1EIi3aUWFjPZXX0Nmm8ggfO9qeGUat+oRqkX
         tg/g==
X-Gm-Message-State: AFqh2koWMyEvvc8/Z7yJzKO6oPytLl3smzAXWDuFrJ7xqWewWVMYtNiW
        ZpVKfmiiA+amRk6kDbfYyjS+Vw==
X-Google-Smtp-Source: AMrXdXvxKfX7GGtuIFRDSzek0Q3sa3LydURkvRpFoLSK2KCXpzVuXwChigb90MTDqNsP6enNLybzKg==
X-Received: by 2002:aa7:d310:0:b0:499:e564:a1c with SMTP id p16-20020aa7d310000000b00499e5640a1cmr2544846edq.11.1673964554809;
        Tue, 17 Jan 2023 06:09:14 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id el14-20020a056402360e00b00458b41d9460sm12376641edb.92.2023.01.17.06.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 06:09:14 -0800 (PST)
Message-ID: <33eda50c-c70f-1bb6-0917-22b6fdb4a2ca@linaro.org>
Date:   Tue, 17 Jan 2023 16:09:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/6] dt-bindings: phy: Add QMP UFS PHY comptible for
 SM8550
Content-Language: en-GB
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230117125555.163087-1-abel.vesa@linaro.org>
 <20230117125555.163087-2-abel.vesa@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230117125555.163087-2-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/01/2023 14:55, Abel Vesa wrote:
> Document the QMP UFS PHY compatible for SM8550.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> index 760791de0869..44745a5c64cd 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -17,6 +17,7 @@ properties:
>     compatible:
>       enum:
>         - qcom,sc8280xp-qmp-ufs-phy
> +      - qcom,sm8550-qmp-ufs-phy
>         - qcom,sm6125-qmp-ufs-phy

Please keep the list sorted

>   
>     reg:

-- 
With best wishes
Dmitry

