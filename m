Return-Path: <linux-arm-msm+bounces-71040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E93CFB38A70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 21:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB5617AB07C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 19:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DC22D97A1;
	Wed, 27 Aug 2025 19:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AVgWmAGt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFAB30CDA1
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 19:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756324150; cv=none; b=SftphTYrecRuQ5qKmJCIMpGVIvGxedI6weUzDRBNAQqRi6Oxn4U7lm5hQMhtfaGu8G+d+7pk8oGPTmP++9YqnmDSOiOOl/SznKLmUetdd0soJC0eKzzTgrfQ0K8CK0VnDt3dwgwyPvJ9NMfiuAn3kC+Y6O5lRl4ys4fIv3Tp89k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756324150; c=relaxed/simple;
	bh=Ljq8O8FsO0qS2A/K7Mf9pnciKOv4zVH+qUUHzWg7RD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hn+C3Ea+tAxtBzGTk6Opawy0fBvb35kQPn6jgimeU/dIbziApo3pMephBKFlG1HfQgbg+/nlNu8KUNuKkXNxV9WGW/t5gFOgnO0/xkClWj5VT07y8FJTP+/YJBV+hSVA5wgT3Pu0E6QcPl/ktln7cpFjC9u9/eaqStaVsI3cOAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AVgWmAGt; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f49b42180so249381e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 12:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756324147; x=1756928947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ljq8O8FsO0qS2A/K7Mf9pnciKOv4zVH+qUUHzWg7RD8=;
        b=AVgWmAGtVh0ENVvxi8ETICl0tBsrUiD0CWoVX88eRU12HHzl8Wrk5v4mth/A8ikS70
         crUAq04y9B7Kj7eVivy7Hd6qxo4FYzso6x5XAGgql59oWaq+SODRfeQCnRuOQCC/um+i
         kqokuvaQST4brvezlJLs6zkio+CLHadUPp7LOGwuKjBKQ8N3OK9McQ0TE9c+ugnmhcDV
         UAnfOmOYn/iIUP90yFkqrYnGcSEeNo4Z9byvah3KCwjfs2J/Waro8no8+ffxDDLcMaBD
         DGx6qM/u9iEeUCVZzdLQeQrUqJMiJ3sH+DFFCyPhhulOoLfdZyQoNtxdECr6XOja2q7y
         B2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756324147; x=1756928947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ljq8O8FsO0qS2A/K7Mf9pnciKOv4zVH+qUUHzWg7RD8=;
        b=knsVENMBC4NErW4Z3XDSn8n0YNGiLTmnc2jX3cepZV4TgAGbWRj63vLcdP+jXzIhLW
         Sr1JotBeuWyz7bwsCFfGjApZ2DlgfKPc0A/pKKWhKnV9oFSdYtmU3+K+36o73vaLhOVT
         IdVPKurIIf9g2pO/Mw0fn8oe44y1di0hxrgs7ZR3scGfHYOE/Kqk9rvmMEYIhPkWYEzI
         2WZ+vudITP/kYxgTKeTXzCPwvifFLGFlbghbmjmBDToa9Q5hqzdxja0rs46mEdWslRoZ
         U/HGuEm/HKT0pEir378dGnKi8nUah8te+8gSCKB52hgL+q50F++BMMqsRLKlyRwS5/Ao
         btDw==
X-Forwarded-Encrypted: i=1; AJvYcCUNnii/sXS/auN2rTGuSIxgdQCr9pKuW5YAkQoXte88UZFG0o1warVFqC5K9qwa/41yMf2st0J3NGPyGp6W@vger.kernel.org
X-Gm-Message-State: AOJu0YzH8J4E0VpuVigYZLl/aztzfOIRbKgPhUQRteLzIttUgb8X2lrz
	6G1edRqkf3/EPgMCaMi9F7vIKwrhoVg/G323/mSGF3F+7MLw8VhMtPqR3SGXebTCFhlFW/DTxCP
	Cg5YTORp0HPNB1LiCrzlop2XuElg0kV8CJj+yP0Qm9Ikf5zlYmenI
X-Gm-Gg: ASbGnctxHL7Ik3TEagqIgZdb+27zRW6Fi6KS/SlLqIWo8FWAl8BivIjGFn+jPla10mn
	deS/hS/dV8APACRqANtE0/NVPVHdxdwQ1sU7hK5yiSplmRhnONsM3FmE/tdBo5W9cgO7dBmIWUz
	R1wktfABbb/rl0tgqy6LKf/PERPPG20CEfJ0IyRELLwHPEXjLb/rzxRYUr6M8gNBCbTxfP3phdq
	wvA9e6BoszoWO7KenkPOp/3R3YbMkBL9GY7gkSJL7cbXZ5TpQ==
X-Google-Smtp-Source: AGHT+IGvU+l4X4mDjveiaWy08L4axwIngq15ZzA87m+6PTO6tYP2fp5QP6dKxsX2JZO43jAM8MyLXEMHGN9HUrnz3rA=
X-Received: by 2002:a05:6512:228d:b0:55f:43ff:9a3c with SMTP id
 2adb3069b0e04-55f43ff9c00mr3814510e87.57.1756324146596; Wed, 27 Aug 2025
 12:49:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819-pci-pwrctrl-perst-v1-0-4b74978d2007@oss.qualcomm.com>
 <20250819-pci-pwrctrl-perst-v1-5-4b74978d2007@oss.qualcomm.com>
 <CAMRc=MdyTOYyeMJa_HBgJVo=ZNxsgdTsw6rhOUmGtNYeSrXLCw@mail.gmail.com> <gcrf4q45gpcmnvdz55qoga6sc7mxrizzhnb4h6afwgk4cmamp4@mggbezcfivff>
In-Reply-To: <gcrf4q45gpcmnvdz55qoga6sc7mxrizzhnb4h6afwgk4cmamp4@mggbezcfivff>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Aug 2025 21:48:55 +0200
X-Gm-Features: Ac12FXyyHud2RjhKkgzGWoURpwyVzSpRKJqjDRfhrI8ZyvdB3H-HsqkJ7vi8iZ0
Message-ID: <CAMRc=Md+xmDg1LJ1Z-3r+5mga7sUZYN96BpJw5A3aJLDYeGZCQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] PCI: qcom: Parse PERST# from all PCIe bridge nodes
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Saravana Kannan <saravanak@google.com>, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 7:28=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Wed, Aug 27, 2025 at 06:34:38PM GMT, Bartosz Golaszewski wrote:
> > On Tue, Aug 19, 2025 at 9:15=E2=80=AFAM Manivannan Sadhasivam via B4 Re=
lay
> > <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
> >
> > Then maybe just use the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag for now and
> > don't bail-out - it will make it easier to spot it when converting to
> > the new solution?
> >
>
> But that gives the impression that shared PERST# is supported, but in rea=
lity it
> is not.
>

Ok, nevermind then, I'll write this down as a candidate for testing
once I have the shared-gpio driver functional. What platform could I
potentially test this one BTW?

Bart

