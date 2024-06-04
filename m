Return-Path: <linux-arm-msm+bounces-21681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB288FBEEF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 00:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0E41282E46
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 22:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5772B139CEF;
	Tue,  4 Jun 2024 22:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gikduQ+Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39713BBF2
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 22:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717540221; cv=none; b=Eu185XYsqIwtpg5NQmTjAhgGFBTc6G1zlhXCeaOjztqb5SLwdAR+aGbNraax2V2mrKE9KQKecQP70jWYPF+YZ+uMHLeyM/96Hl6LkxHGqTqIwc1+lCB/Ab4tAC3w4bXfzzg5/HEKVSVZ7ECSJDRW8OrCm9YN2gXZEBziJ5UXqSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717540221; c=relaxed/simple;
	bh=B39SRqBa+TycVc1ytvacVfMonbAa4ePy6sjLp10v0zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NpJMV15q8fHt77LS7gx9XRL16vO6FcXPO3TacwZe66VuzfcfaHkOqK0+thwT+pSTWeRL/OH+uzoHmCclE1fAbz4O3lUAzCnq+9ZeeQ3lRCwhd6QI1BaAWzXNt1sgh4MYITqWliYGTnuD6JZYLAvXnGIg4x7evFKQjqGE1gsnDfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gikduQ+Z; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57a30b3a6cbso1980488a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 15:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717540218; x=1718145018; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/zBIhwWOU3sfIXfCl/yDKdwgVeuDp4na980Yh4ssgHM=;
        b=gikduQ+Z1n6nxcW6S5Iu5lm6cAifoQEvYy13wb4zmpTri914IKQHd2Q9dDDuDCU6VL
         8OLSs+wXXyzmAFgu8wdPGvNJhUHaio4/KVsdB668zUQ+lD8zbYfltMc5ziJ6ldsFZREU
         vH5dPFq2Q+o/Jnt22WgovMOZX53pZntiftY33gJQhI6qiAqs53HJLl9bBSUqNFDwuZSB
         5wA/5TZR171yasjUufbt5dujVv1rvL6Cct1q7f6xo5zZFPkL7UqdSQDc09aubf1ZI1dX
         K/OmKPuaDOPGFEV1UOEH92e4mGibg61Yh1T09TZ8eIPPH/l3zIwB+0twSD0DDlb7a0+r
         01kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717540218; x=1718145018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zBIhwWOU3sfIXfCl/yDKdwgVeuDp4na980Yh4ssgHM=;
        b=UibKfGPpGZHbe0/XY3KpbpqeIM6eJb1mG3FfWjykahbBfmL82thnCHos619uGRTD7C
         3/jAJDGSH+NmGNtEDtY1hL3u0fN0Eexnv4eLXVizAQZjGg9/+LNWGorIGUPkbm4cBdNr
         tNHa2QlE+LyatSTMmXfoKpwQqlBhLsH85TxObEkziITj/6ZlGe23kUKTxvM7CPw3IUX2
         54QWtHqfxQ5HdRDwHoGUrECL2i5O2a62g9Yeu5lQiK4u69e5qEbGLAwmpgr2+kJ6mJhv
         xgPppcSm+8/WByHreT2KwD9oxOq14X4bdrvhnShr9cXSXx6PzTzdA4xdiqX+1O2TPZmh
         /hFw==
X-Forwarded-Encrypted: i=1; AJvYcCXdyIX+itdYHhhxDUgbF3uOuIVVHv3fCNQ0o+KIgajJ1xVNpeLr4Dnhj0tOqIdTssJ4YlK2tYsQqTb+sZp9Plc7MNzmkESgMk6YGeRzSA==
X-Gm-Message-State: AOJu0YyXbgv78G5apyjD72tgdeWgAKlUfqGJCNpNHwahNO6rcfIv+hmW
	q6B9L5+EmwztzB7HlkewYBZpmSAlk8s/vmp2FlsSwREq3xBn7m323NlyHsgG4LdD+R7ZoTfIvJD
	syjE6dsMagPR6RzkiWWJD+RKCBWE=
X-Google-Smtp-Source: AGHT+IEgc/2xYZJH0orvDOqF6CS/WciMa45guyxcdJXuZmAqXqt861e50qlHAxpv6QFDsG9tVrrKi3a+q2i2Uyxdt7g=
X-Received: by 2002:a50:d50e:0:b0:57a:31a3:f4e6 with SMTP id
 4fb4d7f45d1cf-57a8b6750f7mr508203a12.2.1717540217807; Tue, 04 Jun 2024
 15:30:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604214018.238153-1-pbrobinson@gmail.com> <CAA8EJpr2ZKugjwYzFUq3Rqjdm6DO-PiZEfiuBjxSnJDmRcMRdw@mail.gmail.com>
In-Reply-To: <CAA8EJpr2ZKugjwYzFUq3Rqjdm6DO-PiZEfiuBjxSnJDmRcMRdw@mail.gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 4 Jun 2024 23:30:06 +0100
Message-ID: <CALeDE9O9QmX2YUvMxbfVNcC+nmNNh2dgQkLvMqNaQNr+3S9Beg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add some missing MODULE_FIRMWARE entries
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Jun 2024 at 23:18, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 5 Jun 2024 at 00:40, Peter Robinson <pbrobinson@gmail.com> wrote:
> >
> > Add missing MODULE_FIRMWARE for firmware in linux-firmware,
> > this is needed for automatically adding firmware to things
> > like initrds when the drivers are built as modules. This is
> > useful for devices like the X13s and the RBx devices on
> > general distros.
> >
> > Fixes: 5e7665b5e484b ("drm/msm/adreno: Add Adreno A690 support")
> > Fixes: 18397519cb622 ("drm/msm/adreno: Add A702 support")
> > Fixes: 3e7042ba87da ("drm/msm/adreno: Add ZAP firmware name to A635")
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index c3703a51287b4..fede5159e7f5b 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -609,8 +609,11 @@ MODULE_FIRMWARE("qcom/a650_gmu.bin");
> >  MODULE_FIRMWARE("qcom/a650_sqe.fw");
> >  MODULE_FIRMWARE("qcom/a660_gmu.bin");
> >  MODULE_FIRMWARE("qcom/a660_sqe.fw");
> > +MODULE_FIRMWARE("qcom/a660_zap.mbn");
>
> -ENOSUCHFILE. It should qcom/particular-SoC/a660_zap.mbn

> > +MODULE_FIRMWARE("qcom/a702_sqe.fw");
> >  MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
> >  MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
> > +MODULE_FIRMWARE("qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn");
>
> I'm a bit sceptical here. Each device has its own zap MBN file (this
> one is also a fancy named a690_zap.mbn).  Do we want to list all such
> files? Consider all the vendors, which are open-source / Linux
> friendly, like FairPhone, OnePlus, etc.

That's what's in linux-firmware, I would have thought they would be
SoC specific as opposed to device specific, but that's not what we
currently have, are we supposed to have devices that selectively work
based on what firmware they have?

> >  MODULE_FIRMWARE("qcom/yamato_pfp.fw");
> >  MODULE_FIRMWARE("qcom/yamato_pm4.fw");
> >
> > --
> > 2.45.1
> >
>
>
> --
> With best wishes
> Dmitry

