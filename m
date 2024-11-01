Return-Path: <linux-arm-msm+bounces-36739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D90529B916C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 14:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED3601C222C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 13:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49AF15F40B;
	Fri,  1 Nov 2024 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SisiSZ+w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7505E487A7;
	Fri,  1 Nov 2024 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730466040; cv=none; b=AkdDMZAX4f6lkhpOyYMxpjxM7XYr4iqT2q5zuwo09AP0uvc1dzJQg3N4yae08S6KD6HRgmS5FuV/JZayLDPxgVMztPOu+eMofz0Rczj6AymfSg7Frme3YDdXYnC5P/bD2SumNnDJo2gBUQbDta4OrYu8eTo5jxNRVYrWxMdbV14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730466040; c=relaxed/simple;
	bh=XsqCnaPPzlDesxEOpPpKNVuA4HIfGhlDq9l6KmS4VgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vD3pYV1Jd5DYfukfKElHfbAfNqBnoPkU3wAQhZFzdFjgWaYXu+Ds18hfbUxlELjJHW3FN4mrCId7+fJdlkl5MQDFOg72LJAsAL5NKd94QBWvLVLE6PjJH/1bLY8WnH6Ay938WIPVtPBIzqAcOTyjioZKPNWtijEHHG+rv/igafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SisiSZ+w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2F7C4CECD;
	Fri,  1 Nov 2024 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730466040;
	bh=XsqCnaPPzlDesxEOpPpKNVuA4HIfGhlDq9l6KmS4VgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SisiSZ+wnzMQECZC50Frko7lw2UpLwufIH3RodGcJWWKKeGpoURqnhH2RkD5Szz2J
	 CD0IHYfk1lDhxyn5e6CyvRhskDanvEboKaVv6cyLCDBz5HKoTk8PeiGMZY5np0ziPZ
	 Cez3gZBa+vDsQVsI5ss0KCp2CeAyw9RXzgA8Rz08l1RKNPqgOxf88/pOTF/Wh2HIbk
	 3HMVM2K+4/yyOjkXyF8mfXkALTPXCuaXiuKpqFF5602H432ozuqDSXDEUNFLs8UP2e
	 EgIwk2Vyi0TZYr4YlmYrql3yzCN5jqaf54PcjJcWfR3osMs12KS4e6rs17jZ/lM1dK
	 W3NxeE/JSs89A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t6rGX-000000004Ha-40Rk;
	Fri, 01 Nov 2024 14:00:38 +0100
Date: Fri, 1 Nov 2024 14:00:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	quic_nkela@quicinc.com, quic_psodagud@quicinc.com,
	abel.vesa@linaro.org, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH V7 0/2] qcom: x1e80100: Enable CPUFreq
Message-ID: <ZyTQ9QD1tEkhQ9eu@hovoldconsulting.com>
References: <20241030130840.2890904-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030130840.2890904-1-quic_sibis@quicinc.com>

[ +CC: Marc, who I think I saw reporting something similar even if I can
  seem to find where right now ]

On Wed, Oct 30, 2024 at 06:38:38PM +0530, Sibi Sankar wrote:
> This series enables CPUFreq support on the X1E SoC using the SCMI perf
> protocol. This was originally part of the RFC: firmware: arm_scmi:
> Qualcomm Vendor Protocol [1]. I've split it up so that this part can
> land earlier. Warnings Introduced by the series are fixed by [2]

 Sibi Sankar (2):
>   arm64: dts: qcom: x1e80100: Add cpucp mailbox and sram nodes
>   arm64: dts: qcom: x1e80100: Enable cpufreq

I've been running with v6 of these for a while now, without noticing any
issues, and just updated to v7 to be able to provide a Tested-by tag.

I wanted to run a compilation and see how the frequencies varied, but
before I got around to that I just grepped the cpufreq sysfs attributes
for CPU0 four times. And this triggered a reset of the machine (x1e80100
CRD).

The last values output were:

	affected_cpus:0 1 2 3
	cpuinfo_cur_freq:<unknown>
	cpuinfo_max_freq:3417600
	cpuinfo_min_freq:710400
	cpuinfo_transition_latency:30000
	related_cpus:0 1 2 3
	scaling_available_frequencies:710400 806400 998400 1190400 1440000 1670400 1920000 2188800 2515200 2707200 2976000 320
	scaling_available_governors:ondemand userspace performance schedutil
	scaling_cur_freq:806400
	scaling_driver:scmi
	scaling_governor:schedutil
	scaling_max_freq:3417600
	scaling_min_freq:710400
	scaling_setspeed:<unsupported>

Notice the <unknown> current frequency (the previous greps said 710400
and 2515200).

The last thing I see on the serial console, presumably just before
the reset, is:

	[  196.268025] arm-scmi arm-scmi.0.auto: timed out in resp(caller: do_xfer+0x164/0x564)

I just rebooted and grepped again and it triggered on the first attempt
(cur_freq also said '<unknown>'). Same error in the log, printed when
grepping.

Johan

