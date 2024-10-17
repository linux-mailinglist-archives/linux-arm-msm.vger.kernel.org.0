Return-Path: <linux-arm-msm+bounces-34756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 295AC9A262D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 17:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2E531F20C89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 15:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CA51DE88D;
	Thu, 17 Oct 2024 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLwWsQO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4CB1DE4D3;
	Thu, 17 Oct 2024 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729178077; cv=none; b=kRdqtvyOUnU1LNlhdQXJji8Fzmmwh+kxRlzit5ZhUNKdkzs8kpE963FERqOxNh8TJjD2Zcez81W3pVPQxKSpa7y9JmpvIa3GBl8c060RTNUkGrbfRsAdl02hyT8Y1WFpqc6CMxaILcuEW/Xe4y51W/6dMtJ/ce/aIEYSPvb/Jmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729178077; c=relaxed/simple;
	bh=1Ow0Gc+hbjCFowFa4QmWB/bd1kazxemeLbLXTZSMd3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHn1ICZJ//Ca9RBPgqHYFqTri6i+jRuZ8bpSHlBIrhKNLCXP5rA04VZM2omvHV4hCXbHydJoGf99GlnDsYWc4zwdw9Pappd+zQunOb6NcV/sNOD6vv/kSNbmFxbdxUA+WvnwsVwNAlydIFdo2uHi1K0UxHMuR0d7uL2alwMxydY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLwWsQO3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C16C4CEC3;
	Thu, 17 Oct 2024 15:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729178077;
	bh=1Ow0Gc+hbjCFowFa4QmWB/bd1kazxemeLbLXTZSMd3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLwWsQO3I2rtIaZ7+bn98AcU6qA8MULzmeoa42NxVmZN1egxtOD/2LcKU2zolIowR
	 Yja93I3TjsGkx55KOzODmrtraO8Yry8Ws2tjbJsRPMBjKuG2WTIyJJA7Svc8t/YdN5
	 0V1cKuNiC9Z8ZdG4MWRs9/2C/tl3e61PoZxGoo/1jXKXEeQp2z1dB977xMRoMfth+z
	 hT5vKvokc5Q6bcwW67st9JNAbaGGYhcmtDGP1YD/pymqXXyMbp8tqP1cbA5Z5uMjzv
	 OEs81QqMhqbKFKZIHZc1gggW91R0ee+EwF6nmfNxRPq+V2B3WPnHNMQ7JYJ6a+0AmD
	 Kc2KK3zugj7oA==
Date: Thu, 17 Oct 2024 20:44:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, quic_tengfan@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xin Liu <quic_liuxin@quicinc.com>
Subject: Re: [PATCH v3] dt-bindings: phy: Add QMP UFS PHY compatible for
 QCS8300
Message-ID: <ZxEp2Aca037br2yt@vaman>
References: <20240925-qcs8300_ufs_phy_binding-v3-1-c1eb5c393b09@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925-qcs8300_ufs_phy_binding-v3-1-c1eb5c393b09@quicinc.com>

On 25-09-24, 15:34, Jingyi Wang wrote:
> From: Xin Liu <quic_liuxin@quicinc.com>
> 
> Document the QMP UFS PHY compatible for Qualcomm QCS8300 to support
> physical layer functionality for UFS found on the SoC. Use fallback to
> indicate the compatibility of the QMP UFS PHY on the QCS8300 with that
> on the SA8775P.

This does not apply on phy/next, can you please rebase

-- 
~Vinod

