Return-Path: <linux-arm-msm+bounces-88729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE6AD17A66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15C2130802AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C9338BF87;
	Tue, 13 Jan 2026 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSWGcMNG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB6F38B7D4;
	Tue, 13 Jan 2026 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296270; cv=none; b=oVqgswDteLfJ0TWqAFNNSVa4GYlIwiJAOZbPgaus0k477cVNkAS9bsNes62v9YXAchfbWGtjO1rD0221UiPZCqskrAS+UEbzfJpKG4vd3AmZwounGzF0pln6WOTl9Ypvod+UJ/4k+Q1bKgDIDTeJ2v5rYiNsTqwQ+jUzvXmGvL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296270; c=relaxed/simple;
	bh=D+89R93nA4hL5DdQWuRh7a4c9W2Lwb0hyXg1tNKw0GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsjsiE8CiwCl55MUfrhPrdxSh1rOLw22dE+XDt+Ia58VA5coOaCKtcmiGdocH7LZZboBA825iWsSStlFg/R4bg9QFT01JPcp3zaMtR9yX4d8a/BoEiV0JNJwsxkaC4OKYCpApOE6I2h2QLe9/Zj2PLEGnPNtvb6MFDDoecMbBiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSWGcMNG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379FEC116C6;
	Tue, 13 Jan 2026 09:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768296270;
	bh=D+89R93nA4hL5DdQWuRh7a4c9W2Lwb0hyXg1tNKw0GU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KSWGcMNGrtxSYxlxttwK32/xvDhk65H3nWkiSUD+Cm+J6ao1jHnegLyCrQZjeQw+Y
	 hvaEI4S2QifRq3PzzXwRr4QCanByHVzrPH7T5FoLGMi++qaTHqSk3QI4iQchXZLngi
	 VMWWT4nxoEwoZIAHAjrficz7EH/JZm0MCagK/QGPd0+EnC/Ku0tkKFpcT0AO9P4wV+
	 yqt1NnT4hBRQB7NxobjTp3Oo+CKFbkCSHZqYKBxPUHPE0cqQvpEsXKXvQpLYfUWhiX
	 kB4yTcBPCccwyznyws+ipZkbRCjG8lsvnUqT2FWfP6U4WtEzDjmBc8vHkG1r2WqxIx
	 XZWiWZ/zhhkXw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vfadS-000000005RZ-3NCz;
	Tue, 13 Jan 2026 10:24:22 +0100
Date: Tue, 13 Jan 2026 10:24:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mfd: qcom-pm8xxx: fix OF populate on driver rebind
Message-ID: <aWYPRryYNYcl8IjI@hovoldconsulting.com>
References: <20251219110947.24101-1-johan@kernel.org>
 <20260109152738.GK1118061@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109152738.GK1118061@google.com>

On Fri, Jan 09, 2026 at 03:27:38PM +0000, Lee Jones wrote:
> On Fri, 19 Dec 2025, Johan Hovold wrote:
> 
> > Since commit c6e126de43e7 ("of: Keep track of populated platform
> > devices") child devices will not be created by of_platform_populate()
> > if the devices had previously been deregistered individually so that the
> > OF_POPULATED flag is still set in the corresponding OF nodes.
> > 
> > Switch to using of_platform_depopulate() instead of open coding so that
> > the child devices are created if the driver is rebound.
> > 
> > Fixes: c6e126de43e7 ("of: Keep track of populated platform devices")
> > Cc: stable@vger.kernel.org	# 3.16
> > Signed-off-by: Johan Hovold <johan@kernel.org>

> > -static int pm8xxx_remove_child(struct device *dev, void *unused)
> > -{
> > -	platform_device_unregister(to_platform_device(dev));
> > -	return 0;
> > -}
> > -
> >  static void pm8xxx_remove(struct platform_device *pdev)
> >  {
> >  	struct pm_irq_chip *chip = platform_get_drvdata(pdev);
> >  
> > -	device_for_each_child(&pdev->dev, NULL, pm8xxx_remove_child);
> > +	of_platform_depopulate(&pdev->dev);
> >  	irq_domain_remove(chip->irqdomain);
> 
> Have you explored devm_of_platform_populate()?

Yeah, but mixing devres and explicit release risks introducing bugs. And
here we want to make sure the children are deregistered before freeing
the irqdomain.

Johan

