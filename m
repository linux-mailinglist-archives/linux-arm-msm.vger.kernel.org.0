Return-Path: <linux-arm-msm+bounces-71947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B1BB42C50
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 23:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74C0C1891734
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 21:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AC52EBB88;
	Wed,  3 Sep 2025 21:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZQdJBc8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F51283CBD
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 21:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756936748; cv=none; b=rHkIktgnEZSOxvdBk3aRWt8ff6Z3rEY+zZolNQ2uJQm1Q/s3p1y+lUbBhP6o9b2VyYeg14rHC4//yEi5rbInB6T54I8JhZcqODd3o6ObeLkD1jZFCmteRY08qLdn2ruTcKtWK2jfwI4iggiZMxPsB9d1kfM5axfWz0l+Sepn/0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756936748; c=relaxed/simple;
	bh=0GKVuSXSJlSkzp6pFM2J9RqAsra+LJOjM8sTloa5vZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdhshvOuM/MTABkavwG+qvgOcElgdRaA3+Ep6hPLSDW8XIzjYRAYSzv+RPIxmGROotLxaOInZVu5MdmWfKz3/8o/uOBfZpbH9MqEaiCz14lcMk7r6Mp+b8FbbnQ2RQVHHHJ29ViMNSLWQy0XC/j4emy9cihqaOR3R0PSzVWMp0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZQdJBc8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C411C4CEE7;
	Wed,  3 Sep 2025 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756936747;
	bh=0GKVuSXSJlSkzp6pFM2J9RqAsra+LJOjM8sTloa5vZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZQdJBc8vH6UcWmXya2a2zyHBrnnDAfbC0OahIBH+9TlWOzp6Z680MfwRZjjs8ZSa
	 SvegDfNOMcPQKzc4LKAXanPl3lGiWKWPfJJeMNIBepZrsNVOzS9z93y5g3a0yT6uxE
	 YSFdBxnUNk8wz459J42nWKuhwXQCQcM9EdY+UYX5DsgtAuHbUUanAa7L49VdOoizOH
	 4x/rX6A7JWPc7qXStA1TDjzGuj6dFFXxDAjMxIKGi75gAJlzcpfKwftRjjeM79gopj
	 PXSguAysaUH3+APtXo2HwaiY+xqqz2pr0MNhrDmZ7lp6EfUFFe0lZkSjrBAfsxX6vn
	 b3g3T1X2uwN0A==
Date: Wed, 3 Sep 2025 16:59:05 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v6.17-rc1
Message-ID: <lvpubhge5dfyokvnsuhupus4kocroeb2dmlngl6efxplmwe7h6@raldw456w6r5>
References: <20250811145613.120917-1-andersson@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811145613.120917-1-andersson@kernel.org>

On Mon, Aug 11, 2025 at 09:56:11AM -0500, Bjorn Andersson wrote:
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.17
> 
> for you to fetch changes up to 25daf9af0ac1bf12490b723b5efaf8dcc85980bc:
> 
>   soc: qcom: mdt_loader: Deal with zero e_shentsize (2025-08-10 21:02:14 -0500)

Arnd, could you please pull this for v6.17-rc?

Regards,
Bjorn

> 
> ----------------------------------------------------------------
> Qualcomm driver fixes for v6.17-rc1
> 
> The recently extended sanity checks for the Qualcomm firmware files
> turned out to be too restrictive, preventing a variety of firmware
> images from being loaded. Adjust the checks to allow section header
> sizes of 0 when sections aren't used.
> 
> ----------------------------------------------------------------
> Bjorn Andersson (1):
>       soc: qcom: mdt_loader: Deal with zero e_shentsize
> 
>  drivers/soc/qcom/mdt_loader.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

