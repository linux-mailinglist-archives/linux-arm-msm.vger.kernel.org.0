Return-Path: <linux-arm-msm+bounces-69015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF742B24FA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 068353A9521
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 16:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8EC286D6B;
	Wed, 13 Aug 2025 16:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w7mlNFqv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6100428643E;
	Wed, 13 Aug 2025 16:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755101964; cv=none; b=sLBQBxFBtucWqHorfgr0SSVbxQ1YMprUqy3hLxlOC+wMONz7PmAvHP9KpcMqXhcp2cfJyUkoyn3SZmQCX6hIpRAj4bWbeRdVqyAYLsq/EMU49FSofuv+x6lVZ45lHwF89xvX2+1f5qi0pl1OvWmxolDl359mNqksNX8ZO31LgfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755101964; c=relaxed/simple;
	bh=sb9I6gZ698T0YMzdob5qzS5OmWKkhnJooYHE0jSsT9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5LAO1siq+zrNzPN7Y7GmST7wUNJKsKfs3iRM+prsZTIQEQTRv2bA+pif9JNT5/woa0EsXKrd1gqLu4FHHmCEdIU7QZ39DDLBdhZR2Bh4bfZ/EXQnBRap3k7bqYVvF9/5ldzdsD6Zi/vWlF8DcPyQo/2JcQQ1TjGxDSbePMIpsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w7mlNFqv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A67C4CEEB;
	Wed, 13 Aug 2025 16:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755101964;
	bh=sb9I6gZ698T0YMzdob5qzS5OmWKkhnJooYHE0jSsT9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w7mlNFqvZF9pEhNTxGRTYgiBZ4jO2B2ma2KuB96pBAu9Vy85606aBUmLEdTa2hrFD
	 Az3VfGGGnk+fETyXkRDdxOKpwgYyZKBQ+rpu/wAUFME2dxOJK1OCXoTTfHsJ/w7NCG
	 n1FVrcVsIPS0kDZtqqK5GTrLZ6HsQ30X22dq/8sU=
Date: Wed, 13 Aug 2025 18:19:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, sboyd@kernel.org,
	mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, quic_rjendra@quicinc.com,
	taniya.das@oss.qualcomm.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
Message-ID: <2025081338-backwash-oak-0677@gregkh>
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
> Or drop the Copyright statement complete to avoid any questions.

Note, we don't take legal advice from the FSF :)

That being said, any/none of the above is just fine, there's not even a
requirement for a copyright line at all.  It's up to the author of the
file as to the format for what they want to do in the end, none of it
matters to the actual existance of the copyright itself, which is
implicit with or without a copyright line.

thanks,

greg "I talk to too many lawyers" k-h

