Return-Path: <linux-arm-msm+bounces-30746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 800D596C130
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 16:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 002A91F28D32
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 14:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D501DC063;
	Wed,  4 Sep 2024 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y/yCaA1w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6B41DA2F1
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461411; cv=none; b=AKkuhdVSGC3LyEb6LM2AW/Gm+7HZJclT7XeqOPxRttwt8oN6Jr5fL7lrIa0y9YYs9N06hoAZPYSC8Yk69ZrkYnGNkIAYfIKCvL6ioBmZ27hFphq5l7rKWzI0USoHDRQPqoNR6OiCOMokPHrrV4lcVxnISes1nfLjggjOoOQPd5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461411; c=relaxed/simple;
	bh=qb6bCQ8wAPBmq4y6EORzfthz4F+iD+dv0iaVEqMa1Rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Py+pMD2R/gbiXtOXdMLnxSR4HH7SV5JjyS3SiUWk1ZSxqMc7UFKCrwLQUfCpf3LC0klVHeAJnHj1NIHdW0BoXtTNN2zgGBpz8ODFQt/PW6IG3G7fgY1OXGVL44pwWiLSjp2J1n+dL/CgYZP2/y9CqnnwNxep07Pyg/D6aNmH49U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y/yCaA1w; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a86859e2fc0so761284166b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725461407; x=1726066207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcjFuQ1QEBKXphtaS5nfelxe1o3VzP7a8HZPAOwOmrc=;
        b=Y/yCaA1w9a7j4lee1BVwbTiJ9hKmeW3STnVkBoQIfUD9oJI8CzItaSwkrNcDaTQxfr
         4ZemDW/5U06VszCbe8b/a4nTt47kszDCvB3L6fbMTQKfnyt1ELwAa8OCuM1AUNxoTRpU
         /4i2M04vM/0gHsWN0XYyIApMGpWvAOyQ+G9UE2EhqT8bvnaBaatfb9HJHm6xlQc1X9z8
         1MK82QlrnDMiNjy7PzRaIjM/qdJ5Lg+hw7v/8hEusK1O6XkKYKZuDR5l0/sFrQOKfsDU
         WU6NZNBL2VC2hT8F1KfZJDkFRydoiIcO0YOJEJXT6rJrfuBCz4nSmb2tUhFvYnBKHxWc
         irYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461407; x=1726066207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcjFuQ1QEBKXphtaS5nfelxe1o3VzP7a8HZPAOwOmrc=;
        b=rFJI5Pqc7BtJWgCCpVs3vKN4PRBliyNOftimfFnGe7h1YEbsUZ8JncHTi8NPCOHoSN
         aWrjjsm5J2DQLKokwBjHNzQ9Gpflj4QmQidSzEJCpmz3JWrCtOGZAyTV1/NXJ/yN6DQ0
         xNbajmHEypqd3HHLGn5CoagILMSsueXAznaFjD+hYuMskshJZUkGR74wFyytYJQowp39
         BWhXfhKDaURgPikIPR9C5hNQGx8Qhe2VcmY/6HGHNBzZtEMEO5Lll0CcKv53N+kVfC/Q
         caU6muXQADwtf9rWdVwLgYTgLaOCLk7muWyLKSPhJZhBFmJHdSWgFtd2+ikLvisCWZv9
         4WhA==
X-Gm-Message-State: AOJu0Yzko9uhP91fA2B2vTMlFqhq49vH0pKO8bPDH8O3pY0mAgzCGDx/
	a8R1Qh3+KO2zvpNFw+SB/idKHNYSdwO43djT+Vhv27iVcIn+K95at2hbRfhDEUc=
X-Google-Smtp-Source: AGHT+IFD6e2sBTQ7YLZkoGg9Y75jHEQCKVUG2WlUqQ66ORREB05uClSZs2uAJIbigWpd0npPHOHAxw==
X-Received: by 2002:a17:907:3ea2:b0:a86:672d:8436 with SMTP id a640c23a62f3a-a8a32fe15e6mr335714766b.59.1725461407337;
        Wed, 04 Sep 2024 07:50:07 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a62048f5fsm1853566b.88.2024.09.04.07.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 07:50:06 -0700 (PDT)
Message-ID: <a010743e-0018-4b6a-adeb-c6f3203f1e67@linaro.org>
Date: Wed, 4 Sep 2024 15:50:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] media: qcom: camss: Add camss_link_entities_v2
To: Vikram Sharma <quic_vikramsa@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 cros-qcom-dts-watchers@chromium.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
 <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-6-b18ddcd7d9df@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-6-b18ddcd7d9df@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2024 12:10, Vikram Sharma wrote:
> Add camss_link_entities_v2, derived from the camss_link_entities
> function, to handle linking for targets without ISPIF.
> 
> camss_link_entities -> Targets with ispif.
> camss_link_entities_v2 -> Targets without ispif.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 53 ++++++++++++++++++++++++++++++-
>   1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 5e7235001239..516434686a27 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2154,6 +2154,57 @@ static int camss_init_subdevices(struct camss *camss)
>   	return 0;
>   }
>   
> +/*
> + * camss_link_entities_v2 - Register subdev nodes and create links
> + * @camss: CAMSS device
> + *
> + * Return 0 on success or a negative error code on failure
> + */
> +static int camss_link_entities_v2(struct camss *camss)
> +{
> +	int i, j;
> +	int ret;
> +
> +	for (i = 0; i < camss->res->csiphy_num; i++) {
> +		for (j = 0; j < camss->res->csid_num; j++) {
> +			ret = media_create_pad_link(&camss->csiphy[i].subdev.entity,
> +						    MSM_CSIPHY_PAD_SRC,
> +						    &camss->csid[j].subdev.entity,
> +						    MSM_CSID_PAD_SINK,
> +						    0);
> +			if (ret < 0) {
> +				dev_err(camss->dev,
> +					"Failed to link %s->%s entities: %d\n",
> +					camss->csiphy[i].subdev.entity.name,
> +					camss->csid[j].subdev.entity.name,
> +					ret);
> +				return ret;
> +			}
> +		}
> +	}

Please reduce the above loop down into a common call that both 
camss_link_entities_ispif()[1] and camss_link_entities() can call.

Because => functional decomposition and code reuse instead of code 
replication.

> +	for (i = 0; i < camss->res->csid_num; i++)
> +		for (j = 0; j < camss->vfe[i].res->line_num; j++) {
> +			struct v4l2_subdev *csid = &camss->csid[i].subdev;
> +			struct v4l2_subdev *vfe = &camss->vfe[i].line[j].subdev;
> +
> +			ret = media_create_pad_link(&csid->entity,
> +						    MSM_CSID_PAD_FIRST_SRC + j,
> +						    &vfe->entity,
> +						    MSM_VFE_PAD_SINK,
> +						    0);
> +			if (ret < 0) {
> +				dev_err(camss->dev,
> +					"Failed to link %s->%s entities: %d\n",
> +					csid->entity.name,
> +					vfe->entity.name,
> +					ret);
> +				return ret;
> +			}
> +		}
> +	return 0;
> +}

Having a tidy function for every non ispif SoC seems like nice code, 
approve.

However the corollary is the ispif version of the code should then drop the

if (camss->ispif) {
     //do stuff
} else {
     // do other stuff
}

i.e. your function pointer now determines if ispif is true so you can 
drop the dead code on the else path in camss_link_entities_ispif()

> +
>   /*
>    * camss_link_entities - Register subdev nodes and create links
>    * @camss: CAMSS device
> @@ -2769,7 +2820,7 @@ static const struct camss_resources sc8280xp_resources = {
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_sc8280xp),
>   	.csid_num = ARRAY_SIZE(csid_res_sc8280xp),
>   	.vfe_num = ARRAY_SIZE(vfe_res_sc8280xp),
> -	.link_entities = camss_link_entities
> +	.link_entities = camss_link_entities_v2
>   };
>   
>   static const struct camss_resources sc7280_resources = {
> 

This change isn't correct.

There are six upstream camss entires

grep camss arch/arm64/boot/dts/qcom/*.dtsi  | grep compat | wc -l
6

Only three of which have ispif

grep -m1 "ispif" arch/arm64/boot/dts/qcom/*.dtsi  | wc -l
3

=> You've missed 2/3 of the SoCs the change should apply to - 845 and 8250.

[1] I also think the legacy function should be called 
camss_link_entities_ispif() with the default being camss_link_entities();

1. Please change the name of the existing function to
    camss_link_entities_ispif() to reflect its function and dependency.
2. Functionally decompose the top part of the loop into some common
    method that both camss_link_entities_ispif() and
    camss_link_entities() can call.
    Because functionally decomposed and reused code is better code.
3. You need to make sure you hook the right set of SoCs with the
    default and legacy versions of the function
    -> msm8916/msm8996/sdm630 .link_entites = camss_link_entities_ispif()
    -> sdm845/sc7280/sc8280xp .link_entities = camss_link_entities()

---
bod

