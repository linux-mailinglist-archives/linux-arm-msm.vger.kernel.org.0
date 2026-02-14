Return-Path: <linux-arm-msm+bounces-92848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Pd4D5BOkGnUYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 11:29:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BEF13BACA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 11:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33A08300EFA6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 10:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB8827A107;
	Sat, 14 Feb 2026 10:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QbLIQEPB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F62222CB
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771064973; cv=pass; b=idPpfLoYSonOrC8f/BJ+lZrccLtoG9NQ4LZzhkinpVb493GkY2vYeZiX2CkyHv7ot/PPFXPR7GjBwD8B6UVyiqKPapRK/pM+MDPi1VBcaSpFxsF2kJOmI21BzkplfpKG991G7LAt90K30YGJw+M4PNWzWSQN1+OLL6kfhDMudak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771064973; c=relaxed/simple;
	bh=ELfvqOMWvspDdwzfypb7d8Tfy8aal6QeVOAb0xFjo9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRYrhRjthzCYb8pJpHjkBzeLZ9god9dKf4fTMOQoIz7Zum1XXaVuo6vLdCMX9sClui/PHUcKe6MKJuJTXg+s0/txD6n4aUbNTmkahKwRWrbIMd05RlmZhkO/mWRb4LpAcd2fqyJfn4UcbnmAMdutXCJx9v+o30nUvEJAFf0zBT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QbLIQEPB; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-649e97f1e99so1622892d50.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 02:29:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771064971; cv=none;
        d=google.com; s=arc-20240605;
        b=Cd1TE4iWTtCVrBer5TTdLzfdhGwBdBEc1RfdH2vIo2CPR6XJuQb2oN4bqJkbVfNlXN
         LtUxQjSMthcuZg8zNJeunoqrTrkq0JEY5N4hrDtiMEBzxq0TSeDcoV8sv5pSo9s3wpYc
         1XAiNwPtuiZQUPr+HCMcZfLt/EGHD79VsWqceZOLBpwT5k7RtSWMu53bzrpZJ/n/Wo+e
         TcLfStnIKoaZE/Ak6hmM000ZFls0VQCca8WAkz+2ILYgbZUQrYdDF0kgtS29nxsbWGsb
         YNgJgw9U0qVW/eSJM111yuWOtoBwwpcqJvcL4zzpwAcXjSwphxRbexvEOprM3rq5ozQy
         N4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gcmTHiPmRVpe2FcnwvwiyGljW5AeBLZNUuFg0iLgKKU=;
        fh=agrYCj2rrM4KzOUVe3ysqDqyNM4nrT9Pv1X1NNCEF0I=;
        b=IcS3tZFb96gk+SGEg99CeaJjAmSqrcwAB1Hvual/iWrLCI3SkBziJHU5Ed/w3MLj38
         8Yb+qAnEDtkrP+eXjdmrl7IJD/00uSuy7mCUDo84T93NXxZkKIa6Weu435gwM+AetJBF
         pNE9G8YKmxXFe8t9st3cvvzk8EosUTCwREylZaB6PFKZptbvIHlqktWssuhu3vD9wKFG
         kWbMWEUVcHV88FDBPLwEKtb5sjsdoG/bskAgfwEG0JAWBnYbsjngj4MuGo1DKPKDIBue
         KvaedS8iRpxkWXItakbdbH96pYNJF7InY6PQ+U99hJr+ZNNc2s8Kqve0p9yYCMm1zaqS
         2gcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771064971; x=1771669771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcmTHiPmRVpe2FcnwvwiyGljW5AeBLZNUuFg0iLgKKU=;
        b=QbLIQEPBTdwqN8LBqCBXowdVV9D06QmViYfvCUiyg2QyGQZNzLeK6Bz0B/xZdTkAwA
         9mt6e6dfA4EL2omxLuvesTaIes9rQ49wRBOahgkylVuFcOLB8XXZFLRxO7Hmyz0edWGT
         lNeu0lMs+zrPqSvd8qVxHY6bmEK3v11WP7vhk7EG0WCnsRM/dU7fBILX88be5p39h61v
         o3ApS5pKg/b72Gvhzden3pD1YB6c7JFrNJ7RETtyOh232CJQer/vrkpo6Rc04Cv8DUn/
         h01JCup+9/G+W0B4DJxtKPbdZ39eHeB5aeL9eFLKkxbtYNXLbNO55RsgqwMJiZyUvWr3
         y4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771064971; x=1771669771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gcmTHiPmRVpe2FcnwvwiyGljW5AeBLZNUuFg0iLgKKU=;
        b=uj/YuUPcgLq8EZXJ1+vW5HpR04ymYh55O5KWmI1p/XQOdVCPYN+dS0tnk6lfWuK9VT
         rJHeY3AdMFRJ5zxC/SDNR8oXdyxZBxDbJ3y4vgFWBEg7LUk5gghnoFgUBjPGtE9ueJe1
         zLLVD8G3H5LaHGUVAxfboUSU5fVCa4OC2Hj9Dq3NQ5SNlk5npaGY9RqWdVQvv/Yl7Dsd
         /U6vdJHXoj2mWhUz/uAXWjXSOp8u6r5HI9ZKPw+0IN/1k2d4qGfI0AEROvH47pY3eed0
         VTLUPZessKwq/IQMjx0BbTz6rmdGrKG5uCIKqk1bzlIn+NRlv5ZFfLBCrsn4cc7efjz3
         /DMg==
X-Forwarded-Encrypted: i=1; AJvYcCVYxToz2w9dUcK2AQxBcKNi2EDDN4noS46/13PCeF/V+RXtYQPcqD4V/Du8/LcSIoibTsh+5Sr6JR+N01h7@vger.kernel.org
X-Gm-Message-State: AOJu0YxYE3Zv09/fLNw5xjCUUnyEBpRoHNnviUMXsM841ZbJWJutLtKH
	vW6TH2oiqJuq74xWXq5hK7aSTg6oDIvh4XpPrk5qOJcPryZPuwEwGXgDTkudIPBvOUkvvm+4Fdz
	dZ9meddXeaNdJ+vuaNeylkn1LTyZgxeE1heqNwUyONg==
X-Gm-Gg: AZuq6aJnV3RX8UHwkHFXEfdXhzG2EnNK9WDBTVbyMEvS9KhMflYFeuXw02MuaHBKPcc
	VpPAIJZrDsxPCnFfX25McylpRMjTR6VQIjswY5jQDqvNpcs46WYhRjWbJNpYdqRfvDcwKare1Gj
	bMrVnbpY0JtIFRb+B1+FXSJ1FXJv3qUzG+AUPfcsmJwvSX4dtEOi4KfKQE75nIpgl1fkbZP9yd0
	cABuRkY1GtGsWVlT/ZkYoNNt1dcrdfiGcPCnEXFSVzd+cpjsS2RHgRj+Mm7VJqhK0N6RST9ZcZz
	NYqxV2F85CflBw==
X-Received: by 2002:a05:690e:1409:b0:643:1ef1:9613 with SMTP id
 956f58d0204a3-64c1979b6d8mr4149787d50.15.1771064971290; Sat, 14 Feb 2026
 02:29:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
 <20260213-msm-next-quad-pipe-split-v18-1-5815158d3635@linaro.org> <jbd4snirozad7u673dofl34xhpulybbmsyibijohecazhov6gc@5k2xqea6ofci>
In-Reply-To: <jbd4snirozad7u673dofl34xhpulybbmsyibijohecazhov6gc@5k2xqea6ofci>
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 14 Feb 2026 18:29:20 +0800
X-Gm-Features: AZwV_QgDlwmO9K_rYUkz2DZ3LGWafQXwiCWr_9F3NtQWs4yIhGJxH2WUyeofRHM
Message-ID: <CABymUCM58jptRgqXfMJUOyRU7KK3aWdpZRQ73Q9QzhBDdKJamw@mail.gmail.com>
Subject: Re: [PATCH v18 1/4] drm/msm/dpu: Extract plane splitting into a
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92848-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 99BEF13BACA
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
2=E6=9C=8814=E6=97=A5=E5=91=A8=E5=85=AD 00:53=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Feb 13, 2026 at 10:54:25PM +0800, Jun Nie wrote:
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
>
> Wait... This still isn't improved. The dpu_plane_split() function should
> not be called if the plane is not visible. Move it after the check.
>
> Yes, it is currently a part of the code which is called before the
> check. But there is no need to keep that.

OK, will revise it. Thanks!

>
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

