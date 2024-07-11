Return-Path: <linux-arm-msm+bounces-25921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A5D92E1F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A3C61C2093D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 08:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386951514EF;
	Thu, 11 Jul 2024 08:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gFCuKmKb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994F81514F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686008; cv=none; b=Mtwf0chbi+nTYMjo9svOrMHKBfvdn3ybdZ7gZ8suLqW/kAu9jSTbV8El0Sp3lWVH1lGyIf2e8fBGRXYAUDJrWdYZBvNiEKHpD71I9hzUlnTlCoEVVnUNg3CvuQK9LlTr1kxRKhRezXXG+qaAl8CcgZTRN3txLL0YlXjTHs+QTCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686008; c=relaxed/simple;
	bh=zUXuuTdZC1gW6ONubxV+eGQkbjsKypgRFVdFLS0VZRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiAgpd/39aMQZ6/66CiHDPBoU4gvaciMPo2a4MEskt2y4kRgL8HZDYUzxgu6E6huNW7mvgnZ0XGRgTbXqMepMUhpzs+bY5kXwhnpWQer9FXVz0pfDbZm/yaWwT2BX2i0dAub4UZYZcfshW1mQMOh845Avoc//HDqcZoH2/52MpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gFCuKmKb; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6561850a7bcso5836887b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720686005; x=1721290805; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yCOXCel+OkgFY3x3XxhTpu9K68s0AxsfBCkZfuzSswU=;
        b=gFCuKmKbJ0Y+tzsp6D7knrd7jxrUSwmh9Fc7aqc5S+Y/IjI0wfny0Hai5Ns3teRqaT
         kOvCLHiAQL0/oIt51/ODE0Zz4R0FDuK7rxRLK5rHNayE+azKhM6XUk0FGWNp+P0G0MjV
         MvcAE+T1i12ND5CqG1urUanIoJvAG38k+s0plmgmqKN8Swct9NM3TLLYTh63qu8XsqEG
         78OglYp5SLEB3IpY4pwVaBVbxrBXC2TJ85RSN5q40twCQYKCGp1UhALHZyimQPJPima4
         m8/w5Z/4ISud+/GO9e5FEBgQCJoWmkOHznb2LmTDMm9Ssenkz7GigJ+ch8T5MufLGSQK
         CS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686005; x=1721290805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCOXCel+OkgFY3x3XxhTpu9K68s0AxsfBCkZfuzSswU=;
        b=ZySFxG9vcfiVckt1CLjwtkLDUz+x9SQ6dh+e/NSOy7XmEyWe911hNRq3FhhEwtknUZ
         WnxwpiDYcYaN57EQVJTbhkMYYnPKg2Z00bwRdFOX6nHVXkZ381CQlfobTme8P4ndGvnX
         8tiS9HZHhVYrezT9e51leMyNlsfxGe4fMIubzdGlBBmFG17VJpw7F8j4umC16OuoCEHm
         KoiqU/v3IxFrGcz+dw9EHKO7qvGSJfMmAb6GCE6sN+VYGK3OKQxs8vY4ViH0ZxkSmj9a
         W1N9nsunUwecS9NWv3dwzZc8YoKRU7Mj5AAhqGLCiHMoJ05VoZnOGxhpGQSZpCVIt1UW
         VrGw==
X-Forwarded-Encrypted: i=1; AJvYcCX8BWgDhWKlG3UeNaT5uKKpOj23QJpOG/C2KxfW12d68RL1P+X50dnLzfhV3LDLBls2gE48yYPJIwZMYR0WCge5oMOwBrEeCih0VoQk0A==
X-Gm-Message-State: AOJu0YwrHsA3a1NKG7DZcGHZx68M8cWc4IZbXHGHJYhP9rMHHMlOC6Nu
	qvNPozsMx9doNlcUS7smaFMjZ7v//h6beBrSOjzcheDpzWQX/UQdeppJNLLgPnf9N5fM6ID66ZY
	2E5wkNMGdHVt7Ph2FiE22y5NyD6g5mLj+6DAIRw==
X-Google-Smtp-Source: AGHT+IHES1E6Jos117gUDZhq9HN4sMFmUNFMxL9n1Xf9pBOpCOipbf6kJgCp8kRnNRqsB2zfpRqhPvb9GEPeIaC9oZk=
X-Received: by 2002:a81:b50f:0:b0:632:58ba:cbae with SMTP id
 00721157ae682-658f0fb34d3mr73868857b3.52.1720686005368; Thu, 11 Jul 2024
 01:20:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
 <20240628-gpucc-no-request-v1-1-b680c2f90817@linaro.org> <5153b8f8a6c6ffdc1254e00c47a888ed.sboyd@kernel.org>
 <CAA8EJpqOD-JKGCJiC7yAkiG3oAOEbHQ-_aCmDiP5HdeEVZm8fw@mail.gmail.com> <9cb3f57ed4b41fb51600610a3a1c9437.sboyd@kernel.org>
In-Reply-To: <9cb3f57ed4b41fb51600610a3a1c9437.sboyd@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jul 2024 11:19:54 +0300
Message-ID: <CAA8EJpq+Mgbrh_M+WN7VT90hC=5TPAC1dkgC5PzSeO22WOyGUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qocm: add qcom_cc_map_norequest
To: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jul 2024 at 03:04, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2024-07-10 16:32:18)
> > On Tue, 9 Jul 2024 at 01:30, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Dmitry Baryshkov (2024-06-27 22:20:22)
> > > > The GPU clock controllers use memory region that is a part of the GMU's
> > > > memory region. Add qcom_cc_map_norequest() to be used by GPUCC, so that
> > > > GPU driver can use devm_ioremap_resource for GMU resources.
> > >
> > > Why does GMU map the gpu clk controller? Does it use those registers? We
> > > don't want to allow two different drivers to map the same region because
> > > then they don't coordinate and write over things.
> >
> > It's not that GMU maps gpu CC separately. It looks more like gpucc is
> > a part of the GMU address space. I think GMU manages some of the
> > clocks or GDSCs directly.
> >
>
> I imagine GMU is a collection of stuff, so the register range is large
> because it's basically a subsystem unto itself. Can the range in DT be
> split up, or changed so that different devices within GMU are split out?

No, we have to remain compatible with existing DT. It's not a problem
of a single new platform, the issue has always been present there.

> Or maybe the gpu clk controller can be made into a child of some GMU
> node, where the GMU node has a driver that populates devices that match
> drivers in different subsystems.

Well... Technically yes, but this brings another pack of issues. There
is no separate GMU driver, so we will likely have a chicken-and-egg
problem, as probing of the GPU driver will also create the gpucc
device which is further used by the GPU.

-- 
With best wishes
Dmitry

