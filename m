Return-Path: <linux-arm-msm+bounces-44484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4716A06945
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 00:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96168188909C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491DD2040BD;
	Wed,  8 Jan 2025 23:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3keCW3X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2090C202C4A;
	Wed,  8 Jan 2025 23:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736377671; cv=none; b=skGbWYJWkEB/wHmJyRRoIE9wUV+yAR7R2WK25nq3HyNgMWkeca1xC60bhAzOsAtgYsMbyINOgYDcbDjzGlfpem1TYqnB/7Wshgm8aYUNqJNXJz5RfzfG5DrL9+YX+egjIp/yzXHMfkIjuUP6aHGFnVJqAM7eehzg1Y53VLIHqJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736377671; c=relaxed/simple;
	bh=T7RR+2rSSB1VsDW24Y2aot8jNoQomcIY3SSN50UwTRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRvtGSlj9L9iw1gvjBO5ZHyYog2tIPV34RxBjRcGyuA1kk/gWv3x7Rc1gJUqRj9ecMFSOL2fJ9BMsy95llCMqbu6Z+iPHgNTlBAM4H6PX3OwCtAAS6ir4dJNLewR/XiV24g39/llritsInDomLXzgy+xoEy9QRlVT5P6cMK2RM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3keCW3X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DE9C4CED3;
	Wed,  8 Jan 2025 23:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736377670;
	bh=T7RR+2rSSB1VsDW24Y2aot8jNoQomcIY3SSN50UwTRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3keCW3XOkzGsIQXnReZqDWjBVCPv9ebvDWXew4sa2is4gWOcmKn1mzd0+K4VVNq4
	 UDtO8hCKyVa/7NpK4Q0IjjVQmdrSHxYRJd6/u4CYU7gXzfzF90suVmK5GxVpAzcOim
	 t4vVqhvNGS3nV+b6o7FVevvITBW65bLxVXSKOXT7GDB9q1rjgtTPfz7nneKMGzxh1D
	 IVLL9vSAGg99cEKPyXZDbMtLVHHYlN/xNe9z0BOgzerDmPFUqSVVJiz6YsRlRMQfrb
	 uN/rx2xP9IjSUGTd1QiPJirJ+zrzA7qvL/LVPljlqHQib4ARJLTTvTELiRO5rd7/n2
	 iI3IVhnjRMCOQ==
Date: Wed, 8 Jan 2025 17:07:47 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC
 supplies
Message-ID: <6vfrlwir6sfommhn3met6wnjm76lnnxw4rdwzq75b7lzcy4jep@2cbcfvb3tvr2>
References: <20241203-x1e80100-va-mic-bias-v1-0-0dfd4d9b492c@linaro.org>
 <20241203-x1e80100-va-mic-bias-v1-2-0dfd4d9b492c@linaro.org>
 <f65e1559-b409-4906-aabb-eb24b5b0fcf2@linaro.org>
 <Z1ATxAsXFhQraQwH@linaro.org>
 <afd010c9-8c24-482e-a479-2396f08c972b@oss.qualcomm.com>
 <Z1H1BHAeO-0832Ea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1H1BHAeO-0832Ea@linaro.org>

On Thu, Dec 05, 2024 at 07:46:28PM +0100, Stephan Gerhold wrote:
> On Thu, Dec 05, 2024 at 06:11:47PM +0100, Konrad Dybcio wrote:
> > On 4.12.2024 9:33 AM, Stephan Gerhold wrote:
> > > On Wed, Dec 04, 2024 at 08:20:15AM +0100, Krzysztof Kozlowski wrote:
> > >> On 03/12/2024 18:44, Stephan Gerhold wrote:
> > >>> The WCD938x codec provides two controls for each of the MIC_BIASn outputs:
> > >>>
> > >>>  - "MIC BIASn" enables an internal regulator to generate the output
> > >>>    with a configurable voltage (qcom,micbiasN-microvolt).
> > >>>
> > >>>  - "VA MIC BIASn" enables "pull-up mode" that bypasses the internal
> > >>>    regulator and directly outputs fixed 1.8V from the VDD_PX pin.
> > >>>    This is intended for low-power VA (voice activation) use cases.
> > >>>
> > >>> The audio-routing setup for the X1E80100 CRD currently specifies both
> > >>> as power supplies for the DMICs, but only one of them can be active
> > >>> at the same time. In practice, only the internal regulator is used
> > >>> with the current setup because the driver prefers it over pull-up mode.
> > >>>
> > >>> Make this more clear by dropping the redundant routes to the pull-up
> > >>> "VA MIC BIASn" supply. There is no functional difference except that we
> > >>> skip briefly switching to pull-up mode when shutting down the microphone.
> > >>>
> > >>> Fixes: 4442a67eedc1 ("arm64: dts: qcom: x1e80100-crd: add sound card")
> > >>
> > >> If there is no functional difference and this is just redundant, then
> > >> there is nothing to fix, so drop the tag. But the point is that users
> > >> might want the low-power VA. You claim they don't want... sure, I am
> > >> fine with that but there is nothing to fix in such case.
> > >>
> > > 
> > > The fix here is that two mutually exclusive power supplies for the DMIC
> > > are specified in the device tree. You can only have one of them active
> > > at the same time. The Linux driver handles that gracefully, but the
> > > device tree is still wrong and IMO deserves a fixes tag.
> > > 
> > > The functional difference is that we skip briefly switching to pull-up
> > > mode when shutting down the microphone. Users won't notice that, but
> > > it's not the intended behavior.
> > > 
> > > I don't claim that users don't want to switch to the low-power pull-up
> > > mode (VA MIC BIASn). However, we would need a different mechanism to
> > > give them the option to switch at runtime. "audio-routing" just
> > > specifies static routes, so the current description does not allow
> > > switching between the two modes either.
> > 
> > Is there no existing mechanism to alter this at runtime?
> > 
> 
> I don't think so... Since it's currently exposed as two separate DAPM
> supplies (instead of a mux or similar) you can only choose between one
> of them in the static routes specified by "audio-routing" in the DT.
> 
> I tried looking at how downstream handles this, but this left me even
> more confused than I was before. :-) On CRD we currently have the
> following routes in DT:
> 
> 	"VA DMIC0", "MIC BIAS3",
> 	"VA DMIC1", "MIC BIAS3",
> 	"VA DMIC2", "MIC BIAS1",
> 	"VA DMIC3", "MIC BIAS1",
> 	"VA DMIC0", "VA MIC BIAS3",
> 	"VA DMIC1", "VA MIC BIAS3",
> 	"VA DMIC2", "VA MIC BIAS1",
> 	"VA DMIC3", "VA MIC BIAS1",
> 
> MIC BIAS and VA MIC BIAS are mutually exclusive, so this is not correct.
> But if you look at e.g. SM8550 downstream they have:
> 
> 	"TX DMIC0", "MIC BIAS3",
> 	"TX DMIC1", "MIC BIAS3",
> 	"TX DMIC2", "MIC BIAS1",
> 	"TX DMIC3", "MIC BIAS1",
> 	"VA DMIC0", "VA MIC BIAS3",
> 	"VA DMIC1", "VA MIC BIAS3",
> 	"VA DMIC2", "VA MIC BIAS1",
> 	"VA DMIC3", "VA MIC BIAS1";
> 
> Note the TX DMIC vs VA DMIC. So they specify one of the supplies for the
> TX macro DMIC, and the low-power one for the VA macro DMIC. That would
> be fine.
> 
> Now the question is: If we can use the DMIC through both the TX and the
> VA macro, and we're not doing voice activation, why are we using the VA
> macro in the first place?
> 
> @Srini: Do you remember why?
> 

What's the verdict regarding this?

Regards,
Bjorn

