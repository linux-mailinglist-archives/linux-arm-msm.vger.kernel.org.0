Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93CAB121E98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 23:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfLPWxf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 17:53:35 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:41955 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbfLPWxf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 17:53:35 -0500
Received: by mail-io1-f65.google.com with SMTP id c16so8870058ioo.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 14:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RugfqCxXsqYSRLxdCfLtMG45h5Ag2X4I9A7YwT1uN7E=;
        b=XXZ+IGap9OUYsoKu59QewkNCOK0PFVk9ggPbUG2iuRZrpAd1IwXtlYzIauvXVxZgdN
         2m+S0vc8GNHb84/lT2PaIxA6EKyjo3TGFy5u0ZMHHxFjHOWc7IOm9l5hays3CfhoSYK0
         kduSEGqRf0WKJKsOfN1Xyc5jieOlDPE4GZRwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RugfqCxXsqYSRLxdCfLtMG45h5Ag2X4I9A7YwT1uN7E=;
        b=n3jx+yBeZFytTcNRr98IMx8fyLJYQg44P/Yyrl2rbRAwA7+j8bckMaGFLoV0wETWvP
         c7CpLooI+auwTj13FtsYJfpNPtL9oruxkWLtjiXyOjlOc0pja2rwVJyb8bj78NHnlcqt
         J6Lh4xM7F1xP9wXkLO6iHgLGJw/NLgFgP3l/aTGhh9v5eJVGmQqqkLo7O2IOGliBdWDV
         P7SP7Lzpko1NYVjlMFyBFBOs2zK5tU8E8zDE/B1ir2D8ybxoC1N1mOPRGvF7NIDok96l
         XPh9t7oO58rnllMsLrzShD+pa39MoOubwNbFlsAL6DpVwqFIYVJxkN4cclglx1E2UY9R
         uGsQ==
X-Gm-Message-State: APjAAAW3XxeZW/MzJ/zmE1NnPbUm/ze+mc77VkmLOMZvKQm2Ycs9pc4V
        tGHkaJW4UioKmDaXyOlONneMKDRGFdU=
X-Google-Smtp-Source: APXvYqwODCl8rW4mpBKAO1C+JFJTV9spsXtg7TyD/ckAhdgvUMLVDegULip4vYpLY+Jw2eyiR2yO0g==
X-Received: by 2002:a5d:8744:: with SMTP id k4mr1365164iol.227.1576536814555;
        Mon, 16 Dec 2019 14:53:34 -0800 (PST)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id l20sm1374308iob.3.2019.12.16.14.53.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 14:53:33 -0800 (PST)
Received: by mail-il1-f178.google.com with SMTP id p8so6761994iln.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 14:53:33 -0800 (PST)
X-Received: by 2002:a92:da44:: with SMTP id p4mr3093146ilq.168.1576536813310;
 Mon, 16 Dec 2019 14:53:33 -0800 (PST)
MIME-Version: 1.0
References: <20191216211613.131275-1-swboyd@chromium.org>
In-Reply-To: <20191216211613.131275-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 16 Dec 2019 14:53:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Urn0ZhQSaVBkdq0hTEqe=bDP0KPz87Rd4B_bCF2CoFUA@mail.gmail.com>
Message-ID: <CAD=FV=Urn0ZhQSaVBkdq0hTEqe=bDP0KPz87Rd4B_bCF2CoFUA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-cheza: Add cr50 spi node
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Dec 16, 2019 at 1:16 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Add the cr50 device to the spi controller it is attached to. This
> enables /dev/tpm0 and some login things on Cheza.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index 9a4ff57fc877..f6683460dc82 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -651,6 +651,20 @@ &spi0 {
>         status = "okay";
>  };
>
> +&spi5 {
> +       status = "okay";
> +
> +       cr50@0 {

Between v2 and v3 of your upstream bindings you changed this from
"cr50@0" to "tpm@0" in the example.  I'm going to assume you did that
for some reason and you should be matching the binding example here.
...or you should change the binding example to be cr50@.


> +               compatible = "google,cr50";
> +               reg = <0>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&h1_ap_int_odl>;
> +               spi-max-frequency = <800000>;
> +               interrupt-parent = <&tlmm>;
> +               interrupts = <129 IRQ_TYPE_EDGE_RISING>;

Certainly we need an interrupt, but I don't see it in the bindings.
Any idea why it isn't there?


-Doug
