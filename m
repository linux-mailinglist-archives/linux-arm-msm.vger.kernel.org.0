Return-Path: <linux-arm-msm+bounces-8346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 529B783CF1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD1EA1F279AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C6613A26E;
	Thu, 25 Jan 2024 22:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w88JTVib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BFE1CA89
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 22:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706220097; cv=none; b=My1cVBioeF6trzt66hBO1fH1oQcIdb1es46MqpVlC/oxMG9cszxLRoAgBZ2FwNruNwqlpnOYvCQiQ5yhxgrv1CkLWTW1EDUxGZ0Lnykpj8lnnzjSZYtzAFuofvyEOet2ilv6kLbD1abl4ap+U63XTlnMO+QGt+HWKDr+VBykM/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706220097; c=relaxed/simple;
	bh=FWuJZ8kFu1bRBvLuAJhn1vSQx4lCMCpzYda6vElzElk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QSOKF5u1sXCViPjJodRmicJRRv0jUN3xoc4XfOuYouV+IB19NI53FoV03OMeqi+46XBp3Y9PWZCrjFnq5xD07IckLj9IfGT64g5ejXJV/dyivyRfbNSFmvuOlicWm/RaUzOdz9M71lAWOfBGP5LlisYOyxGWqxLer3CSE5YHPPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w88JTVib; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e7ddd999bso8121819e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 14:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706220093; x=1706824893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N1c30FraN5NBmhRkY7x/gyWQbLWA0MDZZ+3VKQqjtk8=;
        b=w88JTVibpUeDaJLUB+wIWObIpYIcM1k6aHeOqK7tKw9Sm+1XhqJcXNu6qU7CeV+G5f
         2fQMa1gEltgPSX1zYomfsS7bX6oJ/SGggQIIyEHivXws11tqwoqmgshpM195iZO4JaEo
         Gpi8pFgJ3MikEOqof+S9E88zf5PCwjvFEAeBKQbDA3bnUtoz/QyhOslEFhxo+rx6jTMo
         G7J9uSJzEIjgPo7JofspULrvd01CdT4Al2v1PKcRtWXHWhSqMt3hY3NEmsHR51MpgB38
         kVQsxtJhh7eo8RkwmutuA7pRQSn8l4ahbUF/O3pSiEfc3bYfaWwV4mtRS4uxGkpAY3NX
         kKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706220093; x=1706824893;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N1c30FraN5NBmhRkY7x/gyWQbLWA0MDZZ+3VKQqjtk8=;
        b=mC88HnKKsmhVuIbE/wvqLFn4Jogj4wCWpcuqaAwUU3XmhsvtVvriG6ODJQqWt9ouQZ
         hDbcWSq5qGE9VSktggtsATSxNdMVFkb4cLkAblUHJkbgDKn1NTvm5yxIHJJK9f1uzNSk
         LTgpAInXVO3nQODxSXFIif3RwL0qyskp7HfMp8aEksL0Va7jXeHcwe8QOT2hJVOYmVg3
         Y2TpGDZFzfCdibYQ3B++hIcFUQYaxLPMt8nNTp26wP87Qs5spGlftAbygfz9I2m4dFTa
         z6Bvbu4nV7xEMFJjsNevlMFrgkDpQi64mxGGzbgOBt7Bb6crn1n9E/PmX84RHRAUpaNm
         ky/w==
X-Gm-Message-State: AOJu0YxTcdJjbE52P/Mr67DHkwvxsxk2dBy6DNufr9+bj2qwl1jknzS6
	FJUDNp0eQl4yTGTeqFBketSP/cXD1FvrSGiVjWvggkwYQprncm1qkRmkenXbYyU=
X-Google-Smtp-Source: AGHT+IERGRBYPlv5GM7pjTZeMCQZyP9iUdk1BpZBZTLpdtFxDQwwAqLMfXFEBNTt9NG+/34Z7ZQKhw==
X-Received: by 2002:a05:6512:ad3:b0:510:121d:939e with SMTP id n19-20020a0565120ad300b00510121d939emr326792lfu.36.1706220093184;
        Thu, 25 Jan 2024 14:01:33 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w11-20020a19c50b000000b005101ea5ca1csm225562lfe.178.2024.01.25.14.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 14:01:32 -0800 (PST)
Message-ID: <2d9bbcf8-e292-49e7-a357-f421438c2bf1@linaro.org>
Date: Fri, 26 Jan 2024 00:01:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/dpu: reserve CDM blocks for DP if mode is
 YUV420
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-17-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-17-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> Reserve CDM blocks for DP if the mode format is YUV420. Currently this
> reservation only works for writeback and DP if the format is YUV420. But
> this can be easily extented to other YUV formats for DP.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 99ec53446ad21..c7dcda3d54ae6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -613,6 +613,7 @@ static int dpu_encoder_virt_atomic_check(
>   	struct dpu_kms *dpu_kms;
>   	struct drm_display_mode *adj_mode;
>   	struct msm_display_topology topology;
> +	struct msm_display_info *disp_info;
>   	struct dpu_global_state *global_state;
>   	struct drm_framebuffer *fb;
>   	struct drm_dsc_config *dsc;
> @@ -629,6 +630,7 @@ static int dpu_encoder_virt_atomic_check(
>   	DPU_DEBUG_ENC(dpu_enc, "\n");
>   
>   	priv = drm_enc->dev->dev_private;
> +	disp_info = &dpu_enc->disp_info;
>   	dpu_kms = to_dpu_kms(priv->kms);
>   	adj_mode = &crtc_state->adjusted_mode;
>   	global_state = dpu_kms_get_global_state(crtc_state->state);
> @@ -656,8 +658,8 @@ static int dpu_encoder_virt_atomic_check(
>   	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
>   
>   	/*
> -	 * Use CDM only for writeback at the moment as other interfaces cannot handle it.
> -	 * if writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> +	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
> +	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
>   	 * earlier.
>   	 */
>   	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> @@ -665,12 +667,15 @@ static int dpu_encoder_virt_atomic_check(
>   
>   		if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))))
>   			topology.needs_cdm = true;
> -		if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> -			crtc_state->mode_changed = true;
> -		else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> -			crtc_state->mode_changed = true;
> +	} else if (dpu_enc->disp_info.intf_type == INTF_DP) {

You can use disp_info directly here.

> +		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> +			topology.needs_cdm = true;
>   	}
>   
> +	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> +		crtc_state->mode_changed = true;
> +	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> +		crtc_state->mode_changed = true;
>   	/*
>   	 * Release and Allocate resources on every modeset
>   	 * Dont allocate when active is false.
> @@ -1111,7 +1116,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   
>   	dpu_enc->dsc_mask = dsc_mask;
>   
> -	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> +	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||
> +	    dpu_enc->disp_info.intf_type == INTF_DP) {
>   		struct dpu_hw_blk *hw_cdm = NULL;
>   
>   		dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,

-- 
With best wishes
Dmitry


