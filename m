Return-Path: <linux-arm-msm+bounces-32828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A952898B256
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 04:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D313DB21EA1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 02:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6535836AF8;
	Tue,  1 Oct 2024 02:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkjhK2n1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F688FC08;
	Tue,  1 Oct 2024 02:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727750559; cv=none; b=lwzydUM4QXrAkouKLsK8fGd9HQm0tpnENXe+1FTzR4GYpUS9cSsHOsCCSCYwRyb56t0LuMB+MQHNyQijADiCKlr/cOxdYzEE+PPEP9LKj90p8KlKZbPTFV1zxCJEk3wYkiUjYKmTvxJVctwHVV8c1JX602FAeME0Ci5VyhKXr8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727750559; c=relaxed/simple;
	bh=QeC9iUN+plnSpmGLiy9MWdWoWnrN2AwwWvxZ4U0YhaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAXHbleTsmGpwB5XnIwriqp8d5tONtP07eVema0nqQapnVJfuEE0AEz0yGASP5axIA7hceLtLkhrgZ1nFHK0eYMlk8BokXktXTczRPQGKjRoGOwEYy8C7uVvsbeIVVB/Ev3bak2PddL0FpCMGHeV9sFBUE2shGgnHfDYseanly8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkjhK2n1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECCBC4CEC7;
	Tue,  1 Oct 2024 02:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727750558;
	bh=QeC9iUN+plnSpmGLiy9MWdWoWnrN2AwwWvxZ4U0YhaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkjhK2n1RbgIrMDTz4tug9KpRWu4ee21ALtG/MmNbR9PrUEJa5kKl0j9s+tXm9MDQ
	 t5QLgqRqGl5YG+XPQrvwJjRJ3rulzhLQz1PvKrunch4snik/apv1TwkeI3wF/YYOuc
	 G7SGg68s8G/HRduPNF5icYj4Lo+IBGZyrjK+u3C4MFNMGBIIVUz17ByFkdbv9WVrm6
	 /JNtuoUw7roElGzd6RO/pkENJWlo5jBkw4LwHlieHril/dcA6bV+lzLLHk/J/pisoi
	 +4EN0WZtA2emx0y4DKnFgNMdB9xi+KF5tq5zfeamwhetwgGo4uWZrvhc1WUHCmZY7t
	 Q362khe6pOiKg==
Date: Mon, 30 Sep 2024 21:42:35 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, konradybcio@kernel.org, 
	krzk+dt@kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, 
	abel.vesa@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for
 Windows
Message-ID: <eqy4yicgeqlgaytgzybnitvbrdr7jmjjk5k2swmadad6scwk77@ubaf7a2kgmdm>
References: <20240911073337.90577-1-quic_sibis@quicinc.com>
 <20240911073337.90577-3-quic_sibis@quicinc.com>
 <pt4wtycddqhcvw2iblaojmzsdggmlafft4vu6lg5j2vstbhbqj@acenyi5k3yeq>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pt4wtycddqhcvw2iblaojmzsdggmlafft4vu6lg5j2vstbhbqj@acenyi5k3yeq>

On Wed, Sep 11, 2024 at 10:55:05AM GMT, Dmitry Baryshkov wrote:
> On Wed, Sep 11, 2024 at 01:03:37PM GMT, Sibi Sankar wrote:
[..]
> > diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
[..]
> > +
> > +&pcie5 {
> > +	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> > +	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> > +
> > +	vddpe-3v3-supply = <&vreg_wwan>;
> 
> Please use pwrseq instead.
> 

What benefit is there to wrap a single 3.3V regulator in pwrseq driver?

> > +
> > +	pinctrl-0 = <&pcie5_default>;
> > +	pinctrl-names = "default";
> > +
> > +	status = "okay";
> > +};
> > +
> > +&pcie5_phy {
> > +	vdda-phy-supply = <&vreg_l3i_0p8>;
> > +	vdda-pll-supply = <&vreg_l3e_1p2>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&pcie6a {
> > +	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> > +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> > +
> > +	vddpe-3v3-supply = <&vreg_nvme>;
> 
> Please use pwrseq instead.
> 

Ditto

Regards,
Bjorn

