Return-Path: <linux-arm-msm+bounces-61520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE1DADBFA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 05:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EADC71890B44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 03:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D3713C816;
	Tue, 17 Jun 2025 03:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xa9T2VGj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A081EB2F;
	Tue, 17 Jun 2025 03:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750130334; cv=none; b=A5CGsOKAxXrUqxU6YiXD1NoJL/iEHOPmYUXIee6P7Bp2b/B+q+GXGppuB5TUWMXDRNs5UNXUe5UJOl6qGmKD5OPkjFDeLogH+SrS56z2TFxE3fDysj4C51Df5uteg4UPBLR1pIeNEOUfO4BtGLhdbV5OACDCSlbKMJDXFxxAwDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750130334; c=relaxed/simple;
	bh=ALZwaXmYqhLFDRldlSM9ss8w9shR+ct4nGkojL7p978=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dleX7ENC4IowRoVDMahSnVWytn7OeGdr5XxSSZkowbgQT84zbx5uS046C4w5k78+gBzkr5XnCIPUVYdYaxZxCFBdwLgw6PZSGU4YgapnvoptTl8jebfy0LiQQZHEyKdv2DFWCiHBEVzdhoYLj87iEtvrbp8I4furDiD7cuXMTC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xa9T2VGj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C693CC4CEEA;
	Tue, 17 Jun 2025 03:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750130333;
	bh=ALZwaXmYqhLFDRldlSM9ss8w9shR+ct4nGkojL7p978=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xa9T2VGjCYhthpBzI7FsyWMdxukjipcAs0MohIO4GzpxQx6JGqc2fjH75/IBC6KkD
	 vAxwMaJa8WGj+V1O0r1O8LiG7/+Gql7S0LUNbFhSA9HxsdyMKUQ7gUvx10osmpzJ9e
	 /vZEHpM5qNUQM9TtCn8GCjAlLGlCdNhlzp4+2iIp+sIoeoWx5dYf0ef0oR8JHO406R
	 GikxjsaVt5tyfpwZBPTQ8TPFzJd3mKG9uXSput5vxz2QkTSB2focPh8LIsMJ18YH0p
	 a3ZVRv8XoB/0w8xGUSpH2qg9ibrwAii3cdAjgWvUL/Ztg5vqYPXi5AbONFUf5upBih
	 I8vpf+1gf5HlA==
Date: Mon, 16 Jun 2025 22:18:50 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: add debug UART pins to reserved GPIO
 ranges on RB2
Message-ID: <vyr6s4wzw5jc5gt7mywu4s4xob6aeca5aclbe5tdr4v3yng2tn@yb7rn2b2btb7>
References: <20250616143341.51944-1-brgl@bgdev.pl>
 <713cd518-935f-4501-9753-d33c9ea6aef7@oss.qualcomm.com>
 <CAMRc=MceV-HgyFFvqytXAiuY+y10PQbdPBxuvd57NCeSLVLXCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MceV-HgyFFvqytXAiuY+y10PQbdPBxuvd57NCeSLVLXCg@mail.gmail.com>

On Mon, Jun 16, 2025 at 06:43:16PM +0200, Bartosz Golaszewski wrote:
> On Mon, Jun 16, 2025 at 6:20 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 6/16/25 4:33 PM, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > GPIO12 and GPIO13 are used for the debug UART and must not be available
> > > to drivers or user-space. Add them to the gpio-reserved-ranges.
> > >
> > > Fixes: 8d58a8c0d930c ("arm64: dts: qcom: Add base qrb4210-rb2 board dts")
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> >
> > That also makes them unavailable to the kernel though, no?
> >
> 
> Yes. They could only be used by QUP - I2C or SPI #4 - on sm6115 but
> none of these are used on RB2. I just noticed that my console froze
> when I accidentally requested GPIO12 and figured that it makes sense
> to make them unavailable. Let me know if this should be dropped.
> 

I'm guessing that this would be a problem for any pin that is used for
some other function. Should we instead prevent userspace from being able
to request pins that are not in "gpio" pinmux state?

Regards,
Bjorn

