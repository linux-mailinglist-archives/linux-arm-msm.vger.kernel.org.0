Return-Path: <linux-arm-msm+bounces-19213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B078BBD0E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 18:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8363B2111E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 16:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7102A502B3;
	Sat,  4 May 2024 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fezc/zo1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A2E208C4;
	Sat,  4 May 2024 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714839712; cv=none; b=XBpMkpbedCbFb0t/bFiiNCc74+ozbvfzeQvLFIKwHnHrIcJTaVpI4kFwwgz/6hHiy8uoMwQzLelNCVzDIuERYRXM4gWROaBTscG7DLrddSGZ3U0sPN9t7m/pmwDcIKucwVkNkVbe7XN8B2a6u1h029byL/wj9DE4Vmz56YV34AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714839712; c=relaxed/simple;
	bh=BCOzB9V/gIPN7sgBRmyyILrDfAl5PNbRnic0ZX2G7Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CB4Az/CtJf8Plm2NCHTx+kWEd/VZzgsZhTzx5EmsAyi98QOX0jkY3VWe/ozHXiYYXY4a13VETrehvoeImjCneE1sHSs4QTk3PZUTUsYpkgx+wucM4eGqQVCNiRMAIe/vv57SQiwBnbdidRfFY5wghoOCqHxZ6kNjYKnGt9oj1H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Fezc/zo1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA6AC072AA;
	Sat,  4 May 2024 16:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714839711;
	bh=BCOzB9V/gIPN7sgBRmyyILrDfAl5PNbRnic0ZX2G7Rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fezc/zo1eLxf4H/thKanhcf4UphQb+KXnRvuCxeO0im+X1mPOUtVnB26c9tXcPGNO
	 AA4bhxG/qY0SFBafiVozjqmuJQxHlb/n70JgtqX5kjgraVEdP3RlHtuSr4RW0WsCmu
	 GEOiermybFDk81gA6IqOLxIJQpgQ/Y/e9vXntP6c=
Date: Sat, 4 May 2024 18:21:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Connolly <caleb.connolly@linaro.org>
Subject: Re: [PATCH v4] usb: typec: qcom-pmic-typec: split HPD bridge alloc
 and registration
Message-ID: <2024050432-math-iguana-e3c3@gregkh>
References: <20240424-qc-pmic-typec-hpd-split-v4-1-f7e10d147443@linaro.org>
 <CAA8EJppCxfrBcctaR2jOrwPuO8ZFQw9vmi-0CH_sSWBm3ts7JQ@mail.gmail.com>
 <2024050415-retorted-gory-5fa6@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024050415-retorted-gory-5fa6@gregkh>

On Sat, May 04, 2024 at 05:15:45PM +0200, Greg Kroah-Hartman wrote:
> On Sat, May 04, 2024 at 05:23:20PM +0300, Dmitry Baryshkov wrote:
> > On Wed, 24 Apr 2024 at 05:16, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > If a probe function returns -EPROBE_DEFER after creating another device
> > > there is a change of ending up in a probe deferral loop, (see commit
> > > fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER"). In case
> > > of the qcom-pmic-typec driver the tcpm_register_port() function looks up
> > > external resources (USB role switch and inherently via called
> > > typec_register_port() USB-C muxes, switches and retimers).
> > >
> > > In order to prevent such probe-defer loops caused by qcom-pmic-typec
> > > driver, use the API added by Johan Hovold and move HPD bridge
> > > registration to the end of the probe function.
> > >
> > > The devm_drm_dp_hpd_bridge_add() is called at the end of the probe
> > > function after all TCPM start functions. This is done as a way to
> > > overcome a different problem, the DRM subsystem can not properly cope
> > > with the DRM bridges being destroyed once the bridge is attached. Having
> > > this function call at the end of the probe function prevents possible
> > > DRM bridge device creation followed by destruction in case one of the
> > > TCPM start functions returns an error.
> > >
> > > Reported-by: Caleb Connolly <caleb.connolly@linaro.org>
> > > Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > > Dependency: https://lore.kernel.org/lkml/20240418145730.4605-2-johan+linaro@kernel.org/
> > > ---
> > > Changes in v4:
> > > - Rebased on top of Johan's patches
> > > - Link to v3: https://lore.kernel.org/r/20240416-qc-pmic-typec-hpd-split-v3-1-fd071e3191a1@linaro.org
> > >
> > > Changes in v3:
> > > - Updated commit message to explain my decisions (Johan).
> > > - Link to v2: https://lore.kernel.org/r/20240408-qc-pmic-typec-hpd-split-v2-1-1704f5321b73@linaro.org
> > >
> > > Changes in v2:
> > > - Fix commit message (Bryan)
> > > - Link to v1: https://lore.kernel.org/r/20240405-qc-pmic-typec-hpd-split-v1-1-363daafb3c36@linaro.org
> > > ---
> > >  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > A stupid gracious ping. It would be nice to fix the issue in 6.10
> 
> Is this a regression?  If so, what commit does it fix?  Or has it always
> just not worked?

Nevermind, you meant 6.10, not 6.9, my fault, queueing it up now...

greg k-h

