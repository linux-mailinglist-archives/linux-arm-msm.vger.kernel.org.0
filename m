Return-Path: <linux-arm-msm+bounces-23901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2163B914676
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 11:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 449831C203BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 09:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9863A131BDF;
	Mon, 24 Jun 2024 09:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="JO5CXx1L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1242F855
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719221494; cv=none; b=kRH7xbgk6G2X6vIwH6tKu4nyfzyJ45NEi9NrSFW0u7HG4mw5jGxWRmOCClSRrCHSYNoMM/HwROnYQMfB2/Sab2qqoHc80Cur+1eJcKJOaUubFdvvK5g6wshL4OfQBBwm7pU+/1A5B/k2xK6F1sCuuLwpocOkNmOh+tTZ/m/vutQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719221494; c=relaxed/simple;
	bh=5H3KKhZN5GJiSaTipCifosMbbea1dREGVfXXXegHfDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myvz0KIDF4qF9N52go+w77kfOoGKQeCElCUKzZS6pfGWbR0ObyeTRCvM61AzzHo5u3J50+p1AglkzFu5u/9WoJjC1ar7vFidhGeKJ973/4NIcCFPWy017lAme+KqisQ4p8+fwTXE7gEHyhGsIfsNbNY57xU17ACBmvmZ5o0FH30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=JO5CXx1L; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-36310cb3961so133401f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 02:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1719221490; x=1719826290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhj3olTv6SUOY87PzY2paXqF2zIZ/sD/SzJjIPsH4iY=;
        b=JO5CXx1LiSIY7rhSQvJZS2KMzOHgsUCnjOkKtniZ+Izw1ExzHOD5K0hTiWoHiZNKqo
         FYhzQLkoNk21/aJO21A9yE3x+xNret/S1c7yDneBtlHUQCIlEArAwfmVfU+LDdqFfud5
         IlpEsfU8TbML1aLeX5iwh9DfuykfSA9EIL7Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719221490; x=1719826290;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhj3olTv6SUOY87PzY2paXqF2zIZ/sD/SzJjIPsH4iY=;
        b=qbUnB4ygza8Kq8Vs8bE9kRuh+TgUjDBk/tsUMNLA+TLhyMFWfiyZcJiZKhMhsvFPOy
         1+uBLaEKEGm0bLPNx8FFeojuuApfZ2CSd1woYJ4/oWwlfenas50nsjZ0aXm6OjpWK3B7
         Jze7jc+oVSUD/iFVpuXm5O3oOw0sQ1wwIB3gkxd7WSg+kLiGwEROdA+dBzI01DL7+jTH
         9ruG7BMCaeCL60cArE2WvhaSftW3EIZ+PcbEWOs+fnMtVHMguv+MqxiV0QEzB2IZ7xB9
         XG3gBcw/0J85SMMFSKoixRmTEeVpVc7H8bw1Pj7zirR+t8GH9o4SL98STyp81WvuC5fl
         YwnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/CNGhRCuXbRPDITd2rYKwkFgF0PBM9DrDYNL5gBA5lOcLosNeBI49aGEtJmqz2Bb7O/47k1gYZw5Ekg8q59N3Bk5tL+vty6Xz5ldJOg==
X-Gm-Message-State: AOJu0YzTaMQ8J3aatEsyBVZI3e3s2hXXrXM+wePtaLs7Pr2tqp+6cJO6
	T68YZwxMtvZ4CT0oV4enOVRvSBO0e0ORr/FLzG77CQxX2SBLSGMmUM3mUHOAbTM=
X-Google-Smtp-Source: AGHT+IGBvhkvIomB/OFmxsSh5OVMla/tqc6JCmz9Gjt/KuAZcaeO00S9dc+jYrcpEBr0xQnh5CMXDw==
X-Received: by 2002:a5d:59aa:0:b0:366:e4b4:c055 with SMTP id ffacd0b85a97d-366e4b4c18fmr3641032f8f.7.1719221490289;
        Mon, 24 Jun 2024 02:31:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36638e90cbesm9513907f8f.58.2024.06.24.02.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:31:29 -0700 (PDT)
Date: Mon, 24 Jun 2024 11:31:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Ekansh Gupta <quic_ekangupt@quicinc.com>,
	Oded Gabbay <ogabbay@kernel.org>, srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Message-ID: <Znk87-xCx8f3fIUL@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Ekansh Gupta <quic_ekangupt@quicinc.com>,
	Oded Gabbay <ogabbay@kernel.org>, srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	Dave Airlie <airlied@gmail.com>
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
 <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
 <z6g5ool5vomkudiroyaxh532rhlfu5x4i3l5xoqrsho2sxv4im@v5ghemjkpc3v>
 <CAA8EJprgCJKOnZo7Q31KZV3SA3NqWxcMmoUxuqnVF+8cQW5ucg@mail.gmail.com>
 <6f59552d-d7a3-5e05-3465-e707c1b7eaf2@quicinc.com>
 <ZnWhwJtTXS32UI9H@phenom.ffwll.local>
 <CAA8EJppRP0HdM6AfmL0uga2esDey12LVjuSn=wJZtV4Uz0CgZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppRP0HdM6AfmL0uga2esDey12LVjuSn=wJZtV4Uz0CgZg@mail.gmail.com>
X-Operating-System: Linux phenom 6.8.9-amd64 

On Fri, Jun 21, 2024 at 10:48:27PM +0300, Dmitry Baryshkov wrote:
> On Fri, 21 Jun 2024 at 18:52, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Jun 21, 2024 at 09:40:09AM -0600, Jeffrey Hugo wrote:
> > > On 6/21/2024 5:19 AM, Dmitry Baryshkov wrote:
> > > > On Fri, 21 Jun 2024 at 09:19, Bjorn Andersson <andersson@kernel.org> wrote:
> > > > >
> > > > > On Wed, Jun 12, 2024 at 09:28:39PM GMT, Dmitry Baryshkov wrote:
> > > > > > On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
> > > > > > > Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> > > > > > > to be added for PD notifications and other missing features. Adding
> > > > > > > and maintaining new files from within fastrpc directory would be easy.
> > > > > > >
> > > > > > > Example of feature that is being planned to be introduced in a new C
> > > > > > > file:
> > > > > > > https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> > > > > > >
> > > > > > > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > > > > > > ---
> > > > > > >   MAINTAINERS                          |  2 +-
> > > > > > >   drivers/misc/Kconfig                 | 13 +------------
> > > > > > >   drivers/misc/Makefile                |  2 +-
> > > > > > >   drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
> > > > > > >   drivers/misc/fastrpc/Makefile        |  2 ++
> > > > > > >   drivers/misc/{ => fastrpc}/fastrpc.c |  0
> > > > > > >   6 files changed, 21 insertions(+), 14 deletions(-)
> > > > > > >   create mode 100644 drivers/misc/fastrpc/Kconfig
> > > > > > >   create mode 100644 drivers/misc/fastrpc/Makefile
> > > > > > >   rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
> > > > > >
> > > > > > Please consider whether it makes sense to move to drivers/accel instead
> > > > > > (and possibly writing a better Kconfig entry, specifying that the driver
> > > > > > is to be used to offload execution to the DSP).
> > > > > >
> > > > >
> > > > > Wouldn't this come with the expectation of following the ABIs of
> > > > > drivers/accel and thereby breaking userspace?
> > > >
> > > > As I wrote earlier, that depends on the accel/ maintainers decision,
> > > > whether it's acceptable to have non-DRM_ACCEL code underneath.
> > > > But at least I'd try doing that on the grounds of keeping the code at
> > > > the proper place in the drivers/ tree, raising awareness of the
> > > > FastRPC, etc.
> > > > For example current fastrpc driver bypasses dri-devel reviews, while
> > > > if I remember correctly, at some point it was suggested that all
> > > > dma-buf-handling drivers should also notify the dri-devel ML.
> > > >
> > > > Also having the driver under drivers/accels makes it possible and
> > > > logical to  implement DRM_ACCEL uAPI at some point. In the ideal world
> > > > we should be able to declare existing FastRPC uAPI as legacy /
> > > > deprecated / backwards compatibility only and migrate to the
> > > > recommended uAPI approach, which is DRM_ACCEL.
> > > >
> > >
> > > I suspect Vetter/Airlie need to be involved in this.
> > >
> > > Its my understanding that accelerator drivers are able to reside in misc as
> > > long as there is no use of dma-buf.  Use of dma-buf means they need to be in
> > > drm/accel.
> > >
> > > There is precedent for moving a driver from misc to accel (HabanaLabs).
> > >
> > > Right now, I'm not aware that fastRPC meets the requirements for drm/accel.
> > > There is an open source userspace driver, but I'm not aware of an open
> > > source compiler.  From what I know of the architecture, it should be
> > > possible to utilize upstream LLVM to produce one.
> >
> > Yeah so fastrpc is one of the reasons why I've added a dma_buf regex match
> > to MAINTAINERS, and given this move has shown up here on dri-devel that
> > seems to work.
> >
> > But also, it slipped through, can't break uapi, so I just pretend it's not
> > really there :-)
> >
> > That aside, going forward it might make sense to look into drivers/accel,
> > and also going forward new dma_buf uapi will be reviewed to fairly
> > stringent standards. We're not going to impose the dri-devel userspace
> > rules on everyone, each subsystem tends to know what's best in their
> > ecosystem. But if something just ends up in misc so it can avoid the drm
> > or accel rules (and I think media is also pretty much on the same page
> > nowadays), then expect some serious heat ...
> 
> After discussing this on #dri-devel, I'm going to retract my
> suggestion of moving the driver to drivers/accel/, unless there is an
> actual interest in moving to drm_accel.h style of uAPI.
> 
> It should still be noted that there is a strong recommendation to
> start from scratch and to use DRM / accel uAPI, either using the
> existing driver for the legacy platforms or dropping it completely.
> When the fastrpc driver was started by Qualcomm engineers, there was
> no standard method of implementing the accel drivers. Since 1st of
> November 2022 we have drm_accel.h.

Yeah, if fastrpc just keeps growing the story will completely different.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

