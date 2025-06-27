Return-Path: <linux-arm-msm+bounces-62854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 387DFAEBDF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 19:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A6F0563AF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0512EAB65;
	Fri, 27 Jun 2025 17:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CukjMR3S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68302EA727
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043685; cv=none; b=Owm9LrRzKWvW4MOfC7hejA52Vt5U7ysrFRfIhBkLZfTdatFD+9JuRdcUNHP/QGDnFM+hR5dSaEsV4Hktar+Bhr1Ha4CS2nYWUV/1QlZ+HUwZgFCDbweJWdfBU4qg95LMGHqDA43ZlE1NJSO1s1VKBEaZxX0XGwVkLokp8w79e0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043685; c=relaxed/simple;
	bh=lHbO0UGT1K01ZQwT9cq1DDJpCnVz2zT/PIhuDzJDkf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HC0Ixz1RqzYmGoaBMpclpwmyH8LnBlva7huduqdCKP49lYx3bUMigLM+2eRCA0zazhuB46mv2bZTVOC1t4zwhnB+Ibu8EIS5AH5/XH+ny34lzro3DMWqTC0OWtULXeQEvu+zZFVaerYscmkxeyuWCrfcPuWzhIYS8oZvbBO8RdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CukjMR3S; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-453643020bdso21604085e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751043682; x=1751648482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YpSie4wuvd5wd6ByN3oROE5g8OLzPqoz+ipBhoImJk=;
        b=CukjMR3SQS1jrKnXBHHbRB/qeYMYnEjJuZPu3Go6j6K5473CN8aZ1kVgfQow1wPUYh
         pwc2JN00wifpK7t+WEEiPufRuoiFQbYwGQkeGj+fhtO/rFwxcgnc+4OBJRTnFiXyXwfA
         OC+gVjTkkLk+acBmlFKgAFb1bfL/nMdJGN/bGHPlR3/qShNOs4ntEjpAVo46C7KGxzy8
         E7BB3HP0l0RKr/EjOI0+rBbIeejYch1ia2YUcgbMWUWUzLJTzj05ZisX3nXnc6mx2QtB
         15lmxJbhhYCMBWM2gImhWE/HIkgTMs50+JcVeSNHvdKYNdb6WL5uFZAg4uzj8JK+oYfr
         fItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751043682; x=1751648482;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YpSie4wuvd5wd6ByN3oROE5g8OLzPqoz+ipBhoImJk=;
        b=j/EXu8Ez78P1fkW3ddBmERxNAMmrWZ9ZC1d058ss++z+dfAD1SnzT8CgKH6qzS1sUT
         6rBUOVFK7iwE7krtsE2J2WskEMXAnDxqqQ3l6/t3jRHsfw6FoMH0Pq47pskf0TaUFljB
         o+r6m7RNxcOOFjX80SggMqldZeUHbXaeOnndisuowf93PdhZF/E7GAYco40i5wLYVdrn
         AX3iGqGoMkYswP30PzQevOfNrngMInIjEvRiHOrf+QdNrSw/EBBe57IiYrknF5p5ggbI
         S90C4Ad/gP6QKfX3yuMOEZK9Gpf78MIosdQwRT3+Vakl3H+jUzkCs26sgPrgEJYZwod8
         P4MA==
X-Forwarded-Encrypted: i=1; AJvYcCVHznIBmxT3wTRiqaM3SXa+jRt3GoAD8zn/sxjcXM5OQaf8kc5m3/1pA8yGwUm9F5N/TDSy2DGmDb6piLTh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Ai3ZRwm9gCAvzJujVyawMt6UrNDsLUc4NWCIRJQOCX/NmQEi
	AMl+82aMk8+kWK5tBV2IofRZ67ZXwJvuEbwBSN2ivSkr5CxmeeH4pTwF5D9S6W+xzJw=
X-Gm-Gg: ASbGncv8bcrfpgHVoRnGybs64WCEyzGarXJNe2yKoTqDE//ms50j9MDHrlI8ltz5+yp
	73lClwXqsXoqvL4UvIBeOu0y0TfatDjUN7znDQ1bTUbblzUvXSiRv8VtXIwqaH84CahPEkDF2MW
	2LTycECU7CRtQBWhvq294P59bygB4z1gYrzbIDWgADRvDVsvykB/mhqwJsFiHS23W541sY2WK4b
	SKwzN9LNf0mbkiziProhpvjjSWcfcLy4uZtqGCeNi+t1L46wRHnrYqh2ofmMV9RNPrjocTnwY/H
	3qXY6e4ZjBkc4Bei9a7soGz5FIVilXf5QsZlPth8PgXg7ZQ6ALu4SzfxVKo5c/XVGahRTXf1q5A
	lou8nzlYdczuH8Lko/KpVBfKdtLW/S+TpKdmAwQ==
X-Google-Smtp-Source: AGHT+IGJE/lVWrUbPn9cVPurqMto/Wq/31An/pK5gHn7R5YbeaOLrBXTzFVGUl2kOUkfpHa5GTpd2A==
X-Received: by 2002:a05:600c:35c2:b0:441:ac58:ead5 with SMTP id 5b1f17b1804b1-4538ee96560mr49860365e9.31.1751043681643;
        Fri, 27 Jun 2025 10:01:21 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f923sm3090516f8f.89.2025.06.27.10.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 10:01:21 -0700 (PDT)
Message-ID: <0bcabd65-e9d1-40dc-ad84-87ed53b44755@linaro.org>
Date: Fri, 27 Jun 2025 18:01:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] media: iris: register and configure non-pixel node
 as platform device
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-2-51e18c0ffbce@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250627-video_cb-v3-2-51e18c0ffbce@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 16:48, Vikash Garodia wrote:
> Register "non_pixel" child node as a platform device, and configure its
> DMA via of_dma_configure(). This ensures proper IOMMU attachment and DMA
> setup for the "non_pixel" device.
> All non pixel memory, i.e bitstream buffers, HFI queues and internal
> buffers related to bitstream processing, would be managed by non_pixel
> device.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
>   drivers/media/platform/qcom/iris/iris_probe.c | 50 ++++++++++++++++++++++++++-
>   2 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index aeeac32a1f6d9a9fa7027e8e3db4d95f021c552e..757efd16870876bd2b1d5b1e4103b2d2326b5f49 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -65,6 +65,7 @@ struct icc_info {
>    * @sys_error_handler: a delayed work for handling system fatal error
>    * @instances: a list_head of all instances
>    * @inst_fw_caps: an array of supported instance capabilities
> + * @np_dev: device to represent non pixel node
>    */
>   
>   struct iris_core {
> @@ -105,6 +106,7 @@ struct iris_core {
>   	struct delayed_work			sys_error_handler;
>   	struct list_head			instances;
>   	struct platform_inst_fw_cap		inst_fw_caps[INST_FW_CAP_MAX];
> +	struct device				*np_dev;
>   };
>   
>   int iris_core_init(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 9a7ce142f7007ffcda0bd422c1983f2374bb0d92..8fe87e30bd40f3c67ec41305c7d73520fbc9db7b 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -6,6 +6,8 @@
>   #include <linux/clk.h>
>   #include <linux/interconnect.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>   #include <linux/pm_domain.h>
>   #include <linux/pm_opp.h>
>   #include <linux/pm_runtime.h>
> @@ -127,6 +129,46 @@ static int iris_init_resets(struct iris_core *core)
>   				     core->iris_platform_data->controller_rst_tbl_size);
>   }
>   
> +static int iris_init_non_pixel_node(struct iris_core *core)
> +{
> +	struct platform_device_info info;
> +	struct platform_device *pdev;
> +	struct device_node *np_node;
> +	int ret;
> +
> +	np_node = of_get_child_by_name(core->dev->of_node, "non_pixel");
> +	if (!np_node)
> +		return 0;
> +
> +	memset(&info, 0, sizeof(info));
> +	info.fwnode = &np_node->fwnode;
> +	info.parent = core->dev;
> +	info.name = np_node->name;
> +	info.dma_mask = DMA_BIT_MASK(32);
> +
> +	pdev = platform_device_register_full(&info);
> +	if (IS_ERR(pdev)) {
> +		of_node_put(np_node);
> +		return PTR_ERR(pdev);
> +	}
> +	pdev->dev.of_node = np_node;
> +
> +	ret = of_dma_configure(&pdev->dev, np_node, true);
> +	if (ret)
> +		goto err_unregister;
> +
> +	core->np_dev = &pdev->dev;
> +
> +	of_node_put(np_node);
> +
> +	return 0;
> +
> +err_unregister:
> +	platform_device_unregister(pdev);
> +	of_node_put(np_node);
> +	return ret;
> +}
> +
>   static int iris_init_resources(struct iris_core *core)
>   {
>   	int ret;
> @@ -143,7 +185,11 @@ static int iris_init_resources(struct iris_core *core)
>   	if (ret)
>   		return ret;
>   
> -	return iris_init_resets(core);
> +	ret = iris_init_resets(core);
> +	if (ret)
> +		return ret;
> +
> +	return iris_init_non_pixel_node(core);
>   }
>   
>   static int iris_register_video_device(struct iris_core *core)
> @@ -188,6 +234,8 @@ static void iris_remove(struct platform_device *pdev)
>   
>   	iris_core_deinit(core);
>   
> +	platform_device_unregister(to_platform_device(core->np_dev));
> +
>   	video_unregister_device(core->vdev_dec);
>   
>   	v4l2_device_unregister(&core->v4l2_dev);
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

