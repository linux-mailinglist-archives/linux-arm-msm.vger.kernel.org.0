Return-Path: <linux-arm-msm+bounces-28596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0674C952AE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 10:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 503B1B21295
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 08:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39C31B580D;
	Thu, 15 Aug 2024 08:21:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5689317A5A6;
	Thu, 15 Aug 2024 08:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723710093; cv=none; b=Sw7nxZb51nBWQDY0Flg24IrW/VaqfPQARmwA3o20NZAguegA2GVdJWFViKWG57Q0ZRDkIv7u0WeYYAC7ECUVUNx5YGDxN4x5xA1pMwsqCSsF0elPgP0Lm7eD1K7+JubnQphBzE9uqli+y91U6D4MSOtYLJirge7laYVBTA8oP4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723710093; c=relaxed/simple;
	bh=/pPh8qR30Wcev5n42INP+3QFr5gaNEiRhrEWoeofknw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCi/actTlBxkx6+td6uiOMPnmwNTtk8x6grJY5okyBy8eYuU3OVHRZGN4HGPVBzj7+rnFt0/Z2v2At+GxgfpYOTC2c6fyakiOaeIvDPZiWh24zV9Ec4hSgHbDC+FtfoD48wm391EEvZosqH9e2vcga3XVvQzzmcZX+lfZaWTnFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 15f898b3;
	Thu, 15 Aug 2024 10:21:27 +0200 (CEST)
Date: Thu, 15 Aug 2024 10:21:27 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: Add Samsung Galaxy Book4 Edge
 Makefile
Message-ID: <fvav32kau7odwdlyeeeq4vodaalyiodysswcjozjhlxdbtepu7@gr5oj32eh6nq>
References: <qv5pz4gnmy5xbxxjoqqyyvn4gep5xn3jafcof5merqxxllczwy@oaw3recv3tp5>
 <mtyjmbhqv5otvxhxyyvkxg6tubmtkeouwibmsmywmjdamnqnus@mow2w5trrmok>
 <Zr2sIAhB1i7akCCc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zr2sIAhB1i7akCCc@linaro.org>

On Thu, Aug 15, 2024 at 10:20:00AM +0300, Abel Vesa wrote:

> On 24-08-14 23:14:51, Marcus Glocker wrote:
> > Add the new Samsung Galaxy Book4 Edge to the Makefile to compile the
> > DTB file.
> > 
> > Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
> 
> This should be squashed into patch 6.

OK, I'll submit a v3 patch.
 
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 0e5c810304fb..77a48a5780ed 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -265,3 +265,4 @@ dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-samsung-galaxy-book4-edge.dtb
> > -- 
> > 2.39.2
> > 

