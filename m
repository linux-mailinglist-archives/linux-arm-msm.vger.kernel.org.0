Return-Path: <linux-arm-msm+bounces-33883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCAD99895C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B4C62836CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8DD1CDA3B;
	Thu, 10 Oct 2024 14:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7QhSmgM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125DA1CB526;
	Thu, 10 Oct 2024 14:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569796; cv=none; b=nZ3MoL5WaySBuwJhI6piiFj3er/uOuzKEzNjPAujrkzMh+tl/3aewys+FouhZvisiGLlCv4kod7kau+Wc5ERtwsrJf4FTdsm3q5IW2EcciTHCaZw4Hg7ZD9cxA60ElPJ4dn4ScDBvLdpSCx07Fgy2/lbbY9vfWID5fR9wqdSFao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569796; c=relaxed/simple;
	bh=I8AFVuiClI8/t9SVb6J76HX+OuuiQwV9zIjeKm3tiUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSsCf7AMU4o85iggpC3qRXteGj8HvqhKEKdyE9KvCeJo5GM69MxcA/RnDT9Jzx0ssjrItrgsPV5kDBtQa6OjFQMVsU93fJ3xIVCDVE5knE6xJGPZziNzSGRNTuE3a2lR/QlnX41yG18UFxx+FzyXH+G6gFTULqNdJK3CNJCYvfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7QhSmgM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14FEC4CEC5;
	Thu, 10 Oct 2024 14:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728569795;
	bh=I8AFVuiClI8/t9SVb6J76HX+OuuiQwV9zIjeKm3tiUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q7QhSmgMLCCwHIZhPVM8mGRcR0W68jOB9kDwscOBGpVR/BHzSDYpleR+X/jwTfYnw
	 SSzAElXuFexe0O+gNuEq36XZMA1y6vnPipEfpkWWGrVLROb4GMccz3bFqFyyIEbms3
	 wudW1S/mwRiV6RLCvg7oeUeg0hftuXjt5erV+bXc2pmha9Kya7rgcarUnHz7O3GVuk
	 5nklqaQF4KuCcngJzND87f35+b+PvzwFOO0ZG+GB3LhtZoRHYqWRt/7R7Ub8Ee48i3
	 NkdDrJRCbWpEibd7TNWDBzDwHvuvRSQzZ43nmFLyDIyEIKZdBZmVgPTSuqKcoP1U6N
	 A9FaFuoLBYcig==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1syty3-000000005fb-44Dj;
	Thu, 10 Oct 2024 16:16:40 +0200
Date: Thu, 10 Oct 2024 16:16:39 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: enable GICv3 ITS for PCIe
Message-ID: <Zwfhx9RSzMXKUwGJ@hovoldconsulting.com>
References: <20241009161715.14994-1-johan+linaro@kernel.org>
 <xwscnif4mqzykjinjtbr7jqsksy2buzindyttkk754jmumktm3@p5xxnmia7fxe>
 <Zwfei-Jn6goiya4H@hovoldconsulting.com>
 <CAA8EJpq1U7=An1V=DRqd2tAr527est1UFKc59CE8wRL1tdN_Ug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpq1U7=An1V=DRqd2tAr527est1UFKc59CE8wRL1tdN_Ug@mail.gmail.com>

On Thu, Oct 10, 2024 at 05:11:43PM +0300, Dmitry Baryshkov wrote:
> On Thu, 10 Oct 2024 at 17:02, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Thu, Oct 10, 2024 at 04:54:19PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, Oct 09, 2024 at 06:17:15PM GMT, Johan Hovold wrote:
> > > > The DWC PCIe controller can be used with its internal MSI controller or
> > > > with an external one such as the GICv3 Interrupt Translation Service
> > > > (ITS).
> > > >
> > > > Add the msi-map properties needed to use the GIC ITS. This will also
> > > > make Linux switch to the ITS implementation, which allows for assigning
> > > > affinity to individual MSIs. This specifically allows NVMe and Wi-Fi
> > > > interrupts to be processed on all cores (and not just on CPU0).
> > > >
> > > > Note that using the GIC ITS on x1e80100 will cause Advanced Error
> > > > Reporting (AER) interrupts to be received on errors unlike when using
> > > > the internal MSI controller. Consequently, notifications about
> > > > (correctable) errors may now be logged for errors that previously went
> > > > unnoticed.
> > > >
> > > > Also note that PCIe5 (and PCIe3) can currently only be used with the
> > > > internal MSI controller due to a platform (firmware) limitation.
> > > >
> > > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > > ---
> > > >
> > > > The PCIe Gen4 stability fixes [1] are now in 6.12-rc1 so that we can enable
> > > > the GIC ITS without being flooded with link error notifications [2].
> > >
> > > Cc: <stable+noautosel@kernel.org> # Depends on driver stability fixes
> >
> > This patch is enabling a new feature, it is not a fix, so Bjorn please
> > do not include the above tag when applying.
> 
> This is for stopping autosel from picking up the patch, not for
> picking it up. After just helping to revert random patches being
> picked by autosel I start to like this header.

I know what it is, but you should not be adding them to my patches.

Johan

