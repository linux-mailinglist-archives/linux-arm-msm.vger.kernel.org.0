Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E323640AC5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 13:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbhINLZ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 07:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbhINLZ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 07:25:56 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC0B5C061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 04:24:38 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id s3so23130822ljp.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 04:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MXbax/1bglMzgg6o47IyNakKQ88KE4K/hGwmlnc25Ko=;
        b=N4100R/sVYI9xB+3RNF629B4s5ko7wLFiA6IUtn0oKfdFh4s/DVlj2FjWpH4EB0GWf
         nSMDgFuOB1FxKtOSkpd4KpnVn64T9GkSKp0EvH+DldoiZ0rVEhMOPAJHkgb89JuegEgT
         hVS0D/Osme/N8neVgiEaMNrlnQFqwSccnIyfqqQPfVokx/xmcLh3RCXL52xiIJzY6ZRq
         uMDG6zYAqhpcYdy+xr46dMDyzOciUPXIix6C8+tsMUz/w5rI2L27oVpcTqN6+X0BNIqO
         PTdm9tL+nnkFsidR6SB0wS361pbbavkKWyVqdsTpBqhCe/DQMVtEr1A3eR2VmWTrUc/4
         +zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MXbax/1bglMzgg6o47IyNakKQ88KE4K/hGwmlnc25Ko=;
        b=1+gjujsWLziAr1TLPzAEBNPwfiv/fkcAmGO3vyLhCRnjvK6I18PMGJofKSo7RwiWtj
         HuPMPuMchC9lBCFR0SPqNYcH6yK3fBdsaEwU8ZxGRmXDuFhgs3SbdbWkw0tlb9lcyOaX
         18TuGt0bq/0E8Ng8RG791ePcIgIlwANqxb1cIXzdxDRW5xxXd7jqWDvw3p2mhy9qyCnK
         O3OvBOKt6xLWQqbFjTTY+quy0uA+sdR7GOY+HfnDGIfOO2bcMJ3kwL/0q5z2iaTzrPu7
         NeCALLsfh6LqWDU/DXzuuwldwR0UwnaVYLt8dporAx87wu4hSPqcTkiRQ8afPvnyU1yf
         2Ekg==
X-Gm-Message-State: AOAM532CIKbXt2XM3MkgFNOHhL1jGwKr8PYHWnYoQw8PbHit5HDmkrQ/
        tr+ymbFWCmK5t2x/l3rnKI+n5d9cpBS6D7z+g5q0Aw==
X-Google-Smtp-Source: ABdhPJxNQjIx8LfDVzNm9Bxa8g8kduMXKBDzOD8rsarWhRJUMWWBpslN7FA28BAQA42mUmbJjsXpFhnu6cwrV9l1QHM=
X-Received: by 2002:a2e:9b0b:: with SMTP id u11mr14793392lji.463.1631618677115;
 Tue, 14 Sep 2021 04:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210911232707.259615-1-luca@z3ntu.xyz> <20210911232707.259615-3-luca@z3ntu.xyz>
In-Reply-To: <20210911232707.259615-3-luca@z3ntu.xyz>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 14 Sep 2021 13:24:00 +0200
Message-ID: <CAPDyKFr9k2dO8FJf4=ZUKZ6=WpDS2mOJ+BZbtK1m_-OWx_ehmA@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: mmc: sdhci-msm: Add compatible string
 for msm8226
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, bartosz.dudziak@snejp.pl,
        Rob Herring <robh+dt@kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 12 Sept 2021 at 01:28, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Add msm8226 SoC specific compatible strings for qcom-sdhci controller.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> index 365c3fc122ea..50841e2843fc 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> @@ -13,6 +13,7 @@ Required properties:
>                 string is added to support this change - "qcom,sdhci-msm-v5".
>         full compatible strings with SoC and version:
>                 "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4"
> +               "qcom,msm8226-sdhci", "qcom,sdhci-msm-v4"
>                 "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4"
>                 "qcom,msm8916-sdhci", "qcom,sdhci-msm-v4"
>                 "qcom,msm8992-sdhci", "qcom,sdhci-msm-v4"
> --
> 2.33.0
>
