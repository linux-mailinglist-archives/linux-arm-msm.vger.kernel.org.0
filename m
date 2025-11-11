Return-Path: <linux-arm-msm+bounces-81289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DDABBC4E8E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 15:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8EC324F861E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 14:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F1832E130;
	Tue, 11 Nov 2025 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="nf5ZZwQg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f68.google.com (mail-oa1-f68.google.com [209.85.160.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DDD324701
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762871852; cv=none; b=AR7/NT+vJHTiErOowqSvJLaFYkSm40APpehYWqLfoJm+A6+iWDLCbFtPr4fy3Lypj3B6lpTPTa3MGSiqAYPtRz4AwdCO675dIchtzSFQokyCIYMiGGf3Vw4Nb8r2EQ4Wf8gz6x5TRUqt2/d30gYkFYmJaLPmL//EtnevxoKgTUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762871852; c=relaxed/simple;
	bh=4vsDOO5vSHCFgZxshezv4v4YKIlkh5M/Jf9eZEgWohI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHdAW0PZGXNh61VaFA/dC97mF3O3iUEwoBPvxwa9Pu9dR6sBXOSYAkd/ssn0BAh0/GttraEPcBASEwkcjzYNkIslZTSKmzV5fuounWrlZmcj7SHd6RP/o49AgmZI5oC/eicwcNsV7MXTpa59TuL0L8Pft8yGSMvPoIcaplVutmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=nf5ZZwQg; arc=none smtp.client-ip=209.85.160.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Received: by mail-oa1-f68.google.com with SMTP id 586e51a60fabf-3e2fc677775so3397683fac.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 06:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1762871850; x=1763476650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI/Bx88S/ljGSNn+PL5Rjkz6jNPZ9Ne5hLvzfkx+saI=;
        b=nf5ZZwQgaY1zLdL4pBWkWIkCxgeavzFny7z9nCd+70x0/+edfWo547ejcgVwd+AjVk
         Nm/N2bIMZIPzvuJpykEtRNRNYYTpzq/8+zvvZrGCutQwZHYJGBwUEdFys6shKFJP2PlJ
         MXRxtr3p9X8mXtAgiwSC9Xkf7CWGj/WrLr42e7vTQhsiHTz9mQyAFngTtw4IMu/YpVaG
         X06HrUQYw92Z/2BkwIHClLKwXkgVZZoUI10xP2vIQDFnbDL2oDLEuJ1TrEjfkL9p9DyG
         GkiYjWTJcF96L5sJv1jpo46p9JoR3G6Jteg+NUHurHMbVf4OGUPeIwNteBGmsJ+3gL27
         pWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762871850; x=1763476650;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sI/Bx88S/ljGSNn+PL5Rjkz6jNPZ9Ne5hLvzfkx+saI=;
        b=VXow8ACcU0Hf+4PNmnPipScbCBMMyTsjB7P524pFygAtsH92+WiEyNuPtkZLE7h1f0
         KRDzAXl1N4kBMzhvNAoSE3b0tjBjIGaXjEl99xhxGzDvBancIgxoRDyHXHaqkrphhsPu
         3fm+RRe9wVyTZ3SiUjYRl+g9ewzlx53qLMRqXtH0ZQKH5e+UGfGQVYrz8A7yHURQvh4F
         2VNsmd6RU+ATSvfAj4G1vklHt99uZ1Ll6GeAG39QAWsFS2Lv6U5FLCGSeUIDdTzDKTJJ
         LaRbnOuu8MiwFJ7eZCwkKcioNANaPZuutEXTLDf8F/6sX7MivPVwkydu6E94YdZXZe88
         a2Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUN203/NP5+WMtMG0zcc53Dswg26q459qoGMdFihzdBxgba4pcjni1n55hBm8EkfR3ni4kCrHpSiOsrsUG3@vger.kernel.org
X-Gm-Message-State: AOJu0YzSBqbyaLSzuMZ06d0HEkVXMBF09Zh/ixtsMUKb+I5txSLX9Z11
	4t6s3VW7e4+oFJikBFAcBFJ+OOwZl20jnj6zVrtgQrrJyYJrLe6Jydwx/wv/lWZJnk8=
X-Gm-Gg: ASbGncu3DyE1FcnoDdFV5EfW6OzLfyHAvq5S81LBb39XkhGEGu5F0ZEfAJoe+nHvug+
	KPajQD6itXt+HWAgozg6eV1z4bix2o16vDNlIH9J6/I9cSl0r9m8Pp/nF5Jt4SGfA+2qmk5zQfG
	ixVgSHpangaSTvfOKe7SZaIhWTXeUKRs9ZJZJj5lV6DYKPLMicxDlL2cP3N2PlKvs3nQQejcZty
	QDn6govTZddCf+iOkgR1oTE7ssyUa12jd/ibtdkAX1IRndOi/Q4X+Mpk2OfAFVKhqdhekRf+NTt
	FTw/gTyJFvAsaolO4+wHl56i//0I6KSoIpnljK9uwavDNtp7+/f4AGmyXCisjFXZhEJ0qYUFB1l
	6ATYR9x37KDv7U9K2Y051nHkKhGYCB+8BWpr1cw23Di7+aE/YEL2moGwkvu8ISzf7Dskda1mdki
	WqUxk=
X-Google-Smtp-Source: AGHT+IFusuA/Ax3anjd0HIltuToxJUS02/udclYoHdoDI29Kk3VNxq4/rhyMyYWudQr5f0WcO3jkBQ==
X-Received: by 2002:a05:6870:4792:b0:3e7:f4a9:588b with SMTP id 586e51a60fabf-3e7f4a9b0bcmr4110818fac.15.1762871849590;
        Tue, 11 Nov 2025 06:37:29 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:b4e9:19a3:cdaf:7174])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3e7d6f7a27dsm4861066fac.0.2025.11.11.06.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:37:29 -0800 (PST)
Date: Tue, 11 Nov 2025 08:37:24 -0600
From: Corey Minyard <corey@minyard.net>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Christian K??nig <christian.koenig@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vitaly Lifshits <vitaly.lifshits@intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
	Sagi Maimon <maimon.sagi@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Karan Tilak Kumar <kartilak@cisco.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Petr Mladek <pmladek@suse.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	Takashi Iwai <tiwai@suse.de>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas Hellstr??m <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Satish Kharat <satishkh@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 12/23] ipmi: Switch to use %ptSp
Message-ID: <aRNKJIyk2ne39ScE@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
 <20251110184727.666591-13-andriy.shevchenko@linux.intel.com>
 <pvjnjwm25ogu7khrpg5ttxylwnxazwxxb4jpvxhw7ysvqzkkpa@ucekjrrppaqm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pvjnjwm25ogu7khrpg5ttxylwnxazwxxb4jpvxhw7ysvqzkkpa@ucekjrrppaqm>

On Tue, Nov 11, 2025 at 05:08:25PM +0900, Sergey Senozhatsky wrote:
> On (25/11/10 19:40), Andy Shevchenko wrote:
> [..]
> > +	dev_dbg(smi_info->io.dev, "**%s: %ptSp\n", msg, &t);
> 
> Strictly speaking, this is not exactly equivalent to %lld.%9.9ld
> or %lld.%6.6ld but I don't know if that's of any importance.
> 

Dang it, I'm traveling and used the wrong way to send the previous response.
Sorry.

Anyway, yes, it's not equivalent, but it's not important.  It's better
to use a standard output format.  Thanks for pointing this out.

Thanks,

-corey

