Return-Path: <linux-arm-msm+bounces-65765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20248B0B365
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 05:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C23F3A9E8D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 03:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180096A33F;
	Sun, 20 Jul 2025 03:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2D96vl8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84564A0A;
	Sun, 20 Jul 2025 03:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752983204; cv=none; b=fkfpgM4mII8hNbNpYp4zdERJW3xiwFkLRPqLNGK6V2wdLP5oCWEU25krE2bnl49Fa68yPsV77svbNpVy+0FFxEX/fz4t7Lk8CBE5oBARs3ADNE4d41YGOuQlgBVr5kfVJeAT0GXnVQReM7qM6ZIKO2wRTgHNOrmF6irNvgcNoBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752983204; c=relaxed/simple;
	bh=nziMocc3gkHfIR29eGSc5PIK7ow5ohnsvI0Znq9Uq5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhZn6UIfbOotPL0jA2xxl0uluhU2ojZwswmC2GSZTH1aHI1XljepVzg0TrnqbtPt03+qKzza9PT4ou7KQCZgSLja3HPvHr3s4MntyzgRULIzKWLu1vzsCCTsfkCByoy1AC2PXToM2lCxxk/bS8hutkjxmcfvxYT5inpMs4+5vqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2D96vl8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797C2C4CEEB;
	Sun, 20 Jul 2025 03:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752983203;
	bh=nziMocc3gkHfIR29eGSc5PIK7ow5ohnsvI0Znq9Uq5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W2D96vl8m9/coHeNpS1M7CM8GmaVc27Iekr8Q/M4+96VXOiZJEbwd4ptixaFvG0LB
	 kX2FVCJs3CZX6xdcRYkGf7KMaZO+moD2kgkmnCxASSgrDElgp2E01ZsnxjZcnl05Za
	 OM5vUOEk+ezp9wb4ovbdGJ9NtGygWgr9LQd2danCCtEkrHcNtMUg9YT47HBWMNWehz
	 hz05ITUJbrFCZ7xnolQF9d1Uer5Ac6VgyS65HRosrTreaOqjCl07msmgpb6syz21W9
	 9Sb4xO2alrEJhMCRnYWOHlqYNo3zQIKzuQ4A7JAUVR42g2c7Jb08E3L4sake5ykOEa
	 hEQKGgo8R8Kug==
Date: Sat, 19 Jul 2025 22:46:40 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, sboyd@kernel.org, 
	mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com, linux-clk@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
Message-ID: <2yekmjqihkzsfjr223vepigfj4hfruleigguhrlekp6s7riuxk@ta5kghr2kafi>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-8-pankaj.patil@oss.qualcomm.com>
 <28ea2b11-a269-4536-8306-185bf272bd60@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28ea2b11-a269-4536-8306-185bf272bd60@kernel.org>

On Wed, Jul 16, 2025 at 06:28:15PM +0200, Krzysztof Kozlowski wrote:
> On 16/07/2025 17:20, Pankaj Patil wrote:
[..]
> > diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
> > new file mode 100644
> > index 000000000000..a1a6da62ed35
> > --- /dev/null
> > +++ b/drivers/clk/qcom/gcc-glymur.c
> > @@ -0,0 +1,8623 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> Missing date.
> 

Per updated company guidelines we don't want a year here. Please let us
know if you have any concerns with this.

Regards,
Bjorn

