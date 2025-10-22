Return-Path: <linux-arm-msm+bounces-78250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F80BFA1BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 07:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F36111A02C63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 05:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD567EAC7;
	Wed, 22 Oct 2025 05:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OY4d43Ge"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F221E32A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 05:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761111944; cv=none; b=WavzboBMOoCa2G7WUopSPQcir75fBXFG+X1h66JxKgsurEoKPTP/3UMP/6eqgWRw/5nLqa15HKlhD0gghzueNqHMQr09+pOA/bW3Fzd7h+gFMsLDSxrM6jJZgiKRhmV2nWz3FXLGuEpp7CCCL/6R4fXEzCrCywG6NGk4TPuRzsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761111944; c=relaxed/simple;
	bh=OOEDwYf/WoldymVHE1bARmPBao5IcHvki7sxdMEqYj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snaCcgepi7p4RayMqqxMxhjKcSj8gjjnBO4QK9g8x4xC+0t9k9z+DSLk/s6QKBv+yqtYveXXdyZ3AwOjlBeI+Xzpeiq90zfyC3zE11mK0tBfw6nGSNqtoxPGsclO45YBfkTNbgtXTU3g/CSsgOtyj9eibM2I4WdknvtusGYcbSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OY4d43Ge; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761111941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+gdOCtyqfpPDKTOSjwLO+fIICNulbuVoEvWA7TNWh1Q=;
	b=OY4d43GeZy8RoHxJ98+KEGoz+NMxMwsdR92GCbAJVByzmDCfeiLyviRx/XZCGk6hQDaIKY
	vPyTcSEA3u1T6cgkHoKKNZfCMEsVQyfimzXVtfk15B+mwMLN3pMuqZYFHTEHGTl5GJRUJM
	2oGnjSqL6K2vZFOrpAz6j5Mt6+eGM88=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-y4kZNps-O5KHrJlpY7Lbsw-1; Wed, 22 Oct 2025 01:45:40 -0400
X-MC-Unique: y4kZNps-O5KHrJlpY7Lbsw-1
X-Mimecast-MFC-AGG-ID: y4kZNps-O5KHrJlpY7Lbsw_1761111939
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47111dc7c5dso2806625e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 22:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761111939; x=1761716739;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gdOCtyqfpPDKTOSjwLO+fIICNulbuVoEvWA7TNWh1Q=;
        b=HXZRtOds0K/oB/fgh/7qktpL8zO+UmUBcLNFrJy3dGsopa47spqUQlehLM6dveUWZB
         8rb/xir8w/JDMiplrVmdiQqTAzJyGp0yil2VwZZwblqxC1jGIErNglXPCLTFG8necbtP
         801SFATqBiTOUe5ImnKSfZOYrFYlyaNeihibESf1U1CZkoQcQ7qyv1V6MhJ7J6hYVTlh
         wmZMIiWEV2muD6cfGQc1iRaD8k24ZChlfADMOKAsaMVKOqOfAAtTfQpcMFcMwqpaFU72
         b0/eyNAGNG0yWP0ohe6rb4hmh1kupGdH2bklvLbOuUEmyhk3jofiHrP7oTaSBxOWOakA
         3yFg==
X-Forwarded-Encrypted: i=1; AJvYcCXOphamYv8II1RgQdXuJK4Bh5CL1mwnKm86kQvN+XMMy1/om4EiuoPeP9zX6IDv/SEzumLZ6jLSwOQGq4nj@vger.kernel.org
X-Gm-Message-State: AOJu0YyqKohnNU1iFzyUJnD/C/NGQuSc5DsnED9q0F6T4BIRCMYXZLNt
	T++xrswMniELaUGCm/7AR//8+0Ehl1TRLsde6kvRQiAT/tC2l2rODi+CVEcy10/a4Gh85IX/90X
	czp1OwRrXjPtZ7Q2O1hyr4H9zr4Owrwhp0KLnXqHmFAA9BbBx1bW/+0LJWhzpwQCae0Q=
X-Gm-Gg: ASbGncv0FwEZkDA7YT4ct5cTt/HR2CGCgHA/EINN3qqrhkNFSUYWb3XWTs7EhId8RxF
	M4ucP5vTovgfpzG0iwl/qrKDaFQog2rK9aSbuVYF8m+RjktnPL5DwHmcIbnZDTmQSNOeJL7x6K5
	Ky4A1DHgkZMt3m/pThppFibR83seiLfuS90PxArtvcpUGl8rKxvj4yVTC+coYFJ9FV/3ZhdvHG3
	GmLpoZG/S4azJvEmPtZMtdiKPf6tp0dJ5SPFNDhdYvQ4k28GFIXcWqgCiflsKYpZx+XWTk6+K8C
	vNTJXu2XDRsgqn381hPFIcvgzAHIdoS+uDXpZxu1gpKKsCjrlORmIfUiSA0VfrHbCsH9
X-Received: by 2002:a05:600c:6992:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-475c3fa355cmr13586825e9.6.1761111939132;
        Tue, 21 Oct 2025 22:45:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElHGkXoX3hCkc0GRrDbDcYpbH4YLBEG6cIW8mw2RcnC42OK12DSE/fMXDY2iXzD02ahYxuXQ==
X-Received: by 2002:a05:600c:6992:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-475c3fa355cmr13586695e9.6.1761111938746;
        Tue, 21 Oct 2025 22:45:38 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494ab11bbsm30712795e9.1.2025.10.21.22.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 22:45:38 -0700 (PDT)
Date: Wed, 22 Oct 2025 01:45:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Cong Zhang <cong.zhang@oss.qualcomm.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	pavan.kondeti@oss.qualcomm.com
Subject: Re: [PATCH] virtio_blk: NULL out vqs to avoid double free on failed
 resume
Message-ID: <20251022014453-mutt-send-email-mst@kernel.org>
References: <20251021-virtio_double_free-v1-1-4dd0cfd258f1@oss.qualcomm.com>
 <20251021085030-mutt-send-email-mst@kernel.org>
 <CACGkMEsU3+OWv=6mvQgP2iGL3Pe09=8PkTVA=2d9DPQ_SbTNSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEsU3+OWv=6mvQgP2iGL3Pe09=8PkTVA=2d9DPQ_SbTNSA@mail.gmail.com>

On Wed, Oct 22, 2025 at 12:19:19PM +0800, Jason Wang wrote:
> On Tue, Oct 21, 2025 at 8:58 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Oct 21, 2025 at 07:07:56PM +0800, Cong Zhang wrote:
> > > The vblk->vqs releases during freeze. If resume fails before vblk->vqs
> > > is allocated, later freeze/remove may attempt to free vqs again.
> > > Set vblk->vqs to NULL after freeing to avoid double free.
> > >
> > > Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
> > > ---
> > > The patch fixes a double free issue that occurs in virtio_blk during
> > > freeze/resume.
> > > The issue is caused by:
> > > 1. During the first freeze, vblk->vqs is freed but pointer is not set to
> > >    NULL.
> > > 2. Virtio block device fails before vblk->vqs is allocated during resume.
> > > 3. During the next freeze, vblk->vqs gets freed again, causing the
> > >    double free crash.
> >
> > this part I don't get. if restore fails, how can freeze be called
> > again?
> 
> For example, could it be triggered by the user?
> 
> Thanks

I don't know - were you able to trigger it? how?


> >
> > > ---
> > >  drivers/block/virtio_blk.c | 13 ++++++++++++-
> > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > > index f061420dfb10c40b21765b173fab7046aa447506..746795066d7f56a01c9a9c0344d24f9fa06841eb 100644
> > > --- a/drivers/block/virtio_blk.c
> > > +++ b/drivers/block/virtio_blk.c
> > > @@ -1026,8 +1026,13 @@ static int init_vq(struct virtio_blk *vblk)
> > >  out:
> > >       kfree(vqs);
> > >       kfree(vqs_info);
> > > -     if (err)
> > > +     if (err) {
> > >               kfree(vblk->vqs);
> > > +             /*
> > > +              * Set to NULL to prevent freeing vqs again during freezing.
> > > +              */
> > > +             vblk->vqs = NULL;
> > > +     }
> > >       return err;
> > >  }
> > >
> >
> > > @@ -1598,6 +1603,12 @@ static int virtblk_freeze_priv(struct virtio_device *vdev)
> > >
> > >       vdev->config->del_vqs(vdev);
> > >       kfree(vblk->vqs);
> > > +     /*
> > > +      * Set to NULL to prevent freeing vqs again after a failed vqs
> > > +      * allocation during resume. Note that kfree() already handles NULL
> > > +      * pointers safely.
> > > +      */
> > > +     vblk->vqs = NULL;
> > >
> > >       return 0;
> > >  }
> > >
> > > ---
> > > base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
> > > change-id: 20250926-virtio_double_free-7ab880d82a17
> > >
> > > Best regards,
> > > --
> > > Cong Zhang <cong.zhang@oss.qualcomm.com>
> >


