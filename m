Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612492B71D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 23:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbgKQWxF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 17:53:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbgKQWxF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 17:53:05 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03B7C0617A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 14:53:03 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id 18so1663457pli.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 14:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Ce5mdOiUnXdpgxCp5xEN1C00ke4lV/R4t5KP7C9QieU=;
        b=lpuXNOnoMJPZCqJXzeKrt0bjw4/lBl9bLgEmGMpS9SlE6ATrhwz3JE00zeefPVNRyE
         SmBlnlNZNbh0M/9eC1gsvbObC5dvzN8ha7DagBcePbYJwkaNToAum5xcWOWe4M9GJVUH
         MjjJWm6VpC2Z1Ato6DZxLnyIxWJllMJ8w39a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Ce5mdOiUnXdpgxCp5xEN1C00ke4lV/R4t5KP7C9QieU=;
        b=bbbwA0VavwJVoVCjAcKtDiVRBJGyqMaHcGXpQIYM7vXVwqJp8ILaSTuNuHgDZKVxnC
         rD27p5pWkPmDPRMlOvs7HrmDmKM56OYKM0nbL9HbijPz4/KJ6VwLsF8IbFI6OoasDwuU
         crqn/CRaWpSPktRmGx+A9B0x6ZvdiQrpm9Avs9nLnNeU6aGIgSDR8AI1+O124zusLIXI
         Dm10GOjZ9mjE3w/ppEjWEyvDGUa1s1NYTMpmosk4xi+2EMb+y8SDylhZXbgA1RyaA7Mz
         +WpwiUDczm1u2XQF386gSeENyOH163Am79SZL86Tzqw7MG9iG9XhhAVJO075rQ5r7sbv
         D1dA==
X-Gm-Message-State: AOAM533oIweBJ/rUhgZy24nzsn+1iZ5dDcAlTfUHUNCNFquUjTWTgyvH
        /Oc8i7g0nnCVGKXvOHvntaCjrA==
X-Google-Smtp-Source: ABdhPJyjPQ5ZJcnbca+0zpUp5+RhAj0mYPzGqNb46PCd3r24FPJ1Ddl2hsvuztEftWzQK9r9fBJuPw==
X-Received: by 2002:a17:90a:d486:: with SMTP id s6mr1202521pju.115.1605653583407;
        Tue, 17 Nov 2020 14:53:03 -0800 (PST)
Received: from chromium.org ([100.99.132.239])
        by smtp.gmail.com with ESMTPSA id p7sm12688384pfn.83.2020.11.17.14.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 14:53:02 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <71aebca216babf4010c92d4d1ce9a9b4@codeaurora.org>
References: <20201117172608.2091648-1-swboyd@chromium.org> <71aebca216babf4010c92d4d1ce9a9b4@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Remove chatty vbif debug print
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        kalyan_t@codeaurora.org
To:     abhinavk@codeaurora.org
Date:   Tue, 17 Nov 2020 14:53:01 -0800
Message-ID: <160565358127.60232.4382778730228368993@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting abhinavk@codeaurora.org (2020-11-17 12:34:56)
> On 2020-11-17 09:26, Stephen Boyd wrote:
> > I don't know what this debug print is for but it is super chatty,
> > throwing 8 lines of debug prints in the logs every time we update a
> > plane. It looks like it has no value. Let's nuke it so we can get
> > better logs.
> >=20
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>=20
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> > index 5e8c3f3e6625..5eb2b2ee09f5 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> > @@ -245,9 +245,6 @@ void dpu_vbif_set_qos_remap(struct dpu_kms=20
> > *dpu_kms,
> >       forced_on =3D mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl=
,=20
> > true);
> >=20
> >       for (i =3D 0; i < qos_tbl->npriority_lvl; i++) {
> > -             DPU_DEBUG("vbif:%d xin:%d lvl:%d/%d\n",
> > -                             params->vbif_idx, params->xin_id, i,
> > -                             qos_tbl->priority_lvl[i]);
>=20
> Instead of getting rid of this print, we should optimize the caller of=20
> this.

Does the print tell us anything? Right now it prints 8 lines where it
feels like it could be trimmed down:

           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:0/3
           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:1/3
           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:2/4
           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:3/4
           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:4/5
           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:5/5
           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:6/6
           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:7/6

maybe one line that combines the index into values?

           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 [3 3 4 4 5 5 6 6]

But again I have no idea if this print is really useful. Maybe we can
print it only if the value changes from what was already there?
Basically move the print into dpu_hw_set_qos_remap() and then skip out
early if nothing changed or print and modify the register.

> This is what
> we are doing in downstream. So we need to update the property only if we =

> are switching from a RT client
> to non-RT client for the plane and vice-versa. So we should try to do=20
> the same thing here.
>=20
>         is_rt =3D sde_crtc_is_rt_client(crtc, crtc->state);
>         if (is_rt !=3D psde->is_rt_pipe) {
>                 psde->is_rt_pipe =3D is_rt;
>                 pstate->dirty |=3D SDE_PLANE_DIRTY_QOS;
>         }
>=20
>=20
>         if (pstate->dirty & DPU_PLANE_DIRTY_QOS)
>                 _dpu_plane_set_qos_remap(plane);
>=20

Sounds great! Can you send the patch?
