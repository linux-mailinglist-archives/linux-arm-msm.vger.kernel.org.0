Return-Path: <linux-arm-msm+bounces-93903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDAcFYhGnWmoOAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:34:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83018277A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E02F3028B45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 06:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C162DECA0;
	Tue, 24 Feb 2026 06:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPAk2Xd+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDEB187346
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771914886; cv=pass; b=ZteZjWlcWPmu8bSWREvskpzjhCLhDnBhJopStTVDKVIisQ5nYm9zI2TaAnAGWG0VN2HDrMyqHsHGqbWKHp+IcSMkFxTP3IjVvxoUiuZyAT2Pw255b6CSgDCqcGOqhbWke1LeWhbQ+eajbp6oRlzhrjIeOcKqXJ+c4dTay2KxPaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771914886; c=relaxed/simple;
	bh=DKpRfUdbZA62c07t6OBbgO9qAzw3RYr1EdZFyrtCvf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeUfgWCaRzCwSguFG3tOLlAwq+J6njbxfzJiG4KZVfZZEEUj2f8TNRPGTR+ep0Jr7YONIL91Q2U1VFeh1G/2/UfQfjHkmeRgV7TCv5VeWXpZMeQWmD/G3eXdx4/pqy8NHcqXVDEtjiYsihm/kmbInUTRcAreEPxybB47hE5c6/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPAk2Xd+; arc=pass smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56711650601so4413494e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:34:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771914884; cv=none;
        d=google.com; s=arc-20240605;
        b=Cnsj/Pym3qzXNWQkTo4O9t2zDa2zBZFv8slgjLqHEqnVgwKPVQZilGddzE7SnifL0q
         4QzA6Fymc/+8x2kXYQYCTOxD8362fpyWKFrpVH2SoWxlIg75xajM/x1/5R84vqrOxmVo
         XKohx5r64ZUmHvcaQIWcqs1Jx/yNtIdRwvy0dP533wdsIwOtrMGdLN9kA2XHopLDEqyS
         89K1UxcnmxWvZFIaXtpZUkzLJn3wm+o9590nUwCP6N/uQH9M6htey3fawZqnZ7OQz4u6
         d2WGg/d+meZaDc21GQqim00771BHiAF049j1BfDAbayBW2U/PzGYJg6d2iOFjIJjjI6Q
         qc1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d2CPXZMwBEzuRIcw3U3ix9zDLQTmW++Pgz7opdGg5e4=;
        fh=hyUJ415RZQsm6cWRa7dLhA7zKTjXLWgl70hjXOVtjT0=;
        b=TtUCN1nGUBmshEpwmDqogvFnbjolmb/i6GtLErT4qWKP6jZAi7rEK7NulFcVs48mKb
         fZEcjKE9+2+Q0NgKb7HeCn1v7Got2xU7FyShWdHH17lkgMtryABrvxkqtwJ0+Yim8FUC
         HCDuWDONQsa98gSGyKq0Fn0OaL3BdUu0W7/J/HS3BBfwE4N5iRCajehwDoYt8ZXPFK/i
         rg34sMYUAglHbc3K4HqvJFPoPyyUmFO5W1r/VuX7uk9golxs2k84dAQhUFg1QwOqrbdK
         tci8anKkUYj7pZfyBjqCX9lp52KSeItyDZrKp6qHNYM8+yV96D6PdYi92sMLhZ0b2c+N
         c5Tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771914884; x=1772519684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2CPXZMwBEzuRIcw3U3ix9zDLQTmW++Pgz7opdGg5e4=;
        b=JPAk2Xd+L9wp+oXfDqvq5o5uUoUHgNqc41DlrxRyRPIUuRVY37YhKIcuYWpI3VGg1Z
         0YYjIR7pmSeM4PscqtLTnZqftB31QknZzkJULLqbnOdYPrW5ZadY39jx9H8yONkGIc+U
         oC4aNLYtW5FXcmM0Ubyi3eKZ0UFazB/zUcQxtEIklleUWNTAiZz8phs4S5MRGlBDxYyW
         WYEsQ6fZh/eJtN0wutDS+R+F0YYgg2SfiIruAsmrpJGvXgvOjWGdwCBlCO49JYUKA62N
         nhQ8QwNVFf8U5mdhGode/P54OhDOV8mE8NyVwlg2pQCsXD+AqLbR7+fjRYiEROaZoezk
         HeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771914884; x=1772519684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d2CPXZMwBEzuRIcw3U3ix9zDLQTmW++Pgz7opdGg5e4=;
        b=qr2IK9IJdCd94x6cgRZ4Tr9aXmlB8IHNj9X0yOt8cA/yt9K6AE+JxPaXW6CUGXHnKR
         pQp8Uzu/peJ2DIjCVwyNqgRZ4Lvc67+7WTfGTaRj2vChheqLxspJ/25txLVmX4ZQptNX
         FfgyEcC26VOm5nSJndG9V91FjVbH9/Vc+O76z+NvS1sInxIXMG0F0N4LAMz5+nRzfXuc
         XTI5ZfSazl8SURERqmiVySkg6+w0ohLQVf74zAw/NMWd8e6ThLXXt0Ixq0wT0gvxr2oV
         T0FQsuSwvDFvpmZKGS6pGbXtG9YgUkzdMtoAH2FblNw3CvhbSALzmJIcdFvz2p/kVnzO
         Lb5A==
X-Forwarded-Encrypted: i=1; AJvYcCXzSiwiz6NmeTMekui11eESSkYVRWIQ+/ntFQI4tBwsOan3XoztgyWmX0n9WvlVfJTbOzMYHdMwO5VbeOSS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcpj7LNN/FHo+7Ul0CKytNlGGdm9WfD0ftA+mVx3XvizPFeI1H
	g58GeHUDmSc8t9s3OaTjyJpyhwxxILqmIeJRMLsZ2N6wn8xD8zG+lI+wgmLQ86rjdGpOvhsaXZb
	b5ySoXK49OcevERynxQh0s6XTIYqFY4o=
X-Gm-Gg: ATEYQzxx5NX+/UZ8LyfaW5tsZyHvlfcm63iC343EijVrfRSgpXLkjVOKAv37Ugw1eNd
	ngJAOx2nDsgDjhKwPQrVO9eknZ8ByyOO2m1sZbOG6I3W7KV2a8SVeT77cX1/d6y2zC9I76qnOSv
	tQnAfyG20Ionm43zHTx4cZ+uMNieFASt80rTSn5xRoOT6Y23jb0BH1vJ0ZeJ286wj0JrtFUDLdP
	g7W28pno5gT7NXKOG2nsPqpxC9QU3TEsXvd5cd9l9lD1D/pN4/rJ5ep3rVYeuf480IGaaqA71HD
	GumiREtif7oYo3E4jA==
X-Received: by 2002:a05:6102:2921:b0:5ef:a9fb:f1f3 with SMTP id
 ada2fe7eead31-5feb2eeabbbmr6024557137.11.1771914883670; Mon, 23 Feb 2026
 22:34:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214105145.105308-1-mitltlatltl@gmail.com> <wou62ifuvwru3mu3m5msuuolvou2ivkxbqjz4efy625cnnxagu@s3ofi33zqveq>
In-Reply-To: <wou62ifuvwru3mu3m5msuuolvou2ivkxbqjz4efy625cnnxagu@s3ofi33zqveq>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 24 Feb 2026 14:34:28 +0800
X-Gm-Features: AaiRm51R8L3iou4npU1vpdD5DZL9EpRpSawFc34RE0Bv8lB-h8L2KEIydo9ihY0
Message-ID: <CAH2e8h5_iBk5eiOpBi8yTa24LGNCxutA3HX72dKazKGo=XK61w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: fix hdisplay calculation when programming
 dsi registers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93903-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB83018277A
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 7:35=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Feb 14, 2026 at 06:51:28PM +0800, Pengyu Luo wrote:
> > Recently, the hdisplay calculation is working for 3:1 compressed ratio
> > only. If we have a video panel with DSC BPP =3D 8, and BPC =3D 10, we s=
till
> > use the default bits_per_pclk =3D 24, then we get the wrong hdisplay. W=
e
> > can draw the conclusion by cross-comparing the calculation with the
> > calculation in dsi_adjust_pclk_for_compression().
> >
> > Since CMD mode does not use this, we can remove
> > !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) safely.
> >
> > Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >
> Could you please point out, which platform / device are you using to
> test this code?
>
Hi, Dmitry.

I was using Lenovo Yoga Tab Plus(sm8650), it is equipped with a
native 10-bit panel, the resolution is 2944 x 1840.

I am using Lenovo Legion Y700 Gen4(sm8750), it is equipped with a
native 10-bit panel too, the resolution is 1904 x 3040.

I witnessed that the DSI_ACTIVE_H_END bits in REG_DSI_ACTIVE_H are wrong.
For Y700 (panel in 8 dsc bpp and 10 bpc mode)
Upstream: 0x015e0020
0x015e - 0x0020 =3D 318 =3D DIV_ROUND_UP(1904 / 2 * 8,  24)
Downstream: 0x011e0020
0x011e - 0x0020 =3D 254 =3D DIV_ROUND_UP(1904 / 2 * 8,  30)

dsi_adjust_pclk_for_compression() did:
new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
                            dsc->bits_per_component * 3);
new_hdisplay will be halved later for bonded dsi.

Original calculation must be wrong, though it is unused. We can refer
to the downstream too.

Addition: To support 10-bit for dsi, more fixes are required. e.g.
programming VID_DST_FORMAT_RGB101010 into REG_DSI_VID_CFG0
adding MIPI_DSI_FMT_RGB101010 and bpp conversion into drm mipi dsi
fixing DSC RC parameters? Recently DRM_DSC_1_1_PRE_SCR is hardcoded
etc.

I just brought up the panel in 8 dsc bpp and 8 bpc mode. I will try
8 dsc bpp and 10 bpc mode after a while.

Best wishes,
Pengyu

