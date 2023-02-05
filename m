Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF11E68AF2A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Feb 2023 10:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjBEJ6P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Feb 2023 04:58:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBEJ6O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Feb 2023 04:58:14 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D4915258
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Feb 2023 01:58:13 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 79so1240116ybe.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Feb 2023 01:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j1F9gVl0En4VCYrtfscspregFWP6uGIfRnZos/Qw5Kw=;
        b=Nex1vn2Bu9x6szqpHOk+qI/uuz72FwVM0+mRvKONWO3iMz8h5amBGc2GGQWPIXdZYY
         raK3PsyPpZZbhzMBmFQXL4iwJ7KdLLQRtBJ0aPh7+mxQwVERqSoVSAKBT47yC4+42r5I
         56QwGYkvGYAzqMVUjhJkA7KbLapdmPNWrwaNMBiKeYdJpqIerO6q8csd0Cdivwb4lpX1
         CmcvTEiO6UGt2Ev929B8/TXSYqoh1pc1y+2X4VF5p6klu9jlZnvvYlKHXMqPVHgdhpDs
         QgQaSEDfwhlFj76rHulO16fa3qDjhcnsysZZlRj1Qnnhm6FA5ILxKuOiMAOcp5gEnCWJ
         gmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1F9gVl0En4VCYrtfscspregFWP6uGIfRnZos/Qw5Kw=;
        b=5Ge+oZ93MC0EjbbkNukRjKWShXIdBeZCnmBLBLdmYevj0z+ujirbGrMLOf79VrzRAK
         wOJBX1OtWGXq4Su+03PEDvHOkKbDkYxVXwGKxsAsXYd7MNzAFe7Km0subU/UMgR2m2yk
         wp2BmP82Xb/2F5qGlLdIpBRuInClh0UfK+eJGbb6TcX7OtXR4YKdoYeO8kyXRZGNuFu9
         f48Ha/xcTIec6zaH0dluCKAv3enw2Od3cA/r3RsnzpCwkVXtWY6aoT0CbVl/v0HFti9d
         6NtX99DgsYearliqfx5vrUXEZEOHxPofRRz8ca5zOfLz6Gb2O8HgqRfzw1IgPXSrcPnc
         cV7w==
X-Gm-Message-State: AO0yUKWwIB2Zi2rxENRB9Gq13sMHq7+x0/rRrf963JEiKtPHTD78yFuu
        llOj84zATruX7tj3OkJczjOsnD2aLFXL8/89jxYpRDbr/6U=
X-Google-Smtp-Source: AK7set9fw/lAR9zZ28g+SQPN5Sg0olqOyDBOokHd369imwC1kfRaZYr+WEU+LiA3CiE6DTpzFrFzIsCQ9k1tvNVz/As=
X-Received: by 2002:a5b:a0c:0:b0:80b:dedb:ec94 with SMTP id
 k12-20020a5b0a0c000000b0080bdedbec94mr1665187ybq.528.1675591092149; Sun, 05
 Feb 2023 01:58:12 -0800 (PST)
MIME-Version: 1.0
References: <20230203100952.13857-1-pvorel@suse.cz>
In-Reply-To: <20230203100952.13857-1-pvorel@suse.cz>
From:   Jamie Douglass <jamiemdouglass@gmail.com>
Date:   Sun, 5 Feb 2023 20:58:01 +1100
Message-ID: <CAETzdaH9shhDJYA63DTQGrPkwAY3GG6oBKWDUmaxbsaUAbVv_A@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8992-lg-bullhead: Enable regulators
To:     Petr Vorel <pvorel@suse.cz>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jeremy McNicoll <jeremymc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>
> Enable pm8994_s1, pm8994_l{26,29,30,32} regulators.
> Use values from downstream kernel on bullhead rev 1.01.
>
> NOTE: downstream kernel on angler rev 1.01 differences:
> * pm8994_l29: regulator-min-microvolt = <2700000>
> * pm8994_l{20,28,31}: use regulator-boot-on
>
> Verification:
> [    1.832460] s1: Bringing 0uV into 1025000-1025000uV
> ...
> [    2.057667] l26: Bringing 0uV into 987500-987500uV
> ...
> [    2.075722] l29: Bringing 0uV into 2800000-2800000uV
> [    2.076604] l30: Bringing 0uV into 1800000-1800000uV
> [    2.082431] l31: Bringing 0uV into 1262500-1262500uV
> [    2.095767] l32: Bringing 0uV into 1800000-1800000uV
>
> Fixes: f3b2c99e73be ("arm64: dts: Enable onboard SDHCI on msm8992")
> Signed-off-by: Petr Vorel <pvorel@suse.cz>

Tested-by: Jamie Douglass <jamiemdouglass@gmail.com>

> ---
>  .../boot/dts/qcom/msm8992-lg-bullhead.dtsi    | 32 ++++++-------------
>  1 file changed, 10 insertions(+), 22 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> index a100b05abf56..b8f2a01bcb96 100644
> --- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> @@ -89,8 +89,8 @@ pm8994_regulators: regulators-0 {
>                 /* S1, S2, S6 and S12 are managed by RPMPD */
>
>                 pm8994_s1: s1 {
> -                       regulator-min-microvolt = <800000>;
> -                       regulator-max-microvolt = <800000>;
> +                       regulator-min-microvolt = <1025000>;
> +                       regulator-max-microvolt = <1025000>;
>                 };
>
>                 pm8994_s2: s2 {
> @@ -246,11 +246,8 @@ pm8994_l25: l25 {
>                 };
>
>                 pm8994_l26: l26 {
> -                       /*
> -                        * TODO: value from downstream
> -                        * regulator-min-microvolt = <987500>;
> -                        * fails to apply
> -                        */
> +                       regulator-min-microvolt = <987500>;
> +                       regulator-max-microvolt = <987500>;
>                 };
>
>                 pm8994_l27: l27 {
> @@ -264,19 +261,13 @@ pm8994_l28: l28 {
>                 };
>
>                 pm8994_l29: l29 {
> -                       /*
> -                        * TODO: Unsupported voltage range.
> -                        * regulator-min-microvolt = <2800000>;
> -                        * regulator-max-microvolt = <2800000>;
> -                        */
> +                       regulator-min-microvolt = <2800000>;
> +                       regulator-max-microvolt = <2800000>;
>                 };
>
>                 pm8994_l30: l30 {
> -                       /*
> -                        * TODO: get this verified
> -                        * regulator-min-microvolt = <1800000>;
> -                        * regulator-max-microvolt = <1800000>;
> -                        */
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <1800000>;
>                 };
>
>                 pm8994_l31: l31 {
> @@ -285,11 +276,8 @@ pm8994_l31: l31 {
>                 };
>
>                 pm8994_l32: l32 {
> -                       /*
> -                        * TODO: get this verified
> -                        * regulator-min-microvolt = <1800000>;
> -                        * regulator-max-microvolt = <1800000>;
> -                        */
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <1800000>;
>                 };
>         };
>
> --
> 2.39.1
>
