Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E13690D70
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 16:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjBIPp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 10:45:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbjBIPpw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 10:45:52 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B3F65668
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 07:45:32 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id bs10so1149235vkb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 07:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqrEeOYy3mjqh5KmY+3gTVjzv8Do3LhWFceA0QbUl+Q=;
        b=QPhmCpMd6ZPgvRGEQa4k/r0HMG+R8wiKBF803a4KjRNUmfaoIIFAc2uCF46INTnhLM
         vaZbHXCdTMO68szrINPHDbqFen2qNdxCGL3IYrhajFTsYXd2EXax9Ne0lzSzxukIMOVh
         /sB9flevqoes/H9c4f0s8BgrpQDlyXHB4vd28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqrEeOYy3mjqh5KmY+3gTVjzv8Do3LhWFceA0QbUl+Q=;
        b=TudMIBo/nhQ//a9RM3K0yGaxfIAg6rIV36XBxQhBxsL7rBEdkyCsVIQj4HlOtEFcMa
         nc/rU1FmZUglTIG0Su6kDbnlUxDy9XY5ET7w8GReTCRXVBLYhNiROyh25mwAiBtHkTM/
         3W3ebKg942cXC3EI/HnW2IwvT+Yhx9p9lfMMgutXBQeiEz9r2h6B8BmhmdoETJbmh82i
         sNZIk8ci9W8x26DERiNj4PulldGjEPbw7AqPSpQswt03V6n4DU2MFZsGSEVoAswl/sBa
         zHC95QcFVTTAjfLihsBtmOnBr1MdrFrKLOvPDbvyraZYLoHJnE+0+EPgv4rkOfASN8JM
         iffg==
X-Gm-Message-State: AO0yUKU3Oo5Ti944WZ96fr2vxC4pudIUHZcXuuLuVh0ZstQ5tk3Wg4U6
        1WDTYib6Vaz71h13wQaL0opJ+uH7c31TM3u+z9s=
X-Google-Smtp-Source: AK7set/X31aRZ5BMMmmQTMDmWfvlE2oQXe49IL6AxSbYphMHwOQsPykDf90ovmKJAGzDct/gJYnRxw==
X-Received: by 2002:a05:6122:d04:b0:3e6:5a1b:3ad1 with SMTP id az4-20020a0561220d0400b003e65a1b3ad1mr8783447vkb.3.1675957526371;
        Thu, 09 Feb 2023 07:45:26 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id q64-20020a1f2a43000000b003ffc8a30438sm153799vkq.5.2023.02.09.07.45.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 07:45:24 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id k4so2548619vsc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 07:45:23 -0800 (PST)
X-Received: by 2002:a67:6743:0:b0:411:c22d:8433 with SMTP id
 b64-20020a676743000000b00411c22d8433mr837593vsc.73.1675957523229; Thu, 09 Feb
 2023 07:45:23 -0800 (PST)
MIME-Version: 1.0
References: <1675863724-28412-1-git-send-email-quic_kalyant@quicinc.com>
 <CAD=FV=WbzmF_Jkwrcm27eqXaqNhGq_D=8yfCKqELET+=+EaLAA@mail.gmail.com>
 <BN0PR02MB8142207261497BE76A6EA07096D99@BN0PR02MB8142.namprd02.prod.outlook.com>
 <BN0PR02MB81426F878B10DDF4AD2F95A896D99@BN0PR02MB8142.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB81426F878B10DDF4AD2F95A896D99@BN0PR02MB8142.namprd02.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 9 Feb 2023 07:45:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WP_XLpvnLe8qDTOYNuhZBCf-PynPa-SOMdfUFEWCYYvg@mail.gmail.com>
Message-ID: <CAD=FV=WP_XLpvnLe8qDTOYNuhZBCf-PynPa-SOMdfUFEWCYYvg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Reserve DSPPs based on user request
To:     Kalyan Thota <kalyant@qti.qualcomm.com>
Cc:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robdclark@chromium.org" <robdclark@chromium.org>,
        "swboyd@chromium.org" <swboyd@chromium.org>,
        "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Feb 9, 2023 at 3:26 AM Kalyan Thota <kalyant@qti.qualcomm.com> wrot=
e:
>
> Kindly ignore my previous email. Sent too early !!
>
> We have tested the changes on top of tip: https://chromium.googlesource.c=
om/chromiumos/third_party/kernel/+log/refs/heads/chromeos-5.15 + 5 CTM patc=
hes ( that you have quoted )
> We didn=E2=80=99t see the issue that you have reported on herobrine. Nigh=
t light always came up on primary display as the reservation with dspp was =
successful.  Are you seeing any reservation failures for primary display ?
>
> Attached a debug patch, can you share the logs when you see the issue.

Sounds good. Since officially this hardware is not available to the
public at this time, I have shared the `dmesg` privately to your (and
Abhinav's) Google partner accounts. Yell if you don't see the
notificatioin. I don't have any reason to believe there's anything
secret in the dmesg, but it didn't seem worth the time to fully audit
it.

For that dmesg, I:

1. Made sure that night light was off.

2. Updated the kernel with the 5 patches + the debug patch.

3. Booted up and logged into ChromeOS

4. Tried turning night light off/on several times and saw nothing on
dmesg while I did this (and night light didn't work)

5. Unplugged power and servo (just to make sure they didn't interfere)

6. Echoed "DOUG: plug in external display now" several times to "/dev/kmsg"

7. Plugged in my external display, which is behind a Type C dock

8. Turned night light on/off several times. Night light worked on the
internal display.

In case it matters, my ChromeOS root filesystem is R111-15328.0.0


> >-----Original Message-----
> >From: Kalyan Thota
> >Sent: Thursday, February 9, 2023 9:47 AM
> >To: Doug Anderson <dianders@chromium.org>; Kalyan Thota (QUIC)
> ><quic_kalyant@quicinc.com>
> >Cc: dri-devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
> >freedreno@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
> >kernel@vger.kernel.org; robdclark@chromium.org; swboyd@chromium.org;
> >Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>;
> >dmitry.baryshkov@linaro.org; Abhinav Kumar (QUIC)
> ><quic_abhinavk@quicinc.com>; marijn.suijten@somainline.org
> >Subject: RE: [PATCH v3 0/4] Reserve DSPPs based on user request
> >
> >Hi Doug,
> >
> >Have you picked the core change to program dspp's  (below) ? the current=
 series
> >will go on top of it.
> >https://patchwork.kernel.org/project/linux-arm-msm/patch/1671542719-1265=
5-
> >1-git-send-email-quic_kalyant@quicinc.com/
> >
> >Thanks,
> >Kalyan
> >
> >>-----Original Message-----
> >>From: Doug Anderson <dianders@chromium.org>
> >>Sent: Wednesday, February 8, 2023 10:44 PM
> >>To: Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>
> >>Cc: dri-devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
> >>freedreno@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
> >>kernel@vger.kernel.org; robdclark@chromium.org; swboyd@chromium.org;
> >>Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>;
> >>dmitry.baryshkov@linaro.org; Abhinav Kumar (QUIC)
> >><quic_abhinavk@quicinc.com>; marijn.suijten@somainline.org
> >>Subject: Re: [PATCH v3 0/4] Reserve DSPPs based on user request
> >>
> >>WARNING: This email originated from outside of Qualcomm. Please be wary
> >>of any links or attachments, and do not enable macros.
> >>
> >>Hi,
> >>
> >>On Wed, Feb 8, 2023 at 5:42 AM Kalyan Thota <quic_kalyant@quicinc.com>
> >>wrote:
> >>>
> >>> This series will enable color features on sc7280 target which has
> >>> primary panel as eDP
> >>>
> >>> The series removes DSPP allocation based on encoder type and allows
> >>> the DSPP reservation based on user request via CTM.
> >>>
> >>> The series will release/reserve the dpu resources when ever there is
> >>> a topology change to suit the new requirements.
> >>>
> >>> Kalyan Thota (4):
> >>>   drm/msm/dpu: clear DSPP reservations in rm release
> >>>   drm/msm/dpu: add DSPPs into reservation upon a CTM request
> >>>   drm/msm/dpu: avoid unnecessary check in DPU reservations
> >>>   drm/msm/dpu: reserve the resources on topology change
> >>>
> >>>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 +
> >>>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 58
> >>> ++++++++++++++++------
> >>-------
> >>>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  2 +
> >>>  3 files changed, 37 insertions(+), 25 deletions(-)
> >>
> >>I tried out your changes, but unfortunately it seems like there's somet=
hing
> >wrong.
> >>:( I did this:
> >>
> >>1. Picked your 5 patches to the chromeos-5.15 tree (this series plus
> >>[1])
> >>
> >>2. Put them on herobrine villager.
> >>
> >>3. Booted up with no external display plugged in.
> >>
> >>4. Tried to enable night light in the ChromeOS UI.
> >>
> >>5. Night light didn't turn on for the internal display.
> >>
> >>
> >>I also tried applying them to the top of msm-next (had to resolve some
> >>small conflicts). Same thing, night light didn't work.
> >>
> >>
> >>I thought maybe this was because the Chrome browser hasn't been updated
> >>to properly use atomic_check for testing for night light, so I hacked
> >>my herobrine device tree to not mark "mdss_dp" as "okay". Now there's _=
only_
> >an eDP display.
> >>Same thing, night light didn't work.
> >>
> >>
> >>I could only get night light to work for the internal display if I
> >>plugged and unplugged an external display in.
> >>
> >>
> >>Is the above the behavior that's expected right now?
> >>
> >>
> >>[1] https://lore.kernel.org/all/1674814487-2112-1-git-send-email-
> >>quic_kalyant@quicinc.com/
