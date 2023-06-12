Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDD3E72D326
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 23:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235651AbjFLVUV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 17:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238672AbjFLVUG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 17:20:06 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8C91BF6
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 14:14:21 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5186a157b85so986711a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 14:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686604459; x=1689196459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=piafe3QLAC9LHm4AYATazedwVeQ9NAHsKdbJCFfjx24=;
        b=eyHxjqGreTIVYD4gfVFkWQ0FPaJ2Y2AZXivsUEOrLQMZy0v9L9xfIsZNlHr8hhJ97y
         GJN0eEwCaj0kmDayFfqQ4VB7mB10VraJb55ab1xcimAjQgCRITz9pjb+x5OWOVia7uDW
         plcAaH9s82ifyuQKeYaEqQToPCfCFOjgGZyTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686604459; x=1689196459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piafe3QLAC9LHm4AYATazedwVeQ9NAHsKdbJCFfjx24=;
        b=IaN9LMHHkoK5hbSXnysSx2ryvFvc1+zjFVf2RvpX/+en2EVfd4hqnJXNeayk8NQP1s
         wuGl83Y5R91dbsxBPOvzXnd0ST+aWkHTIDEqILOlOQ/Jxl0NZIuEbvcRPWGtw1G56/ke
         ZAf5DirMMcBeLAt0vOPcm6WTcUTZ/s9tzxdgI378XVEAhZlBKofcHJ4onTUmRoKd4exv
         CQmPVbIdn4NMFKMTmXCx6rCmfRhJ6Jt9/uuhxQnbPV0bnZlsSDnggwu0LLEp+9t9ZMF5
         ULiiGepRdLsmfxryt3wGg90Mq0WLN36AhlPFC9ME7OpJcA64kEW64A89J3K5Gt4N/A4l
         VaXw==
X-Gm-Message-State: AC+VfDwcI9Hc0On1VNMLOtAQRSonbRMVboZ2qEqWLNUwcpbvw+KktONq
        tbvcTaWSdKI/EcWH51ibiKg2cuUy/Uq31Cn5Mxg7Vw==
X-Google-Smtp-Source: ACHHUZ6OLNsZiG+0V+6mYyH2NEMV2BBiwthbioVuAYQZ8WMBRZjAQt4pG6p6Lk8I18EG4H3WpizJEw==
X-Received: by 2002:a17:907:a0a:b0:974:5e14:29c0 with SMTP id bb10-20020a1709070a0a00b009745e1429c0mr11724475ejc.21.1686604459524;
        Mon, 12 Jun 2023 14:14:19 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id k23-20020a17090627d700b009787b13d1ddsm5708755ejc.51.2023.06.12.14.14.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 14:14:19 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-514ad92d1e3so1171a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 14:14:19 -0700 (PDT)
X-Received: by 2002:a50:9e81:0:b0:514:95d4:c2bb with SMTP id
 a1-20020a509e81000000b0051495d4c2bbmr51305edf.2.1686604438620; Mon, 12 Jun
 2023 14:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230607215224.2067679-1-dianders@chromium.org>
 <jehxiy3z4aieop5qgzmlon4u76n7gvt3kc6knxhb5yqkiz3rsp@mx27m75sx43r>
 <CAD=FV=Wr7Xatw1LsofiZ5Xx7WBvAuMMdq4D5Po1yJUC1VdtZdg@mail.gmail.com> <z7wi4z4lxpkhvooqhihlkpubyvueb37gvrpmwk6v7xwj2lm6jn@b7rwyr5ic5x5>
In-Reply-To: <z7wi4z4lxpkhvooqhihlkpubyvueb37gvrpmwk6v7xwj2lm6jn@b7rwyr5ic5x5>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 12 Jun 2023 14:13:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XnANRM=+2D9+DzcXx9Gw6iKKQsgkAiq8=izNEN-91f_Q@mail.gmail.com>
Message-ID: <CAD=FV=XnANRM=+2D9+DzcXx9Gw6iKKQsgkAiq8=izNEN-91f_Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] drm/panel and i2c-hid: Allow panels and
 touchscreens to power sequence together
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org, hsinyi@google.com,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        linux-arm-msm@vger.kernel.org,
        Chris Morgan <macroalpha82@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jun 12, 2023 at 9:03=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> > > I guess we can have
> > > something much simpler with a bunch of helpers that would register a
> > > i2c-hid device and would be called by the panel driver itself.
> > >
> > > And then, since everything is self-contained managing the power state
> > > becomes easier as well.
> >
> > Can you give me more details about how you think this would work?
> >
> > When you say that the panel would register an i2c-hid device itself,
> > do you mean that we'd do something like give a phandle to the i2c bus
> > to the panel and then the panel would manually instantiate the i2c-hid
> > device on it? ...and I guess it would need to be a "subclass" of
> > i2c-hid that knew about the connection to the panel code? This
> > subclass and the panel code would communicate with each other about
> > power sequencing needs through some private API (like MFD devices
> > usually do?). Assuming I'm understanding correctly, I think that could
> > work.
>
> I guess what I had in mind is to do something similar to what we're
> doing with hdmi-codec already for example.

By this you mean "rockchip,hdmi-codec" and "mediatek,hdmi-codec", right?


> We have several logical components already, in separate drivers, that
> still need some cooperation.
>
> If the panel and touchscreen are on the same i2c bus, I think we could
> even just get a reference to the panel i2c adapter, get a reference, and
> pass that to i2c-hid (with a nice layer of helpers).

Just for reference: the panel and touchscreen aren't on the same i2c
bus. In the cases that I've looked at the panel is either controlled
entirely by eDP or MIPI signals and isn't on any i2c bus at all. The
touchscreen is on the i2c bus in the cases I've looked at, though I
suppose I could imagine one that used a different bus.


> What I'm trying to say is: could we just make it work by passing a bunch
> of platform_data, 2-3 callbacks and a device registration from the panel
> driver directly?

I think I'm still confused about what you're proposing. Sorry! :( Let
me try rephrasing why I'm confused and perhaps we can get on the same
page. :-)

First, I guess I'm confused about how you have one of these devices
"register" the other device.

I can understand how one device might "register" its sub-devices in
the MFD case. To make it concrete, we can look at a PMIC like
max77686.c. The parent MFD device gets probed and then it's in charge
of creating all of its sub-devices. These sub-devices are intimately
tied to one another. They have shared data structures and can
coordinate power sequencing and whatnot. All good.

...but here, we really have something different in two fundamental ways:

a) In this case, the two components (panel and touchscreen) both use
separate primary communication methods. In DT the primary
communication method determines where the device is described in the
hierarchy. For eDP, this means that the DT node for the panel should
be under the eDP controller. For an i2c touchscreen, this means that
the DT node for the touchscreen should be under the i2c controller.
Describing things like this causes the eDP controller to "register"
the panel and the i2c controller to "register" the touchscreen. If we
wanted the panel driver to "register" the touchscreen then it would
get really awkward. Do we leave the touchscreen DT node under the i2c
controller but somehow tell the i2c subsytem not to register it? Do we
try to dynamically construct the touchscreen i2c node? Do we make a
fake i2c controller under our panel DT node and somehow tell the i2c
core to look at it?

b) Things are different because the two devices here are not nearly as
intimately tied to one another. At least in the case of "homestar",
the only reason that the devices were tied to one another was because
the board designers chose to share power rails, but otherwise the
drivers were both generic.


In any case, is there any chance that we're in violent agreement and
that if you dig into my design more you might like it? Other than the
fact that the panel doesn't "register" the touchscreen device, it
kinda sounds as if what my patches are already doing is roughly what
you're describing. The touchscreen and panel driver are really just
coordinating with each other through a shared data structure (struct
drm_panel_follower) that has a few callback functions. Just like with
"hdmi-codec", the devices probe separately but find each other through
a phandle. The coordination between the two happens through a few
simple helper functions.


> > Is it cleaner than my current approach, though?
>
> "cleaner" is subjective, really, but it's a more "mainstream" approach
> that one can follow more easily through function calls.
>
> > I guess, alternatively, we could put the "panel" directly under the
> > i2c bus in this case. That would probably work for Cong Yang's current
> > needs, but we'd end up in trouble if we ever had a similar situation
> > with an eDP panel since eDP panels need to be under the DP-AUX bus.
>
> I don't know DP-AUX very well, what is the issue that you're mentioning?

Hopefully I've explained what I meant above (see point "a)").
