Return-Path: <linux-arm-msm+bounces-30628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 763FD96B260
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 09:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDAC9B24D1C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 07:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB2313AD03;
	Wed,  4 Sep 2024 07:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DO6RB7ty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0461EC01C;
	Wed,  4 Sep 2024 07:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725433780; cv=none; b=WpU38/56ssHFOOB5n8ti8zEYjbC+/xKHasO2ic4xSn9sxSf+EYHCZYLjAAN4MKNHPGo9P/oXps7jBf7rGOJRQZBcJ531tt/j1Zlcit2pyV9El0ZCN2jYP2OPlxfhnVAaC2SPIINwm52VKI52mmJSIrwkJvWy2YvbsQmQ6Zx4Ecg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725433780; c=relaxed/simple;
	bh=U7ShB99LMxLCv80JBZpXfOThgO3T2QrCzDNel6QhBhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDKD1RhHchayhFV3S6wyInPD3WUvpwBo1HnUsTZO1t3Bjl7IMgy1g+Sjlu1HdfcsBwtHHsTlgKULHn2lwLKX5htYN92hVB2PcbRtI764qdqucVDYV0GJNxTwzXFnhY+HSiEXHOJ9eK2/p16c74Kryelw+/B/eRBDSN31Rq7g80g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DO6RB7ty; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D336C4CEC2;
	Wed,  4 Sep 2024 07:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725433779;
	bh=U7ShB99LMxLCv80JBZpXfOThgO3T2QrCzDNel6QhBhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DO6RB7tyywf0ai1BqJXYXdF+mvcKUnltH5kHrqZzHq06+ZOHH5TY4H7VVWAL3PxVn
	 IJEVMnMu1wpEVi/XhVUl7rvGoIKh65VSNGX3wRCqotMpE+8ZR/xHDbq12Jyj8hV/Na
	 Hp2fUadwzUf8+k2d5XAaMvFFHVlyojlbdhQEjRLe2JNmbfqWOgwV/cpijKLYZ5cX5c
	 ItwWToIPYDOssdqZq3nd5gI5MbhE23LtmP4d5oQ7+XmC0R4OiC0sWFygAvJGx5hRvk
	 2Mfzj0M66qGnmygz0mhv7hGRywB4ZYPek9bT97b79V+MMrOi81Asl5QvNtaVcx6m4g
	 TdJZZC5TVIHdA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1slk9L-0000000019G-2PP2;
	Wed, 04 Sep 2024 09:09:56 +0200
Date: Wed, 4 Sep 2024 09:09:55 +0200
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [PATCH V2 2/2] firmware: arm_scmi: Skip adding bad duplicates
Message-ID: <ZtgHw1RrZTZLr7Mw@hovoldconsulting.com>
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-3-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904031324.2901114-3-quic_sibis@quicinc.com>

On Wed, Sep 04, 2024 at 08:43:24AM +0530, Sibi Sankar wrote:
> Ensure that the bad duplicates reported by the platform firmware doesn't
> get added to the opp-tables.

Please expand on why this is an issue on Qualcomm platforms, these
entries aren't just "bad duplicates" if IIUC.

Also here, please add (examples of) the warnings I reported. During boot
of the x1e80100 crd, I see:

[    8.992956] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
[    9.021940] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
[    9.036171] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
[    9.036177] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1

and during resume:

[   85.286615] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. N
ew: freq: 3417600000, volt: 0, enabled: 1
[   85.319849] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. N
ew: freq: 3417600000, volt: 0, enabled: 1
[   85.334686] debugfs: File 'cpu5' in directory 'opp' already present!
[   85.341399] debugfs: File 'cpu6' in directory 'opp' already present!
[   85.348016] debugfs: File 'cpu7' in directory 'opp' already present!

[   85.443093] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. N
ew: freq: 3417600000, volt: 0, enabled: 1
[   85.476595] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. N
ew: freq: 3417600000, volt: 0, enabled: 1
[   85.491645] debugfs: File 'cpu9' in directory 'opp' already present!
[   85.498409] debugfs: File 'cpu10' in directory 'opp' already present!
[   85.505187] debugfs: File 'cpu11' in directory 'opp' already present!

Please also add:

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Link: https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/

> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>

But with this patch applied, instead of the above warnings I now get two
*errors* at boot:

	[    8.952173] cpu cpu4: EM: non-increasing freq: 0
        [    8.979460] cpu cpu8: EM: non-increasing freq: 0

Can you do something about that as well? At least make sure to highlight
this in the commit message as this is information that is needed to be
able to evaluate the patch.

Johan

