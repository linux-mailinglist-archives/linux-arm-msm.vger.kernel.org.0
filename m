Return-Path: <linux-arm-msm+bounces-30752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C88096C270
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 17:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5A211F26383
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 15:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6DA1E009E;
	Wed,  4 Sep 2024 15:30:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DF61DFE2D;
	Wed,  4 Sep 2024 15:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725463830; cv=none; b=c8HaO/3hCyL4eHEbcJ8cxK7LE9dF/JOejLxNZ38r9iRLwdHDHw4yTBgSBbrXK3rYSVCSfosKeYEe8qoLziAEHnakoMdQYP4b7Rx19z48hddLA86JTBKsCBlVB3uHHcZi4bX2tlYu8NzwHIBC7dNcI0toNHQCyxdKvkFGiFuhRsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725463830; c=relaxed/simple;
	bh=95rMAoRVdd6FexEwYXmgjfyrSYj+jIxVuYCiMCheoN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5RkIo7QS53XMuA/uqvQBwsmuQtUqB4aARKmkJ1mFjZ3l3E5OQzm+Vg3N348/Fm8mXHycswAvO6WcpONEonL2/q4wIHWGSZOh2QyZnrFmeweKz0COKBVhYZ0BEkGetXaqH90voxUqKtgd+C6e598drFNbCO94tO1zv3RjtqsVk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33701FEC;
	Wed,  4 Sep 2024 08:30:54 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A41B73F73F;
	Wed,  4 Sep 2024 08:30:26 -0700 (PDT)
Date: Wed, 4 Sep 2024 16:30:24 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	johan@kernel.org, konradybcio@kernel.org
Subject: Re: [PATCH V2 2/2] firmware: arm_scmi: Skip adding bad duplicates
Message-ID: <Zth9EMydkwvJ30T0@pluto>
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-3-quic_sibis@quicinc.com>
 <Zth7DZmkpOieSZEr@pluto>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zth7DZmkpOieSZEr@pluto>

On Wed, Sep 04, 2024 at 04:21:49PM +0100, Cristian Marussi wrote:
> On Wed, Sep 04, 2024 at 08:43:24AM +0530, Sibi Sankar wrote:
> > Ensure that the bad duplicates reported by the platform firmware doesn't
> > get added to the opp-tables.
> > 
> 
> Hi Sibi,
> 
> so if the idea is to make the code more robust when FW sends BAD
> duplicates, you necessarily need to properly drop opps in opp_count too.
> 
> One other option would be to just loop with xa_for_each BUT opp_count is
> used in a number of places...so first of all let's try drop count properly.
> 
> Can you try this patch down below, instead of your patch.
> If it solves, I will send a patch (after testing it a bit more :D)

Hold on... I sent you a diff that does not apply probably on your tree due
to some uncomitted local work of mine...my bad...let me resend.

Thanks,
Cristian

