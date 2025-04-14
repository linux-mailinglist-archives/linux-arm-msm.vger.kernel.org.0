Return-Path: <linux-arm-msm+bounces-54240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3CBA880EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 14:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D2B71894A9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 12:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9B629AAF8;
	Mon, 14 Apr 2025 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsokLDbl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4567C539A;
	Mon, 14 Apr 2025 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635521; cv=none; b=MOCHyveBJIOB0k8RznMrHLUUHyXUIfLOK+PvFMN5R0m0fMrE0d0wQOmuf1UL2yT7DkAwn2tw46xFBU606keKSEeBZFuVn2M+DClaqQ8Mhpge1DGs8QDd49QAfIubF0KyC6IV1/O8Sq/svBG4hevFljIqUtcFABWP3GZFXDnaRx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635521; c=relaxed/simple;
	bh=ZLod5GeDITCrF893kFp2KeEfQ+aSWVu96c4Qc/UeQZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RL9CwAB7mhDMw49VZPFF6s3lnsvEui3s+dAQRPRJ+MkEFE7w1cdC15JmQrkD10o0ZNQ49fvyQPvphg2gqbaIcW96qVNfWu6sDkxG+WziLYn6N8/bgxsyvTL9IeAAxK88c0yiFro19hCSDMniRaYTheQ1RvXSCzR0JsAM92tIYwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsokLDbl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2119C4CEE2;
	Mon, 14 Apr 2025 12:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744635520;
	bh=ZLod5GeDITCrF893kFp2KeEfQ+aSWVu96c4Qc/UeQZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MsokLDblm+WdMl14QgRVs1R5PBaQBE3jwmg6Hc2CCxHcsiauCK3emMZr5hk82yq1k
	 4XexBZlVM4nuuF9HzLa8ErPvZqDuc7OF9sjO1BeNUeF/cSk2alseevgTIYuafDqNL2
	 RSOFs0qZTMg1BSkgerauzXTSrgValXrKfvCDHh6/wjW+iW72i/RMqMgJ2vNEM2I+z4
	 pylsamysF9amTav30VE0b4+b0yrBdGLt7MxC0ICR4inGDhZSYHaPFgp5k9NWJ0HJpV
	 X8NbV2zCYvxrP3rXaxKPOQBF50CrY5KgQVnD+XXrZ2Xd5sQs90TjMMWobCTkw7JSim
	 0lwB1PN3j5UzA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4JOW-000000008Pr-2SZ2;
	Mon, 14 Apr 2025 14:58:37 +0200
Date: Mon, 14 Apr 2025 14:58:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: vkoul@kernel.org, kishon@kernel.org, lumag@kernel.org,
	quic_kriskura@quicinc.com, manivannan.sadhasivam@linaro.org,
	konrad.dybcio@oss.qualcomm.com, quic_varada@quicinc.com,
	quic_kbajaj@quicinc.com, johan+linaro@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] phy: qcom-qmp-usb: Fix an NULL vs IS_ERR() bug
Message-ID: <Z_0GfAFufdAiYE_j@hovoldconsulting.com>
References: <20250414125050.2118619-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414125050.2118619-1-chenyuan0y@gmail.com>

On Mon, Apr 14, 2025 at 07:50:50AM -0500, Chenyuan Yang wrote:
> The qmp_usb_iomap() helper function currently returns the raw result of
> devm_ioremap() for non-exclusive mappings. Since devm_ioremap() may return
> a NULL pointer and the caller only checks error pointers with IS_ERR(),
> NULL could bypass the check and lead to an invalid dereference.
> 
> Fix the issue by checking if devm_ioremap() returns NULL. When it does,
> qmp_usb_iomap() now returns an error pointer via IOMEM_ERR_PTR(-ENOMEM),
> ensuring safe and consistent error handling.
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: a5d6b1ac56cb ("phy: qcom-qmp-usb: fix memleak on probe deferral")
> CC: Johan Hovold <johan@kernel.org>
> CC: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Thanks for the update, looks good.

Next time, remember to include a short changelog here after the --- line
(so that it does not get included in the commit message when the patch
is applied).

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Johan

