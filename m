Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA02F41B8BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 22:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242792AbhI1U4I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 16:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242572AbhI1U4H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 16:56:07 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3107C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 13:54:27 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so119101otq.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 13:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=xv0aAGE5pADH0iB1mtL8/0AzpzK5WiYw7HycOHRo6qk=;
        b=hWMyj4swmETDbFT2TTJtKNP29AOWP2M4nuPVQLPgnLgp15KRXGy0asFZp/RBSPFsqD
         FvOoTQWIoSs30yIvhkgD90OhxO89jOsAT3uh92F4FZjJRi7QPzPj/BVnrDsZpVe5aSuZ
         mHutseh9cIYuupbYb2NGL0rc5Bp6Mc3SvNbDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=xv0aAGE5pADH0iB1mtL8/0AzpzK5WiYw7HycOHRo6qk=;
        b=4v2/XEmGRV82e22alBxq29Q60WtvY6NjR7/j7UEeTQSTxKsSllhtZHcmTD5P6ccZTP
         tpnpAd5yNLS7SARWWgU6mtCZIiZezFOJWZ8lzZZkOwC4is5QtIHghvN3PLrfmJUMXNwd
         xpQpHwCsis9yz1gYECPip4XoRTCVMVGOlnGQwizcOg+rnzI0MGDGDt5kYBWJea1NScb/
         oO4nb+3BwZqOCUaylybEbcfwK5p9XfBf0zsuHHjpR9TS9D1sOiqUG5oy2j1bKcAznzx9
         KrBQzUaqgwSN6Zsyqt/fTTfxL3bx3tKR+PASZV9fxb/AHp0ocd3G5/nnYniLBf/1sR93
         LNhw==
X-Gm-Message-State: AOAM5324EmnRBABOmgNP4CuZsdWbVTiu/ZtTCPynWOc8RK2FSRKLYEWh
        bbwbz6yXLYqwfMvR3SF5INdKlbVkV4a4VnYlSlw5+g==
X-Google-Smtp-Source: ABdhPJx4hWeVlhQnSZqv1x3P26gHXeqCB8PnjGZ5cB1QP9XvecnwMKMNBh0Wi8TKUOsSzbzxP40VeMX9sIBE+cK89Pw=
X-Received: by 2002:a05:6830:358:: with SMTP id h24mr6676714ote.159.1632862467044;
 Tue, 28 Sep 2021 13:54:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Sep 2021 13:54:26 -0700
MIME-Version: 1.0
In-Reply-To: <20210927184858.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
References: <20210927184858.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 28 Sep 2021 13:54:26 -0700
Message-ID: <CAE-0n506JaDYzX_AXnL_eq9hDSPF1Lfxyd7chr=uYkxFkJHy6w@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: sc7180: Factor out ti-sn65dsi86 support
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

Quoting Philip Chen (2021-09-27 18:49:39)
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

I still don't see edp_brij_en used in the second patch so why didn't
this pinctrl node move to this file like edp_brij_irq did?

> +               gpio-controller;
> +               #gpio-cells = <2>;
