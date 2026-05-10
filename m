Return-Path: <linux-arm-msm+bounces-106811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mF2cJ6NqAGoVIwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 13:23:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3646A503C72
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 13:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4EBAE30022FC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 11:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D33372698;
	Sun, 10 May 2026 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSgOl3ry"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132430FC2E;
	Sun, 10 May 2026 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778412192; cv=none; b=mrt34kEnmWTB8lFkeV6f9yHcHAMRVkY3sF6ewvg//Sk+1n8sGYrZPFPr/tV83U8dCRyfTFKd5B+OkOtQwCrZTNAUAc+j2ZNAhxCXw6WmUw84YmVM2NvVS/t8RTRPRlUPbQ4mSStlSh/3+JKe1Qdd0NwgzPkf8Nz38Ocix7c5TcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778412192; c=relaxed/simple;
	bh=4wlrsL+5QzVoGJrBs2lTX9zEhWG1wgLayEtMSvZTTXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDc13iu+f3sURLBSp0gAZphdmMGtNqLiGurN67fOKwJL30DCuxjdhO8chdcLP8slyvwDBCNSr0hUQ+wqXSql74+ot4ixTlVDBoG3j36c1qQYVzK97klBwZRxtm9shAl46e/WUuuvX5eY7j5HO6GSwQCdSOWQZxJ4HvsW3qP7iYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSgOl3ry; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AA1C2BCB8;
	Sun, 10 May 2026 11:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778412191;
	bh=4wlrsL+5QzVoGJrBs2lTX9zEhWG1wgLayEtMSvZTTXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oSgOl3ryp0QJRhD68K/YMuHTfuCRfGfYPPiJMVKWkSkJeRKPD3YBD8zF1SU945omz
	 ezna2/AhjraczadHYOWyXxXcdaUUyPK7mQq8pID0+NnwT0opPGxF6Vne1iqfbIcXUH
	 z3/Jna2Bkymp0ixN00FndgYKuoWSiGcmhik43k5KYDfSyP8mqL8vBgthRYQALDSMjp
	 xoK74ENcxLRqfIhs7S+LqQ8mEriVR/EGU1ZoeOhtQ/fIXSuNzoBGjjeqx1UCpcpRKK
	 qmp3wFds6wd1Nj11pAnkD+zkRXlIdAl3UB5PQfPWhluQyM44IkDYys2Gw0xfTKZuLn
	 qcOUiWoZo7rwQ==
Date: Sun, 10 May 2026 16:53:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-phy@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v8 0/4] drm/msm/hdmi & phy: use generic PHY framework
Message-ID: <agBqm1Aede3HX0yv@vaman>
References: <20260401-fd-hdmi-phy-v8-0-51b0e98edf6c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-fd-hdmi-phy-v8-0-51b0e98edf6c@oss.qualcomm.com>
X-Rspamd-Queue-Id: 3646A503C72
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106811-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sashiko.dev:url,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 01-04-26, 06:38, Dmitry Baryshkov wrote:
> The MSM HDMI PHYs have been using the ad-hoc approach / API instead of
> using the generic API framework. Move MSM HDMI PHY drivers to
> drivers/phy/qualcomm and rework them to use generic PHY framework. This
> way all the QMP-related code is kept at the same place.
> Also MSM8974 HDMI PHY, 28nm DSI PHY and apq8964 SATA PHY now can use
> common helpers for the UNI PLL.
> 
> This also causes some design changes. Currently on MSM8996 the HDMI PLL
> implements clock's set_rate(), while other HDMI PHY drivers used the
> ad-hoc PHY API for setting the PLL rate (this includes in-tree MSM8960
> driver and posted, but not merged, MSM8974 driver). This might result in
> the PLL being set to one rate, while the rest of the PHY being tuned to
> work at another rate. Adopt the latter idea and always use
> phy_configure() to tune the PHY and set the PLL rate.

Hi Dimitry,

Can you please check

https://sashiko.dev/#/patchset/20260401-fd-hdmi-phy-v8-0-51b0e98edf6c%40oss.qualcomm.com

> 
> Merge strategy: Merge the first patch (either through drm/msm or through
> the PHY tree), merge the rest of the patches in the next cycle.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v8:
> - Rebased on linux-next, fixing conflicts
> - Added missing ids for APQ8084 and MSM8998 (Sashiko)
> - Switched to pm_runtime_put() (Sashiko)
> - Fixed several missed *1000 after pixclk -> tmds_char_rate conversion
>   (Sashiko)
> - Fixed several math overflows (Sashiko)
> - Link to v7: https://patch.msgid.link/20260324-fd-hdmi-phy-v7-0-b41dde8d83b8@oss.qualcomm.com
> 
> Changes in v7:
> - Fixed the build issue between msm8974 patches.
> - Dropped even more writel / readl wrappers (now from QMP PHYs)
> - Link to v6: https://lore.kernel.org/r/20260319-fd-hdmi-phy-v6-0-cefc08a55470@oss.qualcomm.com
> 
> Changes in v6:
> - Changed MSM8974 HDMI PHY driver to use FIELD_PREP / FIELD_GET (Konrad)
> - Fixed rate recalculation for MSM8974 HDMI PHY (Konrad)
> - Dropped register read/write wrappers
> - Link to v5: https://lore.kernel.org/r/20260314-fd-hdmi-phy-v5-0-58122ae96d3b@oss.qualcomm.com
> 
> Changes in v5:
> - Kept only a single place which handles extp clk (after PHY power on,
>   before PHY power off) (Neil)
> - Inlined pm_runtime calls in the HDMI TX driver, replaced
>   pm_runtime_resume_and_get() with pm_runtime_get_sync(), since
>   atomic_pre_enable() can not fail.
> - Renamed registers defines to drop the REG_ prefix.
> - Link to v4: https://lore.kernel.org/r/20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com
> 
> Changes in v3-v4:
> - Rebased on top of linux-next, solving conflicts
> - Squashed add-and-remove patches into a single git mv patch
> - Dropped HDMI PHY header patch (merged upstream)
> 
> Changes in v2:
> - Changed msm8960 / apq8064 to calculate register data instead of using
>   fixed tables. This extends the list of supported modes.
>   (Implementation is based on mdss-hdmi-pll-28lpm.c from msm-4.14).
> 
> - Fixed the reprogramming of PLL rate on apq8064.
> 
> - Merged all non-QMP HDMI PHY drivers into a common PHY_QCOM_HDMI
>   driver (suggested by Rob Clark)
> 
> ---
> Dmitry Baryshkov (4):
>       drm/msm/hdmi: switch to generic PHY subsystem
>       phy: qcom: apq8064-sata: extract UNI PLL register defines
>       phy: qcom-uniphy: add more registers from display PHYs
>       phy: qualcomm: add MSM8974 HDMI PHY support
> 
>  drivers/gpu/drm/msm/Makefile                     |   7 -
>  drivers/gpu/drm/msm/hdmi/hdmi.c                  |  59 +-
>  drivers/gpu/drm/msm/hdmi/hdmi.h                  |  80 +--
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c           |  80 ++-
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 226 -------
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c         |  51 --
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c         | 761 ----------------------
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c         | 765 -----------------------
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c         | 141 -----
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c         |  44 --
>  drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c         | 460 --------------
>  drivers/gpu/drm/msm/registers/display/hdmi.xml   | 537 ----------------
>  drivers/phy/qualcomm/Kconfig                     |  24 +
>  drivers/phy/qualcomm/Makefile                    |  14 +
>  drivers/phy/qualcomm/phy-qcom-apq8064-sata.c     |  23 +-
>  drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c       | 353 +++++++++++
>  drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c       | 478 ++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c        | 186 ++++++
>  drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c      | 213 +++++++
>  drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h      |  59 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c    | 187 ++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c | 440 +++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c | 489 +++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h         |  49 ++
>  drivers/phy/qualcomm/phy-qcom-uniphy.h           |  74 +++
>  25 files changed, 2611 insertions(+), 3189 deletions(-)
> ---
> base-commit: d894dddf2a144f0e1d1cd7a8225c744dc906cdd5
> change-id: 20240109-fd-hdmi-phy-44b8319fbcc7
> 
> Best regards,
> --  
> With best wishes
> Dmitry

-- 
~Vinod

