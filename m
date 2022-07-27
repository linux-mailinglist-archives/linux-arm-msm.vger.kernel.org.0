Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A53C6583243
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 20:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238877AbiG0SoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jul 2022 14:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243217AbiG0SoE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jul 2022 14:44:04 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1451A1101
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 10:40:43 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id v17so2840052edc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 10:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=fvcBspaXwtQ8UlPkEV+dRJPq7S+l9Y7n+jrnxZWjDBc=;
        b=W7zYwejzKcjmsfHqUm2v6YWHlBkLZ0/XcurfEMRBRJD2c+2wA28gDiDH+tAOWeqUBX
         LzeXW/PMHjUupnWeQe8NAwDszG8t3skLjD689OPl68wBRdro/GMMdLV4l7xkDl2yMIxZ
         zcIDGOaVUzMZbXZFOIIqveayAbIJ8CgSdQ18s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=fvcBspaXwtQ8UlPkEV+dRJPq7S+l9Y7n+jrnxZWjDBc=;
        b=ENoLoQovR+kOOGT6rAoQZqgl827lH1YC2mslFIjC6nNgAhui0fNiJkgSQXLdu2u6Lr
         6MY9xzp9dKG89qj2q+tCjA79kHoPQm0ADXtNU5XOqsm8KKquyiZmL/yuGei2xZam+4hT
         XRi6ONWuIS5hdz37XMJEomW6zjUfXB12swb+s31cCQcYOiE7bW07y4wSjrcjSyDtH15e
         NI5isaA70ZDBV4AYwbWyPZbuxX51GsBL4PR2y9h3ank+HoirQwkcho8aZQ6VIo4S4IA2
         1XPni/EjRGNqVYymMFdUwkET+iJ0TXURrPBO24jDny6gJPxYwn+ISOHUlSoOvFiasIGx
         cDcw==
X-Gm-Message-State: AJIora/EqCgeFzYZn6koxxnqCR1Hu3pl0UDk8A9sXGhPIdpNQY5EAKg/
        HqKW87hZAzOw/Z/TRbGwAxhwmtNzGM/ms4tLwe8=
X-Google-Smtp-Source: AGRyM1v5eebZNALoYgZHWrW9B5ELsF+DOqLXfN2oV5sN+TLOvr+ySBLbqeIEbR7kMhU5BTrcZzy1XA==
X-Received: by 2002:a05:6402:190d:b0:43c:479c:b850 with SMTP id e13-20020a056402190d00b0043c479cb850mr9547484edz.140.1658943642190;
        Wed, 27 Jul 2022 10:40:42 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id gr19-20020a170906e2d300b0072b2f95d5d1sm7870693ejb.170.2022.07.27.10.40.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 10:40:40 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id bn9so14640295wrb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 10:40:39 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr15255140wrr.617.1658943639429; Wed, 27
 Jul 2022 10:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220726212354.1.I5b9006878bdabd6493b866b46dbd6149968d545b@changeid>
 <20220727160320.GA2755147-robh@kernel.org>
In-Reply-To: <20220727160320.GA2755147-robh@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 27 Jul 2022 10:40:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U8ek0FR=hZwemK5JcbUP=JsnRTtv7WzJKmOb-UFwHfXA@mail.gmail.com>
Message-ID: <CAD=FV=U8ek0FR=hZwemK5JcbUP=JsnRTtv7WzJKmOb-UFwHfXA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: document zoglin board
To:     Rob Herring <robh@kernel.org>
Cc:     Bob Moragues <moragues@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bob Moragues <moragues@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 27, 2022 at 9:03 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jul 26, 2022 at 09:24:31PM -0700, Bob Moragues wrote:
> > Zoglin is a Hoglin Chromebook with SPI Flash reduced from 64MB to 8MB.
> > Zoglin is identical to Hoglin except for the SPI Flash.
> > The actual SPI Flash is dynamically probed at and not specified in DTS.
> >
> > Signed-off-by: Bob Moragues <moragues@chromium.org>
> >
> > Signed-off-by: Bob Moragues <moragues@google.com>
> > ---
> >
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > index 581485392404..63091df3cbb3 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -475,6 +475,7 @@ properties:
> >
> >        - description: Qualcomm Technologies, Inc. sc7280 CRD platform (newest rev)
> >          items:
> > +          - const: google,zoglin
> >            - const: google,hoglin
> >            - const: qcom,sc7280
>
> Is just "google,hoglin", "qcom,sc7280" no longer valid? If it is valid,
> you need another entry.

If it makes people happy to have another entry then it wouldn't hurt,
but it has no long term benefit and I would recommend against it. The
next patch in this series changes the existing "hoglin" device tree to
have all 3 compatible strings and thus when both patches land then
make dtbs_check will pass. I assume that is the only goal of
documenting these boards here. Certainly if you had a device tree that
had only "google,zoglin" it would boot fine on zoglin devices and if
you had a device tree that had only "google,hoglin" it would boot fine
on hoglin device. This is true of all of the entries for Chromebooks
that have multiple compatible entries.

-Doug
