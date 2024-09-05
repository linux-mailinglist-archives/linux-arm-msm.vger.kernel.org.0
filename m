Return-Path: <linux-arm-msm+bounces-30905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB0C96D930
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 729A61F2BA5B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D72719DF5C;
	Thu,  5 Sep 2024 12:43:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A034119B5B8;
	Thu,  5 Sep 2024 12:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725540224; cv=none; b=BhcxiDVBtjEib3ylKL0pbGYa/xwcH3XIk2SilIMeeeZV0QrQ5btVf8Jq3ajK6fHIL2wTpeVnjO3oQcIdj8mcTZpV+vYPNdaBwf5gYb7uqF5YYKw6ZAu7rzv2/6qcv8cTDlBtcn5CViLayD8eRAU99RFZxE18mj4AN2SFp2w36nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725540224; c=relaxed/simple;
	bh=N71HzrV7mUuh2osZRTOtwwsB26lHk93Vu8CjIX6JT3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aj0W/KM4wYoTycS/m5vJyXkd29wPUEl1/x8GS7Oqkb+4lUxHnb4I/IW0FCEs5+QtE2Pcs9vmT1Uw+f9/21xhBPi9f/m25i0JvTHgrlL8sTzBxQVnpqV0pHk+TkKIhlVCrVyECXQTM4oih5joFOA7OKb5HIbauJ86q3737bRS/30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 894D6FEC;
	Thu,  5 Sep 2024 05:44:08 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 989353F73B;
	Thu,  5 Sep 2024 05:43:40 -0700 (PDT)
Date: Thu, 5 Sep 2024 13:43:33 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	johan@kernel.org, konradybcio@kernel.org
Subject: Re: [PATCH V2 2/2] firmware: arm_scmi: Skip adding bad duplicates
Message-ID: <ZtmnddqvVBAWCoI6@pluto>
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-3-quic_sibis@quicinc.com>
 <Zth7DZmkpOieSZEr@pluto>
 <Zth9EMydkwvJ30T0@pluto>
 <ZtiAwIxrsct2s24g@pluto>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtiAwIxrsct2s24g@pluto>

On Wed, Sep 04, 2024 at 04:46:08PM +0100, Cristian Marussi wrote:
> On Wed, Sep 04, 2024 at 04:30:24PM +0100, Cristian Marussi wrote:
> > On Wed, Sep 04, 2024 at 04:21:49PM +0100, Cristian Marussi wrote:
> > > On Wed, Sep 04, 2024 at 08:43:24AM +0530, Sibi Sankar wrote:
> > > > Ensure that the bad duplicates reported by the platform firmware doesn't
> > > > get added to the opp-tables.
> > > > 
> > > 
> > > Hi Sibi,
> > > 
> > > so if the idea is to make the code more robust when FW sends BAD
> > > duplicates, you necessarily need to properly drop opps in opp_count too.
> > > 
> > > One other option would be to just loop with xa_for_each BUT opp_count is
> > > used in a number of places...so first of all let's try drop count properly.
> > > 
> > > Can you try this patch down below, instead of your patch.
> > > If it solves, I will send a patch (after testing it a bit more :D)
> > 
> > Hold on... I sent you a diff that does not apply probably on your tree due
> > to some uncomitted local work of mine...my bad...let me resend.
> > 
> 
> This one should be good...apologies
> 

As a side comment about this, even though we certain can and should make
the Kernel more robust to skip possible bad replies from FW (like with this
or similar patches), if the bad replies comes by design since, as I have
grasped from the other thread, the FW just ALSO exposes resources/OPPs that
are just NOT usable by the Kernel OSPM/agent (but maybe by other agents),
you should fix your FW to fully avoid the warnings...since the warnings in
SCMI/perf are there exactly to catch this kind of situations...
(even though we can deal better with the replies as with this patch)

IOW, the SCMI server should expose to its agents only the subset of
resources and characteristics that are supposed to be used by those
respective agents (server can expose a per-agent view of the system)...

...because, even if innocuous and even though most of the time we can cope
with such "alien" resources (with the FW simply replying with a DENY to any
request not meant to be touched or the Kernel spotting such anomalies and
ignoring them) all of these "alien" resources will generate some sort of
uneeded background SCMI traffic (of DENY replies)

Thanks,
Cristian

