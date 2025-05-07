Return-Path: <linux-arm-msm+bounces-57193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C9AAAEE65
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 00:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E27A163582
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 22:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6947A17332C;
	Wed,  7 May 2025 22:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApgQMO3q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2AC1E0B62;
	Wed,  7 May 2025 22:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746655280; cv=none; b=YCf6O6ygJF/MEDWl3y0Vx7/jRrcoUGuLVnY36j841TksFdHhh6dIzhg1x2dnIjTy1rhp6wJ0eqQct4+hl+ewQ8j8BgSyB7YqUEL9gfZaSnBiGcEu8VOxit/AJ+1s3R9czCxjeVFMl9hFMs9/FbigMzPDR7B+I6mxR3ta0PUuKmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746655280; c=relaxed/simple;
	bh=/cf6rHWBRA0Le+3p1oacOEzqt7qaLkcn2+VhfjT903A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l0lYGLr4TkP9dFrF4GnqbHKt3MOAWMszCHIpd5cAciwsuzSzn7aAz9rIbGlFXizDDKl7TurSx2baBcopmpl78+3+7ksF+TXFPkLheqtFS7wQwsLt0zy9d2N/siLLDL6Ns90VB7y+4Abxd8CWvX814pjtCYVby9xDDeAvdqzznXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApgQMO3q; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3995ff6b066so203027f8f.3;
        Wed, 07 May 2025 15:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746655276; x=1747260076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7u56/BE9sfux8WuPXj5ssqJJ2dojvbPg78wSPnA9NTE=;
        b=ApgQMO3qYzdNsfctKRnVJ3BPWOXi6zmcvQCm8jYkmXVfdM0cA+wsFWEpJon++xTOU2
         ctFtlO0RQf9DHZOzyGHrascdVdAK9GXp52L4pt3Oe7c0271zyvTOltu9XlHytFMxzsSL
         fEWWBqIq+rIhGHrIf9kbXanoLksZm5MnGxCI+FgWe7lRHtgbX+zKPjgOUF/AtvRTGeDA
         GDNufAl8UP9ygmSV32o6t6Tyff/ZhM50leTJRVfPPBev7fc5smbNJ2qgTwFXN12AULOW
         vRguS4hgU1WhVhmdCJm8K5VwgaNIZen25onFk0zWhw2ka2t+V/ObCKWUDtDTFps9nVct
         +4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746655276; x=1747260076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7u56/BE9sfux8WuPXj5ssqJJ2dojvbPg78wSPnA9NTE=;
        b=S5lWw0sWIAdUXw7n0xK2GMalnbxkLianwruudGbwUmYLoxB/eqMBxitNUtlZmDbjqE
         EgHAqb1NG+dj35WFkY6BBXx+Vb6wrukuB3QteYqV+fKQorWcM6n26BgbvAU8QkpSG3/j
         iLAeiMdh0d19DEsx60U9PX8wiXp51lD0RpzeteRN+U0RyRkpvNnBBrDDNjjXATFcr+Nz
         orMD67adR2/eWjtjCn3X0H/Khi7Dq/opSrEE49fVtO6d83kHrpFwXfM19LBzIojQBtMo
         Ce8YnYz8wnIfp+t3phKxC0bYhyMcy/jjwrfQMcJlq8VfyiRqn1GJjwWO6Jed4cDdISem
         BWnw==
X-Forwarded-Encrypted: i=1; AJvYcCW1v1T4NS9GKrXqzifaGooR3EhOmj2QOXtjHuZjj27HGlGlbHtSDrfO+c+alUUfylImkDfQfuP8nm329ofX@vger.kernel.org, AJvYcCW61ZArDR/XfKe746QveLrcGqGjJ3k82pPEDlKfVHBQok8yWIpYRjhVa2O6wRwA8NR14njXNw7QOdakJme6@vger.kernel.org
X-Gm-Message-State: AOJu0YxG0DxqAhnnARDyOKbzCehtW/rRgdbFKmr5n4K3oxz2x3xMLOzk
	1H3RL+2uwmdI4lZp/Os+m36gPhS9WgAx/AmAtO1+JJCUFFEDO8InYSnvdBD4js/Lfsa3ccCrnFH
	K3PpJuLkysLUXOCffWBOEqIIEQg==
X-Gm-Gg: ASbGnctBJxOmDfl5JaNzD/3VXfMfXdZSYnKY5dz9KqFqX4k2gGBninMTeX442ji3rOR
	lapdEapK9Wgybpcy2oo7fIB1mLnHqMpnLI5iIP8MfHwPFVxVVE6OtH8Yg4x32xMcJfoa88S2pYG
	jMi+reeRK2ag5UBcfXQ1myzw==
X-Google-Smtp-Source: AGHT+IFx6v6HALzC9BaFXXIJU/58CL2FYOY73E+Yh0wx912RJSi8yI+H0t+SgDCoRStlaDIVLU6O3QsqZneA7HOZkwY=
X-Received: by 2002:a05:6000:40cf:b0:39f:b62:8cb2 with SMTP id
 ffacd0b85a97d-3a0b4a4b313mr4282843f8f.38.1746655275030; Wed, 07 May 2025
 15:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
 <20250430001330.265970-5-alex.vinarskis@gmail.com> <6495e342-512f-469f-9d66-bb9f47fb551d@quicinc.com>
 <CAMcHhXqFE6-tnT0m9=3N1wSaTyEPMFA0zTfVqwJmgqz60tBAoQ@mail.gmail.com>
 <d1eb55ae-92e5-4a34-af46-5d076512a06b@quicinc.com> <CAMcHhXrJuADN=kN7p-YMy8vEqCk+JVfQ38S=gEW+JtDTe7mivQ@mail.gmail.com>
 <6d03ada4-fa2a-4ccc-9290-e2726cae1f28@quicinc.com>
In-Reply-To: <6d03ada4-fa2a-4ccc-9290-e2726cae1f28@quicinc.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Thu, 8 May 2025 00:01:09 +0200
X-Gm-Features: ATxdqUEiIcRKWSF50elTlo1wCdXAJb4XiBouTz58TwhlIb66IVhA6Knj-4ktYC8
Message-ID: <CAMcHhXoS0NADUmM7MuDSCbkjrpnbyv53dNj3NiJr-tvzhVKsGw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, laurentiu.tudor1@dell.com, abel.vesa@linaro.org, 
	johan@kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 6 May 2025 at 01:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrot=
e:
>
> Hi Alex
>
> On 5/4/2025 3:06 PM, Aleksandrs Vinarskis wrote:
> > On Sun, 4 May 2025 at 05:02, Abhinav Kumar <quic_abhinavk@quicinc.com> =
wrote:
> >>
> >> Hi Alex
> >>
> >> Thanks for the response.
> >>
> >> My updates below. I also had one question for Abel below.
> >>
> >> Thanks
> >>
> >> Abhinav
> >>
> >> On 5/1/2025 8:56 AM, Aleksandrs Vinarskis wrote:
> >>> On Thu, 1 May 2025 at 04:11, Abhinav Kumar <quic_abhinavk@quicinc.com=
> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
> >>>>> DisplayPort requires per-segment link training when LTTPR are switc=
hed
> >>>>> to non-transparent mode, starting with LTTPR closest to the source.
> >>>>> Only when each segment is trained individually, source can link tra=
in
> >>>>> to sink.
> >>>>>
> >>>>> Implement per-segment link traning when LTTPR(s) are detected, to
> >>>>> support external docking stations. On higher level, changes are:
> >>>>>
> >>>>> * Pass phy being trained down to all required helpers
> >>>>> * Run CR, EQ link training per phy
> >>>>> * Set voltage swing, pre-emphasis levels per phy
> >>>>>
> >>>>> This ensures successful link training both when connected directly =
to
> >>>>> the monitor (single LTTPR onboard most X1E laptops) and via the doc=
king
> >>>>> station (at least two LTTPRs).
> >>>>>
> >>>>> Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
> >>>>>
> >>>>
> >>>> Thanks for the patch to improve and add support for link training in
> >>>> non-transparent mode.
> >>>>
> >>>> Some questions below as the DP 2.1a spec documentation is not very c=
lear
> >>>> about segmented link training as you noted in the cover letter, so I=
 am
> >>>> also only reviewing i915 as reference here.
> >>>>
> >>>>
> >>>>> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> >>>>> Tested-by: Rob Clark <robdclark@gmail.com>
> >>>>> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
> >>>>> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> >>>>> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> >>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>> ---
> >>>>>     drivers/gpu/drm/msm/dp/dp_ctrl.c | 126 ++++++++++++++++++++++--=
-------
> >>>>>     1 file changed, 89 insertions(+), 37 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm=
/dp/dp_ctrl.c
> >>>>> index d8633a596f8d..35b28c2fcd64 100644
> >>>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >>>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >>>>> @@ -1034,10 +1034,12 @@ static int msm_dp_ctrl_set_vx_px(struct msm=
_dp_ctrl_private *ctrl,
> >>>>>         return 0;
> >>>>>     }
> >>>>>
> >>>>> -static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ct=
rl)
> >>>>> +static int msm_dp_ctrl_update_phy_vx_px(struct msm_dp_ctrl_private=
 *ctrl,
> >>>>> +                                     enum drm_dp_phy dp_phy)
> >>>>>     {
> >>>>>         struct msm_dp_link *link =3D ctrl->link;
> >>>>> -     int ret =3D 0, lane, lane_cnt;
> >>>>> +     int lane, lane_cnt, reg;
> >>>>> +     int ret =3D 0;
> >>>>>         u8 buf[4];
> >>>>>         u32 max_level_reached =3D 0;
> >>>>>         u32 voltage_swing_level =3D link->phy_params.v_level;
> >>>>> @@ -1075,8 +1077,13 @@ static int msm_dp_ctrl_update_vx_px(struct m=
sm_dp_ctrl_private *ctrl)
> >>>>>
> >>>>>         drm_dbg_dp(ctrl->drm_dev, "sink: p|v=3D0x%x\n",
> >>>>>                         voltage_swing_level | pre_emphasis_level);
> >>>>> -     ret =3D drm_dp_dpcd_write(ctrl->aux, DP_TRAINING_LANE0_SET,
> >>>>> -                                     buf, lane_cnt);
> >>>>> +
> >>>>> +     if (dp_phy =3D=3D DP_PHY_DPRX)
> >>>>> +             reg =3D DP_TRAINING_LANE0_SET;
> >>>>> +     else
> >>>>> +             reg =3D DP_TRAINING_LANE0_SET_PHY_REPEATER(dp_phy);
> >>>>> +
> >>>>> +     ret =3D drm_dp_dpcd_write(ctrl->aux, reg, buf, lane_cnt);
> >>>>
> >>>> For the max voltage and swing levels, it seems like we need to use t=
he
> >>>> source (DPTX) or the DPRX immediately upstream of the RX we are tryi=
ng
> >>>> to train. i915 achieves it with below:
> >>>>
> >>>>            /*
> >>>>             * Get voltage_max from the DPTX_PHY (source or LTTPR) up=
stream
> >>>> from
> >>>>             * the DPRX_PHY we train.
> >>>>             */
> >>>>            if (intel_dp_phy_is_downstream_of_source(intel_dp, dp_phy=
))
> >>>>                    voltage_max =3D intel_dp->voltage_max(intel_dp, c=
rtc_state);
> >>>>            else
> >>>>                    voltage_max =3D intel_dp_lttpr_voltage_max(intel_=
dp,
> >>>> dp_phy + 1);
> >>>>
> >>
> >> Before I update on the below set of questions from Alex, let me clarif=
y
> >> one point from Abel.
> >>
> >> Hi Abel
> >>
> >> Apologies to ask this late, but as per the earlier discussions we had
> >> internally, I thought we wanted to set the LTTPR to transparent mode t=
o
> >> avoid the issues. The per-segment link training becomes a requirement =
if
> >> we use non-transparent mode iiuc.
> >>
> >> In the description of the PHY_REPEATER_MODE DPCD register, it states
> >> like below:
> >>
> >> "A DPTX operating with 8b/10b Link Layer (MAIN_LINK_CHANNEL_CODING_SET
> >> register (DPCD Address 00108h) is programmed to 01h) may configure LTT=
PRs
> >> to either Transparent (default) or Non-transparent mode.
> >> A DPTX that establishes the DP link with 128b/132b channel coding shal=
l
> >> write
> >> 02h to the MAIN_LINK_CHANNEL_CODING_SET register and configure LTTPRs
> >> to Non-transparent mode."
> >>
> >> As per the msm dp code, we are using 8b/10b encoding, like below
> >>
> >> static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
> >>                           int *training_step)
> >> {
> >>           int ret =3D 0;
> >>           const u8 *dpcd =3D ctrl->panel->dpcd;
> >>           u8 encoding[] =3D { 0, DP_SET_ANSI_8B10B };
> >>
> >> So can you pls elaborate why we set the PHY_REPEATER_MODE to
> >> non-transparent mode because drm_dp_lttpr_init() will set the LTTPR to
> >> non-transparent mode.
> >>
> >> The second part of the section is what was described in the commit tex=
t
> >> of the 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling") but
> >>
> >> "Before performing link training with LTTPR(s), the DPTX may place the
> >> LTTPR(s) in
> >> Non-transparent mode by first writing 55h to the PHY_REPEATER_MODE
> >> register, and then
> >> writing AAh. This operation does not need to be performed on subsequen=
t
> >> link training actions
> >> unless a downstream device unplug event is detected."
> >>
> >> So just wanted to understand this better that was there any requiremen=
t
> >> to put it to non-transparent mode other than the section of the spec
> >> highlighted above? Because above lines are only suggesting that if we
> >> want to put the LTTPR to non-transparent mode, how to do it but not to
> >> always do it. Please let me know your comments.
> >>
> >> I shall also check internally on this to close this.
> >>
> >>
> >> Hi Alex
> >>
> >>>>
> >>>> But I do not see (unless I missed) how this patch takes care of this
> >>>> requirement.
> >>>>
> >>>> Same holds true for preemph too
> >>>
> >>> Thanks for you review,
> >>>
> >>> This is a very good point. You are right, in the present state it doe=
s
> >>> not. Intel's driver is verifying whether LTTPRs supports
> >>> DP_TRAIN_LEVEL_3 or only DP_TRAIN_LEVEL_2, while my current change
> >>> follows msm-dp's default which was recently set to DP_TRAIN_LEVEL_3
> >>> [1]. I came to conclusion that in particular case it was not required
> >>> to verify that LTTPR indeed supports training level 3, but do not
> >>> remember the details as its been a few months... should've document i=
t
> >>> :)
> >>>
> >>
> >>> As I recall, from one of the DP specs onward (has to be 1.4a then,
> >>> since LTTPR was initially introduced in DP 1.3, but register for phy
> >>> capabilities only added in 1.4a [2]) it mandates training level 3
> >>> support for LTTPRs, so the assumption would've be correct in that
> >>> case. Is this something you could verify from the official
> >>> documentation? Unfortunately I do not have sources to back this
> >>> statement, so it may be incorrect...
> >>>
> >>
> >> I went through DP spec 1.4(a), DP 2.0 and DP 2.1(a). This is what is
> >> mentioned below:
> >>
> >>
> >> "LTTPR shall support all required voltage swing and pre-emphasis
> >> combinations defined
> >> in Table 3-2. The LTTPR shall reflect its support of optional Voltage
> >> Swing Level 3
> >> and Pre-emphasis Level 3 in the VOLTAGE_SWING_LEVEL_3_SUPPORTED and
> >> VOLTAGE_SWING_LEVEL_3_SUPPORTED bits, respectively, in the
> >> TRANSMITTER_CAPABILITY_PHY_REPEATERx register(s) (e.g., DPCD
> >> Address F0021h for LTTPR1, bits 0 and 1, respectively)."
> >>
> >>   From this paragraph, it means that LTTPR support for levels 0/1/2 ca=
n
> >> be assumed and level 3 is optional. Whether or not level 3 is supporte=
d
> >> comes from the TRANSMITTER_CAPABILITY_PHY_REPEATERx register(s).
> >>
> >> This aligns with i915 implementation.
> >>
> >>
> >> Now, right after this, there is another paragraph in the spec:
> >>
> >> "If the DPTX sets the voltage swing or pre-emphasis to a level that th=
e
> >> LTTPR does not support,
> >> the LTTPR shall set its transmitter levels as close as possible to tho=
se
> >> requested by the DPTX.
> >> Although the LTTPR=E2=80=99s level choosing is implementation-specific=
, the
> >> levels chosen shall
> >> comply with Section 3.5.4."
> >
> > Hi Abhinav,
> >
> > Could you please provide the exact section number and DP spec version
> > for this paragraph? For reference in the commit message, see below.
> >
>
> This is in the section "3.6.7.2 8b/10b DP Link Layer LTTPR Link Training
> Mandates" of DP spec 2.1(a)"

Perfect, thanks.

>
> >>
> >> This tells us that even if we try to do a level3 and the LTTPR does no=
t
> >> support it, it will use the one closest to this.
> >>
> >> So overall, even though i915's implementation is the accurate one, the
> >> DP spec does mention that the LTTPR can adjust. I just hope all LTTPRs
> >> can adjust to this. Hopefully this clarifies the requirements spec-wis=
e.
> >
> > Thanks for this clarification, this is extremely useful. A bit sad
> > that DP spec is only available to VESA members.
> > So my assumption was indeed incorrect. This also explains why eg.
> > AMD's driver works, nice.
> >
>
> Yes. This was good to know.
>
> >>
> >> Hence I am okay with this change as such as multiple folks including u=
s
> >> have given a Tested-by but I would like this to be documented in the
> >> commit text so that full context is preserved. The only concern I have
> >> is I hope that the level to which the LTTPR adjusts will be correct as
> >> that again is "implementation specific".
> >
> > I started implementing i915's approach meanwhile, to see the
> > difference in behaviour. POC fixup for patch 3,4 of this series can be
> > found in [1]. Discovered something interesting:
> > * Dell WD19TB docking station's LTTPR reports support of training level=
 3
> > * PS8833 retimer in Asus Zenbook A14 reports support of training level =
3
> > * PS8830 retimer in Dell XPS 9345 claims to _not_ report support
> > training level 3. This is the case on two different machines with BIOS
> > 1.9.0 (PS8830 payload version 5.3.0.14) and BIOS 2.5.0 (PS8830 payload
> > version 9.3.0.01).
> >
> > This leads to interesting test results:
> > * Asus Zenbook A14 (PS8833, supports train level 3) with direct
> > monitor connection via Type-C works, both in current version of msm-dp
> > (aka AMD's approach) and with additional patches I linked above (aka
> > i915's approach)
> > * Dell XPS 9345 (PS8830, claims to not support train level 3) with
> > Dell WD19TB (supports train level 3) works, both in current version of
> > msm-dp and with additional patches I linked above. In this
> > combination, PS8830->WD19TB segment training succeeds with vs=3D2, pe=
=3D0
> > already.
> > * Dell XPS 9345 (PS8830, claims to not support train level 3) with
> > direct monitor connection via Type-C works with current version of
> > msm-dp, but does _not_ work with additional patches I linked above.
> > For PS8830->Monitor segment training, after reaching vs=3D2,pe=3D0 and
> > being stopped from going higher (due to PS8830 claiming it cannot do
> > train level 3), link training fails. With current msm-dp state
> > however, the same PS8830->Monitor segment training succeeds with
> > vs=3D2,pe=3D1. This is contrary to retimer reporting it does not suppor=
t
> > train level 3 - it in fact does, and in case with 1m long Type-C to DP
> > cable it only works with train level 3. Bug in P8830's LTTPR
> > implementation? :)
> >
>
> Wow, thats a very good finding!
>
> > Combining both patches linked above as well as debug patch to force
> > max train level to 3 like it was before [2], here are detailed logs:
> > Asus Zenbook A14, BIOS version "UX3407QA.305":
> > ```
> > phy #1: params reset                                                 #
> > training DPRX (phy1/PS8833)
> > phy #1: max_v_level=3D3, max_p_level=3D3                    # DPTX sour=
ce
> > (X1E) supports train level 3
> > phy #1: forcing max_v_level=3D3, max_p_level=3D3
> > phy #1: v_level=3D0, p_level=3D0                                      #
> > passes with vs=3D0,ps=3D0
> > phy #1: max_v_level=3D3, max_p_level=3D3
> > phy #0: params reset
> > # training DPRX (phy0/Monitor)
> > phy #0: max_v_level=3D3, max_p_level=3D3                     # DPTX sou=
rce
> > (phy1/PS8833) supports train level 3
> > phy #0: forcing max_v_level=3D3, max_p_level=3D3
> > phy #0: v_level=3D0, p_level=3D0
> > phy #0: max_v_level=3D3, max_p_level=3D3
> > phy #X: v_level=3D2, p_level=3D0
> > phy #0: v_level=3D2, p_level=3D0
> > phy #0: max_v_level=3D3, max_p_level=3D3
> > phy #X: v_level=3D2, p_level=3D1
> > phy #0: v_level=3D2, p_level=3D1                                       =
#
> > training passes with vs=3D2,ps=3D1
> > phy #0: max_v_level=3D3, max_p_level=3D3
> > ```
> >
> > Dell XPS 9345, BIOS version "2.5.0", PS8830 payload version "9.3.0.01":
> > ```
> > phy #1: params reset                                                 #
> > training DPRX (phy1/PS8830)
> > phy #1: max_v_level=3D3, max_p_level=3D3                    # DPTX sour=
ce
> > (X1E) supports train level 3
> > phy #1: forcing max_v_level=3D3, max_p_level=3D3
> > phy #1: v_level=3D0, p_level=3D0                                     #
> > passes with vs=3D0,ps=3D0
> > phy #1: max_v_level=3D3, max_p_level=3D3
> > phy #0: params reset                                                 #
> > training DPRX (phy0/Monitor)
> > phy #0: max_v_level=3D2, max_p_level=3D2                    # DPTX sour=
ce
> > (phy1/PS8830) claims to not support train level 3
> > phy #0: forcing max_v_level=3D3, max_p_level=3D3        # Ignore
> > advertised levels, force to max=3D3, otherwise training fails
> > phy #0: v_level=3D0, p_level=3D0
> > phy #0: max_v_level=3D3, max_p_level=3D3
> > phy #X: v_level=3D2, p_level=3D0
> > phy #0: v_level=3D2, p_level=3D0
> > phy #0: max_v_level=3D3, max_p_level=3D3
> > phy #X: v_level=3D2, p_level=3D1
> > phy #0: v_level=3D2, p_level=3D1                                     #
> > training passes with vs=3D2,ps=3D1 (aka train level 3)
> > phy #0: max_v_level=3D3, max_p_level=3D3
> > ```
> >
> > While, as you correctly mentioned, i915's implementation would be a
> > more accurate one, and I can respin to v5 with [1] applied to patches
> > 3,4 of this series respectively, it appears that at least on some X1E
> > based devices with PS8830 that would break DP output support at least
> > in some cases. The fact that the same device with the same monitor
> > works on Windows suggests that Windows driver also uses AMD's approach
> > of just assuming LTTPR can do train level 3, without verifying it, and
> > letting LTTPR figure the rest. I have asked other community members to
> > cross-check these findings on another X1E platform with PS8830
> > retimers. With this in mind, I am very glad to hear that you are okay
> > with this change as such, as it now appears that a more accurate
> > implementation would've caused additional issues.
> >
>
> Yes seems like it but certainly looks like a bug in PS8830.
>
> >>
> >> I would still like to hear from Abel though about whether setting to
> >> non-transparent mode was needed in the first place.
> >
> > Fwiw, without Abel's initial change DP output didn't work on X1E
> > platform at all, neither direct monitor connection nor docking
> > station. Not sure if that is because PS883x found in most X1E/X1P
> > laptops do not work in transparent mode at all (even though they
> > should've), or laptop's firmware would leave it in some weird state,
> > and perhaps re-enabling transparent mode would've also fixed it.
> >
> > Lets wait for Abel's answer and the rest of this conversation to be
> > resolved, and as I see it the next step would be for me to respin to
> > v5 current change as is, in order to update the commit message of 4th
> > patch to reflect the new findings and reference DP spec and section,
> > as per the first comment of this reply.
> >
>
> Yes correct, nothing else pending from your side.
>
> Thanks for your deep analysis and interest in this topic.
>
> > Thanks for your help,
> > Alex
> >
>
> By waiting for Abel, I am mostly trying to make sure :
>
> Was enabling non-transparent mode more of a requirement of the parade
> retimer chip in Xelite? Because from our earlier discussion, I thought
> we wanted to enable transparent mode. Then these issues would perhaps
> have not happened as per-segment link training is a requirement of
> non-transparent mode. So I am surprised how Xelite worked without this.
>
> It seems like to me we enabled non-transparent mode to match AMD/i915
> behavior and not as a requirement of the retimer chip of Xelite.
>
> The commit text of
> https://patchwork.freedesktop.org/patch/msgid/20250203-drm-dp-msm-add-ltt=
pr-transparent-mode-set-v5-4-c865d0e56d6e@linaro.org
> mentions
>
> "The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
> that before link training with the LTTPR is started, the DPTX may place
> the LTTPR in non-transparent mode by first switching to transparent mode
> and then to non-transparent mode. This operation seems to be needed only
> on first link training and doesn't need to be done again until device is
> unplugged."
>
> This talks about how to enable non-transparent mode and not why.
>
> But this part "It has been observed on a few X Elite-based platforms
> which have such LTTPRs in their board design that the DPTX needs to
> follow the procedure described above in order for the link training to
> be successful" is really my doubt. Because from my earlier
> understanding, I thought enabling transparent mode was enough.

To speed up the process a little as the 6.15-rcX window shrinks (and
it appears Abel may be OOO?), I run a series of tests to attempt to
answer your questions. In short - PS8830 is a very quirky device, and
you were right that the current implementation could've simply set
transparent mode.

To clarify the test matrix: PS8830 was tested with Dell XPS 9345.
PS8833 was tested with Asus Zenbook A14. Unfortunately, my dock (Dell
WD19TB) is a universal Thunderbolt/DP-Alt mode dock, and only works if
it's forced to DP alt mode, since PCIE tunneling is not yet supported
on qcom. Dell allows to disable thunderbolt/PCIE tunneling support in
BIOS, hence forcing the dock to be Type-C/DP-alt mode (and show up
with LTTPR onboard). No such feature exists on Asus, so I could not
test PS8833 with the docking station at all.

Complete test matrix;

1. Do nothing/pre Abel's series (LTTPRs assumed to be in transparent
mode unless firmware pre-configured them):
PS8833:
- Type-C to HDMI: works almost always
- Type-C to DP: never works, EDID read fails

PS8830:
- Type-C to HDMI: never works, CR LT fails (-22)
- Type-C to DP: never works, EDID read fails
- Type-C to dock: never works, EQ LT fails (-110)

2. Explicitly set LTTPRs to transparent mode (early exit LTTPR helper
introduced by Abel, after setting transparent mode, but before setting
non-transparent mode):
PS8833:
- Type-C to HDMI: works. Occasionally fails to get DP sink modes (may
be unrelated)
- Type-C to DP: works**

PS8830:
- Type-C to HDMI: works
- Type-C to DP: works**
- Type-C to dock: Sometimes all works. Sometimes video works, but USB
(2.0 nor 3.0) is not working. Sometimes EQ LT fails (-110) and nothing
works. Overall extremely unstable.

3. Explicitly set LTTPRs to non-transparent mode (aka Abel's series):
PS8833:
- Type-C to HDMI: never works, CR LT fails, max v_level reached (-11)
- Type-C to DP: never works, CR LT fails, max v_level reached (-11)

PS8830:
- Type-C to HDMI: works
- Type-C to DP: works**
- Type-C to dock: never works, CR LT fails (-110)

4. Explicitly set LTTPRs to non-transparent mode, support per-segment
training (aka Abel's initial LTTPR support series + this series):
PS8833:
- Type-C to HDMI: works
- Type-C to DP: works

PS8830:
- Type-C to HDMI: works
- Type-C to DP: works
- Type-C to dock: works


** At first, Type-C to DP was frequently/always depending on the use
case failing to read panel EDID, just like in the 1st test case. As I
am 100% certain it worked in the past, did a few more tests. It
appears that in an earlier version of Abel's patch (<=3Dv4), DPRX caps
were read _after_ LTTPR init, just like DP standard mandates (don't
have exact quote, something along the lines 'source shall re-read sink
caps after LTTPR init'). In v4 there was a suggestion [1] (from you
actually :)) to first try to read DPRX caps, then init LTTPRs in order
to fail early if caps readout fails. Reverting this change fixes EDID
read error. Since I was running Abel's series long before it landed, I
never used the broken v5. With the order of functions reverted, Type-C
to DP started working/failing in the same way Type-C to HDMI dongle
did, just as expected. Wrt to the issue itself, the first patch of
this very series actually both fixes this issue by conforming to DP
spec, and also takes into account your suggestion in Abel's v4 series
to be able to fail early in case of DPRX caps readout failure.

To summarize the findings:
- PS8830 is a very quirky device. It does not work in
default/transparent mode unless explicitly set. It does work in
non-transparent mode without per-segment training, even though it
should've not. As per last email, it is lying about not supporting
training level 3.
- PS8833 seems to be a fixed version of PS8830. It does work in
default/transparent mode oob. It does not work in non-transparent mode
without per-segment training, just as expected. As per last email, it
correctly reports training level 3 capability.

To answer some of your questions (from a 3rd party view, cannot speak
for the authors):
- "So I am surprised how Xelite worked without this." - From tests
above: PS8830 worked when it should've not, seems because it's quirky.
PS8833 did not work, which makes sense.
- Doubts about non-transparent mode requirement for X1E/X1P systems -
From tests above: seems you are right. I don't know why it was forced
to be non-transparent without per-segment training, instead of simply
transparent. Though, seeing how weird the PS8830 is, I wouldn't be
surprised if it behaves differently in other laptops... just
speculating though.
 - "Was enabling non-transparent mode more of a requirement of the
parade retimer chip in Xelite?" - cannot fully answer. Initializing
LTTPRs as such appears to be a requirement of the Parade PS8830 (not
PS8833, which wasn't around back then afaik), as it just wouldn't work
oob. Choice of non-transparent instead of transparent mode is not very
clear to me.

Even though it appears initial LTTPR support could've been done
slightly differently, combination of those initial patches + this
series seem to provide both the best practical results, as well as
most (well, almost, excluding LTTPR's train level verification)
accurate LTTPR implementation, while also making msm-dp similar/up to
date with Intel/AMD's LTTPR implementation. Also learned something new
today myself, don't buy PS8830 :)

Looking forward to hearing from you,
Alex

[1] https://lore.kernel.org/all/feb4f780-8fe6-426b-9ba4-ab1fb102ac27@quicin=
c.com/




>
> > [1] https://github.com/alexVinarskis/linux-x1e80100-dell-tributo/tree/m=
sm/dp-lttpr-segment-lt
> > [2] https://github.com/alexVinarskis/linux-x1e80100-dell-tributo/tree/m=
sm/dp-lttpr-segment-lt-debug
> >
> >
> >>
>
> <snip>

