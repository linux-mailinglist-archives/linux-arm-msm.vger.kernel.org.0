Return-Path: <linux-arm-msm+bounces-88761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C941D184B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CC013019352
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F6A2F49FD;
	Tue, 13 Jan 2026 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsPCFA+y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A5D24397A;
	Tue, 13 Jan 2026 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301827; cv=none; b=e/Od59gNMNi2/V8bgzO/EY0/C6xJXglyiOxFht2rhdLPYEVo65Yv0C4bsr8jmSwiyi01/QANqZTOKInV5FgoGRUIIZBJxp/19J2d86kvb5hzvP1x+EkdLCg2HuO8zEu8Z8SugwfH7ymi91u6njCXXG72DjN8iNnfB2yFQnLab5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301827; c=relaxed/simple;
	bh=6dzbtd4d0zsoXuZ/SJa4SnlTGp9monm0A/IN612PyE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auJETvdvtHO/qT6rLSPErl4EwEkPy9e0wxYHztP4tN90Y/kLSqaLimPYZ+Yg/uBS4d01bJQR801l7BhP/gRs0kD6t8KDNRWzpHfm4Z+QBnV6Sme26zTTtqNkd37XG2P1pZ+kgoMbUMKZ2/4brKUPd3c4yi8/AIdPtwsDJWpH0IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsPCFA+y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628F2C116C6;
	Tue, 13 Jan 2026 10:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768301827;
	bh=6dzbtd4d0zsoXuZ/SJa4SnlTGp9monm0A/IN612PyE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bsPCFA+ym2PrA0TOKPD2t31XHFM9RhVU2abdDB0CDpxJeVXomalpAFvDyc3uzMTbM
	 j4pxi9+N3BwWHWrRbxrOBq76Og+ehb5FcaBNhTtGPOJYZgtjhDPPySk6okTuPIliTc
	 /X6r9+tS8ausd3W2kB41cC+mJKI2rTfDjAyWNAa42CyqUvvIZnIIccA7DOcwrNATNu
	 4xVP+PxsU8V5yuzSiFagfw7T39lWLQCWfhYuE+2r8CnUg5oyKnIIt1fiCt5cVRsIIj
	 fji3+IrY7Gm9imrtEQldeFUVy66kGoJ7XisGHGUTLtaDyhng0bHYKLqT0pdvJADntl
	 YFOuaVXGMsXZg==
Date: Tue, 13 Jan 2026 10:57:02 +0000
From: Will Deacon <will@kernel.org>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWYk_qGvA9Kn0xGe@willie-the-truck>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>

On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> 
> On platforms where a vendor SoC driver already exposes widely-consumed
> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> of a vendor logical ID like "519") and breaks existing userspace consumers.

Isn't the fundamental issue here that you have multiple callers of
soc_device_register() and your userspace is only looking at soc0?

Will

