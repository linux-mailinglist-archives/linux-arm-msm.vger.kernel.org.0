Return-Path: <linux-arm-msm+bounces-36750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EE39B92F7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 15:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E2581F22312
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 14:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9FE15B984;
	Fri,  1 Nov 2024 14:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diXmQORl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5A128FC;
	Fri,  1 Nov 2024 14:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730470796; cv=none; b=mDw5HAZ7560ZMwD0rhHrBgLgH0xZmG3Vql9XYBTzMPnD48Nk9nFxn+406fslPJyzH/Y2Fy5tiGHm00+44GmTp47u8bN8dMPa1OlIwhBMbXBiCH4sMDJ99gTsGVjGv5C4Wmz42wFAwdLQi77QnxAUnJ98Hakos6UpjIaka8i7KxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730470796; c=relaxed/simple;
	bh=qrDA1YUalmIWvKQ9oyoGv4dY1wULum5fbavYfL1SsJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWCOwASVyMsJcBowWuJ72UV99RXwC6zC6NP/NBobtuB6yuF8qCBSU8DZFaLydePwxRAlk5VnT8DHImwQpR9jEYR8fyOW/jf3mhneI2Y0ZLqqXp2xtzX/OxmByMKJrYm3kVVDpwSYq7vY2AcmGmVnir2vVwbjoY5SrZBdi4erUFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diXmQORl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC62C4CECD;
	Fri,  1 Nov 2024 14:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730470795;
	bh=qrDA1YUalmIWvKQ9oyoGv4dY1wULum5fbavYfL1SsJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=diXmQORlUEm1YN1GF6mcmELDq9pWW7q7kZUH1RYHUZykRcJQf2t8g34NTs9FUvIbm
	 kXnikF562assvIA6XZ44TiuLvGPq5/apUJccsB7g19kJeeJMg6Iw6Kal14LvmJXj71
	 X/V1LIe4S76efTxJaP7dVqk4KycXlivjbyHMCaltIPD2uhte7m1xcUpdASJDTvBSVy
	 EuYhPNXZN9/a2ShwvzeXQmcfLipm0cZ9nGB1KZ95u6P0y1XoNPtA96Q7M1zHj/Hiyx
	 DixOuZ/laep1bWaMthhT4yvEE0a1d780cYjt/ii9/Df0MVFVNcqh1c4eUnhP2E7LfS
	 Y5wUhEHhBYT8A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t6sVG-000000005pt-12g2;
	Fri, 01 Nov 2024 15:19:54 +0100
Date: Fri, 1 Nov 2024 15:19:54 +0100
From: Johan Hovold <johan@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	quic_nkela@quicinc.com, quic_psodagud@quicinc.com,
	abel.vesa@linaro.org
Subject: Re: [PATCH V7 0/2] qcom: x1e80100: Enable CPUFreq
Message-ID: <ZyTjiiGc2ApoID9Y@hovoldconsulting.com>
References: <20241030130840.2890904-1-quic_sibis@quicinc.com>
 <ZyTQ9QD1tEkhQ9eu@hovoldconsulting.com>
 <86plnf11yf.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86plnf11yf.wl-maz@kernel.org>

On Fri, Nov 01, 2024 at 02:08:24PM +0000, Marc Zyngier wrote:

> I'm seeing similar things indeed. Randomly grepping in cpufreq/policy*
> results in hard resets, although I don't get much on the serial
> console when that happens. Interestingly, I also see some errors in
> dmesg at boot time:
> 
> maz@semi-fraudulent:~$ dmesg| grep -i scmi
> [    0.966175] scmi_core: SCMI protocol bus registered
> [    7.929710] arm-scmi arm-scmi.2.auto: Using scmi_mailbox_transport
> [    7.939059] arm-scmi arm-scmi.2.auto: SCMI max-rx-timeout: 30ms
> [    7.945567] arm-scmi arm-scmi.2.auto: SCMI RAW Mode initialized for instance 0
> [    7.958348] arm-scmi arm-scmi.2.auto: SCMI RAW Mode COEX enabled !
> [    7.978303] arm-scmi arm-scmi.2.auto: SCMI Notifications - Core Enabled.
> [    7.985351] arm-scmi arm-scmi.2.auto: SCMI Protocol v2.0 'Qualcomm:' Firmware version 0x20000
> [    8.033774] arm-scmi arm-scmi.2.auto: Failed to add opps_by_lvl at 3801600 for NCC - ret:-16
> [    8.033902] arm-scmi arm-scmi.2.auto: Failed to add opps_by_lvl at 3801600 for NCC - ret:-16
> [    8.036528] arm-scmi arm-scmi.2.auto: Failed to add opps_by_lvl at 3801600 for NCC - ret:-16
> [    8.036744] arm-scmi arm-scmi.2.auto: Failed to add opps_by_lvl at 3801600 for NCC - ret:-16
> [    8.171232] scmi-perf-domain scmi_dev.4: Initialized 3 performance domains
> 
> All these "Failed" are a bit worrying. Happy to put any theory to the
> test.

Yes, those warnings indeed look troubling. Fortunately they appear to be
mostly benign and only indicate that the firmware is reporting duplicate
OPPs, which the kernel is now ignoring without any other side effects
than the warnings.

The side-effects and these remaining warnings are addressed by this
series:

	https://lore.kernel.org/all/20241030125512.2884761-1-quic_sibis@quicinc.com/

but I think we should try to make the warnings a bit more informative
(and less scary) by printing something along the lines of:

	arm-scmi arm-scmi.0.auto: [Firmware Bug]: Ignoring duplicate OPP 3417600 for NCC

instead.

Johan

