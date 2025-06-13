Return-Path: <linux-arm-msm+bounces-61204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 409E2AD8768
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 11:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 483F83B37BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 09:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EFB279DC5;
	Fri, 13 Jun 2025 09:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eX8sfjU0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71680279DBC
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806015; cv=none; b=bViGSicBC+ry54pC85iVN11bi645iCvhA01He8wWo9vu18Vcvvn15/1z/0y0SSMfLP+p06FkK6ICOq8/vQT73edsph2YxQqEiDurApj7LQNKZHdmOHogcdHmyKL0lD2Ow/8/dl2rL1mjsVkt06GdiLr+G+3WsKeu24qjbp7Rf8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806015; c=relaxed/simple;
	bh=0Y6jj9KLtJf7LDEPJ7LwBrYF5ykPWh73hsXHYb3N9m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDkaozyeRuRVOee6rj5jbGyHsvbMU5bEwQMlQD+WmsNIVpLQdZ6WmVhtcMHYyE5zq4rCvSq0j6W2Va5FnpxoX+ENA0VqhVtqOz844TYe49HbNOadyVcXToIN8I3UM8ciEnBpJs7ZqClsXecAiZpj5WKJMBQ2clGatmoDBb7pIog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eX8sfjU0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so1291905f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 02:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806012; x=1750410812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1aYNJkPV0aW25Kv1bxqP6lGz7djS3jyufH29SAsPd+Y=;
        b=eX8sfjU0OuJYBUc/YNoqshkt78VpSG345KRQ+Bnz7497qPvFCQaenijTi4oncKqPdZ
         /Kr5MrwCTrDbVoXPvuGQxcExbBfOr3DniCSQWDFeS3Fud2olx4BR3eK2VTnu+Xh1sdgh
         OJ3ixASS61vkFMdnqevoPoX5OTEeOkjivXXXZXukavdh4MzIebclNPmZsuy9t5hY/9G8
         NGBd/soSg3yucdoDTclgQfV6MgtNFKUBh4ACVwenFN0XXvez2Xxy0UETIeFBmEY+iZx7
         Ke5qFd7nDDzBT8pK6H0DuIzoK8RclJixvDoPU5YvKqO01liQc3l/v5nJv5ObQBqPe43i
         DT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806012; x=1750410812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1aYNJkPV0aW25Kv1bxqP6lGz7djS3jyufH29SAsPd+Y=;
        b=GB3XhnQqKEXSWBmQc8VX58+Qf1KLXvEFeRXLAqs/GDmoy5Y8FzCqtuE9euqEMu+PsB
         uLZSp5a/ewflO3v/kS8R3d8ysvkOq2v/O9IkWnssoO8CNslJ9ClV2OC9+E4rMbDwvHkq
         MsGAgs1bI/nDwtQKbJwTzlh+uVHJW/Tn2j1LHTHJ5nKp4VDrPXtt2U7JlCMNFBUOQJxS
         4cZINsph9CCINQ1Vla7ALSW8V7+TTguUWHZwvP0U1iX0A5v9ckRmSbLMVcW6uXpdPJag
         +HKLOlkap99rooFSjdIzBLjJgGRcSccTol/ua3T5YQFWUVDTdrRZRfEDb79E0mvcE4V3
         MmGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU+IREbtuG1Nv3ALYGtFnER7PLErsH63QZ4OwbXuG+i3+OWZqCPxsehEVXzZcX+ybzIyqkJt16n5Erp5HP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7SW47gtpWxdjNVrr4g0OdGV5xKuOrex2DtZl2qL6unco7n0VY
	mwBczM6j0Y/VM+U3bEHoIGMDJiZ8cl1O5pqfkwcFckevkQc1qEBJy4kmiSbjoQo3N5w=
X-Gm-Gg: ASbGncuIeX1gUk8Bf0STaCjsV6shjRHOjfcTjNQ/ftDOeE3ZifS+XSmCBl/afUUMYU2
	I6T3dfKuTD7TyWXMea1qkdcoXQ2bSoYP/28G06lEChtF8APnBrcN84nX5dTVTC2Ei+YlQafzHVC
	0q9nfK84QFuUwhwQtq9S8wD1yA8w5dB8dh8uF8Xi6FphUkvFa0noJ2IK6QFDACLAqvOMSSYug9C
	VGFYKpKaH5ocZzoElQ2dNWjQyYqHR3Ihy/puu2Vs5B0lqCJ2qRp8p+OPTBYl+csQPbR6dWJMaxC
	/lia+iVwBAuA5lQnWDqKUwKtoIIFu/367T4NJHEAtfn8y8r+JsRnzzK5LGQXJdl1oxvRM9yDb8u
	70npAnT24zdzNt0P4y+mdWczM6hc=
X-Google-Smtp-Source: AGHT+IGW47TYDwlkxZMyvu4lj634mjFRvgCqkvRaKt0YG2LrxM+RfM/AFmBv8OvJjzRO2nK2t9L3Xg==
X-Received: by 2002:a05:6000:2502:b0:3a4:f024:6717 with SMTP id ffacd0b85a97d-3a568730dc7mr2113321f8f.53.1749806011699;
        Fri, 13 Jun 2025 02:13:31 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b1bc97sm1745386f8f.68.2025.06.13.02.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:13:31 -0700 (PDT)
Message-ID: <a020c020-c28d-4f06-aea1-483f404ed715@linaro.org>
Date: Fri, 13 Jun 2025 10:13:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] media: qcom: camss: simplify
 camss_subdev_notifier_complete() function
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <gH5U5Np4YjvmdEnO8j2Pam7buBgsyZNrP4crrHHDSDkI_2jijUdo7mWsUoJTGjJHnQPWy3SFa-MnK4TrhFLa4A==@protonmail.internalid>
 <20250513142353.2572563-7-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250513142353.2572563-7-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
> For sake of code simplicity and readability reduce the function code by
> one level of indentation, the change is non-functional.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 50 +++++++++++------------
>   1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 4e91e4b6ef52..39c5472f4552 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3385,35 +3385,35 @@ static int camss_subdev_notifier_complete(struct v4l2_async_notifier *async)
>   	struct camss *camss = container_of(async, struct camss, notifier);
>   	struct v4l2_device *v4l2_dev = &camss->v4l2_dev;
>   	struct v4l2_subdev *sd;
> -	int ret;
> 
>   	list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
> -		if (sd->host_priv) {
> -			struct media_entity *sensor = &sd->entity;
> -			struct csiphy_device *csiphy =
> -					(struct csiphy_device *) sd->host_priv;
> -			struct media_entity *input = &csiphy->subdev.entity;
> -			unsigned int i;
> -
> -			for (i = 0; i < sensor->num_pads; i++) {
> -				if (sensor->pads[i].flags & MEDIA_PAD_FL_SOURCE)
> -					break;
> -			}
> -			if (i == sensor->num_pads) {
> -				dev_err(camss->dev,
> -					"No source pad in external entity\n");
> -				return -EINVAL;
> -			}
> +		struct csiphy_device *csiphy = sd->host_priv;
> +		struct media_entity *input, *sensor;
> +		unsigned int i;
> +		int ret;
> +
> +		if (!csiphy)
> +			continue;
> +
> +		input = &csiphy->subdev.entity;
> +		sensor = &sd->entity;
> +
> +		for (i = 0; i < sensor->num_pads; i++) {
> +			if (sensor->pads[i].flags & MEDIA_PAD_FL_SOURCE)
> +				break;
> +		}
> +		if (i == sensor->num_pads) {
> +			dev_err(camss->dev,
> +				"No source pad in external entity\n");
> +			return -EINVAL;
> +		}
> 
> -			ret = media_create_pad_link(sensor, i,
> -				input, MSM_CSIPHY_PAD_SINK,
> +		ret = media_create_pad_link(sensor, i, input,
> +				MSM_CSIPHY_PAD_SINK,
>   				MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
> -			if (ret < 0) {
> -				camss_link_err(camss, sensor->name,
> -					       input->name,
> -					       ret);
> -				return ret;
> -			}
> +		if (ret < 0) {
> +			camss_link_err(camss, sensor->name, input->name, ret);
> +			return ret;
>   		}
>   	}
> 
> --
> 2.45.2
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

