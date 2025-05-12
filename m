Return-Path: <linux-arm-msm+bounces-57631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B75E9AB4447
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 21:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EEDC3A814C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 19:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814C7296FB2;
	Mon, 12 May 2025 19:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZxtI6ytx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AzqX/2Cx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD04297120;
	Mon, 12 May 2025 19:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076747; cv=none; b=nbp2kYuzYfr5wqON9tWN8QKLjMUHGWGBuv3Y96Pg/qB7zOSlk93egZRM98589qPeP/kD3prlMe0ZtU8qaI4lzh5fZ54cOpL3KEZpoZ6nfYbH1qeLfX/4ykecnBnyStQDhgHtAFv1oQcfNMJsVuIkNdzcKmCFvF+Mk/9f22/BJe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076747; c=relaxed/simple;
	bh=pFVpPTz6lSGVV0l8xYgVNStpIBr1ucdcf8t/1Bf+hqA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tTBCGW0VK85tKD2air+aWVPkod6noDEj9/7xC8rB3Ab31knML7cqsWOsZy3G7AV1QbV4d76vOX5EPFo7VSDCtF389SgGmB/j1n/i8zyEU5NiMoHAxE0Xd23rg/5c/xkw2Hs5/IEUU2oj93eeUmh2/c9y3I4HzE9wrGimeAqJOKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZxtI6ytx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AzqX/2Cx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747076744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pFVpPTz6lSGVV0l8xYgVNStpIBr1ucdcf8t/1Bf+hqA=;
	b=ZxtI6ytxS/zZVj+/K5/V0KMYfYg0ilqSDVk13u6Eu2X2GN5kyAdAgw8zOnjgkuD65P8KHJ
	2qslRe9eTN1NOUjOMrC+LHrZSwvNhhykxpgOZfrDW9ghg6DNV5zMzjnRv7EQXlIJT3dOX4
	eXM/nWrZHjEZOkGqSRiR3wZyat5Dyi12O2PpZbY/wldHu1y2cEw21NyGnAztzFvnbX41c+
	nuHOUctMRAmyT5gPEfAUKkuowV2xhIHoScqWReB+khh5HULoMt3YkjMPix9P+jzi9aayhW
	6T4l3xCbiusS0sdTFpgRfEIUrHtUZ1rmN/Cc+vvqwhBn3fLMXmGZrD2Dz9aZWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747076744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pFVpPTz6lSGVV0l8xYgVNStpIBr1ucdcf8t/1Bf+hqA=;
	b=AzqX/2CxbUKc5tGH3qJ0uCV8nEWURfM4ZS/rUMdqE3PtYqTlZxgvynUc/5kiVR7uykAWJc
	+j4pqgjspIBJm1DQ==
To: Alexey Klimov <alexey.klimov@linaro.org>, linux-next@vger.kernel.org
Cc: peterz@infradead.org, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org
Subject: Re: [linux-next regression] remoteproc seems to be broken
In-Reply-To: <D9SXI3F82EFT.7WY8FQ9P4RHL@linaro.org>
References: <D9SXI3F82EFT.7WY8FQ9P4RHL@linaro.org>
Date: Mon, 12 May 2025 21:05:43 +0200
Message-ID: <87tt5pk5tk.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, May 11 2025 at 02:09, Alexey Klimov wrote:

> Hi,
>
> we started to observe regression on linux-next starting with next-20250508.
> Neil bisected it and it pointed to:
> 2ef2e13094c7510c40833951c2ec36cf8574331a
> genirq/chip: Rework handle_nested_irq()
> https://lore.kernel.org/all/20250429065420.744042890@linutronix.de
>
>>No functional change.
>
> Manually reverting that commit resolved the problem for me.

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=irq/core

