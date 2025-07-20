Return-Path: <linux-arm-msm+bounces-65766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9357FB0B36D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 06:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9CAF16C589
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 04:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3751A0BF3;
	Sun, 20 Jul 2025 04:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okUHDHoJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA1919D8BC;
	Sun, 20 Jul 2025 04:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752984018; cv=none; b=j26vD9WM+iIHW04d46lTBuHSkzyvaZ7kYEI2xcNMwqR68Zz6lmmh+lCChh69Vfum5CLePGcICM+xaIexMeTMVWbyYJ6ZjFlZxlRXgX2oiQlq4okVqTNLOetYQNGMAZrvkTRAwHTIxyFwpkScqpMpycf7JD9oe4SsIbVreL5iqS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752984018; c=relaxed/simple;
	bh=ziyzl1iKDzn54nDT2rJwJDy0fHbEJYNGZjk1hqdBE/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thgXb97n004Z3Ml/fPxALcoikTTD1iJs/ku3NRXXPL2F4w4jW8r/JcAmx5RCyFYpl9P3v6229xt2Q80J/2wDsgPfv4JNvbFtv+4U5BNwt++oFBBMYqESHgGpdVKIxhmfEL5qyDwhW58X7JJzkdf60zvAquRNbOm+k13r7N1vPao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okUHDHoJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCA7C4CEEB;
	Sun, 20 Jul 2025 04:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752984017;
	bh=ziyzl1iKDzn54nDT2rJwJDy0fHbEJYNGZjk1hqdBE/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=okUHDHoJVCRYuKMyEsK9fbZEu2BkI09ePTg2xGG9/fhGk/w0olmEjndPqHwdjYQTT
	 1BEZ/dQ/Uhc12B9n51DlbVfy4Cyg1wJfa48EJvFeALRiGV6nBBuaj+Qh9ktXo+q2ze
	 rtdG1BKgj6f2XsC6efs909Hfcj3ue4PJmfAU6PmTODjmNKhc1ztKBktlKvNF+112/7
	 UflbGAhqnezdhXOEsRnWrKFBL98UlkjL4b2EsmINewexnJKvcQJNE3H5UwsQ/+ie3Z
	 aa9UbpFNjmqcx2ICId7Yi3vFvZwQhu7ri8r6E2IyiOsbQdoOLpdSlKw4H1oZUaAfuf
	 cJOoXHPdDWjVw==
Date: Sat, 19 Jul 2025 23:00:14 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, sboyd@kernel.org, 
	mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	quic_rjendra@quicinc.com, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
Message-ID: <52ytt5ag5l65hdjjmvjft2l7ofvt4rgdn6r3bytcpjvyqia7ry@uzajn7qjng4a>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-8-pankaj.patil@oss.qualcomm.com>
 <aHjJG2nrJJZvqxSu@linaro.org>
 <40534488-24f6-4958-b032-d45a177dfd80@kernel.org>
 <2f5b5e6e-5041-453e-b3f7-b10b40bc6f57@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f5b5e6e-5041-453e-b3f7-b10b40bc6f57@oss.qualcomm.com>

On Fri, Jul 18, 2025 at 11:07:23PM +0530, Taniya Das wrote:
> 
> 
> On 7/17/2025 3:38 PM, Krzysztof Kozlowski wrote:
> > On 17/07/2025 11:57, Abel Vesa wrote:
> >> On 25-07-16 20:50:17, Pankaj Patil wrote:
> >>> From: Taniya Das <taniya.das@oss.qualcomm.com>
> >>>
> >>> Add support for Global clock controller for Glymur platform.
> >>>
> >>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> >>> ---
> >>>  drivers/clk/qcom/Kconfig      |   10 +
> >>>  drivers/clk/qcom/Makefile     |    1 +
> >>>  drivers/clk/qcom/gcc-glymur.c | 8623 +++++++++++++++++++++++++++++++++
> >>>  3 files changed, 8634 insertions(+)
> >>>  create mode 100644 drivers/clk/qcom/gcc-glymur.c
> >>>
> >>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> >>> index 051301007aa6..1d9e8c6aeaed 100644
> >>> --- a/drivers/clk/qcom/Kconfig
> >>> +++ b/drivers/clk/qcom/Kconfig
> >>> @@ -645,6 +645,16 @@ config SAR_GPUCC_2130P
> >>>  	  Say Y if you want to support graphics controller devices and
> >>>  	  functionality such as 3D graphics.
> >>>  
> >>> +config SC_GCC_GLYMUR
> >>
> >> Wait, are we going back to this now?
> >>
> >> X Elite had CLK_X1E80100_GCC, so maybe this should be CLK_GLYMUR_GCC
> >> then.
> > 
> > 
> > Yeah, the SC is meaningless here, unless you call it CLK_SC8480XP_GCC,
> > so the authors need to decide on one naming. Not mixtures..
> > 
> > 
> Glymur follows the "SC" naming convention, and historically we've
> adhered to the format: "SC/SM/SDX/SA_<Clock Controller>_<Target Name or
> Chipset>". This structure has helped maintain consistency and clarity
> across platforms.
> 

The platform isn't named SCGLYMUR - which is where the SC prefix would
come from.

I'm not sure there's a benefit to quickly be able to know if a clock
controller is for a SC, SM, SA, MSM, etc platform. Please let me know if
I'm missing something.

> The case of X1E80100 appears to be an exception—likely influenced by its
> unique naming convention at the time.
> 
> That said, I’d prefer to stay aligned with the established convention
> used for earlier chipsets to preserve continuity. I’d appreciate hearing
> your thoughts on this as well.
> 

We're changing the naming model completely, so there is no continuity.
In fact the Hamoa "exception" would suite us very well for Glymur.

And look how nicely the CLK_X1E80100_* entries are grouped together in
the Kconfig.

Change to CLK_GLYMUR_* please.

Regards,
Bjorn

