Return-Path: <linux-arm-msm+bounces-88514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 821FFD11F3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6FE0730060F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8607630F547;
	Mon, 12 Jan 2026 10:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cb/PY5Dt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522F52C21C2
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214374; cv=none; b=b3oG5QTd5XjT2PG8dM5IXEfmv/nqyzf3pEdSseYAOkx4g0mxFs+dGYZ6ybexhGT6r2EpMXXEURFPGWvdUtyxad3eCyI7PE21ZBZXR5w1C0O4PjpxxSO6AGn4YAnCLyH6u+nwxtfNd7MoTCkSvlrqfFnUYDShS52X+soMMtucYss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214374; c=relaxed/simple;
	bh=6OLfkh5UQ34EfXttFXpwbbYEZ5ypLgAzC/JzzmCDSd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObU/iEQnETwA5B8UnSTQ3oaZEbKyWJlL26NB3U+E8q9UOuAUxuhx1yzt71KY5C5X1LWqIdk/wlFPcMpSdcsrfpagPNBAbsdOSCGWN1RBAYwdZUmlBRE/biHOLlK49KAKv6rNcVg5e93oWDmHWoyA80JyFYo4mB/RzBzUQbk9c44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cb/PY5Dt; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a1388cdac3so44451905ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768214373; x=1768819173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UenKJW7FDUByZJnFEy7SwCkIKfj9EmdUi7nZ1uEh77A=;
        b=cb/PY5DtDCR5U6mxT9XeHD9deZijGsdjmjedEZ3eDL6vbL5KZ60WyZLHRtXgvEE1VV
         iGCM1r0n6yB07vglaROF+jgqJsu70pn1+g+/SY50xgiLye5aHPTX6VIfCNEN7q1SXlTy
         VM68mm/3/3yE/WhkIXwV/2EIzbaw0biamSKr2djZJ/4FjleySK0LAdxhAgOwAh4N8iae
         BnS5fI+DT8dSBnyu0AC4y+Cf9R1mmF9eCqu4qS7mL9FKu1FB8MCDG43NDxCfiZP/0ine
         6SK4qSa8LdTBaaLQImHV1vGSsxm3xTxD5cgB2cKz/atLwpvatlQtLqRvf9+cj8zoQkQg
         QWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214373; x=1768819173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UenKJW7FDUByZJnFEy7SwCkIKfj9EmdUi7nZ1uEh77A=;
        b=EEb8PUh7DFsfpAmierLYm1eOedpLAStVNjEP4FJB4qLDmgJbbF6L+nhVhpVQK00if8
         aiKezCCYC9OnW2e5TAHjYLOdOhar9I0asTWNN4FdnvgSk1xbNXz0Qg1g2o39/YOsToXG
         qLXwZ3Ulxcw9noX8V7fh20XW2cOg9KgOJr+r4PfjaL51x2CNdBBGJRl9KkadfJAxma+a
         BYDvVdt9ay00eg9/VlwwkJlSPhOUGQC4HTquC912cLkQfJhujCrsZQSoTcKo4PMn2byL
         xmIb87cQZCicYBVW95R07oh538YFmn44HzpCZX4UgIyGhZZv/UjEHkTxpfRMf1XiNfHZ
         VWZg==
X-Forwarded-Encrypted: i=1; AJvYcCXgiU+RV1muTv+L3kDqkFiA+Zz4SJhwCKiilhgJOuUBt2rl1afbel9Q0IeYtOtodlPYFhcmu2YeCgC6P+SE@vger.kernel.org
X-Gm-Message-State: AOJu0YyoUOSp9Mic4My75ytOJYccMMrF4nmuIsxvNpCEzYTrYcWfzx//
	7SkfH06slsjQKviFdM8/OF3c4SHvPllsm+Nlt0UaTdY30BmPFtbtry87o558nUGtbr76dF/KC2i
	4t44Dw0VASFI9v+ojTLSx33WMwIOlocw=
X-Gm-Gg: AY/fxX5uaCCvOOEY4958vVQYgNP3whAm/g6cR3etNhUeygexwN5yKiy6O9VlB9cquck
	B5vISdQJm+OA8vQHW39198N9Ur55fJmO9vWmfztAi5vQEsOET3lc7K0DgnSRAUHtt1k/zfcpUZw
	yrVYy6h3JdFgwHG/9uwkXP7B+M0ZJn+J9MKxAKcyo+uowNw72i6ETIGot7hAPeRu2fcbCvrn8Hq
	X8QrAuwipdK8bm9t4aXjT98yYwFEyLyWezcFzO+4Dsn7H1vOJG8sp1PTKEYPriTRJWqxV2z
X-Google-Smtp-Source: AGHT+IESQjBmYnaEzEFjC8s1z9ZJGCxueQscFrM8SwiysrJN1Un45jUHXMSNQG4UqdhFoyrEcxjFx9EeXGK1zWLnc2A=
X-Received: by 2002:a17:902:cf06:b0:2a3:e7aa:dd6e with SMTP id
 d9443c01a7336-2a3ee48ac0fmr167548265ad.38.1768214372727; Mon, 12 Jan 2026
 02:39:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK+ZN9rJypDknnR0b5UVme6x9ABx_hCVtveTyJQT-x0ROpU1vw@mail.gmail.com>
 <2026011208-anger-jurist-a101@gregkh>
In-Reply-To: <2026011208-anger-jurist-a101@gregkh>
Reply-To: micro6947@gmail.com
From: Xingjing Deng <micro6947@gmail.com>
Date: Mon, 12 Jan 2026 18:39:23 +0800
X-Gm-Features: AZwV_QhZhWX1GcqhyeVAsJ8yptjpLSjxIi-29yvJiNR1Vz04J6RwVOEBfvb8hvI
Message-ID: <CAK+ZN9pLcrmVHr+EVMU+e1GRPT=AB3Tv2VggLWFFm-xX7508ug@mail.gmail.com>
Subject: Re: [BUG] misc: fastrpc: possible double-free of cctx->remote_heap
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, srini@kernel.org, amahesh@gti.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,v2 will add the missing tags:
Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@vger.kernel.org # 6.2+
I=E2=80=99m having trouble sending v2 via git send-email at the moment; I w=
ill
resend the actual v2 patch as soon as SMTP is working (or attach the
generated patch file if needed).
Thanks, Xingjing Deng.

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8812=E6=
=97=A5=E5=91=A8=E4=B8=80 16:20=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jan 12, 2026 at 04:15:01PM +0800, Xingjing Deng wrote:
> > While reviewing drivers/misc/fastrpc.c, I noticed a potential lifetime
> > issue around struct fastrpc_buf *remote_heap;
> > In fastrpc_init_create_static_process(), the error path err_map: frees
> > fl->cctx->remote_heap but does not clear the pointer(set to NULL).
> > Later, in fastrpc_rpmsg_remove(), the code frees cctx->remote_heap
> > again if it is non-NULL.
> >
> > Call paths (as I understand them)
> >
> > 1) First free (ioctl error path):
> >
> > fastrpc_fops.unlocked_ioctl =E2=86=92 fastrpc_device_ioctl()
> > FASTRPC_IOCTL_INIT_CREATE_STATIC =E2=86=92 fastrpc_init_create_static_p=
rocess()
> > err_map: =E2=86=92 fastrpc_buf_free(fl->cctx->remote_heap) (pointer not=
 cleared)
> >
> > 2) Second free (rpmsg remove path):
> >
> > rpmsg driver .remove =E2=86=92 fastrpc_rpmsg_remove()
> > if (cctx->remote_heap) fastrpc_buf_free(cctx->remote_heap);
> >
>
> Hi,
>
> Please note, stable@vger is not the email address to be asking about
> this, it is only for stable kernel release stuff.
>
> Andn do you have a potential patch to resolve this issue?  That's the
> simplest way to get it fixed up and to show what you are discussing.
>
> thanks,
>
> greg k-h

