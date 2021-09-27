Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4CE419FA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 21:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236715AbhI0UAq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 16:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236655AbhI0UAp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 16:00:45 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F034C061604
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 12:59:07 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so20286741otb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 12:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Zu4vVZfjBvQG3c6lbaKUHBCzEAuiakqkbk50f2WpbsU=;
        b=AUyYGatR0L+ZAKRYrOlQa80vyKI4RtAEG94vt6NYNKIOWE0vptxcS8+qUX7Sz1357u
         qpszknbOqc9pLBVdgtyIF48d3cQmUmSaSCzlDuVJzvRytz/cGUZOITkkYWDoum4Ns3xf
         qAoNh30tgT2G3Y9Anl4BqRWEJGJG3AgH2h0Hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Zu4vVZfjBvQG3c6lbaKUHBCzEAuiakqkbk50f2WpbsU=;
        b=TQCoggR4jxnYz3k4yy0eEyvVpbWkp2RA/DbxWlm8wO32gh9d39rb7IP1yIj+r5ZQi3
         Q/V1VGm6wOGUitTo96fhJr4fbnjxWAP95g+sTivn2jx0RR26TTiYPTI6pxPf3xP93155
         2vOd9R3/gqjLQWSr7cnxilAlAvGpiAiQgq2AQP0HOPRUP3YpMjmql64Z0jJ/bdrXHRCJ
         3o4a3KBJF08bAVmphvKz8WvZJN89XZibh2ZokRZTNiXKc/pYmewQgISMiVF2F/oZYB0c
         L2UKLckvGt6m0b/UVf4sGJroUG3SWoBKpk1KOLG6QbnOc+KJzjl+Sa6n9dJ+J180BkU3
         5PMw==
X-Gm-Message-State: AOAM531jxAhydQkiRg9ENCLCdhZmFzvhUjP9JTBCAoqBS/UPeRVj85UG
        5c4GKuPPC1pB3gfH50fSX0sg4FvVvpXYegk889GGiw==
X-Google-Smtp-Source: ABdhPJy55etq8fVl9RMOyOF/0w7JpQU+TZK4qTsk4iPj6m0oB6kxb3YiQ0adJRdVSHKh0ncjuHvTRXnwExL89xLGtTA=
X-Received: by 2002:a05:6830:708:: with SMTP id y8mr1581379ots.77.1632772746544;
 Mon, 27 Sep 2021 12:59:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Sep 2021 12:59:05 -0700
MIME-Version: 1.0
In-Reply-To: <20210924165322.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
References: <20210924165322.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 27 Sep 2021 12:59:05 -0700
Message-ID: <CAE-0n53uBf-qbPptg-=9TX3=FGG4PvtVARfipxriJRE6cdWt4A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sc7180: Factor out ti-sn65dsi86 support
To:     LKML <linux-kernel@vger.kernel.org>,
        Philip Chen <philipchen@chromium.org>
Cc:     dianders@chromium.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Philip Chen (2021-09-24 16:54:13)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
> new file mode 100644
> index 000000000000..7b1034a5a8e9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Trogdor dts fragment for the boards with TI sn65dsi86 edp bridge
> + *
> + * Copyright 2021 Google LLC.
> + */
> +
> +&dsi0_out {
> +       remote-endpoint = <&sn65dsi86_in>;
> +       data-lanes = <0 1 2 3>;
> +};
> +
> +&edp_brij_i2c {
> +       sn65dsi86_bridge: bridge@2d {
> +               compatible = "ti,sn65dsi86";
> +               reg = <0x2d>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&edp_brij_en>, <&edp_brij_irq>;

Why not move edp_brij_en as well? I think you want to reuse the node
name for the other bridge, but it doesn't make sense unless that other
patch is part of this series.

> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-parent = <&tlmm>;
> +               interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
> +
> +               enable-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
