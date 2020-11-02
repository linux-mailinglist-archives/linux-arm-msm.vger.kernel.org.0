Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7652A36ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 00:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgKBXGa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 18:06:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgKBXGa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 18:06:30 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348E0C0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 15:06:29 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id j18so12530704pfa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 15:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=MiCRiUAdPtsLXaGvjbQBzyyJUrnFc6MXAvKphG8N+fw=;
        b=HB2VQ4LipmHehQpflvi4jZaT8TKSiBlksAPjBkdBtZAkd/+vReYZbE7CruYplu56vx
         OQZ+WkZKBw7mHQ0ubIR+Y6ijsFl0EAf+hc469Q5L1I3uqnhseQG8ZETWKV7AfAk0hBiK
         6AEBoGWexiK1cNYCtHR2WqmzEmoagJZ4esUjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=MiCRiUAdPtsLXaGvjbQBzyyJUrnFc6MXAvKphG8N+fw=;
        b=NRubtCXlDL26rn6UoFY2IoQ5r1HbhoPCPix/l1Mh1d5l6nxAOmUsfwlXJgb2RMGxgV
         oFhuJFN8OhSuwwdIjDgRy+DhmiJj2dhWIVJ2ndUHtvTxQugcdKJxI35KjUwjvdI1nJzC
         OOL+8pV5WV+H1e10v86QTbbNL8U6PQiYFROgdoSzXo3OI2R+UQhEahi64JHgUSmN7UDJ
         pDOKrO7tVGb5+Lq0SxED471WbjsUqguKC/LFkZSr5WjWIOHil+q2ZSpEVUj2PF2mmyPC
         B2CFHiblL52B28HNJe5PxFsaCaNarJGlTaDv5laByo93RjunVB1ov6FOmqc3+xIJMZmh
         QslA==
X-Gm-Message-State: AOAM533M9GUmLDcMlFpW9IOPnLguttv6U4D1YA8+grL7fFciOHuu6Tde
        jgkw63Ts7WPb25xTOIM+6ewPCJWK8/qRzw==
X-Google-Smtp-Source: ABdhPJxZLj/rSGcCridPBQV5YFibWzWNNb2SEwrfK11Q8oy7fvvspH7TS8SeClh60+6vrfnZ4WCC7A==
X-Received: by 2002:a17:90a:ed97:: with SMTP id k23mr540562pjy.100.1604358388782;
        Mon, 02 Nov 2020 15:06:28 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id w10sm499336pjy.57.2020.11.02.15.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 15:06:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <99476b913b8b6ed28fc7af8e80c6db52@codeaurora.org>
References: <20201029205509.13192-1-abhinavk@codeaurora.org> <160435199458.884498.6173218904854698184@swboyd.mtv.corp.google.com> <99476b913b8b6ed28fc7af8e80c6db52@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: do not notify audio subsystem if sink doesn't support audio
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        khsieh@codeaurora.org, robdclark@gmail.com, nganji@codeaurora.org,
        seanpaul@chromium.org, tanmay@codeaurora.org,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
        cychiang@chromium.org
To:     abhinavk@codeaurora.org
Date:   Mon, 02 Nov 2020 15:06:26 -0800
Message-ID: <160435838669.884498.2757039786150233129@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting abhinavk@codeaurora.org (2020-11-02 14:43:33)
> Hi Stephen
>=20
> Thanks for the review.
>=20
> On 2020-11-02 13:19, Stephen Boyd wrote:
> > Quoting Abhinav Kumar (2020-10-29 13:55:09)
> >> For sinks that do not support audio, there is no need to notify
> >> audio subsystem of the connection event.
> >>=20
> >> This will make sure that audio routes only to the primary display
> >> when connected to such sinks.
> >>=20
> >=20
> > Does this need a Fixes tag? Or it's just an optimization patch?
> This is an unhandled corner case ( VGA dongle ) for DP audio and will=20
> make
> sure we do not switch audio output from primary to external when=20
> connected to
> a sink which does not support audio.
> I thought of adding a fixes tag pointing to=20
> https://patchwork.freedesktop.org/patch/390236/.
> But at the same time, thought this can go in as a standlone patch as=20
> well.
> If you think its required, I will add the fixes tag pointing to the base =

> audio patch.

Yeah Fixes is nice so we know what is fixed.

> >=20
> >> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> >> ---
> >>  drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++--
> >>  1 file changed, 10 insertions(+), 2 deletions(-)
> >>=20
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c=20
> >> b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 4a5735564be2..d970980b0ca5 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -555,8 +555,16 @@ static int dp_connect_pending_timeout(struct=20
> >> dp_display_private *dp, u32 data)
> >>  static void dp_display_handle_plugged_change(struct msm_dp=20
> >> *dp_display,
> >>                 bool plugged)
> >>  {
> >> -       if (dp_display->plugged_cb && dp_display->codec_dev)
> >> -               dp_display->plugged_cb(dp_display->codec_dev,=20
> >> plugged);
> >> +       struct dp_display_private *dp;
> >> +
> >> +       dp =3D container_of(g_dp_display,
> >=20
> > What is g_dp_display? I guess this doesn't compile?
> g_dp_display is the global dp_display pointer in the dp_display.c file.=20
> It does compile.

Oh gross. Can we not use it if dp_display points to it?
