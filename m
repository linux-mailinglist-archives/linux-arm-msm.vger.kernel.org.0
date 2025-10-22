Return-Path: <linux-arm-msm+bounces-78410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 518B3BFE3D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 22:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A3EC3A2F6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 20:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7BD2FE59B;
	Wed, 22 Oct 2025 20:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0wBNl6f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A912DF155;
	Wed, 22 Oct 2025 20:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761166778; cv=none; b=XYsFhlyGImDi7VWqj4QA+9yF3NNT8xCLDQl/am9/DFb9qpStOVm2MnIea42kjsM9p3Tbg+vouPRYiWNYNVT3B5l7IL6vkrZfAxzaSuwRXVRf9Jf1YtawtdYXA55R7MV3phL9Pb0TMJU20I5XNkgblewKR6eiZb4bXsNTSCz0so8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761166778; c=relaxed/simple;
	bh=I+ZfoIp12v7fhapy5tKmjiEW7Ewy+hWqPg5EDg82CWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oo1AVUn/l+YJ2Zaxl0y5glbJZkuAiPJzfLKVctauNUDIS61IVsJhVT4vlOGXGa+aXh6JpmXtTkik8fL3kIiuMOx3u32xEyjOstoy+18Pait5LYejMd5rPtMn+M1azLFgYpQPdFQRmGyQh8ZJztxBZmPe2lSGKh7+inU9OUqHlu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0wBNl6f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9E8C4CEE7;
	Wed, 22 Oct 2025 20:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761166778;
	bh=I+ZfoIp12v7fhapy5tKmjiEW7Ewy+hWqPg5EDg82CWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0wBNl6fQsEQ6qta8qEJUIJ3Q71foPYA2H3xY+KjZT/w0xMxVynu5FUgOiihV1JVn
	 w5xAV0cKJDDvKTWZ8k+ok9uVPfWfp+oUcb5jVl4CedEz0HmJjsNlqr2Yx0W3ATz1Dx
	 oAIwteMqzBZ2kV51oVabCrw7WE9aR6h3G53ezVHa/KGnT/b4gD1VX2JpCb1J8s54Tk
	 lQH5KF/bjOf7bYT4ESxir8DqN8gzVbCrazGZBqRPYQwyefBKFZGSuH+IHOAfQAaxj6
	 i0HWKOIAUkscqri2ZKkjTQRr6dApLA7vbm6Gx30VC4LEzZqM2xQcNl3Ni4MGXZne+G
	 q4Y87ljCsjRbQ==
Date: Wed, 22 Oct 2025 16:02:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	David Collins <david.collins@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] Add support to read RPMH regulator settings
Message-ID: <eivl52lqeurk3bcklnoqjnnfqv3tgmkh4ehf6jchbnf3j44ads@oogqwpvkahhp>
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>

On Wed, Oct 22, 2025 at 02:38:52AM +0530, Kamal Wadhwa wrote:
> This patch series adds a new `rpmh_read()` API to allow reading RPMH
> addresses. Also, using this new API, enhances the RPMH regulator driver
> get_regulator* APIs like `get_regulator_sel()`, `get_mode()` and
> `get_status()` to allow reading voltage/mode/enable setting from H/W.
> 
> This is needed because current design has a limitation - regulator
> framework can only get the cached values from the last voltage set
> operation. Because of this right after bootup a `get_voltage_sel()`
> from regulator framework will return -ENOTRECOVERABLE error, causing
> regulator framework to trigger an unnecessary `set_voltage_sel()` call
> with the `min_uV` value specified in the regulator's device tree
> settings, which can cause issues for consumers like the display and
> UFS that require a consistent voltage setting from the bootloader
> state until their drivers are probed.
> 
> With this change regulator framework will get the regulator voltage
> and other settings, as configured during bootloader stage, avoiding
> unnecessary voltage adjustments and maintaining consistent power
> settings across the transition from bootloader to kernel.
> 
> Besides this feature this series also fixes:-
> - An existing issue with the BOB5 pass code value. This is needed
>   by `get_status()`.
> - Code format/style related errors reported by checkpatch.pl.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed the BOB bypass mode handling (existing issue in current driver).
>   This was needed for `get_status()` implementation.
> - Implemented `get_status()` callback.
> - Callbacks for `is_enabled()` & `get_mode()` will now be used as-is
>   ie. v1 changes reverted.
> - Bootstapped the read values for `mode` and `status` in probe, based on
>   comments recieved from reviewer. 
> - Callback for `get_voltage_sel()` has been modified to handle cases
>   where read voltage is out-of-range defined in the regulator DT settings,
>   this is needed to ensure backward compatibilty. Regulator probes may
>   fail otherwise for some older targets.
> - This patch is rebased & tested on:
>    https://lore.kernel.org/all/176070318151.57631.15443673679580823321.b4-ty@kernel.org/
>   to avoid any merge issues.
> - Fixed code style issues reported by checkpatch.pl script. 
> - Link to v1: https://lore.kernel.org/r/20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com
> 
> ---
> Kamal Wadhwa (3):
>       regulator: rpmh-regulator: Fix PMIC5 BOB bypass mode handling
>       regulator: qcom-rpmh: Add support to read regulator settings
>       regulators: qcom-rpmh-regulator: Fix coding style issues

These three changes all changes the same one file, but you have 3
different subject prefixes. This is just sloppy, please follow other
changes to this one file.

> 
> Maulik Shah (1):
>       soc: qcom: rpmh: Add support to read back resource settings

I'd like to merge this through the soc tree, please put it first in the
series to simplify this.

Regards,
Bjorn

> 
>  drivers/regulator/qcom-rpmh-regulator.c | 184 +++++++++++++++++++++++++++++++-
>  drivers/soc/qcom/rpmh-rsc.c             |  13 ++-
>  drivers/soc/qcom/rpmh.c                 |  47 +++++++-
>  include/soc/qcom/rpmh.h                 |   5 +
>  include/soc/qcom/tcs.h                  |   2 +
>  5 files changed, 241 insertions(+), 10 deletions(-)
> ---
> base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
> change-id: 20250623-add-rpmh-read-support-3288f83cc20a
> 
> Best regards,
> -- 
> Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 

