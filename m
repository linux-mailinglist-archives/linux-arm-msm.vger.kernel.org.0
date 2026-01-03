Return-Path: <linux-arm-msm+bounces-87331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B411CF03DB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 19:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF86530184EC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 18:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2D22135CE;
	Sat,  3 Jan 2026 18:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fROJFNCy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0D7A41;
	Sat,  3 Jan 2026 18:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767463509; cv=none; b=KpspHlA58dJdK5/7VCD/z3oAoVPLcRAZM+aSbyu7ucjd3Fwqt6E+eRsyNVYbg2eWJHhjCHw/kBI4m1FsXJDI3tqPQ+aCqYPhYIQb/AO7LRLmKVBMCy028mWe40AN9Cvgfc3rBvBV5CqT/hm3w1aoQycU4RUjiLUxFR06zlrYEXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767463509; c=relaxed/simple;
	bh=g8ReXmrU8IuvdOUCobhu5aKDdhWoKpAKeqpS25K+hvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRmEvDhLyq0gvzzHbjhHqJEI42BDXoieDMxOJRBu6/519KmwpbQ9kGUq34d0G2a0QarLaool/h3kAfH47KcMBLXFm12iXwkloVP6/4N6VhCiIZy5pxOy0/BfcQMm2kvAxBlL5Wm0WdPIuSlUx4WUv6orSe4OX/90qBTSrtOchk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fROJFNCy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C615C113D0;
	Sat,  3 Jan 2026 18:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767463505;
	bh=g8ReXmrU8IuvdOUCobhu5aKDdhWoKpAKeqpS25K+hvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fROJFNCypO+o7ztNWl4M3y+QI3LMVBzo3tAVlGyPxY4K3W+PYNymqm+3vmri5kHSj
	 DfL+WzJIws34zRx4pWj6ydll/EvyvijR0c0XbNFgy9RAoL/hFIse5IJycIrnHWgcrM
	 Q3hi8LzG9XI0jzzBfp3CbdWidlBEVAqphbHnHPQjocQb6b4pz8UPrGLNOzEDb9ROk7
	 hJD/QOq1yXccmATdtUg5CJkxf5gnHHI+1lS5dXLyB67xtj9+OPslCuLbQCi94GaLfo
	 D9DOPBInED0lYTs6k8ixkw/wd9ax/HRseg/FPC/1WOrvm1mochgUGXaxzrkuXnPwH2
	 CP21kFA0Z4bKA==
Date: Sat, 3 Jan 2026 12:05:03 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Adjust tsens thermal
 zone configuration
Message-ID: <oekmcxiltaiynuwt2p4g2grae4gyud7vn5usw3v2cp4vwyfr5c@gg2x4lqvtd4n>
References: <20251215105934.2428987-1-manaf.pallikunhi@oss.qualcomm.com>
 <zf5ztvnzaf6tplpjpytwbhktrebdnst2doybuubp6rjfj2fjs7@t2ma4ylx67gx>
 <46cc0587-8eb6-4638-ad04-c05dcd56718c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46cc0587-8eb6-4638-ad04-c05dcd56718c@oss.qualcomm.com>

On Tue, Dec 16, 2025 at 01:01:01PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Dmitry,
> 
> 
> On 12/16/2025 1:21 AM, Dmitry Baryshkov wrote:
> > On Mon, Dec 15, 2025 at 04:29:34PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> > > The QCS6490 rb3gen2 board uses the same Qualcomm QCM6490 platform
> > Is there a difference between QCS6490 and QCM6490 or between QC[SM]6490
> > and SC7280?
> Difference is only for qcs6490-rb3gen2 (IOT ).
> > 
> > > but has a different thermal junction temperature specification
> > > due to package-level differences.
> > > 
> > > Update passive/hot trip thresholds to 105°C and critical trip
> > > thresholds to 115°C for various subsystem TSENS sensors.
> > > 
> > > Disable CPU cooling maps for CPU TSENS since CPU thermal mitigation
> > > is handled automatically in hardware on this board.
> > Is it a peculiarity of the RB3 Gen2 or is it that Chrome devices didn't
> > do it? What about QCM6490 IDP or FairPhone FP5?
> 
> Chrome devices do not perform automatic thermal mitigation, whereas all
> other boards handle it automatically. I will push another patch to disable
> cpu mitigation for all other boards other than chrome.
> 

This matches what we're doing everywhere else (i.e. rely on LMh/OSM/EPSS
to do the fast throttling of cores), so I'd expect that this should
apply to all non-Chrome boards...

Instead of doing this for every board, can we push the cpu/cooling-maps
into e.g. sc7280-chrome-common.dtsi?

If I understand you correctly, we'd still have the desire to adjust the
temperature values, but that's a smaller per-board change.

Regards,
Bjorn

> Thanks,
> 
> Manaf
> 
> > 
> > > Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 334 +++++++++++++++++++
> > >   1 file changed, 334 insertions(+)
> > > 

