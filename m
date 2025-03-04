Return-Path: <linux-arm-msm+bounces-50108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6131A4D2AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 05:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 798F77A75B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 04:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10811EF0BC;
	Tue,  4 Mar 2025 04:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUNmMY6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA2A273FE;
	Tue,  4 Mar 2025 04:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741063896; cv=none; b=hLFryyuGyeRzDrekm3YJE5JXqj5WqHQj6fwT02KcaiMdtWxsjKaEFQ+yr8yOsIw+MwDrO0edfudIVIGeyU4NxyqlGUFBYHNvFR56dXY63hh/vCEwJMAoolwc1q//Y84/W6VU3JO0bxzDE+kGxvdx4wXVkrsc1Vq6mqt2xD14sK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741063896; c=relaxed/simple;
	bh=7l7riUckfOpM6AM+fvQiXIpldlnQUaymDAQiM5F3XY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6tX9kg1p8OPc4Z6gTBoMzcoH9v0TySioZxi5qKYFSwf9LG8KOyEyz2evmEmWnhD3xH93a6PUsK2+RQWM4Ye0xVkBL+V0eG/HtHnCo/oFKpyrE1DD5JMTlLB2UYArvY31hofia8j+IQDpqdIs113uNFx4K5HsRmBJPLEqnp12Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUNmMY6d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C06FC4CEE5;
	Tue,  4 Mar 2025 04:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741063896;
	bh=7l7riUckfOpM6AM+fvQiXIpldlnQUaymDAQiM5F3XY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jUNmMY6d+Opn6L/0cfBMvAkeUKiumGuKWabzT/IJzk0NQRjEQfdGDPdxj89N2Q4eY
	 k/m0GUN/8kDr3Saf/UF8zQp6Mpcxy4LgJB0oaq6ZSvaheISRRjqY3HSxrPxVLPvBr/
	 u3ZnlEuuKGZVb8snPJkHjhkvmIU2Yic8tY0A/bC7peHZy/eDcgIAXNE5WOIeVAZkEH
	 RHLfdmhWbOtpYbw+7qnYSlxz/lVaQtS/XXFeEb8C/j9wFbdycXbU8JKqQSmfNDyqDV
	 aWWiCILd4b4ttopzArH6wI5Dw7su2IJjKsOIGTj+Mniq3CVH0Nsm6zh9b01+ILTjzP
	 sJO1jV2WQBKzw==
Date: Mon, 3 Mar 2025 22:51:33 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Update protected clocks
 list
Message-ID: <yt5sswa42uyrrnvaqwbhatndi2fsfp2ayjslyvzvwkfn7l4oto@jsvc2ukwclqz>
References: <20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com>
 <j43f4wu6wgoho2tl4crckemnngyvek5mma6ghkdyqcivk65dcf@gfsimovfuqy5>
 <72cc2c52-1d0d-4a60-93da-14acd5947f1f@quicinc.com>
 <o53nnmt5ypuoms3b37lehtmpwloudusr7647alehvnwsiltsyo@grd6ua7mh4o2>
 <0ab2552a-3b8d-4b4f-8f9e-8b0c4f5bf6ea@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ab2552a-3b8d-4b4f-8f9e-8b0c4f5bf6ea@quicinc.com>

On Thu, Feb 27, 2025 at 09:56:27AM +0530, Taniya Das wrote:
> 
> 
> On 2/27/2025 9:50 AM, Dmitry Baryshkov wrote:
> > On Thu, Feb 27, 2025 at 09:42:39AM +0530, Taniya Das wrote:
> >>
> >>
> >> On 2/26/2025 10:12 AM, Bjorn Andersson wrote:
> >>> On Thu, Feb 06, 2025 at 03:43:21PM +0530, Taniya Das wrote:
> >>>> Certain clocks are not accessible on QCM6490-IDP board,
> >>>> thus mark them as protected.
> >>>>
> >>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >>>> ---
> >>>> Mark few clocks as protected on IDP of QCM6490.
> >>>>
> >>>> This patchset is separated out from the series[1] to remove dependency from
> >>>> the LPASS reset.
> >>>> [1]: https://lore.kernel.org/all/20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com/
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 21 +++++++++++++++++++++
> >>>
> >>> I merged the patch adding this board in November 2023, are you saying
> >>> that for the last 15 months no one has actually booted it!?
> >>>
> >>
> >> I am not sure, I had got request to help boot the board which was not
> >> due to these clocks.
> > 
> > So, was the original submission in November 2023 broken or was it broken
> > by a later firmware upgrade which started to protect those clocks?
> > 
> That's a fair question, probably the later broke it.

Given that the now introduced list of protected clocks exactly matches
the initial (incorrect) set for rb3gen2 I would be very surprised if
someone since then changed the IDP firmware to protect all those clocks.

More likely IDP was either not tested in a clean upstream build or
possibly only tested with no-ac firmware.

Regards,
Bjorn

