Return-Path: <linux-arm-msm+bounces-8347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B0983CF21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81685B21996
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD5513A26E;
	Thu, 25 Jan 2024 22:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IEmOB8o7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FC413A26A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 22:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706220322; cv=none; b=IRIbVu2hvizapGUbdSCaM+hYWze32C5TbAknq6O/SIZ5lj0TSnUTjKgpwEkjMN+Do8nDSxZ5kaYO+7A+oGwkdiRGtWNfLf4wkc2C6psDydnMZBd5AUU8cdbAfb65hH0PTcAMMUw1RohnVTHsZkj+QZU2DiQdkCj1DMTF7iYs8+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706220322; c=relaxed/simple;
	bh=6UZeN2gvF4N0TiSWEYcUGGH8fCAPmFkBEliZ0ceaDko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJa1tPfmNFGJ+8/CG++eAtVB2wAKM7Z0UdlYCwRiXs7AXqrDMjJouHr2B40EouizbPkyq47hLxTkWgd5cNGnlbf/H8Dr69e5++T2CzgdboNTL2Jz3ZZf8CNFA+Jq1Y+/vkc5mI/fAT45TfGXOElPs+O6yTJirbLRjkUvnmZuO/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IEmOB8o7; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51025cafb51so25079e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 14:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706220319; x=1706825119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7i/JDSfurnJPpUe/CPBVMrv5ANrpnAIpMMbTtbyaJuI=;
        b=IEmOB8o7vtmSOPFKj1v6Cc0MUh5BaRhSuTgVPjYhticA3zsYSYRsXET6NCAQwi/Jp/
         xHRK8k6PbwHy/4n+p65E6po4GzbblTsV4+cU0be+YCBQ+Nfrwe/8eMDQ9E3LWzgoVcsa
         GEw20Iv9afp9JXry5Nh131j6up3/rJ/zdaQsoP0dVlqgTMO6n92bZVOnIlTL5K8CqVDX
         qqWwzxYZwnYOA23SYVYwYcqlzn72JTuo8iDdLCQSUy6QZHkuk25nxPaopYOpmrivLt1h
         uETih0SpjNPAvMSb8X2J03a2AhM+lr1W7QQmDofDAgZ6zPINeEmm2EY26DVv5YfTD03z
         /KPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706220319; x=1706825119;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7i/JDSfurnJPpUe/CPBVMrv5ANrpnAIpMMbTtbyaJuI=;
        b=mkmlwEXL8I5Fo10uhtrsLCxmDaRDYlj1b2i1RnxcRp3+CHwBfpIQQ8WKielttrZbdg
         x2IVGVNAMGBu2+BqUbTmwjcPayo5I1oZzZAp+8qHSizNtPNblipRC4dhF+SE3qFCZfH9
         8qDSK2fpcGLeaQi0WfqbusS/Nx64PW3Gom/tvyjZVwyKyVKfHccXx/Oxt6V7vlxksOMp
         l5fKQdDTce5fVt446LGAWVp389xWBkf9hYQ6l+C6mIzDbglHkGmce//RJ6F5cBhpdUnQ
         KcWZac5Nr5yTg+mvCMkfvJ/qH8kIGBTDBYwP9RWTI7RctQvI+kHeSo1V6FRHtDvW8S+8
         1Xbg==
X-Gm-Message-State: AOJu0YzVWJn7HsOyF6OHArtShQnq6sv3mm1eEqGvfiuJpB5t9D+ft7W6
	KaeMkxDDfkFSFfai32NDsDzuSHRMsiiw8eaficQ7E07sYc3I7jFS6f7TVx1Bwjk=
X-Google-Smtp-Source: AGHT+IFDduVkeK4mjioFIvOjCs6CeJJEEGFhLLaWm7OiBTdqHt8ALpkAwAt+jkft1PjdbPUGblheuA==
X-Received: by 2002:a05:6512:3d06:b0:510:15e4:ffbc with SMTP id d6-20020a0565123d0600b0051015e4ffbcmr370775lfv.35.1706220318705;
        Thu, 25 Jan 2024 14:05:18 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w11-20020a19c50b000000b005101ea5ca1csm226264lfe.178.2024.01.25.14.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 14:05:18 -0800 (PST)
Message-ID: <493926f1-90e9-493a-bd2f-ea1db16d7ee6@linaro.org>
Date: Fri, 26 Jan 2024 00:05:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] drm/msm/dp: allow YUV420 mode for DP connector when
 VSC SDP supported
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-18-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-18-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> All the components of YUV420 over DP are added. Therefore, let's mark the
> connector property as true for DP connector when the DP type is not eDP
> and when VSC SDP is supported.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4329435518351..97edd607400b8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -370,11 +370,14 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>   
>   	dp_link_process_request(dp->link);
>   
> -	if (!dp->dp_display.is_edp)
> +	if (!dp->dp_display.is_edp) {
> +		if (dp_panel_vsc_sdp_supported(dp->panel))
> +			dp->dp_display.connector->ycbcr_420_allowed = true;

Please consider fixing a TODO in drm_bridge_connector_init().

>   		drm_dp_set_subconnector_property(dp->dp_display.connector,
>   						 connector_status_connected,
>   						 dp->panel->dpcd,
>   						 dp->panel->downstream_ports);
> +	}
>   
>   	edid = dp->panel->edid;
>   

-- 
With best wishes
Dmitry


