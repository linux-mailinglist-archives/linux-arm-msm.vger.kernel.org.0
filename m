Return-Path: <linux-arm-msm+bounces-98919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGVDCgEvvWmI7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:26:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7812D9862
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81C6E30157E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CC339934F;
	Fri, 20 Mar 2026 11:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JI0DX/8V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5B22BE7DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774006013; cv=pass; b=a+zoFp3u8Xdh848f1afENk8exePPe6YM471I3jEBM8V0rJUGn7PcTeYV7fQwaBLyvNqhCMMisi1yD8u4kMXAVms0ph6fm/ki6KWkAFwawDKZLJoEE0j9KmkvjV60/1Dl6cb/b1ucRN4NE9HbWPR9hzGKGgW8N2mzXz5cAx8AxjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774006013; c=relaxed/simple;
	bh=1sOSgEAVx29c/NNSIaMW0bL0jGuJYDuyH8xI1WN49rM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ff0wZ1vU6LAv0BNd2Gd0bipspQt0ZYt0zx3sAEuTr9/nDcC5qXPotYq4hGD+fu/9g5Fk7z7HYKBGyjJZe3a03Jg6feS2Cuu8ytSXx5t9+HppNIL1R/eU91jMcSAsFK1XfuYoJA5ddcUB0bH3NkJG9fBcmwbXzPLlfdsSGBiFydM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JI0DX/8V; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ffe41e8e83so1163865137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 04:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774006009; cv=none;
        d=google.com; s=arc-20240605;
        b=k+Avo7VTFRxVUwPuvUVKAlQPRRRs9gqWCIg7CoqQMwXMbqam1r8n91CaBLNlV1kJgb
         cOn3gaqKI+eTTOm6w3o1iNQhjsUdkMzyN4c7iBIzWhhC10JuSMVMsNIbvPbDCIOU2SUS
         dfZEZrRX5+idwzKOkmhmhWen5zBcKIXc9v9TBlNZZ8EXjQafNWls+xqkf/D5yEzE7eFb
         WjDGcaiGFshSQ35tc7eqhsH+UG0APcLJJyKrjKeTA3DrJx/zDcUKMoa31bs5p6JBx0v5
         /pMaUp8HC30aXyYhI0NIPYmJ/0zS6hK/31FUxBJZtMMq1AuM2sc6fPIXyrb7/Fy40OkC
         kX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V1QVEp1NAJLSNLfoGBFW6OhL3H1i4QLW676hGym3nBY=;
        fh=eON6Prygk9LskbMucMt/gjh9UJYZWGTlNIgTzRO7/6o=;
        b=lL73nSIkNbupCZMOda4oNu0H80WV/GwqmRBmWqhBKjFkKKLSL08o4QuI43T5QYDYMd
         dKwtOFFdriN3eE93cR4u6LXtSAdQH3SLKQLy4PWixsMQeuIGpMCSPzewYVTxA0UPr8Xw
         EsU+xSvVJSg4apCsC0xbS79zE5TT/dPOSiOR7B7UfP6Jpp8Aeue+mlsXYcd9vHZDKpnN
         Qkuf+Hftic44q61vxUn2TTVEeGGG6lnWBW9qnretDw0ZeghyZpy/mtkpzE+TvzqBEpQu
         KamNVY5zff1ohAQRQIq+zDg5fh66sjBON7wue3wJhcJZoBFJ9IoqhjA/hCvWJTndR06y
         1SVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774006009; x=1774610809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1QVEp1NAJLSNLfoGBFW6OhL3H1i4QLW676hGym3nBY=;
        b=JI0DX/8VslHup3jjOE8Ib5k0p1N3eAcVRPs/xkANz1bm0J3FfKywcm2zSinMcgC+pR
         9KfS8F0qGhBcAPynZS1Nq8bPoq6jtfI/ah8JHujau4/ey4JNs8qrRvapTBD1IfJCuyAQ
         XDXksRiVfmYP8nMevlxnSq5YunNUmBMkbVxoclLno6fxTadEy3LuVVLvaEIblj7rTfPA
         7UOWscWZnG1Z8MiT5nk0MgU+igxN9taABvLevXR2FrFs1qj5EdGMBdg3sDflzFxliLEK
         XWP6WgR7JdmzmVm2hdN5uI/jlnkcqiT7+VzH+1cMFtWPcTsb3vZHuQt+v327rgQC4td7
         AgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774006009; x=1774610809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V1QVEp1NAJLSNLfoGBFW6OhL3H1i4QLW676hGym3nBY=;
        b=WQbuyJNjrKu0XtoInboz/4cfWKSk41GUv+fXfbg5E9K4IMrkrWcqIDYIsSnYwYdj6a
         jfgBIimPbWgXHmy4AewP6uh7Ouh0ykiFJuDE7SQ2/3A4QY/6TzDyMq+R1jcOlR01P0ZQ
         Bh3yRapfT4Mhu0WGcEzziBLSWMMdDXvw7tAShv6P8zGzM1Eh3mp8wXcAYFVejW4+4Umi
         9xEykFqQYNMcgIhPGa0UtA/YbZEZ9zIqmgJiFDpjbDamucTRX521GuknZTOpIN+3hH0s
         0X57yZVZRf/Ewml+2sIiugONGFIHHV8f3GdsijTgwzkOMgZ5a9uC6lc4TYrlwrZqVrwR
         1/jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm43nUmNstUf8REdSWy1qiHJ/gO2xAjT9mVuKbTlYBK2vUoUm6jhNeOt/Rfan3qh/jtzKPo2CS4+zHIySV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxin3LlabS9sOaS8ZNcKRaUFv5vh5d/GAvWnrmvqV1dX/C89F3o
	hmgcCMGumWLd0r8mr+dl1CR/4ySsG8XW/3lev6LYMcrmi9kmM+be0e30Aqxw19hFF3nDdo1FoMc
	8T8syG1Mo9EalbNE/PlzbRXpjHA/YXMs=
X-Gm-Gg: ATEYQzydjbkcjVDOFLZyDgGWx+5nqfJGxNyMk5rBvqZlehK7vabbRZmD6+yiHzuw3Ma
	G9bnBU60EjHnoB15i85wTXj0gpWvXGxSzFfaxFWkq/WeqR6LPOEeUBA+GuQnMGWMUE6Cn9cFrms
	NcvN+ubSLVO9sXh+ED8RfoUPNmA3ufWXQSnB57YPySGZ6FU/7k9/+HmYUhN3bapykbG9MAvy3ws
	EvdJ1XEkRRoyFhpXCELGGgsaVdn6wVpc4QxT1n7BWA0HjJ6JMrNt5ToV/TCV+2A+aHlbR4Qk/2p
	r0y5rdRutV2IEeOznNM=
X-Received: by 2002:a05:6102:8017:b0:602:896a:84ba with SMTP id
 ada2fe7eead31-60295f9905emr3268532137.17.1774006009050; Fri, 20 Mar 2026
 04:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-dsi-dsc-regresses-again-v1-1-6a422141eeea@somainline.org>
 <CAH2e8h4qnF3UxWFrU59BrStWMDc-=Vz9ZNmuq8Q3smhHeUzxyw@mail.gmail.com> <a2xtesu626vmfetdoykojm33at44h7zxgvo6ytf2txlg6gn7ls@34jctkwswjnk>
In-Reply-To: <a2xtesu626vmfetdoykojm33at44h7zxgvo6ytf2txlg6gn7ls@34jctkwswjnk>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 20 Mar 2026 19:26:22 +0800
X-Gm-Features: AaiRm51EcYplGbV3dSE_DXh3DQrzYh4J3puFHwKOmm3oxqdDTptp9H77tGPLNmE
Message-ID: <CAH2e8h4p4fyoPXTcjbhSXVgWEm54PH_=yCWiCGWOsDaMZu1bvw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Restore widebus calculation for CMDMode panels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98919-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[somainline.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,ffwll.ch,lists.sr.ht,collabora.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.882];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8F7812D9862
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 9:59=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Mar 12, 2026 at 01:10:07PM +0800, Pengyu Luo wrote:
> > On Thu, Mar 12, 2026 at 6:31=E2=80=AFAM Marijn Suijten
> > <marijn.suijten@somainline.org> wrote:
> > >
> > > Commit ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when
> > > programming dsi registers") makes a false and ungrounded statement th=
at
> > > "Since CMD mode does not use this, we can remove !(msm_host->mode_fla=
gs
> > > & MIPI_DSI_MODE_VIDEO) safely." which isn't the case at all.
> > > dsi_timing_setup() affects both command mode and video mode panels, a=
nd
> > > by no longer having any path that sets bits_per_pclk =3D 48 (contrary=
 to
> > > the updated code-comment) all DSI DSC panels on SM8350 and above (i.e=
.
> > > with widebus support) regress thanks to this patch.
> > >
> > > The entire reason that video mode was originally omitted from this co=
de
> > > path is because it was never tested before; any change that enables
> > > widebus for video mode panels should not regress the command mode pat=
h.
> > >
> > > Thus add back the path allows 6 bytes or 48 bits to be sent per pclk
> > > on command mode DSI panels with widebus, restoring the panel on devic=
es
> > > like the Sony Xperia 1 III and upwards.
> > >
> > > Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when prog=
ramming dsi registers")
> > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > ---
> >
> > Apologies, I messed up, I had sent the same fixes days ago.
> > https://lore.kernel.org/linux-arm-msm/20260307111250.105772-2-mitltlatl=
tl@gmail.com/
> >
> > > In addition I can't say I understand the original commit message
> > > at all; it mentions a BPC=3D10 mode however the highest format that
> > > mipi_dsi_pixel_format_to_bpp supports is RGB888 thus it won't
> > > ever return anything above 24, which is the original amount the
> > > non-command-mode path defaulted to (regardless of widebus)...  Was th=
at
> > > patch doing anything for video mode at all?
> > >
> >
> > RGB888 is the dst bpc, which is tied to qcom,mdss-dsi-bpp in the downst=
ream.
> >
> > Actually, we should use src bpc here, another fixe
> > https://lore.kernel.org/linux-arm-msm/20260307111250.105772-1-mitltlatl=
tl@gmail.com/
>
> I'm really torn between your two patchsets here.
>
> Marijn, Pengyu, what are your testing platforms and are you testing
> video or command mode panels?
>

SM8750, I am testing on a native 10-bit video mode panel.

My thoughts are we should restore 6 for the cmd panel, and we should
fix video mode too.
As I mentioned, I overlooked something, I thought the cmd panel didn't
use the value, which
made the value for the cmd panel wrong. So we can restore it for the
cmd panel (though I can't say why 6).

Best wishes,
Pengyu

