Return-Path: <linux-arm-msm+bounces-85077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 183E9CB679B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 17:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B809D301339D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 16:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946E526CE25;
	Thu, 11 Dec 2025 16:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQYdzrMz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636501684A4;
	Thu, 11 Dec 2025 16:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765471044; cv=none; b=mofgtjUnsjzhEKbPw8zwtrL/7+agZfvGIM/AQffqEsyzQ7KN0ObHEFrBAA3s88eOcndNqXNyBiwkcr6qXm1m7D7cEbQ8n4xcTZjV+6wq0qV4tF8jF1G4+A9XD/lQB/rR+T/vAgGUYkXZmKmPvMUjMO2sMLmCl082gIaH0viQYag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765471044; c=relaxed/simple;
	bh=PDMWZHyD9z2hlGCwwU1LhovwOmaB5sGH3am6PfSpvM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRA2Zz7wa8SBw1CeGn5mrTYSRR6MmdGLXrLEQCJ9KDhD5aikHcV7NBKBLqx77pwC0d/yPVHsyfWNV4EbslB2HDyt6pFzOrGbw5glS0rRh3JXv24ry2bFzbrA8RFveU8dBcYD3C0XXJ3XA+fTMOjXpLMRIfse8c/rEgMo4ydWFek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQYdzrMz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FFFC4CEF7;
	Thu, 11 Dec 2025 16:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765471043;
	bh=PDMWZHyD9z2hlGCwwU1LhovwOmaB5sGH3am6PfSpvM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oQYdzrMzngREHKRWybHE64mEOEULvAwdYNDD2/hnLxgN4TRiCMZ/JxsMW6UJaJgAx
	 Goj8jFRD5gY6CYsAn7di6A7A+tC6N5oqtQ5l4YzMtTYrOSpDw3lFsQF3S37G3+VG1X
	 /qAhoQdn4H97UPyX9VMC2Uv7YCt20djk6Mq8+BN6uc0+7abLh72OrpKqaGlhk7OhLg
	 Cz5/2Kf7dkexL9j1X0SGbEqTRtIRBD8+YkrZ5wZm4/GfpRVWuI4Q9WWS9yjh3Wam5a
	 yuVDVhH6lvZ+Z3BHfCTDbOT/KyhLFcwRJYeHYucOgSwmMViT3PJJDsQO+Yej8O3C39
	 mZ+goenfnl+Ng==
Date: Thu, 11 Dec 2025 10:37:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: power: qcom,rpmhpd: drop duplicate
 defines
Message-ID: <176547104027.1533615.17921152816573670432.robh@kernel.org>
References: <20251211-rpmhpd-drop-v2-1-569e5e8ab34a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-rpmhpd-drop-v2-1-569e5e8ab34a@oss.qualcomm.com>


On Thu, 11 Dec 2025 03:51:02 +0200, Dmitry Baryshkov wrote:
> In order to prevent further confusion, drop SoC-specific defines for
> power domain indices for platforms which were converted to use
> RPMHPD_foo indices.
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Split the patch to a separate series as all dependencies were merged
> - Link to v1: https://lore.kernel.org/r/20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com
> ---
>  include/dt-bindings/power/qcom,rpmhpd.h | 58 ---------------------------------
>  1 file changed, 58 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


