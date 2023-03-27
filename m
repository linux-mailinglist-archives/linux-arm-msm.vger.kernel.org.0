Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5842F6CAFFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 22:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjC0U2p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 16:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjC0U2p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 16:28:45 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E694A1FD6
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 13:28:43 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so2816297wmq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 13:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679948922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6XyQGB5YTPzqeEncabjYPJXPQhCRKXMrHKIK18rowh8=;
        b=PwM5zTNc6t6e5pXudxvs7t7xKDNPvfG/rURST6WDCtP3mcyybZ102fqTIrXQWHn3jt
         GsqqgakjXsx6fToQ7fE5yhK8hav6uhemLk84xH2jD+DTzp9sloDFzZBlXg7ybcLlw4Ti
         0QmtudtFSsJrYaDAjmKNGWv0sOiWvUXKj90KJOJ9EV69agikfMqOdIAHfjizAYhxO/gt
         AQD7UqtKQvA0biIWVbHKWeSEV4VH51/j48VV72LBzIMPWu6tPoH3dRJrIofEWO7Tz06L
         4NrOTJdN8+hf9xupW3aD0Q5CIhblZVuLaT0WE7GXlHH5Y26V+Ez9sFkjz99tenE/uRvX
         Xnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679948922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XyQGB5YTPzqeEncabjYPJXPQhCRKXMrHKIK18rowh8=;
        b=dhzvVTXu/41/UtNYAhFilMveXjMhUVY3mQ9dL2CUn2T67zro8BSD8PUpjmxPJ4LIZl
         zW/17r8oqHDXIR5KWSdBWmp+uti23F9h72Apbsh7JCZHXEWf3srf+mqRTCZw+0oLgjLl
         31nVyOJNpkxqqTL5ZwdGyA7DscV3kBXXJn46zFx9ll8w28xSKaEoGXwZcRepscscxQet
         kuTXcENuqh6ziT7LHihwJte+EPBYb7YB+j5LbCbrFSLfmmIxhykvL6sssoAq3yveQnjB
         loElrnygGoLOJbS79MvoGhfBTsCCzS4euyY7H2tzWGTt8qf2OVg8NR23kp8M4PjL4vdm
         +94A==
X-Gm-Message-State: AO0yUKUHqv5lkNa8qomlS5Ptbh2r4sRVbWFh6XJjwSdmxjs/6Au4V0pe
        mBaRhqHLn684in40CmHHlTkwMIxJ3Glp7eipbTwvEg==
X-Google-Smtp-Source: AK7set++o4/dXRKys9UorCef67oaPvg27xdjunH5dcKwpPvKZximdpQ8YdNUTuh/cGVbtlOL+fONXrkijAqK3Syb7Fs=
X-Received: by 2002:a7b:ce8f:0:b0:3ed:c669:8a13 with SMTP id
 q15-20020a7bce8f000000b003edc6698a13mr2804145wmj.8.1679948922332; Mon, 27 Mar
 2023 13:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230314051351.1754321-1-bhupesh.sharma@linaro.org>
In-Reply-To: <20230314051351.1754321-1-bhupesh.sharma@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 28 Mar 2023 01:58:31 +0530
Message-ID: <CAH=2Ntzsppo6QmX27tRszHTf5LTwgL0goTqg06-PtpW4jEHbbQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: watchdog: Document Qualcomm SM6115 watchdog
To:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, agross@kernel.org, andersson@kernel.org,
        saiprakash.ranjan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Mar 2023 at 10:44, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> Add devicetree binding for watchdog present on Qualcomm
> SM6115 SoC.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
> Changes since v1:
> ~ v1 can be seen here - https://lore.kernel.org/linux-arm-msm/20230119122619.1020908-1-bhupesh.sharma@linaro.org/
> ~ v2 collects Ack from Krzysztof and also fixes the subject as per his
>   v1 review comments.
>
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 6448b633c970..4ba61e1831ec 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -28,6 +28,7 @@ properties:
>                - qcom,apss-wdt-sdm845
>                - qcom,apss-wdt-sdx55
>                - qcom,apss-wdt-sdx65
> +              - qcom,apss-wdt-sm6115
>                - qcom,apss-wdt-sm6350
>                - qcom,apss-wdt-sm8150
>                - qcom,apss-wdt-sm8250
> --
> 2.38.1

Gentle ping. Any updates on this patch?

Thanks,
Bhupesh
