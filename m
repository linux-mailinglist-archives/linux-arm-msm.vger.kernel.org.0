Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3BC41B21D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 16:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241283AbhI1OcQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 10:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241279AbhI1OcK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 10:32:10 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13228C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 07:30:31 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id x27so8717459lfa.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uh1B6XTocg/PuNZlNsHJ5qn3ywJ0pfLGKGnm5l1sB1s=;
        b=bt1vQ9mFtLWbSomTDSPbF5QE3RLYCRSGiCjPdnKP0BYNmZ22nN/5dQreFOHtJlZP9A
         w1Ju27SQF3MMrUPKopIdjsdV0fU69078TLg3O6fDK6EtaBVBFxWWwokt6QgWln5o8xT/
         0FE64IiWO7MHsJ9hCkLWJ0A73tKdDUIHDA2H6cYZe3v+aaEsZvFVbmFcynWdoX4JFqyW
         VHhtrRCMq587NZq3jdj7pcF+xc6daSurloZBhgz178YbCvxjCtZ9KIVs5/G/eVu3cZz0
         O2DoTHqZJqv61DW3iDhIzQkvY9RLrrmCkYy5YJEATVCpeoiBUANGdDnTN7VJiWwB9a31
         i2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uh1B6XTocg/PuNZlNsHJ5qn3ywJ0pfLGKGnm5l1sB1s=;
        b=xkTHasuQZKkRhEXPNXkR8VSll9IiALXHoczgUF6zewBAxiFo1HbJkmxZZUZEr6ze3r
         CMyr7JBxdWpBWHP1lBINw1DRpc0EQ4F1xLxAeBryiGiK7ff7R7bshIV+BBrjtkynNbXN
         b8dBs1e72hAVo6VM0JE28yeb8vpqfjMMCuGOC43wCOOoW9zYrEFe56q6lGhveJxbawnt
         vNcMt57SjEty+kGZTpC9yPJXr+Z2eleaFBgJc767Tccnnsn/PDqc4/9kXGgHDlQAsxz7
         klUZX+hTGXDUkiIcFtZgprzf6Wlgpniiv7FEKuQsiXqO9NQyB4m5VjUp8pkbin29+HRu
         eoqA==
X-Gm-Message-State: AOAM533oAgNPeMEbhCexJLJ33REjk3ivEpc4noirAoAu3Pw7AzTyzn2U
        34mijAqN/nRC4WLFs5/MQFN8Jf/vjLMHfl//nql+FA==
X-Google-Smtp-Source: ABdhPJxrQ91FcoG1j8MqOj19A8jz0Mbb51yvmE4ezgOpcY+fkN/eVADQarawxS3wzP2LfC8q5vYwAWJL1ZqFFqpb/1o=
X-Received: by 2002:a05:651c:1124:: with SMTP id e4mr253677ljo.261.1632839421344;
 Tue, 28 Sep 2021 07:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210928141956.2148-1-caihuoqing@baidu.com> <20210928141956.2148-7-caihuoqing@baidu.com>
In-Reply-To: <20210928141956.2148-7-caihuoqing@baidu.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Sep 2021 16:30:09 +0200
Message-ID: <CACRpkdYSKnk0v2FEPg5h4p_ODtepXoH9=a=8hiTa7BP3goaPKA@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] iio: adc: qcom-pm8xxx-xoadc: Make use of the
 helper function dev_err_probe()
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

On Tue, Sep 28, 2021 at 4:20 PM Cai Huoqing <caihuoqing@baidu.com> wrote:

> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
>
> BTW, change the return value from 'ENXIO' to 'ENODEV',
> perfer ENODEV which means no such device.
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
> v2->v3: Update the changelog.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
