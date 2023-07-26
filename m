Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE84763BF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 18:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjGZQHb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 12:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbjGZQHa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 12:07:30 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28EDCE69
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 09:07:29 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51e2a6a3768so10153559a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 09:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690387646; x=1690992446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Et58EXEmfLq1LIQL5SXUSCkby5ZyaZ1e6VeyOPEhc/Y=;
        b=YouFWzJwYRT/4JuRamWAxq++pu6E8dO4RZxZ26atgp2D2dMXxNPkeEMgxkQW5dOlCK
         AqTMXiA0KiCDZtS/ih4apau2fxQjuYTd+O833LMfEFWKr5h0zfs6qKVzE+3bDgGPG/g1
         1pFyNb+9m5+kWblp1Ei0X97GYPAIvrA6XL5X8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690387646; x=1690992446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Et58EXEmfLq1LIQL5SXUSCkby5ZyaZ1e6VeyOPEhc/Y=;
        b=kSfL1OLnZUSoP1i2PH54eo3Mm7zFo/CyAG68I41tX45JjLMqdXVHQ6ohUWsdaUL2Wr
         IZ5lUy4IsGel8vP/u1EnmXG2GGFPHQ1lV2LyG75064XGeLRjyP5KQT+fGlGJpi5fWTp/
         8QlQKo+0Kx7lL3oJkMAF18D4rQSoN/X3jqJ+U1aBmIzznq2ctquFekUt6H9J86QuFNea
         q3pPfOn1D7npgJy9SXF8oz401+W28X6yLmkWvssiyTKF8A1IbVh642lkcUMKXWivv+9e
         wwoHc+yJaCyhnPXsR1BS4lCKmhsYeOda2mrK7VkiWFTmmakSrj/ayE3lurgeULg00M16
         WIlg==
X-Gm-Message-State: ABy/qLaxuq8KvuKhD3fX78nZ8itI+la8mgO1bQB+5USIYG7UdPhUfRtd
        F6yvZcj7NCBSJ4a1dyoZLDctjapF92O6Dvx4wQvc6jU8
X-Google-Smtp-Source: APBJJlH608jw1/R3FAvgtyb0sZRxsWhPDmw5j0FCZy2mEDuTKOdGHGn2jJ4z0HON1SIAyL1lsqFWpw==
X-Received: by 2002:aa7:d953:0:b0:522:1dcb:c359 with SMTP id l19-20020aa7d953000000b005221dcbc359mr2079020eds.24.1690387646092;
        Wed, 26 Jul 2023 09:07:26 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id t24-20020aa7d4d8000000b005227b065a78sm502278edr.70.2023.07.26.09.07.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 09:07:25 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-516500163b2so12627a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 09:07:25 -0700 (PDT)
X-Received: by 2002:a50:ccc4:0:b0:506:b280:4993 with SMTP id
 b4-20020a50ccc4000000b00506b2804993mr349749edj.2.1690387645063; Wed, 26 Jul
 2023 09:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230725203545.2260506-1-dianders@chromium.org>
 <20230725133443.v3.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid> <rorhwk3jx72twmqnxqb45uhm7azxxfirvferwyznbhbfmdf7ja@6k6ebhehmsn4>
In-Reply-To: <rorhwk3jx72twmqnxqb45uhm7azxxfirvferwyznbhbfmdf7ja@6k6ebhehmsn4>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 26 Jul 2023 09:07:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VX=ACR3K+GYAvP8J4ebP4GtTpXQmX21NkJ4BJ7vN+o8w@mail.gmail.com>
Message-ID: <CAD=FV=VX=ACR3K+GYAvP8J4ebP4GtTpXQmX21NkJ4BJ7vN+o8w@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] HID: i2c-hid: Support being a panel follower
To:     Benjamin Tissoires <bentiss@kernel.org>
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
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
        linux-arm-msm@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, hsinyi@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 26, 2023 at 1:57=E2=80=AFAM Benjamin Tissoires <bentiss@kernel.=
org> wrote:
>
> > @@ -1143,7 +1208,14 @@ void i2c_hid_core_remove(struct i2c_client *clie=
nt)
> >       struct i2c_hid *ihid =3D i2c_get_clientdata(client);
> >       struct hid_device *hid;
> >
> > -     i2c_hid_core_power_down(ihid);
> > +     /*
> > +      * If we're a follower, the act of unfollowing will cause us to b=
e
> > +      * powered down. Otherwise we need to manually do it.
> > +      */
> > +     if (ihid->is_panel_follower)
> > +             drm_panel_remove_follower(&ihid->panel_follower);
>
> That part is concerning, as we are now calling hid_drv->suspend() when re=
moving
> the device. It might or not have an impact (I'm not sure of it), but we
> are effectively changing the path of commands sent to the device.
>
> hid-multitouch might call a feature in ->suspend, but the remove makes
> that the physical is actually disconnected, so the function will fail,
> and I'm not sure what is happening then.

It's not too hard to change this if we're sure we want to. I could
change how the panel follower API works, though I'd rather keep it how
it is now for symmetry. Thus, if we want to do this I'd probably just
set a boolean at the beginning of i2c_hid_core_remove() to avoid the
suspend when the panel follower API calls us back.

That being said, are you sure you want me to do that?

1. My patch doesn't change the behavior of any existing hardware. It
will only do anything for hardware that indicates it needs the panel
follower logic. Presumably these people could confirm that the logic
is OK for them, though I'll also admit that it's likely not many of
them will test the remove() case.

2. Can you give more details about why you say that the function will
fail? The first thing that the remove() function will do is to
unfollow the panel and that can cause the suspend to happen. At the
time this code runs all the normal communications should work and so
there should be no problems calling into the suspend code.

3. You can correct me if I'm wrong, but I'd actually argue that
calling the suspend code during remove actually fixes issues and we
should probably do it for the non-panel-follower case as well. I think
there are at least two benefits. One benefit is that if the i2c-hid
device is on a power rail that can't turn off (either an always-on or
a shared power rail) that we'll at least get the device in a low power
state before we stop managing it with this driver. The second benefit
is that it implicitly disables the interrupt and that fixes a
potential crash at remove time(). The crash in the old code I'm
imagining is:

a) i2c_hid_core_remove() is called.

b) We try to power down the i2c hid device, which might not do
anything if the device is on an always-on rail.

c) We call hid_destroy_device(), which frees the hid device.

d) An interrupt comes in before the call to free_irq() and we try to
dispatch it to the already freed hid device and crash.


If you agree that my reasoning makes sense, I can add a separate patch
before this one to suspend during remove.



-Doug
