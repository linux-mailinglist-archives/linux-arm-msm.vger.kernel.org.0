Return-Path: <linux-arm-msm+bounces-44159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB90A04415
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20A551883373
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 15:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7F31F0E51;
	Tue,  7 Jan 2025 15:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bD06FyTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E201F86321;
	Tue,  7 Jan 2025 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736263168; cv=none; b=nhBWhvWm14znHdFG13a1eeMLc7/oX++mHbB8Wh25m8L/e2eRfQ6JVOq2BdshVjkMpogAznvj6+rVrowMkxqxaImOF6wsi8d2UlfF5gty27SMGxuF6043ugyWEk1wTHCotEw6kUvWS9OA18IDzsydhFuIy4BZCvID+wx7WeHa5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736263168; c=relaxed/simple;
	bh=Voi/m6pVXj7Nl+pADzsiMjmJS0WQikU2+O/Gvfr9pT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amajUM+0aKCqR/rE09dKYJFRzTFD0ph6ysgkUP8SxaqZM630ZLS4v0eawHH1UO80SjXof9eURjKLIvUa7csOHUy1XU8nevqFx6Sf4FAwB07pr+DkuO5U0XKajBYMNxnFNhf0PSxbacEkXM7/2jzNQGWpM1swTnKHfh5Pq1nSoLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bD06FyTa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE94C4CED6;
	Tue,  7 Jan 2025 15:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736263167;
	bh=Voi/m6pVXj7Nl+pADzsiMjmJS0WQikU2+O/Gvfr9pT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bD06FyTaD7UkAxKfOogWxO9ViRaT1wU51KpvKVchHARrhaWnm6IwMV0UwkZcdxT/+
	 /InZcDiO6RlfEJrmEfj39MViqOKKj87/HXe6fw/BHnTJaRmyv2COxyzNherqcZc6jr
	 8YY7CgDfDlh4hZwSBhIcSyJs7cAgfBMN0xeaB/oO4I/rakCAwW18Mh0kBVvYl5xYxf
	 T+0aWmi8PVSrOE8vcCfUqsMqQFBDyr57M0qjSUrmi29ibOPnm5zmGsiW0foPiCPfpg
	 c1Gy2Ky9LGXH6xz/pCMo9PfYmItBYS85fh+gZ2vPPuSfCYdXORKpt6ezPlagaorzJY
	 3ELWNxcWa2YhQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tVBMc-000000002O5-1PR3;
	Tue, 07 Jan 2025 16:19:26 +0100
Date: Tue, 7 Jan 2025 16:19:26 +0100
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
Message-ID: <Z31F_sZahYrCSVlr@hovoldconsulting.com>
References: <20250107-x1e80100-t14-enable-fingerprint-sensor-v1-1-8fd911d39ad1@linaro.org>
 <Z308ZCrnsaLReaIX@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z308ZCrnsaLReaIX@linaro.org>

On Tue, Jan 07, 2025 at 04:38:28PM +0200, Abel Vesa wrote:
> On 25-01-07 15:35:07, Abel Vesa wrote:
> > On Lenovo ThinkPad T14s, the fingerprint reader placed in the power
> > button is connected via the usb_2 controller. The controller has only
> > a USB 2.0 PHY which is then connected via a NXP PTN3222 eUSB2 repeater,
> > which in turn is connected to the Goodix fingerprint reader.
> > 
> > So enable all the usb_2 controller and PHY nodes, set dual-role mode to
> > host and describe the eUSB2 repeater in order to get the fingerprint
> > reader discovered.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> Turns out that on resume a couple of things are broken w.r.t. to the usb_2 controller:
> 
> [   41.104913] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xe2010600, fsynr=0x110001, cbfrsynra=0x14e0, cb
> [   41.104936] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x14e0
> [   41.104950] arm-smmu 15000000.iommu: FSYNR0 = 00110001 [S1CBNDX=17 PLVL=1]
> [   51.420689] xhci-hcd xhci-hcd.6.auto: xHCI host not responding to stop endpoint command
> [   51.420702] xhci-hcd xhci-hcd.6.auto: xHCI host controller not responding, assume dead
> [   51.420720] xhci-hcd xhci-hcd.6.auto: HC died; cleaning up
> [   51.420836] usb 5-1: PM: dpm_run_callback(): usb_dev_resume returns -22
> [   51.420864] usb 5-1: PM: failed to resume async: error -22
> 
> So do not apply this yet.
> 
> Sorry for not testing this properly before sending.

Heh, thanks for the heads up.

I was just about to reply with my:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

after comparing with the schematics and verifying that the fingerprint
reader enumerates.

But I do indeed see something similar here on resume:

[ 1891.737726] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xe3f6ddbec0, fsynr=0x510000, cbfrsynra=0x14e0, cb=3
[ 1891.737738] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x14e0
[ 1891.737746] arm-smmu 15000000.iommu: FSYNR0 = 00510000 [S1CBNDX=81 PLVL=0]
[ 1891.804342] r8152 7-1:1.0 eth0: carrier on
[ 1902.039158] xhci-hcd xhci-hcd.1.auto: xHCI host not responding to stop endpoint command
[ 1902.039191] xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume dead
[ 1902.039795] xhci-hcd xhci-hcd.1.auto: HC died; cleaning up
[ 1902.040050] usb 1-1: PM: dpm_run_callback(): usb_dev_resume returns -5
[ 1902.040272] usb 1-1: PM: failed to resume async: error -5
[ 1902.581479] OOM killer enabled.
[ 1902.586673] Restarting tasks ...
[ 1902.587565] usb 1-1: USB disconnect, device number 2

Johan

