Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1E39752A61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 20:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbjGMShf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 14:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjGMShe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 14:37:34 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C6751992
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 11:37:33 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5768a7e3adbso33942947b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 11:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1689273452; x=1691865452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=855BqfEppezUio2GynGNklnjmLkHV7KjfetEfSzHlrQ=;
        b=lMx48Fub46V5otdZym3NvCf+EJ9Fj+dbnSPI4e3xLy4+6qlqewZpDjIqnOQ1751Nn8
         d3XL9r7T/tgP3ufe0QYXLRIWNxLXGDRAxeZGpPaEOD8KExjyKkzJEbKJ4wdK+dsINy67
         1ts9zVOdqWh6ryCVhvLzw9SSVovR3+tH0eDcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689273452; x=1691865452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=855BqfEppezUio2GynGNklnjmLkHV7KjfetEfSzHlrQ=;
        b=I0LLpRcFwgLMJyahVh7eEoik7RwOH+NuHs3Lnamnd/9m2TeykQ3YXyNTsaxTey9i0i
         9gmot8BUwFXWq4q5J+3RhrS3P01JR6x+cQ7MhBmujPXggRsxcH0Fe8XRg+OGmhaFwHE0
         Hrn93V+bm2t/VUVLlGH4JvVDKupfOf+9N2iyFd+OkQ+9+Zfb+kTzCEb9zG/fOIVUMcnJ
         FGX/LXUq5/PoDL3BOBzblrfaeHmIkhEMHG67Qe9DOBV7sR/b1195DKEZw70W4I+UQjvJ
         xqv9B96DxE/EYuHapAkc0xp+NpjIN4UCqbuF4Ogtwv6PzILd5eJZYicJbothwGw/gNAu
         bv9w==
X-Gm-Message-State: ABy/qLYpfaVun3EI/Vy8poDoUZoKlfuncZypvY648dx8G6jZ/+PEYUud
        8neQBw3t+rvPaJHxmMguNwdoNd/vRwvv5SuINU9IKA==
X-Google-Smtp-Source: APBJJlGuoB5EoXqCREcG0nqtm2A2HHGahl7ZTjfFoM7qApsG87TbwZjaUGeSnEFBgI+M1gJEOoU/JOknwBtv9eTaIPA=
X-Received: by 2002:a81:6983:0:b0:56d:2e66:4a3f with SMTP id
 e125-20020a816983000000b0056d2e664a3fmr693950ywc.0.1689273452238; Thu, 13 Jul
 2023 11:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de> <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
 <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
 <d5fb8106-b8f3-0acf-1267-d4d6d0860e25@linaro.org> <d28b0090-bd1e-6737-d92b-348dc6c30750@linaro.org>
 <4396d197-f16f-92bd-727c-eb8c78016198@quicinc.com> <961b4747-c9f1-a31c-c33c-475b4803f832@denx.de>
 <64c3352f-c2aa-5260-c6ff-4a607ce219a2@quicinc.com>
In-Reply-To: <64c3352f-c2aa-5260-c6ff-4a607ce219a2@quicinc.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 14 Jul 2023 00:07:20 +0530
Message-ID: <CAMty3ZBZD9WPM=soGYrMmmPVq6U3+WJ40DOzzU=o9oPi02-5xQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marek Vasut <marex@denx.de>
Cc:     neil.armstrong@linaro.org, Amit Pundir <amit.pundir@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        dri-devel@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 13, 2023 at 11:39=E2=80=AFPM Abhinav Kumar
<quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/12/2023 10:41 AM, Marek Vasut wrote:
> > On 7/9/23 03:03, Abhinav Kumar wrote:
> >>
> >>
> >> On 7/7/2023 1:47 AM, Neil Armstrong wrote:
> >>> On 07/07/2023 09:18, Neil Armstrong wrote:
> >>>> Hi,
> >>>>
> >>>> On 06/07/2023 11:20, Amit Pundir wrote:
> >>>>> On Wed, 5 Jul 2023 at 11:09, Dmitry Baryshkov
> >>>>> <dmitry.baryshkov@linaro.org> wrote:
> >>>>>>
> >>>>>> [Adding freedreno@ to cc list]
> >>>>>>
> >>>>>> On Wed, 5 Jul 2023 at 08:31, Jagan Teki
> >>>>>> <jagan@amarulasolutions.com> wrote:
> >>>>>>>
> >>>>>>> Hi Amit,
> >>>>>>>
> >>>>>>> On Wed, Jul 5, 2023 at 10:15=E2=80=AFAM Amit Pundir
> >>>>>>> <amit.pundir@linaro.org> wrote:
> >>>>>>>>
> >>>>>>>> Hi Marek,
> >>>>>>>>
> >>>>>>>> On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
> >>>>>>>>>
> >>>>>>>>> Do not generate the HS front and back porch gaps, the HSA gap a=
nd
> >>>>>>>>> EOT packet, as these packets are not required. This makes the
> >>>>>>>>> bridge
> >>>>>>>>> work with Samsung DSIM on i.MX8MM and i.MX8MP.
> >>>>>>>>
> >>>>>>>> This patch broke display on Dragonboard 845c (SDM845) devboard
> >>>>>>>> running
> >>>>>>>> AOSP. This is what I see
> >>>>>>>> https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-bro=
ken-display/PXL_20230704_150156326.jpg.
> >>>>>>>> Reverting this patch fixes this regression for me.
> >>>>>>>
> >>>>>>> Might be msm dsi host require proper handling on these updated
> >>>>>>> mode_flags? did they?
> >>>>>>
> >>>>>> The msm DSI host supports those flags. Also, I'd like to point out
> >>>>>> that the patch didn't change the rest of the driver code. So even =
if
> >>>>>> drm/msm ignored some of the flags, it should not have caused the
> >>>>>> issue. Most likely the issue is on the lt9611 side. I's suspect th=
at
> >>>>>> additional programming is required to make it work with these flag=
s.
> >>>>>
> >>>>> I spent some time today on smoke testing these flags (individually =
and
> >>>>> in limited combination) on DB845c, to narrow down this breakage to =
one
> >>>>> or more flag(s) triggering it. Here are my observations in limited
> >>>>> testing done so far.
> >>>>>
> >>>>> There is no regression with MIPI_DSI_MODE_NO_EOT_PACKET when enable=
d
> >>>>> alone and system boots to UI as usual.
> >>>>>
> >>>>> MIPI_DSI_MODE_VIDEO_NO_HFP always trigger the broken display as in =
the
> >>>>> screenshot[1] shared earlier as well.
> >>>>>
> >>>>> Adding either of MIPI_DSI_MODE_VIDEO_NO_HSA and
> >>>>> MIPI_DSI_MODE_VIDEO_NO_HBP always result in no display, unless pair=
ed
> >>>>> with MIPI_DSI_MODE_VIDEO_NO_HFP and in that case we get the broken
> >>>>> display as reported.
> >>>>>
> >>>>> In short other than MIPI_DSI_MODE_NO_EOT_PACKET flag, all other fla=
gs
> >>>>> added in this commit break the display on DB845c one way or another=
.
> >>>>
> >>>> I think the investigation would be to understand why samsung-dsim
> >>>> requires
> >>>> such flags and/or what are the difference in behavior between MSM
> >>>> DSI and samsung DSIM
> >>>> for those flags ?
> >>>>
> >>>> If someone has access to the lt9611 datasheet, so it requires
> >>>> HSA/HFP/HBP to be
> >>>> skipped ? and does MSM DSI and samsung DSIM skip them in the same wa=
y ?
> >>>
> >>> I think there's a mismatch, where on one side this flags sets the
> >>> link in LP-11 while
> >>> in HSA/HFP/HPB while on the other it completely removes those
> >>> blanking packets.
> >>>
> >>> The name MIPI_DSI_MODE_VIDEO_NO_HBP suggests removal of HPB, not
> >>> LP-11 while HPB.
> >>> the registers used in both controllers are different:
> >>> - samsung-dsim: DSIM_HBP_DISABLE_MODE
> >>> - msm dsi: DSI_VID_CFG0_HBP_POWER_STOP
> >>>
> >>> The first one suggest removing the packet, while the second one
> >>> suggests powering
> >>> off the line while in the blanking packet period.
> >>>
> >>> @Abhinav, can you comment on that ?
> >>>
> >>
> >> I dont get what it means by completely removes blanking packets in DSI=
M.
> >
> > MIPI_DSI_MODE_VIDEO_NO_HFP means the HBP period is just skipped by DSIM=
.
> >
> > Maybe there is a need for new set of flags which differentiate between
> > HBP skipped (i.e. NO HBP) and HBP LP11 ?
> >
>
> No, the section of the MIPI DSI spec I posted below clearly states there
> are two options:
>
> 1) send blanking packets during those periods
> 2) transition to LP11 during those periods
>
> There is no 3rd option in the spec of not doing both like what you are
> suggesting. So DSIM should also be only transitioning to LP11 during
> those periods if its not sending the blanking packets with those flags se=
t.
>
> So, there is no need for any new set of flags to differentiate.
>
> The flags and their interpretation is correct in MSM driver. I cannot
> comment on what exactly DSIM does with those flags.

As many of them know all these flags are generic across controllers
I'm trying to add these flag notations from DSIM controller and how
they handle the driver.

HBP/HFP/HSA mode bits in i.MX8M Mini/Nano/Plus Processor Reference
Manuals specify a naming conversion as 'disable mode bit' due to its
bit definition,  0 =3D Enable and 1 =3D Disable.

Example HBP (HbpDisableMode)- Specifies HBP disable mode. If this bit
set, DSI master ignores HBP area in Video mode.
 0 =3D Enables
 1 =3D Disables

 if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
           reg |=3D DSIM_HFP_DISABLE_MODE;
 if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
           reg |=3D DSIM_HBP_DISABLE_MODE;
 if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
            reg |=3D DSIM_HSA_DISABLE_MODE;

I'm hoping this will give some information.

Thanks,
Jagan.
