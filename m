Return-Path: <linux-arm-msm+bounces-65330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C1CB08111
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 01:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE18E1C41259
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 23:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F374C28A40C;
	Wed, 16 Jul 2025 23:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XVGlcSC8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE022ECD38
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 23:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752709061; cv=none; b=bUsq2R8UTrv5u7bw/MOXaoIAbOky4QHAJsnplBtMQaTybYuVrxn7+kXaSOhe39T0fNuqtPcoiFn9a9uBXqHVL+GdQpOrajv1pM4fFq9Qr1CNvX8scOtS8X2sAJMWY9ecPrZlW+Ng5vnKkDjhv3uyWIXeMrJkKqmQl9NEWpPvk/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752709061; c=relaxed/simple;
	bh=WpABSt15VYBmSIsuff7Umh4J/QmdPh72gi4xsxrB4yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ED+Qdz8jDSmiq7gZ5o00q19Ou/yqHfaOxvgRW5UaXX7WdCiFsY5prakJ7JCwZnQJgIxgX5D2SGwHtNTv0PdnQUJ+WVhLCYqA8yTkAH+TwcTuY4il0SJyw+xYe+bgt3cH146EuM90xQ6BhYKaFr07tAq+eKC2tNcxji1dGHKILWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XVGlcSC8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so277007f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 16:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752709057; x=1753313857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MkVrpjQsu6SQZKU6P0JPlpED8WJm012CWi2gnkgVfxw=;
        b=XVGlcSC8+YcDGmZwNS/lNI7sX+7xwDHI9G8M85U9argr80Ym89IgcrQjUv6RTDjT9a
         mUXJ0wyv42guU1ftiuxfH6NrmBMSJUXLhCbiY40F+Zl3bxJLHH0OKxJPfGoitS4rm88v
         qb2Guo6r3WXFndvMFDhWeBtlDHxuoK5t/+jXiO3fCu+19f+oA2SzYn0XHLEb3Z+0iw03
         aj1DAF3uGbaAL7jZdjWYval/CR4Xwg+rrARiek+hKNN7XZCqO4hAQNU74GShXi8u24km
         +x8gTYji0gsuBTJJjC4lKusF5iLrB88kFoVHWXMk1UEWE3MvJStzPy8D1zRdwRGHDvMw
         2rtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752709057; x=1753313857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MkVrpjQsu6SQZKU6P0JPlpED8WJm012CWi2gnkgVfxw=;
        b=A18UMeovSL4PUEVCj/wIdUJJAWmetbVQns5kfJC+dc2kLIyDjKKrE+IyRpSBtkt7WF
         CdK0PIJ6iQlRjf0FxafSEr7TCL+XeUukMmEHK0V1/y3EiS9b2KM41n0vqDDRewC/akB9
         sfCWV4e24xccAPIqcVRylcrmrzdVrVFQNt7tcKgQgnDdX70PGkY/9lUYX9BEAGyUNen3
         OGbJJ6mbFSW6lTOBzM6qt6FqD0JUB2iDyffMYkjUVWaa9FNz+e6A4lfRPEWxVobvNhUn
         6phqMR6uFkyet25QWSduivGdcgGo8gApJa9VJKh0QN2ihYLaRXeAM2lYU1LKjxj5DVyr
         CKBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9WuGrrvLIilkjoqR+4moCXZcFG1NJLvWiQuJ1aFfuJEdvq1gbqbFql1Gglcdk2ozj4DbZWlD3UuKD6A2X@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+WJbFYRRAIjfmIIWkjM5US1ViEb5xsH8PTp8QeKQUG0bzJraP
	uUZeigHwtkpLKhtW7YKG4Tf406nCslBBZhdcl5WDdSRn0NLMS5p55i1kFAnOpg8HEJg=
X-Gm-Gg: ASbGncsInVcna4LTFHtERV1uKyuXte9mEESzCVOeP6B9FRcH/+tkoPCvHfTCStNpv0P
	QyWPal7HbQR/98jCv95efO6u9VImUUtoBWwFYaXXe958nZ6/GGBtadB9D1T0I0oNw2z1XeOVFIa
	P04R6BBQ1SpIADb/subbbc3lL5SjuVa6qZf3aRMXlDSFmRcy/yOwp/9iOl9O+wUd0fDDUstq6Y0
	SDeVhKDJq/TyvRa9TQ0Fi5EKr7F7wgLHawJ5DzMTT+LxJ+AwFzUVAz74UZND3qJyOucasoWF6YZ
	+YTIRSXnwAtT6CbCgCBjLiFx3lP6PO/0N7+ywECzaI66vveNyFiC5gPOJ7deFe8kS2CoCRxmDuT
	65KxGWnzYl2cFPhWqAvL0JXJkqpSMCttkAY9ESig9Aubm2R2f9XYs11TMTKXcYQ5X
X-Google-Smtp-Source: AGHT+IHusujmtjUiY52a7CfTC1mRpslqjEC78tkpMqFmDjbDwZw5k3q75QNQDldzDZxCc6pigrDfPg==
X-Received: by 2002:a5d:5d85:0:b0:3a5:39a8:199c with SMTP id ffacd0b85a97d-3b60dd88792mr3935926f8f.53.1752709057010;
        Wed, 16 Jul 2025 16:37:37 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc3a62sm18956620f8f.40.2025.07.16.16.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 16:37:35 -0700 (PDT)
Message-ID: <2fd0d1a7-70ee-43ac-af84-d2321c40e8f8@linaro.org>
Date: Thu, 17 Jul 2025 00:37:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] media: venus: Conditionally register codec nodes
 based on firmware version
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, mchehab@kernel.org, andersson@kernel.org,
 conor+dt@kernel.org, amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-3-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250715204749.2189875-3-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
> The encoding and decoding capabilities of a VPU can vary depending on the
> firmware version in use.
> 
> This commit adds support for platforms with OF_DYNAMIC enabled to
> conditionally skip the creation of codec device nodes at runtime if the
> loaded firmware does not support the corresponding functionality.
> 
> Note that the driver becomes aware of the firmware version only after the
> HFI layer has been initialized.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 76 +++++++++++++++---------
>   drivers/media/platform/qcom/venus/core.h |  8 +++
>   2 files changed, 57 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 4c049c694d9c..b7d6745b6124 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -28,6 +28,15 @@
>   #include "pm_helpers.h"
>   #include "hfi_venus_io.h"
>   
> +static inline bool venus_fw_supports_codec(struct venus_core *core,
> +					   const struct venus_min_fw *ver)
> +{
> +	if (!ver)
> +		return true;
> +
> +	return is_fw_rev_or_newer(core, ver->major, ver->minor, ver->rev);
> +}
> +
>   static void venus_coredump(struct venus_core *core)
>   {
>   	struct device *dev;
> @@ -103,7 +112,9 @@ static void venus_sys_error_handler(struct work_struct *work)
>   	core->state = CORE_UNINIT;
>   
>   	for (i = 0; i < max_attempts; i++) {
> -		if (!pm_runtime_active(core->dev_dec) && !pm_runtime_active(core->dev_enc))
> +		/* Not both nodes might be available */

"Neither node available" the latter for preference.

> +		if ((!core->dev_dec || !pm_runtime_active(core->dev_dec)) &&
> +		    (!core->dev_enc || !pm_runtime_active(core->dev_enc)))

Is this change about registration or is it a fix trying to sneak in 
under the radar ?

>   			break;
>   		msleep(10);
>   	}
> @@ -202,7 +213,8 @@ static u32 to_v4l2_codec_type(u32 codec)
>   	}
>   }
>   
> -static int venus_enumerate_codecs(struct venus_core *core, u32 type)
> +static int venus_enumerate_codecs(struct venus_core *core, u32 type,
> +				  const struct venus_min_fw *ver)
>   {
>   	const struct hfi_inst_ops dummy_ops = {};
>   	struct venus_inst *inst;
> @@ -213,6 +225,9 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
>   	if (core->res->hfi_version != HFI_VERSION_1XX)
>   		return 0;
>   
> +	if (!venus_fw_supports_codec(core, ver))
> +		return 0;
Its not really a codec you're checking there, its a version.

The name should reflect that.

> +
>   	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
>   	if (!inst)
>   		return -ENOMEM;
> @@ -288,14 +303,14 @@ static irqreturn_t venus_isr_thread(int irq, void *dev_id)
>   
>   #if defined(CONFIG_OF_DYNAMIC)
>   static int venus_add_video_core(struct venus_core *core, const char *node_name,
> -				const char *compat)
> +				const char *compat, const struct venus_min_fw *ver)
>   {
>   	struct of_changeset *ocs = core->ocs;
>   	struct device *dev = core->dev;
>   	struct device_node *np, *enp;
>   	int ret;
>   
> -	if (!node_name)
> +	if (!node_name || !venus_fw_supports_codec(core, ver))
>   		return 0;
>   
>   	enp = of_find_node_by_name(dev->of_node, node_name);
> @@ -330,11 +345,13 @@ static int venus_add_dynamic_nodes(struct venus_core *core)
>   
>   	of_changeset_init(core->ocs);
>   
> -	ret = venus_add_video_core(core, core->res->dec_nodename, "venus-decoder");
> +	ret = venus_add_video_core(core, core->res->dec_nodename, "venus-decoder",
> +				   core->res->dec_minfw);
>   	if (ret)
>   		goto err;
>   
> -	ret = venus_add_video_core(core, core->res->enc_nodename, "venus-encoder");
> +	ret = venus_add_video_core(core, core->res->enc_nodename, "venus-encoder",
> +				   core->res->enc_minfw);
>   	if (ret)
>   		goto err;
>   
> @@ -363,6 +380,9 @@ static void venus_remove_dynamic_nodes(struct venus_core *core)
>   #else
>   static int venus_add_dynamic_nodes(struct venus_core *core)
>   {
> +	WARN_ONCE(core->res->enc_minfw || core->res->dec_minfw,
> +		  "Feature not supported");
> +
>   	return 0;
>   }
>   
> @@ -432,7 +452,7 @@ static int venus_probe(struct platform_device *pdev)
>   					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>   					"venus", core);
>   	if (ret)
> -		goto err_core_put;
> +		goto err_hfi_destroy;
>   
>   	venus_assign_register_offsets(core);
>   
> @@ -448,19 +468,9 @@ static int venus_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		goto err_runtime_disable;
>   
> -	if (core->res->dec_nodename || core->res->enc_nodename) {
> -		ret = venus_add_dynamic_nodes(core);
> -		if (ret)
> -			goto err_runtime_disable;
> -	}
> -
> -	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> -	if (ret)
> -		goto err_remove_dynamic_nodes;
> -
>   	ret = venus_firmware_init(core);
>   	if (ret)
> -		goto err_of_depopulate;
> +		goto err_runtime_disable;
>   
>   	ret = venus_boot(core);
>   	if (ret)
> @@ -474,34 +484,46 @@ static int venus_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_venus_shutdown;
>   
> -	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
> +	if (core->res->dec_nodename || core->res->enc_nodename) {
> +		ret = venus_add_dynamic_nodes(core);
> +		if (ret)
> +			goto err_core_deinit;
> +	}
> +
> +	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
>   	if (ret)
> -		goto err_core_deinit;
> +		goto err_remove_dynamic_nodes;
> +
> +	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC,
> +				     core->res->dec_minfw);
> +	if (ret)
> +		goto err_of_depopulate;
>   
> -	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC);
> +	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC,
> +				     core->res->enc_minfw);
>   	if (ret)
> -		goto err_core_deinit;
> +		goto err_of_depopulate;
>   
>   	ret = pm_runtime_put_sync(dev);
>   	if (ret) {
>   		pm_runtime_get_noresume(dev);
> -		goto err_core_deinit;
> +		goto err_of_depopulate;
>   	}
>   
>   	venus_dbgfs_init(core);
>   
>   	return 0;
>   
> +err_of_depopulate:
> +	of_platform_depopulate(dev);
> +err_remove_dynamic_nodes:
> +	venus_remove_dynamic_nodes(core);
>   err_core_deinit:
>   	hfi_core_deinit(core, false);
>   err_venus_shutdown:
>   	venus_shutdown(core);
>   err_firmware_deinit:
>   	venus_firmware_deinit(core);
> -err_of_depopulate:
> -	of_platform_depopulate(dev);
> -err_remove_dynamic_nodes:
> -	venus_remove_dynamic_nodes(core);
>   err_runtime_disable:
>   	pm_runtime_put_noidle(dev);
>   	pm_runtime_disable(dev);
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 5b1ba1c69adb..3af8386b78be 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -50,6 +50,12 @@ struct bw_tbl {
>   	u32 peak_10bit;
>   };
>   
> +struct venus_min_fw {
> +	u32 major;
> +	u32 minor;
> +	u32 rev;
> +};

I'd call this venus_firmware_version

> +
>   enum vpu_version {
>   	VPU_VERSION_AR50,
>   	VPU_VERSION_AR50_LITE,
> @@ -92,6 +98,8 @@ struct venus_resources {
>   	u32 cp_nonpixel_start;
>   	u32 cp_nonpixel_size;
>   	const char *fwname;
> +	const struct venus_min_fw *enc_minfw;
> +	const struct venus_min_fw *dec_minfw;

and then I'd do as you have done here, indicate that the struct 
venus_firmware_version is a *enc_min_fw_ver;

>   	const char *enc_nodename;
>   	const char *dec_nodename;
>   };

