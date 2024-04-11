Return-Path: <linux-arm-msm+bounces-17154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4348A069F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 05:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 907D61C220A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 03:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD38613B5B4;
	Thu, 11 Apr 2024 03:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbOGalvr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A951513B2A5
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 03:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712805579; cv=none; b=XEYVb9h18N6wRBcFAgzOregLy9w6m7320SSvi7F0GOi3x0ncnuDQ2F+SAXjvlJCxkfnkkZMgJ3fm+C8/FzF8fzbzJeSV54iyi+rLrX0Nf025Q4c8ooKKpa5oE7h/Dzl/dmgDYtXrgPKuofpRMlulXepNEuptfo8Yy0HwxtDWaCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712805579; c=relaxed/simple;
	bh=4g2EVh7ufizZZVvTNT68ZqhVPbZBy4kc6I/WqFW4K9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bubWBnJSlGWJ55eZ0MqzBgG1quw7HBII4lelEU8isYMoTMDU6HLsn3mfu0ZxPWBZppyqtjsuEjuXoPjRDPBN75K4IzsH2h1d7Zr3UjkfrD0X0Ss/dxS3YJEyz7EJJ+j+vROcZjxMsjFf4Odi9ZBnOXrFwhWgg5xNwxRbDN/aBtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbOGalvr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE256C433C7;
	Thu, 11 Apr 2024 03:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712805579;
	bh=4g2EVh7ufizZZVvTNT68ZqhVPbZBy4kc6I/WqFW4K9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NbOGalvr+SuiCUcdzSe/p/9/60RWWezgDA6YM/Jgv9BZl7cCq+Hhspnlog5EoUhGm
	 sk2Wj0GDxJpRo361HdVcO94Q6Nz7/ANDLwFJwQt35rDt6Uqk//4RR9KN+br1fIXK0C
	 SxUyqsyXdQPfBCUcp5y/GMGeod7gfBDLyg08OCf++0PZ6PvN2pS40raYioaOpeXwBJ
	 /iGTr4OhJsoT7Udot1g7QcK0mcSydmey9LoCdVQi1xapfSehLE6Q7iIGRw9n2Wahxx
	 Rtp9wVpblR4s8eTKfTVO41cbT0eMJK7l/XR3lbJWbqA2FdT3/+L51kYL6ftd2qcK2V
	 zXzlZ2ylROKlA==
Date: Wed, 10 Apr 2024 22:19:36 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: defconfig: build INTERCONNECT_QCOM_SM6115 as
 module
Message-ID: <xzb37tt5e23pbsi2usdvtaamxqbjgivwfgd3lbpukoahkcziox@5mwat7kaicjl>
References: <20240409-enable-sm6115-icc-v1-1-bf894fb5a585@linaro.org>
 <a1aa0f4a-868c-4386-ba6a-9962f827bb2b@linaro.org>
 <CAA8EJpoinJ999jYsEhBqoV=J0fB+0_odO_EEXveQdjB3+GfJkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoinJ999jYsEhBqoV=J0fB+0_odO_EEXveQdjB3+GfJkg@mail.gmail.com>

On Wed, Apr 10, 2024 at 01:12:15AM +0300, Dmitry Baryshkov wrote:
> On Tue, 9 Apr 2024 at 23:02, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > On 4/9/24 20:27, Dmitry Baryshkov wrote:
> > > Enable CONFIG_INTERCONNECT_QCOM_SM6115 as module to enable the
> > > interconnect driver for the SoC used on Qualcomm Robotics RB2 board.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> >
> > =y for console?
> 
> I think with pinctrl being set to m it won't reach the console anyway.
> And earlycon should work w/o ICC driver if I'm not mistaken.
> 
> Several other Qualcomm platforms also have interconnects built as
> modules in defconfig. I really suppose that we should move all such
> drivers to =m and force using initrd. But this sounds like a topic for
> plumbers.
> 

That currently does not work very well, because if you probe defer the
UART into the future e.g. systemd will open /dev/console before it
exist - with no interest in reopening that later.

So, if you care about UART, that is suboptimal.

Resolve this, and I'd be happy to see them all go =m.

Regards,
Bjorn

