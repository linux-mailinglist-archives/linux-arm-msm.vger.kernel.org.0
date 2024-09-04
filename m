Return-Path: <linux-arm-msm+bounces-30645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8023796B3E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 10:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C7412828F8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 08:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C6F17C99B;
	Wed,  4 Sep 2024 08:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcqUN6KA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E264417C990;
	Wed,  4 Sep 2024 08:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725437130; cv=none; b=SXNDQOSrkID8BIckM2GdpBQgqX8VtppTefpej+55bNB4cXDD8VgcBr8o5z9oJwhkWCd6CzyxHT3gyH/hSItacVbOJWJji0yErmQ9LfUsjEsNZLvy64XwMFI4LApRsS6UUCNCJj7+Cibt6Tgf0CCUfailaZAopZlUw+Dy4uD5T8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725437130; c=relaxed/simple;
	bh=7qgWRytiyCO7SWQTn1LaW2tQh6Df8ICaF+PLtw4lLsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TykxNjZCZEFXfG/9o+YUYSLEZ/WLvE5inrKRJyayyzsfv2LPFP2PwyVfuU08Jc4ql9fRu6APtpVYSobzMs+s28eks5xsw7fiFaFka5TO6Scq31Apq3dBKyCZ0BObqs27fmeGRI6HSJilhAzqnymT+OcggkPAz6/MK3YH/fe+nQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcqUN6KA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A40C4CEC5;
	Wed,  4 Sep 2024 08:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725437129;
	bh=7qgWRytiyCO7SWQTn1LaW2tQh6Df8ICaF+PLtw4lLsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EcqUN6KAi2o90T+wVIBwV8S83o3xLRsfDfxmBPLM6Y7vYtWe8O6QbMXDrr1eUD1Vh
	 Q9D+pBdKG47gGnSpO271e/wwAFXhePE+5iuBYoZIvAjU2C4lELzZH1zwRWuP33X50p
	 WfdrJpnATbu2S5ywHKNexualvVpNIGie/m5yB50du8GWwjEmn0Kqw+GOH//Or+xM57
	 TauL/adJ31PdPqiykIM7786VpBpkPUUbqnvd+4oNwBuVlgA6Q8kHEI2mVO8peNX+2V
	 fpNPpESZJndlU//p35Oi52z5jUeKfQXm7KZ8nv+Y3/SdbSCF807eVYGpt0XnqZPevD
	 ZgjUj5Tfy7E7Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sll1O-0000000054Y-1kjo;
	Wed, 04 Sep 2024 10:05:46 +0200
Date: Wed, 4 Sep 2024 10:05:46 +0200
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [PATCH V2 2/2] firmware: arm_scmi: Skip adding bad duplicates
Message-ID: <ZtgU2kwBBl1q1Oh2@hovoldconsulting.com>
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-3-quic_sibis@quicinc.com>
 <ZtgHw1RrZTZLr7Mw@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtgHw1RrZTZLr7Mw@hovoldconsulting.com>

On Wed, Sep 04, 2024 at 09:09:56AM +0200, Johan Hovold wrote:
> On Wed, Sep 04, 2024 at 08:43:24AM +0530, Sibi Sankar wrote:
> > Ensure that the bad duplicates reported by the platform firmware doesn't
> > get added to the opp-tables.

> But with this patch applied, instead of the above warnings I now get two
> *errors* at boot:
> 
> 	[    8.952173] cpu cpu4: EM: non-increasing freq: 0
>	[    8.979460] cpu cpu8: EM: non-increasing freq: 0
> 
> Can you do something about that as well? At least make sure to highlight
> this in the commit message as this is information that is needed to be
> able to evaluate the patch.

I tried running with just this patch (i.e. without patch 1/2), but then
cpufreq fails already during boot with eight of these errors:

[    9.258577] cpufreq: cpufreq_online: ->get() failed	
...
[    9.405603] cpufreq: cpufreq_online: ->get() failed

and seven of these messages:

[   12.322987] energy_model: Accessing cpu4 policy failed
...
[   18.462780] energy_model: Accessing cpu4 policy failed

Johan

