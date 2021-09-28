Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2942841B118
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 15:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241015AbhI1NtK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 09:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240988AbhI1NtI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 09:49:08 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4892AC061575
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 06:47:29 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x27so8166785lfa.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 06:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zwVENlJtRAi6Ax59HxxFqFtBJgRbm8ce1Id+5WhoWL8=;
        b=XQFP1mUhXKlHXI+xEmvDrSXbeLGnD4CLmXjgYseEqEruv9KrCC6FSc8Y5Ho4LjbDOX
         zC6snsJNUUz1wZImn8MwvqtBxmMBxpHhjrx+sD7movv4TlZPXtvtAREC+/yRiKmX0pue
         ++eKN5f+0dJcVxMLuJppLKf8ZQF/8jTKUtiroQPAE26FNLy3qV5NuZ4Mfmn9YaCTMPq7
         nzwGakmqi86S8+l5vHWVzyPlqaDPjAMTD04P50HoQaOwSxjmCvIFwGP8TkCDq/Iqin0z
         nosD+DseVrciB0VXscUsdG8/7r83wCXEdGV3qDxxotWcJfScS76Tqa9v285icJA3aBNN
         Ec1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zwVENlJtRAi6Ax59HxxFqFtBJgRbm8ce1Id+5WhoWL8=;
        b=HLF4i+6RyniOanJrYtD5k09evfmtXI/QKTKYqYMZzDODlhofKH3ZgeplDHS5wHHuL6
         rRDHbFpSrJ3yf0Pw7Ak97edUHBzCs0bnQV0/gasXq418DfCfq8ZfZ6YH3qbilZApi8kX
         BWjEjHAq5vmSt0uB8zQIu0tTo3DtBWRbv3uTIdrtdNmRpSB6QkLdEkDYcdgGVscRY9k9
         psgsEseDzAy6LHr5xszgYftkGKBxx6HhsBgGS4fnndglyKse/ETtZBzmgPz01Xnz0j/k
         zV9Qj3w5YFzNDUT69jlJhT4Pni3hss+pGMRw2+Mxs+LQU65Uuzv2SndFcZJrPFV9SNiD
         b3iA==
X-Gm-Message-State: AOAM533q/hxumMDnInM9ume9BStS9NSEXv1qvn2f1H1Qks3Ku1RRC4+s
        Pi6O/ELJ757lODxqeMV3XpvrrEbx4tFsdZjPPlAyrQ==
X-Google-Smtp-Source: ABdhPJw2Fb4WlAdBMN6qf/ANOW7XfaZ4dwR3+5V+TQbap6YMXmbnt1TkRoKkuxS6/KOggTQZ6bWvGaBx1mJ0aeF2U9k=
X-Received: by 2002:a19:f249:: with SMTP id d9mr5834936lfk.229.1632836846030;
 Tue, 28 Sep 2021 06:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210928013621.1245-1-caihuoqing@baidu.com>
In-Reply-To: <20210928013621.1245-1-caihuoqing@baidu.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Sep 2021 15:47:14 +0200
Message-ID: <CACRpkdZX6JkBOFX9yd-gsrzD5ObXR1VKmVNFLNbAv2Q0w1w5FQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] iio: adc: ab8500-gpadc: Make use of the helper
 function dev_err_probe()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 28, 2021 at 3:36 AM Cai Huoqing <caihuoqing@baidu.com> wrote:

> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
> v1->v2: Remove the separate line of PTR_ERR().

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
