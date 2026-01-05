Return-Path: <linux-arm-msm+bounces-87518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B05CF475E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 16:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E3493083614
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 15:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BF1334374;
	Mon,  5 Jan 2026 15:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lgya+Il4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9208333752;
	Mon,  5 Jan 2026 15:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626578; cv=none; b=IsW5rtmm1B5iA3822GbdlIwRB/VXwpswnAhkQC3BB0R0Pdz4ZEXsb4wXCAoFzEW6gqW5aquZMEKrX4kV9uSL16SRRFViy+SwQEdVxqHVw1oRsINQbZcBPG8a0yE4EmnefqRjxU2XcQgZcClq6nlZc45j7cjFwAvfUiYVNevdWA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626578; c=relaxed/simple;
	bh=bxUzo+1ReaHyQigoZhL9fTu17hm8HObwUVIiB/M4Bo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKCkMaTdZHvhzuFAThdmcbcjO0dm7mpGbI1rlzZr67a4Ve3Z/SFMmb4RndRj9fC9HG3IuYkCExhalxsvOpKCVMUl7yhEfBuaqWVuGKVFN/2aj8e+G3iiHzyfQksA3lUOmYQu66xhF7xZlpsZsLrn5pfU7bYqLVL++yIeQimbCO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lgya+Il4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A655C116D0;
	Mon,  5 Jan 2026 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767626578;
	bh=bxUzo+1ReaHyQigoZhL9fTu17hm8HObwUVIiB/M4Bo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lgya+Il4Y+c4ThdtVuzO8nNpowcCLeI4Sscv7ITyI6jQE/OFq6i5ZJgWZDUphG+Wk
	 CcO64MVpqv26qRSrOikNCvxBR67vQIy3MG/99aVCyu3ofVqLZZ/QCUBXWK56bdnN7x
	 S3pCT7IK/52x9fdFeEcnquA1+FmPP8ijdF1IK6G0s4hnCQ3lT0Mntt3AHdTBUfCJ6b
	 XF6NClEp84XRNLQc9zui0RV4QZm/Idjx2dYvsGT8C8v45+hiRAfa1uK3IOOC61Ccz0
	 aT6OXixLrwZxWYyxWbKVkDFae1fnbytAi2CodaIueDM+GTql95G3YtBX10UWMkNPJj
	 AroCUX7VURsxA==
Date: Mon, 5 Jan 2026 09:22:54 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: Add TSENS and QUPv3
 serial engines
Message-ID: <hezcpngxf5lyopkvzh5b7f66jr5f6bjowphigviqimadpcgpbs@ki7qfxs52ynv>
References: <20251225-knp-dts-misc-v2-0-a8a8a31fd528@oss.qualcomm.com>
 <20251225-knp-dts-misc-v2-2-a8a8a31fd528@oss.qualcomm.com>
 <fc67634b-d47e-452b-bbad-35884b75d0b7@oss.qualcomm.com>
 <175e9c72-bde2-4351-a429-7d88d255100c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175e9c72-bde2-4351-a429-7d88d255100c@oss.qualcomm.com>

On Mon, Jan 05, 2026 at 04:24:19PM +0800, Aiqun(Maria) Yu wrote:
> On 12/29/2025 9:12 PM, Konrad Dybcio wrote:
> > On 12/26/25 4:06 AM, Jingyi Wang wrote:
> >> Add new features on the Kaanapali Platform including:
> >>
> >> - Temperature Sensor (TSENS) and thermal zones
> >> - QUPv3 serial engine protocols with 5 I2C hubs and 24 QUP serial engines
> >>   across 4 QUP wrappers, each with support of GPI DMA engines.
> >>
> >> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> >> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> >> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> >> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> > 
> > Since the base DT is now merged, all subsequent patches are
> > supposed to be patch-sized, i.e. usually scoped for one feature that
> > makes sense. This one happens to be an arbitrary concatenation of two
> > separate ones. Were they separate, the original authors would benefit
> > from the full attribution and they would be easier for us to review
> 
> Hi Konrad,
> 
> Are you suggesting to split this patch into 3 function independent
> patches here?
> 

As far as I can see, you already have 3 independent patches here
(stuffed in 2 patches) - they don't overlap, they don't depend on each
other. So, yes this would be easier to handle as separate patches.

I would still like to see dependent patches be gathered and sent
together in a patch series.

For example smp2p + remoteproc + glink are owned by different teams, but
there's no benefit to merging only smp2p, or only smp2p + remoteproc. So
seeing all three (or more) parts in one series would be preferred (one
patch would also be accepted).



Regardless of who sends these patches or how this is done going forward,
this patch 2/2 is two separate, independent patches. Or you need to
describe why they belong together - what is the connection between tsens
and QUP? (I presume none)

Thanks,
Bjorn

> The current dt series is to ease the maintainers' effort to have an
> organized patch in one series in below manner:
> 1. And the series of the dt change will only have all dependency cleared
> functionality in this series.
> 2. dt maintainer won't have any conflict when apply.
> 3. we will suggest developers can do it's own upload when basic
> dependencies like mm-clock and pmic dependencies are all applied.
> 
> Are you suggesting splitting this patch into three independent
> functional patches here?
> The current DT series is designed to simplify maintainers’ efforts by
> keeping the patches organized within a single series, structured as follows:
> 
> 1. This DT series will include only functionality where all dependencies
> have been reviewed-by at least.
> 2. DT maintainers will not encounter conflicts when applying these patches.
> 3. We will recommend that developers upload their own patches once the
> basic dependencies—such as MM-clock and PMIC—have been applied.
> 
> This reflects our discussion with Bjorn and serves as a lesson learned:
> even with a Reviewed-by tag, patch application can be significantly
> delayed when the DT series involves a highly complex dependency chain.
> 
> > 
> > Konrad
> 
> -- 
> Thx and BRs,
> Aiqun(Maria) Yu

