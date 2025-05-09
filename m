Return-Path: <linux-arm-msm+bounces-57481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D4DAB1B51
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 19:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E5DF1BA0616
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 17:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794FF238166;
	Fri,  9 May 2025 17:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SiYb3N0J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490D420C030;
	Fri,  9 May 2025 17:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746810532; cv=none; b=rsDuUffRUSMHMLrxl+KjCseknN6NVbj3zMA/pILOJceZP+LJcLz+Egm8ILA2ToMObnsGW7KDS2qEdmdPAPVSEdLAcyctKwnoxAo/nGtsPtbGBuIDYCc9M3PcGAE//GGY+mI6gibaqifrG/rUYmfFRX3qNS74TERk6ztYZSnxb5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746810532; c=relaxed/simple;
	bh=gOabxqPVCCeC1bf1CjXU1L/Ezln0YWKVK5/9VrqkNVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLauhPiM77DeL85dstkpymmMN7pMzmlN/C0BatQnIY+n9ZoWLWFAedH0+I78val8wlUeVfwfWJPZCtiStJuJBfIVlQCU2KD666MUc2VGhKPunoYFQuv5mjvFMcEPxhAmm5LyYihIanI4D9mm0wcGzZTD1wdaDAXg7foFAcM4ITg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SiYb3N0J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D262CC4CEE9;
	Fri,  9 May 2025 17:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746810531;
	bh=gOabxqPVCCeC1bf1CjXU1L/Ezln0YWKVK5/9VrqkNVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SiYb3N0JM+KWd0Is4tyFI2b+RPtzYuFMBZ4qkF96hjMxjGKXr+eP5/ngvVC26GA6m
	 VZDMxMA1XF+oP310s+M9a3+EIN/db0geJaRDBfx1QmQz7K/3OY26N8rmK+rOcJtH6I
	 GivVOThm5Bj1a3SJEF8OkGZI5Q/294+mJnpGcjVXykBKXeHL862oU7X+sLSOBo+mJ9
	 +ItRE8q7uk8kjJH19/MEQXJG1RvURWTJJRjpQvpBNTog8It+f+CDkp0X2YkodPT7Qr
	 U14Vl25aiKU+1HN7VTHZwOxuLvpOTxj4RpXb7DN1Yw/DF4CXkvlPkMsVAbpVgOH5xD
	 eP2kfzxIguZaA==
Date: Fri, 9 May 2025 10:08:49 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, maud_spierings@hotmail.com, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: (subset) [PATCH v4 0/4] X1E Asus Zenbook A14 support
Message-ID: <pwbbwzqb3krnyqxzkch2wziqsnab47p575endvksa2tfudyqf5@wj6c4rzr6j2n>
References: <20250426130203.37659-1-alex.vinarskis@gmail.com>
 <174659505811.5380.3561194017032215136.b4-ty@kernel.org>
 <CAMcHhXq1-=JeNspAZ61W0JqtjPkoKSi2W1sL07hoVsqFu5T--Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXq1-=JeNspAZ61W0JqtjPkoKSi2W1sL07hoVsqFu5T--Q@mail.gmail.com>

On Wed, May 07, 2025 at 06:36:12PM +0200, Aleksandrs Vinarskis wrote:
> On Wed, 7 May 2025 at 07:18, Bjorn Andersson <andersson@kernel.org> wrote:
> >
> >
> > On Sat, 26 Apr 2025 14:57:56 +0200, Aleksandrs Vinarskis wrote:
> > > Introduce support for the mentioned laptop.
> > >
> > > Particular device exists in two model numbers:
> > > * UX3407QA: X1P-42-100 or X1-26-100 (as tested)
> > > * UX3407RA: X1E-78-100
> > >
> > > Mostly similar to other X1-based laptops. Notable differences are:
> > > * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
> > >   and Qualcomm FastConnect 7800 on UX3407RA
> > > * USB Type-C retimers are Parade PS8833, appear to behave identical
> > >   to Parade PS8830
> > > * gpio90 is TZ protected
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [2/4] dt-bindings: arm: qcom: Add Asus Zenbook A14
> >       commit: 9f2ae52acd5e6c95ddc55d1cc67f44860940a21b
> 
> 
> Thanks!
> 
> I saw 2/4, 3/4 were applied. Is there a reason 4/4 was left behind,
> eg. Does it have to go through different trees like 1/4?

The reason is that patch 1 still hasn't been merged, so patch 4 fails
dtbs_check at the moment. 

> I also saw that another later series with dtb changes for x1e devices
> [1] has landed, so 4/4 of the current series won't apply anymore...
> Would you like me to rebase & respin?
> 

Please resubmit patch 1 alone, so that it's convenient for USB
maintainers to pick it up.

Then once this binding change is in linux-next I can pick up patch 4.
Yes it would be convenient for me if you rebase it on top of [1].

Regards,
Bjorn

> Regards,
> Alex
> 
> [1] https://lore.kernel.org/all/174659597008.7675.2301017495937908497.b4-ty@kernel.org/
> >
> > Best regards,
> > --
> > Bjorn Andersson <andersson@kernel.org>

