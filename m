Return-Path: <linux-arm-msm+bounces-89972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDmcA1ulcGlyYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:07:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4C254EE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D4D784438C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D87944B66B;
	Wed, 21 Jan 2026 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VqVclzHd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587233ACA48
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988846; cv=pass; b=ckXWfJxoBRHtSIigOE3Si6vd+93iAMXP9VIaLIcXoypkVqGgMOkMzLbFsmvbSR4GPPF21tBMxyJ5SYeNNsZz2LMIu1W+poezFyoWFCX0wzyUOXgVRlrLkDxDjVHVHWegg0A2GB5v5y/AnQko0ZmP4Nhp2kEQNbpbkKrneb9hWII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988846; c=relaxed/simple;
	bh=3Mvt6+KoxcJvnA6DvqizzvnhMO2wBpwTanx783dQ/S0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftHSNjnAsXoh3F6egmcs+5zYAVHu7z9EX/7SN748oXIA659XmNI/DSSLAGeWtq0Ts5s+P4Yh5ANb3h2AQ2CsVBzkBPWm/1+H8ieCVFCJ7+JmL08nZkyA/VSGLj0LuokTeQK8Sa9r8CSyg6CWL4ylaSTAGMGC3gzrLp7ulx4WrIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VqVclzHd; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7927541abfaso61416587b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:47:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768988843; cv=none;
        d=google.com; s=arc-20240605;
        b=LewJe2j3oqxOpdIHV7f3p4Wlo2c3f4N2bpyTGmXarqsaNUelUiK5PijND8kL7rFQwV
         sDbGwm/a7tD+p2B4AjBpeelpbDKVOTxwD6Nk84XBianNCQAbH9yx66NiCyf/BdjSW4rY
         i4zjcg2ZlwAgiySkPYl+ncE+Wda67MHfF52FTf0d+YHmYwpHWYx1F919u4sO5kk+Zlm8
         6nVyYSrbGcJzw4T0QimJ0GFCrabhdxgQyino01f1Q5k7guLcqDGy+bGGOmes63Eg1ZeF
         chUtqyQKrZQD5utMkmY7d9BADvYhEtD/h7NignfwmN2qhM2N3Aybo1bA38uy/I2c5A4+
         TzCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yzpzBhx+tgtelMf0JL+10tIUjjzmad8fmPtlVfu/TV4=;
        fh=Mk3CbQWCziItfxdPETX98CV/ccErtanNyIUkojEb+YA=;
        b=ZJsI4/kzp7CbZ8rXZa9y9F1JhCl0Sfd8lPoQP9+yUU6xwVuIKwPoL7zZj966Tza0J4
         4bAaA/19hp0QLtrYTiQzVsi5q7DZCpG1p/yuaxa90T25whG9wk5ryWWEIGvbeOCXY2f6
         Xt2raJrlCRKaQIK1nUB8oXUErnhNSX6lvdXR5aOWLXFscC5GOVSPaztrc1gcekXLpA32
         EKpJ8LB8JIdid+kWQJKWQ1WZeflhP8GNik53BoYsBFGvWZJHSdRQQxG+4b7UawMXZpJS
         Bs/+Mt7r7boAHg+Y4LgwmIuu7ioudexz65l6c4nrJtii6EfUTeFcLB+zJl6uTQF/vJ4Z
         LMHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768988843; x=1769593643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzpzBhx+tgtelMf0JL+10tIUjjzmad8fmPtlVfu/TV4=;
        b=VqVclzHdBRMKcpoIo9xUNH+6veseqeE1hc64FEjupOM+/ehIiPiMQwB7VSROdS5+mR
         RWbL5rv0340MDmq0NcQMbPYXR0lDsdYs+qWH5+fw2KWL92cOu9BlmPVzLELEQHwi406d
         a4jslfB3csg3hz3iO02UhIMuMu0o5Fksv4LCXucrwhpO4SXl54f3YZPLKX28p2OlbxlM
         Ld4HrjV5JNFTlquNartz7sRNGCNmMQwSF93BdNo2J1DTSXHMo/7HTyXKgz0zkMtJNlCw
         uirtLOQRXbf2EpITP8S8NPie/HaW5cX7Pw+DJxEpPx11Ug4vU5Vc7+k+nGU4dHNtswUl
         tPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768988843; x=1769593643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yzpzBhx+tgtelMf0JL+10tIUjjzmad8fmPtlVfu/TV4=;
        b=Yd6F09M7Je7yGdYgJ6l29EpzvHO+Al37bNbdmqejtWPkAYVw4Zsnb0XDS34tDLSs9R
         5aCb1+eOTGUYZMOqWc5RvV2/oeUj3ux0+A37HfS1cZ/zn2IFUzHFtgvTFGt3XLgFAG4h
         B8HfvK0uJ3RufniUbLf64FhBagw5Xu+qygq8ZfoRL2+bDctEvbLQq6Dp1CVT3mfHSUYh
         3c878hA3MO+sgbAUzA+fCU3qF2yFjVqsVSnLZ7g6Tj6REhTPBIHvxZSbbXrw8oCVR0Yl
         yiXIoheQNQuvzmwJdAm0nyCeHOOqiVoGM90Q2CXwDcfWO/3xFRAKaDqMAMJYt7et3jjT
         mNoA==
X-Forwarded-Encrypted: i=1; AJvYcCUVCOejy3P/ChXifndMsONJmEDizReS47bKcx6ynabtOraFYLE8uSINf9rZ5L8zHsgBWqvXFPEG7iToCFMq@vger.kernel.org
X-Gm-Message-State: AOJu0YyMWDJZrGTVgIgF0vlmxcWJ+Hd+EYM2g5oST7H+m7Yp6exreTHm
	X3r+KuPRDoDxev0Q0rBaX4ayN/9Lqoz6JWO8adFZxAKT+swlcJGPvcA0S80e7lHlynL4dCmp6c3
	iD01bOSHr002XbAaIyz3RkXtJ8Hyr3w5fHbyON0Yk/A==
X-Gm-Gg: AZuq6aINLmQXXJQpTSiYIItsfsL2Z9d2FbdoPXGxUousjtu2Ho4zj1vPUfab7qN5T1v
	NPLqxcLUUOO1l+orVGfKx0Uke+nvIxXqbsWXcXH8zbD2XHMRk+yY8rbh/Qgj0aael4+af70v25A
	+XXl8W2v1Qtx0y1xSW9rB9FBVuiQ8EOi0jvb2HBO/Sq/zBR6vRw4v+Vrzaiu98Wny+LNWF0p5Vz
	q8HExLIso2T7kvWLRIhZitp08eJoHjuD66SGpXfkJW7iVWt00fiHApqYp3SfuUd3VyN8qM=
X-Received: by 2002:a05:690e:4084:b0:640:b8ef:b777 with SMTP id
 956f58d0204a3-6493c855d73mr3562332d50.69.1768988843214; Wed, 21 Jan 2026
 01:47:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-1-6eb6d8675ca2@linaro.org> <6ymh64lnipo5pncnrlipbb6zl5xyxxnaqieg52hrylmknqumyj@ovaspuihqzy6>
In-Reply-To: <6ymh64lnipo5pncnrlipbb6zl5xyxxnaqieg52hrylmknqumyj@ovaspuihqzy6>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 21 Jan 2026 17:47:12 +0800
X-Gm-Features: AZwV_QjNYOBELD3O1oGAJpYM1DqkSzjERA88OueFZGWPOmcvrGSqTlahCkJyR1E
Message-ID: <CABymUCOSNtWoNRAxTheqkLxJM8kWYwQoR7=HJdKdsJwfC9NVLg@mail.gmail.com>
Subject: Re: [PATCH v17 1/4] drm/msm/dpu: Extract plane splitting into a
 dedicated function
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89972-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,linaro.org:email,linaro.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8F4C254EE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:29=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Jan 21, 2026 at 04:01:50PM +0800, Jun Nie wrote:
> > dpu_plane_atomic_check_nosspp() currently handles both plane
> > validation and plane splitting. For better simplicity and to
> > facilitate future refactoring, move the splitting logic into
> > its own dedicated function.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 51 ++++++++++++++++++++++-=
--------
> >  1 file changed, 36 insertions(+), 15 deletions(-)
> >
> > @@ -879,6 +866,34 @@ static int dpu_plane_atomic_check_nosspp(struct dr=
m_plane *plane,
> >               if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SI=
ZE)
> >                       return -E2BIG;
> >
> > +     pstate->needs_qos_remap =3D drm_atomic_crtc_needs_modeset(crtc_st=
ate);
> > +
> > +     return 0;
> > +}
> > +
> > +static int dpu_plane_split(struct drm_plane *plane,
> > +                        struct drm_plane_state *new_plane_state,
> > +                        const struct drm_crtc_state *crtc_state)
> > +{
> > +     struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> > +     struct dpu_kms *kms =3D _dpu_plane_get_kms(&pdpu->base);
> > +     u64 max_mdp_clk_rate =3D kms->perf.max_core_clk_rate;
> > +     struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
> > +     struct dpu_sw_pipe_cfg *pipe_cfg;
> > +     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > +     uint32_t max_linewidth;
> > +
> > +     if (!new_plane_state->visible)
> > +             return 0;
> > +
> > +     /* move the assignment here, to ease handling to another pairs la=
ter */
> > +     pipe_cfg =3D &pstate->pipe_cfg[0];
> > +     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > +     /* state->src is 16.16, src_rect is not */
> > +     drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > +
> > +     pipe_cfg->dst_rect =3D new_plane_state->dst;
> > +
> >       max_linewidth =3D pdpu->catalog->caps->max_linewidth;
> >
> >       drm_rect_rotate(&pipe_cfg->src_rect,
> > @@ -910,8 +925,6 @@ static int dpu_plane_atomic_check_nosspp(struct drm=
_plane *plane,
> >                                   new_plane_state->fb->width, new_plane=
_state->fb->height,
> >                                   new_plane_state->rotation);
> >
> > -     pstate->needs_qos_remap =3D drm_atomic_crtc_needs_modeset(crtc_st=
ate);
> > -
> >       return 0;
> >  }
> >
> > @@ -1129,6 +1142,10 @@ static int dpu_plane_atomic_check(struct drm_pla=
ne *plane,
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D dpu_plane_split(plane, new_plane_state, crtc_state);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (!new_plane_state->visible)
> >               return 0;
> >
> > @@ -1169,6 +1186,10 @@ static int dpu_plane_virtual_atomic_check(struct=
 drm_plane *plane,
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D dpu_plane_split(plane, plane_state, crtc_state);
> > +     if (ret)
> > +             return ret;
>
> Why can't it be moved after !visible check? It's the first check in the
> function code.

Surely it can be moved after !visible check and it is a better place. Placi=
ng
 it just after dpu_plane_atomic_check_nosspp() is because
it is splitted from it. And it does not matter actually, because
dpu_plane_split() is moved to the deferred part
dpu_plane_virtual_assign_resources()
in the later patch. So that topology information is ready at that stage.

>
> > +
> >       if (!plane_state->visible) {
> >               /*
> >                * resources are freed by dpu_crtc_assign_plane_resources=
(),
> >
> > --
> > 2.43.0
> >
>
> --
> With best wishes
> Dmitry

