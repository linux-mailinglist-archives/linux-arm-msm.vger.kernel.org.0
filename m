Return-Path: <linux-arm-msm+bounces-71344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD39B3D816
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 06:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 855677A2739
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 04:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B3421A44C;
	Mon,  1 Sep 2025 04:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSJ97Pez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA652AE77;
	Mon,  1 Sep 2025 04:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756699655; cv=none; b=d0wP2in9bnFfwpskrmZPCXF7wbahXd03lkvUH6V+7c2I0T7B9vWnXoz4eB+r0gEsoU25cIXb4BmJpvwpJ1KGRBN/K+OW2sYHivDFf78bKt8fIr+CRSrASdhu01IXYTOOYglj5S+vdn+0LDWa8PNdItQi13Hjaz+1YnxTjirjGZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756699655; c=relaxed/simple;
	bh=+j8py7V99RgrXRlQXbRzMD7XlRgv0rUsZOd4wl31MhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stPP9AIEpwcb9+BBA3WBcj9z2TF4cJwClOwluZ/NowJ3pIepdWE9kRo0RWXGHuVC9rsUKCUFqZ0QNYTE1IVqQfQopap8Rz6tD/p20/60LuffsvSjeo2bRbg/Z7hJQs9gSSP/2Xxczc38qAo4dOdN0lHGYQ/ElNa+z48o+Va1FQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSJ97Pez; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF48C4CEF0;
	Mon,  1 Sep 2025 04:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756699654;
	bh=+j8py7V99RgrXRlQXbRzMD7XlRgv0rUsZOd4wl31MhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FSJ97Pezc1MKenDVdb45SoWcEQwL+1BixG3iX7ks+YLyacgJ4In6FJDZYZ0I2eEPw
	 n78sRfkfvxmFRm7CIi6w7kEo/kWUh78iDqnMhypCWPZE0wYvPuR/AK1JPSghB91FrC
	 raft3+X4l7iuxmQ94VKr5cljo6f/0Y4FS4LUL+RgGY8chi3aD4PuwZxiJYThiZRV+H
	 IIqY3wQ2NMLtr+fZiOnGj7fozBK8r9EU8QYUHFIC9+hQ3nmr4gbpWoJRXMgiAQAxhr
	 Bv8zxPn43PaTVmj8k7Qke2rfEUw14TPHsnpXWBLfZiTTQ0V5qUvjPPPd5iKMuarBKh
	 sRUjNlr9AeDJA==
Date: Mon, 1 Sep 2025 09:37:26 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com, 
	avri.altman@wdc.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V3 1/4] ufs: dt-bindings: Document gear and rate limit
 properties
Message-ID: <6xgsb7thoo7mquz3mxuyhliuqtvrbxj43nc6ga5qpcgcz4ro4u@doe2253ydjbj>
References: <20250826150855.7725-1-quic_rdwivedi@quicinc.com>
 <20250826150855.7725-2-quic_rdwivedi@quicinc.com>
 <9944c595-da68-43c0-8364-6a8665a0fc3f@acm.org>
 <8d705694-498a-4592-b93a-7df6a1dd5211@quicinc.com>
 <cf203807-77ab-463c-b0b0-4a1cec891fe6@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf203807-77ab-463c-b0b0-4a1cec891fe6@acm.org>

On Thu, Aug 28, 2025 at 10:22:28AM GMT, Bart Van Assche wrote:
> On 8/28/25 9:45 AM, Ram Kumar Dwivedi wrote:
> > On 26-Aug-25 9:05 PM, Bart Van Assche wrote:
> > > On 8/26/25 8:08 AM, Ram Kumar Dwivedi wrote:
> > > > +  limit-rate:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    enum: [1, 2]
> > > > +    default: 2
> > > > +    description:
> > > > +      Restricts the UFS controller to Rate A (1) or Rate B (2) for both
> > > > +      TX and RX directions, often required in automotive environments due
> > > > +      to hardware limitations.
> > > 
> > > As far as I know no numeric values are associated with these rates in
> > > the UFSHCI 4.1 standard nor in any of the previous versions of this
> > > standard. Does the .yaml syntax support something like "enum: [A, B]"?
> > Hi Bart,
> > 
> > As per the MIPI UniPro spec:
> > 
> > In Section 5.7.12.3.2, the hs_series is defined as:
> > hs_series = Flags[3] + 1;
> > 
> > In Section 5.7.7.1, Flags[3] is described as:
> > Set to ‘0’ for Series A and ‘1’ for Series B (PA_HSSeries).
> > 
> > While issuing the DME command from the UFS driver to set the rate,
> > the values 1 and 2 are passed as arguments for Rate A and Rate B
> > respectively. Additionally, the hs_rate variable is of type u32.
> 
> Hi Ram,
> 
> Thanks for having looked this up.
> 
> Since it is much more common to refer to these rates as "Rate A" and
> "Rate B" rather than using numbers for these rates, please change the
> enumeration labels into something like "Rate_A" and "Rate_B".
> 

+1. Since this binding describes the HCI, let's stick to the terminologies in
UFSHCI spec.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

