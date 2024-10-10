Return-Path: <linux-arm-msm+bounces-33825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C73B2998195
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0391B1C2446B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F1B1A0AF7;
	Thu, 10 Oct 2024 09:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOoBvxfD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36581194C7A;
	Thu, 10 Oct 2024 09:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728551190; cv=none; b=HCeLFg5jh26HTM58dshXFuusOjs7Onk0R9LFjHaX8ZDkDmMFtuCPXYoHv3PTLFcySJogfroW2xO40me7PIkDkRxdt3rduPlTrxWAQt8ePT2rtvupEoiLFYVvw1OJ3fmuLbbpug170bQA+GERM1/qaRxfxcIcf6mgex1a3w4mXv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728551190; c=relaxed/simple;
	bh=6zv28lyhaRAoE502GCYQmLpHg+7/WMPqUPkwVP2H+nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLZYGhoPVeMveQ0OwIct+EMVgo/vl/MC0+DDo+GMFRtCCeUQLOOlpvZ5UV737+4wNl6B7qJgiJuixv69s+tAhqEGKATBkLNhRUDkkytH3wi+ezuALEbYuV+t4sVEo7iYhiM5HAbMBbyF5WqAmYckOUaWHsqv/8TjqrFVt4kjt7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOoBvxfD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53C8C4CEC5;
	Thu, 10 Oct 2024 09:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728551189;
	bh=6zv28lyhaRAoE502GCYQmLpHg+7/WMPqUPkwVP2H+nI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FOoBvxfDNWRTBvfP4TT6U4X7UxoV506vVy6pkWmJiarelXh6zTZtBNoUhW5qTzDfZ
	 mmldSjRURDWMIjV4PNe82dZBWFu9nLhgTOF69RBGt2rUhhZ8Vazr4EHZKSk/A+hBS+
	 E4jKCP8DODuU6rxCpEOOKzUG176JtKLqmhqsxLAYkvxuPXn3XMEWURirZc4bNqptDY
	 z8uPayFxEhIu+pLgSAnCufpamxyVzTcd4imEura2FxwZQ49Rv8Yd9uUMPncZQFJ2Pr
	 ShjaNMv/CKwEJnHsLKG4TO0NcUZSCbO2IjHeCK3hVqOWP8jy9TwlQmj9PGoBFC92O0
	 Hvbo/vQNX15PQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1syp7y-000000008O2-0dBB;
	Thu, 10 Oct 2024 11:06:34 +0200
Date: Thu, 10 Oct 2024 11:06:34 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable+noautosel@kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100: Fix PCIe 6a lanes
 description
Message-ID: <ZweZGk1sypc535DL@hovoldconsulting.com>
References: <20241009-x1e80100-dts-fixes-pcie6a-v3-1-14a1163e691b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-x1e80100-dts-fixes-pcie6a-v3-1-14a1163e691b@linaro.org>

On Wed, Oct 09, 2024 at 02:07:23PM +0300, Abel Vesa wrote:
> Fix the description and compatible for PCIe 6a, as it is in fact a
> 4-lanes controller and PHY, but it can also be used in 2-lanes mode. For
> 4-lanes mode, it uses the lanes provided by PCIe 6b. For 2-lanes mode,
> PCIe 6a uses 2 lanes and then PCIe 6b uses the other 2 lanes. The number
> of lanes in which the PHY should be configured depends on a TCSR register
> value on each individual board.
> 
> Cc: stable+noautosel@kernel.org # Depends on pcie-qcom 16.0 GT/s support
> Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v3:
> - Re-worded the commit message once more to suggest a fix w.r.t
>   lanes.
> - Added back fixes tag and CC stable but with noautosel reason
> - Picked up Konrad's R-b tag.
> - Link to v2: https://lore.kernel.org/r/20241004-x1e80100-dts-fixes-pcie6a-v2-1-3af9ff7a5a71@linaro.org
> 
> Changes in v2:
> - Re-worded the commit message according to Johan's suggestions
> - Dropped the clocks changes.
> - Dropped the fixes tag as this relies on the Gen4 4-lanes stability
>   patchset which has been only merged in 6.12, so backporting this patch
>   would break NVMe support for all platforms.
> - Link to v1: https://lore.kernel.org/r/20240531-x1e80100-dts-fixes-pcie6a-v1-2-1573ebcae1e8@linaro.org

Thanks for the update. I find the commit message much clearer now:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

