Return-Path: <linux-arm-msm+bounces-75129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 284EFB9FD3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 16:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0D051C267BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE249286885;
	Thu, 25 Sep 2025 13:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8GIzLqd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAD7286429;
	Thu, 25 Sep 2025 13:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758808679; cv=none; b=hSRZ0fmecX8bZDi0dHBrUSWbbY9U6l285UTbFoL15Kj5X9WVS743UQmYsHIYRIFo+X96NAvTpy2UGauj/viIwK/L5cXnqro9B6tML5hTGSThe+yxMvOFtCcZbbKTY9gEcRXCn3MGjmNAPZ/+s8AHbSydJedeMX4QFOMys0cEwlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758808679; c=relaxed/simple;
	bh=ul5hTKXU0p0dHakS2dh4PrhYg1610/K+8jal1vsHoHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzzB0wUXyVbuOO8b0yEXQ5RbVWklPeB0qL7ZaSvVsdVZ/H4mKB1HhkEOVsA0ebQDvoEZC4Cut6gbgbGI3+x4W5wt/DXPzcDm4aPv3W7zNSa1h/AWekYj2as/YdSryox4xA+Lw2P6RMbRIjxBScvJKewM+Rthe+xd44lEelMpyfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8GIzLqd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F4EC4CEF0;
	Thu, 25 Sep 2025 13:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758808679;
	bh=ul5hTKXU0p0dHakS2dh4PrhYg1610/K+8jal1vsHoHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O8GIzLqd5+u5IYxNOzM58b8/lJETDBPoK9EvxGzr0vwVZJS7BhGf77i3LtjGIuG/h
	 mZE6H9d0Kw0GpcdmArxMbUxZpBI9ku9xJGX+g51khr62j+v9Ri/QznsT6+ixfbIhX3
	 QRSCxvgm4vVO+dbVc9rPB/+g1Qp3LjZBeAWp/wIUGpN6qeXLd2KeWbwwIrHqpmtbTe
	 rkcfCm4GJGR0/EeE6ig+LFU34c2s0gnmrsn1vzo9rHSMxU275yqNGfmrB9IsZe/r9+
	 aQdjtjQS/3FV1CDDnTXFWeGh3KbtzbEwlZCKrGaS/U1lT+RXPcsyCH4UE8arQ9xTth
	 p1bQcKJO+weiA==
Date: Thu, 25 Sep 2025 08:57:56 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Subject: Re: [PATCH 06/20] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
Message-ID: <3up4xqgd2ay3tex4ckzgews3ukyrdikcmgk7tbddggj3s5gt4d@foqcpnfptjk7>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com>
 <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>

On Thu, Sep 25, 2025 at 10:50:10AM +0900, Krzysztof Kozłowski wrote:
> On Thu, 25 Sept 2025 at 09:17, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
> >
> > From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> >
> > Add the base USB devicetree definitions for Kaanapali platform. The overall
> > chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> > (rev. v8) and M31 eUSB2 PHY.
> >
> > Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 ++++++++++++++++++++++++++++++++
> >  1 file changed, 155 insertions(+)
> >
> 
> 
> Second try, without HTML:
> 
> I really don't understand why you created such huge patchset.

Because I looked at the logical changes that went into the big squash
that was initially planned, and requested that some of those was kept
intact - because they where independent logical changes.

> Year
> ago, two years ago, we were discussing it already and explained that's
> just inflating the patchset without reason.
> 

We used to add things node by node and that was indeed not
comprehensible. Overall this adds features in large logical chunks, but
there are a few of the patches that could have been squashed.

> New Soc is one logical change. Maybe two. Not 18!

I can see your argument for one patch to introduce the soc. But two
doesn't make sense, because that incremental patch is going to be the
kitchen sink.

> 
> Not one patch per node or feature.
> 

Definitely agree that we don't want one patch for every tiny block!

> This hides big picture, makes difficult to review everything,
> difficult to test.

The big picture is already obscured due to the size of the content
added.

Comparing to previous targets, I see the baseline content in 2-3
patches, and the remainder of the series being things that usually has
been scattered in many more small changes in the following weeks or
months.

There's plenty of features in this series that are yet to be concluded
for SM8750.

> Your patch count for LWN stats doesn't matter to
> us.

I agree with this. That's why the QRD is 1 patch, and MTP is 4 (this I
think should be squashed to 2) - compared to 13 patches for across the
pair for SM8750 with less scope.

> 
> NAK and I'm really disappointed I have to repeat the same review .

I'm not sure what you're disappointed in, this initial series is larger
than any we've seen before. I really like the work Jingyi has done here,
aggregating the otherwise scattered patches into one series.

Regards,
Bjorn

