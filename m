Return-Path: <linux-arm-msm+bounces-83015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D47CBC7F4E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 08:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4BC9434339D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 07:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0162EA172;
	Mon, 24 Nov 2025 07:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="I33TT0OJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28BE2EB843
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971120; cv=none; b=VPR0FtDSN9C0Dg4LkIwwuUeAGq9JS1iY09wXZRfd2n+D88h1GR1VnisHOJO2pUHeeLQqbas6alVJF96/DDs+PZZEyQPrxhrMpNCSZMt+bq7rQuGvW2JngzUlyzqar405UJvTZ4Nro1RJIzRYGgWf2c6wC9iLPsIeYsdO4HeVKCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971120; c=relaxed/simple;
	bh=NWcIh1ErMKd6H6vWOXjkKaKPaSynKkQ1yr0ovtWLPOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecPdsJ/v3S9YQ3a0HeuwUNi7bptyO4bWEvRNsmJ/YYOq7S0fg5tVdBJRhd0r1jxFUCwAuHXtvC1K2zebggyXwWstRLdf0IR+RsT5nvUQLC0Ns0Nr8huj0cWx1a0sK9cNOCAKEhSSl6swSiy6iQq03URukVL7UxE+6bHjz+SUtKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=I33TT0OJ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59431f57bf6so4217420e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 23:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763971117; x=1764575917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWcIh1ErMKd6H6vWOXjkKaKPaSynKkQ1yr0ovtWLPOA=;
        b=I33TT0OJEb9/OFO2gkbCI3phaDWFP+Ti5ip/OEnu5ixwXHacVDCYj4uaoQGN8g/HuV
         Li/Bk2mSRTPPSRYJ6jLVswJXZ81gc4P96gkoA4DX5DmSOd1L8KGk25LLg+At9eCPbCOA
         aSM08lZOdKZnwAgaHQ9M51eXaxj/XRPKcvnMjwbZq2yVDS9iNUBU0kI1MDZHlldnHqlN
         nAIomMNSre3hIDUoLAUaTlY5a2H0fLJVGHrPE8x5oTi4jvQTFLIj7aCdUUku4lB4q3Cn
         c0v69bUDHArBh0egw0OIyJUtMslXi66c+YfBBput6MSdSrWF3Tcj29WDDuhIA/l576pU
         p4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763971117; x=1764575917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NWcIh1ErMKd6H6vWOXjkKaKPaSynKkQ1yr0ovtWLPOA=;
        b=xLDHouwfHwyV6ctuWYYPufPhjh/Ldz0XXtT/QZf+nynBAgbnQodqImzzlUSZpmam5f
         SJZlpmy64AVOQOcCo8ldhRmm+B5ns3evl4/84Venf8yXx/n+tO4/f0iMSJwhVug3/Ds7
         pzEpegP/JhllQluQ07fcTxVz6Xbn8IpMLlpMVHnwHxnKP1qCi+M3mWWvWQZjuJ/JRZgl
         dhCwLAvoZF6TM9Kn+LdTlr3p/VXG6sDofLrTy4x1oy+/bmF11cqE0S4MOdA85pV/gY4z
         RggPSR5uSUSk6jL8BbBMs3CErvkr9MJ2ZBtMYYP4qBfY7chwte8yc+nonJ7MwN3QsfxK
         D4Sw==
X-Gm-Message-State: AOJu0YyR4E9pNTstGvjM5P2/rjsY/7zaOjYvIyQd9JhaYZ7rMP332QXS
	qIoiQ5KqEleBSBSegPnKyYvJhMyvEmhZr+uEnX4NBcRPwtVo+iZhak4+qjXP8uFJ3YaI31Q5LEl
	QDecceZiy++kDW8Nw+vJfIaRgwPmFohWQW6OTgcoK4A==
X-Gm-Gg: ASbGncv3BdGzWBa+BCYLhfWXwgC3Zg17LJhdmLc/CxpM1fytwZnEP1YwYBTCiBxvfJG
	58s3iBGA6uYBFNm8V6gc65UbSyRkakBzHk8uy2kZRqIYDdr/ga++CO624SB/PVC5pO6ImdWxaSg
	/BvJDhzbzzjaAE22UvLLw0p1vYS9aywU/TpPIELt9yOgpQOPh/Oud363Jbot/SqR0HznYgFw32G
	vCKO/lhSsVsgf7Ly3ctVsAjuOz2m10ZGuRjHt+FKZyXBzE3T926CmvYEKlL57+JFX+CNRZOkDia
	ZNcCmlKtE7HuTP2MbA79YZg3S5I=
X-Google-Smtp-Source: AGHT+IFcmJtPui/jBi6YtKb/aiSxS8z0bfSVfYVMb9+ydpmidfbDyj+CR4bSFaYUCQ/R4d2g2KsnKpT2GI4I13mnEbs=
X-Received: by 2002:a05:6512:3ba2:b0:592:f931:4f9 with SMTP id
 2adb3069b0e04-596a3ed3116mr3904528e87.16.1763971116547; Sun, 23 Nov 2025
 23:58:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106-qcom-bam-dma-refactor-v1-0-0e2baaf3d81a@linaro.org>
 <20251106-qcom-bam-dma-refactor-v1-3-0e2baaf3d81a@linaro.org> <aSF97DVdACd7h-LI@vaman>
In-Reply-To: <aSF97DVdACd7h-LI@vaman>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 24 Nov 2025 08:58:24 +0100
X-Gm-Features: AWmQ_bnFVEXOuKYb9j2pc5yJlnN9LcrNBHyUT4HcQ7ozcEEzYxWhG4VU4QDS380
Message-ID: <CAMRc=McGzOEOKqkdtArALWTm3WjKNtgcw1VZzaz_7ZPgFqh=vQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] dmaengine: qcom: bam_dma: convert tasklet to a workqueue
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 22, 2025 at 10:10=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wrot=
e:
>
> On 06-11-25, 16:44, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > There is nothing in the interrupt handling that requires us to run in
> > atomic context so convert the tasklet to a workqueue.
>
> The reason dmaengine drivers use tasklets is higher priority to handle
> dma interrupts... This is by design for this subsystem.
>
> There was an attempt in past to do conversion away from tasklets [1]:
> We need something similar apprach here. I can queue up first two though
>
> 1: https://lore.kernel.org/all/20240327160314.9982-1-apais@linux.microsof=
t.com/
> --
> ~Vinod

Ah, I wasn't aware of this. I tested some simple use cases with QCE
and it worked so I assumed it's fine. Yes, please queue the first two
ones and I'll revisit this later.

Bart

