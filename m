Return-Path: <linux-arm-msm+bounces-104954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK7aJ4yG8GnuUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:06:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3645E482330
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F17FE302733D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4EB3E0C4B;
	Tue, 28 Apr 2026 10:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvVDdnQH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8411C3E3DA2
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 10:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777370507; cv=pass; b=AffVaK83/i609XZ8XLG27ytGStUGRZGdbnlvP906qYTNkmOUlZXMv6exnmON1jp2+FtODE6Y6rkrt/i5HesJs+S+QSdyP3HwhZPwrsRlwJLDoZ9Uos/GYojdJpaJTNwcFmF+iswPQkI5sAXaWyojNYx5I3G+01hgyNYCiZusM/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777370507; c=relaxed/simple;
	bh=ejtc31VfVANMim0C7tVw1Ik/Wt16XcH03Us2/bf2BhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Io7Lf5MEOgQTUvEBw8z1ztRhZ82/3p0Zx36Zdet54mVcL+DF6M3arIYgOdu8Prp09fTiRpyQwtIoEj/vxL6067yUzDX0Vu05fHmFwlVVBnfvjH10Pvgl0TxcVchi6m+ai3EJCJdo9747cEh1EdJDWaOoB3mQkL+JooV6v2oMLQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvVDdnQH; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so11318198f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 03:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777370503; cv=none;
        d=google.com; s=arc-20240605;
        b=B8r9VrPNZxSknCykEss5DDicOUVU+mCYhuRKlceitGjHkf0Z6LtzKoEfzkbnfRWwCn
         Hj5acyGEN5GESY3sP70a0fBLWaYNTb6X5EXs13/HRAArc2+sst3wYz8/w3qfZgoCehX+
         reP6bwlwWHtRc2AyipQ4BaF3/710aICJ4fn38nZzgzaI7DYmcl5ND6te7z47POvcuX7g
         ic40ysIRKwIwsTYAb80A/XyR2lZbMaJsAa3QeQfsmGTtc/KcAuM6cbTySlHNatU18lqO
         OHFaCepQfALDXTAzWh/0kKnEL3+kkuKWBDcxefpKjJP5ZPHcTv8Cs9/qB9w6SDO6mrX6
         bm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejtc31VfVANMim0C7tVw1Ik/Wt16XcH03Us2/bf2BhA=;
        fh=6UMAuJOc2d0zU7dXpZprboDGi+SEGZTHXjw+dOApkLk=;
        b=OITRjUmxBPS28Aq2MET3CgO2BX5rTfsAma4b7mYKfG3g6Nf5Fh3phCgU56AKS3yJKz
         9HDwjqGNDjML7qP/fpCqYqbnS59TTpvcHzJazcgV05Xh6YuVOw4JFMZSkCNv6/kpigC0
         /V/a/kwq2Ub8N/5MSrPAE3QRaUyoED7UW3jexd9MS/n/oku5/eeDaxn0Os59O2I7us7m
         6EqVZazsGWfSlQy+TvkRocmGPmcWHnYJ/p9GwbjlIG4gpBpdeERDV+3HEtU0tiTLaYo/
         HEewBh6ltrR2GHXC0evAHBE4V9dSNrBiMWOtIxiSJIVdp9bbbtn6o6or4FYyCVa+fmGs
         dx3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777370503; x=1777975303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejtc31VfVANMim0C7tVw1Ik/Wt16XcH03Us2/bf2BhA=;
        b=CvVDdnQHunG7MUOdyrkMoSOYvB4Xa8YSLnF6v3FssyiuD9HAtTCUfG7eZycuc6pxaT
         VLfLKCMU8WHUxdz73/gjpzQIDn302eUU2Rcidr3IRhcIGx+sKj+UW0h14MHMRTxyfu7R
         BZMmBHiDwE0SdFJoHVie0EbbOOvobd+2G40rI8UOg0gh5BUQmp82usxBgNvXF4vFsYF+
         YIXtK3okVmM6iFlwL7H+11cO0wt2AwPuasimHumPEsSy9xrBsvEat6eO8xPPcYhW/qv/
         cCN4yqMxmGiDLlJIFUxqPKjkm8M+mY2O8o9PJbMRO/vOlsWBwTDHG5QPmDI20uI4lG2+
         A5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777370503; x=1777975303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ejtc31VfVANMim0C7tVw1Ik/Wt16XcH03Us2/bf2BhA=;
        b=JUQg3czHKjADiwglBqVTNAoOpTfzsbm4MwJb6AT7FNi52qadO+yf8UIRyu5YuX+7s4
         mmHj++LWtHISTpj86pWiulVEvvcmf4ea8qklEi1p1R1lLmK44C04o/8XFmK7J3odUyc+
         W+7Ij9sithSZaTz3ifESXnM7G19m79yoyY087l1s8lM6c5cvYxDhRjYchs+79xABIT2i
         XXtd17xfQxet2lWe7YTRlTEtC/VvP7hOXEEWqcJb2Op4EWhrH/Qe14gTS6OypCw/ODw8
         nR9oG4fvQmVU2nUbkuAVSRoicTgo8ixUT+/UjkOuz8NsF6nhTpjGrZR/rq61YbQcsK5f
         iLiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TFSraOQEB2H52Ygqn8iu3WlapKBgdGgKlGI/i5KFuzduVVGYu/2WpjOrMmaJpNA5xB1REFv13dYeZ3WeN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5zzxRbHIfRVN4aU2bSxc+YZL2Nbl2cc0zZKYeCXSN9sY4dPKa
	bG9FXMP/VxYsZAGy7sHShGZ/zOCIQeMehAvNuUkmwVx2Occ1otP3tncu9Kizl9C6Jlf8JHC2mow
	dkQqpzanO8CCNBJGB7OVROyCPcOUzSEY=
X-Gm-Gg: AeBDievOilpsKxqvHCdo4HCGowWEGr5AMmXxgDB+piixPHH8vb71uWYPzY7W5UIi/3K
	lasJAGbcexbBjw62aDuRFPEatnXvKs6xKpJT/vp3PiX1eH+A49FmeSb0LMoXdTt2Q3YnViTcB7/
	J4tBptoXfqELBw94g4ooEVeU/u8yIXQ0Q9vqjtE17PTH9zsGPKLinrTxhqCr8yVNeoocSDqApCA
	Vh4lCDHwckqD5gsKvYFkadlzMiLogBbi6bZvS7KHOn7koES35WQv6gQTfAxmrT38gOKlvwQcmM7
	fJ4nKU5LiJhLOIIpwv6XopMbI3IygxqH6dcr9/DOn8WD48FMomemw0/XPod6KXI/jWi9MhcREP+
	JA0Me
X-Received: by 2002:a05:6000:200b:b0:43c:fde7:f1 with SMTP id
 ffacd0b85a97d-44647cda93cmr4590757f8f.18.1777370502344; Tue, 28 Apr 2026
 03:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427154658.276737-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260428-wise-rat-of-criticism-df0ea3@quoll>
In-Reply-To: <20260428-wise-rat-of-criticism-df0ea3@quoll>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 Apr 2026 11:01:16 +0100
X-Gm-Features: AVHnY4I4coMls4qeC6jWH5TZaGYTyTrcejKFlzmjg6GLt3Vrx9kUkLIvEYA6b80
Message-ID: <CA+V-a8sPi0FAE3V5ijCN4utxfRjcJbfr05Tn7h4xmk9SK4+sxw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display/msm: Fix typo in clock-names property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3645E482330
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104954-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,vger.kernel.org,lists.freedesktop.org,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Krzysztof,

On Tue, Apr 28, 2026 at 8:41=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Apr 27, 2026 at 04:46:58PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Fix the typo "clocks-names" to "clock-names" in the allOf/if conditiona=
l
> > blocks.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > Note, patch applies on top of next-20260427.
>
> No one can apply on top of next-20260427, there are no such maintainer
> trees.
>
Understood. I couldn't find Dmitry's tree so I just added the above note.

> Please add Fixes tag.
>
Ok, I will send a v2 with the fixes tag added.

Cheers,
Prabhakar

