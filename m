Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC04640B4D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 17:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234099AbiLBQyd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 11:54:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234110AbiLBQyb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 11:54:31 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D87D0395
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 08:54:30 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id v8so7275450edi.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 08:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uIKXhJcggKv0qzzE1oIAIbI76VCnkiza8PERAP1DEig=;
        b=LrDvw4KRmNmUhhGkHd0X1Nv2p2WExtdFQ0G8r3vqma67gcmo4ApCEjVokzPIaD4gml
         UVSHIMbdQYarWkKTdjmPVZ8KYZNy/59LgEvtKiELvUmD13eN1uNGUuVwORM29K6JBvyv
         5TxKWph+Hro7zw5Vowz15PiW9KRqNrK4ciIwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIKXhJcggKv0qzzE1oIAIbI76VCnkiza8PERAP1DEig=;
        b=1/HyHxa0/UewQrAR2cogSIU6WgzUCT8yoG6MhlcJ1mIw18kZjjY1Cbtf1TNbGJEH4m
         aWNwBzAxjMvzcDURlvX+ulmh5N3yCTAA0rq7wXnZ5Qscx3xav02uHB9inHi4Zx4sqcCt
         p2FyVt9iEysmJWAEwbeHZdV8zl7Ilsc/taCC30yRYMDMpChMlqFpb4u51rylQI3UunJD
         zXUUjRLlEcyld3FkGpRfAg269mGU3QRUVtYXqUVAg3dVjPXysyoe/1YsOjZyPLKJo0dw
         hxqmDQYvL/f7AMOvtSZszpMTcyWPRRR3yCpsZk82TfvWLv4oczKdu7pkKmlaxZPU9dpD
         MhlA==
X-Gm-Message-State: ANoB5pnktS0InBEqLw8EaqL85wTs76AlJsKHOfBPnkbq3OS5JBDF8ucs
        tew/TjVvvpv0rBXL3LjtaEZoL7GlTJQ1+etenN0=
X-Google-Smtp-Source: AA0mqf4/GjybXfo+/+FROKogoaXDFjBe0gudOSUgRAuOxy3IEZgP2sBseJqxaQMkSozrqQl3vjJbfQ==
X-Received: by 2002:a05:6402:5308:b0:460:19c3:2992 with SMTP id eo8-20020a056402530800b0046019c32992mr46464716edb.1.1670000068434;
        Fri, 02 Dec 2022 08:54:28 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id p24-20020a1709060e9800b007b93544ad9dsm3184051ejf.109.2022.12.02.08.54.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 08:54:27 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso4768403wmo.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 08:54:26 -0800 (PST)
X-Received: by 2002:a05:600c:1e12:b0:3cf:9ad3:a20e with SMTP id
 ay18-20020a05600c1e1200b003cf9ad3a20emr42831960wmb.151.1670000066491; Fri, 02
 Dec 2022 08:54:26 -0800 (PST)
MIME-Version: 1.0
References: <20221202155738.383301-1-krzysztof.kozlowski@linaro.org> <20221202155738.383301-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202155738.383301-3-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 2 Dec 2022 08:54:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U_kFLh1me+KGcg_hjC8_OhJtZ8ddsQyH2jNkw88ZG_aQ@mail.gmail.com>
Message-ID: <CAD=FV=U_kFLh1me+KGcg_hjC8_OhJtZ8ddsQyH2jNkw88ZG_aQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sdm845: do not customize SPI0
 pin drive/bias
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Dec 2, 2022 at 7:57 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Each board should define pin drive/bias for used busses.  All boards
> using SPI0 (db845c and cheza) already do it, so drop the bias/drive
> strength from SoC DTSI.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Cc: Doug Anderson <dianders@chromium.org>
>
> Changes since v2:
> 1. New patch.
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

It's hard to review device trees without noticing things that are
inefficient / wrong. In case you want any others for your list:

a) As written today, `sdm845-db845c.dts` doesn't actually need to
override the `pinctrl` of `spi0` since it's the default. So you could
remove two extra lines of device tree.

b) Officially, db845c actually _should_ be overriding the pinctrl and
we should be doing something like what we did for sc7180 where we have
different definitions for "cs" and "cs_gpio" for the SPI lines. That's
because db845c is actually using "cs-gpio" mode for this SPI part and
thus GPIO3 should be marked as being "gpio", not "qup0". It doesn't
really matter functionality-wise on Linux because the Qualcomm pinctrl
driver will automatically re-mux the pin as a GPIO the moment the SPI
core tries to use it as such, but it's a little ugly.
