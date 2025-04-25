Return-Path: <linux-arm-msm+bounces-55631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19775A9C858
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 13:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B197C4E29F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6767B24E01D;
	Fri, 25 Apr 2025 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgBHPfbn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B187224B06;
	Fri, 25 Apr 2025 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582156; cv=none; b=by3PCcerj/8423VdpFXHz6VNdmRuwCYBUUcFxcYjqExC/2C5shfdKfuVx4H7MUXsgTQRvRasuxgY1/9VptI4jgDhYXjhpn23w8vdD+/lGjtFQYhWVMypx4yG+eTpb1dQiI5qQAr8zYO9JLRQgI5I/ALKiWwd/q8eCEs6aIVLJ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582156; c=relaxed/simple;
	bh=2m7v7Ej+P2mp+uu2PV/itldRgESRqZ9YTq3gSWdQ/5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtnovRqEhwtnKu2zxuPpv2dOgFFP+92R9rZYGmdMm45t/HzyXT4dXTHLVklY4DSFdFCWjKPYv7HLQkpGBVNwJvbzbgPHAqpfMy64jXwXZTqc2l5cdhb0oJjYSHqtqLTQsjgT1o2qAZvtkVHXf9hvVbo5T1xyjeut4zD1AMBxH2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgBHPfbn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F79C4CEE4;
	Fri, 25 Apr 2025 11:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745582155;
	bh=2m7v7Ej+P2mp+uu2PV/itldRgESRqZ9YTq3gSWdQ/5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PgBHPfbnljjuxBioq8XInfcSM9iM5ETScLdmHeLGUlZoYoEzOFHhNitclDEj/kxnu
	 cCUMGnaIUUbwHDePe/noyLYMGwNhVT5ATRbQNj/nMvC7lMcmjZyRZmCe9NLSs0NGg5
	 J6padj7lhFuuuiOWOPWnEzQ704xMBldbFKQtI7l+DbKA1qpqVwsNbL+3abJ3LOkJkz
	 hi072Ww0coHK6kz+outdt4W8QQj5EnFw2SXbXtoMxRcHi6OUvgprhnYP2R5cSllRNm
	 qawrnvfLoCgSe8IM4SWE1q/rnyBoJjA5TLh4OD6h44QezjvZeZdnseAX0OJ44HgyMh
	 Y1Qo95+2hKm7A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u8Heu-000000004ij-0seJ;
	Fri, 25 Apr 2025 13:55:56 +0200
Date: Fri, 25 Apr 2025 13:55:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
	quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
	quic_cang@quicinc.com, quic_qianyu@quicinc.com
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
Message-ID: <aAt4TBrekUqyTjfi@hovoldconsulting.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-3-quic_wenbyao@quicinc.com>
 <4bb58766-a080-4351-87f5-79a98219171c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bb58766-a080-4351-87f5-79a98219171c@oss.qualcomm.com>

On Fri, Apr 25, 2025 at 12:22:56PM +0200, Konrad Dybcio wrote:
> On 4/25/25 11:29 AM, Wenbin Yao wrote:
> > From: Qiang Yu <quic_qianyu@quicinc.com>
> > 
> > Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
> > voltage rails can be described under this node in the board's dts.
> > 
> > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> > Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index 46b79fce9..430f9d567 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -3287,6 +3287,17 @@ opp-128000000 {
> >  					opp-peak-kBps = <15753000 1>;
> >  				};
> >  			};
> > +
> > +			pcie3port: pcie@0 {
> 
> @0,0 for PCIe adressing (bus,device)

No, the bus number is not included in the unit address, so just the
device number (0) is correct here (when the function is 0) IIUC.

Johan

