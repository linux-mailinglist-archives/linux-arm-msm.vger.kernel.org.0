Return-Path: <linux-arm-msm+bounces-48871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 094E2A3F2CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 12:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B4CF19C6E33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 11:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE62F20897E;
	Fri, 21 Feb 2025 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vwq1uJit"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDA820896B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 11:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740136494; cv=none; b=iUyjCVh8C/JSAkyP/l5OErplq1DHtCPtR3o2R28ix7iSLzqlrjqspPc7ymK+/vz9+uuxngIM4Av6+rPUFlnDd2q01EaqD+rtqD9OqLiWDFvzCRdhnsCa9WTYGMDGK7oX21mwj2TqJe2/7r+zhX+2sLrqDT3Mz3nhTQV7KobGcPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740136494; c=relaxed/simple;
	bh=FY8aLZoXalN/YxJze2UCbfOU4J3I0AwOWV2az/14RSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RnwI3TahQSVqnC6opsVHraD1kPA0E79CNvPvjb9CEO/11b0cjGjQEDj9dXTzxn0A+tNc2f12YTMgXmfCQz4SNK4LMGM4CliaQofG4gvG/xD7H+vk2Y1bQxro3pIHnYbuyhFTFmuiEkUJ3PD2t5la/wP0nfAJMmOJbI6svNkHrD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vwq1uJit; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dbe706f94fso323749a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 03:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740136491; x=1740741291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ovhPZM4lamF/N7gru3ZKZte0ZyqiKzSMS3HZ49d1xIk=;
        b=Vwq1uJitcPYPRMDL2b2ThezAa4xYH74zsziNy7s06jZXBjj4RTI/CNcUq9+QtCTCPN
         +U9tR3OHTE+MTZOvXMf2OezbeerwOs4rWc6sMzk+a4XZJMMK8D3I/Zk/LsmnldPovVXI
         Tqcp8BOpQHCycZlMmiw1cmg/EpFq/Auo3wgnpF7v1KBKYreLHMIs0V3CO7z85PozpQ2t
         1K+v8gq6KsWAetHK8i28XSb6LkxIodba4aJi532P+ZbMYTtRKg8g1tnlp5DFNDZ2Cy36
         ShWDqBCiQ9hVqFNpez289GFa1B0xCktI5WwYLS3tXnU1QLZX6w83EIGRz34mAT2EoDWP
         MCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740136491; x=1740741291;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovhPZM4lamF/N7gru3ZKZte0ZyqiKzSMS3HZ49d1xIk=;
        b=sR1KIgJOjlhHmHnU0CtpDNzf4id5YT5qKjfZAbstOvbiyeucVL+mU8iRv8HpFSoTLj
         Tqg8ws4rHJYhXz7ELXb4c/TH1kxwkRF7KCoACmkT9HTmEDri/SZPbNXcJagOMARKXynz
         x13SmkxzyYJ4iWCC5UDWpmzR9a322Vo6S5kFTcanXyPt7EsIZ0mtQyUb0kQ5QMdWap6C
         VUwMrklrsHJvIRJd0qWLYBf/V+q+R8bmbrbOlI+L7gl1JfgbdI5qCpuTKezsEsmTb84V
         AikWudMhkjomPbAWnKk06XojQGAkn6EfyoOljEDOPuIZXjKSBDi4KrZBYjEvBzGGTDTZ
         Ps9w==
X-Forwarded-Encrypted: i=1; AJvYcCXSdQPa7BlGzdNewsKbEWLpeI/TB1Suf9B79ToYNyZ2kLcPeyM7YCvLvud2gGBjbXnJD0r4Q+tRi+jh32NT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4a+/kShwb79ETWsSHVIO6mEXr7cCB0kZHb9aV+WrGbklmGzHY
	MogKX0GXHekUc5aG8OWCT/4NdnNmFxrfI6neVVPsgQBJ7uWb7aMoXjsaokZvu2w=
X-Gm-Gg: ASbGncujYm+bm2t3SiPcG63j4PrVIblbPVvJWKL2r9QLuVH4IVMGJx60CnJtJQ9pUYg
	sZcC6IsLYUHcztVgfg3zqOHpavp6ata3R4d0AOcAP1Ns50sSbG5kW7B2ZE+d1p3bd4KKdNdJNU6
	zEeXIPdQqI6sM6jeyJG0itu9fAnfEGCD5EQ/pomJ2q0Qyg1atIId5GL5lMfcOFxSXTS2cq6SJfc
	T3NzzElMWgs108eyPqOvpCztY4qPPOVRpjknHLRETGeQoRY7kYJr3hyqcEA1wCq7gzvfwMs+an0
	VPfF0bejIa1QYYhTtoACeXfe/wYx7W+HXKvrgyLfVEmoMKldHRaMHN1BwOHh1qm0V7aBL6fsT8y
	o/Y9t
X-Google-Smtp-Source: AGHT+IExhCVZ6dclPidui8BX3t7w/euKXXQuZ68kuHuXRdrPfZzRBNlO1WRvy20ay5cYzBgVThLtKQ==
X-Received: by 2002:a17:907:9713:b0:ab7:f92c:8ff9 with SMTP id a640c23a62f3a-abc099c6f28mr112558866b.1.1740136491127;
        Fri, 21 Feb 2025 03:14:51 -0800 (PST)
Received: from [192.168.0.18] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbbe74100asm678855066b.95.2025.02.21.03.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 03:14:50 -0800 (PST)
Message-ID: <1994b168-b6e5-48c7-925a-8ba13e64cce0@linaro.org>
Date: Fri, 21 Feb 2025 12:14:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] drm/msm/dsi: Add support for SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-12-d201dcdda6a4@linaro.org>
 <bvxw6btyefw67owjeke7edxk67dhq56ewu63cw57ckpupcunng@v7oq7knhaukm>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <bvxw6btyefw67owjeke7edxk67dhq56ewu63cw57ckpupcunng@v7oq7knhaukm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/02/2025 20:05, Dmitry Baryshkov wrote:
> On Mon, Feb 17, 2025 at 05:41:33PM +0100, Krzysztof Kozlowski wrote:
>> Add support for DSI on Qualcomm SM8750 SoC with notable difference:
>>
>> DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
>> parents before DSI PHY is configured and the PLLs are prepared with
>> initial rate is set.  Therefore assigned-clock-parents are not working
>> here and driver is responsible for reparenting clocks with proper
>> procedure: see dsi_clk_init_6g_v2_9().
>>
>> Part of the change is exactly the same as CLK_OPS_PARENT_ENABLE, however
>> CLK_OPS_PARENT_ENABLE won't work here because assigned-clock-parents are
>> executed way too early - before DSI PHY is configured.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> SM8750 DSI PHY also needs Dmitry's patch:
>> https://patchwork.freedesktop.org/patch/542000/?series=119177&rev=1
>> (or some other way of correct early setting of the DSI PHY PLL rate)
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi.h      |  2 +
>>  drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 25 ++++++++++++
>>  drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  1 +
>>  drivers/gpu/drm/msm/dsi/dsi_host.c | 80 ++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 108 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
>> index 87496db203d6c7582eadcb74e94eb56a219df292..93c028a122f3a59b1632da76472e0a3e781c6ae8 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>> @@ -98,6 +98,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi);
>>  int msm_dsi_runtime_suspend(struct device *dev);
>>  int msm_dsi_runtime_resume(struct device *dev);
>>  int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host);
>> +int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host);
>>  int dsi_link_clk_set_rate_v2(struct msm_dsi_host *msm_host);
>>  int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host);
>>  int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
>> @@ -115,6 +116,7 @@ int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *iova);
>>  int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t *iova);
>>  int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
>>  int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
>> +int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host);
>>  int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>>  int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>>  void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> index 7754dcec33d06e3d6eb8a9d55e53f24af073adb9..e2a8d6fcc45b6c207a3018ea7c8744fcf34dabd2 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> @@ -205,6 +205,17 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
>>  	},
>>  };
>>  
>> +static const struct msm_dsi_config sm8750_dsi_cfg = {
> 
> Can we use sm8650_dsi_cfg instead? What is the difference?

Yeah, I'll changeit. I think I was looking at this even and could not
find differences.



Best regards,
Krzysztof

