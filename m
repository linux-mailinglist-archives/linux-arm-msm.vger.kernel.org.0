Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF7163FD47
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 01:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbiLBAuH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 19:50:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbiLBAuG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 19:50:06 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7998ABDCD4
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 16:50:05 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id d20so4646022edn.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 16:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7vv0AAcoPBw8lAAEAG1SUbk7k5AR+sWuTiUY/+9wW8E=;
        b=XABptQ1cyK5zAoublcuBrzvzHSNPn16lIrlJcEqRnP+m+ysoIAUyPru77RsPjf2UMF
         fMG6NQ7eKRkcs5zlYDFv8UuNGmFf3xUC3ZHwbjhmB+5u0AB61KEdHEoQQY+fVp0A+bS4
         tV71XbSKazWh5SOHR471oGaqbuS9Izn97lnwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vv0AAcoPBw8lAAEAG1SUbk7k5AR+sWuTiUY/+9wW8E=;
        b=Hd9lWO1JCEo9U10x6nNoMwS5y9qgxkcROoP4q4oJQATX2HpEBkCWtYL+L1H+y+Hqbo
         X3oyxuiZuirIWV6C5KIvN6uIrPBJJvw3Br4tHUEJ6YkRtIPk04ip1peUOAHWfQqpEV9H
         iSVYUFkr0GzTSuEgCQOAbOKokdP+FJibQ+pTzk/r5DjRyFfoG/Hu+GN48cwKUNL2XfVu
         rXVV01b6GI5O2q5Oyb4HDp5mq3m7WKYMG7Tgl8sCTR886rBPl9FSu5dFXSKKI3iEI9dL
         5bWfnS6SdR8R9w5B8s1kBdS+HxpeUdeIJl36pzxn/pk+gyXYShrW86TH4ehoZ3e5DGnD
         UbHw==
X-Gm-Message-State: ANoB5pmqDqSM1KGVPyDUVvG5V8BJIzwjAs22rh96SprLPX2w9CHJZYUk
        5AUeryXyv7YqXSFKqafLD94eFw7KIlgtW9rn
X-Google-Smtp-Source: AA0mqf7V22NemWGE3YrFRv1aEunddPNX23vNDxiu1mO+auY0J1AgzUzQo86M5fVgky233Yq2xzgaNQ==
X-Received: by 2002:a05:6402:1013:b0:463:f3a:32ce with SMTP id c19-20020a056402101300b004630f3a32cemr46401082edu.366.1669942203872;
        Thu, 01 Dec 2022 16:50:03 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id gi20-20020a1709070c9400b0077d6f628e14sm2391078ejc.83.2022.12.01.16.50.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 16:50:02 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id h12so5513842wrv.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 16:50:02 -0800 (PST)
X-Received: by 2002:adf:fb4c:0:b0:236:5270:735e with SMTP id
 c12-20020adffb4c000000b002365270735emr31203152wrs.659.1669942201820; Thu, 01
 Dec 2022 16:50:01 -0800 (PST)
MIME-Version: 1.0
References: <20221118164201.321147-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118164201.321147-1-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 1 Dec 2022 16:49:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vo9zbsjgYEn0eBkC8eKRceg6v4u1g=w6nSYHNctFQWxg@mail.gmail.com>
Message-ID: <CAD=FV=Vo9zbsjgYEn0eBkC8eKRceg6v4u1g=w6nSYHNctFQWxg@mail.gmail.com>
Subject: Re: [RFT PATCH v2 1/2] arm64: dts: qcom: sdm845-db845c: drop unneeded qup_spi0_default
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
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

On Fri, Nov 18, 2022 at 8:42 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The qup_spi0_default pin override is exactly the same as one already in
> sdm845.dtsi.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Cc: Doug Anderson <dianders@chromium.org>
>
> Changes since v1:
> 1. New patch.
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 02dcf75c0745..56a7afb697ed 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1274,11 +1274,3 @@ ov7251_ep: endpoint {
>                 };
>         };
>  };
> -
> -/* PINCTRL - additions to nodes defined in sdm845.dtsi */
> -&qup_spi0_default {
> -       config {
> -               drive-strength = <6>;
> -               bias-disable;
> -       };
> -};

I guess it's more of a question for what Bjorn thinks, but I view the
fact that the drive-strength / bias are in the dtsi file to begin with
as more as a bug in commit 8f6e20adaaf3 ("arm64: dts: qcom: sdm845:
enable dma for spi"), which is where these properties were introduced
to sdm845.dtsi.

The historical guidance from Bjorn was that things like
"drive-strength" and "bias" didn't belong in the SoC dtsi file. Later
we came to an agreement that it could be OK to put drive-strength in
the SoC dtsi file but that bias was still problematic because it meant
ugly "/delete-property/" stuff in the board dtsi files [1].

[1] https://lore.kernel.org/r/YnSQvyAN3v69an8k@ripper
