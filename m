Return-Path: <linux-arm-msm+bounces-32888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A8998BE65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 15:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CC5B1F241CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 13:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BBB1C578B;
	Tue,  1 Oct 2024 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YKqD4Ys/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96781C4624;
	Tue,  1 Oct 2024 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727790650; cv=none; b=cppJe0aGaMY16zvYvtAoNLXRumbO5NgHtffSZm7q6SXJCUJhfovzbtJoHcsc+Ejg878mSSWjB8PO4qsq+0uhNOlMGMXQL8PL4AF7ETAnz7wCaVcmrqBihv0+X58lIisRA8Heg2stWBjuwUTc9Qh6CxyjdhhU3cQcrmxOQCe6tOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727790650; c=relaxed/simple;
	bh=Wrdy0e1dz6T5uwCE6i2Zj6+AsBKQNypB0lnUzsj5xCI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QswNP8V/zr/KlzChTo5U6IPHyLa/XDw85cdKpbkoPj90nMt+5Ek1H/Eg4JCr0FZu5xFrGzneogH9oFqnPTh0tSEx4AzPaL1AkVu31JbusPnXz3IXwidQ+w2c2szb92zadZRzmQhm3YjkffzFU/mUBZ2oxAPa1ph2jfqJWC883Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YKqD4Ys/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727790644;
	bh=Wrdy0e1dz6T5uwCE6i2Zj6+AsBKQNypB0lnUzsj5xCI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=YKqD4Ys/oGurqoWIOyx7Wn0hRTWDfyPPhsxJBv4liLaL79RWNITs6yYigoa9t0bYR
	 apYOKXRQwcu6+xBYSMhtRzZYX8riNbY3jwGgx54B/mqtnC6ECCMjvF74G/KjKZbgVO
	 RJzRdFANc0GPw4iUWTjgPb0VclImiN7kwj4rnOBg0+pqJjlWEITVsXj59SE2r7LUoj
	 5BPDH1RBCLKq/QZ/2cqqNz0kemyYFg31AZl1ypfI77sHEXKV+OTQMPdPXhzsDquLmV
	 MCPct2nkHj5eYZYOGgoLbN+JW1S3vLWHHoQv7M/X9CrsLunLU6HnxNWpHM5ZiXsYda
	 Riy6fn3Jf9ZCg==
Received: from [192.168.50.250] (unknown [171.76.80.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F28B17E0FC0;
	Tue,  1 Oct 2024 15:50:39 +0200 (CEST)
Message-ID: <87fea8ea-fe9d-4114-b03c-7ec50a4be874@collabora.com>
Date: Tue, 1 Oct 2024 19:20:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs/gpu: ci: update flake tests requirements
From: Vignesh Raman <vignesh.raman@collabora.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, mripard@kernel.org, rodrigo.vivi@intel.com,
 quic_abhinavk@quicinc.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240930095255.2071586-1-vignesh.raman@collabora.com>
Content-Language: en-US
In-Reply-To: <20240930095255.2071586-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi amdgpu Maintainers,

On 30/09/24 15:22, Vignesh Raman wrote:
> Update the documentation to specify linking to a relevant GitLab
> issue or email report for each new flake entry. Added specific
> GitLab issue urls for amdgpu, i915, msm and xe driver.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #intel and xe
> Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # msm
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
> - Add gitlab issue link for msm driver.
> 
> v3:
> - Update docs to specify we use email reporting or GitLab issues for flake entries.
> 
> v4:
> - Add gitlab issue link for xe driver.
> 
> ---
>   Documentation/gpu/automated_testing.rst | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> index 2d5a28866afe..6d7c6086034d 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -68,19 +68,25 @@ known to behave unreliably. These tests won't cause a job to fail regardless of
>   the result. They will still be run.
>   
>   Each new flake entry must be associated with a link to the email reporting the
> -bug to the author of the affected driver, the board name or Device Tree name of
> -the board, the first kernel version affected, the IGT version used for tests,
> -and an approximation of the failure rate.
> +bug to the author of the affected driver or the relevant GitLab issue. The entry
> +must also include the board name or Device Tree name, the first kernel version
> +affected, the IGT version used for tests, and an approximation of the failure rate.
>   
>   They should be provided under the following format::
>   
> -  # Bug Report: $LORE_OR_PATCHWORK_URL
> +  # Bug Report: $LORE_URL_OR_GITLAB_ISSUE
>     # Board Name: broken-board.dtb
>     # Linux Version: 6.6-rc1
>     # IGT Version: 1.28-gd2af13d9f
>     # Failure Rate: 100
>     flaky-test
>   
> +Use the appropriate link below to create a GitLab issue:
> +amdgpu driver: https://gitlab.freedesktop.org/drm/amd/-/issues

Please could you ack this patch. Thanks.

> +i915 driver: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues
> +msm driver: https://gitlab.freedesktop.org/drm/msm/-/issues
> +xe driver: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues
> +
>   drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
>   -----------------------------------------------------------
>   

Regards,
Vignesh

