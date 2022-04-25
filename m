Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6906F50EB40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 23:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239588AbiDYVWC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 17:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236884AbiDYVWC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 17:22:02 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E23FD0817
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 14:18:57 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id z19so6744281edx.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 14:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=24iOF1MSGz5s6cCyjfamucZLvCAzW+z+udRAosCU0zY=;
        b=IKCjLomd/fBFKtHP7jTm5t+W2FCOv7AOIpQTxPrtj949PY1Tsrb/D6jZuxB1xNoSYP
         GWBX5KG9TOQnKlzchsow3SoefF2kBW7rQ2HKQYl95HTmbBgI32JNTGqDNermeWSyTZtL
         Hf42Do0mf0k3Q96cMYnFlH/CAVL53m+8sBlv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=24iOF1MSGz5s6cCyjfamucZLvCAzW+z+udRAosCU0zY=;
        b=QSOSZh21HvQxoTGoD7bJ26PcWGB4Cps5aaD4ZmC2xNmtBXgRf31qVHWMjxY6g5mD9f
         BCpkwU4HW5XdOrpJX8fuMylXrGQNiWcHn6SRUozS2PlHfBWGmoZDAKgCrMnhR6GialFE
         cCGROLlzr0rUQFGXAqIA060LAK3EiWXHfnoLIh0lwkZ482F8WEvYQfQ/a69Itt1nespO
         h9tjaWrznRJ8LDZHCl6A6rVSVujFHaZwJOaS3ha3q0BrqOy6vh8JUeMA7gg4sm0p05fA
         9bh0SCWiZBAI6isXeGBNwLTkPX1SPCLDA8BhVW6EQrWeeON+E2z8F2u7lz6Tlx4/9wFa
         nUfw==
X-Gm-Message-State: AOAM531R1bXLxEgG+Soe4yoM0HoalkVyyIzKYHoWw3ox57Tba5xXrhD4
        SW/W+xXhfO2KjZAdsRP1vpRJP7z9yUKURufd
X-Google-Smtp-Source: ABdhPJwcqNRaf2IkwDJLFdNiugrERPoXbEdjdCO25DQFCOb+44uyd4/PNMk/PzvrVAYBIkk0Ilk8TQ==
X-Received: by 2002:a05:6402:4256:b0:425:e639:5da5 with SMTP id g22-20020a056402425600b00425e6395da5mr8133666edb.314.1650921535392;
        Mon, 25 Apr 2022 14:18:55 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id bl20-20020a170906c25400b006efeef97b1esm3955642ejb.206.2022.04.25.14.18.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 14:18:53 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so344409wmn.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 14:18:52 -0700 (PDT)
X-Received: by 2002:a05:600c:3d0e:b0:38f:f83b:e7dc with SMTP id
 bh14-20020a05600c3d0e00b0038ff83be7dcmr26954889wmb.29.1650921531776; Mon, 25
 Apr 2022 14:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220425210643.2420919-1-dianders@chromium.org>
 <20220425140619.1.Ibfde5a26a7182c4b478d570c23d2649823ac2cce@changeid> <CAE-0n51eZpAKprRQ0HqjLciF_BVQHBDN8SMFNVmmOd=B9UBEzg@mail.gmail.com>
In-Reply-To: <CAE-0n51eZpAKprRQ0HqjLciF_BVQHBDN8SMFNVmmOd=B9UBEzg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 25 Apr 2022 14:18:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmVK3wTQf_EAxSi0WPXedSFGCsKdyqRnHsskmMYTHDQA@mail.gmail.com>
Message-ID: <CAD=FV=WmVK3wTQf_EAxSi0WPXedSFGCsKdyqRnHsskmMYTHDQA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: msm/dp: List supplies in the bindings
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-phy@lists.infradead.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Apr 25, 2022 at 2:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2022-04-25 14:06:42)
> > We're supposed to list the supplies in the dt bindings but there are
> > none in the DP controller bindings. Looking at the Linux driver and
> > existing device trees, we can see that two supplies are expected:
> > - vdda-0p9-supply
> > - vdda-1p2-supply
> >
> > Let's list them both in the bindings. Note that the datasheet for
> > sc7280 doesn't describe these supplies very verbosely. For the 0p9
> > supply, for instance, it says "Power for eDP 0.9 V circuits". This
> > this is obvious from the property name, we don't bother cluttering the
> > bindings with a description.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  .../devicetree/bindings/display/msm/dp-controller.yaml      | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index cd05cfd76536..dba31108db51 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -76,6 +76,9 @@ properties:
> >    "#sound-dai-cells":
> >      const: 0
> >
> > +  vdda-0p9-supply: true
> > +  vdda-1p2-supply: true
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >      properties:
> > @@ -137,6 +140,9 @@ examples:
> >
> >          power-domains = <&rpmhpd SC7180_CX>;
> >
> > +        vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
>
> Having 'a' in 'vdda' typically means 'analog' for 'analog' circuits, so
> I'd expect this to only matter for the phy that contains the analog
> circuitry. It would be great to remove the regulator code from
> drivers/gpu/drm/msm/dp/dp_power.c and move the regulator_set_load() call
> to the phy driver if possible. Hopefully qcom folks can help clarify
> here.

Interesting. Oddly enough, the sc7280 datasheet doesn't list the "_A".
It calls these "VDD_VREF_0P9" and "VDD_VREF_1P2". However, on the
schematic in front of me someone labeled these pins on the sc7280 with
the "A". ...and the driver looks for a supply with the "a". :-/

It would be good to get clarification from someone with better information.

-Doug
