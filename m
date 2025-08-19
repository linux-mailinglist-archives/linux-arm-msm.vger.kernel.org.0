Return-Path: <linux-arm-msm+bounces-69751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D73EB2C234
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 13:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7590C7A8B98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71BB32A3DE;
	Tue, 19 Aug 2025 11:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wL6Az2rA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FDE326D47;
	Tue, 19 Aug 2025 11:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604338; cv=none; b=RkvJ9wp1VeMX2M3P5bkFZMRktQ4lqgX4Q31QaaPsanNs09cG/oE48ou1Fq40cM9uGVI5HJD9Iv4sb+UP6cYHdKinUY9fc638LqYTf5Wk7bbeSCsKlm/1eesFBcAFU5N1XVrf2d3e2Asa02toyEU6od2Soxgm8lOsFmisF2YlbYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604338; c=relaxed/simple;
	bh=XxdaRud82ur5QTXiEHjEJ8/3jvy+FXSBXFtjMYxqu3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdejgUhErD4gkOT2GyDvl1RsITUz8xo07ieevc+CXmf6p4n5Qq3IsMzbsMpY8RUf7mmJ6Ah5BIMxsz5WTI0IXLUe+Em21clWvT8jxqfQTSG1AVqQBVTYH4kE/tRaO8P7GY500Rc+O2AJsRgLxri6/bTO3wzWd5HBHJUFGIZ2mlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wL6Az2rA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62878C4CEF1;
	Tue, 19 Aug 2025 11:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755604338;
	bh=XxdaRud82ur5QTXiEHjEJ8/3jvy+FXSBXFtjMYxqu3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wL6Az2rA1znO6zJV/Rte0239ocExiMjxP+bdWmU2VEEW9mDOlnpjpEMdUL3oQqhPo
	 fa9NEDoyxw80hUrbC/oZhVFkrA6rcd84gjTUA3QWCp2K5mZONrAud+hVOEMWxUPJ1y
	 ZmXgQTDAVpiZ/pwsJiMpk5McgxN3CSbmeKQlLOxQ=
Date: Tue, 19 Aug 2025 13:52:14 +0200
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
Message-ID: <2025081931-chump-uncurled-656b@gregkh>
References: <20250818124458.334548733@linuxfoundation.org>
 <CA+G9fYt5sknJ3jbebYZrqMRhbcLZKLCvTDHfg5feNnOpj-j9Wg@mail.gmail.com>
 <CA+G9fYt6SAsPo6TvfgtnDWHPHO2q7xfppGbCaW0JxpL50zqWew@mail.gmail.com>
 <CACMJSeu_DTVK=XtvaSD3Fj3aTXBJ5d-MpQMuysJYEFBNwznDqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSeu_DTVK=XtvaSD3Fj3aTXBJ5d-MpQMuysJYEFBNwznDqQ@mail.gmail.com>

On Tue, Aug 19, 2025 at 01:30:46PM +0200, Bartosz Golaszewski wrote:
> On Tue, 19 Aug 2025 at 12:02, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > On Tue, 19 Aug 2025 at 00:18, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > >
> > > Boot regression: stable-rc 6.15.11-rc1 arm64 Qualcomm Dragonboard 410c
> > > Unable to handle kernel NULL pointer dereference
> > > qcom_scm_shm_bridge_enable
> >
> > I have reverted the following patch and the regression got fixed.
> >
> > firmware: qcom: scm: initialize tzmem before marking SCM as available
> >     [ Upstream commit 87be3e7a2d0030cda6314d2ec96b37991f636ccd ]
> >
> 
> Hi! I'm on vacation, I will look into this next week. I expect there
> to be a fix on top of this commit.

Ok, I'll go and drop this one from the queues now, thanks.

greg k-h

