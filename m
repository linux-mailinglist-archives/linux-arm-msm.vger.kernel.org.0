Return-Path: <linux-arm-msm+bounces-19800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E576C8C44AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 17:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13E4B1C2133A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 15:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F08015532B;
	Mon, 13 May 2024 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OR8gSALN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF337155323
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2024 15:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715615922; cv=none; b=O33wKL9D3vb9EXqaLWJMkxL/uYAb2EXVBA2RdRXZT3dHL6NOSGWCPf962YsPcNF0ChDG8tezhMRq26SaUXXfuZGwudCbctrcQvzE/Fvgr/lqtQmLK2m+wULtA9vL6EfR0BS1njQtGn65h2hneLslyPGK1JpBZXhuADxOXWjhLLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715615922; c=relaxed/simple;
	bh=CdOD1G+FzfDDGS299FbWX6XS1Yj9LkhVx1wSI9hm5kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbP91okTPeHP7tVNSB7ouaafV4NQPlcMxTc8S7+tp4IQ3EfzeWDKfdFL2zsNpmWy2uyZkFlkIsBRr7XY9aZ9a8M7kacb4sW1mB0BOFwzyhYDK1yEVIcrfWMEf6KSj+wQUDRtSSz50QgWN1PaXxRUFDG1j50teTttNI6hiFsMkaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OR8gSALN; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a59a0d10e12so116058866b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2024 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715615918; x=1716220718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w5xwyXsMcEAqRQV7MwV0fzEq0BmcG1UxFonWIXrER1Y=;
        b=OR8gSALNDugQT363ubZ9AvYP57lUV2Wdi+4mxQeZWDKQje4xqjZwlT2248BIrCLgN4
         vFUG6J4e7dhUy0DGHr8+Y085dDMJB+6jxtsq1cxAPTUHyorzCosnHJLOqRfDk4di3d5t
         +NwYuiKDa0gWbfUv3Qbb6XaB4Djk3/+UG4Te6Kiwzz/XzTjEDqiNAgh+AVDfv0nNCBKe
         W9VYgpGu8wznRutotaqboh81Kvho9LDJDeWXDfDziP43Sp5oZAlKzh+jJrHhgFNxY9UJ
         glYcdbodHaKKxxe23K09LB+5p1AcQIwefCqRhZsG+8uF3m8upVQ/R9PHaCF8B1TFDGet
         sLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715615918; x=1716220718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w5xwyXsMcEAqRQV7MwV0fzEq0BmcG1UxFonWIXrER1Y=;
        b=WzoyrCUbPuMwPHI9AzDXcC/xzQxdykRgDTajlfX57zdi4H6gYnnXx0Dw0Xc3wjdJR9
         fNTpDV9lLM0pRCgA6qkqMXjB4vc56mJFq4MMBK/GBTvIrM3gjpZz7ltwB+6w+FDxFtTZ
         ceksOL6V0u1z9hKPqNT/oA1adiqu7QFaf5xPocYx9620xKH1CdXD+YnmRoLncRp1rpO2
         dFvkeKKbqoii9pOZhY3ijUMKlVgOZZ9ZC+hynPDTMsHQXfnO47Qmbi4+Z5EAXg3+2TJl
         LCv+xwBF75Quq5LnLed2pYuVnahscmYdgy+UVonrb+UL0VBSF6Whuhlcjo+NxzFdYXr8
         Ra8g==
X-Forwarded-Encrypted: i=1; AJvYcCX04faxa/mdVcaot5OB86INbYkhUPa5KKk3IOmNeclmEcinmqo69c1jB11DZcK+2v/Sie24YuxPwBpvLJ5VPb4pHBScZbT95QlucxLTKQ==
X-Gm-Message-State: AOJu0Yxm+zUoHl5dnYJeACR3Tg/2Yeinfnv3W8WQgKfIDFnoM4uHOEEj
	XjlpfMA8uqGfj6LjbB8gMUiqqpedXncqhDO18H1J1lUcqsdm1UfKvuObS/6OjLM=
X-Google-Smtp-Source: AGHT+IHzO2elxnDvfmK+9BLynuXl9ayKOJeKIxDeKqr4qlyDpjL2tcYqzf36kEL0SsDBmw6e46LxTg==
X-Received: by 2002:a17:906:e8a:b0:a5a:7a1:5da5 with SMTP id a640c23a62f3a-a5a2d615f8bmr657578266b.4.1715615917891;
        Mon, 13 May 2024 08:58:37 -0700 (PDT)
Received: from [10.91.0.142] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b0145csm611133666b.158.2024.05.13.08.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 08:58:37 -0700 (PDT)
Message-ID: <adbd0eeb-62c0-46a3-9cbb-92f6fde6c152@linaro.org>
Date: Mon, 13 May 2024 18:58:36 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] media: qcom: camss: Decouple VFE from CSID
Content-Language: en-US
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-9-quic_grosikop@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240411124543.199-9-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/24 15:45, Gjorgji Rosikopulos wrote:
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
> 
> Decouple the direct calls to VFE's vfe_get/put in the CSID subdev
> in order to prepare for the introduction of IFE subdev.
> 
> Also decouple CSID base address from VFE since on the Titan platform
> CSID register base address resides within VFE's base address.
> 
> Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---
>   .../media/platform/qcom/camss/camss-csid.c    | 16 +++--
>   .../media/platform/qcom/camss/camss-csid.h    |  1 +
>   drivers/media/platform/qcom/camss/camss.c     | 69 +++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |  8 +++
>   4 files changed, 89 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 5b23f5b8746d..858db5d4ca75 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -602,7 +602,6 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>   	struct csid_device *csid = v4l2_get_subdevdata(sd);
>   	struct camss *camss = csid->camss;
>   	struct device *dev = camss->dev;
> -	struct vfe_device *vfe = &camss->vfe[csid->id];
>   	int ret = 0;
>   
>   	if (on) {
> @@ -611,7 +610,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>   		 * switching on the CSID. Do so unconditionally, as there is no
>   		 * drawback in following the same powering order on older SoCs.
>   		 */
> -		ret = vfe_get(vfe);
> +		ret = csid->res->parent_dev_ops->get(camss, csid->id);
>   		if (ret < 0)
>   			return ret;
>   
> @@ -663,7 +662,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>   		regulator_bulk_disable(csid->num_supplies,
>   				       csid->supplies);
>   		pm_runtime_put_sync(dev);
> -		vfe_put(vfe);
> +		csid->res->parent_dev_ops->put(camss, csid->id);
>   	}
>   
>   	return ret;
> @@ -1021,6 +1020,11 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>   	csid->id = id;
>   	csid->res = &res->csid;
>   
> +	if (dev_WARN_ONCE(dev, !csid->res->parent_dev_ops,

Please remove/replace dev_WARN_ONCE() to a lesser dev_warn_once(), wherever it's
possible please do not use/introduce WARN() type of writes to the kernel log buffer...

> +			  "Error: CSID depends on VFE/IFE device ops!\n")) {
> +		return -EINVAL;
> +	}
> +
>   	csid->res->hw_ops->subdev_init(csid);
>   
>   	/* Memory */
> @@ -1031,9 +1035,11 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>   		 * VFE to be initialized before CSID
>   		 */
>   		if (id >= 2) /* VFE/CSID lite */
> -			csid->base = camss->vfe[id].base + VFE_480_LITE_CSID_OFFSET;
> +			csid->base = csid->res->parent_dev_ops->get_base_address(camss, id)
> +				+ VFE_480_LITE_CSID_OFFSET;
>   		else
> -			csid->base = camss->vfe[id].base + VFE_480_CSID_OFFSET;
> +			csid->base = csid->res->parent_dev_ops->get_base_address(camss, id)
> +				 + VFE_480_CSID_OFFSET;
>   	} else {
>   		csid->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
>   		if (IS_ERR(csid->base))
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 0e385d17c250..8cdae98e4dca 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -157,6 +157,7 @@ struct csid_hw_ops {
>   struct csid_subdev_resources {
>   	bool is_lite;
>   	const struct csid_hw_ops *hw_ops;
> +	const struct parent_dev_ops *parent_dev_ops;
>   	const struct csid_formats *formats;
>   };
>   
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 37060eaa0ba5..4d625ef59cf7 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -32,6 +32,8 @@
>   #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
>   #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
>   
> +static const struct parent_dev_ops vfe_parent_dev_ops;
> +
>   static const struct camss_subdev_resources csiphy_res_8x16[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -87,6 +89,7 @@ static const struct camss_subdev_resources csid_res_8x16[] = {
>   		.type = CAMSS_SUBDEV_TYPE_CSID,
>   		.csid = {
>   			.hw_ops = &csid_ops_4_1,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_4_1
>   		}
>   	},
> @@ -109,6 +112,7 @@ static const struct camss_subdev_resources csid_res_8x16[] = {
>   		.type = CAMSS_SUBDEV_TYPE_CSID,
>   		.csid = {
>   			.hw_ops = &csid_ops_4_1,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_4_1
>   		}
>   	},
> @@ -226,6 +230,7 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
>   		.type = CAMSS_SUBDEV_TYPE_CSID,
>   		.csid = {
>   			.hw_ops = &csid_ops_4_7,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_4_7
>   		}
>   	},
> @@ -248,6 +253,7 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
>   		.type = CAMSS_SUBDEV_TYPE_CSID,
>   		.csid = {
>   			.hw_ops = &csid_ops_4_7,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_4_7
>   		}
>   	},
> @@ -270,6 +276,7 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
>   		.type = CAMSS_SUBDEV_TYPE_CSID,
>   		.csid = {
>   			.hw_ops = &csid_ops_4_7,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_4_7
>   		}
>   	},
> @@ -292,6 +299,7 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
>   		.type = CAMSS_SUBDEV_TYPE_CSID,
>   		.csid = {
>   			.hw_ops = &csid_ops_4_7,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_4_7
>   		}
>   	}
> @@ -445,6 +453,7 @@ static const struct camss_subdev_resources csid_res_660[] = {
>   		.type = CAMSS_SUBDEV_TYPE_CSID,
>   		.csid = {
>   			.hw_ops = &csid_ops_4_7,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_4_7
>   		}
>   	},
> @@ -470,6 +479,7 @@ static const struct camss_subdev_resources csid_res_660[] = {
>   		.type = CAMSS_SUBDEV_TYPE_CSID,
>   		.csid = {
>   			.hw_ops = &csid_ops_4_7,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_4_7
>   		}
>   	},
> @@ -495,6 +505,7 @@ static const struct camss_subdev_resources csid_res_660[] = {
>   		.type = CAMSS_SUBDEV_TYPE_CSID,
>   		.csid = {
>   			.hw_ops = &csid_ops_4_7,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_4_7
>   		}
>   	},
> @@ -520,6 +531,7 @@ static const struct camss_subdev_resources csid_res_660[] = {
>   		.type = CAMSS_SUBDEV_TYPE_CSID,
>   		.csid = {
>   			.hw_ops = &csid_ops_4_7,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_4_7
>   		}
>   	}
> @@ -714,6 +726,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
>   		.type = CAMSS_SUBDEV_TYPE_CSID,
>   		.csid = {
>   			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -739,6 +752,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
>   		.type = CAMSS_SUBDEV_TYPE_CSID,
>   		.csid = {
>   			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -765,6 +779,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
>   		.csid = {
>   			.is_lite = true,
>   			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
>   		}
>   	}
> @@ -957,6 +972,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
>   		.type = CAMSS_SUBDEV_TYPE_CSID,
>   		.csid = {
>   			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -974,6 +990,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
>   		.type = CAMSS_SUBDEV_TYPE_CSID,
>   		.csid = {
>   			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -991,6 +1008,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
>   		.csid = {
>   			.is_lite = true,
>   			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -1008,6 +1026,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
>   		.csid = {
>   			.is_lite = true,
>   			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
>   		}
>   	}
> @@ -1212,6 +1231,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   		.interrupt = { "csid0" },
>   		.csid = {
>   			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -1227,6 +1247,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   		.interrupt = { "csid1" },
>   		.csid = {
>   			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -1242,6 +1263,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   		.interrupt = { "csid2" },
>   		.csid = {
>   			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -1257,6 +1279,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   		.interrupt = { "csid3" },
>   		.csid = {
>   			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -1272,6 +1295,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   		.csid = {
>   			.is_lite = true,
>   			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -1287,6 +1311,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   		.csid = {
>   			.is_lite = true,
>   			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -1302,6 +1327,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   		.csid = {
>   			.is_lite = true,
>   			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -1317,6 +1343,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   		.csid = {
>   			.is_lite = true,
>   			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
>   		}
>   	}
> @@ -1661,6 +1688,48 @@ void camss_pm_domain_off(struct camss *camss, int id)
>   	}
>   }
>   
> +static int vfe_parent_dev_ops_get(struct camss *camss, int id)
> +{
> +	int ret = -EINVAL;
> +
> +	if (id < camss->res->vfe_num) {


if (id >= camss->res->vfe_num)
     return -EINVAL;

> +		struct vfe_device *vfe = &camss->vfe[id];
> +
> +		ret = vfe_get(vfe);
> +	}
> +
> +	return ret;
> +}
> +
> +static int vfe_parent_dev_ops_put(struct camss *camss, int id)
> +{
> +	if (id < camss->res->vfe_num) {
> +		struct vfe_device *vfe = &camss->vfe[id];
> +
> +		vfe_put(vfe);
> +	}
> +
> +	return 0;
> +}
> +
> +static void __iomem
> +*vfe_parent_dev_ops_get_base_address(struct camss *camss, int id)
> +{
> +	if (id < camss->res->vfe_num) {
> +		struct vfe_device *vfe = &camss->vfe[id];
> +
> +		return vfe->base;
> +	}
> +
> +	return NULL;

I can find code snippets above like

	if (IS_ERR(csid->base))
		...

So, is it really a good idea to return NULL on error? Probably it might be better
to return a reasonable error to the caller.

> +}
> +
> +static const struct parent_dev_ops vfe_parent_dev_ops = {
> +	.get = vfe_parent_dev_ops_get,
> +	.put = vfe_parent_dev_ops_put,
> +	.get_base_address = vfe_parent_dev_ops_get_base_address
> +};
> +
>   /*
>    * camss_of_parse_endpoint_node - Parse port endpoint node
>    * @dev: Device
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index a5be9e872992..b3c967bcf8a9 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -143,6 +143,12 @@ struct camss_clock {
>   	u32 nfreqs;
>   };
>   
> +struct parent_dev_ops {
> +	int (*get)(struct camss *camss, int id);
> +	int (*put)(struct camss *camss, int id);
> +	void __iomem *(*get_base_address)(struct camss *camss, int id);
> +};
> +
>   void camss_add_clock_margin(u64 *rate);
>   int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>   			struct device *dev);
> @@ -153,6 +159,8 @@ s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>   int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
>   int camss_pm_domain_on(struct camss *camss, int id);
>   void camss_pm_domain_off(struct camss *camss, int id);
> +int camss_vfe_get(struct camss *camss, int id);
> +void camss_vfe_put(struct camss *camss, int id);
>   void camss_delete(struct camss *camss);
>   
>   #endif /* QC_MSM_CAMSS_H */

--
Best wishes,
Vladimir

