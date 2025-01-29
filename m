Return-Path: <linux-arm-msm+bounces-46492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1438A21B11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 11:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C932E3A52A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 10:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BD61A8412;
	Wed, 29 Jan 2025 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C9n6nArz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D44419E96B
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738147208; cv=none; b=EqCDkgLJwPlcaez/Kd4m2qImdN2phWJeygUiVPv5i9+BrMUwXTN5q09HBN3zoirYn67bvB2+bFB3W8HJEIvUeeBrxyL2AfPMRmAPAAeacCPn2V+thzSclFgwuIpLohMRbeyAtx6D66f+YVYwnuk9xJUugSC5wMkCHntwhTU2wDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738147208; c=relaxed/simple;
	bh=mkABl06z1mub5kESdYBg1Z1sYWdChKW32AVtVofREAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLxqvQ+i7AEwIALMPAq6yJAeSZ2rS4MnXCx+JiaJV5rJc4yTCdvKKFnFnfhK/8iXvMqAtJ2D3WMdgQpfrLFdBr1SnHABgivy5T4BtYd25LQngiZXwbhF8PLY1Knh04VPvhAawYv0GKfJYew4UlcE3i4WjwnaaHDoq6kOFMjmNlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C9n6nArz; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so582882e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 02:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738147204; x=1738752004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vyooTYkohgYua0GBErn7xjGDeIZbWcfbmQSP4ECylwA=;
        b=C9n6nArzbSgdzzanHLNZ1WiMsegoYw/ZEkO+7Qt6YQ1dvB1kywH0cHejb9AmK9rBTp
         LCWeIOxaFlzjkURPCPC7YO44oGhDZySSxk7lf7u9524RPj352WzoKCduaywwZxorveCW
         /TOrIMlxowVkJD0oFMOdHZaex8PsFib5+2ZCan17DT5xDio9ZzqapDaLm8dmbHnGzCDJ
         K/DKNzinUGCBk8B3cQu+FaCpHwgCJnlht+ry8PjW6FlkgFEl0A/8MB8ctCr4W3ywxxDf
         WG4UZ465bclu8o6b+QQFbja9WLRgFeXqZSwE5C2P1f/chiQAGFYlgUBzt/c0u0BtPOHk
         lQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738147204; x=1738752004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyooTYkohgYua0GBErn7xjGDeIZbWcfbmQSP4ECylwA=;
        b=TU0r49lw4MGX94172LSq4lPCaKE9MTHlBn3wXF7SDXD+5cGdSa3yz5jRChDtfFAH00
         3qI5cbMN7LLpTXFXiOawt/5jpkoysDk37hv5oMuCSnqa9LijtO/HD5hMn0pxzli6sxZN
         wjUr3fkD6YScIfpb8vIVRJBXKgu9bdjbjoLw+ivk9b8agRPkzsThV9H6dLsGcijAkQ/S
         T/n5R75Sd1yKaOUbn0zBdEq7al6AwFhevrZLgyf8oNxOBF9831RxpN/Pf1cIZ0z8AXFM
         dfP+jqo9r1vxLBP86FroeJJOS3dpk7384O/uq3xzaXPzpXZajb6OqPuvy6zSumAPFZFR
         FESg==
X-Forwarded-Encrypted: i=1; AJvYcCWYzT56YCD2yA4ZzmsKtkYRchewf+aO4/JMJqe8/G1DCsdhTIqi72eR5NpNuauo6ZkRiuzQ2LphHwbkdOxk@vger.kernel.org
X-Gm-Message-State: AOJu0YyxKzb4ohmfj6IrZdiDNbm5ksXVumTXWYdORqESnQrlDCi5J0r5
	VNX3OsACL35kMVqW6w70+IXxhnHCW+YHGklaUCEUII61yuJjkHzHHXi0VCYG5rg=
X-Gm-Gg: ASbGnctx0Hn+oD3N71N/Azwc6/dzYQNFkHIw/Y3Md8pjp9d/y0OIdHxK3Q/0tKdtBFe
	UggOdzl13H15FHwfGcvmdf9fkkw8myzRUyj5L/YKQXiLvrGn0AQtacDUkKBEdLA2N1LRwEdnZCE
	gBJmZh/kZH3g9PfsNMflKvGDDYC6MHSCNUR/kQiil7C4RgurSaG9YncHFKO9DvURhEiu0GOlv+X
	QJ86M2Vjuhqh3w6gcdTlaEphPcmGw2PcZ04M+sxXz6VhUiSM5hYf26GmGcQCdWFwUUGIWQgaH+y
	qlRcq9xodhL1KjSjyLM7YPGbJ72BktSQHn3PT+EMMwRvLCZQKK5qWThEaqy2KieLx5BiIdE=
X-Google-Smtp-Source: AGHT+IEz2Qy0OdKT7BD14guLqtxkS8/XNT3Iqa+7CbyOJev2OlqK+JoJiYooOG6A556WOHQP1LCrpQ==
X-Received: by 2002:a05:6512:1293:b0:542:99a7:b415 with SMTP id 2adb3069b0e04-543e4a112b7mr1169518e87.0.1738147204528;
        Wed, 29 Jan 2025 02:40:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799d7sm1955517e87.170.2025.01.29.02.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 02:40:04 -0800 (PST)
Date: Wed, 29 Jan 2025 12:40:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 4/5] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <an4cvztdkqmrt7w2iaziihlxf4tbox65ze362v2lmycjnqg26y@jizjmh2ki34z>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-5-quic_ekangupt@quicinc.com>
 <hgox77a7e6zzriltwhzzciau6u2pmil4y3rl5o2l6zkp4fmlmp@q2dai5fxcvtq>
 <49295da9-82d4-45a0-a2a4-fdaa6600c70d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49295da9-82d4-45a0-a2a4-fdaa6600c70d@quicinc.com>

On Wed, Jan 29, 2025 at 11:12:16AM +0530, Ekansh Gupta wrote:
> 
> 
> 
> On 1/29/2025 4:59 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 27, 2025 at 10:12:38AM +0530, Ekansh Gupta wrote:
> >> For any remote call to DSP, after sending an invocation message,
> >> fastRPC driver waits for glink response and during this time the
> >> CPU can go into low power modes. Adding a polling mode support
> >> with which fastRPC driver will poll continuously on a memory
> >> after sending a message to remote subsystem which will eliminate
> >> CPU wakeup and scheduling latencies and reduce fastRPC overhead.
> >> With this change, DSP always sends a glink response which will
> >> get ignored if polling mode didn't time out.
> > Is there a chance to implement actual async I/O protocol with the help
> > of the poll() call instead of hiding the polling / wait inside the
> > invoke2?
> 
> This design is based on the implementation on DSP firmware as of today:
> Call flow: https://github.com/quic-ekangupt/fastrpc/blob/invokev2/Docs/invoke_v2.md#5-polling-mode
> 
> Can you please give some reference to the async I/O protocol that you've
> suggested? I can check if it can be implemented here.

As with the typical poll() call implementation:
- write some data using ioctl
- call poll() / select() to wait for the data to be processed
- read data using another ioctl

Getting back to your patch. from you commit message it is not clear,
which SoCs support this feature. Reminding you that we are supporting
all kinds of platforms, including the ones that are EoLed by Qualcomm.

Next, you wrote that in-driver polling eliminates CPU wakeup and
scheduling. However this should also increase power consumption. Is
there any measurable difference in the latencies, granted that you
already use ioctl() syscall, as such there will be two context switches.
What is the actual impact?


-- 
With best wishes
Dmitry

