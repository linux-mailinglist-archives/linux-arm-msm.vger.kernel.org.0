Return-Path: <linux-arm-msm+bounces-51848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F13A67F75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 23:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B14B8884036
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 22:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF052063FE;
	Tue, 18 Mar 2025 22:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dvJ2GAcE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586632066EC
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 22:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742335892; cv=none; b=qzQGGQbdEeYPA9/JG1qz7XoYb93TKZEOS5nGdc6sP/PiXUjrE13LfhJ8xfKKMf3Z+aVW/1lU+HY6heKf0XWGiQaR5vf8/rSW3kNVnl0lSnWsQJxUZEcKrlCk+YRvEQI0k0xwOQZkwENCIkcWDyLMyqxbt/24o1ja0ZVU4K8MrPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742335892; c=relaxed/simple;
	bh=8YyhfXM617hfHtPJd477Ly+6QBcclW35yHF0s5QHu3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpD8Om5ZdDX75SQ8JI2Vin7iwI74YgGQAX3swW5W/IfIVpV4l6gdO26HI7Ibg3Rw6kR2yt/gdzZUPUdmJixul5UCcgVCMkCiBPr0NlMqLHfnlOLAO1hBiHLgmVqt9Q6uwfSymhgTUZgQqf65fTkvZc+4pJtARCIihR5OdL6pgWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dvJ2GAcE; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so1127101566b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 15:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742335888; x=1742940688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hpA9bQ4pMcaISUAeghueOEj+qgHSOipoTeKRPRCEfvk=;
        b=dvJ2GAcE1KqWXNA5+2kehoC2UsJu1b8mRK0/YrcqiQFTkP1MCMYKpAR5C8vlD7ffvr
         z8J6RvqJzkokDt5+Md63bc4UpmgsfWJNaoREm4FqWTZ15VxUpy7Kg37xs8UPqThvbLQW
         qVIC+9BBjC31j71wJ+a+QeDEepNh9PpFgOhX9g4Ot/c/k+XsOoXKUNVCebM5v+D6BjFi
         gPT1j6LcSPfUzvlIm2kubBmRk+rjHCBIkLqSAkvwgfuz80HKPZC+a20pSolaVdJuQhmM
         L1mkPh9sISFOOhE0Dew+hdKqK1yFXrnz60p0iYJZjq/OPoohG73dyp890Gd4Q2NNlaXb
         i3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742335888; x=1742940688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hpA9bQ4pMcaISUAeghueOEj+qgHSOipoTeKRPRCEfvk=;
        b=vUXgaHSJLMcZwsETymj/Uv3p99ntIB7nWBLV5iN5Bir2JA0tEF6eEifSkip7LKii3d
         lCz6UHMXZpqbEfmvZw1sfjbOVVXpEMhuQvhwmeGDWxmNJhgFar8bLrpPiFFYSy1RGZfx
         bp4V+SwMB2qXz8nrrBo09pQ2LL4fpup3xa/I6jFsmgaer5m+LG+Bj9ejgBxGffzhNS85
         ygBUwRY87EKiivT7XGK8HMID5CvuKJBoHLYOVqUo0299w2qKU6rufXUsEbvT471f84K0
         Bc3q0x+3uwbzlA2ODtlip10ZgvUZXPv6pEF5eQ9j8gQyY+Mh4g+KpKs4K/GT+VIGZanG
         LtbQ==
X-Gm-Message-State: AOJu0YwBRUitCSLHVncEs+Qjqc0E7ZRrm4rzofWNmMuoaRT+Y70rLKXC
	D4CSlOHs4h8/IYF2c3NBlaM3/Q0bH3OnLYw/4yFg9qdVy9+TZ73dfaT2rX8TAlE=
X-Gm-Gg: ASbGncuaWkPYJYOlQk44uALdd3gjzPfZpRa0SBMenb7xpqDNk2EPRcggSf+D4c8wr+r
	ZX9K2bULBMzryWMi8VSDaAGo5UAuY9gxBzgw6+d37hA/2tviZkfe4OpZ77ja3hVIglMaDWnvFBq
	6IAPNyadjdZf8NYjyu6fdiyaENx6JJGRxTmGJkeSQ9T1xavs2azWC+rxalGq4gJnb7WP3g+/dfb
	unzD2aJNGzn+UI5swxWo1jC1+i95FSfpUUbDXHuom53Uph5QND2tsx3jE5spJE81Gf2ByMRl2kj
	pM3PR38E8ruhpH+2Vt7+DMCNgOJchEqksA1QsiIoC8Jr0zAbqgA//hzcw6U2XYx8pjMnPE91ys4
	feFK/IzRKP8YFaYJ1Cx1pPRcWHa+MBgbmXU6Y28Rtr37bdfGRPskRWhR51eVoXKu4lzg3xiPlrh
	91Ay2xmYrx1g7YNafAHWUn0F0Z7Vffps8=
X-Google-Smtp-Source: AGHT+IGOZyBqDsBtNfmFkVTUQJEJXhhHbgGvRBjOOvuyLz/DetWjppc+0BfyyVXf1QgLgT+D4hD4Ag==
X-Received: by 2002:a17:907:2d10:b0:ac2:dcb9:d2d4 with SMTP id a640c23a62f3a-ac3b7d95cd4mr19256266b.14.1742335887549;
        Tue, 18 Mar 2025 15:11:27 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac31485896asm897085466b.84.2025.03.18.15.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:11:27 -0700 (PDT)
Message-ID: <b5f4ea78-4a38-4e89-8808-76658f216a90@linaro.org>
Date: Tue, 18 Mar 2025 22:11:26 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] venus: pm_helpers: add compatibility for
 dev_pm_genpd_set_hwmode on V4
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250218-switch_gdsc_mode-v4-0-546f6c925ae0@quicinc.com>
 <20250218-switch_gdsc_mode-v4-1-546f6c925ae0@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250218-switch_gdsc_mode-v4-1-546f6c925ae0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/02/2025 10:33, Renjiang Han wrote:
> There are two ways to switch GDSC mode. One is to write the POWER_CONTROL
> register and the other is to use dev_pm_genpd_set_hwmode(). However, they
> rely on different clock driver flags. dev_pm_genpd_set_hwmode() depends on
> the HW_CTRL_TRIGGER flag and POWER_CONTROL register depends on the HW_CTRL
> flag.
> 
> By default, the dev_pm_genpd_set_hwmode() is used to switch the GDSC mode.
> If it fails and dev_pm_genpd_set_hwmode() returns -EOPNOTSUPP, it means
> that the clock driver uses the HW_CTRL flag. At this time, the GDSC mode
> is switched to write the POWER_CONTROL register.
> 
> Clock driver is using HW_CTRL_TRIGGER flag with V6. So hwmode_dev is
> always true on using V6 platform. Conversely, if hwmode_dev is false, this
> platform must be not using V6. Therefore, replace IS_V6 in poweroff_coreid
> with hwmode_dev. Also, with HW_CTRL_TRIGGER flag, the vcodec gdsc gets
> enabled in SW mode by default. Therefore, before disabling the GDSC, GDSC
> should be switched to SW mode so that GDSC gets enabled in SW mode in the
> next enable.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/core.h       |  2 ++
>   drivers/media/platform/qcom/venus/pm_helpers.c | 38 ++++++++++++++------------
>   2 files changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 43532543292280be15adf688fc0c30f44e207c7f..0ccce89d3f54cf685ecce5b339a51e44f6ea3704 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -168,6 +168,7 @@ struct venus_format {
>    * @root:	debugfs root directory
>    * @venus_ver:	the venus firmware version
>    * @dump_core:	a flag indicating that a core dump is required
> + * @hwmode_dev:	a flag indicating that HW_CTRL_TRIGGER is used in clock driver
>    */
>   struct venus_core {
>   	void __iomem *base;
> @@ -230,6 +231,7 @@ struct venus_core {
>   		u32 rev;
>   	} venus_ver;
>   	unsigned long dump_core;
> +	bool hwmode_dev;
>   };
>   
>   struct vdec_controls {
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..409aa9bd0b5d099c993eedb03177ec5ed918b4a0 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -412,9 +412,17 @@ static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
>   	u32 val;
>   	int ret;
>   
> -	if (IS_V6(core))
> -		return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
> -	else if (coreid == VIDC_CORE_ID_1) {
> +	ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
> +	if (ret == -EOPNOTSUPP) {
> +		core->hwmode_dev = false;
> +		goto legacy;
> +	}
> +
> +	core->hwmode_dev = true;
> +	return ret;
> +
> +legacy:
> +	if (coreid == VIDC_CORE_ID_1) {
>   		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
>   		stat = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_STATUS;
>   	} else {
> @@ -450,7 +458,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
>   
>   		vcodec_clks_disable(core, core->vcodec0_clks);
>   
> -		if (!IS_V6(core)) {
> +		if (!core->hwmode_dev) {
>   			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
>   			if (ret)
>   				return ret;
> @@ -468,7 +476,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
>   
>   		vcodec_clks_disable(core, core->vcodec1_clks);
>   
> -		if (!IS_V6(core)) {
> +		if (!core->hwmode_dev) {
>   			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
>   			if (ret)
>   				return ret;
> @@ -491,11 +499,9 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
>   		if (ret < 0)
>   			return ret;
>   
> -		if (!IS_V6(core)) {
> -			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
> -			if (ret)
> -				return ret;
> -		}
> +		ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
> +		if (ret)
> +			return ret;
>   
>   		ret = vcodec_clks_enable(core, core->vcodec0_clks);
>   		if (ret)
> @@ -511,11 +517,9 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
>   		if (ret < 0)
>   			return ret;
>   
> -		if (!IS_V6(core)) {
> -			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
> -			if (ret)
> -				return ret;
> -		}
> +		ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
> +		if (ret)
> +			return ret;
>   
>   		ret = vcodec_clks_enable(core, core->vcodec1_clks);
>   		if (ret)
> @@ -811,7 +815,7 @@ static int vdec_power_v4(struct device *dev, int on)
>   	else
>   		vcodec_clks_disable(core, core->vcodec0_clks);
>   
> -	vcodec_control_v4(core, VIDC_CORE_ID_1, false);
> +	ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
>   
>   	return ret;
>   }
> @@ -856,7 +860,7 @@ static int venc_power_v4(struct device *dev, int on)
>   	else
>   		vcodec_clks_disable(core, core->vcodec1_clks);
>   
> -	vcodec_control_v4(core, VIDC_CORE_ID_2, false);
> +	ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
>   
>   	return ret;
>   }
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

