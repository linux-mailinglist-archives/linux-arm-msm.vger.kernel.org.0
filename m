Return-Path: <linux-arm-msm+bounces-25998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ACA92ED56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 19:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2456628A375
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 17:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E197016DC28;
	Thu, 11 Jul 2024 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YutO4poH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B666616D9C5;
	Thu, 11 Jul 2024 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720717164; cv=none; b=I7Aa60+8xpCAGyrhFzQhdVuLTGIK4U6gUD8AZNZCFtlOZvijb9qYI79J0URf40iRUzNQ/l0lU4FPckd0tSfY/yfK035oL3f8VjPx28atHRuwBZftoBPZU+ZsOV0WuCY0snQkenntNjlAQj4MbfjyyOqRhNof429C5SV6vuNOSPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720717164; c=relaxed/simple;
	bh=Z8VGan5F8QzSJ03qkchy06gXKvp+W67s71nEoYeZ9M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ut0iWTdifiekBQvBFWIKnYxtW/xGPeUo+v2X0e5bieqSE61tyjXNIq2DJFo+s7wErYAo8qqHn0kd9qc3jd5Ik09nNhpp5/j57WGkq8r6js2rSTDx7FdtuHEQ5CJJITmLYmAgdt66q2pdZ+LAGgzZdRT46Lzxetgt7iNsNyhjVm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YutO4poH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844D9C116B1;
	Thu, 11 Jul 2024 16:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720717164;
	bh=Z8VGan5F8QzSJ03qkchy06gXKvp+W67s71nEoYeZ9M4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YutO4poH5OebnHWJZBkw/SUknN7eI1qeO6iPc9Gmw58ywvIIwUTkoWfAmZ0ySW62L
	 s1eDnKyKkgDZL0X13FwMgvDmocGiPq9lCL3xWZnr+W7GOJv+00kcMVvXrUygfwmB9h
	 UQpWMm1wb7DDVOH5CEz65KvebDbyiA3Z5hR3EeZdHQ1eiP9aOhoPzhK65NHMCrEdvw
	 BysbBNZHQjw5i4BUowRrjSuO8shgvatgFPlpb2xeYBMHjpYI3oNdmBgY5dVSOEtvUI
	 IMdkZwblsgXtn8zrIiBM6WaoFMIz9EsT8YZD3ED28uXH188OnajJQT0TbPI8RXD2Nx
	 52SWJjj9nszSg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sRx8c-000000005Xb-1zFe;
	Thu, 11 Jul 2024 18:59:22 +0200
Date: Thu, 11 Jul 2024 18:59:22 +0200
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: enable GICv3 ITS for PCIe
Message-ID: <ZpAPaker8mulvKCj@hovoldconsulting.com>
References: <20240711090250.20827-1-johan+linaro@kernel.org>
 <f7e74a6f-0548-4caa-a8fc-8180c619c9aa@linaro.org>
 <Zo-ssBBDbHRLtAwG@hovoldconsulting.com>
 <Zo_zu-RmbZyKijVQ@hovoldconsulting.com>
 <20240711161947.GA4434@thinkpad>
 <20240711164153.GA4992@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711164153.GA4992@thinkpad>

On Thu, Jul 11, 2024 at 10:11:53PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Jul 11, 2024 at 09:49:52PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Jul 11, 2024 at 05:01:15PM +0200, Johan Hovold wrote:

> > > > Also note that the errors happen also without this patch applied, they
> > > > are just being reported now.

> > > Perhaps something is off because we're running the link at half width?
> > 
> > My hunch is the PHY settings. But Abel cross checked the PHY settings with
> > internal documentation and they seem to match. Also, Qcom submitted a series
> > that is supposed to fix stability issues with Gen4 [1]. With this series, Gen 4
> > x4 setup is working on SA8775P-RIDE board as reported by Qcom. But Abel
> > confirmed that it didn't help him with the link downgrade issue.
> > 
> > Perhaps you can give it a try and see if it makes any difference for
> > this issue?

If there are known issues with running at Gen4 speed without that
series, then it seems quite likely that doing so anyway could also cause
correctable errors.

Unfortunately, I get a hypervisor reset when I tried booting with that
series so there appears to be some implicit dependency on something
else (e.g. the 4l stuff).

> One thing I confirmed is, we definitely need different PHY sequence for using
> 2L. The current PHY settings are for 4L, so limiting the lane count from the
> controller is going to be problematic. And AER errors might be due to that as
> well.

Another good point. But we currently use the
"qcom,x1e80100-qmp-gen4x2-pcie-phy" settings. Shouldn't those be for x2,
and then Abel has another series that adds the x4 settings? Or are you
saying that the currently merged "gen4x2" settings are really for 4l?

Johan

