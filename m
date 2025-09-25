Return-Path: <linux-arm-msm+bounces-75160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBC1BA0BDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E6A44A6D68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 17:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C912B304BA9;
	Thu, 25 Sep 2025 17:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rLEgG49U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7519F40B;
	Thu, 25 Sep 2025 17:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758820003; cv=none; b=M2ITgFB5guHEFX9WoAV560Lf7LU8eUXBYhDd6AobbQ+UigWbtK73OwCTr960kJuDGVrjnbf4q1+WlmlIjG4HycAxRfWfvV0iMl5LPlqfOKjHb+kZiEL1oKUadqazoJJdvpaT6kzJsJNPedXn3vd52v5vAGgXuvNUUqnOJWR5w+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758820003; c=relaxed/simple;
	bh=FQnMJ4nzbSCJNz2iuEs2EI/NSyonioY+gldaU1Xzzho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5DjoDqxGuAFFSUNjWb+8Jv/F4rpj/GMPJx1lRqpiHvQZqQM3+F2j+mdU+YyI/HAc85Tnnc4Bvl2FlCyg7tieEdEfduJQGy/99/KCSMQUy4MTOncSefef2SpUAK7dbCpPFLv1W2uqT7EJobLFfQHf/bPbBWE/7p0y2Pxxz7lvms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rLEgG49U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A18C4CEF5;
	Thu, 25 Sep 2025 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758820003;
	bh=FQnMJ4nzbSCJNz2iuEs2EI/NSyonioY+gldaU1Xzzho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rLEgG49UFRdBGutH8VK+dJVxK/A35OeQF1z2hCe64FKkzzkGXMphnQDehqXCOz+Cz
	 BhIFmYQnoNh27AdNzF8epRVr3UO0NwfSF1RDfck9PeJGgulI5sEX6K+veyf03lbql8
	 GQpAW5LhukYoHB0rp/Frog5hZ+6WXNVzI7tC8HG7se2BoHdOHnfV8Ap8cYLauhGL2q
	 6qrJRRUP1y30e3EqiKmgdcnn9pGGxLWbDJgOLQgOS4LSCyxEtbmMaV5cpD1WuEwHQg
	 PHD8Sn+3flmlttsZb1Dq8EcliQ0KC1ABTm6H3HfCPqrz/rjRsknmeQx4nNaM2KtpRh
	 sTMvyKXQ/+RNA==
Date: Thu, 25 Sep 2025 12:06:40 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH 06/24] arm64: dts: qcom: glymur: Enable pdp0 mailbox
Message-ID: <bugtpjwk77lcpa4jjox62ulmy56nf6yykzpr2ryifqqpeig6gp@45lzpngcpo2z>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-6-24b601bbecc0@oss.qualcomm.com>
 <CAJKOXPc8NYrwSLbaFZ_tRVpgkYPUYhaMde77p1VBhqm9PLsGjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPc8NYrwSLbaFZ_tRVpgkYPUYhaMde77p1VBhqm9PLsGjA@mail.gmail.com>

On Thu, Sep 25, 2025 at 05:23:07PM +0900, Krzysztof Kozlowski wrote:
> On Thu, 25 Sept 2025 at 15:33, Pankaj Patil
> <pankaj.patil@oss.qualcomm.com> wrote:
> >
> > From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >
> > Enable pdp0 mailbox node on Glymur SoCs.
> >
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index 66a548400c720474cde8a8b82ee686be507a795f..ae013c64e096b7c90c0aa4cfc50f078a85518acb 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -4065,6 +4065,14 @@ watchdog@17600000 {
> >                         interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
> >                 };
> >
> > +               pdp0_mbox: mailbox@17610000 {
> > +                       compatible = "qcom,glymur-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
> > +                       reg = <0 0x17610000 0 0x8000>, <0 0x19980000 0 0x8000>;
> > +                       interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> > +                       #mbox-cells = <1>;
> > +                       qcom,rx-chans = <0x7>;
> > +               };
> 
> Again one node per patch. this is really pointless, please read
> submitting patches before posting.
> 

In this series I certainly agree with you.

This is most definitely part of the next patch, which is core support
that should have been part of the introduction of the CPU nodes in the
initial patch.

Regards,
Bjorn

> New Soc is one logical change. One.

