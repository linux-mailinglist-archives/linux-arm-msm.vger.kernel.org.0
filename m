Return-Path: <linux-arm-msm+bounces-46282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E48A1D9DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 16:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 886C6166E07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 15:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E79147C9B;
	Mon, 27 Jan 2025 15:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P9UdtQRt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7D66F30F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737992802; cv=none; b=HHW5q2g4CnuojowBo48sH836BHXkw4f77H+tmhv71uApwIXVrjqrImyMo97ltPeUblOFGHJVf1cqVxeFFE6ibpmoyj/jI/8Any/pcPn8/dzxiJj4wR9J5wTcT1Yuoe1wDd40iqCJsNaFH975L6ZbMudupeipCl9fLt85sflTIw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737992802; c=relaxed/simple;
	bh=N1Ojiro8aDPYY2Ui+tNuOUqnHpyjZQL3icPbEdgR5W8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTEBqn8oMv6x0JPPGp44izZ62oWJj7fxQ+hcGcmLFlRSDoRjS+gXtT8xdHQuFaFDcT0MSo8zrlrrD3UVXhuujrLAHWLuoNuNtdku1ovCLW1MLdsLdulB252SFVQaow+V17JXJt7N7/GnBiqTCF4rGj4UfCNubRsg+KSrXf125Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P9UdtQRt; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e545c1e8a15so7067124276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 07:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737992799; x=1738597599; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FyzF5JKQNS8WVSZnXyHkt17dR177PmUZO2C7o3A2Y90=;
        b=P9UdtQRtsmbwceyISGTJK52CDLmzGMY0OnL3nWBlQRDvaaqRGtZx4NJgWRmvyK8zQ8
         JnQwKcLl46wsLQ93Z2xzRFzxbZjYhmwRuIXy1l8Def1eI6e1noSvfHqVLDOpLMkUEWST
         J6zJ2S88IyTNyMERi7waH8QGG8OQqNMziXQO5i5pvXeCjNb0/FKSQWk8dYphyOh6ti4z
         WhPMBzsinW8KE0IxojSEh6ykAumofkGqnNAXZzXrvwJ3Ed3g/BBfof01Co/bNTwoVK+M
         drh+Pi6f7U7t6q0a9QjDpLWFSvdBAXNyAlAayOkVcSJbytF5yEehsRoYEmRi/IjnVSqi
         Rd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737992799; x=1738597599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyzF5JKQNS8WVSZnXyHkt17dR177PmUZO2C7o3A2Y90=;
        b=Tmdi9bI8KCAGI9+iWHOTrYCfvLVc0d1/HwBM/r2MHSs2rkH/Zb2i273cvS6Z7tF7xm
         1gCNS2wjI+Phwqd4wNML7+/fYe0mA+UVwH0lgkXKwhmOel+wuLHRuVd2KDYuSCnb3EEu
         I8XF2uDvwkvEs99XWLvkuaESeg8YV++W0BCdWHCtzhrF3Hy/v483EZKov7oqA6gjYIHw
         x/gm0FF0s59RPhH1+LuezMz0EfpuiqiCr8nshsQ0iLyKGTY233eA1U/SXKnQiny52qbZ
         Y2W1byCR4+ptinRIhQy6+YUOwrgAouFJ6vxiZSF9gPFl3jbV/LInMFCiutu/kQng42Fw
         Rx2g==
X-Forwarded-Encrypted: i=1; AJvYcCX9/ylDRujIU6EicHCwfPMrKN7Vga8CdmqMbM5RL8VV5BD0lvMts5D7JmhIzSkCaRo4PWeYBb0QvxXo2BPi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm2w6LuE1jgtErDyUpVh209e6Q+ZEm1TiAZl/OMEdruRZgbafN
	1ER7k7z3TyMlu1xuvTtQ30wBZCyiibQDftY1holUR7aH4YxXrK/vuov0KqxF1R63VTgWUSd/y3N
	f85Cjk+HEIUjxRk8bduSr6nWv4MjYiHN3NkkZug==
X-Gm-Gg: ASbGncuvPyJb11ZkgAZlwtKu8x7cI0g7ectts5dUIFiHC+Qhg5H5IbknGLhTTNOUUg3
	pEnD80BgxG8wVERZYjOtyTtimzHEsgKXIAqhfziEXr+DEJ4ON98BcwkFam7I0ijY9nEXgJbKU5K
	5Evml5G6Q70kb/hrzfnw==
X-Google-Smtp-Source: AGHT+IHZaLOKkERtiYS5shkEjMAlT4iStOAU7WeU2T2q/yIKvnOtjzJiNS+UNV5Jv1kfmhHEVL9ETxrqPamzGSdb3SU=
X-Received: by 2002:a05:6902:1b81:b0:e57:414b:577e with SMTP id
 3f1490d57ef6-e57b1051956mr31803374276.12.1737992798737; Mon, 27 Jan 2025
 07:46:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120151000.13870-1-johan+linaro@kernel.org>
In-Reply-To: <20250120151000.13870-1-johan+linaro@kernel.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 27 Jan 2025 16:46:27 +0100
X-Gm-Features: AWEUYZlPxQezcPWC_RlZRyj-Wpd76XVtWwXGlnlr4q8ReulBHMnbsaHMT-5UGVU
Message-ID: <CACMJSesr42T=qr8GoUwxGB51mnr04TB6j4_hztGAFXx008ZJLw@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: uefisecapp: fix efivars registration race
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jan 2025 at 16:10, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Since the conversion to using the TZ allocator, the efivars service is
> registered before the memory pool has been allocated, something which
> can lead to a NULL-pointer dereference in case of a racing EFI variable
> access.
>
> Make sure that all resources have been set up before registering the
> efivars.
>
> Fixes: 6612103ec35a ("firmware: qcom: qseecom: convert to using the TZ allocator")
> Cc: stable@vger.kernel.org      # 6.11
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

> ---
>
> Note that commit 40289e35ca52 ("firmware: qcom: scm: enable the TZ mem
> allocator") looks equally broken as it allocates the tzmem pool only
> after qcom_scm_is_available() returns true and other driver can start
> making SCM calls.
>
> That one appears to be a bit harder to fix as qcom_tzmem_enable()
> currently depends on SCM being available, but someone should definitely
> look into untangling that mess.
>
> Johan

Yeah, I have it on my TODO list. I'll get to it.

Bartosz

