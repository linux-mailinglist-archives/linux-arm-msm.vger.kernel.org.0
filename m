Return-Path: <linux-arm-msm+bounces-54009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 585E0A85C5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 13:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82F24189B4AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BE6298CB0;
	Fri, 11 Apr 2025 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQ9rPBm6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EA31DE3C7;
	Fri, 11 Apr 2025 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372716; cv=none; b=FqpnaIJa7qLYFxAY4CyBkkd0LQYVlZ1MGtXfBi5pvwbQhln6fkrXWQY9EB+s6wbuRdvv63By8u4ncaW2ehoSxugAMwMy5jfXIDdpUHOLcmdV20LKHWLTuCozrY0loM0v5mX5TqzyToJp75SVVQdhVzgmiMoD89csMWYTtkcyk58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372716; c=relaxed/simple;
	bh=1SoWvdTHhDsps5p1Ia5cr7bCYvRyvBzxp3ueudtHSQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONLmaBcp5KVU25t/vokl8ZxrWYZ3e6cuWQg+WQEv/KPeX038RMyVzpRrEF+KK8Rmj0ExpzYo9ndhlSY6kPu3ddf8QsxoV5IEOBGGgdSOU+tDW2a/W1QwXWcsDRyU5biQ9xYeTPpDvdvEMzePlf/3twsbm/QhGk1MU8HZxFC2Hn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQ9rPBm6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFBBC4CEE7;
	Fri, 11 Apr 2025 11:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744372715;
	bh=1SoWvdTHhDsps5p1Ia5cr7bCYvRyvBzxp3ueudtHSQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQ9rPBm6MatRuA9DkJmuGNqY9cqC7cTngLeLeYIlVM6CukN4EJFDvcl6MFIB7uvUF
	 yMZwPISFSDAH+Qh6uk1q/tgPkNqF+laRlM5cNIjeTlCIJODf9MaGC3iZOZrw3oUJMX
	 1ZfGHKP8w+gmUt0fQXBHJFbmZlt39Qq/X7hRtRkMeqYyrp2lIHUpCMInGrDrIQQ/l+
	 rKxNJB1GH9G07G7QagNuccQ4ynaYy2htA3POnq+8SUd+Si6eanb+2QNMlbDojqFycA
	 4X56Znfxhk8SHhVlLoTCLFctam8bKNxezzGCK3dKZ+t68D0tMtG3x3MJmy59wC53kv
	 O5jk62PuHXR6g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u3D1s-00000000103-02SD;
	Fri, 11 Apr 2025 13:58:40 +0200
Date: Fri, 11 Apr 2025 13:58:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e001de-devkit: Fix pin config
 for USB0 retimer vregs
Message-ID: <Z_kD8DJCPCJSu9-F@hovoldconsulting.com>
References: <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-0-1c092f630b0c@linaro.org>
 <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-2-1c092f630b0c@linaro.org>
 <abcf5f26-930a-4ce8-89ff-fc5405fe7b19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abcf5f26-930a-4ce8-89ff-fc5405fe7b19@oss.qualcomm.com>

On Sat, Apr 05, 2025 at 01:08:46AM +0200, Konrad Dybcio wrote:
> On 3/18/25 4:50 PM, Abel Vesa wrote:
> > Describe the missing power source, bias and direction for each of the USB0
> > retimer gpio-controlled voltage regulators related pin configuration.
> > 
> > Fixes: 019e1ee32fec ("arm64: dts: qcom: x1e001de-devkit: Enable external DP support")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> > index 902335396c586a991c4a2de19906b039d887780f..8e88e00c335a05d0d36b4b08b85df82f38ef4355 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> > @@ -1039,6 +1039,10 @@ rtmr0_default: rtmr0-reset-n-active-state {
> >  	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
> >  		pins = "gpio11";
> >  		function = "normal";
> > +		power-source = <1>; /* 1.8V */
> 
> Not sure if I'm a fan of these comments but sure

How come? 

Due to the incomplete bindings for these PMICs this is currently the
only way we have to document this information. And AFAIU the voltage
mapping can even differ from pin to pin on the same device.

I would prefer to see a space before the SI unit though.

Johan

