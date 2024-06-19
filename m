Return-Path: <linux-arm-msm+bounces-23193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9EB90E643
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 10:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25E5E283E6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 08:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276E17D06B;
	Wed, 19 Jun 2024 08:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5IqqHzz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E592139B1;
	Wed, 19 Jun 2024 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718787052; cv=none; b=Hv2TlYhaWG7PlKpbZaWqezigfj+6RTBy4w2w/yWdg/CiRmkGwwEuRivNFPY8ruUVPpQc3SJmUnLn8jj+rShhgOijrJtlR1LwZlitK7InYG0ACeQxAxbiTBsD7mpJlKgPTHiG95zbG+yyh+mjtr8OoOA0MpEbFCFunWSbKPcHZiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718787052; c=relaxed/simple;
	bh=ZCCMGl34xRrIKFTYqowJ46msSrObNO3g4OFsLbjVgBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNFEGQZM58fKi577pvnRiwl/C1dzJ9B2MbDw5lUfvBu4GB4n+NMq1S2bbFMDfFBq1aG/704v1MXaV3llMveHWFfGKA1X5JsJmMSIX0BGr5h0PIoxE7eF0128Z4ju2bOJQnpZwLL13XuKodD35GvhaktPiGCpLJyh8T9DtdVY4GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5IqqHzz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2D9C2BBFC;
	Wed, 19 Jun 2024 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718787051;
	bh=ZCCMGl34xRrIKFTYqowJ46msSrObNO3g4OFsLbjVgBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i5IqqHzzyDvvOl6iLxEDIR5dMU74s6v2Y4FQ5uVlOuLUiiUQEkqvRWeVfyIC7XzW0
	 LSe0P0Q91bQI3evoiNVkNgM+k81s2N6bhKzUZVpqsdcMt0dt948OKkIxsRkBopabvk
	 ft4Fr0mVgNal3jNL5yVseCX+4FyOE5ui0YNo0UmxVecFAd8IDqO8XeGJcmgtp7MB5U
	 dKjJZvfAGBODt7Y+t36+YK0RkrynGueLxL3lA45XhexXMgU0+KtT9ymog3h4qBpVNN
	 4Pqs7iDuITxq/9wDCEqyCuNY49ITHpXtzWx/dGghtjg6TVm2luxTUxzz5bV7J5zZCl
	 daMrlyGnuIVTQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sJr1m-000000003N9-3viY;
	Wed, 19 Jun 2024 10:50:51 +0200
Date: Wed, 19 Jun 2024 10:50:50 +0200
From: Johan Hovold <johan@kernel.org>
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
Message-ID: <ZnKb6oMGcA-tWtxy@hovoldconsulting.com>
References: <20240610222515.3023730-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610222515.3023730-1-dianders@chromium.org>

Hi Doug,

and sorry about the late feedback on this (was out of office last
week).

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

Thanks for taking a stab at this. This is indeed a known issue that has
been on my ever growing TODO list for over a year now. I worked around a
related regression with:

	9aff74cc4e9e ("serial: qcom-geni: fix console shutdown hang")

but noticed that the underlying bug can still easily be triggered, for
example, using software flow control in a serial console.

With 6.10-rc1 I started hitting this hang on every reboot. I was booting
the new x1e80100 so wasn't sure at first what caused it, but after
triggering the hang by interrupting a dmesg command I remembered the
broken serial driver and indeed your (v2) series fixed the regression
which was also present on sc8280xp.

I did run a quick benchmark this morning to see if there was any
significant performance penalty and I am seeing a 26% slow down (e.g.
catting 544 kB takes 68 instead of 54 seconds at 115200).

I've had a feeling that boot was slower with the series applied, but I
haven't verified that (just printing dmesg takes an extra second,
though).

Correctness first, of course, but perhaps something can be done about
that too.

I'll comment on the individual patches as well, but for now:

Tested-by: Johan Hovold <johan+linaro@kernel.org>

(I did a quick test with Bluetooth / DMA as well.)

Johan

