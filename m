Return-Path: <linux-arm-msm+bounces-44169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F01A045C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00ADC7A2D53
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD6D1F471C;
	Tue,  7 Jan 2025 16:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOQKuuaz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11701F4724;
	Tue,  7 Jan 2025 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736266598; cv=none; b=RsUjqEh/V2xYyetdb3CZkwkMg/Z2CGIthE4e+H9NvRq1cM5mJj7dNiepPE8SPiPSeJN3n7oMPzw5RCilxgFGvtW2qwBBKFdEzalC+77DtoIQzNjZ6sT4kzMrSMGr/bGGrNxyxodmIpkjH66iZ75hmGsVDqQ+UuAdnr1xZOB1MWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736266598; c=relaxed/simple;
	bh=hnwxDOzrUl0qOeN2menL0dpNIf7eY0/kvv2H+k7yFYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SK7fCfY3lLJKRHT90Abmnciuqjrw7BZMD1yStZXihsyBkWh9nVTwAm1/il1fVV6x7KS8BdC34PlIW5IOiwMDnVlZvmG9hgFFxvHIWmNeROXj7bO1+EOVPIhQTpc8axjjVUNVZsejH3cCstrwUKnZIIcwxDNhWaDeb7EuqFTHZRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOQKuuaz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875F1C4CED6;
	Tue,  7 Jan 2025 16:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736266597;
	bh=hnwxDOzrUl0qOeN2menL0dpNIf7eY0/kvv2H+k7yFYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOQKuuaz/Ar89xspZ9N2Xrqe+BiicIYhMnulG/mJKKKhDM2Tdcr2nSFv6nMRZhxES
	 JKcxajiUfQIHlpHNLSALE4QzJKl1Egd+PbE3kEues1ptiA18MmuxEnoO+BVzz7Jk3B
	 rMLnt1GiKrpAGSPSFCPzsmKmpjAmn1YIV3S6LcTUZLZrGAjVWTQKuMDjVhliDmrq2U
	 JAplJp1C0RfeYIHGoQqkxpNJVcr43jIwnQGuxLEIufNKSAsr9rf4VIPKFiH6Tj0aCL
	 Gdv0Yfkh/MfZng+PqFEER9cXZOlcz8gbUP+biGx1D2TmC+QjNtEUssEGdZL9hbRTsh
	 1VASOJf2n2zFg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tVCFw-000000000gM-0xwS;
	Tue, 07 Jan 2025 17:16:36 +0100
Date: Tue, 7 Jan 2025 17:16:36 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-t14s: Enable fingerprint
 reader
Message-ID: <Z31TZHRjIHiSw-gT@hovoldconsulting.com>
References: <20250107-x1e80100-t14-enable-fingerprint-sensor-v1-1-8fd911d39ad1@linaro.org>
 <Z308ZCrnsaLReaIX@linaro.org>
 <Z31F_sZahYrCSVlr@hovoldconsulting.com>
 <Z31PaEckuGQEZxyh@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z31PaEckuGQEZxyh@linaro.org>

On Tue, Jan 07, 2025 at 05:59:36PM +0200, Abel Vesa wrote:
> On 25-01-07 16:19:26, Johan Hovold wrote:

> > But I do indeed see something similar here on resume:
> > 
> > [ 1891.737726] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xe3f6ddbec0, fsynr=0x510000, cbfrsynra=0x14e0, cb=3
> > [ 1891.737738] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x14e0
> > [ 1891.737746] arm-smmu 15000000.iommu: FSYNR0 = 00510000 [S1CBNDX=81 PLVL=0]
> > [ 1891.804342] r8152 7-1:1.0 eth0: carrier on
> > [ 1902.039158] xhci-hcd xhci-hcd.1.auto: xHCI host not responding to stop endpoint command
> > [ 1902.039191] xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume dead
> > [ 1902.039795] xhci-hcd xhci-hcd.1.auto: HC died; cleaning up
> > [ 1902.040050] usb 1-1: PM: dpm_run_callback(): usb_dev_resume returns -5
> > [ 1902.040272] usb 1-1: PM: failed to resume async: error -5
> > [ 1902.581479] OOM killer enabled.
> > [ 1902.586673] Restarting tasks ...
> > [ 1902.587565] usb 1-1: USB disconnect, device number 2
> 
> Turns out it is the GDSC that has power status flags PWRSTS_OFF_ON when it
> should've had PWRSTS_RET_ON. Sent a fix here:
> 
> https://lore.kernel.org/all/20250107-x1e80100-clk-gcc-fix-usb2-gdsc-pwrsts-v1-1-e15d1a5e7d80@linaro.org/
> 
> With this patch, the above resume issue goes away entirely.

Indeed it does.

Johan

