Return-Path: <linux-arm-msm+bounces-89534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D86D3913C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 22:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C9F33010E7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 21:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241BE2DA75B;
	Sat, 17 Jan 2026 21:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5dyYsaB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA8E28851E;
	Sat, 17 Jan 2026 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768686703; cv=none; b=geSejoHVjnDClvrai2DZIaz23mzzJY/+QUICFMluEZuPrvUxoSyHk9AYE9nOHxNvJ3my33F7g7nki8nuZpZgpBgVsoyLuiFaZFSz4wpWOc56rZ29ACfPS5dtbz90EWSkC01HP21OiCrKJ8fQqaQ4LhynWnGzmFz0i+Y3LyXeI+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768686703; c=relaxed/simple;
	bh=b/0coEcvYCaguhsk+YDhiScezyJeihutu1g5DzC6wDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UO1jTgGgZpAgs/iauaIYebPwoWN5wBvcY0GbDDHtEsLIPW6YPsrboJ/tPrd1D/ZumsQQZqoT8x6lj3Uu5iyN8hhwIRrOaNgwxujnnsCGM+YJXygUkqZqOSkC7OTVHu4Zng4ZcQtgpfie8Qnl0tol9DrU7NULCoj07oGXsN5qZwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5dyYsaB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12997C4CEF7;
	Sat, 17 Jan 2026 21:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768686702;
	bh=b/0coEcvYCaguhsk+YDhiScezyJeihutu1g5DzC6wDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5dyYsaB11Qm+4R8fcqD9BQARxzQihhkx8AO77fVZ+c2YZam2ctzR3ILV8wDYT+4j
	 Qxt5AlavAN3bX8OSanlR4wyUwV3lgqd1W/nLLRzMsGaRBWEfEhgBUk/3li9hXxfuTz
	 SCu16f+op8gFzDUl4kgqyGeDfvuEQ9eSH4tfYqQQM1rdS5r754YqTq0K40Z2wxKu93
	 XftjVvFxzwObGG8whMqfWeRt8mZGK2RewkHfdQoiSguebIsvkjCh758Hm/lfD6z4Fc
	 z26lD77qUn7Tvqxcb3Ef092hvC/LfRN5wEty/YAFsWzQs533Tq8AiA4zgoJdRHSczh
	 oEN0xajDq2SZw==
Date: Sat, 17 Jan 2026 15:51:40 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <mty6ycfsugaheljicomeucsak7ziakftf22cnikinla7hvthax@f6yu4pmrpuvp>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>

On Fri, Jan 16, 2026 at 12:53:18PM -0800, Satya Durga Srinivasu Prabhala wrote:
> Hello Sudeep,
> 
> Thanks for the discussion & feedback.
> 
> Wanted to check on below possibilities to disable the SMCCC SOC ID at the
> vendor end, can you help comment?
> 1. Introduce cmdline option
>    We are trying to pursue that in Android Kernel -
> https://android-review.googlesource.com/c/kernel/common/+/3912874
> 2. Mark SMCCC SMC ID driver as tristate & module as suggested by Dmitry

What happens when I boot a system with module autoloading?

What is the expected behavior of userspace when it faces two soc nodes?

Regards,
Bjorn

