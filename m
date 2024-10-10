Return-Path: <linux-arm-msm+bounces-33879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3ED9988A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1F4B286338
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073741CB53D;
	Thu, 10 Oct 2024 14:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyCLCPQF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2FC1C9EB4;
	Thu, 10 Oct 2024 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568967; cv=none; b=OI9F+dQGJxmQJJ+b9ZFwKsi/9glmhz/YUT2HlaYS7pnV4m9x/hi211RodiqXUbyVVbOPiVfAiB1kjvf2wg/7qvsyr0gQrx5lCk/pJY9q9wha7RR+2Iu3r8sI7lHmz4sPNEY96ZBLTGCqbarlu3c3UULv0JkBaD8gZXrPtziOS8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568967; c=relaxed/simple;
	bh=nS8LibFP7Uli0nM5nRHClR7oAA1za5RJPPtfXxGKNIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiykE2MlSs83eb+dW4iCGTUng7Q2GSSla8J0odVA0r37wN/tHwmOyWWv21SAjM1Nsm4Y5YIGsHoXDX2JljyjsGwDY7f7DGWujuIrpyajAsn0Bg11LbaWYZr22XmbnGF1gWKH0G/VpZxxnAtuF30Qs3Lqh0+36IGf9Q41pIfDiC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyCLCPQF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CB0C4CEC5;
	Thu, 10 Oct 2024 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728568966;
	bh=nS8LibFP7Uli0nM5nRHClR7oAA1za5RJPPtfXxGKNIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MyCLCPQFAFlAiWOS7trGzk0UzeG3YI+swbEmRrvEDad7VftBx5duSlzfY4+dEJbys
	 +dq2tKvvOYJppgxQSMoo4PYs7kvOQpCz/Rcfow918vppbKySYYELc47k3Z0/U4Kp0g
	 v/6BhoXVnchbDLdycv89jMiUN6PK6vo8hO4ZL3pd+DbeGWeZGVkgPbvDPVyw14ov1i
	 PPTE+z04jtrOrVLimy1dYHVMwnzfCYay1XdEYDTQc6ORqbK0WWf9T0RAM9NKGiFXux
	 XEG2hoDnO9fDEjgC1c2otmofLK19h8loetz5O4yZ6LtTC9yQswPqu+ouhbLxMUZQ5E
	 leMII6DEFfNDA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sytkh-000000005Pr-1g8e;
	Thu, 10 Oct 2024 16:02:51 +0200
Date: Thu, 10 Oct 2024 16:02:51 +0200
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
Message-ID: <Zwfei-Jn6goiya4H@hovoldconsulting.com>
References: <20241009161715.14994-1-johan+linaro@kernel.org>
 <xwscnif4mqzykjinjtbr7jqsksy2buzindyttkk754jmumktm3@p5xxnmia7fxe>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xwscnif4mqzykjinjtbr7jqsksy2buzindyttkk754jmumktm3@p5xxnmia7fxe>

On Thu, Oct 10, 2024 at 04:54:19PM +0300, Dmitry Baryshkov wrote:
> On Wed, Oct 09, 2024 at 06:17:15PM GMT, Johan Hovold wrote:
> > The DWC PCIe controller can be used with its internal MSI controller or
> > with an external one such as the GICv3 Interrupt Translation Service
> > (ITS).
> > 
> > Add the msi-map properties needed to use the GIC ITS. This will also
> > make Linux switch to the ITS implementation, which allows for assigning
> > affinity to individual MSIs. This specifically allows NVMe and Wi-Fi
> > interrupts to be processed on all cores (and not just on CPU0).
> > 
> > Note that using the GIC ITS on x1e80100 will cause Advanced Error
> > Reporting (AER) interrupts to be received on errors unlike when using
> > the internal MSI controller. Consequently, notifications about
> > (correctable) errors may now be logged for errors that previously went
> > unnoticed.
> > 
> > Also note that PCIe5 (and PCIe3) can currently only be used with the
> > internal MSI controller due to a platform (firmware) limitation.
> > 
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> > 
> > The PCIe Gen4 stability fixes [1] are now in 6.12-rc1 so that we can enable
> > the GIC ITS without being flooded with link error notifications [2].
> 
> Cc: <stable+noautosel@kernel.org> # Depends on driver stability fixes

This patch is enabling a new feature, it is not a fix, so Bjorn please
do not include the above tag when applying.

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

But thanks for reviewing.

Johan

