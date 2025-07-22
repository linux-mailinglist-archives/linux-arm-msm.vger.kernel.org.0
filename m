Return-Path: <linux-arm-msm+bounces-65976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEEEB0D049
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 05:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71008540E9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 03:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71FD27380E;
	Tue, 22 Jul 2025 03:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Edum0jjp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931BB22EF4;
	Tue, 22 Jul 2025 03:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753154936; cv=none; b=USs7gsCOcjRW2UCCUJVKHZmb+K+qUtLkxnTC5hKFfXGvrjuLsoP2O6w6eOkVRPrYKwonNZCkLUsMsqHjroWKmhFhp5YURNpb0hWMHS60po2GS73F2RfouRdUxsAAViHzmH90Ar49tK8EjCiDONh7vDbQgfUzpjs+urJqD+nhI3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753154936; c=relaxed/simple;
	bh=kJw5y/pTKzs+28qiU9DcV11vaetOeUeIzA0KMoRkwUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2jrxV716qxrFntqUGpMZJeitaJ81Rj6DDUcitdo2Kqfjo52fA8/7sgrNYwgLH4IfHYHRx42O7dT/XFPprmrvSENYRzKmw4TvY2sNgYwtXSUHP8e+8F04/G0LOabjOudprzEJKHoBWEartPkeYtJg5IKkaNE3RVsdHbiZYMxv7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Edum0jjp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46001C4CEEB;
	Tue, 22 Jul 2025 03:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753154936;
	bh=kJw5y/pTKzs+28qiU9DcV11vaetOeUeIzA0KMoRkwUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Edum0jjpxzTw1Zcr2ZQfQ0YJBn/OKDz+KbEw5VRXLgEdjSdKnBi6XXMdg7DVQzqLG
	 tMp8xDDOyh4+W99O6mWTg2zIOWBZB5A5cx84e6XAVUGo9Sx8uu7zpQuUKOU/LxLKYR
	 tTFvO6bWDFg9nEGElUDe08AU+7CdAA9x/RtWYUSgPpIpNQ+OZuWZkx+VKVp0IKXVMT
	 3Tvau/AomJ0IvUErTDQ72XDptrcqnAyiHhDYI6TM2zoxbqBRjkmqfGI4mZYLnvax6T
	 7sJJsDhATA2CnSMSrQujEcNcv8YoLHbJeHEUpPieQES+as6qoCnnZYUEToAJaBzgN4
	 ZmxVNXVja1bUw==
Date: Mon, 21 Jul 2025 22:28:53 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, sboyd@kernel.org, 
	mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com, linux-clk@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
Message-ID: <digzi2kxw3aexslmyx3hspwjptrjm5yd4kzkgz6gg45inadmmr@6zerdpg5njdb>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-8-pankaj.patil@oss.qualcomm.com>
 <28ea2b11-a269-4536-8306-185bf272bd60@kernel.org>
 <2yekmjqihkzsfjr223vepigfj4hfruleigguhrlekp6s7riuxk@ta5kghr2kafi>
 <4559a710-8b4f-4988-b063-40486fe0ffe2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4559a710-8b4f-4988-b063-40486fe0ffe2@kernel.org>

On Sun, Jul 20, 2025 at 02:18:19PM +0200, Krzysztof Kozlowski wrote:
> On 20/07/2025 05:46, Bjorn Andersson wrote:
> > On Wed, Jul 16, 2025 at 06:28:15PM +0200, Krzysztof Kozlowski wrote:
> >> On 16/07/2025 17:20, Pankaj Patil wrote:
> > [..]
> >>> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
> >>> new file mode 100644
> >>> index 000000000000..a1a6da62ed35
> >>> --- /dev/null
> >>> +++ b/drivers/clk/qcom/gcc-glymur.c
> >>> @@ -0,0 +1,8623 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +/*
> >>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>
> >> Missing date.
> >>
> > 
> > Per updated company guidelines we don't want a year here. Please let us
> > know if you have any concerns with this.
> > 
> I remember the guidelines and they were about publishing your code, not
> about contributing to open-source projects. And whatever you have
> internally does not cover us at all. You can have internal guideline
> saying you need to buy me a beer or I need to buy you a beer. Does not
> matter.
> 
> That above copyright statement without date does not adhere to expected
> format. Explanation how this should be written:
> 
> https://www.gnu.org/licenses/gpl-howto.en.html#copyright-notice
> 
> The GPL-2.0 license in the kernel also uses date:
> 
> "Copyright (C) <year>  <name of author>    "
> 
> There is no option without date in the license or GPL faq. I am not a
> lawyer, so no clue whether this is what we want, but I also should not
> be my task to figure out whether different copyright statement is okay
> or not. It's your burden.
> 

It's the guidelines/directives from our lawyers that has been updated to
not include the year. I will bring this back for confirmation.
Thanks for the link.

> Or drop the Copyright statement complete to avoid any questions.
> 

That I don't think we can do for new files.

@Pankaj, please include the year as you resubmit this, until we get
other clarification on how to proceed.

Regards,
Bjorn

> Best regards,
> Krzysztof

