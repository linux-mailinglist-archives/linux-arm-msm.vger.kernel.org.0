Return-Path: <linux-arm-msm+bounces-53693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C593A82EA7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 20:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21D1D1B67BEB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 18:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4F427703E;
	Wed,  9 Apr 2025 18:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="YlmtSUyk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384F01C5D63;
	Wed,  9 Apr 2025 18:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223285; cv=none; b=WVNv569dDzOZJjfgzZtAOw5CF4Su9z1ukFKetEtKUVZaA3QDrqEkKMNbLf+mpA5LQfy8GhmRkySWh1C4ksuexAXrlnnPdY0QhLaqI2ucHq2PdgphDtpGv6GMaPzC343Km/CWWghBKBNIA39/TJB/xMdBheqbR0QdHvKfuXSco9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223285; c=relaxed/simple;
	bh=yjh43TtDm+paZlNIRlrqPwPQ02q0Bjp2xXCqZ3x0O0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxstBs+CDqozh4YNA/iHDJcj9DryhtPRMt0v3wH7TnRAUM3JPpkFheXrdQGmo+lELtTz1ISZMcN+xN1mt8ISZ7b28KmGzuEP88RfOULpjeAUntaysK08ebgcUstNbN6wWxltq8tfTRBHaJ2O1cKx+pXj6BylgX2Ny9OSVZfoR+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=YlmtSUyk; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1744223279; bh=yjh43TtDm+paZlNIRlrqPwPQ02q0Bjp2xXCqZ3x0O0c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YlmtSUykxFWQOWVLo+nuJDSq9I10JBfzx/66JhXKSVrahZo3YJ6OrGtlr9ANrHZj2
	 V6XiMqpK5OtKbhC9wJdVENM3IBjJ66WuPAP9VObAoATnjkuDNDJz4p45IsRtoD8KMz
	 tShzVjfUHsGSeiN3XfKjI1xAFznPtdmevsMFKTnsxebUPkfu1JweZZDOdU8xEjU4Yi
	 8DG8G7XynnQFT8ZdBW1c8E/DdiJmtu3vsy5gXtsAeSJUlfYELB3eJE6fXpJV3Ypmjn
	 t43MuhuOhLr8gEyXgjLs1OUb9idkDTmKBM5JxNeJqp5Ekw5rCqvcr13L1grwRvDLXL
	 F7OiH+2W5w1zuhq4YoL4LoYvuFpPg0VXZLdlg1bn9au7WqqcpmUlmzoarSv7ACMc/l
	 HDwo9v86T+VRmsczy+3/ce+MLITfcvq7ZinrzpvgqusM99Hs251S1IyT6RmsO1YtQm
	 ybww8NKSL6xDVxDqKEpVZ5GZDehNJYj2uHsiBNfB8ejnoRbI7nZAICrUIdivrqLQbF
	 evOy9P93l28c/7HPtSJFzkn9x4KHSr0gGvjZzUoRUkvYyr5PMPbY1kiSt/ItmkOhCV
	 VPLKBd34n1pTFkHGCwPPsP7RgP5RRPFgKB4o+9UCEM0UAsa3jjocytrCV1KQs98aB7
	 2B+/mq2B1o77rBAHWz5a3fjs=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 7B4B8162A2C;
	Wed,  9 Apr 2025 20:27:58 +0200 (CEST)
Message-ID: <bf7bfe6f-69d7-4166-b3c4-010f7b9f3113@ijzerbout.nl>
Date: Wed, 9 Apr 2025 20:27:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND RFC v4 3/6] drm/display: dp: use new DCPD access
 helpers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Jani Nikula <jani.nikula@intel.com>
References: <20250324-drm-rework-dpcd-access-v4-0-e80ff89593df@oss.qualcomm.com>
 <20250324-drm-rework-dpcd-access-v4-3-e80ff89593df@oss.qualcomm.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20250324-drm-rework-dpcd-access-v4-3-e80ff89593df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Op 24-03-2025 om 12:51 schreef Dmitry Baryshkov:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Switch drm_dp_helper.c to use new set of DPCD read / write helpers.
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/display/drm_dp_helper.c | 296 +++++++++++++-------------------
>   1 file changed, 116 insertions(+), 180 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 410be0be233ad94702af423262a7d98e21afbfeb..e2439c8a7fefe116b04aaa689b557e2387b05540 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> [...]
> @@ -3542,7 +3509,7 @@ int drm_dp_pcon_frl_configure_2(struct drm_dp_aux *aux, int max_frl_mask,
>   	else
>   		buf &= ~DP_PCON_FRL_LINK_TRAIN_EXTENDED;
>   
> -	ret = drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_2, buf);
> +	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_2, buf);
>   	if (ret < 0)
>   		return ret;
>   
Don't forget to delete the remainder of the function.
Also the variable `ret` isn't used anymore.
-- 
Kees

