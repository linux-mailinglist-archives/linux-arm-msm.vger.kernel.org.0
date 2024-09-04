Return-Path: <linux-arm-msm+bounces-30760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD0696C39B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 18:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 667A71C22167
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 16:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBBD1DFE3F;
	Wed,  4 Sep 2024 16:12:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DC81E00A3;
	Wed,  4 Sep 2024 16:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725466355; cv=none; b=Ra13uRTR0dHCZ6pyZwMs1R7/HfjJth2CpY8saY+guDfGHAhJeSnRKGf1cFNLk7qlFtwAb08poil3e7v4q3gyKHB/LOgiKIqwo8yEw5302mpo61SzTV3oC++0/qVZblO7o7cQqX/RBL+FjZr9EMpdK6u+mHd7jhHvoOl6PNfXUy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725466355; c=relaxed/simple;
	bh=solN3XEqUojQqZrIL0N7uQD9Aa93gtBgkkCSLudia+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3LBFl6ILemRW57I7nQchfJeFYFixsQxgrbKamRHMfYgmQdxdXWNNTxZE1DXkoK4e2EaXjf58t/NN0LcC7nGPO6057g8gveXpHGLmpZnJQIHprtFZGCGQEWuUfdXsUUxVfybU5OhILmupV91cblxUIjGIdeSiHYzyNfiCmq+/As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39658FEC;
	Wed,  4 Sep 2024 09:12:59 -0700 (PDT)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF3493F73B;
	Wed,  4 Sep 2024 09:12:31 -0700 (PDT)
Date: Wed, 4 Sep 2024 17:12:29 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: <cristian.marussi@arm.com>, <linux-kernel@vger.kernel.org>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <johan@kernel.org>,
	<konradybcio@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH V2 2/2] firmware: arm_scmi: Skip adding bad duplicates
Message-ID: <ZtiG7YLcnOR9IIuE@bogus>
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
>

I am really interested to know if the platform firmware is presenting
duplicates intentionally for some unknown reasons and we are just speculating
it to be broken firmware or is it really broken firmware.

For me, it is very hard to digest something like OPP tables which is there
for a very long time now is not very well understood by firmware authors.
How many duplicates are we seeing on this platform really ? If it is
just one I can understand. More than one is hard to miss from the OPP
tables in the firmware.

While I am not opposing to make the driver handle these duplicates,
I am just worried if they are put there intentionally for reasons we
don't understand yet or not published.

--
Regards,
Sudeep

