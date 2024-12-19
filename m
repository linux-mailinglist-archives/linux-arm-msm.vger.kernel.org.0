Return-Path: <linux-arm-msm+bounces-42782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 282F19F79B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 11:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2DE616B770
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 10:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A2F222572;
	Thu, 19 Dec 2024 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSzDAU+H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849CF221478;
	Thu, 19 Dec 2024 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734604650; cv=none; b=OLSR4/LiSsJLQMUVXq2dtF/0/cf1Y7TgRWDkOvRp7ZFBNYcHfQHB2O/XmsQsyVylMoceqqIpy5QeOVBtw8WnwpbzlzKvi5mCJbB47AE2gAucql/SmmQ1qu54Y7rLKVrFh0mJQgUeRDdfvytVsryGSe4dxH0DbA7UyQqLhlAAczk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734604650; c=relaxed/simple;
	bh=6NtTS3sFBKTuhe+YrFYJjIB7PeX5OysvL/IIYf8a964=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jH5aRJjSq2Q8m9oplot+IYyyd+TM4MsHdeUbMo0z3+UoazHKJkGHMhODJVV4R6t410CvZvm5NPiwAQqQeok1TZNMoV2O0xGSYkPDsPl8x6/BZqZCPZE4g0c47Vs0UW9XHy9d1mxy5yDVT9B0Bi1OQwCnuGjX+7UBn86KslrJkFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSzDAU+H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184B0C4CED0;
	Thu, 19 Dec 2024 10:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734604650;
	bh=6NtTS3sFBKTuhe+YrFYJjIB7PeX5OysvL/IIYf8a964=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nSzDAU+HqyERLsxyx3tZBNRur3PX7/DH8uv9Fpzuq4hQlJ9wE2jv4yLtUgfx5rnDI
	 +L0RvXFLDuUdFu7tUinxgfzFVWB/a1EXCdy3t8JOafqaeMLXgJB9CKLT3aUVO3Uc57
	 weaGduU7CW427tXzwZkbaokDGw1tRh3RnTnPTMaoOWzyBy12FYH/0KM8kTLdiUDuXV
	 h22oGMfLRMWV/iYrINSxXPv+M8pqgQZHwC55zVMKxBxSwXtSMydib5gjudjCt5yikj
	 rB2W8QWckzJNiITHvlA+jXKLa/zH8loNuhGgJNbhH+IOjMmu4+fnFXbjz0o+JDAUp2
	 o8dEXEQJtmo5Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tODuQ-000000001mQ-2Z6I;
	Thu, 19 Dec 2024 11:37:34 +0100
Date: Thu, 19 Dec 2024 11:37:34 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, sudeep.holla@arm.com,
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org,
	Ettore Chimenti <ettore.chimenti@linaro.org>
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <Z2P3bh04xXsreBF7@hovoldconsulting.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com>
 <ZyvLktLUZOGP-LH5@pluto>
 <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
 <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
 <Z0BC203BhGEmXcJi@hovoldconsulting.com>
 <d61bb7bc-d824-883a-4edd-109ae74076c1@quicinc.com>
 <Z1HMWUa_QCsNA1-Q@hovoldconsulting.com>
 <132d1404-9009-9fb5-1fb9-63eca03ce9fc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <132d1404-9009-9fb5-1fb9-63eca03ce9fc@quicinc.com>

On Tue, Dec 17, 2024 at 05:19:25PM +0530, Sibi Sankar wrote:
> On 12/5/24 21:22, Johan Hovold wrote:
> > On Thu, Dec 05, 2024 at 04:26:55PM +0530, Sibi Sankar wrote:
> >> On 11/22/24 14:07, Johan Hovold wrote:
> > 
> >>> I have a Lenovo ThinkPad T14s set up now so I gave this series a spin
> >>> there too, and there I do *not* see the above mentioned -EOPNOSUPP error
> >>> and the memlat driver probes successfully.
> >>>
> >>> On the other hand, this series seems to have no effect on a kernel
> >>> compilation benchmark. Is that expected?
> >>
> >> I can have a look at your tree. But memlat in general
> >> depends on the cpu frequency when your benchmarks max
> >> the cpu's the ddr/llcc are scaled accordingly by it.
> > 
> > A kernel compilation should max out the CPU frequency on all cores.

Answering my own question here; bwmon should scale the buses for
benchmarks like kernel compilations so I guess the non-existing impact
of memlat is expected here.

Ettore helped me run some further benchmarks, including cachebench, but
also saw no positive (or negative) effect with this series running on an
X1E CRD (with recent firmware).

Do you have any suggestions of benchmarks to run where the effect of
memlat should show up? What have you been using for testing?

I did measure a possibly slightly higher (idle) power consumption with
memlat, but I guess that is also expected given the intended more
aggressive ramping of the bus clocks.

These are the branches (and configs; johan_defconfig) we've used for
testing:

	https://github.com/jhovold/linux/tree/wip/x1e80100-6.13-rc3
	https://github.com/jhovold/linux/tree/wip/x1e80100-6.13-rc3-memlat

> >>> And does this mean that you should stick with the uppercase "MEMLAT"
> >>> string after all? The firmware on my CRD is not the latest one, but I am
> >>> using the latest available firmware for the T14s.
> >>
> >> We should stick with "memlat" if we run into a device in the
> >> wild that doesn't support "MEMLAT"
> > 
> > Ok. So the updated firmware supports both strings?
> 
> Sry for the delay, was out sick. Yes the updated firmware supports both
> strings.

No worries, hope you're feeling better.

I noticed that the firmware on the T14s indeed accepts both strings.

Johan

