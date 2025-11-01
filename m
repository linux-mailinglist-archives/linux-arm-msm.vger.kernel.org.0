Return-Path: <linux-arm-msm+bounces-79999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D62C2839A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 18:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4B2E24E976A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 17:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E640C1E7C23;
	Sat,  1 Nov 2025 17:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEVxwday"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B767FF50F;
	Sat,  1 Nov 2025 17:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762016468; cv=none; b=VOXCodL1matGD/R4uwFaF5uOok+eEMZKkd+Rbr7tRDdsZqMvJQFLrG9SPYO0fa2Ok9B6d2vSnyOwmjL38TUyHqnlOE3y5EPOl6ppZu8kOGZK1jwQTU49wfYWn0D7K6LUi0ZSfrVVernQ4WXkNRB6q5UglGukY5LVU9orNZjRXWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762016468; c=relaxed/simple;
	bh=YBK3fYNnzq+1jHwjFCOYuKzbG9pghzxjXXAehS4SiVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/GVucYFZGTO4Gx0I3QoCxp9+tWx+Pc22SEGsXoWUsQ4AqdsxXG76VJPphIoGMJp+SbXiNf2tk/EQ9AoIlRz5KvC6ldUQUa+9KmUen20+oChFOeH6rheSDKeX4/XiIZPCrDYCMkQsPQ43m2VZ/8hYhb5Sqf8o3PG7/hckfov/aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEVxwday; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C2AC4CEF1;
	Sat,  1 Nov 2025 17:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762016468;
	bh=YBK3fYNnzq+1jHwjFCOYuKzbG9pghzxjXXAehS4SiVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEVxwdayC0bE/lJBcnn4eMKjd+M0tHSV90UscLxPXwCnMYCdoDKINZa1zZC/DLIso
	 BLxRYcDi51+425WWUOdvGNEuC5P1ra11Udq8wmndtgSoVOB0IJ6d5s4pYBoRrgmTZh
	 yVFQhBqU+uSjYzP1KhTseUAMbtZZM0qS6n1BGAz3EfL/MI///iNWrLtjTjcCAsYS0N
	 NUvbxJ1B900Kqs7rX+BfB1fEiOQ0CQv+wQorSjgBqlUnhnoGo4fPt8wS+C2q+WVPXt
	 km601KkdxePGYdoS8na0PaQ821HLNBZCoNDzlWIk4k+HfrQzdE8qbCRqRveBVVxw66
	 hxfdOcXG0IW0w==
Date: Sat, 1 Nov 2025 12:04:27 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sc8180x: create common zap-shader
 node
Message-ID: <3cn67vhygwbqcjsmiesgskxzindatoiuyrukmoqgueqoej5qgj@ca66omtjzsip>
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
 <20251028-dt-zap-shader-v1-3-7eccb823b986@oss.qualcomm.com>
 <c90b917e-b3bc-42fb-a127-ab47d5154d0d@oss.qualcomm.com>
 <c62a7f9d-6984-41c0-88c5-1d6c40d411dd@oss.qualcomm.com>
 <weyze7a2pqmt2klt763lbwyvpezqndm5rjnitexalru7hy3xhh@tdqx6xeqp3qu>
 <p5apfg5cbwcdmilfr3omoncvuj7z7zbj6dkex2eicjdubkyxwj@h42bzzhx4amt>
 <fuach44wl236rfm57itxmcvj376vr3m7idi4byge6mbbxcrr3h@4uzjnuefh2y5>
 <adae8998-8b64-4814-8713-2dc63380452c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adae8998-8b64-4814-8713-2dc63380452c@oss.qualcomm.com>

On Fri, Oct 31, 2025 at 10:30:17AM +0100, Konrad Dybcio wrote:
> On 10/30/25 7:45 PM, Bjorn Andersson wrote:
> > On Thu, Oct 30, 2025 at 07:58:46PM +0200, Dmitry Baryshkov wrote:
> >> On Thu, Oct 30, 2025 at 12:28:31PM -0500, Bjorn Andersson wrote:
> >>> On Thu, Oct 30, 2025 at 11:59:00AM +0100, Konrad Dybcio wrote:
> >>>> On 10/30/25 11:58 AM, Konrad Dybcio wrote:
> >>>>> On 10/28/25 10:00 PM, Dmitry Baryshkov wrote:
> >>>>>> In order to reduce duplication, move common GPU memory configuration
> >>>>>> from individual board files to sc8180x.dtsi.
> >>>>>>
> >>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>>> ---
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> >>>>>> index 93de9fe918ebdadf239832db647b84ac9d5a33f6..069953dcad378448800d45e14931efe1fe1a69fc 100644
> >>>>>> --- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> >>>>>> +++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> >>>>>> @@ -14,6 +14,8 @@
> >>>>>>  #include "sc8180x.dtsi"
> >>>>>>  #include "sc8180x-pmics.dtsi"
> >>>>>>  
> >>>>>> +/delete-node/ &gpu_mem;
> >>>
> >>> I agree with your hmm, seems this line should be dropped(?)
> >>>
> >>> Dmitry, please confirm and I can fix it up as I'm applying the series.
> >>
> >> Oh, and this line is necessary, because sc8180x-primus has its own
> >> location for the gpu_mem.
> >>
> > 
> > Hmm, you're right, not sure why the memory map differs... But this looks
> > good then.
> 
> The latest memory map for 8180 says:
> 
> GPU micro-code @ 0x98715000, 0x2000-long
> (matching the Flex 5G)
> 
> Across all the revisions, Primus's range is either part of a
> "reserved" region, or the CDSP's memory.
> 
> So it's either wrong or OEM-modified, with the latter being rather
> an odd thing given it's a CRD..
> 

I have a faint memory of having issues placing that region, so I might
be that I just winged it on the primus...

Perhaps it doesn't need to be different, if so that's a separate change.

Regards,
Bjorn

