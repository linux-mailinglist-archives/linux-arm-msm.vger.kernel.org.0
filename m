Return-Path: <linux-arm-msm+bounces-57213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A10FAAF409
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 08:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 115BE16F1E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 06:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B0317A2F0;
	Thu,  8 May 2025 06:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T9/x7U66"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9FE2B9AA;
	Thu,  8 May 2025 06:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686768; cv=none; b=kIwOA4DHlOITXEPGQo+iXcjMzqiXm02WjpmkH0hYMWqpHSQX83X+kVNnlEnVvUZW8nIe59U+LdA+fYE7Gbl92JYk3MFxi08qIfCXuak37w8pZmIbxcH5CXWdWxk6ewXS8oJOCHUTvFeLSlWMWzyJHSdBBjWhV9MDPVcalY+UY8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686768; c=relaxed/simple;
	bh=Rnttp0B4gsD8iFgx65pE7TbpwHuI1wrUwDwejsvJMrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsjJReeLh8IFn+kAQslYSYR1UU5tFjRnOGmxa1NeQ/dptlOniKtZ66n1/OyIFM1xARKOVdGrTwXD5cnpMqiVTkm7ShhBYtnY7jeewLfn8Dk0bR4IxIuXluC6dEhFh8K+BjuolgYpYUGHMq5E/czfPgisRs1KM9LePTvYwy4S8hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T9/x7U66; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0321DC4CEEB;
	Thu,  8 May 2025 06:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746686767;
	bh=Rnttp0B4gsD8iFgx65pE7TbpwHuI1wrUwDwejsvJMrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9/x7U66DjmSavu2KtNYPW7ue7y2no/nsM/ipglTqeD+kEP6NCicM4k7IkODowYrS
	 2VsyTgTwzFqt9NrCkl6++wy6gh+tlpjwDgN2TQVSB8v6uEPIyd4pNB8vD+A9k9+7Vf
	 vpWUx1/TCPj3S4tlePm8XlLVQwKRgWnhFTKlTGg4=
Date: Thu, 8 May 2025 08:46:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <2025050852-refined-clatter-447a@gregkh>
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
 <aBxR2nnW1GZ7dN__@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBxR2nnW1GZ7dN__@stanley.mountain>

On Thu, May 08, 2025 at 09:40:26AM +0300, Dan Carpenter wrote:
> Hi Greg,
> 
> I'm sorry I forgot to add the:
> 
> Cc: stable@vger.kernel.org
> 
> to this patch.  Could we backport it to stable, please?

What is the git id of it in Linus's tree?

thanks,

greg k-h

