Return-Path: <linux-arm-msm+bounces-4778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C928134F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 16:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 750AD1C20AF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 15:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA455D8E0;
	Thu, 14 Dec 2023 15:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OitvvanX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FDD5CD14
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 15:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214F1C433C8;
	Thu, 14 Dec 2023 15:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702568318;
	bh=brtBYO+yjwauuTE/WiwDaux0zB+BgCD25n+R1WAC2ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OitvvanXq20Vh7pXwImIER2xZrfgDg27ss6pa2YNQAujQPxMSX+hOJbhwXpMbOaWq
	 Uy805fr1ljRaj+p+OHsK2rSRoDSyROAtebpHfDck1N6iIbaLAr42166FF132Sl5jKw
	 Xmb+q3YR67kSG8SJw4uB6ZJ5F5tyXs2AhXl+xLxL3u41ZcMTugV39/6QWEUFo77Acf
	 UOFNwzojiSMFg6aq7aw6EHvPnShZ46Q7X+genuYdPUAtlue4nvSc9oPKtRvGAyn0z1
	 K2Y1HJ1rsW1xkvC0wnGbtHBKjJfBwV8OdErm2VYMjB/dMq07nBnY++bKaAB7owp++K
	 8klBI2Fypstmw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rDnnH-0004m5-0e;
	Thu, 14 Dec 2023 16:38:35 +0100
Date: Thu, 14 Dec 2023 16:38:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: pmic_glink: Fix boot when QRTR=m
Message-ID: <ZXshe83quTE0jO_Z@hovoldconsulting.com>
References: <20231213210644.8702-1-robdclark@gmail.com>
 <ZXqr0RFw9KsP876v@hovoldconsulting.com>
 <CAA8EJpoSvaq9imP-dT4p=4jveZyFmh=OoWOP7jWGo4OYkHQDTA@mail.gmail.com>
 <ZXsKzsij3Xb50Ap9@hovoldconsulting.com>
 <CAA8EJpqBstKyAfUcBPzoF2CitTwWBZ9Xhd28Y+FCo14OoBqkxw@mail.gmail.com>
 <ZXsMoFiivUCWA0yr@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXsMoFiivUCWA0yr@hovoldconsulting.com>

On Thu, Dec 14, 2023 at 03:09:36PM +0100, Johan Hovold wrote:
> On Thu, Dec 14, 2023 at 04:04:49PM +0200, Dmitry Baryshkov wrote:
> > On Thu, 14 Dec 2023 at 16:01, Johan Hovold <johan@kernel.org> wrote:
> > > On Thu, Dec 14, 2023 at 01:04:43PM +0200, Dmitry Baryshkov wrote:

> > > > This is a known problem. Successful probes during the probe deferral
> > > > loop causes the whole loop to be reiterated. Creating child devices
> > > > usually results in  a successful probe. Aso I thought that just
> > > > creating new device also causes a reprobe, but I can not find any
> > > > evidence now.
> > >
> > > This still needs to be described in the commit message.
> > >
> > > Only a successful probe should trigger a reprobe, and when the child
> > > devices are registered the parent is not yet on the deferred probe list.
> > > So something is not right or missing here.
> > 
> > Child devices can be successfully probed, then the parent gets
> > -EPROBE_DEFER, removes children and then it goes on and on.
> 
> So what? As I described above, the successful probe of the children
> should have nothing to do with whether the parent is reprobed.
> 
> If that isn't the case, then explain how.

I took a closer look at this and indeed we do have code that triggers a
reprobe of a device in case there was a successful probe while the
device was probing.

This was introduced by commit 58b116bce136 ("drivercore: deferral race
condition fix") and the workaround for the reprobe-loop bug that hack
led to is to not return -EPROBE_DEFER after registering child devices as
no one managed to come up with a proper fix. This was documented here:

	fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER")

But please spell this out in some more detail in the commit message, and
add a Fixes and CC stable tag.

Johan

