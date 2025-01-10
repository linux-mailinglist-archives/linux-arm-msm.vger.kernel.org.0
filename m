Return-Path: <linux-arm-msm+bounces-44768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D67FA09BC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 20:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48BDA16AC18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 19:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334A52144BA;
	Fri, 10 Jan 2025 19:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="HD73YyIG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDF2212FB9
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 19:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736537024; cv=none; b=Lq4uc5vazHVpJK3JdBYx7wbvcNjUuuUE8QLcGz5iGHJx2Anm0D/1nl6QUpgak6JRUQglSdeykxrgEC42NQKGyWINoozZhnbFs0lYJZ7y5xbTc3rhR4PwTmntsd38hbGq9ptX6Uo2r0ZsFCvUiKG7G/KIM4W04zs1nLdyde/OztQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736537024; c=relaxed/simple;
	bh=SKvv2wL/SHI91AQ3qMk4EbzIXzqQAPhYnMO18KKIh2Q=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=hEg/SAtg+xqXhK12H6/lZkeGjhnijLqgoNUvlf8n+7xDIe+kRWiqBWnYmZLNL2kxtNJ+I2NIT39LEXyvMpjcrrUU9/oexUNj8Mwv5E5972/CPpJ9nTGliSoY9fbCa3jPcHcIE6OQc0WJpIKKdL+Z9g0r/4nBE1UmEo0sSdqEcmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=HD73YyIG; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 3fb7d581-cf88-11ef-bc52-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 3fb7d581-cf88-11ef-bc52-005056992ed3;
	Fri, 10 Jan 2025 20:22:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=/KJAI6rZMyrjpAxu9pgZwMk+8GZtTyA5Rf3XMKlCiTs=;
	b=HD73YyIGE4gHpyjA22GJ4eiyLk505qcsE/l17BfsqrNxP+Hw1YLEX6XnVmA31Z8zgJAaf94nAlfQC
	 6SrW3Bxcr+D7J78tlaAsOIphNVdVdpbKuUS2YQp+j6scSZ2pljOSTZ+8anemWEZzKwOMeQR2OhmmFg
	 cH8Pt4rQO4ktGfAD4aX5kPJTLYT1NExihK2OtXcf9dfRaCIcbmIhqPTS4vMcko6tM3ETJn/oNVH05z
	 VF4RM9kT7x6ZNmUaTMg0tE8LK292W5yCF4cY+qUm0NONBpyDBGQb8hr0cHGuuGt0tiJsMX6jJuTdds
	 I8hjIOajc9qnX/NyaPnEFMUdmGSd8zA==
X-KPN-MID: 33|wXVuMNrdWrxB13ZpC56pa88QK1GxPQ79V/REObUI/8pgxD9phj+Km3IoP4/kr8O
 prt/2tQ9SZAuwssehM1qU6BOaIPRzbWre//eXY0yPfeU=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|GIHfWUSF6CnM6ln1WfNvLbA1HdK5TvV7mkIicrjwkf4raD1jjTjLhpE9wgEGJNf
 2zudQ8lIqYHBT29xAk5yxtg==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 3c6a1ca4-cf88-11ef-894c-00505699d6e5;
	Fri, 10 Jan 2025 20:22:31 +0100 (CET)
Date: Fri, 10 Jan 2025 20:22:30 +0100
Message-Id: <87frlqv5hl.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Johan Hovold <johan@kernel.org>
Cc: kettenis@openbsd.org, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, quic_rjendra@quicinc.com,
	abel.vesa@linaro.org, quic_sibis@quicinc.com,
	johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <Z4FND-b-gEb6YJw6@hovoldconsulting.com> (message from Johan
	Hovold on Fri, 10 Jan 2025 17:38:39 +0100)
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Mark usb_2 as dma-coherent
References: <20250109205232.92336-1-kettenis@openbsd.org> <Z4FND-b-gEb6YJw6@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

> Date: Fri, 10 Jan 2025 17:38:39 +0100
> From: Johan Hovold <johan@kernel.org>
> 
> On Thu, Jan 09, 2025 at 09:52:31PM +0100, Mark Kettenis wrote:
> > Make this USB controller consistent with the others on this platform.
> > 
> > Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> > Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index 4936fa5b98ff..aad1153a443d 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -4814,6 +4814,8 @@ usb_2_dwc3: usb@a200000 {
> >  				snps,dis-u1-entry-quirk;
> >  				snps,dis-u2-entry-quirk;
> >  
> > +				dma-coherent;
> > +
> 
> Can someone from Qualcomm please confirm that this is correct, and that
> it's not the other way round and this property should be removed from
> the other controllers (e.g. if this was just some copy-pasta from sm8550
> which is the only other Qualcomm platform that claims to have
> dma-coherent USB controllers).

It certainly wouldn't hurt to have confirmation from someone familliar
with the SoC design.

However treating the controllers as DMA coherent when they're not
would almost certainly resulted in reports of USB devices being
unreliable on these machines as the OS would skip necessary cache
flushes.  I did test this patch on the ASUS Vivobook S 15 where the
microSD-card reader uses the usb_2 controller.

