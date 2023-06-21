Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD8BD738B4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 18:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbjFUQco (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 12:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbjFUQck (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 12:32:40 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018461706
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 09:32:07 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9889952ed18so567709766b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 09:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687365123; x=1689957123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUR14yvWhA8hLAvpHabjnwRobvun0SbNNcqEoPzoLYM=;
        b=FB+WxQrtn22pWkBaYz3afcjpEEoYdikv3PizQ/owDe234uBt9XSIbgX2FxDAu7Oh9+
         EhrfJ1NUx75ohxEZxkBY+eBd4DLQOrOdwp1viVkFe4cY/U+Qfw6ZLdGczH8HyB6Qfhlo
         m3ezYeOUydWBg7NvYMsjxpegsdcNpL/b5cf64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687365123; x=1689957123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUR14yvWhA8hLAvpHabjnwRobvun0SbNNcqEoPzoLYM=;
        b=eSqq0oS7grXK9snuED8bgWM6n208VpJDbwH+6QVm9ijk0vUSJ86R2DBP7eYrO6XU9S
         FQS0+W7vdccQefeqMYHI9/fyChbGDsXnjJzXbIo9UizcoI3hqRUK2HRaz566LHYU0Vlk
         cautIflb0NvLMukrZXF0qRFfC2mn20zXKIDbKllaRg4svNhvE4vpTS8Z9sKbhW6WyCgU
         EMyPmAvN8zR79UHPujZfsbnZNptACweXWT3UOlZdoX4wzSKd0xJaHa3VjgBTHoNPM52D
         mi2Ecs6WSyr+EQSPimLuJY8ZbwUMrYeinu1Qzu7NLaDduxo8GpaVRlJXac0chrhhHRJU
         xR8A==
X-Gm-Message-State: AC+VfDyPp/dbhUabwXRraeRcooo+jd//zM0vf8YJydbzr8y08c4brINM
        9NV1CiFfG9/HOn81VBATD5jZua4dj3zZa965U+Mw9z3w
X-Google-Smtp-Source: ACHHUZ6BDVIUVYCc0qihLAKur8KHLuycVhbhU9zZ6WjvAOxdxa6p8AeOmkbRwG+jwoPysmazkWh2gQ==
X-Received: by 2002:a17:907:6d9c:b0:988:a642:1840 with SMTP id sb28-20020a1709076d9c00b00988a6421840mr8227263ejc.39.1687365123593;
        Wed, 21 Jun 2023 09:32:03 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id a11-20020a170906274b00b009783791b1a1sm3356606ejd.121.2023.06.21.09.32.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 09:32:03 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f9b9863bfdso140805e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 09:32:03 -0700 (PDT)
X-Received: by 2002:a50:d79a:0:b0:506:b280:4993 with SMTP id
 w26-20020a50d79a000000b00506b2804993mr35434edi.2.1687365102841; Wed, 21 Jun
 2023 09:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230607215224.2067679-1-dianders@chromium.org>
 <jehxiy3z4aieop5qgzmlon4u76n7gvt3kc6knxhb5yqkiz3rsp@mx27m75sx43r>
 <CAD=FV=Wr7Xatw1LsofiZ5Xx7WBvAuMMdq4D5Po1yJUC1VdtZdg@mail.gmail.com>
 <z7wi4z4lxpkhvooqhihlkpubyvueb37gvrpmwk6v7xwj2lm6jn@b7rwyr5ic5x5>
 <CAD=FV=XnANRM=+2D9+DzcXx9Gw6iKKQsgkAiq8=izNEN-91f_Q@mail.gmail.com>
 <boqzlmbrp5rvepmckkqht4h5auspjlbt5leam4xivy7a4bqxnj@iuxxhooxcphk> <CAD=FV=VO=GE5BEw6kKK19Qj9tcia509Pb-bvMcq0uA05sVLvHw@mail.gmail.com>
In-Reply-To: <CAD=FV=VO=GE5BEw6kKK19Qj9tcia509Pb-bvMcq0uA05sVLvHw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 21 Jun 2023 09:31:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W4Cy1OiQj0JmQEJS4wFqJXSoYXna1-PUi6xL9+fwuq8Q@mail.gmail.com>
Message-ID: <CAD=FV=W4Cy1OiQj0JmQEJS4wFqJXSoYXna1-PUi6xL9+fwuq8Q@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Maxime,

On Tue, Jun 13, 2023 at 8:56=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Jun 13, 2023 at 5:06=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > > > What I'm trying to say is: could we just make it work by passing a =
bunch
> > > > of platform_data, 2-3 callbacks and a device registration from the =
panel
> > > > driver directly?
> > >
> > > I think I'm still confused about what you're proposing. Sorry! :( Let
> > > me try rephrasing why I'm confused and perhaps we can get on the same
> > > page. :-)
> > >
> > > First, I guess I'm confused about how you have one of these devices
> > > "register" the other device.
> > >
> > > I can understand how one device might "register" its sub-devices in
> > > the MFD case. To make it concrete, we can look at a PMIC like
> > > max77686.c. The parent MFD device gets probed and then it's in charge
> > > of creating all of its sub-devices. These sub-devices are intimately
> > > tied to one another. They have shared data structures and can
> > > coordinate power sequencing and whatnot. All good.
> >
> > We don't necessarily need to use MFD, but yeah, we could just register =
a
> > device for the i2c-hid driver to probe from (using
> > i2c_new_client_device?)
>
> I think this can work for devices where the panel and touchscreen are
> truly integrated where the panel driver knows enough about the related
> touchscreen to fully describe and instantiate it. It doesn't work
> quite as well for cases where the power and reset lines are shared
> just because of what a given board designer did. To handle that, each
> panel driver would need to get enough DT properties added to it so
> that it could fully describe any arbitrary touchscreen, right?
>
> Let's think about the generic panel-edp driver. This driver runs the
> panel on many sc7180-trogdor laptops, including coachz, lazor, and
> pompom. All three of those boards have a shared power rail for the
> touchscreen and panel. If you look at "sc7180-trogdor-coachz.dtsi",
> you can see the touchscreen currently looks like this:
>
> ap_ts: touchscreen@5d {
>     compatible =3D "goodix,gt7375p";
>     reg =3D <0x5d>;
>     pinctrl-names =3D "default";
>     pinctrl-0 =3D <&ts_int_l>, <&ts_reset_l>;
>
>     interrupt-parent =3D <&tlmm>;
>     interrupts =3D <9 IRQ_TYPE_LEVEL_LOW>;
>
>     reset-gpios =3D <&tlmm 8 GPIO_ACTIVE_LOW>;
>
>     vdd-supply =3D <&pp3300_ts>;
> };
>
> In "sc7180-trogdor-lazor.dtsi" we have:
>
> ap_ts: touchscreen@10 {
>     compatible =3D "hid-over-i2c";
>     reg =3D <0x10>;
>     pinctrl-names =3D "default";
>     pinctrl-0 =3D <&ts_int_l>, <&ts_reset_l>;
>
>     interrupt-parent =3D <&tlmm>;
>     interrupts =3D <9 IRQ_TYPE_LEVEL_LOW>;
>
>     post-power-on-delay-ms =3D <20>;
>     hid-descr-addr =3D <0x0001>;
>
>     vdd-supply =3D <&pp3300_ts>;
> };
>
> In both cases "pp3300_ts" is simply another name for "pp3300_dx_edp"
>
> So I think to do what you propose, we need to add this information to
> the panel-edp DT node so that it could dynamically construct the i2c
> device for the touchscreen:
>
> a) Which touchscreen is actually connected (generic hid-over-i2c,
> goodix, ...). I guess this would be a "compatible" string?
>
> b) Which i2c bus that device is hooked up to.
>
> c) Which i2c address that device is hooked up to.
>
> d) What the touchscreen interrupt GPIO is.
>
> e) Possibly what the "hid-descr-addr" for the touchscreen is.
>
> f) Any extra timing information needed to be passed to the touchscreen
> driver, like "post-power-on-delay-ms"
>
> The "pinctrl" stuff would be easy to subsume into the panel's DT node,
> at least. ...and, in this case, we could skip the "vdd-supply" since
> the panel and eDP are sharing power rails (which is what got us into
> this situation). ...but, the above is still a lot. At this point, it
> would make sense to have a sub-node under the panel to describe it,
> which we could do but it starts to feel weird. We'd essentially be
> describing an i2c device but not under the i2c controller it belongs
> to.
>
> I guess I'd also say that the above design also need additional code
> if/when someone had a touchscreen that used a different communication
> method, like SPI.
>
>
> So I guess the tl;dr of all the above is that I think it could all work i=
f:
>
> 1. We described the touchscreen in a sub-node of the panel.
>
> 2. We added a property to the panel saying what the true parent of the
> touchscreen was (an I2C controller, a SPI controller, ...) and what
> type of controller it was ("SPI" vs "I2C").
>
> 3. We added some generic helpers that panels could call that would
> understand how to instantiate the touchscreen under the appropriate
> controller.
>
> 4. From there, we added a new private / generic API between panels and
> touchscreens letting them know that the panel was turning on/off.
>
> That seems much more complex to me, though. It also seems like an
> awkward way to describe it in DT.
>
>
> > > In any case, is there any chance that we're in violent agreement
> >
> > Is it even violent? Sorry if it came across that way, it's really isn't
> > on my end.
>
> Sorry, maybe a poor choice of words on my end. I've heard that term
> thrown about when two people spend a lot of time discussing something
> / trying to persuade the other person only to find out in the end that
> they were both on the same side of the issue. ;-)
>
>
> > > and that if you dig into my design more you might like it? Other than
> > > the fact that the panel doesn't "register" the touchscreen device, it
> > > kinda sounds as if what my patches are already doing is roughly what
> > > you're describing. The touchscreen and panel driver are really just
> > > coordinating with each other through a shared data structure (struct
> > > drm_panel_follower) that has a few callback functions. Just like with
> > > "hdmi-codec", the devices probe separately but find each other throug=
h
> > > a phandle. The coordination between the two happens through a few
> > > simple helper functions.
> >
> > I guess we very much agree on the end-goal, and I'd really like to get
> > this addressed somehow. There's a couple of things I'm not really
> > sold on with your proposal though:
> >
> >  - It creates a ad-hoc KMS API for some problem that looks fairly
> >    generic. It's also redundant with the notifier mechanism without
> >    using it (probably for the best though).
> >
> >  - MIPI-DSI panel probe sequence is already fairly complex and fragile
> >    (See https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html=
#special-care-with-mipi-dsi-bridges).
> >    I'd rather avoid creating a new dependency in that graph.
> >
> >  - And yeah, to some extent it's inconsistent with how we dealt with
> >    secondary devices in KMS so far.
>
> Hmmmm. To a large extent, my current implementation actually has no
> impact on the DRM probe sequence. The panel itself never looks for the
> touchscreen code and everything DRM-related can register without a
> care in the world. From reading your bullet points, I guess that's
> both a strength and a weakness of my current proposal. It's really
> outside the world of bridge chains and DRM components which makes it a
> special snowflake that people need to understand on its own. ...but,
> at the same time, the fact that it is outside all the rest of that
> stuff means it doesn't add complexity to an already complex system.
>
> I guess I'd point to the panel backlight as a preexisting design
> that's not totally unlike what I'm doing. The backlight is not part of
> the DRM bridge chain and doesn't fit in like other components. This
> actually makes sense since the backlight doesn't take in or put out
> video data and it's simply something associated with the panel. The
> backlight also has a loose connection to the panel driver and a given
> panel could be associated with any number of different backlight
> drivers depending on the board design. I guess one difference between
> the backlight and what I'm doing with "panel follower" is that we
> typically don't let the panel probe until after the backlight has
> probed. In the case of my "panel follower" proposal it's the opposite.
> As per above, from a DRM probe point of view this actually makes my
> proposal less intrusive. I guess also a difference between backlight
> and "panel follower" is that I allow an arbitrary number of followers
> but there's only one backlight.
>
> One additional note: if I actually make the panel probe function start
> registering the touchscreen, that actually _does_ add more complexity
> to the already complex DRM probe ordering. It's yet another thing that
> could fail and/or defer...
>
> Also, I'm curious: would my proposal be more or less palatable if I
> made it less generic? Instead of "panel follower", I could hardcode it
> to "touchscreen" and then remove all the list management. From a DRM
> point of view this would make it even more like the preexisting
> "backlight" except for the ordering difference.

I'm trying to figure out what the next steps are here. I can send a v3
and address Benjamin's comments on the i2c-hid side, but I'd like to
get some resolution on our conversation here, too. Did my thoughts
above make sense? I know that "panel follower" isn't a
beautiful/elegant framework, but IMO it isn't not too bad. It
accomplishes the goal and mostly stays out of the way.

If you don't have time to dig into all of this now, would you object
if I can find someone else willing to review my series from a drm
perspective?

Thanks!

-Doug
