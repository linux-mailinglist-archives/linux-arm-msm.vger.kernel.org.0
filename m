Return-Path: <linux-arm-msm+bounces-22678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 750BD908535
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 09:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07378B216FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 07:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9CA148FE8;
	Fri, 14 Jun 2024 07:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9HtjLDh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DDE1487E7;
	Fri, 14 Jun 2024 07:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718350653; cv=none; b=D2iBYuaRahyVkwtNJ+egwY24TBeHXVgneH/Pw0zdEkagUKzosODXXCzRyGNrZoGEfTTmh3ei2BQrdz5nlcKDA9mi4fPt4YFvIMJvUoD9/ZwlH2I7w0DJQLwZao3IV5fVEOAQAs7/oQwx4F8ps+zgpGltAXvzzhubG/V0xWuwZYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718350653; c=relaxed/simple;
	bh=rTMS19bsUEwOUdxCnpYu3VKi8NTm93CaEq6q+AaxU1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGbE+g7vrR3hL8jQLZ1Oi44CwP+vO5DkQK7+dUCUM13wplC42Jux8EwiIloyEL1/846JcnfHD+Am6u0uqJGqfdr7zhqXFRpmdm9MEZb9SzTNyueU76aljPgVWqSAQgrn++lG6T+vLzsfCRwh7HOtXX0Q6JLdupkWYNfGuve9tTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9HtjLDh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B76FC2BD10;
	Fri, 14 Jun 2024 07:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718350652;
	bh=rTMS19bsUEwOUdxCnpYu3VKi8NTm93CaEq6q+AaxU1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9HtjLDhWA845v9L9+m05Oj8QHzGblNnaL150upEU1mANsiTRmIzcswrozdhvAEpB
	 myjM7sOvlZdATnO19Ey+xrpRM46CVaKCE3j0wcN6YHnD2HpvLvFn7UIatfmpLIEBuB
	 CUNG/E7vj0mDzUsc3HVAndQJ+m/gUehnneuQvPRICiWmf3dvcXnuboS+C8JtUI2FQy
	 90CDKWfl9h5BqSxnqBV+FSxFxShTRt98CqVdZ3C7SMHbcvr5j+QCZPAJzpZjkgPFXZ
	 zlRMrsaQ94w+CkfKkIWUYU97fVOa5v5wrjTCn/9SbOr1Y1oTL0rNDat/Cso+ePK2uM
	 JGk8QnyTD6Jew==
Date: Fri, 14 Jun 2024 08:37:26 +0100
From: Lee Jones <lee@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between MFD and Regulator due for
 the v6.10 merge window
Message-ID: <20240614073726.GZ2561462@google.com>
References: <20240608155526.12996-1-johan+linaro@kernel.org>
 <20240614073306.GY2561462@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614073306.GY2561462@google.com>

On Fri, 14 Jun 2024, Lee Jones wrote:

> Enjoy!
> 
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-regulator-pm8008-v6.10

Whoa!  We're en-route to v6.11 already.

Kill this one - I'll submit a new one.

-- 
Lee Jones [李琼斯]

