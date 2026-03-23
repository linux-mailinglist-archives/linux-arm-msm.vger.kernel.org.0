Return-Path: <linux-arm-msm+bounces-99431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJZRKsDEwWlTWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:54:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBC92FE9CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 473873028349
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE16438237A;
	Mon, 23 Mar 2026 22:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6yjebVf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8477A383C91
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306474; cv=pass; b=Qvo/FelchzFGTwFPgp3HMKbPHpNmQ3awlAQ6jO5PEhGoUgf8bdprG9+Y8f8qS6bFR30p8eMCvPQvM06s+t9fcTeAoQviqpONwwm9R4VgDJwx9oQLp+WIAMpoFCxk9OBsp1qLhmFVxs1CQFDSTzA0qxxj2R66Rgy0A0/XYrFQaYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306474; c=relaxed/simple;
	bh=74FSSwDQ9VkzRO9upV5vmlls4IOhzKbCMLQTvk0LK1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlyM/grtoDltnBqqBO2AnwHe3n+8rUzRRIT2y6PM7nu8ak+cE7OWVNUWE9EsdYIOWrZYuzaRJPDrI9Dwom8/5jv86WRFZOGa6x68T3C4IEve3aIElbiNy9qNYOs4v96kIUTylhkm1sQGXsTmohzadIvzO3gblcwcP12kSx3qXaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6yjebVf; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35448ca4689so434951a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774306473; cv=none;
        d=google.com; s=arc-20240605;
        b=XwQks/CqpzMLzQGg/+AfEFPMDsQ45+ZO7bKvczeUBpis0YShVxkZ7U26eW9x22Kx5K
         GzGIMPT0Bl5ATAlIMSeuWwV1SGg4WqVMMrBWOrNrXXj69xm4tgTIJ5wreAVA2ZA8a5OP
         3FQJNWPj6KzNUClxhW7fI8qKKOTZrEYqTBMkh9KhVJQ4jQX3s7JyCdVZtQF/lDcB6Fob
         9Q79qYV9ROJWiiULKM6nIPJ+oZsmWTYjJZs7GvkPpN/CgVUKk3s+rAYstx2P5YcFNcZU
         ijU4SWoiBINAB4b6thViqzy6IVxdL6vj1htucK4Bpw4zGMF4y/NpwknXdxjlEhvfSIFw
         3lYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aLfrCEkXhRllBwye3r7LV622d9pqnMxcK044kOIY8FU=;
        fh=9/TSZRX4ofzhDBO4Cnyac/yKgrxISCXugb1bwR7gr3w=;
        b=c8f7fS+FwvUepkRUHJ78CtJYlJtHroiHDWc0IB5sHWLWy5Ck3mdJT/Jj4YRVvZZ1CS
         2lwdc6oOs69SBzC8uM2KAcViQaO1UtvzlWzIOEM764MDErsGzjKiA/Ra21sBhAUgKKuC
         se2SHCse5xA5JA9BTL8SMoArXLt5BNcNow/WlGnqLzRv2rpl5fwNTG94U8MtsZRiOOyi
         5zANG+/sEclsgSd/dguIB64xRoNcjLuJhO693X2bymxhyNjxbBaw/xYeP4q2Moz8A0Do
         4td468y14eR5pcCA/wTtE0ri+mo3qNDD5T6YEOjL7Nkmdeub48+zIgrFQViBYuposcNI
         gG5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774306473; x=1774911273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLfrCEkXhRllBwye3r7LV622d9pqnMxcK044kOIY8FU=;
        b=V6yjebVfAaR9DyN1K0pAp1F+RxmDRdo8sthOqSdriRWk59RwJJKtFszbJwDxuPJKx2
         8RPgNAgXrG+fPDuBwDGLRczWfbBlR3knSJ5X9PwWmrv1KYl4cEjqHiNNXeXbNmNF/Ooc
         uyNnsGw87KgK4yzTlA5OzofBqbl8i8RmFUJjW8ZTGY+1POQB1S3BnhcM/r1k4ih/YfWt
         SBj27zKkM28sNzzX7F0OFVPwlzj/rC+An58GZPrrSek9FYRbRwbhzzVpIoyFGfFlj1YX
         StdyGReJcSOeU+FRfcYT/Vib1CmzZ+rLg2WyVol4BBqM9KG0CVsSnPr6OSt8CmmcOz2R
         oSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774306473; x=1774911273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aLfrCEkXhRllBwye3r7LV622d9pqnMxcK044kOIY8FU=;
        b=PESzx+kAojCe533W7zstslmWfwJErBMOwY736JINwKLbsXe2ggnIhHXP/XIIE5hvb4
         MDXSYMDimRvslu4wr8UYvyKI8/HCDpeRXV0wSlvIc+Hh3pzkl3tGaZPwEHjHl9BmY/fu
         mA+863pbFTRb57fQxTMCYwP1ixGyVwSDtUldbBVvJMnkjtMuAWn+fVlaMri2zE5KIyiS
         0WXSXccVmI35VVVHGCu6zWYOBWYtcQnGL6lKZkCLh06qOOlWkVFpXuwMgpoHLYn7yd5g
         iQBTRxiFbaeP0goqjJIdQV+CNmFv8FwmzWwh7FZt/HVursnb5mj37/JvHQ8rNq6rdvQq
         U9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoQWuvfCdyrVFOPivVYel/NvcXaOrzZFOBpPcEnSkd98hLit56VxJXJkbss5VIV++NSnTb3x3he9qUOoo1@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ8tEUOHbT+eD4A2+OdBxgNrhsiUiU3tXSTz60GicKh2DFs0Ui
	Rxw5TqpBDilN2aq5PHdfV4piAliPOI8WjNdA3Y8Z6y0ossWoyw6h9Skxz/UUgFDfYaUQOVVPHC7
	bXzXh4IRPo07Bs+TDSZxYZ1y2KBzJA6k=
X-Gm-Gg: ATEYQzzQxPMvbUOUq7Ww5/ivzzfa5h+bqA/SJAfb9IT3VVvJg0JiK4rDZq95yOVkv1o
	rmD0sz8uN6WhOKSxDrUuIJO643W1n1fW9nHJQNqb0lx5nwtYbeW6/pDcFL37DJmWmEwYdktzOyv
	/iY/rIQkI6uJt9XYtKIEOXjw+EWQKZcYAgvXpjjbLsYj57WGwmfO0zUR+q9XdBCN1F8mweGEYcz
	Tj/JXIPuOEIZEljKHPEP3uIKhXOUkXsEBLnN9Par4XB1gIXNkHwv52f0w/scNWA5QaReTBHKEtZ
	/VH/Pjw=
X-Received: by 2002:a17:90b:50d0:b0:359:8e93:4fd6 with SMTP id
 98e67ed59e1d1-35bd2cb346fmr8560500a91.4.1774306472800; Mon, 23 Mar 2026
 15:54:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-16-fc95b8d9c017@oss.qualcomm.com> <4cj3yheakuxh75hf4r33ukokswa7fbr4cetezrj7mujb5mcxjl@fqoek3yfi6ep>
In-Reply-To: <4cj3yheakuxh75hf4r33ukokswa7fbr4cetezrj7mujb5mcxjl@fqoek3yfi6ep>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 23 Mar 2026 18:54:21 -0400
X-Gm-Features: AaiRm53hFiG8c1KgnSj9JcdEvJhhSQ0Ko88DFgY_jlrVuts--4wM3FRhLLDQCpI
Message-ID: <CACu1E7EkjbUs9bc3BD69AaAo4B0t3si-8U-VfCYvi4KVk=Utkw@mail.gmail.com>
Subject: Re: [PATCH 16/16] drm/msm/adreno: Expose a PARAM to check AQE support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Antonino Maniscalco <antomani103@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99431-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cwabbott0@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2DBC92FE9CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 5:36=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Mar 24, 2026 at 01:42:28AM +0530, Akhil P Oommen wrote:
> > AQE (Applicaton Qrisc Engine) is required to support VK ray-pipeline. T=
wo
> > conditions should be met to use this HW:
> >   1. AQE firmware should be loaded and programmed
> >   2. Preemption support
> >
> > Expose a new MSM_PARAM to allow userspace to query its support.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 13 +++++++++++++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
> >  include/uapi/drm/msm_drm.h              |  1 +
> >  4 files changed, 19 insertions(+)
> >
> > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > index 5c67294edc95..b99098792371 100644
> > --- a/include/uapi/drm/msm_drm.h
> > +++ b/include/uapi/drm/msm_drm.h
> > @@ -117,6 +117,7 @@ struct drm_msm_timespec {
> >   * ioctl will throw -EPIPE.
> >   */
> >  #define MSM_PARAM_EN_VM_BIND 0x16  /* WO, once */
> > +#define MSM_PARAM_AQE             0x17  /* RO */
> >
> >  /* For backwards compat.  The original support for preemption was base=
d on
> >   * a single ring per priority level so # of priority levels equals the=
 #
> >
>
> I think this also requires a version bump in msm_drv.c

Not really. We can just assume it's not there if the ioctl returns
-EINVAL, like the other queries we've added recently.

Connor

>
>
> --
> With best wishes
> Dmitry

