Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB5438933B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 18:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355083AbhESQHD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 12:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241402AbhESQHC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 12:07:02 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7DBC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 09:05:42 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id m13so10462794qtk.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 09:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IgMoICu8rR/IW1eQMMzk4MHApS2BtnfRdBWMe2gT6bk=;
        b=h+UM8LCakd3xicL67AYTK3McsW7So2YlPlnF5ddViK5EX4/zLL6fgFJCBExK3DiZSx
         HUWQhMQmcMrYZLVRL2jJ/xeQpu+0xz+KtnhpYj4EuMbXYHXEaTsFA5pWe+O1altaY43v
         AA1UnTSkMKBgnT+NrY7kLvooya4zA7BhG7Q9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IgMoICu8rR/IW1eQMMzk4MHApS2BtnfRdBWMe2gT6bk=;
        b=LgE7ZO4b1KHkF1ImrFfAPjrz4k/K+vKQQWC7vX+PsC80O0SzTwa39puIH3z0BCY6lu
         62HQjkoD21O4/6D3mxuL395EQYS88kaYBt0YNbsJZtF7I89kG2wTfn/3FvJAD0VaRZJp
         bh+esXTNzk7PmQ5jhFJ01zKo0C+DqkjaS3ynVYJt3S8X3yiuVugA7zTl3Tn/6S7FzkeJ
         3WfSi+v8TV6uQMdi0y0tZmgGiUY2aduLGxtHAoV0K0Vp5AZHKX7CGdM2fePOREaRsu0a
         2XCnh6XE6PUZKiePzXV6FK6XlLdG41t5gEMQh0PkHlGoUjOyz94DJx/Qwrs+Cdc64+je
         3moQ==
X-Gm-Message-State: AOAM5309E6pHFShCC0aJSObR4oHNd3zrv0+lMcSWUe+YPee1mEtnYJWw
        eZqENYMZA6DBA0VE5G9vW9Hueb2JrkJ4Kw==
X-Google-Smtp-Source: ABdhPJzPM2rPHr6sI6GmxamtO0+dFY+dbJ2kgmVrVo9GMvKhvHZ+e9As19SHIi4EgqxZkO83yCjmQA==
X-Received: by 2002:a05:622a:5cd:: with SMTP id d13mr156937qtb.96.1621440341198;
        Wed, 19 May 2021 09:05:41 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id w9sm11462254qtt.59.2021.05.19.09.05.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 09:05:40 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id r8so18749430ybb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 09:05:40 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr324651ybp.476.1621440340101;
 Wed, 19 May 2021 09:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210519054030.3217704-1-swboyd@chromium.org>
In-Reply-To: <20210519054030.3217704-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 19 May 2021 09:05:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UarqLwPu6mJ7QU8qXWoaizqMHHbjqF4q=KPYvDZrhT-A@mail.gmail.com>
Message-ID: <CAD=FV=UarqLwPu6mJ7QU8qXWoaizqMHHbjqF4q=KPYvDZrhT-A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Update flash freq to
 match reality
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 18, 2021 at 10:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This spi flash part is actually being clocked at 37.5MHz, not 25MHz,
> because of the way the clk driver is rounding up the rate that is
> requested to the nearest supported frequency. Let's update the frequency
> here, and remove the TODO because this is the fastest frequency we're
> going to be able to use here.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 24d293ef56d7..af3c0e1e2223 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -335,8 +335,7 @@ flash@0 {
>                 compatible = "jedec,spi-nor";
>                 reg = <0>;
>
> -               /* TODO: Increase frequency after testing */
> -               spi-max-frequency = <25000000>;
> +               spi-max-frequency = <37500000>;
>                 spi-tx-bus-width = <2>;
>                 spi-rx-bus-width = <2>;
>         };

Thanks. Looks right to me. I confirmed that the clock is 150 MHz in my
"clk_summary" which is 4x 37.5.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


-Doug
