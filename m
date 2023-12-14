Return-Path: <linux-arm-msm+bounces-4783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 847028135B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 17:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CB9C1F214A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 16:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867DA5E0C0;
	Thu, 14 Dec 2023 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHjBO8lW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B10A5B5BB
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 16:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB93BC433C7;
	Thu, 14 Dec 2023 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702570128;
	bh=7VdQ12yzugL+1GbrdoTtZ7vj4jv3wa5jxL47AyNqvsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHjBO8lWhnQOepC1LMp4PWZfEceaLGvxOpYWiG9SrVosws48/QT47+jviCXOc9Nwr
	 sWwdnRdQR8vUXkpZcndzlrAtOzDvSydeHZ7MsqtakVLS0fIN4h3H+kWHuOsjc2qwZd
	 H+y9DxAkLzeVghLeBd5Zn83xxdcJD6qdhFWMkIOTqvbgZpwJ3gH7HM24HDf1cr4YVy
	 VxXTWQkUISumkeL41JwVyz+XMs9AWJvpfasCmZvLibyWHnwWwgvFMEajfq5Y4FnKkJ
	 uNfwwNiNAV9Xi7Wcq2yq+farVAhAG22Cb8+hVbjdv8P9laoiArWPLrOBM0DtDI/8Np
	 bBTyW0hUmdagg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rDoGS-0005mK-2v;
	Thu, 14 Dec 2023 17:08:44 +0100
Date: Thu, 14 Dec 2023 17:08:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: pmic_glink: Fix boot when QRTR=m
Message-ID: <ZXsojADuspUVLbIn@hovoldconsulting.com>
References: <20231213210644.8702-1-robdclark@gmail.com>
 <ZXqr0RFw9KsP876v@hovoldconsulting.com>
 <CAA8EJpoSvaq9imP-dT4p=4jveZyFmh=OoWOP7jWGo4OYkHQDTA@mail.gmail.com>
 <ZXsKzsij3Xb50Ap9@hovoldconsulting.com>
 <CAA8EJpqBstKyAfUcBPzoF2CitTwWBZ9Xhd28Y+FCo14OoBqkxw@mail.gmail.com>
 <ZXsMoFiivUCWA0yr@hovoldconsulting.com>
 <ZXshe83quTE0jO_Z@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXshe83quTE0jO_Z@hovoldconsulting.com>

On Thu, Dec 14, 2023 at 04:38:35PM +0100, Johan Hovold wrote:

> I took a closer look at this and indeed we do have code that triggers a
> reprobe of a device in case there was a successful probe while the
> device was probing.
> 
> This was introduced by commit 58b116bce136 ("drivercore: deferral race
> condition fix") and the workaround for the reprobe-loop bug that hack
> led to is to not return -EPROBE_DEFER after registering child devices as
> no one managed to come up with a proper fix. This was documented here:
> 
> 	fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER")
> 
> But please spell this out in some more detail in the commit message, and
> add a Fixes and CC stable tag.

And please update the commit summary as I've been booting with QRTR=m
all along just fine. I guess the issue is if you have pmic_glink
built-in or in the initramfs but forgot to include qrtr or similar?

Johan

