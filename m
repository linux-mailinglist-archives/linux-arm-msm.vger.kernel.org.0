Return-Path: <linux-arm-msm+bounces-33704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60532996D84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21E4C28119E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E4619D098;
	Wed,  9 Oct 2024 14:20:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57D819CC28;
	Wed,  9 Oct 2024 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728483640; cv=none; b=j7wLkDrLs4znNhzJ2eQf6vLHRP/Am0t5xx/GbxvZHMSKaZNfeCpSOD/Sn7vQ10oI86hW8ErheHqsJ/t8AXtKdVnLtR/rUSzDaBTu15iFPbrXKPGaHye1BHvQGcOsVod83MyaL0vQvqFMP+t7dPHrUKzbVtkFcGtivbhfdC8rGFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728483640; c=relaxed/simple;
	bh=ARmVYoTgtZue47e90CxZTUi70TVs2cN8F4uDpE7a+OA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sERbmpM2ue/AVt60htSpKbNb9SmOPmmrqKRqmAg8LSBSa0s/XJPNE9IRc58ZycEy/i40MypSaG9BEW94wijuoZtZaSGxjSjKx/IxVZ3tiE8EZnEJY/hIjVjCQOnfjkr5wPYAisRO1iuL/UfdZ7wyxYfvb5qrdT8hrj+xMt3yyeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E88D2FEC;
	Wed,  9 Oct 2024 07:21:07 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C16673F58B;
	Wed,  9 Oct 2024 07:20:36 -0700 (PDT)
Date: Wed, 9 Oct 2024 15:20:33 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, sudeep.holla@arm.com,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	johan@kernel.org, konradybcio@kernel.org
Subject: Re: [PATCH V2 2/2] firmware: arm_scmi: Skip adding bad duplicates
Message-ID: <ZwaRMWG7iCEjp1Q3@pluto>
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-3-quic_sibis@quicinc.com>
 <Zth7DZmkpOieSZEr@pluto>
 <Zth9EMydkwvJ30T0@pluto>
 <53d929a2-2f54-ac97-3184-861442e8622b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53d929a2-2f54-ac97-3184-861442e8622b@quicinc.com>

On Mon, Oct 07, 2024 at 12:30:14PM +0530, Sibi Sankar wrote:
> 
> 
> On 9/4/24 21:00, Cristian Marussi wrote:
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
> 
> Hey Cristian,
> Thanks for taking time to send out the diff. I thought this would be
> enough but there will still be a disconnect between opp_count and idx
> of the opp we populate. Consider a case were we get to have a valid
> opp just after duplicate opp. The opp_count will still limit us on what
> levels we are allowed to see.
>

Ah right...indeed... I missed that the opp_count is used also to loop on the
opps arrays and OPPs are not only accessed by xa_load....

...anyway the index in the dom->opp arrauy is NOT related to index/level
indexing, so we just have to have the bad oop dupicates also in the
array and NOT only in the XArray...

I am sending you, as a reply to this patch, a new version of my fix
with just a one-line difference tthat should solve completely the issue
also in the usecase that you describe.

Thanks,
Cristian


