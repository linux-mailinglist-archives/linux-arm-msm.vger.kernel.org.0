Return-Path: <linux-arm-msm+bounces-26714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAEE938A35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 209B11C21083
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A325476B;
	Mon, 22 Jul 2024 07:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Op0eXhze"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272F5125C0;
	Mon, 22 Jul 2024 07:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721633902; cv=none; b=OCv6IX5Y93c11J+yvZVYPmHryKmea2Z1hOAgRzGngFdNJf0ZlhgODyK0vkJQbx3W3mKroZhsF+pxSWkwPk/ocRnzBr5eWPuN/rSyUVjY0oisZxZth+DQ7MMYnyu2vhb8TAY6rxvi2QCIHx8UD3mlPfQuse7RaAbaVMsK7AFNj+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721633902; c=relaxed/simple;
	bh=dJX8kFYt2iDgEt6E90DzHlaKoM6V3queSAA3G+YUGDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9MoG8e7SSYprjaTTQ12df/Bwhx3HU4qYYxcl6PhFqiLr6/upJMwjkxW8b+zuU7fmAg8USKZ9ciAC0EJWMxl3zN8kRpfTMAK7zvgl39VhTTGuvI/EaXqcKRfpQIR+/GiwRnu765OB6gxeLjfnE4+sZw5o2kcLbvnPMgelRIzKTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Op0eXhze; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6331C116B1;
	Mon, 22 Jul 2024 07:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721633901;
	bh=dJX8kFYt2iDgEt6E90DzHlaKoM6V3queSAA3G+YUGDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Op0eXhzeiVrMzLsxYsawRoEjxp+ph5ZJqW6EMV/S0Om0O8L1UKpB0PT4goEaIcYVd
	 wj30mN/oU5doawkNFREk1kb9+TtCnwcJV94DFMtMy2lcrSployjN/59RKQMwly9PVW
	 1bmWEPhDAoyoHjrVQXEv1ctOIDzzfyJyoHEyzHrZmslsISLvFjU5ybOvhgM9nYkGRq
	 X091g5FJDguWgFcQnW35pzCYvUGYmaZcNDZTzBHvPFh5UkXSktK+Xytb/bieVcPXhS
	 nWQrYWWAOv3D2PGcQUXOOXJ3J5vdRRMChgY7Qyc3aTo6UuO795FgfjfvojHFCFpqny
	 dohnHn5Y3bXPw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sVnci-000000001fY-1Xxg;
	Mon, 22 Jul 2024 09:38:20 +0200
Date: Mon, 22 Jul 2024 09:38:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: x1e80100-crd: fix missing PCIe4
 gpios
Message-ID: <Zp4MbO9NeeOtXGY6@hovoldconsulting.com>
References: <20240719131722.8343-1-johan+linaro@kernel.org>
 <20240719131722.8343-6-johan+linaro@kernel.org>
 <0e3e6925-f7ee-47ff-b555-6f35a5766d56@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e3e6925-f7ee-47ff-b555-6f35a5766d56@linaro.org>

On Fri, Jul 19, 2024 at 08:36:33PM +0200, Konrad Dybcio wrote:
> On 19.07.2024 3:17 PM, Johan Hovold wrote:
> > Add the missing PCIe4 perst, wake and clkreq GPIOs.
> > 
> > Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
> > Cc: stable@vger.kernel.org	# 6.9
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 29 +++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > index 7406f1ad9c55..72d9feec907b 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > @@ -784,6 +784,12 @@ &mdss_dp3_phy {
> >  };
> >  
> >  &pcie4 {
> > +	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> > +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> > +
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pcie4_default>;
> 
> property-n
> property-names

This would make the x1e80100 pcie nodes inconsistent as this pattern is
already used for pcie6a as well as the vast majority of all our upstream
devicetrees (13k vs 3k) and bindings.

I know this is a pet peeve of yours, but perhaps it's better to just
accept this exception (naming multiple pinctrl-N properties is also
different from naming individual cells like in reg-names, if you need
more motivation).

Johan

