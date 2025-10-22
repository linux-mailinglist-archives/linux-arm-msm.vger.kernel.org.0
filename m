Return-Path: <linux-arm-msm+bounces-78277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 381F0BFA69E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 09:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8AB21A02CA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 07:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECDD267B9B;
	Wed, 22 Oct 2025 07:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W8qas0hE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03D43594F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761116475; cv=none; b=gD4yHv9KOs1qHAFO+rpXe2aAkOFWlDtvufqke7QeC9KC0H1rc6WI99ewLRbm3TrXe2xBpd3ZVXAdghg+KwfwgFh8K/vImBEetkQXLkYQ/F/QaJOWdRGgz4MV7gIvTuyk/fFGRIgUs9MT4PyzpdjWGOgnQ5AH7plBpQ5m/wV1LJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761116475; c=relaxed/simple;
	bh=HxC//6c/pxtCaIYc6byaWXcJI1kJg6+v7VVvcpx2G0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mb+jD7Q5zRRARo7SerW1wgpQFJM+gEP2Lz8Qt6xwQTEtmq+j6mQdtHXeugh3DAvsbsZEfplylHAvSdHU4MVnasdVLMeApZcQ6et53iTxG4Eu8oxid1ZPRX6rqLIcZSSp7EaYo8y4uGWGSMTEQPk2Mug6DuMKW+daQ2yXSsCL86s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W8qas0hE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761116472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/wzttfZZIcdwp5kIjVhv23r7cyBB6dYXyfUT8ERUaw=;
	b=W8qas0hEH5GL360KYTIMceo4wRxqr5SPDi0l21S/2Q0/W0WI3alD002ffYiXXryeoDJusn
	NFk6ipt58G32+KsqwrguBtqcmj87jGbXqLZW3evCF4sg9zu1o+wNX1f22Z84BqUn7wclPX
	LQM4BdwCosUAyLEzFBTrGKUkDjcSCoE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-JG40XH90NWC31ZROBSIZog-1; Wed, 22 Oct 2025 03:01:10 -0400
X-MC-Unique: JG40XH90NWC31ZROBSIZog-1
X-Mimecast-MFC-AGG-ID: JG40XH90NWC31ZROBSIZog_1761116469
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4278c82dce6so2642816f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761116469; x=1761721269;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p/wzttfZZIcdwp5kIjVhv23r7cyBB6dYXyfUT8ERUaw=;
        b=iMbfyBM+ybK4kZHOuHCd3jNFMa42zVWfSHz7qASppluYrKlx6Zy5T4cJmfOuSbANfk
         HH5uJrs2J6rjvsWLpKjfzNJAzbs7XqhiovFviRTjUpMzwJPe002u3YSZU0IWd0nJ0IZd
         IoFcxkirpHPTdDk5SC687dKIo0CN8J7RNmE23KrouCLlN4ahYIZx81JnEEqncdcnYC6O
         G/qbv7wDsrP5E1oPhQXqFsDY1YvUDcqyuVmaYPDSEq439QGC/0rXbL/7NmzuZs1aMD6z
         sfRYXik2WhQhGdcaRqvQL+B0G5ioE/7AOFDJ5kxhJq1BYfPxqoUH3oYrWg+NHOcgtTta
         gCiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRQVdboh0R7p7BsH79oCquiVhX3gYhAS42znku9eQPmGKHfa8xYvUs6SKdtAbar56YR35MctU51n3Go+YG@vger.kernel.org
X-Gm-Message-State: AOJu0YxSrCv400WImYASJJJ7punhB3j3mx6UXLY4e5BLnItMwKZKTrh4
	NjyDSaUBzu1eDtKVt7Q9QDa2WNbHZkqUsROlKk929w8X2rahKC27WP0T3GSlSAhfRyliBpa9W0r
	1vaczE/yLSXUp960Lh4shuBewi0mmANcXUYmtURt9wYRYBUs8BOzK/Xfps4cYKRji7II=
X-Gm-Gg: ASbGnct/+VHRo1zgF/AVXqc4RS6ZpIR9AvYfx1onbsanCgo69cqpaNYylX0qu5iloUH
	XENrcnvbn+Z782nHw/H1NxMa/NNu5vWtdmhSZmkREtLi3E15vARLoxe5xoD7XCLWrcuA+k4+F8m
	o5kQ4q6gCFX/iOJXmY1hamOD6vIhk6xv7+kFNLL4lctb/oWT4odcY3yRVR9aRh6l1Gbu25K4TzU
	VA1sZmb7noc6bE722PDkd0y+F8wMiiWmAhjjCepelcpV9qeXk+mJuslp8K76Ez9XDJKvNv8RG/s
	gSLc2cbcAKckUHbjx2/CTWw5bC2O8WPvCTZ0vvjLzRdJjSDUcuXCd2AYk8NjCvJ4srYV
X-Received: by 2002:a05:6000:420a:b0:3e5:5822:ec9d with SMTP id ffacd0b85a97d-42704d99f29mr12826965f8f.41.1761116469387;
        Wed, 22 Oct 2025 00:01:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtVUgbjjOkBKOAaeXoFsLqPC4uhTnJ7B4qxCiofbC48XDxdUtASszyIQinjVP9ESvl7Ojt0A==
X-Received: by 2002:a05:6000:420a:b0:3e5:5822:ec9d with SMTP id ffacd0b85a97d-42704d99f29mr12826933f8f.41.1761116468823;
        Wed, 22 Oct 2025 00:01:08 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c56sm23924067f8f.18.2025.10.22.00.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 00:01:08 -0700 (PDT)
Date: Wed, 22 Oct 2025 03:01:05 -0400
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
Message-ID: <20251022030050-mutt-send-email-mst@kernel.org>
References: <20251021-virtio_double_free-v1-1-4dd0cfd258f1@oss.qualcomm.com>
 <20251021085030-mutt-send-email-mst@kernel.org>
 <CACGkMEsU3+OWv=6mvQgP2iGL3Pe09=8PkTVA=2d9DPQ_SbTNSA@mail.gmail.com>
 <20251022014453-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251022014453-mutt-send-email-mst@kernel.org>

On Wed, Oct 22, 2025 at 01:45:38AM -0400, Michael S. Tsirkin wrote:
> On Wed, Oct 22, 2025 at 12:19:19PM +0800, Jason Wang wrote:
> > On Tue, Oct 21, 2025 at 8:58 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, Oct 21, 2025 at 07:07:56PM +0800, Cong Zhang wrote:
> > > > The vblk->vqs releases during freeze. If resume fails before vblk->vqs
> > > > is allocated, later freeze/remove may attempt to free vqs again.
> > > > Set vblk->vqs to NULL after freeing to avoid double free.
> > > >
> > > > Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
> > > > ---
> > > > The patch fixes a double free issue that occurs in virtio_blk during
> > > > freeze/resume.
> > > > The issue is caused by:
> > > > 1. During the first freeze, vblk->vqs is freed but pointer is not set to
> > > >    NULL.
> > > > 2. Virtio block device fails before vblk->vqs is allocated during resume.
> > > > 3. During the next freeze, vblk->vqs gets freed again, causing the
> > > >    double free crash.
> > >
> > > this part I don't get. if restore fails, how can freeze be called
> > > again?
> > 
> > For example, could it be triggered by the user?
> > 
> > Thanks
> 
> I don't know - were you able to trigger it? how?

Sorry I mean the submitter of course.

> 
> > >
> > > > ---
> > > >  drivers/block/virtio_blk.c | 13 ++++++++++++-
> > > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > > > index f061420dfb10c40b21765b173fab7046aa447506..746795066d7f56a01c9a9c0344d24f9fa06841eb 100644
> > > > --- a/drivers/block/virtio_blk.c
> > > > +++ b/drivers/block/virtio_blk.c
> > > > @@ -1026,8 +1026,13 @@ static int init_vq(struct virtio_blk *vblk)
> > > >  out:
> > > >       kfree(vqs);
> > > >       kfree(vqs_info);
> > > > -     if (err)
> > > > +     if (err) {
> > > >               kfree(vblk->vqs);
> > > > +             /*
> > > > +              * Set to NULL to prevent freeing vqs again during freezing.
> > > > +              */
> > > > +             vblk->vqs = NULL;
> > > > +     }
> > > >       return err;
> > > >  }
> > > >
> > >
> > > > @@ -1598,6 +1603,12 @@ static int virtblk_freeze_priv(struct virtio_device *vdev)
> > > >
> > > >       vdev->config->del_vqs(vdev);
> > > >       kfree(vblk->vqs);
> > > > +     /*
> > > > +      * Set to NULL to prevent freeing vqs again after a failed vqs
> > > > +      * allocation during resume. Note that kfree() already handles NULL
> > > > +      * pointers safely.
> > > > +      */
> > > > +     vblk->vqs = NULL;
> > > >
> > > >       return 0;
> > > >  }
> > > >
> > > > ---
> > > > base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
> > > > change-id: 20250926-virtio_double_free-7ab880d82a17
> > > >
> > > > Best regards,
> > > > --
> > > > Cong Zhang <cong.zhang@oss.qualcomm.com>
> > >


