Return-Path: <linux-arm-msm+bounces-43987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DC8A02471
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 12:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF1071885A66
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 11:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF4F15990C;
	Mon,  6 Jan 2025 11:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="DvFw3Zg1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F9A78F2A;
	Mon,  6 Jan 2025 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736163687; cv=none; b=SEIcRCnpFw2UY1G8YOqQqA9U1VZUJyNDMt3DjFxX7CL0Lvwghq+nHCmFtDVhB4wnll1Hk821RtgPWrvTTm9AzeMpVd8AY75bGN9LSGcyUoJIunbcl7+45h90AX0z+9hU6StP1RNkt4Tx6mkbm++z0+OuXHLm/8W2sZjaB39c8CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736163687; c=relaxed/simple;
	bh=HPpOcyBOstzHY/jKWEWi8NLiV9WEbBK7Ub3cYghvEoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GH31fmKGevhvgMIQq4nUQQV6lb5151z2IR5azP2icZgqB8XNbNvfOp/ykgLtn2sR/3h4bIgE2uMfLcr1+E9MWQLtulcfIt07kNzE70ByxMnohMR3KcSKR03bLlIUTSGjlP1GY8PB88tK3PeW2j+H/AHwJbBNTw/a3Rbu6y5G0+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=DvFw3Zg1; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af348600d06e0009f19b6c7e.dip0.t-ipconnect.de [IPv6:2003:f6:af34:8600:d06e:9:f19b:6c7e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id EF31C2E0016;
	Mon,  6 Jan 2025 12:41:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1736163685;
	bh=HPpOcyBOstzHY/jKWEWi8NLiV9WEbBK7Ub3cYghvEoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DvFw3Zg1ZSzheKQ/uxRqMXOouN6EzlJrV+GzuAxy13TMzZ4KdjLXbFFDDJx4tDOcF
	 0KnlDsgT1zByimPOjHjR4IrVZmV84CruWElluADNhy2JwVeX2Cm8Avzt4QvsTaM+Q6
	 4Ivn4z3ifpClShymteN4jGjmjabo1ZQgSquKuUctjHJH73wKpobnJCUkyQnGI/D6o9
	 YsTutyYTkE3g+lci4DQSa/Iu8cugE2u3KVDI40gU5LiSsjFQZi34LNTUCBTBdR4FNS
	 i1y4D3Kzff6IvY9Gclx7hKhM1quRBIdOazyx2P5i9+6JqWND/Z/dMbQCTfQTzEwu0O
	 DGmqfpzZHPkxg==
Date: Mon, 6 Jan 2025 12:41:23 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/msm: Use helper function devm_clk_get_prepared()
Message-ID: <Z3vBY7FtglzoRtjJ@8bytes.org>
References: <20250103113059.463033-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103113059.463033-1-zhangheng@kylinos.cn>

On Fri, Jan 03, 2025 at 07:30:59PM +0800, Zhang Heng wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare() can now be replaced
> by devm_clk_get_prepared() when driver prepares the clocks for the whole
> lifetime of the device. Moreover, it is no longer necessary to unprepare
> the clocks explicitly.
> 
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> ---
>  drivers/iommu/msm_iommu.c | 51 +++++++++------------------------------
>  1 file changed, 11 insertions(+), 40 deletions(-)

Applied, thanks.

