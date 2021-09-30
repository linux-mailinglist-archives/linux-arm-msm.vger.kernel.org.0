Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 225CD41DED7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 18:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350194AbhI3QXq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 12:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350170AbhI3QXp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 12:23:45 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D8DC06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 09:22:02 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id r75so8314581iod.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 09:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=epvV5OFxtWVaDKtxvaeP7rQzmrodzb860ily1GpnXVI=;
        b=QjTmiIvRctqbY2MexuHHlGMtimOLqNFtG4VIVF01zB/LjbMtvnAm2N5o8Du2mWQS/S
         LhnA34O0uAoeBoW3Y3lAYNPM/fK+25pYdG4Mjb/CThFOo7nXZmO4ky/MaLF1qFtBMbTJ
         eND4RpLjQbASu+FzknZQQZc6A0pK8xBd0+iKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=epvV5OFxtWVaDKtxvaeP7rQzmrodzb860ily1GpnXVI=;
        b=mCcaBVtRetKcdYYPdOf7vNXzFLbMWxD/fZ5XlOEqqXXw5JHMEjfbH2Id5cNkDR1Wur
         ji8KdznEqU9sUVunDEXKrCdx7rxLP0xqnKsssckjsJlSXDExIrfY38TPox4vrLEvrted
         XxiJjbXl0ObHZ74vErYzONSo+rjEpmSvEsJgDPtFDshT9iTD/IxDiw8qBhS43oQ8LhIO
         Gvhr9Li8gSms8+aACZHWutdxsB5Vvc6a8VrIZAHS10YY74AieOUOrteVR+hV54fkdLTD
         CxiCCpOlkeVjtbGGrMb8tvhgf+zZ/TPEi1lXFZ+NYB8065QODdFQXpulkN04z4/cU0DJ
         LJdg==
X-Gm-Message-State: AOAM5321EJAEAyce9cLu2W7VK4WcvglsYXhN8lZOgCOiG7arsF0/QU3Z
        l9gfEAGlx+kJKSa6lTOMRuTqODgQphchkw==
X-Google-Smtp-Source: ABdhPJzybue24bgWRXjfsO09cffiC3pbByQ1JZ+gPMOoEVPBl0ICTd7d7XuxkCw/i+8gUvfy+MVu5g==
X-Received: by 2002:a02:6387:: with SMTP id j129mr5605113jac.147.1633018922148;
        Thu, 30 Sep 2021 09:22:02 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id w18sm257049ilc.72.2021.09.30.09.22.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 09:22:01 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id e144so8316769iof.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 09:22:00 -0700 (PDT)
X-Received: by 2002:a05:6638:268c:: with SMTP id o12mr5760073jat.54.1633018920055;
 Thu, 30 Sep 2021 09:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210929173343.v2.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
 <20210929173343.v2.3.I630340a51130f4582dbe14e42f673b74e0531a2b@changeid> <CAE-0n53EBvKv-RdMwiiOsUkb+LOKAKwrpP7cDavx4meA2vbvcA@mail.gmail.com>
In-Reply-To: <CAE-0n53EBvKv-RdMwiiOsUkb+LOKAKwrpP7cDavx4meA2vbvcA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 30 Sep 2021 09:21:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XoOhSNP2EXurkA=G9iG2BnH9VzkvSEiNJ8W71s8N9bgg@mail.gmail.com>
Message-ID: <CAD=FV=XoOhSNP2EXurkA=G9iG2BnH9VzkvSEiNJ8W71s8N9bgg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: sc7180: Support Parade ps8640 edp bridge
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Philip Chen <philipchen@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Sep 29, 2021 at 9:02 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> > +       pp3300_brij_ps8640: pp3300-brij-ps8640 {
> > +               compatible = "regulator-fixed";
> > +               status = "okay";
> > +               regulator-name = "pp3300_brij_ps8640";
> > +
> > +               regulator-min-microvolt = <3300000>;
> > +               regulator-max-microvolt = <3300000>;
> > +
> > +               gpio = <&tlmm 32 GPIO_ACTIVE_HIGH>;
>
> Doesn't this need
>
>                 enable-active-high;

Looks like it. Without that it looks like it assumes active low.


> > +
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&en_pp3300_edp_brij_ps8640>;
> > +
> > +               vin-supply = <&pp3300_a>;
> > +       };
> > +};
> > +
> > +&dsi0_out {
> > +       remote-endpoint = <&ps8640_in>;
>
> Should this also have data-lanes to be "complete"?

That's still back in the main trogdor.dtsi, isn't it?


> > +edp_brij_i2c: &i2c2 {
> > +       status = "okay";
> > +       clock-frequency = <400000>;
> > +
> > +       ps8640_bridge: edp-bridge@8 {
>
> Just bridge@8 to match ti bridge? Also, is the label used? If not
> please drop it.

I agree with Stephen about it being "bridge@8". Personally I don't
mind labels like this even if they're not used since they don't hurt
and it creates less churn to add them now, but I won't fight hard to
keep them.


> > +               aux_bus: aux-bus {
>
> Is this label used either?

Yeah, I'd get rid of this one since there you didn't add it in the
sn65dsi86 dtsi file and it seems exceedingly unlikely we'd need it for
any reason.

-Doug
