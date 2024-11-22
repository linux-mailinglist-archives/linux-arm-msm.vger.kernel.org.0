Return-Path: <linux-arm-msm+bounces-38790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DDD9D5B18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 09:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85D0DB21BBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 08:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F1E188013;
	Fri, 22 Nov 2024 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rlQOR6xr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8732B17BEA4;
	Fri, 22 Nov 2024 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732264676; cv=none; b=VmjWkU2TO6ZZKPDvYQ9ezX0lARk1x2QEfxjkzKtuYrhCgiycTGLutlUC1s46QjIEkA5pZLEqm4lpYTdgJxVIaKXOKoPng7xofeEYkGLQgH1K/k53OMerAq3eD6zSl3NZqtQaSjMvb4AM8tdZnwr2BXr+QXCXCh3xPi783cx+QxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732264676; c=relaxed/simple;
	bh=YRPhCjHnMkScpSE7BaUeWOkkkpQu14NpMm1EVAUeUFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgQBYCC6Ubxypisx2IrJOLUlS0FO3IqNdIjpp//qford39w9OWDBmgb23d73rbniCM0SzL4pO75gG1V0FS1hTO+/KOrU7ghNYkEe5yTyqUjW6Abd+gua4FrSZ4sCsWdZB6dyDLVjP0hoJiEgjeo+gapM9fvyUA849sx7YklxxIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rlQOR6xr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D4EC4CECE;
	Fri, 22 Nov 2024 08:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732264676;
	bh=YRPhCjHnMkScpSE7BaUeWOkkkpQu14NpMm1EVAUeUFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rlQOR6xrYCqf57fxGFgqbkaoiW1BaKannEDb205TFQx1q4XrT4atygpg02CUTkhbt
	 yKx8LM9w9BfyWY0i7/ZahsUGTMa9e82/lPJGqF06WaOeCu/X8szTuzZNSNbU5ycDNa
	 g+khhWqQU/l31l8uXwG2KrzX8K2RjrrOFBX/gR2dRVZBaVAo7fpGzVgaskVFVWTnRB
	 MR0pN4Sl8EsiF1DN0Olfgm6pW05hHgIgEtAObkccCaAhDKHSaNA3U2Pm+rg/16zo8k
	 kOACaBpv8P6xYDobnXQg9iKZEoI+p60M4YjZTdexeTx1Y6Gv/blg1hJ/jLfHbJ0sqF
	 V/jMkIsTQILug==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tEPAh-000000001y3-3Fnj;
	Fri, 22 Nov 2024 09:37:47 +0100
Date: Fri, 22 Nov 2024 09:37:47 +0100
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
Message-ID: <Z0BC203BhGEmXcJi@hovoldconsulting.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com>
 <ZyvLktLUZOGP-LH5@pluto>
 <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
 <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>

On Thu, Nov 14, 2024 at 09:52:12AM +0530, Sibi Sankar wrote:
> On 11/8/24 20:44, Johan Hovold wrote:

> >> On Wed, Nov 06, 2024 at 01:55:33PM +0100, Johan Hovold wrote:

> >>> Second, after loading the protocol and client drivers manually (in that
> >>> order, shouldn't the client driver pull in the protocol?), I got:
> >>>
> >>> 	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
> >>> 	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
> >>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
> >>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95
> >>>
> >>> which seems to suggest that the firmware on my CRD does not support this
> >>> feature. Is that the way this should be interpreted? And does that mean
> >>> that non of the commercial laptops supports this either?

> > Yeah, hopefully Sibi can shed some light on this. I'm using the DT
> > patch (5/5) from this series, which according to the commit message is
> > supposed to enable bus scaling on the x1e80100 platform. So I guess
> > something is missing in my firmware.
> 
> Nah, it's probably just because of the algo string used.
> The past few series used caps MEMLAT string instead of
> memlat to pass the tuneables, looks like all the laptops
> havn't really switched to it yet. Will revert back to
> using to lower case memlat so that all devices are
> supported. Thanks for trying the series out!

I have a Lenovo ThinkPad T14s set up now so I gave this series a spin
there too, and there I do *not* see the above mentioned -EOPNOSUPP error
and the memlat driver probes successfully.

On the other hand, this series seems to have no effect on a kernel
compilation benchmark. Is that expected?

And does this mean that you should stick with the uppercase "MEMLAT"
string after all? The firmware on my CRD is not the latest one, but I am
using the latest available firmware for the T14s.

Johan

