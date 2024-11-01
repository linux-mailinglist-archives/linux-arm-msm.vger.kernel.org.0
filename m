Return-Path: <linux-arm-msm+bounces-36684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 587E59B8C17
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 08:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2384281027
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 07:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD48B15350B;
	Fri,  1 Nov 2024 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uisELr77"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F31B1487E9;
	Fri,  1 Nov 2024 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730446399; cv=none; b=NJNHfyP+1wYLIurxi6MthjjZz19Q8NjFDWDxX5C+EVqW3emW8Wwvmx/237He0AhBOvwoP36gG4AZ4pI0zX4LK2Z84eCJTEzIuBKp7PKpveodd6f1uO+7KJYiM4fyp8iha7RWoFntawBb9AmiwYs8rT7Tqw3Ry7A2yvavGWmcsr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730446399; c=relaxed/simple;
	bh=e9glrc6SaRwHLHaCNpSx4pjh0oiDrjYb+RYgA1/MxcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ap21aUPhyDQ9fS5QgATERYc9DroHhVtQXTqF2+MrvGnfGoNUqCYTGzsGJooeTXVHnbhh4qfmYZKxlAaqF2lQ7UDAEL1ysrTX6sXyrwDL2Jx4mIIF6hPJ+B3U4H3zZ26MHW/ZUbtYAA/qaW73ric5TQqKb/D5SFu7s/eVF1BFzdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uisELr77; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF26FC4CECF;
	Fri,  1 Nov 2024 07:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730446399;
	bh=e9glrc6SaRwHLHaCNpSx4pjh0oiDrjYb+RYgA1/MxcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uisELr77odMpiiOsSXZjras7SeqsSMugTtBqmL/hoA/bzlSnyD3rbYMcvxHQ5Pgk5
	 0EYxcewmhvDBn5AvGNKyl43TECf0Ex1b0/LNKOncf/FKke+WKIMBBvy6iR4jH3NZn4
	 d+Bb/xthM4KiFWAN6onlhgEn3BX0NUXKtJMPM/01K5WqAy66RBjnKdRuDJZFrg7G6H
	 SvyuIBnUuaTHJobN1nVNqIymDPc5f97mM5/fBCT/3lHurWIPSrtqh8wxVfE7WjEorI
	 xmnkfFUQOmfWHCQk7Qrs8TG2iApY5L/msKQI0gZNQMOUOjIm1dxsN+ewZj6dOLXbRy
	 05x4MlIzV02cg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t6m9l-000000004sp-1APM;
	Fri, 01 Nov 2024 08:33:17 +0100
Date: Fri, 1 Nov 2024 08:33:17 +0100
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: x1e80100-crd: describe HID supplies
Message-ID: <ZySEPXOxgZj-s75F@hovoldconsulting.com>
References: <20241029075258.19642-1-johan+linaro@kernel.org>
 <304b909d-bf2d-446c-acc9-e65b94627468@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <304b909d-bf2d-446c-acc9-e65b94627468@oss.qualcomm.com>

On Thu, Oct 31, 2024 at 10:00:20PM +0100, Konrad Dybcio wrote:
> On 29.10.2024 8:52 AM, Johan Hovold wrote:
 
> > +	vreg_misc_3p3: regulator-misc-3p3 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_MISC_3P3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&pm8550ve_8_gpios 6 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&misc_3p3_reg_en>;
> 
> property-n
> property-names
> 
> for consistency, please

Sure, will switch these to match the new style that this driver mostly
follows (but as we've discussed before, the traditional style that most
dt still use for pinctrl is what I used above).

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for reviewing.

Johan

