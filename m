Return-Path: <linux-arm-msm+bounces-40528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F32219E5A44
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD5F7287C3B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 15:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC3E21D58E;
	Thu,  5 Dec 2024 15:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qT4ZzauC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED0C21D585;
	Thu,  5 Dec 2024 15:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733413977; cv=none; b=tOFDU+f5dOULOfTM5Mr2HWTMFhsOdbRd9gMXT3xArmf053kv7X+Yn1hqO8h/Pk5UusGixPO7R1mGVA6dGSjvqOiSF2sITUT1OqWLaAvBOVQiyVc4BWHk+3hk1NTgA3zlTeXpVTx3DCu7Io6JrhO5UBgx5qfXfduC2ozaQgnLftw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733413977; c=relaxed/simple;
	bh=QNI5z8VVLHR4iSqkF2o+2ppPCvhP1+pFGu66x6cXsWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkEt5GH01sVLkRvzaH5v6JcsP/Z0Gy5qCZ/XCqDHFyKoTpHu6ECUt9/A9kUpziUtzyqvlf7dg+pgrqu/L0tzVjku4csx/ST29aU4+qeojAOndqC7bFsxBAnIdsFBtXsGp2aopuxTzF2vw0LDiP5X9kRiipcpCAIfvVH56yP754M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qT4ZzauC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F68EC4CEDF;
	Thu,  5 Dec 2024 15:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733413977;
	bh=QNI5z8VVLHR4iSqkF2o+2ppPCvhP1+pFGu66x6cXsWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qT4ZzauCkPbwV/SSrIePuyf2eTG5YGJfzZzwrnjzdq+XWIe1oLEip1LoRBPSjrNrP
	 M74C4Kfm7+wMA5UfUBImGgSKeLsyrzBOHjQmBMAOKzEumJ4lSClyQVpPh4N9UIvP+m
	 ZhqfXkwg5E5CyhTtI7fbQ7NbcHGVrXZNsftO0Ycmfk+qmcwYdDj5OSspdtUlW6dtsM
	 yT65kLLv0B18yZwADAtSfR39ZlhtkVPySMwdRlqUAY//WxuzDM4QxY6XhtlaUxIpJX
	 ptBmlR8csE2kPwh0gAa0hKXm5WCAK0iz4Ad1LgIBj8AswEMk3DwniU+Gm64gG0q/lY
	 NrM4sKOnxhUFQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tJE9x-000000002kQ-1W8O;
	Thu, 05 Dec 2024 16:52:57 +0100
Date: Thu, 5 Dec 2024 16:52:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, sudeep.holla@arm.com,
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <Z1HMWUa_QCsNA1-Q@hovoldconsulting.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com>
 <ZyvLktLUZOGP-LH5@pluto>
 <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
 <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
 <Z0BC203BhGEmXcJi@hovoldconsulting.com>
 <d61bb7bc-d824-883a-4edd-109ae74076c1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d61bb7bc-d824-883a-4edd-109ae74076c1@quicinc.com>

On Thu, Dec 05, 2024 at 04:26:55PM +0530, Sibi Sankar wrote:
> On 11/22/24 14:07, Johan Hovold wrote:

> > I have a Lenovo ThinkPad T14s set up now so I gave this series a spin
> > there too, and there I do *not* see the above mentioned -EOPNOSUPP error
> > and the memlat driver probes successfully.
> > 
> > On the other hand, this series seems to have no effect on a kernel
> > compilation benchmark. Is that expected?
> 
> I can have a look at your tree. But memlat in general
> depends on the cpu frequency when your benchmarks max
> the cpu's the ddr/llcc are scaled accordingly by it.

A kernel compilation should max out the CPU frequency on all cores.

> > And does this mean that you should stick with the uppercase "MEMLAT"
> > string after all? The firmware on my CRD is not the latest one, but I am
> > using the latest available firmware for the T14s.
> 
> We should stick with "memlat" if we run into a device in the
> wild that doesn't support "MEMLAT"

Ok. So the updated firmware supports both strings?

Johan

