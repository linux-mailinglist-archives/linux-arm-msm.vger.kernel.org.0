Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1649145DEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 22:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729367AbgAVV3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 16:29:22 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:36171 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729339AbgAVV3U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 16:29:20 -0500
Received: by mail-vs1-f65.google.com with SMTP id u14so405653vsu.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 13:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vTz0lK4MWaaIUm1zOO05D9tP3L8z6e5/rjhy199CFHA=;
        b=U+oDtBN20djYD2BA6vTb8zmhw0901lDwsc+HsVWuPXXCQLBVtJR/ejKZ8cNJ3WMe4Z
         /CN4krHpVSEHOfAhc3Jk9LW1RRz3N4rTwDvEh+yEa4T56iundLwEjbRdtG2cdSBVC303
         v595x/352B+y2PS70/UoqhIh1JCRGHYwWJfd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vTz0lK4MWaaIUm1zOO05D9tP3L8z6e5/rjhy199CFHA=;
        b=BzfXXhTZ9VNJZS8Q1ONC66epsPUU42VVB5jTYdGOw8O1FrNCglKXUGtrEfMiZ4U8Zj
         pUY8ZtZQ3OY07d39/WZ94MAnhl4nAIKhf/Jmduzug4Lo2QwVApcHC2bjDYhGTODB79+E
         atiHWrwpHNrMuS3y/88Ii/TsU1loyX7L9OZDh6is6fSnPxNydutrC3Ia/mDAImKNBNNS
         rmjQiM77JGO1KYsUUwZa9icwXRYMLm2KYEyOfxXjgxzi+MZPHK9YmM6b8nJTE44sQVsJ
         xR4NdKjUTYWa9A99JkZDiglPliXBEml7UGk36NwnadeaqlFAK5R2fQLBb64LatyyeNRj
         TpXQ==
X-Gm-Message-State: APjAAAXZG9uQ5BmHSJp4SVc8fuyt2kvea98FMR1APZApkmJOUpXAhwct
        +++6eZHKnVfi0We7pd250rfUVsGnsIU=
X-Google-Smtp-Source: APXvYqx6NqOWeNAbVuaLoNWqH5cpXJh1zksV/mcfJUCM4da86mFN0LdvGx3VFwOVS0SV0JWRnqoerQ==
X-Received: by 2002:a67:fc5a:: with SMTP id p26mr4378480vsq.71.1579728558848;
        Wed, 22 Jan 2020 13:29:18 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id p78sm36315vkf.0.2020.01.22.13.29.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2020 13:29:17 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id n27so424979vsa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 13:29:17 -0800 (PST)
X-Received: by 2002:a67:8704:: with SMTP id j4mr4193371vsd.106.1579728557149;
 Wed, 22 Jan 2020 13:29:17 -0800 (PST)
MIME-Version: 1.0
References: <1577421760-1174-1-git-send-email-tdas@codeaurora.org> <1577421760-1174-4-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1577421760-1174-4-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 22 Jan 2020 13:29:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UxTDkwr8Z43TGXjpU6bKRN3ns2BdShKehAga4gkLUpLQ@mail.gmail.com>
Message-ID: <CAD=FV=UxTDkwr8Z43TGXjpU6bKRN3ns2BdShKehAga4gkLUpLQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clk: qcom: Add modem clock controller driver for SC7180
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 26, 2019 at 8:43 PM Taniya Das <tdas@codeaurora.org> wrote:
>
> Add support for the modem clock controller found on SC7180
> based devices. This would allow modem drivers to probe and
> control their clocks.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/Kconfig      |  9 +++++
>  drivers/clk/qcom/Makefile     |  1 +
>  drivers/clk/qcom/gcc-sc7180.c | 70 ++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/mss-sc7180.c | 94 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 174 insertions(+)
>  create mode 100644 drivers/clk/qcom/mss-sc7180.c
>
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 3b33ef1..5d4b6e5 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -245,6 +245,15 @@ config SC_GCC_7180
>           Say Y if you want to use peripheral devices such as UART, SPI,
>           I2C, USB, UFS, SDCC, etc.
>
> +config SC_MSS_7180
> +       tristate "SC7180 MSS Clock Controller"
> +       select SC_GCC_7180
> +       help
> +         Support for the MSS clock controller on Qualcomm Technologies, Inc
> +         SC7180 devices.
> +         Say Y if you want to use the MSS branch clocks of the MSS clock
> +         controller to reset the MSS subsystem.

I didn't review your whole patch, but I was skimming through things
and trying to figure out what the heck a "MSS" clock was for a while
before I finally thought to look at the commit message and figured out
that it probably means "modem subsystem".  I assume you're going to
spin this patch somewhat soon.  When you do, can you please expand the
"MSS" acronym somewhere in your KConfig description?

Thanks!

-Doug
