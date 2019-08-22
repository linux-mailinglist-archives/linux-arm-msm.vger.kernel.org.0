Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3BD89986D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 17:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732473AbfHVPpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 11:45:47 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33745 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732460AbfHVPpr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 11:45:47 -0400
Received: by mail-ed1-f65.google.com with SMTP id s15so8631838edx.0;
        Thu, 22 Aug 2019 08:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GYu7zsBdj1jnCt6c3x3YjXV2Cnd1ioGPP+PRK3JHESc=;
        b=IGE5sSHQKv6OSUMGtyTjSZSn712cmN6asq206J67r0R5nE9K9ajyrPYzS8mf3698xO
         /Bf1k1CfJv5B/Di5xZZK2l8vrXDhw36tvH84o/gVegxcYI7CnOSHUFVaxvNnYWwfdKuD
         tFEHWpeHgWMDehvzUMuM1ossD++xxpRK7QIEx+ISMSqfzpRMTKEaVW0nU0xsSrKmblEb
         0IfyFft60u/eVwjp12clVdCIf/njfXBlxp/E+xiwnj9EHc6AtPvJZ5hZ0WEZw3FR28Ac
         rE1+oZaurtozP2Ku1CeI9x8OiEqRhc1W6xSleNS31lsz8CL5mq5DFP02ReZYtyAo+SkM
         j4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GYu7zsBdj1jnCt6c3x3YjXV2Cnd1ioGPP+PRK3JHESc=;
        b=MJyyyES66J7uI0IUrQ1SNLJjCxF6NNdpzQETrV1iMFycjL5osXFw98MiilYyVIfkCj
         fXiizvVDTh7bY8RlQTQl+0DQjN7kgv2EwIYqNi9081l6SfJJWMhXDRm7OrAgcnIPldPS
         6r+rI6CiAxERGHht1kPEL5VvKkCAwh64bL08zkBxkmKmgNHu5Jo5oR8WBgZW/8Nni0Xs
         g/zHn1n/GVrfttefW4yUkRAOMkJ+nHwL+w8vB3oCAtl1HJ2EK13i3kUO3t7rVYOpEtOL
         Xi6aJ80D2U710lwMbK0Db670ZKuNlHUD/wYVm5NkUNth5HscilwhP5ZAyUXy2h084C4K
         YLIw==
X-Gm-Message-State: APjAAAWwXcMAkMDVqxiHw/SFmmLtYa3JnBYkjrn6N1Zeja2+1lg//w2k
        8THOgORSsFsrYHRh9dLxZN9xBZ2c+E6REFflhJQ=
X-Google-Smtp-Source: APXvYqw6+5qAoTilFTwi7FVNMPf6lYbD6sLsar4I5GBuXGtchjEIQXsi/LtP+QemR24ZypLxHTOFZiYB9fSrC2jZYrM=
X-Received: by 2002:a17:906:228e:: with SMTP id p14mr3235779eja.258.1566488745872;
 Thu, 22 Aug 2019 08:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190822015756.30807-1-robdclark@gmail.com> <20190822122652.GM5942@intel.com>
In-Reply-To: <20190822122652.GM5942@intel.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 22 Aug 2019 08:45:34 -0700
Message-ID: <CAF6AEGv4=PTJtD6au1=j-fe0BaDMsDHW0dTe+-GojOD1sh+o+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: add rotation property
To:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Fritz Koenig <frkoenig@google.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bruce Wang <bzwang@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 22, 2019 at 5:26 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Aug 21, 2019 at 06:57:24PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 45bfac9e3af7..c5653771e8fa 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1040,8 +1040,21 @@ static void dpu_plane_sspp_atomic_update(struct =
drm_plane *plane)
> >                               pstate->multirect_mode);
> >
> >       if (pdpu->pipe_hw->ops.setup_format) {
> > +             unsigned int rotation;
> > +
> >               src_flags =3D 0x0;
> >
> > +             rotation =3D drm_rotation_simplify(state->rotation,
> > +                                              DRM_MODE_ROTATE_0 |
> > +                                              DRM_MODE_REFLECT_X |
> > +                                              DRM_MODE_REFLECT_Y);
> > +
> > +             if (rotation & DRM_MODE_REFLECT_X)
> > +                     src_flags |=3D DPU_SSPP_FLIP_UD;
> > +
> > +             if (rotation & DRM_MODE_REFLECT_Y)
> > +                     src_flags |=3D DPU_SSPP_FLIP_LR;
> > +
>
> UD vs. LR (assuming those mean what I think they mean) seem the wrong
> way around here.

ahh, right, reflect "along" vs "around"..

BR,
-R

>
> >
> >               /* update format */
> >               pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw, fmt, src_f=
lags,
> >                               pstate->multirect_index);
> > @@ -1522,6 +1535,13 @@ struct drm_plane *dpu_plane_init(struct drm_devi=
ce *dev,
> >       if (ret)
> >               DPU_ERROR("failed to install zpos property, rc =3D %d\n",=
 ret);
> >
> > +     drm_plane_create_rotation_property(plane,
> > +                     DRM_MODE_ROTATE_0,
> > +                     DRM_MODE_ROTATE_0 |
> > +                     DRM_MODE_ROTATE_180 |
> > +                     DRM_MODE_REFLECT_X |
> > +                     DRM_MODE_REFLECT_Y);
> > +
> >       drm_plane_enable_fb_damage_clips(plane);
> >
> >       /* success! finalize initialization */
> > --
> > 2.21.0
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
