Return-Path: <linux-arm-msm+bounces-41124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749099E9A84
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 16:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D775281F54
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 15:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B551B4236;
	Mon,  9 Dec 2024 15:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hidenPXi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B8C1A239B;
	Mon,  9 Dec 2024 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733758235; cv=none; b=GdsIDq0TAw/CUui+wjcGo1Pic9L/dLKjiUZnQjFMpQ8/OwK+oADmafpFDGqK9iAuthPGCDQO+l8L1Gm1p2+XZut3nOYgfaR1o/Bxjt+0IUD/Ywc081NlUvL/CJWP5iRLroMI230zXy1nc53/cALAZtudd5x+XBiT46lJbSVhU2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733758235; c=relaxed/simple;
	bh=b7PzERVFQcDyxLyoYQXxu7ISxAaaElvwdHKLZeF8fGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNAY5XI/c+i+UX8JjcjjNdPT9Sctgw/JF3a4PzkLfI3hmZy7RAKVnVo8DAiSsyDYIUbjDsxhi7m4/IpCJTwMkd5IAc3T7dGD1ZFqcch7/Nu3kRw5ve4EXHXnhl5JQXyf+TEFoCr3jOhhnPBvfSNrdst9/Yp+uAKnpoTaRSA3/Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hidenPXi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD36C4CED1;
	Mon,  9 Dec 2024 15:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733758234;
	bh=b7PzERVFQcDyxLyoYQXxu7ISxAaaElvwdHKLZeF8fGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hidenPXixJSdsbpf34DXymjH0vYzwTrcqJkN4XJs0jZcOEyRF6p72OOGNgcUfNKyQ
	 +wukqv8cTs9tNADaUse/xlk7Re4zxJZHthI5VDAZOBoZt1QkYPS3xSdaQ87CrpVCT2
	 SMNuKZhx63mUbM/uMIQowCPe+5rQY46hIG2ZPI5AOHH9923Lc+1HsywzqrATmrKmNP
	 NM0hotE7GKxB2zCj/WNqvQo9Ty7F7eChKimyizJShqISoqwL0vRGN6nNxYk0R5/fpW
	 OsiJClP5HmY8TDECm6OXBZwhcRAXtaNH/oYXqf69iYIXnIHgkiVLrxi/QorBR4/Wta
	 GSkCJLN/ajEgA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tKfiW-000000006JE-0rDY;
	Mon, 09 Dec 2024 16:30:36 +0100
Date: Mon, 9 Dec 2024 16:30:36 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: x1e80100: fix USB OTG
 regressions
Message-ID: <Z1cNHOqlRk2Cxwvd@hovoldconsulting.com>
References: <20241209111905.31017-1-johan+linaro@kernel.org>
 <iw2c4fceyppf2w2gueevsqsz2z7hatbqo33vufx3veatprczu5@u4k3j2igy6ee>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <iw2c4fceyppf2w2gueevsqsz2z7hatbqo33vufx3veatprczu5@u4k3j2igy6ee>

On Mon, Dec 09, 2024 at 03:23:05PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 09, 2024 at 12:19:03PM +0100, Johan Hovold wrote:
> > A recent change enabling OTG mode on the Lenovo ThinkPad T14s USB-C
> > ports can break SuperSpeed device hotplugging.
> > 
> > Abel noticed that the corresponding commit for the CRD also triggers a
> > hard reset during resume from suspend.
> > 
> > With retimer (and orientation detection) support not even merged yet,
> > let's revert at least until we have stable host mode in mainline.
> > 
> > Note that Stephan and Dmitry have already identified other problems with
> > the offending commits here:
> > 
> > 	https://lore.kernel.org/all/ZxZO6Prrm2ITUZMQ@linaro.org/
> > 	https://lore.kernel.org/all/hw2pdof4ajadjsjrb44f2q4cz4yh5qcqz5d3l7gjt2koycqs3k@xx5xvd26uyef

> > Changes in v2
> >  - revert also the corresponding patch for the CRD which breaks suspend
> 
> As you are reverting two commits, please revert the third one too, it
> breaks pmic-glink.

Can you be more specific? 

I was gonna say that pmic_glink works since hotplug and orientation
detection still works, but I tested now with DP altmode and that is
indeed broken unless I revert the third commit (f042bc234c2e ("arm64:
dts: qcom: x1e80100: enable OTG on USB-C controllers")).

Was that what you had in mind? Can you explain why that breaks?

I'll respin with a v3, but please answer the above first.

> > Johan Hovold (2):
> >   Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports"
> >   Revert "arm64: dts: qcom: x1e80100-crd: enable otg on usb ports"

Johan

