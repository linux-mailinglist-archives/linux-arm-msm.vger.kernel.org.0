Return-Path: <linux-arm-msm+bounces-61652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7F7ADE122
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 04:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35F713BD48A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 02:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B57618B495;
	Wed, 18 Jun 2025 02:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLA2Tv3x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4561854;
	Wed, 18 Jun 2025 02:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750214014; cv=none; b=XKv3OLU8lg2gtjRXVx5qaq/TIAi26UwYHRaoSOha/uO5ntQMQweJSU6WqSt1qOjyQO3FdcyN/Wt4XVUsxsZ4lstVdZzg33tgUGdcbiEr9bh1vwz69WH15wNI0oNQCa88SS6tDnzf1x8qk0UtJJixjhukj0a5zsvqWfh19klK3jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750214014; c=relaxed/simple;
	bh=t+i4C9taSwbDZfwplbne/P71XM8K8RlhY+2k7AICaCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GN9DGmGuHaWHNPSxjAbFiHGrsSnMbUcg87mPzl6g1GeKyLcEJAweIKDeCGLvKTOBnrkGaNJ3dR9XS/YS0zAUzaxlDtEy9xEnVdvwPjAzAQpCnmYMxSBCT4dP1+G5kmdzCM1MHyWV9fBMqRSdVBY86/ixbla/Fobl18pgVAb86N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLA2Tv3x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCA0C4CEE3;
	Wed, 18 Jun 2025 02:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750214013;
	bh=t+i4C9taSwbDZfwplbne/P71XM8K8RlhY+2k7AICaCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLA2Tv3x4RMPWICy2wVHZWQWdTAPRvWHGbbau9fYwtcMKiJrqUkdkEm4mLEujmLW+
	 ImGll3SRAhLT3wb9cy1UADg7Souv/tHfYUCUFAYIR+cKy7U90FrBRnLulGtyxP6oEa
	 +BQF/5dDMyKyLJd27emcr3RvOlZJb1kJC4niCQeTzhKF8O1ejBYds+ZBqcvV7f1Mg6
	 mgmPAZG6zaoMjc25d8KKSrwMDY3Ubr9UTGs5K7EXiN/9WtP/q+E6jjU3yaT0ldbJqv
	 SCHa4C5OClQJkTpIbVAmXHe4gH26kBBOIJY7xVXysqJjmMBiI2Dw1kag28JZVWZSzT
	 HYEsiLUqdz3/A==
Date: Tue, 17 Jun 2025 21:33:31 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: add debug UART pins to reserved GPIO
 ranges on RB2
Message-ID: <iuqppo7k6qp7v4pm4xtllqkqdtnarlkr2ey7s3fp3g2jd5dynz@oanc7zlfod7m>
References: <20250616143341.51944-1-brgl@bgdev.pl>
 <713cd518-935f-4501-9753-d33c9ea6aef7@oss.qualcomm.com>
 <CAMRc=MceV-HgyFFvqytXAiuY+y10PQbdPBxuvd57NCeSLVLXCg@mail.gmail.com>
 <vyr6s4wzw5jc5gt7mywu4s4xob6aeca5aclbe5tdr4v3yng2tn@yb7rn2b2btb7>
 <CAMRc=MccuJe144NcwapPPRXtQOZbPW8qmybuEA2O9EtfKzs7oQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MccuJe144NcwapPPRXtQOZbPW8qmybuEA2O9EtfKzs7oQ@mail.gmail.com>

On Tue, Jun 17, 2025 at 01:28:41PM +0200, Bartosz Golaszewski wrote:
> On Tue, Jun 17, 2025 at 5:18 AM Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Mon, Jun 16, 2025 at 06:43:16PM +0200, Bartosz Golaszewski wrote:
> > > On Mon, Jun 16, 2025 at 6:20 PM Konrad Dybcio
> > > <konrad.dybcio@oss.qualcomm.com> wrote:
> > > >
> > > > On 6/16/25 4:33 PM, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > GPIO12 and GPIO13 are used for the debug UART and must not be available
> > > > > to drivers or user-space. Add them to the gpio-reserved-ranges.
> > > > >
> > > > > Fixes: 8d58a8c0d930c ("arm64: dts: qcom: Add base qrb4210-rb2 board dts")
> > > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > > ---
> > > >
> > > > That also makes them unavailable to the kernel though, no?
> > > >
> > >
> > > Yes. They could only be used by QUP - I2C or SPI #4 - on sm6115 but
> > > none of these are used on RB2. I just noticed that my console froze
> > > when I accidentally requested GPIO12 and figured that it makes sense
> > > to make them unavailable. Let me know if this should be dropped.
> > >
> >
> > I'm guessing that this would be a problem for any pin that is used for
> > some other function. Should we instead prevent userspace from being able
> > to request pins that are not in "gpio" pinmux state?
> >
> 
> That's supported by the "strict" flag in struct pinmux_ops. However
> the two pins in question are muxed to GPIOs as far as the msm pinctrl
> driver is concerned so it wouldn't help.

This doesn't sound correct, the pins needs to be muxed to the qup in
order for UART to work, so how can they show as "gpio" function?

> Turning on the strict flag at
> the global level of the pinctrl-msm driver would be risky though as it
> would affect so many platforms, I'm sure it would break things. So IMO
> it's either this change or let's drop it and leave it as is.
> 

I share your concern, but the benefit sounds desirable. I think
protecting the UART pins would set a precedence for filling that list
with all kinds of pins, for all platforms, so lets give this some more
thought, 

Thank you,
Bjorn

