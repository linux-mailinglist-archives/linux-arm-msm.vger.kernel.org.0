Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B54769C9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 18:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232531AbjGaQdo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 12:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233069AbjGaQdi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 12:33:38 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C0F19A3;
        Mon, 31 Jul 2023 09:33:34 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5633b7e5f90so3503635eaf.1;
        Mon, 31 Jul 2023 09:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690821214; x=1691426014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmQIuXbR5JP4gOGoh3m94S+xuhXRrZesJ4DjxqjMHlA=;
        b=JeXgP+w7CMuDnqpJhcpuPl/dg8X263Gotkpx5bJgsnVSDpsqaUEia+zhP602P2UZtE
         9UY0wRDug3iK4MtHi6S0OnH8zrpiqJG5HR7uADrPOe0PGFE+VPdIwcA6Q6xxZkN0JB7Z
         v63ItBfKXxB8YN2mgKYDqJtUAFFZKv2efUYVoVWcNvEN0IkqmeJt86CK3x22pJZ6O6RT
         8Ci33NzRRTUBS8swlUDL13/nYOgBNFh3lQcsDtSS1UcJ8sWB3khon/yuc3p8PTmOwqC9
         R72kN3Cg2ifyiGg9+sFkO0Bm0oyZ+DY8PWT7ID50lGBMruvL3Bz0iewDP6oLJHkSz4PU
         Ayug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690821214; x=1691426014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmQIuXbR5JP4gOGoh3m94S+xuhXRrZesJ4DjxqjMHlA=;
        b=iw/o+41gdDFjRRyIRo5o50gUaRnUMnUahmj6SsMAb+AcRDrQkuy5Gejewfjl8L2Evz
         x9mD1q1NaNA8x4DwICfsrjT613wu3hrCZbC42rb3huONHafliMGqCN9+PW/kio8Tp7j7
         cEsibshwjEisoR01ysKyjjLCiTkMNHkGEYcQgUBf9H5yIrRrZpQpofmy09/OqaudYDVC
         XJJAeZ6vCbO5LXZoA/uY/wPHyJg6jhlnnxlpm5Tp2xxOGWLX5pUO0grTDYtR21Rcw/o5
         98UxI5H1rv/YZTzzKPsXhWeNACrnAdoqK4KyaWIAejY2HWDu9b5RXLChWK5AEKsHK1X0
         660A==
X-Gm-Message-State: ABy/qLYn5iI5gvOOBDPoRboSPgoh4jSjdKPaJCKiyyQUWEbvOgsiL5T/
        +fTtVH5aXS6myhi7Nwg2s6n5CnMqAPRffvMo9fc=
X-Google-Smtp-Source: APBJJlE+NhyxBPQz6UuZPDy2bz3lq06zYg5cvEY5G/En7QKVEhlTaMytpwHnqXO8vKyGUOtYN/2HkwtclOZO0YlYWmw=
X-Received: by 2002:a4a:7548:0:b0:56c:cd0c:1d67 with SMTP id
 g8-20020a4a7548000000b0056ccd0c1d67mr2626954oof.7.1690821213701; Mon, 31 Jul
 2023 09:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230725203545.2260506-1-dianders@chromium.org>
 <20230725133443.v3.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
 <snx3fzvf3icauri2xuigydvpqxtzhp34mptdxvifi7jswm2evy@sx7jr7zwvjw5>
 <CAD=FV=VcsTik+HD11xeDM2Jq9ispcX0-j5QtK8D1qUkrGabRGg@mail.gmail.com> <i3cbgrc365lwscwux2itho6uv74ji3hsjuge4zoxfnlnhacyqc@r73mmifyxffj>
In-Reply-To: <i3cbgrc365lwscwux2itho6uv74ji3hsjuge4zoxfnlnhacyqc@r73mmifyxffj>
From:   Chris Morgan <macroalpha82@gmail.com>
Date:   Mon, 31 Jul 2023 11:33:22 -0500
Message-ID: <CADcbR4JB0h8fByM2Z6diByvWaFprW9GDapBNt+YLWr9-vKoe7A@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] drm/panel: Check for already prepared/enabled in drm_panel
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
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
        cros-qcom-dts-watchers@chromium.org, linux-input@vger.kernel.org,
        hsinyi@google.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        yangcong5@huaqin.corp-partner.google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In my case a few different panel drivers disable the regulators in the
unprepare/disable routines. For at least the Rockchip DSI
implementations for some reason the panel gets unprepared more than
once, which triggers an unbalanced regulator disable. Obviously though
the correct course of action is to fix the reason why the panel is
disabled more than once, but that's at least the root cause of this
behavior on the few panels I've worked with.

Thank you.

On Thu, Jul 27, 2023 at 1:38=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi,
>
> On Wed, Jul 26, 2023 at 08:10:33AM -0700, Doug Anderson wrote:
> > On Wed, Jul 26, 2023 at 5:41=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > On Tue, Jul 25, 2023 at 01:34:37PM -0700, Douglas Anderson wrote:
> > > > NOTE: arguably, the right thing to do here is actually to skip this
> > > > patch and simply remove all the extra checks from the individual
> > > > drivers. Perhaps the checks were needed at some point in time in th=
e
> > > > past but maybe they no longer are? Certainly as we continue
> > > > transitioning over to "panel_bridge" then we expect there to be muc=
h
> > > > less variety in how these calls are made. When we're called as part=
 of
> > > > the bridge chain, things should be pretty simple. In fact, there wa=
s
> > > > some discussion in the past about these checks [1], including a
> > > > discussion about whether the checks were needed and whether the cal=
ls
> > > > ought to be refcounted. At the time, I decided not to mess with it
> > > > because it felt too risky.
> > >
> > > Yeah, I'd agree here too. I've never found evidence that it was actua=
lly
> > > needed and it really looks like cargo cult to me.
> > >
> > > And if it was needed, then I'm not sure we need refcounting either. W=
e
> > > don't have refcounting for atomic_enable / disable, we have a sound A=
PI
> > > design that makes sure we don't fall into that trap :)
> > >
> > > > Looking closer at it now, I'm fairly certain that nothing in the
> > > > existing codebase is expecting these calls to be refcounted. The on=
ly
> > > > real question is whether someone is already doing something to ensu=
re
> > > > prepare()/unprepare() match and enabled()/disable() match. I would =
say
> > > > that, even if there is something else ensuring that things match,
> > > > there's enough complexity that adding an extra bool and an extra
> > > > double-check here is a good idea. Let's add a drm_warn() to let peo=
ple
> > > > know that it's considered a minor error to take advantage of
> > > > drm_panel's double-checking but we'll still make things work fine.
> > >
> > > I'm ok with this, if we follow-up in a couple of releases and remove =
it
> > > and all the calls.
> > >
> > > Could you add a TODO item so that we can keep a track of it? A follow=
-up
> > > is fine if you don't send a new version of that series.
> >
> > By this, I think you mean to add a "TODO" comment inline in the code?
>
> No, sorry, I meant an entry in our TODO list: Documentation/gpu/todo.rst
>
> > Also: I was thinking that we'd keep the check in "drm_panel.c" with
> > the warning message indefinitely. You think it should be eventually
> > removed? If we are truly thinking of removing it eventually, this
> > feels like it should be a more serious warning message like a WARN(1,
> > ...) to make it really obvious to people that they're relying on
> > behavior that will eventually go away.
>
> Yeah, it really feels like this is cargo-cult to me. Your approach seems
> like a good short-term thing to do to warn everyone but eventually we'll
> want it to go away.
>
> So promoting it to a WARN could be a good thing, or let's say we do a
> drm_warn for now, WARN next release, and gone in two?
>
> Maxime
