Return-Path: <linux-arm-msm+bounces-4772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BAB813262
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 15:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84E05280F70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 14:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39725811E;
	Thu, 14 Dec 2023 14:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+q8Nh8N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986845579A
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 14:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4F2C433C7;
	Thu, 14 Dec 2023 14:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702562513;
	bh=3r3g7bIo3sjseeWV5/DRYEPcjrp1JoaPlGCxb6Ob5QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I+q8Nh8NF2rssDlqnmFsZSPw6QZe8EqIwWcQg+8/ULrRxAalHiLwIx4r87jyOnCJM
	 RpqYsrX8VhC7vMHd9FVvktT5sEPUoZmVPHCDwzuSXzyf4EXmghHHtgR6tyLgEgVoRQ
	 AoXsQWJ28PV/zlP0d0Ua279YSDakUseNe/XaBmassFpcg33+VCF/X+rFH6jS0wvHvX
	 gXRCfN3Lk2falUHK8z1u7Pbk+ECO8Zveb0WwYxbablilyHrqRIdim3DEg6iQUywE1c
	 8aVqkjLZBr26uvJfeH8b+yZj+NWXhsVfJQnhTMQmdin91K1jdtdwn2t/vnJpQiZ9QL
	 jUB3Qdbn1qf2w==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rDmHe-0007sY-0C;
	Thu, 14 Dec 2023 15:01:50 +0100
Date: Thu, 14 Dec 2023 15:01:50 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: pmic_glink: Fix boot when QRTR=m
Message-ID: <ZXsKzsij3Xb50Ap9@hovoldconsulting.com>
References: <20231213210644.8702-1-robdclark@gmail.com>
 <ZXqr0RFw9KsP876v@hovoldconsulting.com>
 <CAA8EJpoSvaq9imP-dT4p=4jveZyFmh=OoWOP7jWGo4OYkHQDTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoSvaq9imP-dT4p=4jveZyFmh=OoWOP7jWGo4OYkHQDTA@mail.gmail.com>

On Thu, Dec 14, 2023 at 01:04:43PM +0200, Dmitry Baryshkov wrote:
> On Thu, 14 Dec 2023 at 09:16, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Wed, Dec 13, 2023 at 01:06:43PM -0800, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > We need to bail out before adding/removing devices, if we are going
> > > to -EPROBE_DEFER.  Otherwise boot will get stuck forever at
> > > deferred_probe_initcall().
> >
> > Can please you expand on why this is a problem here in the commit
> > message?
> >
> > The aux devices appear to be tore down correctly in the probe error
> > paths so how exactly does that lead to deferred_probe_initcall() being
> > stuck? This sounds like we may have a problem elsewhere which this patch
> > is papering over.
> 
> This is a known problem. Successful probes during the probe deferral
> loop causes the whole loop to be reiterated. Creating child devices
> usually results in  a successful probe. Aso I thought that just
> creating new device also causes a reprobe, but I can not find any
> evidence now.

This still needs to be described in the commit message.

Only a successful probe should trigger a reprobe, and when the child
devices are registered the parent is not yet on the deferred probe list.
So something is not right or missing here.

Johan

