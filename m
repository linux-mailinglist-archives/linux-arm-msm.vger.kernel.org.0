Return-Path: <linux-arm-msm+bounces-647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F1E7EB6B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 20:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F581281219
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 19:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185F2443C;
	Tue, 14 Nov 2023 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="U9wNyt0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BD71FD3
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 19:01:18 +0000 (UTC)
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98CAF4
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 11:01:16 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-41cd7a3e8f8so37624961cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 11:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1699988476; x=1700593276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ln8BfCEw41joQaCUa9COZIwEZXTxudxf07hjQ7uch88=;
        b=U9wNyt0yGDgl0KcgehWtnzDbSJ4lIxs5yYUzd8G5grGasiypLykNl5ku2MVQIpltgD
         bmXsQ3cAf5EjTgGvo9eulV/v5eAWz7TE3nUQJo0kMLVKvGhNNrVf695kQgaF19aw2Dr/
         tdq39/lPbwifXB1Jgp7nRnumbQfOi9hj7WlfuhKZshRDB2uf19RdJHkoEyhkGZs2JxtL
         pffVFrHu+fRf5w4S63tpZ+wpmr+W7TcVAxPR/inhVnUI6WCOIDNjqxqPlKCsFvT0AyuY
         QkBq3B29jfw1FniYT/PkkE3n39x/XUU1GxNiDAaZjJFMszVOj87w35EEN+sLqNeUxRd+
         JmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699988476; x=1700593276;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ln8BfCEw41joQaCUa9COZIwEZXTxudxf07hjQ7uch88=;
        b=WTBB/hxmI/fv00pZYEAt8g41hjvLWP+cux5/FHFD7LTma9S/xr6qZBi+hj1XtDi8lW
         rrQ4A032ebZ1WAY0QODuD0mgGmJyAQF7AS5VmVy/LPXe+7n9ivvllPjMwzkeWFbN6gsI
         5BcAWWrPj4BZYvZK2tZqXN/io3GAuKAq5J8/wPx7VnxePfoW41MqPGIaDsj7kQZh5puz
         +S5fWxToXUNql467iOZ6k0brCmN64xf2xEow+X78j+ryS19A+WXyMivBFVVf2TRrXsOc
         x26oZpR8jR0V9SEceLtRqgWLWJqDqGybM9965D8ed8YRsujgFFnW6VcYQqXsogViMBnM
         rkhQ==
X-Gm-Message-State: AOJu0YyJdDUq0FyEViBl17U+zaf7qf2u9rD3yUXNOFSfx0sHDdEaCXRP
	oA2khhFi6suTOV3Ywtlj/gyjKg==
X-Google-Smtp-Source: AGHT+IEZY0mszhjE/XG+0ap4RZgrAiwX+iNlMgnQL+4jhxs+Ugv/XtWsq8FnNFrQ9qJKcauRm5C8IQ==
X-Received: by 2002:ac8:5a93:0:b0:421:b37c:fdd5 with SMTP id c19-20020ac85a93000000b00421b37cfdd5mr3468998qtc.53.1699988475970;
        Tue, 14 Nov 2023 11:01:15 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id o24-20020ac85558000000b004198ae7f841sm2944733qtr.90.2023.11.14.11.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 11:01:15 -0800 (PST)
Subject: Re: [PATCH 4/4] drm/msm/dsi: fix DSC for the bonded DSI case
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, Doug Anderson
 <dianders@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20231114174218.19765-1-jonathan@marek.ca>
 <20231114174218.19765-4-jonathan@marek.ca>
 <eanx45rnasj7lu3r2tfhtg4qkqkcidd6zctsz6ci6jlklu4fgi@3nf73w2ka4li>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <a9712ef1-5f60-b127-a276-9e437d95914f@marek.ca>
Date: Tue, 14 Nov 2023 14:00:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <eanx45rnasj7lu3r2tfhtg4qkqkcidd6zctsz6ci6jlklu4fgi@3nf73w2ka4li>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/14/23 1:28 PM, Marijn Suijten wrote:
> On what hardware have you been testing this?  Dmitry and I have a stack of
> patches to resolve support for Active CTL programming on newer hardware (DPU
> 5.0+ IIRC), where a single CTL is responsible for programming multiple INTF and
> DSC blocks as used in bonded DSI.
> 

I am also using DPU 6+ but I won't be posting patches for DPU to support 
this as I am not using the upstream DPU codebase.

> On 2023-11-14 12:42:16, Jonathan Marek wrote:
>> For the bonded DSI case, DSC pic_width and timing calculations should use
>> the width of a single panel instead of the total combined width.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++-
>>   drivers/gpu/drm/msm/dsi/dsi_host.c    | 20 +++++++++++---------
>>   drivers/gpu/drm/msm/dsi/dsi_manager.c |  2 +-
>>   3 files changed, 14 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
>> index 28379b1af63f..3a641e69447c 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>> @@ -93,7 +93,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host);
>>   int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>>   				  const struct drm_display_mode *mode);
>>   enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>> -					    const struct drm_display_mode *mode);
>> +					    const struct drm_display_mode *mode,
>> +					    bool is_bonded_dsi);
>>   unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
>>   int msm_dsi_host_register(struct mipi_dsi_host *host);
>>   void msm_dsi_host_unregister(struct mipi_dsi_host *host);
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 7284346ab787..a6286eb9d006 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -938,8 +938,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   			       mode->hdisplay, mode->vdisplay);
>>   			return;
>>   		}
>> -
>> -		dsc->pic_width = mode->hdisplay;
>> +		dsc->pic_width = hdisplay;
> 
> In my testing and debugging on CMDmode panels downstream this value/register
> was always programmed to the _full_ width of the bonded panel.  Is that maybe
> different for video mode?
> 

downstream dual DSI panel timings are specified for a single panel 
("qcom,mdss-dsi-panel-width" is for a single panel, not both panels)

>>   		dsc->pic_height = mode->vdisplay;
>>   		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
>>   
>> @@ -950,6 +949,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   		if (ret)
>>   			return;
>>   
>> +		if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
>> +			dsi_update_dsc_timing(msm_host, false, hdisplay);
>> +		else
>> +			dsi_update_dsc_timing(msm_host, true, hdisplay);
>> +
> 
> Such cleanups (which appear unrelated) should probably be posted as separate
> patches.
> 
> - Marijn
> 

Its not unrelated, dsi_update_dsc_timing call is moved up so it can use 
the single-panel "hdisplay" value before it gets adjusted for DSC.

>>   		/* Divide the display by 3 but keep back/font porch and
>>   		 * pulse width same
>>   		 */
>> @@ -966,9 +970,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   	}
>>   
>>   	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
>> -		if (msm_host->dsc)
>> -			dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
>> -
>>   		dsi_write(msm_host, REG_DSI_ACTIVE_H,
>>   			DSI_ACTIVE_H_START(ha_start) |
>>   			DSI_ACTIVE_H_END(ha_end));
>> @@ -987,9 +988,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
>>   			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
>>   	} else {		/* command mode */
>> -		if (msm_host->dsc)
>> -			dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
>> -
>>   		/* image data and 1 byte write_memory_start cmd */
>>   		if (!msm_host->dsc)
>>   			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>> @@ -2487,7 +2485,8 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>>   }
>>   
>>   enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>> -					    const struct drm_display_mode *mode)
>> +					    const struct drm_display_mode *mode,
>> +					    bool is_bonded_dsi)
>>   {
>>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>   	struct drm_dsc_config *dsc = msm_host->dsc;
>> @@ -2497,6 +2496,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>>   	if (!msm_host->dsc)
>>   		return MODE_OK;
>>   
>> +	if (is_bonded_dsi)
>> +		pic_width = mode->hdisplay / 2;
>> +
>>   	if (pic_width % dsc->slice_width) {
>>   		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
>>   		       pic_width, dsc->slice_width);
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> index 896f369fdd53..2ca1a7ca3659 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> @@ -455,7 +455,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>>   			return MODE_ERROR;
>>   	}
>>   
>> -	return msm_dsi_host_check_dsc(host, mode);
>> +	return msm_dsi_host_check_dsc(host, mode, IS_BONDED_DSI());
>>   }
>>   
>>   static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
>> -- 
>> 2.26.1
>>

