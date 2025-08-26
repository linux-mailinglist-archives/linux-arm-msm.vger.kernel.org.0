Return-Path: <linux-arm-msm+bounces-70905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF715B36CE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 17:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CB771C45D58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 14:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CA535AAA1;
	Tue, 26 Aug 2025 14:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y3R+aij1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE473469FC;
	Tue, 26 Aug 2025 14:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756219521; cv=none; b=X1Lyxyi7gJM8oPTUcxnrHO33rxbSwI8tF557zt0rDYJME2VYP/H+O1i7DezQgoUdZ94/gE6U6zCNLpywnWcl+qO5WIohVxsmVpInSETRuQhYQr751k/MOSzkWqL8+WrQebVinzMoxJe5Tx0IOGU6Yo4ltztTCn3CdL7cJQPAL8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756219521; c=relaxed/simple;
	bh=2fjsl71zFKbXs3ws16pco+vp93pc2Qs+5PISA74aiUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VehOJ0fUjSkSSnk7Hoy/vnpXClML6FIDnEl79W1VcuQ3Y+DJnDNM+jn4r6oLV0UbV7iKyx901Wo7Bj3jdsjKGm/CXXmoLb3x7GV6WE09mEh+r1qW9ZhHddxdXFjO19fDC8Id+wA1LdPw7pCZbAY09wsGH8o/VGx5wnbty5pLQO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y3R+aij1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C4BC113CF;
	Tue, 26 Aug 2025 14:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756219521;
	bh=2fjsl71zFKbXs3ws16pco+vp93pc2Qs+5PISA74aiUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3R+aij1aGBJdGAHoAvaLVaVHo3OsAEERdumuBbMQx9Afo2EKHbZGXh3bBZp1qOTU
	 6OGYULvDxm3rH0YZ3F3rCvnZ/rWuiZJx4oMRls2/vzUEbbJccEb263T6prDFHLgC66
	 DvdOd5WnNmRNoMQZA7iKNDoXp/Xd15KyfAUHfjMc=
Date: Tue, 26 Aug 2025 14:51:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, stable@vger.kernel.org,
	patches@lists.linux.dev, linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
	Ben Copeland <benjamin.copeland@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	srinivas.kandagatla@oss.qualcomm.com
Subject: Re: [PATCH 6.15 000/515] 6.15.11-rc1 review
Message-ID: <2025082612-energetic-lair-ee26@gregkh>
References: <20250818124458.334548733@linuxfoundation.org>
 <CA+G9fYt5sknJ3jbebYZrqMRhbcLZKLCvTDHfg5feNnOpj-j9Wg@mail.gmail.com>
 <CA+G9fYt6SAsPo6TvfgtnDWHPHO2q7xfppGbCaW0JxpL50zqWew@mail.gmail.com>
 <CACMJSeu_DTVK=XtvaSD3Fj3aTXBJ5d-MpQMuysJYEFBNwznDqQ@mail.gmail.com>
 <2025081931-chump-uncurled-656b@gregkh>
 <CACMJSesMDcUM+bvmT76m2s05a+-T7NxGQwe72yS03zkEJ-KzCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSesMDcUM+bvmT76m2s05a+-T7NxGQwe72yS03zkEJ-KzCw@mail.gmail.com>

On Tue, Aug 26, 2025 at 02:06:04PM +0200, Bartosz Golaszewski wrote:
> On Tue, 19 Aug 2025 at 13:52, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Aug 19, 2025 at 01:30:46PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, 19 Aug 2025 at 12:02, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > >
> > > > On Tue, 19 Aug 2025 at 00:18, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > > >
> > > > >
> > > > > Boot regression: stable-rc 6.15.11-rc1 arm64 Qualcomm Dragonboard 410c
> > > > > Unable to handle kernel NULL pointer dereference
> > > > > qcom_scm_shm_bridge_enable
> > > >
> > > > I have reverted the following patch and the regression got fixed.
> > > >
> > > > firmware: qcom: scm: initialize tzmem before marking SCM as available
> > > >     [ Upstream commit 87be3e7a2d0030cda6314d2ec96b37991f636ccd ]
> > > >
> > >
> > > Hi! I'm on vacation, I will look into this next week. I expect there
> > > to be a fix on top of this commit.
> >
> > Ok, I'll go and drop this one from the queues now, thanks.
> >
> > greg k-h
> 
> Hi!
> 
> The issue was caused by only picking up commit 7ab36b51c6bee
> ("firmware: qcom: scm: request the waitqueue irq *after* initializing
> SCM") into stable, while the following four must be applied instead:
> 
> 23972da96e1ee ("firmware: qcom: scm: remove unused arguments from SHM
> bridge routines")
> dc3f4e75c54c1 ("firmware: qcom: scm: take struct device as argument in
> SHM bridge enable")
> 87be3e7a2d003 ("firmware: qcom: scm: initialize tzmem before marking
> SCM as available")
> 7ab36b51c6bee ("firmware: qcom: scm: request the waitqueue irq *after*
> initializing SCM")

6.15.y is long end-of-life, so is anything still to be done here?

thanks,

greg k-h

