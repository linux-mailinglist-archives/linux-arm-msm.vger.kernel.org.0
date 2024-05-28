Return-Path: <linux-arm-msm+bounces-20786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AD18D208B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 17:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55FBB1F24170
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 15:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF8C170859;
	Tue, 28 May 2024 15:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKsYmWky"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BA51DFD1;
	Tue, 28 May 2024 15:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716910638; cv=none; b=sUptvTwcoSx+qBlO9VO21mPFtFM3+oxjPoN3L0pMRMkFg1LfL5YXbhXi99OMs4vVXpDW+DXrlLtBebA0MH0qXdfAn3C7ptIOXzE20fILPkBM2wncsdEPYMmxBO+1k+gPxzoEkv+W8XnwzHE5EOftZdM5eo2LrGHm6needk6kmVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716910638; c=relaxed/simple;
	bh=BiYxOQLp3SdeWRN8VT7No5J50/AGacW5/Vwkc78ZvTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeK/ecz/lwdd20fSIq2MVz+bN2+uDivD2lGOCRNIO/U9RH+K+xx0NLw7f/K14pDjE2UD23wKjRQnbDfGyMmzSW6R+bA6qZ8g3JJBxyeJZQNBNZT265pFYibNViHhUoDzBAU7OtjeCO4QoQ2fJBK0TjzPkSP395WPmevtqfULz94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKsYmWky; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFFB0C3277B;
	Tue, 28 May 2024 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716910638;
	bh=BiYxOQLp3SdeWRN8VT7No5J50/AGacW5/Vwkc78ZvTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKsYmWkyWNCYpaEfoixgqY9fv9boQp6pD3Knsl62cVH8tUDSuRySIQx/z8qu04MiI
	 Dkpl8t+DfqI45BdVR0COL/N+E88i9eTYyaTxeeq+I7oHd8IBaY69oDmqroZAvhTETP
	 EvmeMuqSxgErfMsmW6uYMgmgl19ZtnE7Ka+stCW+DTtK/5FKWGVyInrrBXm96vfner
	 /Mr55Oo0lDLibPYYFTEocC0mJwAcOyoh8HMz+AoPge3nmSDud4/Q1TfIxTI9XD9/2P
	 5+vIm0xTjTGtMHVbO+pOh3+kHTo1I4bSo+xCmrr31V+dixBH2DuQOF74tkhqWXufpU
	 1L3BddJzXOcXQ==
Date: Tue, 28 May 2024 10:37:15 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Add qfprom node
Message-ID: <4jopw7qv2jlq7b5ljkxfhjjjdlqclruouentrvbjt43yybxyf6@qzsk4imnmq5m>
References: <1709727995-19821-1-git-send-email-quic_mojha@quicinc.com>
 <1709727995-19821-2-git-send-email-quic_mojha@quicinc.com>
 <45fcf8fb-9d9b-4e6a-a7c5-9bfb96875e64@linaro.org>
 <69a8c14c-109a-103a-b8dc-d8e303c0f0d5@quicinc.com>
 <gxi4klvxzwwyrwb2b4h7kmii5dx5mxdypxowwz3kyllvq6grss@6lahaospwtsh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <gxi4klvxzwwyrwb2b4h7kmii5dx5mxdypxowwz3kyllvq6grss@6lahaospwtsh>

On Sun, Mar 17, 2024 at 08:21:58PM GMT, Bjorn Andersson wrote:
> On Thu, Mar 14, 2024 at 10:13:59PM +0530, Mukesh Ojha wrote:
> > Sorry for the late reply, was on vacation.
> > 
> > On 3/6/2024 9:24 PM, Konrad Dybcio wrote:
> > > 
> > > 
> > > On 3/6/24 13:26, Mukesh Ojha wrote:
> > > > Add the qfprom node for sm8450 SoC.
> > > > 
> > > > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/sm8450.dtsi | 7 +++++++
> > > >   1 file changed, 7 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > > b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > > index b86be34a912b..02089a388d03 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > > @@ -4575,6 +4575,13 @@
> > > >               };
> > > >           };
> > > > +        qfprom: efuse@221c8000 {
> > > > +            compatible = "qcom,sm8450-qfprom", "qcom,qfprom";
> > > > +            reg = <0 0x221c8000 0 0x1000>;
> > > 
> > > Is is really only 0x1000-long? Also, is the base you put
> > > here the ECC-corrected part (if that still exists)?
> > 
> > No, its not.
> > 
> > Entire fuse space is this.
> > 0x221C0000-0x221Cbfff
> > 
> > ECC corrected range is this 0x221C2000-0x221C3fff and High level OS
> 
> That's 0x2000. Does this then also imply that the ECC-corrected values
> are no longer mapped 1:1 with non-corrected, or why do they differ in
> size?
> 
> > does have a access to ECC range however, they are not recommended for
> > SW usage.
> > 
> > Above mentioned SW range(4) in the patch is  one and only accessible range
> > available out of 0-7 SW ranges(0x221C4000-0x221Cbfff with each
> > size 0x1000) and does not have ECC fuses.
> > 
> 
> So you're saying that in contrast to other platforms, the 4th software
> range, dedicated for HLOS, does not have a matching ECC-corrected
> shadow? If that's the case, then "not recommended for SW usage" sounds
> wrong.
> 
> > All the downstream use cases are getting fulfilled with this.
> > 
> 
> You only need ECC if you're unlucky...
> 

The patch is either incorrect or the commit message is lacking answers
to the questions from Konrad and myself.

Would have appreciated a reply here, but either way I'm marking this as
"changes requested" and dropping it from the queue.

Regards,
Bjorn

