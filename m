Return-Path: <linux-arm-msm+bounces-35906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 262709B0819
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53B9BB2AB94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0938A15821A;
	Fri, 25 Oct 2024 15:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nkb0FhM9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC6E21A4A3;
	Fri, 25 Oct 2024 15:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869711; cv=none; b=BxVCXwGdrQVpuhn/EOWrbIOhVjnKbGLSZDGknbHAkcq7ietb6o77XxcVbefe8gPW5YQ/k9DBBEmTVA1/scf7Rj8zH6SOgltKzS/n7w1L2xhoqqXyHkUrbSRNcvaFh9/zkLlKNGD0C1oaHVURpoGKw6KTuIHeKIBIlc3N/XIv0S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869711; c=relaxed/simple;
	bh=0yACls9x1cW3qS4LpBlJgDsxXBHxPzipGa/KyFtbPUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URDwd9/5EAIU8YTac5ZquWja7Cu/pTKlTnDEEvNf4YtNlh+tWjTetmOSHC07i8jgB/RxX2rI5VAA+xy+WCnxsSKI2Mw/H7qyTOHHCp8ft3Ft8b3M0/3VZD0nMx6gquxRuSX9hSEh+GBxE1bB4+nN4W1QasgNxIviVr+24pf0leE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nkb0FhM9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490A2C4CEC3;
	Fri, 25 Oct 2024 15:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729869711;
	bh=0yACls9x1cW3qS4LpBlJgDsxXBHxPzipGa/KyFtbPUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nkb0FhM9ySomNJORw64QxGkH24zMA/S9UQDibm/o1nUxE1kzAMw/GeBWDKI9KVU/8
	 3/rI+kqO+Hr3KwV3Qf5AQF1wvkSMlSu10uTWuaMR2/2DTb/0pUcOFQB92d0oHok0Hd
	 5fvghfvSN0mfXfAxG0U47w4aFazn9vrDXgliIZ/IgcE5KNYJ4cKaTYvnNe0Xn21caa
	 dpuLUiYL8aLPx29iMS9/tpnvfSjQQ7aENexYguJW/SwUiSO7vVwwn5IuaTDqxyt1vG
	 TD+2DrPoMl3STZW7Yya2PH3aSoAfzrnbBiWvmb48PYjTze13HMf6iGXhv+GRRiiUHc
	 3CJdroGI3rUXw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t4M8g-000000002Zv-0t2I;
	Fri, 25 Oct 2024 17:22:10 +0200
Date: Fri, 25 Oct 2024 17:22:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: x1e80100-crd: describe HID supplies
Message-ID: <Zxu3orjs9hR5KNc_@hovoldconsulting.com>
References: <20241015122427.15995-1-johan+linaro@kernel.org>
 <Zw6CzgluMauSdl2j@linaro.org>
 <ZxKYp1pGTp/FVGUg@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxKYp1pGTp/FVGUg@linaro.org>

On Fri, Oct 18, 2024 at 08:19:35PM +0300, Abel Vesa wrote:
> On 24-10-15 16:57:18, Stephan Gerhold wrote:
> > On Tue, Oct 15, 2024 at 02:24:27PM +0200, Johan Hovold wrote:

> > > +&pm8550ve_8_gpios {
> > > +	misc_3p3_reg_en: misc-3p3-reg-en-state {
> > > +		pins = "gpio6";
> > > +		function = "normal";
> > > +		bias-disable;
> > 
> > Can we add a "power-source" here? PMIC GPIOs can be either ~3.7V
> > (VPH_PWR) or 1.8V, depending on which power-source is selected. Without
> > that, we rely on the firmware to set the voltage level for the GPIO
> > during boot.
> 
> AFAIU, the power-source here should be 0, which selects VPH_PWR which is
> 3.3V. In that case I think we can avoid explicitly setting it.

The firmware uses 1.8 V here in fact, but it seems like 3.3 V would work
as well.

> > I'm not sure which one would be suitable here. I guess we can just
> > replicate what the firmware configures during boot.

Let's start with that at least.

Johan

