Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D23756CED44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 17:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjC2PsH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 11:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbjC2PsG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 11:48:06 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 895982720
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 08:48:05 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id h27so13716655vsa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680104882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCUeYDCKKdfcC5YGZz1Vanefs7gXguNR6lN7akajdTo=;
        b=fyp595EnlO4QfHb/DErpjmuid/C75tiRj1hmUzm9K69hscQFswZH/LEJaoHhOhAU4v
         e9u2qUshpxPXQlww6Hsz6CIHM9R2GQ37FmIiYDl4HnNWBO3w2oCTgz4MMvXBm0/mVO1a
         h4lTPulrVUkTzXWdVS32p0lI48nIq2OfEsRkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680104882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCUeYDCKKdfcC5YGZz1Vanefs7gXguNR6lN7akajdTo=;
        b=3G6xK58j0ZC8MUj384QhkTdLiq23GpoaTDk2egWXPrIX3kWdax9E5uWedvsjaC/lzG
         nCSt6FacmwYFNYQ/2wTscavCJ5euINmX4Q33OUk/n26/ib/AJ3+yLdNKbX0cEPTN9udr
         TOlqZvtqyhBXUKrtXKZ5rH42bcNg9EsHO0W9DslZkGKH0WpSjfvw0kFzL6euVTO3Ef24
         Jmx27HK8oHvgiNaQbU7QtOhEQYFO1nAZNw6UXuxmz5KMrxF0u8joMi6ETbfMyYmQSMjQ
         ifoEHlqCui2I/F3d6UgzmbaLCxKM6fsS0p6RPP1p44b/OPZbvDoEVdzrtntd8GqDAGtu
         jFYQ==
X-Gm-Message-State: AAQBX9eCznudtCkg1Nrdr7giwMG0BDtS3UG3zHhNzFBQCrQ2I4sf7Qlj
        bIH/DiVGS+G3cRLeF6cwrN85d9+fCladbRdnoAk=
X-Google-Smtp-Source: AKy350Zq99kQybvPNqvSHc9QTEmSLwr+HayEyzA65cRayZlkOjvePe1EzlArmH2ah11nhXPiFUupHQ==
X-Received: by 2002:a67:f601:0:b0:426:b1d7:c62f with SMTP id k1-20020a67f601000000b00426b1d7c62fmr3444353vso.22.1680104882316;
        Wed, 29 Mar 2023 08:48:02 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id m6-20020ab06d86000000b0068e35efd9besm4367748uah.36.2023.03.29.08.48.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 08:48:01 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id d18so13681231vsv.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 08:48:01 -0700 (PDT)
X-Received: by 2002:a67:ca16:0:b0:421:eabb:cd6a with SMTP id
 z22-20020a67ca16000000b00421eabbcd6amr10917847vsk.7.1680104880896; Wed, 29
 Mar 2023 08:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1677774797-31063-15-git-send-email-quic_vpolimer@quicinc.com>
 <20230326162723.3lo6pnsfdwzsvbhj@ripper> <20230326163556.iesjkoh3nw3iwvf2@ripper>
 <CAE-0n520ypTRNT1X6kZ8o_Z+DN_68qwqZc1wZGMwsFqV5naktw@mail.gmail.com> <BN0PR02MB81736AFC01FB13F1640068CEE4899@BN0PR02MB8173.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB81736AFC01FB13F1640068CEE4899@BN0PR02MB8173.namprd02.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 29 Mar 2023 08:47:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UjHiEk==KAhbx6QFW++69vDAM44sw-b2MGcJ7NsfbF-A@mail.gmail.com>
Message-ID: <CAD=FV=UjHiEk==KAhbx6QFW++69vDAM44sw-b2MGcJ7NsfbF-A@mail.gmail.com>
Subject: Re: [PATCH v14 14/14] drm/msm/dp: set self refresh aware based on PSR support
To:     Vinod Polimera <vpolimer@qti.qualcomm.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
        "robdclark@gmail.com" <robdclark@gmail.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        "Vishnuvardhan Prodduturi (QUIC)" <quic_vproddut@quicinc.com>,
        "Bjorn Andersson (QUIC)" <quic_bjorande@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 29, 2023 at 8:16=E2=80=AFAM Vinod Polimera
<vpolimer@qti.qualcomm.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Stephen Boyd <swboyd@chromium.org>
> > Sent: Monday, March 27, 2023 9:58 PM
> > To: Bjorn Andersson <andersson@kernel.org>; Vinod Polimera (QUIC)
> > <quic_vpolimer@quicinc.com>
> > Cc: dri-devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
> > freedreno@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org; robdclark@gmail.com; dianders@chromium.org;
> > Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>;
> > dmitry.baryshkov@linaro.org; Kuogee Hsieh (QUIC)
> > <quic_khsieh@quicinc.com>; Vishnuvardhan Prodduturi (QUIC)
> > <quic_vproddut@quicinc.com>; Bjorn Andersson (QUIC)
> > <quic_bjorande@quicinc.com>; Abhinav Kumar (QUIC)
> > <quic_abhinavk@quicinc.com>; Sankeerth Billakanti (QUIC)
> > <quic_sbillaka@quicinc.com>
> > Subject: Re: [PATCH v14 14/14] drm/msm/dp: set self refresh aware based
> > on PSR support
> >
> > Quoting Bjorn Andersson (2023-03-26 09:35:56)
> > > On Sun, Mar 26, 2023 at 09:27:23AM -0700, Bjorn Andersson wrote:
> > > > On Thu, Mar 02, 2023 at 10:03:17PM +0530, Vinod Polimera wrote:
> > > > > For the PSR to kick in, self_refresh_aware has to be set.
> > > > > Initialize it based on the PSR support for the eDP interface.
> > > > >
> > > >
> > > > When I boot my sc8280xp devices (CRD and X13s) to console with this
> > > > patch included I get a login prompt, and then there are no more scr=
een
> > > > updates.
> > > >
> > > > Switching virtual terminal (ctrl+alt+fN) causes the screen to redra=
w.
> > > >
> > > > Blindly login in and launching Wayland works and from then on scree=
n
> > > > updates works as expected.
> > > >
> > > > Switching from Wayland to another virtual terminal causes the probl=
em
> > to
> > > > re-appear, no updates after the initial refresh, switching back go =
the
> > > > Wayland-terminal crashed the machine.
> > > >
> > >
> > > Also, trying to bring the eDP-screen back from DPMS gives me:
> > >
> > > <3>[ 2355.218099] [drm:dp_catalog_ctrl_set_pattern_state_bit [msm]]
> > *ERROR* set state_bit for link_train=3D1 failed
> > > <3>[ 2355.218926] [drm:dp_ctrl_setup_main_link [msm]] *ERROR* link
> > training #1 failed. ret=3D-110
> > > <3>[ 2355.262859] [drm:dp_catalog_ctrl_set_pattern_state_bit [msm]]
> > *ERROR* set state_bit for link_train=3D1 failed
> > > <3>[ 2355.263600] [drm:dp_ctrl_setup_main_link [msm]] *ERROR* link
> > training #1 failed. ret=3D-110
> > > <3>[ 2355.305211] [drm:dp_catalog_ctrl_set_pattern_state_bit [msm]]
> > *ERROR* set state_bit for link_train=3D1 failed
> > > <3>[ 2355.305955] [drm:dp_ctrl_setup_main_link [msm]] *ERROR* link
> > training #1 failed. ret=3D-110
> > > <3>[ 2355.345250] [drm:dp_catalog_ctrl_set_pattern_state_bit [msm]]
> > *ERROR* set state_bit for link_train=3D1 failed
> > > <3>[ 2355.346026] [drm:dp_ctrl_setup_main_link [msm]] *ERROR* link
> > training #1 failed. ret=3D-110
> > > <3>[ 2355.405650] [drm:dp_display_process_hpd_high [msm]] *ERROR*
> > failed to complete DP link training
> > > <3>[ 2355.668988]
> > [drm:dpu_encoder_phys_vid_wait_for_commit_done:488] [dpu
> > error]vblank timeout
> > > <3>[ 2355.669030] [drm:dpu_kms_wait_for_commit_done:510] [dpu
> > error]wait for commit done returned -110
> > > <3>[ 2355.699989] [drm:dpu_encoder_frame_done_timeout:2398] [dpu
> > error]enc35 frame done timeout
> > >
> > > And then the machine just resets.
> > >
> >
> > I saw similar behavior on ChromeOS after we picked the PSR patches into
> > our kernel. I suspect it's the same problem. I switched back and forth
> > between VT2 and the OOBE screen with ctrl+alt+forward and that showed
> > what I typed on the virtual terminal after switching back and forth.
> > It's like the redraw only happens once on the switch and never again. I
> > switched back and forth enough times that it eventually crashed the
> > kernel and rebooted. This was on CRD (sc7280-herobrine-crd.dts).
> >
> > There's an animation on the OOBE screen that is working though, so
> > perhaps PSR is working with the chrome compositor but not the virtual
> > terminal? I haven't investigated.
>
> I was able to reproduce the issue where in virtual terminal, I don't see =
any screen refresh despite typing in.
> In the VT mode, I see that PSR is entered, but despite typing in there ar=
e no atomic commits triggered, hence the last buffer was always refreshed.
>
> Queries from my side to Rob & Doug:
> 1) In VT mode, does the framework operates in single buffer mode without =
any commit for new updates ?
> 2) if above is true then, how does driver know if the framework operates =
in single buffer mode, to make any appropriate action
> 3) what is the expected behavior with the driver here ? should it return =
atomic_check failure, for single buffer mode operation or, it should exit P=
SR ?
> 4) is there any HINT passed down to the driver so that we can bank on it =
and act accordingly?

I haven't looked at this detail about PSR before, and I left my
PSR-enabled device at home so I can't easily test this right now. That
being said, from a bit of searching I would guess that
msm_framebuffer_dirtyfb() is somehow involved here. Are things better
if you get rid of the test against 'msm_fb->dirtyfb'?

I at least used ftrace to confirm that on a different device
msm_framebuffer_dirtyfb() is not called during normal ChromeOS usage
but it _is_ called in VT2 usage.

-Doug
