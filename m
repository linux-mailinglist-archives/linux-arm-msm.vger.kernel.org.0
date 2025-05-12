Return-Path: <linux-arm-msm+bounces-57623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4111FAB3E88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 18:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B61993B3FD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 16:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E41D2951BA;
	Mon, 12 May 2025 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFUd65pA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46A225D1F8;
	Mon, 12 May 2025 16:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068952; cv=none; b=WS/Qtz2uGcj3rW62tEY6IgH0Zvde3+9bUy9aU8kD97oMDIcQ/R4UMIU1jumbbhzCHWfsfhY1y2TRHiVM6WkGLAFmQQEvgl9VSCkGKTtHZ1T8b5zpB0DjR0K2VkF/orwhdSXAXJAwTk4EwU70sour2jxDr8t9dwOTfN5L3MYbNOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068952; c=relaxed/simple;
	bh=9ukROqIAcSp6SGFl1zPfpFs7IwcWq7BQhrYCV/TWWaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0mfE/CtVvMpPtd854y2cZ5oW/7FJSeAhd40fTJJw75h1kyg9AXbDkndHsBn2z8lICY43I3NIb6kNuy7TojZA1jqH7qtpEIRTKPBzAAWl1y+TwwK7lomTBf0Yx94mvyzXfg5nT1fOQqqHGA14I9Go5qyN4AJUdXytEC2bF8Cdss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFUd65pA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262B4C4CEE7;
	Mon, 12 May 2025 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747068952;
	bh=9ukROqIAcSp6SGFl1zPfpFs7IwcWq7BQhrYCV/TWWaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFUd65pAwGgdDgiskglFWRC19O7TZgunG+m587xb2744vL1wpB8H6WZsRB5NtIHGH
	 DG9IuIXkKqBwBCTlNrod9hmtZz4mLviVjRbEAkD35+2F7k1zbovgc9PhDglyUrXuNv
	 fHET4Xw8VvwzvfOAlm752J7uJOd5Rnk5R4vKqXpCm4wK1EYxsES9vVMqDoNr5qCA+V
	 ehAM35Ox8ndPenlG5FGYv2bbZaLotgViz/X/BzGFVP2zPWytfrjhs1mcpA4+s/uZ8t
	 LWn2Ns2iAR3JWtH29jMyA4WD8w0qmtOlz0hGPn7jpmLlJwsZs59K+xe/p+KZQhuJLZ
	 TRR753BPmJJaw==
Date: Mon, 12 May 2025 18:55:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	krzk+dt@kernel.org, robh@kernel.org, mani@kernel.org, conor+dt@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, beanhuo@micron.com, 
	peter.wang@mediatek.com, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 1/3] scsi: ufs: dt-bindings: Document UFS Disable LPM
 property
Message-ID: <20250512-dynamic-wisteria-manatee-def67b@kuoka>
References: <20250506163705.31518-1-quic_nitirawa@quicinc.com>
 <20250506163705.31518-2-quic_nitirawa@quicinc.com>
 <667e43a7-a33c-491b-83ca-fe06a2a5d9c3@kernel.org>
 <9974cf1d-6929-4c7f-8472-fd19c7a40b12@quicinc.com>
 <8ebe4439-eab8-456a-ac91-b53956eab633@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8ebe4439-eab8-456a-ac91-b53956eab633@quicinc.com>

On Mon, May 12, 2025 at 09:45:49AM GMT, Nitin Rawat wrote:
> 
> 
> On 5/7/2025 8:34 PM, Nitin Rawat wrote:
> > 
> > 
> > On 5/6/2025 11:46 PM, Krzysztof Kozlowski wrote:
> > > On 06/05/2025 18:37, Nitin Rawat wrote:
> > > > Disable UFS low power mode on emulation FPGA platforms or other
> > > > platforms
> > > 
> > > Why wouldn't you like to test LPM also on FPGA designs? I do not see
> > > here correlation.
> > 
> > Hi Krzysztof,
> > 
> > Since the FPGA platform doesn't support UFS Low Power Modes (such as the
> > AutoHibern8 feature specified in the UFS specification), I have included
> > this information in the hardware description (i.e dts).
> 
> 
> Hi Krzysztof,
> 
> Could you please share your thoughts on my above comment? If you still see
> concerns, I may need to consider other options like modparam.

It still looks like policy here. If this is soc specific, then I don't
get why SoC compatible would not be enough?

Best regards,
Krzysztof


