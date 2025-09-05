Return-Path: <linux-arm-msm+bounces-72312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6559EB45B9D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0AFB1CC634D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA7F220696;
	Fri,  5 Sep 2025 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8/gzUtv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A800B30217B;
	Fri,  5 Sep 2025 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084417; cv=none; b=jmPlWOsl7Rlfl6uJ/Bozf3jL9lzFY6JiouHwrUEMUYj4jx6Tt6fhl/gsGcRkWEjFDmy7NEdfQiHzVNx3996iXgh4LpUfl1ZWJz6laU8hmDVPIwrsXPdRwODiY89s310jzTy2E6355A6XZOP7oCYlf5gudyDb0jXXQrcViFlclDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084417; c=relaxed/simple;
	bh=ri4clsiuu0TGnICYGMR3lnjIIOKj/dmNCRfheklY2bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KY8l37reJmP9lMbQaFG8FjQPFrQgoeyb1Y94UGfgfrpfoPH2xODY1mjowmtox/SyHeBW2Uw5Ccd825taxrkvgrIpKBfZLtJhtR9ErrSpr3HRZVbLZ7EJBnJ8imrqrljPMLwY/bFWv0F0JCNV+BnD3ZSxclzC9Gg+DWQbcQmVQdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8/gzUtv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C32C4CEF4;
	Fri,  5 Sep 2025 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757084417;
	bh=ri4clsiuu0TGnICYGMR3lnjIIOKj/dmNCRfheklY2bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8/gzUtvAl7Q91n2WthpKhZE6uvbUNVuXBExoMGA+QJ0JgPaN5VCtQuHi2UFHOl7D
	 kaTGn9LJ9lzh8D2DI7Scl+/2BSUI+vLCiTiioSPgnzAetP/sp64v94bNaQL9sgSWKd
	 1BGuRvxrMUwe9l8M4a2z2XuXzlyZuwqjOBA/PwH2Age2UFR36UWNZAGODHj2pZlyBo
	 crPW9lUrHVUFFqWc88DPym5WR56aEmPXFQuEAYy+ebbqbMYJgUVpIxC6ucuoOmj1yP
	 EpcW6pp8/S56sSS4FI69mIYU/DujB5JyOcZKQxtRpI68mpU+g+6cTGKgxNp90XJbq8
	 xlG3woLsHo7rQ==
Date: Fri, 5 Sep 2025 20:30:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vivek.Pernamitta@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vivek Pernamitta <quic_vpernami@quicinc.com>
Subject: Re: [PATCH v3 5/6] bus: mhi: core: Improve mhi_sync_power_up
 handling for SYS_ERR state
Message-ID: <sh3doz6uhkvbp4iy76eyhnh7ycigka3gmrod423rmgarhkhlxj@oet5rikyjhee>
References: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
 <20250821-vdev_next-20250821_sriov-v3-5-e1b017c48d4a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821-vdev_next-20250821_sriov-v3-5-e1b017c48d4a@quicinc.com>

On Thu, Aug 21, 2025 at 06:25:37PM GMT, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> In power-up, reboot, or recovery scenarios, mhi_sync_power_up() is invoked
> by the controller driver to wait for the device to enter Mission Mode.
> 
> However, in some cases, the device may be in SYS_ERR state due to a
> previous device reset. SYS_ERR is a valid state, but currently, the host
> exits at wait_event_timeout() prematurely when MHI_PM_IN_ERROR_STATE is
> detected, causing mhi_sync_power_up() to fail.
> 
> If MHI is torn down before SYS_ERR is serviced, recovery is not possible.
> Instead of aborting, the SYS_ERR handler should process the error and queue
> the next state transition to bring the device into Mission Mode.
> 
> This change ensures mhi_sync_power_up() waits for Mission Mode even
> after SYS_ERR, enabling proper recovery and improving robustness.
> 

Reword the description in imperative mood. Also, if this is an independent fix,
this patch should be moved to the start of the series.

> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
>  drivers/bus/mhi/host/internal.h | 2 ++
>  drivers/bus/mhi/host/pm.c       | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 034be33565b78eff9bdefd93faa4f3ce93825bad..9e37e5c9a6c7e07d54300adce51c9db9052e477a 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -170,6 +170,8 @@ enum mhi_pm_state {
>  							MHI_PM_IN_ERROR_STATE(pm_state))
>  #define MHI_PM_IN_SUSPEND_STATE(pm_state)		(pm_state & \
>  							(MHI_PM_M3_ENTER | MHI_PM_M3))
> +#define MHI_PM_IN_UNRECOVERABLE_ERROR(pm_state)		((pm_state == MHI_PM_FW_DL_ERR) || \

MHI_PM_IN_UNRECOVERABLE_STATE?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

