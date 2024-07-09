Return-Path: <linux-arm-msm+bounces-25578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB97E92B35C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 11:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B2E3282418
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 09:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5F61534FD;
	Tue,  9 Jul 2024 09:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6xu6d/E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE016146016;
	Tue,  9 Jul 2024 09:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720516429; cv=none; b=J/rraF1EbDwU4Rf7RRUS+winlwraPHRLxE/6Fm+7zoftAr83+lhJa/6JlsDJThJW/cSgRdno6wq4ZTZQjMEqxS2QkmHuFXPy1SbKmzeBThb1RtjMJg7lLU+5swClVBcgoS2AK4Sk+Rz5wlel2Eu4O2idxcp+UF/qMgiTsZrIgzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720516429; c=relaxed/simple;
	bh=x1XdS8sKH3KmEUOLFiabC/tDkWsyh/TjaOkJAyqIhoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grTaOp3apTvch+czGA+gd18Gd0j0CqaPIh2skSiADwClsZIIU+FPQm4emsVUeLgIgSxgpUuTlJFugzS7YIe5mpN5e9mej7UF29i/Y+C9015JTQGnnuMOIJkI/9Bl7ZxdJDQfQfX+pswR/AaBf3lIP4gphM60Hv3weVePV2gN7gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6xu6d/E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D00C3277B;
	Tue,  9 Jul 2024 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720516429;
	bh=x1XdS8sKH3KmEUOLFiabC/tDkWsyh/TjaOkJAyqIhoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X6xu6d/Ecbt8NTFXeHQHt3J9nvPLV1A3Gf4kg2p0zaScrAite9J269SEnxil95dHK
	 C/mG/2nGWeSL4pmSia13hpy/XzR4DLke+XwP9xiPWWr96dJg3goQMS8wNBXQSbTT0Q
	 z8WBJgS9EEs/dmAw7xSXxkTHQ+XkPZIp50pwemRBbc1zZJUSWRdsdcX0y0mTpaDejq
	 6GOZB/o380b7TipD4IjkzhI3dqR9/4TPFx7bwZs8365fYFwUNvIFzjLhMnNXvvMED1
	 niEL4bgzbRiXwdEyCC0KSOf6IhdiD3Vz+dlhQFZjz+QEVuVCzSTdkuXhIWftIAuoP7
	 RqH5jSv9ZdsnQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sR6v4-0000000055L-158T;
	Tue, 09 Jul 2024 11:13:55 +0200
Date: Tue, 9 Jul 2024 11:13:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, jassisinghbrar@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com,
	conor+dt@kernel.org, quic_nkela@quicinc.com,
	quic_psodagud@quicinc.com, abel.vesa@linaro.org
Subject: Re: [PATCH V6 5/5] arm64: dts: qcom: x1e80100: Enable cpufreq
Message-ID: <Zoz_UmPBWKHA37Kq@hovoldconsulting.com>
References: <20240612124056.39230-1-quic_sibis@quicinc.com>
 <20240612124056.39230-6-quic_sibis@quicinc.com>
 <ZoQjAWse2YxwyRJv@hovoldconsulting.com>
 <f53bc00f-8217-1dc8-5203-1a83c24d353d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f53bc00f-8217-1dc8-5203-1a83c24d353d@quicinc.com>

Hi Sibi,

On Wed, Jul 03, 2024 at 01:29:11AM +0530, Sibi Sankar wrote:
> On 7/2/24 21:25, Johan Hovold wrote:
> > On Wed, Jun 12, 2024 at 06:10:56PM +0530, Sibi Sankar wrote:
> >> Enable cpufreq on X1E80100 SoCs through the SCMI perf protocol node.

> > This series gives a nice performance boost on the x1e80100 CRD, but I'm
> > seeing a bunch of warnings and errors that need to be addressed:
> > 
> > [    9.533053] arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:0] - ret:-95. Using regular messaging.
> > [    9.549458] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > [    9.563925] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > [    9.572835] arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:1] - ret:-95. Using regular messaging.
> > [    9.609471] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > [    9.633341] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > [    9.650000] arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:2] - ret:-95. Using regular messaging.
> 
> X1E uses fast channels only for message-id: 7 (level set) and regular
> channels for all the other messages. The spec doesn't mandate fast
> channels for any of the supported message ids for the perf protocol.
> So nothing to fix here.

I didn't look at this in any detail, but if the firmware is spec
compliant you should not be spamming the logs with warnings. Not sure
how best to address that, but you could, for example, add a quirk for
qcom fw or at a minimum demote this mess to info level.

Also the failure to add oops_by_lvl appears to be a separate issue (e.g.
related to the duplicate entries).

> > [    9.727098] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
> > [    9.737157] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
> > [    9.875039] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
> > [    9.888428] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
> 
> The duplicate entries reported by the perf protocol come directly from
> the speed bins. I was told the duplicate entry with volt 0 is meant to
> indicate a lower power way of achieving the said frequency at a lower
> core count. We have no way of using it in the kernel and it gets safely
> discarded. So again nothing to fix in the kernel.

Again, you should not be spamming the logs with warnings for things are
benign (e.g. as it may prevent people from noticing real issues).

Also these duplicate entries do not seem to get safely discarded as they
result in a bunch of operations failing loudly at boot (e.g. the
oops_by_lvl warning above) and similarly at resume as I recently
noticed:

[   42.690569] CPU4: Booted secondary processor 0x0000010000 [0x511f0011]
[   42.704360] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
[   42.737865] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
[   42.752943] debugfs: File 'cpu5' in directory 'opp' already present!
[   42.759956] debugfs: File 'cpu6' in directory 'opp' already present!
[   42.766641] debugfs: File 'cpu7' in directory 'opp' already present!
...
[   42.855520] CPU8: Booted secondary processor 0x0000020000 [0x511f0011]
[   42.865188] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
[   42.898494] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
[   42.913559] debugfs: File 'cpu9' in directory 'opp' already present!
[   42.920265] debugfs: File 'cpu10' in directory 'opp' already present!
[   42.927029] debugfs: File 'cpu11' in directory 'opp' already present!

Perhaps you can find some way to filter out the unused, duplicate
entries for qualcomm fw so that all of these issues go away.

> > [    9.913506] debugfs: Directory 'NCC' with parent 'pm_genpd' already present!
> > [    9.922198] debugfs: Directory 'NCC' with parent 'pm_genpd' already present!
> 
> Yeah I did notice ^^ during dev, the series isn't the one introducing it
> so it shouldn't block the series acceptance. Meanwhile I'll spend some
> cycles to get this warn fixed.

I didn't try to track down where this comes from, but figured it could
be related to the duplicate entries. Either way, these are actually
errors (not just warnings) that need to be addressed in some way.

Johan

