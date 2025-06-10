Return-Path: <linux-arm-msm+bounces-60756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 402CEAD33CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AD6E16313A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F9328C2C9;
	Tue, 10 Jun 2025 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F/6y6aVY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E087228B7EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551911; cv=none; b=tf99QyVXzGxVNM5bchVXCrjLDu1wG/NU8K2dUvEdpwRSY6nTOZTHAbfv3hSc30a2BI7cejGEAkHDo8JJtxz6JjahbQnXtz1kVasOo4F0jO+3qQqvzP6DYorNgV5aUEEe3seF+yfTXYp0GtgMgyqd4Ph2lBS3Sv9V7LQknSyj5+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551911; c=relaxed/simple;
	bh=AE+sUP3HEMMYaALXgLosS4awSefOKL9VYbo4VC+NJbU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=d9pk7aVx1Pqxi1bMwBOz79RgHxytbI6nl9KlJB4yBXbl9HzvUZ8J02bqFgwwr641PBowZHXP9RcGOAEMELkNWulx8LSy50WIsty+eQHQzl8HDmrXMIc1TODmDkGm/dkMdmLfcGID2oS8h0wqPleeHWw10ugV4bRoNwdm7tvZrxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F/6y6aVY; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749551907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YctFVp+NFks6JhouwOBSL22NHg6Z9MP2+A/tMRznPSo=;
	b=F/6y6aVYzP3MPOKzQCrKOU//mTJiCWa5KTWPzCHz9iltyCE11PQ6KXXG6YR+RFcA7TqHKx
	bftTeRy8ZDmSuyq0+QYu/URsrxxx1migbTNA4rU9xYxl9Ngfuc0n4GfwjdVNMc3HGMb86S
	gvUDidQrX30QxT4kdKoAERo7RJgwNPs=
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [RESEND PATCH] rpmsg: Use strscpy() instead of strscpy_pad()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <CANLsYkxBxt-fE-kV3yS7WDQuF4o7OSL045fMmXrTvfx3P=A+1A@mail.gmail.com>
Date: Tue, 10 Jun 2025 12:38:14 +0200
Cc: Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <1F19F750-E9CF-4AC8-B14E-78C957869F75@linux.dev>
References: <20250429104543.66927-2-thorsten.blum@linux.dev>
 <CANLsYkxBxt-fE-kV3yS7WDQuF4o7OSL045fMmXrTvfx3P=A+1A@mail.gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
X-Migadu-Flow: FLOW_OUT

Hi Mathieu,

On 30. Apr 2025, at 16:59, Mathieu Poirier wrote:
> On Tue, 29 Apr 2025 at 04:46, Thorsten Blum wrote:
>> 
>> kzalloc() already zero-initializes the destination buffer, making
>> strscpy() sufficient for safely copying the name. The additional NUL-
>> padding performed by strscpy_pad() is unnecessary.
>> 
>> The size parameter is optional, and strscpy() automatically determines
>> the size of the destination buffer using sizeof() when the argument is
>> omitted. RPMSG_NAME_SIZE is equal to sizeof(rpdev->id.name) and can be
>> removed - remove it.
>> 
>> No functional changes intended.
>> 
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---
>> drivers/rpmsg/qcom_glink_native.c | 2 +-
>> drivers/rpmsg/qcom_smd.c          | 2 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
> 
> 
> I will let Bjorn take care of this one.

This one didn't make it into the last merge window, did it?

Could you or Bjorn take care of it or should I resend it?

Thanks,
Thorsten


