Return-Path: <linux-arm-msm+bounces-80663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2E9C3D564
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 21:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4703B4E1DEC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 20:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777952F39C2;
	Thu,  6 Nov 2025 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7VOAnlQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477E82DCBFC;
	Thu,  6 Nov 2025 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762460447; cv=none; b=uyg5TlRa3UQyyJi1xw3JUmQJEuqvaa4VojNdS3Vum+rA7px7mhBTHaBxLg3qErq6JLSdDywRK1PtAArkeLnIRSIPe2TzJZVndpt+1tNyAeTvcVE7Il44a+aSRZjN4lXf+RddTkuHVsW7mg++YlYZtmocBiq9j5F2rn7/apW3MXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762460447; c=relaxed/simple;
	bh=Z60oqG/trZOnlMB27pz31Xi3T492ivADnsjWB3ntlXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDe6RDtRbfoeuRvj6ue3jt1xDt0AnbWvqPe1fiqzzyW1rR2XN9N9kd9gIOwobQ93tnyoNPGfhImo4rXQjmlt6ntyTzKjkyaeLWP0LAeU36eAb6IzNoNpW7WP25eF8b5Yccm0dLJ5rk6vu62u2MvC78QmAlIexA+1pOVOH2YFqFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7VOAnlQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE5BC4CEF7;
	Thu,  6 Nov 2025 20:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762460447;
	bh=Z60oqG/trZOnlMB27pz31Xi3T492ivADnsjWB3ntlXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E7VOAnlQUb1djiDJEw698HSqpoys+qRwdb9foEuadBU1ywhhUquMFKie1es6DmJpk
	 NOLmLz/42QEPKe0OtcfYzdvFhuY2BYc7IsIMco4FYz7H+3iD5ukkGZ95lo1MP46rAR
	 kUHb5jDy3oLjrLI2cpRhgF4V4lAkzPDn/mwxmYlpN4Wk7pVyUNpQkrbsdIgei2SFpQ
	 7XHgkIwbJrIlpfBDVdk7uxIBYygksEANsYU1+e8rzZxeui8iQa0xTEjlpVr+L16XuU
	 cdhtDFTyHuNjV2Gt8eUltMRIaFEs4UyOSGIsDGLLBlLzonsAervG8BCV126QIsas6/
	 ZTl0WISB4Hv6w==
Date: Thu, 6 Nov 2025 14:24:33 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
	Das Srinagesh <quic_gurus@quicinc.com>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
Message-ID: <c2o4iouc6sm7frcq64jmvxopv3eqvrjxievwwhiwqw6ptwfok3@4qmpfy4yij4m>
References: <20251102-knp-soc-binding-v3-0-11255ec4a535@oss.qualcomm.com>
 <20251102-knp-soc-binding-v3-1-11255ec4a535@oss.qualcomm.com>
 <20251104-glaring-rebel-pillbug-a467ca@kuoka>
 <790ca394-cee2-412b-97d8-c6416b843010@oss.qualcomm.com>
 <b6717831-1840-4b9a-aade-ab2248e3f75d@kernel.org>
 <9ee07db9-508e-4c08-8f79-6ccfd9b646ab@oss.qualcomm.com>
 <6af33c1b-5b95-4efc-b429-5bfb9ee7caeb@kernel.org>
 <8cf870a8-706d-4514-a87a-a69b64521ab5@oss.qualcomm.com>
 <f539b21b-cfe8-4055-9620-4d5d8d108098@kernel.org>
 <9d80b581-5d3f-4b95-91e7-c73c113b0976@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d80b581-5d3f-4b95-91e7-c73c113b0976@oss.qualcomm.com>

On Tue, Nov 04, 2025 at 03:58:27PM +0100, Konrad Dybcio wrote:
> On 11/4/25 3:52 PM, Krzysztof Kozlowski wrote:
> > On 04/11/2025 15:38, Konrad Dybcio wrote:
> >> On 11/4/25 3:37 PM, Krzysztof Kozlowski wrote:
> >>> On 04/11/2025 15:35, Konrad Dybcio wrote:
> >>>> On 11/4/25 3:26 PM, Krzysztof Kozlowski wrote:
> >>>>> This I got, but nothing here explains why you need generic compatible.
> >>>>> To re-iterate: there was no generic compatible before, now there is.
> >>>>> Writing bindings and numerous reviews from DT maintainers ask not to use
> >>>>> generic compatibles.
> >>>>
> >>>> OK so let's not worry about a generic compatible. IMEM exists since
> >>>> MSM8974 and it only had major hw updates with SM8550. They don't
> >>>> impact the software interface though, so qcom,msm8974-imem is OK.
> >>>>
> >>>> There's a separate control/status register address space for each
> >>>> instance of this IP (usually far apart from the actual SRAM pool),
> >>>> which Linux doesn't have to care about.
> >>>
> >>> Just use qcom,kaanapali-imem - that's the first device here without syscons.
> >>
> >> So we don't want to move the existing ones over?
> > 
> > This was never discussed and this patch did not do it. You cannot move
> > them, that's ABI.
> 
> I see, I implicitly assumed this would be a sweeping change.
> 
> So should the Kaanapali submitters simply send a version of this
> patch with:
> 
> - oneOf:
>   - const: qcom,kaanapali-imem
>   - items:
>     # existing big list
> 
> ?

We have 33 cases of "this is just a generic Qualcomm IMEM block", could
we just make it "qcom,imem" until there's actually a sign that it's not
a platform-independent block?

Regards,
Bjorn

> 
> I'm not a huge fan of using kaanapali as the fallback-going-forward
> since it's literally the newest platform on the shelves (or perhaps
> not even on the shelves yet..) so it's going to look funny when
> someone comes up with support for another 2013 soc.. but perhaps
> that's just how things are supposed to be
> 
> Konrad

