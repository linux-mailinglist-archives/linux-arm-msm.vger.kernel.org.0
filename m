Return-Path: <linux-arm-msm+bounces-23479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6136E911698
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 01:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FC0A283DA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 23:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4336D14E2CC;
	Thu, 20 Jun 2024 23:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hTvJBcuw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699A213777F;
	Thu, 20 Jun 2024 23:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718925238; cv=none; b=cJHSvzpchC8+Z2TDOTyt9InAvYmaMWiHFfXNgG6Onmq6ZQCpTQDYxyGZKOeeWmB9ASnxSYbWegc8BpJYMDSQ+ibzO/uDfZyIhl+Jo2tvtmyg9Uhqpb1G7T7MGLtkShOWawN3lfSUN17Jy26ZmWHBMHZzTVPcn0r3H68/YxKZ1Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718925238; c=relaxed/simple;
	bh=9HzkK7C6QP0wU1bz0WqLU2lp3y7wTd1ilGjTm87GnD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXTrRRyHM79QtF8GI/gBtpkn7IibIH2akcLxYD8JxknXwbB+oZvEVwZW6XJtCw8JTxMzrqamz+qiJHQ/HM6iuwg5WVQv8WToYbM24IBnOy1bvDa6ss9vGZOeFlwZGmZhnnRibkR/AeBBmfKLz0+BmF1mopz7Tf4jzlDm4k6IYfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hTvJBcuw; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718925234;
	bh=9HzkK7C6QP0wU1bz0WqLU2lp3y7wTd1ilGjTm87GnD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTvJBcuwQluvJb6oWZQw82YRvsdGMW08czC0IhEoBELreca39SSJrIS9dbUgnd+E/
	 Ua3QHIXMFiXvuHOjsciB3C7Kk3QB5hQTfuuaS9JWgIqea2IbL826GqFS9QjBdTjOvx
	 9Z9np1yOnjQCtKzptaVN4GQE7+nijeikrO6Y5pGLR+OosSszB2+uPUcTWwst/i6Mcw
	 tsJNu1K9/sf8vz8blusGs9JJo7uJz6X3/UA89vfMk8IGIijuZTst4YdYRnGctEv4j8
	 ooaf77QS7Wg3GoThF6tfrk/4ap/VMg82vtpuDam54f3xzeukKXd7y80PfGbwPEY0X5
	 y71iPD8cArRvQ==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4F48B37820FA;
	Thu, 20 Jun 2024 23:13:51 +0000 (UTC)
Date: Thu, 20 Jun 2024 19:13:49 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Tony Lindgren <tony@atomide.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: Re: [PATCH v4 0/8] serial: qcom-geni: Overhaul TX handling to fix
 crashes/hangs
Message-ID: <46f57349-1217-4594-85b2-84fa3a365c0c@notapiano>
References: <20240610222515.3023730-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240610222515.3023730-1-dianders@chromium.org>

On Mon, Jun 10, 2024 at 03:24:18PM -0700, Douglas Anderson wrote:
> 
> While trying to reproduce -EBUSY errors that our lab was getting in
> suspend/resume testing, I ended up finding a whole pile of problems
> with the Qualcomm GENI serial driver. I've posted a fix for the -EBUSY
> issue separately [1]. This series is fixing all of the Qualcomm GENI
> problems that I found.
> 
> As far as I can tell most of the problems have been in the Qualcomm
> GENI serial driver since inception, but it can be noted that the
> behavior got worse with the new kfifo changes. Previously when the OS
> took data out of the circular queue we'd just spit stale data onto the
> serial port. Now we'll hard lockup. :-P
> 
> I've tried to break this series up as much as possible to make it
> easier to understand but the final patch is still a lot of change at
> once. Hopefully it's OK.
> 
> [1] https://lore.kernel.org/r/20240530084841.v2.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid

Hi,

we've experienced issues with missing kernel messages in the serial on the
sc7180 based platforms in our lab for a while now.

I've just run a batch of jobs that just boot and write some messages to
/dev/kmsg on sc7180-trogdor-lazor-limozeen. Before the patch, in 18 out of
20 runs the first message would be missing in the logs causing the test to fail.
After the patch all 20 runs passed. So this is a clear fix, and I'm very happy
to say goodbye to this issue. Thank you!

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

FTR, this is the issue ticket in KernelCI:
https://github.com/kernelci/kernelci-project/issues/380

Thanks,
Nícolas

