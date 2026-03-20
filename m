Return-Path: <linux-arm-msm+bounces-98913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NBsGmgrvWmI7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:11:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2CB2D9589
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 970453007AC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BEC36EAB1;
	Fri, 20 Mar 2026 11:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCJ4TDWq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D88B3803DC
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005091; cv=pass; b=csvzQi8l0XHWSgFua6dQ9+7cINgsfjSJ3Tfm1cufYb3RO2l5VSW7yxzmywk7Inzyip9N9WXjDhf0l71vic0FeK6RZQGi0Rc8aZXAqOayySa/RFgEqcBl51kOy7Mi4sO0qvRcWuSTcEh7DSkmWnBETD3thYNHcJOzU3oBo79FUNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005091; c=relaxed/simple;
	bh=WRibP/OoI676PLydacDy5RffaFgff7fcmTDwhtz6leM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQVEqeNKDNtI6Z012JtXqD1O35zC5JGB4iRxtgAEc4j0Zr0rw+VuG+wsVtEY4bY3wdB7nIDFaTEAjZm5/UOgoLJJmKwZaIYUhDZ+VokRhjcpGG3ZZV0mqo2nnzxBadjRjbxfjNsFIU0lhMH+81HbAz9zQNwqQPPR2+SiDD1hulM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCJ4TDWq; arc=pass smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5637886c92aso230114e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 04:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774005089; cv=none;
        d=google.com; s=arc-20240605;
        b=bpTjWWdrJ0+cxWPEALpbIKQhtgWe26b56sFXhHU8cpUe0RwFvX0tZDmlENnaRXsvKC
         i6U5En+rd450ou5IM1DwP02bWqmdM1eateBTEp56p0lXJGHAZARoNXlzQpLqsNssokpi
         yqlqlOEr5WD7Ml4ltbGzA2ok18uQoKkKHaZx7yO9bXIBDHYXYkM1Q1UhFMtZZ7mPlPGt
         aqUjCjz9qb39fQij48k/JJkNQT2wQUg2LqkvxREAx5D2fEQZo4M7iVJF5RrY+weUKgTy
         P6rnMw78D+ctX2FyBhY7Wcsu3kYOH5iJQfOvvrE1yvD7ADnDzRA4u1sXmIeB0JW6okJG
         GdTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9te/j8HOzFHtjUgjcdp2trlsf+HhnDZ+SK/gHrL1Pnw=;
        fh=A+cQclyS/Nyo8v5yPCbxtLPnU0itNNd4GAipgUneH64=;
        b=DTYIowQjBl6KSxGYSyZ5vsjh5OFGhYLHUqB2iFH6dYGNXRIHjoue7k/rc8OR/ubfkb
         ckEiFcJJ5sWIBJ1wtKD99q1/2+jv8Ir9WqJbkj4iwvOnqMhJAdeD/olihGDpc9aCy87s
         K1dwDvnpcyTfhuJ6azdJcdgvFITZYvJ/PI9+82k+vNze9c+37pHLP9oGJ1ixsSJr2Fih
         MzZE66eSymFwTOJCji5iKgkqxhVuo7vD+dSCh4LPjcZCQ45QUzxtAJ6lYhv0AMyE3pdQ
         dQnUFozCbr1T+dkuOnQkcHCxj4vv6OoLBrY55WZ8mWCSw/iYHa1Mv9w1Cfz1WJPRUZnD
         +wDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774005089; x=1774609889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9te/j8HOzFHtjUgjcdp2trlsf+HhnDZ+SK/gHrL1Pnw=;
        b=PCJ4TDWqYDfMWrqfFyJcP/IJFM9bnwCtQT9RpiyK3cvdlvgEvC880wCuazLMDFkr2n
         yrZ0DhtQrN37GrvAv7ezR8a9oq6f33RsRLh89Glzqf+n2ueAcqG5oOKu0tMlO/4dpmq8
         yhfTK19wD6oYXxWqcOUbUDYHbu7uGijKPYMWCDC+O8WzQSWd2Iz/geMCfEdao5P8kO+O
         /QEp8SMRBn6PzYReuiZHm5KS78w0tES4GrAhEEFCjjXYmneYqOkJ+Wmr/e6r5f3AmuAX
         a8Hf5tdkUTYVgNRNnTFEEZTIGNDJRVcaTSrzzdJ/HFVGueXwsh4u6QZkinZPVkTWGvQv
         xJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774005089; x=1774609889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9te/j8HOzFHtjUgjcdp2trlsf+HhnDZ+SK/gHrL1Pnw=;
        b=cr3v4NcF8KneKR8QGTvRZ/qo09I07yB++n/qPvvBZJvS8YfcrAr1X/u+ChQCN04yhb
         WEKzjrbKvgDTmqsN6bqY/F4nXW+kLOag6d/mbE9LoABD1YOicjWljx6yWSR5s0/Yg2z2
         TIfl/caxDR6f3hf4fA9TeE5WM8UIdevmmJF1h2neUy9leLUbpwK2V5tMipECpCUbXPwQ
         RnGCFtJkKUy5LPWBZ+ky5G0sD5DEHs43Rp7zHxuaTViH7pacnpyaIUmCiSZbDdCw/KRV
         2hxvyzvusc3WZwe5ReI/DtoF3wKIX7A8PWnSgRYEQOLwQCBiThBM6ZDUQc5uHjrdR+v4
         vreQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH0vlgGgRQd2h4kJLo5IzVN/h6rtbkPyHgxUkD/3soNZcIEkq9Tqj/ICQGOXlw3JEVPyXNUS2BPrMFZrGx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhfzoq12qFQDz/ht8OlTURsQUkTPsJAN04k4hRW4kwVO8aYNPS
	esVY8kdolW39wONG86+5AD9UTPBvnv9+c4zTVdvJMNWbs0ybx7MhJoJdnzgVGv2hmN+fqzle4hj
	NsMCT74xumkp9hTbUA0/6kfnbnAZ33e5SHTx9Npjg6g==
X-Gm-Gg: ATEYQzxzjcMP+t3RZn1U0iKqNhaSGTh87AJfD/LAl7lzoaCwFN4m+9TAbP42ybU0+to
	yuh8XzY3fnEqZow5L9JOhy3GVe5DH8w9/srGLvGYX/qozhNacqjonDKCf0AbaIsbrgfn2+uQohg
	ulCNJhD4KZjL6V2ZjKvmvZq1PUNHNvmOcSqTqCqzVhj9Irwb5l7ofYEPRhocjPuHw/N9GMkIJ8V
	ecBOOhFIP3X0GCF89rHcV9CrZ4wqBtin0HwTTDPQ3REpj3QlGhWJqXaFDG6h/SPobXHSEZj0jCf
	plAKNwGw
X-Received: by 2002:a05:6122:d1c:b0:56a:f576:cfca with SMTP id
 71dfb90a1353d-56cde3237a8mr1152700e0c.2.1774005089107; Fri, 20 Mar 2026
 04:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260307111250.105772-1-mitltlatltl@gmail.com> <dggubmwmcgepioyev4jfibntdgmmiiomahnrvodewcw6ktplo3@bngbsgvzuzoa>
In-Reply-To: <dggubmwmcgepioyev4jfibntdgmmiiomahnrvodewcw6ktplo3@bngbsgvzuzoa>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 20 Mar 2026 19:11:02 +0800
X-Gm-Features: AaiRm53l5G2RJnBS28ANAAiFgm5ukjN8S-QGG4QvRtKJpZSwLznLfIzx_bEm3mo
Message-ID: <CAH2e8h4pn+xRcpEEO6CjbM3=WO+2C4HfyH6quhh0opoDFmaEFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dsi: fix bits_per_pclk
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98913-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.780];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9D2CB2D9589
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 9:48=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Mar 07, 2026 at 07:12:48PM +0800, Pengyu Luo wrote:
> > mipi_dsi_pixel_format_to_bpp return dst bpp not src bpp, dst bpp may
> > not be the uncompressed data size. use src bpc * 3 to get src bpp,
> > this aligns with pclk rate calculation.
> >
> > Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when progra=
mming dsi registers")
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Pengyu, what is your target platform?
>

SM8750, my device is lenovo legion y700 gen4, the display is a native
10-bit video mode panel.
Recently, in 10-bit input bpc/30-bit src bpp with 8-bit output
bpc/24-bit dst bpp mode, works well
on this device with some hacks to intf block. full 10-bit input and
output won't work for now.

Once I added this comment in ac47870fd795 ("drm/msm/dsi: fix hdisplay
calculation when programming dsi registers")
> DSI consumes an amount of compressed data equivalent to the uncompressed =
pixel depth per pclk.
This explanation is picked up from the downstream msm kernel, since
there is no public datasheet for the hardware.
And this should be the video mode case, cmd mode should consume 6
bytes. (It seems no explanation)

If we follow the downstream, then the uncompressed pixel depth per
pclk should be 3 * bits_per_component.
This is what this patch fixed.

About the test, I did it on the video mode panel, I have no cmd panel
device with dsc/widen bus enabled. And I overlooked something, I
thought
cmd panel didn't use hdisplay, then I removed the right value for the
cmd panel case, I fixed it in patch 2/2.

Best wishes,
Pengyu


> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index e8e83ee61e..7c16216e8b 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1030,7 +1030,7 @@ static void dsi_timing_setup(struct msm_dsi_host =
*msm_host, bool is_bonded_dsi)
> >                */
> >               h_total -=3D hdisplay;
> >               if (wide_bus_enabled)
> > -                     bits_per_pclk =3D mipi_dsi_pixel_format_to_bpp(ms=
m_host->format);
> > +                     bits_per_pclk =3D dsc->bits_per_component * 3;
> >               else
> >                       bits_per_pclk =3D 24;
> >
> > --
> > 2.53.0
> >
>
> --
> With best wishes
> Dmitry

