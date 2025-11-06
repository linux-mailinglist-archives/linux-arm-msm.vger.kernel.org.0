Return-Path: <linux-arm-msm+bounces-80511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C20C8C390D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 05:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 58AC14E8585
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 04:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DE71E5201;
	Thu,  6 Nov 2025 04:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gvuVx+v7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M/oY2lKK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C5E18EAB
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 04:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762402033; cv=none; b=Qd3YMCYdJNrjGkJ/4IUhZeb3iP9y2xklcNYHs1U0F2OOGxC6TjLCEFHdnAJPZ+G9GbCZf1apMT7+UhQQaHPGe2NufnpIEdRKNp+0Pd6eqwfdN2O4aCaXy74dJ7O+3+Uhb3rralr9SOGXt3d/jv7IS6Vee6bGNNOFfLaIbiMIFts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762402033; c=relaxed/simple;
	bh=/j8IwCwfnUpo7t3t7ZYWNOWrViZy1XGN5IE6aVd3q2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afK2LjOekCVZaeT7jQnye8MJLZi8Va6N7w4PEcO5WNiccj5NRU/MIwrdP5VojazOUf5Ksd63WfdpjrToofybepFzGyV6RASu30pewAh+pu9llGU5gd5aPMy4oilFABZrCX9YLuDE03sBC0TQBnj5pmSi+WC3fX+n3IXtaQVXVn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gvuVx+v7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/oY2lKK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762402030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LoU2+gnsfiuqREd6bvWYLEq5UZ7fNohYOQZcwDScec8=;
	b=gvuVx+v78xd0tcog4OULvqa4bk8K29wAp7R0parQT0F5kms5NYIqSZpzLSmoR+JuLqZID2
	DRh+U0EgQU68BZ62ypjwppc8YAZIy2ZnNhh51Dbq2jm2kgU0aXhNE3AS6LddDxfFVDkKbr
	pCacl1q2nB3e7aGKrQ4vGpPOG2RtRQk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-K0Xn0QyEMfSEQxqenHnrMQ-1; Wed, 05 Nov 2025 23:07:09 -0500
X-MC-Unique: K0Xn0QyEMfSEQxqenHnrMQ-1
X-Mimecast-MFC-AGG-ID: K0Xn0QyEMfSEQxqenHnrMQ_1762402029
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3407734d98bso818968a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 20:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762402028; x=1763006828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoU2+gnsfiuqREd6bvWYLEq5UZ7fNohYOQZcwDScec8=;
        b=M/oY2lKKRaJiDPTUxwZdlbnv6Hka+sN/775RWNPUIwaLCbYNdjXZwIMZhhGIl3/1gs
         Rz7CKDDaSIlVMn4gxKFW6f33jfjWgpYYhogQQxDnsUEGblAFHzBSiG8CEPeUZloowm3n
         dP08pj97So4mbG5PuaGYACimpuiwBqGXhn6uajAugHgSdOTQx0rGVexgkr7Cl0dASOnC
         6mlpXrFRhom0rFCabAMtLL2pXiKVXMP4z7g1HctMEcxC84XhYJHiGPWaUegN2vnN0zmx
         GFJPHfLvh4b8BQPvd94aiWBp9xjKHwBSc5Sq0MjsMeQuc3TAWRZRUETcoZGU5SNroDgw
         eHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762402028; x=1763006828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LoU2+gnsfiuqREd6bvWYLEq5UZ7fNohYOQZcwDScec8=;
        b=volQ49GB7KoIz1StjZDyz4gyAOAg515UC1PEjQLQHCuHiyxFDazFDOFWwGZkx0sDUg
         /LyRSW4yel+E3xcY27y/YXSjhuV33xVOZDnd03pc/Iw00GXdzbSgr0kec8IwWZpF97Id
         F20T6APFkBtl3Et/vVHrkjHaNyimXPOlRIr0gD9simkImLh4e8km9M6S1fBd9dWnb2dX
         BSmey8WQeVjIK6JKGvl8JPbEVzMph3cwvUgqRJIvoLpEyanlhqhQPmaqoFvsrKyYKViv
         REOzu3s0b0QE8V466ubS1YqRe0vZH9NgkxELywToa02cUOW44c3R5f7zMT2qybuDso2K
         GybA==
X-Forwarded-Encrypted: i=1; AJvYcCXzg2f8ffk5ZPdm27oiautODYrJ+FKHlDvq3VujSZDj5OCp5vCqAfQ0Ck9VAdz1STmGNbMhfc3y0ciUIE2c@vger.kernel.org
X-Gm-Message-State: AOJu0YwfZ4RHH3WC8p5doTM7v6Bp3Z1ZRz7vace1SITaq8cVTgGIIrEl
	pxiuek+tTNruLtDhPQ5Ts1ibu9U/ckk64NP6HwvHolgQLQzu2gNlxSXi38rO+ZVAmm6XFVgyBU8
	IyyBWycSpeDEgLVLfW6yPjIz9n9lQcIofawKyma1XtnFTk5TFAzeb1jydCLGuSNk1g8tswq6yHR
	QOeMFeS8sN7XBjbLpVXQRJIbrTyDMVG4Ta/ZvEYwTdiQ==
X-Gm-Gg: ASbGncuG/Ev8svxDz20FJBKpd27TytQnDe9Kw9Eqh2KNwUBl38m4ryFYXYslEUEf0Hf
	yXzY2zd8TZtQCVtwCrI/Ey+7NLtr/ruKJUF5D9hGcfTJD/7MC+tp9+eF3DJEf9vJc2oGQk1lYAG
	qRo5Vsn49vIqEsXfpEKHawE78mU58ZAA59c5HmjDgCn1v6720KizcevbTR
X-Received: by 2002:a17:90b:1f88:b0:340:c060:4d44 with SMTP id 98e67ed59e1d1-341a6c4d7aamr7027666a91.14.1762402028616;
        Wed, 05 Nov 2025 20:07:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgxzLPmIUN23c30q2w75GF2Oo+BHzJVke+jXJuO4CwdOMsjKJErSE1VijPnPth7Jf9XW5Vf/Zgdu/s2JTjPzA=
X-Received: by 2002:a17:90b:1f88:b0:340:c060:4d44 with SMTP id
 98e67ed59e1d1-341a6c4d7aamr7027630a91.14.1762402028159; Wed, 05 Nov 2025
 20:07:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-virtio_double_free-v1-1-4dd0cfd258f1@oss.qualcomm.com>
 <20251021085030-mutt-send-email-mst@kernel.org> <CACGkMEsU3+OWv=6mvQgP2iGL3Pe09=8PkTVA=2d9DPQ_SbTNSA@mail.gmail.com>
 <20251022014453-mutt-send-email-mst@kernel.org> <20251022030050-mutt-send-email-mst@kernel.org>
 <f7401703-e912-4d61-b206-f9f1de930092@oss.qualcomm.com> <8910d20d-dc47-4a12-9e83-204174154663@oss.qualcomm.com>
In-Reply-To: <8910d20d-dc47-4a12-9e83-204174154663@oss.qualcomm.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 6 Nov 2025 12:06:56 +0800
X-Gm-Features: AWmQ_bl1nw_u7Z9-YxAPWR_NNGdbr60ykEVvrchMvodD52Y0yrObCchz2OB8nro
Message-ID: <CACGkMEuD43oH7zshX-Jf+nvxZmkw730vcX4fcFH9+2z6b_8O-g@mail.gmail.com>
Subject: Re: [PATCH] virtio_blk: NULL out vqs to avoid double free on failed resume
To: Cong Zhang <cong.zhang@oss.qualcomm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pavan.kondeti@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 4:56=E2=80=AFPM Cong Zhang <cong.zhang@oss.qualcomm.=
com> wrote:
>
>
>
> On 10/22/2025 4:02 PM, Cong Zhang wrote:
> >
> >
> > On 10/22/2025 3:01 PM, Michael S. Tsirkin wrote:
> >> On Wed, Oct 22, 2025 at 01:45:38AM -0400, Michael S. Tsirkin wrote:
> >>> On Wed, Oct 22, 2025 at 12:19:19PM +0800, Jason Wang wrote:
> >>>> On Tue, Oct 21, 2025 at 8:58=E2=80=AFPM Michael S. Tsirkin <mst@redh=
at.com> wrote:
> >>>>>
> >>>>> On Tue, Oct 21, 2025 at 07:07:56PM +0800, Cong Zhang wrote:
> >>>>>> The vblk->vqs releases during freeze. If resume fails before vblk-=
>vqs
> >>>>>> is allocated, later freeze/remove may attempt to free vqs again.
> >>>>>> Set vblk->vqs to NULL after freeing to avoid double free.
> >>>>>>
> >>>>>> Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
> >>>>>> ---
> >>>>>> The patch fixes a double free issue that occurs in virtio_blk duri=
ng
> >>>>>> freeze/resume.
> >>>>>> The issue is caused by:
> >>>>>> 1. During the first freeze, vblk->vqs is freed but pointer is not =
set to
> >>>>>>    NULL.
> >>>>>> 2. Virtio block device fails before vblk->vqs is allocated during =
resume.
> >>>>>> 3. During the next freeze, vblk->vqs gets freed again, causing the
> >>>>>>    double free crash.
> >>>>>
> >>>>> this part I don't get. if restore fails, how can freeze be called
> >>>>> again?
> >>>>
> >>>> For example, could it be triggered by the user?
> >>>>
> >>>> Thanks
> >>>
> >>> I don't know - were you able to trigger it? how?
> >>
> >> Sorry I mean the submitter of course.
> >>
> >
> > Let me add more details:
> > Autosleep is enabled in this case. When the system wakes up from
> > suspend, it will call virtio_device_restore. The failure happens in the
> > virtio_device_restore function before vblk->vqs has been allocated. The
> > system still gets woken up after the failure happens. Since autosleep i=
s
> > enabled and there is no wakelock being held, the system will try to
> > suspend again. Then virtio_device_freeze will be called and causes the
> > issue.
> >
>
> Gentle reminder.
> Please let me know if you need any additional information.

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

>
> >>>
> >>>>>
> >>>>>> ---
> >>>>>>  drivers/block/virtio_blk.c | 13 ++++++++++++-
> >>>>>>  1 file changed, 12 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk=
.c
> >>>>>> index f061420dfb10c40b21765b173fab7046aa447506..746795066d7f56a01c=
9a9c0344d24f9fa06841eb 100644
> >>>>>> --- a/drivers/block/virtio_blk.c
> >>>>>> +++ b/drivers/block/virtio_blk.c
> >>>>>> @@ -1026,8 +1026,13 @@ static int init_vq(struct virtio_blk *vblk)
> >>>>>>  out:
> >>>>>>       kfree(vqs);
> >>>>>>       kfree(vqs_info);
> >>>>>> -     if (err)
> >>>>>> +     if (err) {
> >>>>>>               kfree(vblk->vqs);
> >>>>>> +             /*
> >>>>>> +              * Set to NULL to prevent freeing vqs again during f=
reezing.
> >>>>>> +              */
> >>>>>> +             vblk->vqs =3D NULL;
> >>>>>> +     }
> >>>>>>       return err;
> >>>>>>  }
> >>>>>>
> >>>>>
> >>>>>> @@ -1598,6 +1603,12 @@ static int virtblk_freeze_priv(struct virti=
o_device *vdev)
> >>>>>>
> >>>>>>       vdev->config->del_vqs(vdev);
> >>>>>>       kfree(vblk->vqs);
> >>>>>> +     /*
> >>>>>> +      * Set to NULL to prevent freeing vqs again after a failed v=
qs
> >>>>>> +      * allocation during resume. Note that kfree() already handl=
es NULL
> >>>>>> +      * pointers safely.
> >>>>>> +      */
> >>>>>> +     vblk->vqs =3D NULL;
> >>>>>>
> >>>>>>       return 0;
> >>>>>>  }
> >>>>>>
> >>>>>> ---
> >>>>>> base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
> >>>>>> change-id: 20250926-virtio_double_free-7ab880d82a17
> >>>>>>
> >>>>>> Best regards,
> >>>>>> --
> >>>>>> Cong Zhang <cong.zhang@oss.qualcomm.com>
> >>>>>
> >>
> >
>


