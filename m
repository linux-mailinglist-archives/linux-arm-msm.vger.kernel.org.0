Return-Path: <linux-arm-msm+bounces-83407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F2DC88CE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4EB914E391D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D22531A061;
	Wed, 26 Nov 2025 08:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ohuj3Ngc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106BD2C11F8;
	Wed, 26 Nov 2025 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764147549; cv=none; b=BOGLPZzAc7BcbJ47PWZJUbqulpdulou51nAD30xgtAlCC0ULY4Io50TLx+UYXYnM7MSr/mNwA7FrwO4mR6Ots0sRiHMfwXQ+PWEbNS6aKvytLN5DKe+N9HnkGgUdp0b/nAlslFIhLA7p1edA+Ay+DODrNbFML4ifb7e/RkEcrFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764147549; c=relaxed/simple;
	bh=BiW2Hn6eMCocDyY1YHwzbqe/MRl/5xysjwQ+dK5FtD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ir/7/di+XstiQz2FLsIo4EI63FTkyzaGbsTcA/nn5gnYWZCGc25IWNSJClGNjkRezJB12+KfvddMXckAr1PuNyt8nl2wvENIOXq7ufOOm+8Pc3IHtBvY1Xa9ActD3YtiAin1Zebspghtk9M+4JtnswW0k0Q33EBv5Fo2C68doV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ohuj3Ngc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0889BC113D0;
	Wed, 26 Nov 2025 08:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764147547;
	bh=BiW2Hn6eMCocDyY1YHwzbqe/MRl/5xysjwQ+dK5FtD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ohuj3Ngcad0mQU4xuEngKa6/cgJRLKKkhGVH+Rnd8nxi+OCPp3FLa/FUGpeyZF6re
	 tAyVm/mq/WlK5vvrwoYL3DN9ChaZ5WrLA/PZucSprnO2S3whW6PxH3rK9sO4B6p2he
	 CA5CSmJUZKDX8knE8px9GdtzYNpEHFIjdi03HsUQ5X6wZiH/gZ8hu8l7Q2hfljsgWb
	 RfncZ8R35d8AXAJX1vpK5LP8wyIZJmZQOcfwVAdWBRXuLpvJ2VtuuZSimD4HiSBLt6
	 ut2kD0jUol1RyQlFCf+mDYBOjZ1y9VYVNOh8BUbLklQuW10dtQnsripKm/lSSHg1bu
	 5WV4akvss6qEA==
Date: Wed, 26 Nov 2025 09:59:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] soc: qcom: llcc: Fix usecase id macro alignment
Message-ID: <20251126-gigantic-dinosaur-of-bloom-aca95f@kuoka>
References: <20251125-glymur_llcc_enablement-v2-0-75a10be51d74@oss.qualcomm.com>
 <20251125-glymur_llcc_enablement-v2-2-75a10be51d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125-glymur_llcc_enablement-v2-2-75a10be51d74@oss.qualcomm.com>

On Tue, Nov 25, 2025 at 02:46:23PM +0530, Pankaj Patil wrote:
> Aligned macro values for usecase id along the column length
> -#define LLCC_CAMOFE	 71
> -#define LLCC_CAMRTIP	 72
> -#define LLCC_CAMSRTIP	 73
> -#define LLCC_CAMRTRF	 74
> -#define LLCC_CAMSRTRF	 75
> -#define LLCC_VIDEO_APV	 83
> -#define LLCC_COMPUTE1	 87
> -#define LLCC_CPUSS_OPP	 88
> -#define LLCC_CPUSSMPAM	 89
> -#define LLCC_CAM_IPE_STROV	 92
> -#define LLCC_CAM_OFE_STROV	 93
> -#define LLCC_CPUSS_HEU	 94
> -#define LLCC_MDM_PNG_FIXED	 100
> +#define LLCC_CPUSS         1
> +#define LLCC_VIDSC0        2
> +#define LLCC_VIDSC1        3
> +#define LLCC_ROTATOR       4
> +#define LLCC_VOICE         5

This does not look right - you still have here spaces, so nothing fixed.

I don't think this change is useful. You replaced one poor alignment
into another poor alignment, so IMO better not to touch this at all.

Best regards,
Krzysztof


