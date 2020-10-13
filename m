Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF14628D23D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 18:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgJMQ2z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 12:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgJMQ2y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 12:28:54 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C2DC0613D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 09:28:54 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id 140so342718qko.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 09:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o9Hoq7to5XCI/uJ6Zu640TqCyme9iokY/Q0eHTZtcfE=;
        b=eGijH9UjwpDPWbsso/7C8OhlURtyBQ/eyD4ifTt7mGs5AaQNDP6gh6royvq4unpYnY
         O1qziBe3AgEI9XkgiAaKqXTD4ZJ/4ZZpbw/tIkSb2vodppTwzLgeh1La+N1Zvq8f3kh5
         XcdpJinvL4q2EPnzN6s5HIxC1izEMDdI6aYVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o9Hoq7to5XCI/uJ6Zu640TqCyme9iokY/Q0eHTZtcfE=;
        b=eshV75kANmRCpjzEPJ6i7J/ORW5HYShMmmzb1ZD3PzZFDQn9YFsZ9v21NvEMroW23Z
         WOyEH+fjI/qwcOxYFNfJuAXiwXzF9tFgIwo2IRjBxMT2Bwng6ww4vjtLTXArl4mx99Dv
         D87bZzUVF3taTHPwBSBFo3dmT9Q9xdeRxdf4293oR75WFdbwprzZDzHQrn9qpV1n3Pqr
         mKmwg37UAPVXL0iPenKRO9ib2WkOTMv+8iRnr9f82alF6c11tbb/COpsOR/XQItI/XgH
         l815sOxlNLwnt/9ZipqRvuRcgOZs5n3IY/qMqfVi8GMqR4mPZzC0J0v/xeAAfv6mbE4i
         AHvw==
X-Gm-Message-State: AOAM530n6gKjyXasT3/f0p/UcqNuE1DcGRAzwQpaOoA86Z6xhCwvq73s
        gCCU33tEOyHZr6UJRv1JqkXRz2XcSV5OQA==
X-Google-Smtp-Source: ABdhPJzFiB96SDrriK1mRqhDWt37SP2x0ldSgTsO5k/vhMkgLjhZ7INJ/hgmqIxR49hV40Oud9w2mA==
X-Received: by 2002:a37:2753:: with SMTP id n80mr569837qkn.353.1602606532645;
        Tue, 13 Oct 2020 09:28:52 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id t3sm147822qtq.24.2020.10.13.09.28.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 09:28:50 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id a4so127159ybq.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 09:28:50 -0700 (PDT)
X-Received: by 2002:a25:d412:: with SMTP id m18mr998932ybf.253.1602606529921;
 Tue, 13 Oct 2020 09:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201013080103.410133-1-amstan@chromium.org> <20201013010056.v2.3.Ie4d84af5a85e8dcb8f575845518fa39f324a827d@changeid>
In-Reply-To: <20201013010056.v2.3.Ie4d84af5a85e8dcb8f575845518fa39f324a827d@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 13 Oct 2020 09:28:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W4fv_AdS7G2FFe2Kan3YYJ4D0MVJD90aJMrgCja5N4vg@mail.gmail.com>
Message-ID: <CAD=FV=W4fv_AdS7G2FFe2Kan3YYJ4D0MVJD90aJMrgCja5N4vg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: trogdor: Add brightness-levels
To:     Alexandru Stan <amstan@chromium.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Oct 13, 2020 at 1:01 AM Alexandru Stan <amstan@chromium.org> wrote:
>
> Now that we have better interpolation for the backlight
> ("backlight: pwm_bl: Fix interpolation"), we can now add the curve to
> the trogdor boards, being careful to crop the low end.

Just to make it clear, the patch this depends on hasn't landed yet.
Presumably it will land in the v5.10 timeframe?  That means that
without extra coordination this patch can target v5.11.


> Signed-off-by: Alexandru Stan <amstan@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index bf875589d364..ccdabc6c4994 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -179,6 +179,15 @@ pp3300_fp_tp: pp3300-fp-tp-regulator {
>         backlight: backlight {
>                 compatible = "pwm-backlight";
>
> +               /* The panels don't seem to like anything below ~ 5% */
> +               brightness-levels = <
> +                       196 256 324 400 484 576 676 784 900 1024 1156 1296
> +                       1444 1600 1764 1936 2116 2304 2500 2704 2916 3136
> +                       3364 3600 3844 4096
> +               >;
> +               num-interpolated-steps = <64>;
> +               default-brightness-level = <951>;

I haven't done lots of digging here, but this matches what Alexandru
and Matthias agreed upon for the downstream tree and seems sane.
Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
