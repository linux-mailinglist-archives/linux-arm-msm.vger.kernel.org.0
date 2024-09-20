Return-Path: <linux-arm-msm+bounces-32050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7611B97D27A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 10:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37AA7286613
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 08:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEA97DA6E;
	Fri, 20 Sep 2024 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCC8B2Fn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38924C62B;
	Fri, 20 Sep 2024 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726820466; cv=none; b=l1yolXmbgK7fUQ/syX8M/5qG3z+B05e5Is8ztEcDxYll/IoGeNP5dcO4Gq56XRsog2afaN/OtzgQvJd0HZ4r95luvv6y/T/PkHfua7GDKYo5eetRWaBi51WtFqv7YOF77HJIBj9UXkHqirjhdIBDr0rOQvBtZN1Cf5CXO3jLn54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726820466; c=relaxed/simple;
	bh=caI3Gjh9ysGzGdw73u4qGfOHUpjWFgDmBK+Wo5CFDWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShjcTpN52ww8ZfRRDg1erQHlYoTc7MBVIAZUXYV5e7ZXfBP0PxX5tkmbELve9MU2m+yhathzeUUJsdy7sm0QaRH5Z8MhPMMUvQJDUM59F286cOK37ssJYmezeI9qbKsN8Y5ocV6wQZQGlR4BiwBGeX3eJMgWSdoSJ8zYO5ssqXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCC8B2Fn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB12C4CEC3;
	Fri, 20 Sep 2024 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726820466;
	bh=caI3Gjh9ysGzGdw73u4qGfOHUpjWFgDmBK+Wo5CFDWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HCC8B2Fne8WBGYhAlne31qK/mO1DhHijTNjK2BdSH4twPWRIl6R8KaXPokic/BFOB
	 ThBnZFcS2+LFFd+M7F1SypZA17bkOGoO+xt6lBwDEoQclOj6U+GJgxGy+jRoPeI+2K
	 ZveItOQw+bkYKZPn2mUNo2uxvzlDmM5Ksmtt8+lCFuOJvo4oxvaECBucucONjYAqd+
	 M4LZCn84x/DDYU3HxHPTU1BDiqMSkuTjE6KUNwoG2GllGrNFICfoFsLivN4Ir68cy4
	 re8NHXdpoSK+yYgCeApfnlIVC8az8vwNhU4cfVGfFPoi4jMoRJ4basTCBpXbPx1sIF
	 YTXjb5Pd9PI6Q==
Received: from johan by theta with local (Exim 4.98)
	(envelope-from <johan@kernel.org>)
	id 1srYsx-000000000pD-0VIV;
	Fri, 20 Sep 2024 10:21:03 +0200
Date: Fri, 20 Sep 2024 10:21:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd_mapper: fix ADSP PD maps
Message-ID: <Zu0wb-RSwnlb0Lma@hovoldconsulting.com>
References: <20240918-x1e-fix-pdm-pdr-v1-1-cefc79bb33d1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918-x1e-fix-pdm-pdr-v1-1-cefc79bb33d1@linaro.org>

On Wed, Sep 18, 2024 at 04:02:39PM +0300, Dmitry Baryshkov wrote:
> On X1E8 devices root ADSP domain should have tms/pdr_enabled registered.
> Change the PDM domain data that is used for X1E80100 ADSP.

Please expand the commit message so that it explains why this is
needed and not just describes what the patch does.

What is the expected impact of this and is there any chance that this is
related to some of the in-kernel pd-mapper regression I've reported
(e.g. audio not being registered and failing with a PDR error)?

	https://lore.kernel.org/all/ZthVTC8dt1kSdjMb@hovoldconsulting.com/

> Fixes: bd6db1f1486e ("soc: qcom: pd_mapper: Add X1E80100")
> Cc: stable@vger.kernel.org

Since the offending commit has not reached mainline yet, there's no need
for a stable tag.

Johan

