Return-Path: <linux-arm-msm+bounces-31952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C0197BA86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 12:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA8A91F277B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 10:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FAA17085C;
	Wed, 18 Sep 2024 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEJx++iA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B209F9E4;
	Wed, 18 Sep 2024 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726653963; cv=none; b=HNUDa/4w4zMqDb/rTvyYpycbRkLjfMAJBHWYnXqm33oy7dPHgknSzPfKS4eZnCD9EtxwaoDd6RxBbD555CHQVsvfIZfG4g/b1voZD40YkyvOy4daGSokN6Ffw1MMC0qnTCmg1LSIK6s0T8DPp/xDRdnuCozV0uIa5t14FenA98c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726653963; c=relaxed/simple;
	bh=b9ubWyNkci8vVhzFdYA9KsCYZugo7cm3IlQEuh6iue0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyABcLhTpfSwFSYJR09++l2x1U+UoSl4fI5nqJRee1+JNfstzGaTC/QNX9Shnjhsq2mOrHsziYOn1cUuDITWCnjzcNSD6uv+1WLt+mkpI0KvCeod5Aar+5aNtdN1c3IMBuCf/nGSsuk+xBAeXitqeQiTlAElcqEsakLbgtImi9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEJx++iA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4148EC4CEC3;
	Wed, 18 Sep 2024 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726653963;
	bh=b9ubWyNkci8vVhzFdYA9KsCYZugo7cm3IlQEuh6iue0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEJx++iAkxnatHlTFHLGHaXqoTECueNrOQcMMlX/zjJgsMyeCZJsBOdEJu518FI3r
	 fg4AzPtrCdoLe5UmpM0+JV+LuKm1iGDMKhQ1jOW11y/kYMnQtFk5Bf4LSNIvbIRglv
	 MGUSnG2YtW3q4Zy4nXBZLQhgdk+n+xRyzsCaHO9LrfnHharz7jbh+hag9f3KGCTSMp
	 zx3Fmw/bDIKBtxx0yxWRG1icj/5uw2RWfuUvoES18G22SAP2gGrUN8SmYXvAYQM4bV
	 waI4WOurk1DOrqdN6aBRoCL3Uc/+4bQCobP7j/Px+gHkDt9lFgHdMIV7iZ8n1I5HdZ
	 1MqeZbIQXO1ow==
Received: from johan by theta with local (Exim 4.98)
	(envelope-from <johan@kernel.org>)
	id 1sqrZP-000000001j5-2CWn;
	Wed, 18 Sep 2024 12:05:59 +0200
Date: Wed, 18 Sep 2024 12:05:59 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: edp: Add runtime PM support
Message-ID: <ZuqmB3Cn7mGfA2PU@hovoldconsulting.com>
References: <20240907-phy-qcom-edp-enable-runtime-pm-v1-1-8b9ee4210e1e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240907-phy-qcom-edp-enable-runtime-pm-v1-1-8b9ee4210e1e@linaro.org>

On Sat, Sep 07, 2024 at 06:25:21PM +0300, Abel Vesa wrote:
> Enable runtime PM support by adding proper ops which will handle the

Avoid words like 'proper' here (what are non-proper runtime PM ops?).

> clocks and regulators. These resources will now be handled on power_on and
> power_off instead of init and exit PHY ops.

No, this is simply a false claim and indicates that you haven't reviewed
how PHY runtime PM works. Core will increment the usage count on init()
and decrement it on exit().

> Also enable these resources on
> probe in order to balance out the disabling that is happening right after.
> Prevent runtime PM from being ON by default as well.

And here you just regressed all current systems that do not have udev
rules to enable runtime PM, and which will now be stuck with these
resources always-on (e.g. during DPMS off and system suspend).

In fact, you are even regressing systems that would enable runtime PM,
as the runtime suspend callback would not currently be called when you
enter system suspend so the regulators and clocks will be left on.

This clearly hasn't been tested and analysed properly.

> +static int __maybe_unused qcom_edp_runtime_suspend(struct device *dev)
> +{
> +	struct qcom_edp *edp = dev_get_drvdata(dev);
> +
> +	dev_err(dev, "Suspending DP phy\n");

You forgot to drop your development printks (same below).

Johan

