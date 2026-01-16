Return-Path: <linux-arm-msm+bounces-89291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99599D295BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 01:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCACF3098785
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 00:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F3A1548C;
	Fri, 16 Jan 2026 00:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+2DqPG0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E104C97;
	Fri, 16 Jan 2026 00:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768521720; cv=none; b=gQE1Cn7aqR2fnG+CnqAU18/7oSUqa13Fzhx4jRuTCOqdi/oYjc1nKe0I10XorqIb0JgBoaCn+mvCgwemPy5tnr6cU3H/YHV/G5qG68dY3PeGLoaBpa8I7W1cRXo/LKyOEEH0yV6izXAyXG8IFGf9/iQuVmS6VifkAPDqqN6ruDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768521720; c=relaxed/simple;
	bh=ymO7TCM2EVQsIwtIh8wgg2R/ryyDXJBI9O2DKENFKG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1EYO8Q+92CuBKCQAfyri/GTJtXQR/kUKJ7ifseQOzfACuB68k2KQRUlmtGmRvgwuKQOZgbsXrmtdQ7zKlFfC5nVBtLFFvNMXB+dezacLIWdh18DnxNLKUZZCgznbqmV4rjrqN/dlgJ+YatWERuUSHWYnFJA0aAFaAyHAxHXN+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+2DqPG0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B599C116D0;
	Fri, 16 Jan 2026 00:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768521719;
	bh=ymO7TCM2EVQsIwtIh8wgg2R/ryyDXJBI9O2DKENFKG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+2DqPG0bGqGe0MRh8MBRcVmQ5ABzYpbZ/pFDfpa7Nvx3L6lKnHeWfRfLLGF2VXR7
	 VXFB1UQY9aImryNQkQ9qJXAVfIUf5DAuRfp66EePILqltJG5han7pzYINQ7Wcm5+V0
	 iViof0Lqz571ha0RnDcgwQdLwV86zTMcUgF0+LemQ8vBDLs1r3/a3xWdM+flIK9clH
	 yhZX1uTT0Ys8b/JUc1Ze109xfnw5Z086OSEVAHqBq8Vmtwpux4JqqR/V4+hmt1HKkN
	 ftdtJHK0Fn9bq6y/jlO/Q9thFlgKYNaFCdkDVIJx+IQs2r/j9aA3I9FZYQNGhYmkeO
	 Z/cN/7Onv7Ejw==
Date: Thu, 15 Jan 2026 18:01:57 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <t4pd72ff2ut4xr7ke3tzn3vxhyxq4kr6m3tublurwchynonouj@y4jgc3zqa5tw>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <ebm6tn3swrzqqzp5qnd7zkasqxo4nqcz2gt3w7j6sxqx2ryyn4@pwrkiumm442t>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebm6tn3swrzqqzp5qnd7zkasqxo4nqcz2gt3w7j6sxqx2ryyn4@pwrkiumm442t>

On Thu, Jan 15, 2026 at 10:18:38PM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 15, 2026 at 10:42:51AM -0800, Satya Durga Srinivasu Prabhala wrote:
[..]
> 
> The kernel was never broken, it is not a kernel change that introduced
> the regression. Why are you trying to change the kernel?

I always thought you had one of these per SoC, so assuming a that a
single-soc system presented one entry would make sense to me.

The kernel is supposed to abstract away hardware details, that's clearly
not what we're doing here.

> If it ain't broken, don't fix it.
> 

Get over yourself.

Regards,
Bjorn

