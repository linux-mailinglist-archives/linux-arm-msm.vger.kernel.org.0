Return-Path: <linux-arm-msm+bounces-30739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE55296C02B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 16:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A9BB28DDEF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 14:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2B91DC04C;
	Wed,  4 Sep 2024 14:20:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD471D4170;
	Wed,  4 Sep 2024 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725459615; cv=none; b=Rb1zUqBjEJRiwbWsiG5mP7RhRKzzZBc59qBQ9JPStk9qLO4np5FnLkLuwNu5D5xWtNCgmamup/8ElYtNXaPnA4mfrf3RbqHlUDw3KUOLkpLdS83hvi8JcL/O8DN6q/zb+frvn06hdSX8L/dlxzkod4x0KhkPKFfXhn92k+tRokA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725459615; c=relaxed/simple;
	bh=B2rl0YRMF46/xOA0m8DE2zuayGiU4bM1W3ZzNQIJWAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vj+TXGJFIovU5vkdmb8yDwrjCpTr7FoK5v5TftOfyzzrJqFqJzGdz8jZAAG45u8cpvKsQB63Ieo/Cb8VLN7U2luI07MCwS8L1w/MKcoCCLWe0Ni+ECWTQ8wj0ylYMDxi0+DLPXcwWGtgOHLE8YOBm7p95kTdwSi28L+XS/jCoT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A47711063;
	Wed,  4 Sep 2024 07:20:38 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 181E63F73F;
	Wed,  4 Sep 2024 07:20:10 -0700 (PDT)
Date: Wed, 4 Sep 2024 15:20:03 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, cristian.marussi@arm.com,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V2 1/2] firmware: arm_scmi: Ensure that the message-id
 supports fastchannel
Message-ID: <ZthrRHmV8xTsPbZ8@pluto>
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-2-quic_sibis@quicinc.com>
 <ZtgFj1y5ggipgEOS@hovoldconsulting.com>
 <d482dca4-e61b-4a94-887b-d14422243929@kernel.org>
 <ZthU36Qkzwa5Ilrb@bogus>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZthU36Qkzwa5Ilrb@bogus>

On Wed, Sep 04, 2024 at 01:38:55PM +0100, Sudeep Holla wrote:
> On Wed, Sep 04, 2024 at 01:29:29PM +0200, Konrad Dybcio wrote:
> > On 4.09.2024 9:00 AM, Johan Hovold wrote:
> 
> [...]
> 
> > >
> > > Unfortunately, this patch breaks resume from suspend on the x1e80100 crd:
> > >
> > >         [   26.919676] CPU4: Booted secondary processor 0x0000010000 [0x511f0011]
> > >         [   26.960607] arm-scmi firmware:scmi: timed out in resp(caller: do_xfer+0x164/0x568)
> > >         [   26.987142] cpufreq: cpufreq_online: ->get() failed
> > >
> > > and then the machine hangs (mostly, I saw an nvme timeout message after a
> > > while).
> > >
> > > Make sure you test suspend as well as some of the warnings I reported
> > > only show up during suspend.
> >
> > Eh it looks like PERF_LEVEL_GET (msgid 8) requires the use of FC, but
> > the firmware fails to inform us about it through BIT(0) in attrs..
> >
> 
> Just trying to understand things better here. So the firmware expects OSPM
> to just use FC only for PERF_LEVEL_GET and hence doesn't implement the
> default/normal channel for PERF_LEVEL_GET(I assume it returns error ?)
> but fails to set the attribute indicating FC is available for the domain.
> 

Is not that FCs are optional BUT PERF_LEVEL_GET standard messages is
support is mandatory by the spec anyway ?

Thanks,
Cristian

