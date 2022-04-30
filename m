Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8794A515D85
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 15:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382689AbiD3N3u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 09:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381853AbiD3N3s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 09:29:48 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8EB2A277
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 06:26:26 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2ebf4b91212so110402127b3.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 06:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+wRFsVZ4K28MiXgknTEFp0527Wz31nnhpmKvMdFtgk=;
        b=ji5KO51EY5LxDOubII9v4JSPit0qIQjkf8NUlScorihNIE6nP0d0Qh5Cz0owzhVU74
         GdXFtfh28zCFspiOgM99RsCqArXnIfHT6Rae7/NdmIhQ95wE0dfdAIS09Agz+GGLieYM
         etnZK2EvBfJBadrpwr6E/io9TK2XCE6iNBs/vjrwMqvgrjTjgm0jY0JETyu1xx/02lsf
         OUvSlEAkMv1imeI+vA5rkuXXGeMZ+cVrwlCTJY+ZG6nRIWcVUcDHKWtSMF06KTI2ctMC
         j0JQpn84qQ445V6zQawb0i2nAhdNhoOtwVfH0DBFlMayQUU5LQaGevx3CM68osTEqlNJ
         bi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+wRFsVZ4K28MiXgknTEFp0527Wz31nnhpmKvMdFtgk=;
        b=z6NGuzlPPgLacuA1xSYWn48eOpthR0F83cwJj0LQe4OR4h10/UZsYxqUnzqz1jlmgw
         r6Pq0jCAVmR85ztBRF/kxMd5txUnKjl5dSUj1iHcWE1w/wqt2L2wOb6rmJ4DS14LFVAy
         kT3UNzP3WHEBeuaHx+8tslwAIhJ3Snb3vZCb/q1TQpkU7w/913v4gqvcMhHvUNdwniLI
         tUtCV6fk1RZTSjqfCg6a0BYDzUn7tVJM2nYF4kjT4opGVetjdg8tDxI2w9i0bUpX47+C
         G7TK+kaktqsRrE8MWsZAnJAjBr/6P6juBlFoi4ARtQRdegrKzJJFm/VTDCIXnCcKpMNj
         Yjqw==
X-Gm-Message-State: AOAM533bSrI010FIhG5DDbWYTA8X/Bpi0VKK0nzQgH9CfLHF1JNChYy1
        JFdT5OH1RrMgolGZcsYJj5lgvTjxwIR04yqyarawUw==
X-Google-Smtp-Source: ABdhPJw4GuoBaYZh8SAqU4j8Z/SJ+zQke6niVNaDkfVTu7Qhqks8WxByWajFA90117xorxLrPccJGKqHgW/ROJz8MvE=
X-Received: by 2002:a81:3252:0:b0:2f6:b826:2286 with SMTP id
 y79-20020a813252000000b002f6b8262286mr3797367ywy.289.1651325185841; Sat, 30
 Apr 2022 06:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220430055118.1947-1-ansuelsmth@gmail.com> <20220430055118.1947-3-ansuelsmth@gmail.com>
In-Reply-To: <20220430055118.1947-3-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 30 Apr 2022 16:26:15 +0300
Message-ID: <CAA8EJprqUg4_0yFU1nsV3c-7JH1VTgVE=hyDVWz+Z4BtkRktbQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: qcom: add syscon and cxo/pxo clock to
 gcc node for ipq8064
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 30 Apr 2022 at 15:59, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>
> Add syscon compatible required for tsens driver to correctly probe driver
> and access the reg. Also add cxo and pxo tag and declare them as gcc clock
> now requires them for the ipq8064 gcc driver that has now been modernized.
>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index e6ca8d1d1c5f..ad30f7c8a5a7 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -298,7 +298,7 @@ smem: smem@41000000 {
>         };
>
>         clocks {
> -               cxo_board {
> +               cxo_board: cxo_board {
>                         compatible = "fixed-clock";
>                         #clock-cells = <0>;
>                         clock-frequency = <25000000>;
> @@ -736,7 +736,9 @@ tsens_calib_backup: calib_backup@410 {
>                 };
>
>                 gcc: clock-controller@900000 {
> -                       compatible = "qcom,gcc-ipq8064";
> +                       compatible = "qcom,gcc-ipq8064", "syscon";
> +                       clocks = <&pxo_board>, <&cxo_board>;
> +                       clock-names = "pxo", "cxo";
>                         reg = <0x00900000 0x4000>;
>                         #clock-cells = <1>;
>                         #reset-cells = <1>;
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
