Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDEA74BEFF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 21:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbjGHTlK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jul 2023 15:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjGHTlJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jul 2023 15:41:09 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3568094
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jul 2023 12:41:08 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-c2cf29195f8so3727062276.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jul 2023 12:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688845267; x=1691437267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4mjX8Bh3qbSm+nvsy6FJoquWJ9nmjKJGsEM2HAmFL0=;
        b=jZVPkJrUXc2LuG29odalgALfNo263gqytg+jaiDEYWbtty+Q4UF3HEBH0U+9gcHxH2
         QFehSnU9PG+dNsUIWJb2xurlwKq9b8xsfMXjycfX6iF8gn/j7z8vV+E38KD/XmFRmEN6
         35HzF1i+Su+y6smUfth+No7DD3P6e4VVLrLUukCXc1cQUSZclDcBMH3lx6U+vkn8tM1c
         yNFksp1X8gIj8lPV0TZVqTd+y8k/pgRb1Ou4of35T0UGgqoDRZEJd40S80VcSc9N6D4x
         runuU5DWlVHf6a3Sf4TWv8cDk0Z5NF+pEMoDHFJHk/KGuVvn7VglwfA3LZRPkWDp5ewB
         9pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688845267; x=1691437267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4mjX8Bh3qbSm+nvsy6FJoquWJ9nmjKJGsEM2HAmFL0=;
        b=hrfIDYHF/YgmeiX2hE4iS6VcItWkIi/Bycb7NKBEhFu9J1W7a3WhcwfbUoRtVJqYEJ
         p6etAKR7/D0EArocng3F+A2cQDimmkpAFJhN4860iZLvwynPkZq67DKz52Tn/GYcgI4+
         i8ZeFuJQbkAlCbN3tdsP4/+MqucI3aJYWNXSDXyl6X1gmSY5QsnVfRzuB2j2P9Ox+vxX
         WvUtEUllyw/i33vcVikFk1K6S/AbCBlH570HC3ciHVEyOkTYGw3MwhBJ7EKQCzvr2TGU
         ZHYWxkebuCD/LJn0+O8WpDRuY8VafY9qidDpLLv9o6PSzI5eN6k8TNbIq5siDQFZI2Eo
         h76g==
X-Gm-Message-State: ABy/qLZ2wFxyCJYADoK0KnLxnf44hZ050Jedbvr/HN162+fOaQKVKhBw
        SVhfSRjdAsKJ/q465Mcqf3VNoynR8caO4f4nu6l5RQ==
X-Google-Smtp-Source: APBJJlGBQ0HBzDHZgiP86KUqYYfx509gTcCRiuS2Iyrq3g7CZ2J9Ir5G5J0B7EoDlLd9XmXYS+3FY/CH6zzk4dGPpWg=
X-Received: by 2002:a0d:eb8c:0:b0:56c:f8f1:eed5 with SMTP id
 u134-20020a0deb8c000000b0056cf8f1eed5mr8694966ywe.6.1688845267155; Sat, 08
 Jul 2023 12:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de> <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
 <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
 <d5fb8106-b8f3-0acf-1267-d4d6d0860e25@linaro.org> <d28b0090-bd1e-6737-d92b-348dc6c30750@linaro.org>
 <800f9e1a-cb66-5bf5-d225-ef338c1c1584@denx.de> <4bc710b1-f361-c525-7692-1dc275ec9bb7@linaro.org>
 <19f50ec2-f22d-100f-cc40-511b8b6153cf@denx.de>
In-Reply-To: <19f50ec2-f22d-100f-cc40-511b8b6153cf@denx.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 8 Jul 2023 22:40:56 +0300
Message-ID: <CAA8EJppkQSY1yNyG8oXjmYCa+1Pe9X6Zp4nLPwUvHMbODsvayQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
To:     Marek Vasut <marex@denx.de>
Cc:     neil.armstrong@linaro.org, Amit Pundir <amit.pundir@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 8 Jul 2023 at 22:39, Marek Vasut <marex@denx.de> wrote:
>
> On 7/8/23 17:53, Dmitry Baryshkov wrote:
> > On 08/07/2023 18:40, Marek Vasut wrote:
> >> On 7/7/23 10:47, Neil Armstrong wrote:
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
> >>
> >> I don't have the LT9611 datasheet, no.
> >
> > I also don't have an lt9611 datasheet, unfortunately. I was using the
> > existing third-party drivers as a source.
> >
> >>
> >> The MX8M DSI (samsung-dsim) skips the HSA/HFP/HBP completely (see
> >> i.MX8MP RM 13.6.2.7.2 RGB Interface , there is infographics on the
> >> following pages).
> >
> > Do you know, why did you have to disable HPB/HSA/HFP on your platform?
> > What was the result otherwise?
>
> No image on the HDMI monitor at all. This flags change has fixed the
> problem for multiple other bridges too btw, not just the LT9611, but
> also TI SN65DSI83 and ICN6211. The flags were likely not set in all
> those bridge drivers because no DSI host implemented them so far.

MSM DSI host have had those implemented for ages, but we never needed
them AFAIR.

--=20
With best wishes
Dmitry
