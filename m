Return-Path: <linux-arm-msm+bounces-47659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F55A31A01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 00:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DA75188A257
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 23:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15F0271801;
	Tue, 11 Feb 2025 23:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dS82vaaX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8BE271806
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 23:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739318152; cv=none; b=naVp0htoK2HHTb2RFEUZ4SXuXn2SdFLzFo1cDc6aj/8RBhptgC9OkZcRwttZW3B7HErKgIevZDLUeSCUe5DU2F80K5ct+Cc9YLmsUFtqqsPDe23953MsOPOJREPzyjgl5U7ljztnWz8l9FdkNH2aBO0i8jdDiJ2rgq6Iq0OjVD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739318152; c=relaxed/simple;
	bh=zn/MEiaeMkqS+6/kfEldZQ8JkX+t51eC6E+hsKs0h2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndBpeZiT8NqqvETVpTz2G0wwZx+iMI+5fI8ccUmJB9erIxAUt7gvkfds9H+gxa+PKJ2S8eJRg/nFQfNDq8otwyYhSaeH9NDjU7b4R+86AgV8A8d4gtRaXZBxowEnB560Hj5pAzIhZIik6utXxYbPfU1A+WcxhQP2+BXbjpsgXNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dS82vaaX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso16021865e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 15:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739318149; x=1739922949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XexwhaJfLPqQn5rqo8bd5EO9HVDdHe/LGV/GV+wRqWQ=;
        b=dS82vaaXtKVfgnmhxVcCcBboTBRAHZY+g/eYdygtNtAV4IPtKlr5gGtgUf9XocHiVe
         RMv6CHVhodW7VV9Ry+ri3ZQdS2gJ943Vom3FnWn+eGEEafCWikvZDijtOOVYOEfmm2k7
         onSzVTqOGw/4Zobmb6SO0dSeQq+9ruw4mJLBie4ey5gHvletRuvqH7h2TiOP5Unp7DaA
         uq1idplKGBwgBhydneJenQHp+CMSt6ANXOHZQsDgdN4FpHzKF1Q1UBLD0+CmHIZdBkNy
         LeaxJmBEgyhR6++A/YMF1gTUskD2YcgVhLKzR1K+6rblvvC+4sGYzI9zuj+mM41cn9F2
         DvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739318149; x=1739922949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XexwhaJfLPqQn5rqo8bd5EO9HVDdHe/LGV/GV+wRqWQ=;
        b=me2BgYmciCikhdiYPiTMrP7ypoz1rq2HW0kS6h3kNtvBHo+E4YjqlwiWyrRPE4c+lo
         UeZrqkXQ5fedYfgwY6CzdVK7mpE99zjG/Sb2Rd0cb1JlgG3OR21tPbz2cloSUwkygMnr
         OO1FpZxnKyIWTEfE74K2uZ5qBfwcwNyoh2eurFCE/ThlixxGMLRWdKofEd2HJ0CfBklr
         NS2FKNSVybzK4EveqGuwgwzK3lhmHtwpDdxqTrKuAu/9xJlNQrCy92bk/rdjbC7EPOYE
         wjFVIX5nKtr6vpom7JkfxLbirUexrfbQXXL1KI2okELv00KdtwLgnxAWS9HTVcZmPouR
         SP8A==
X-Forwarded-Encrypted: i=1; AJvYcCX5D9OXXLIQEmFeHvxA76HSsPYEYAmYeN27tQOPbqrHvcA8jKjeEQmT049hV0YHQk6iKWem0jb9Uk7EcGKW@vger.kernel.org
X-Gm-Message-State: AOJu0YwnhyMK/hKpp0a9m07a/i7a/SQM70Vf+jjvFZqIsOqXig0QQS3+
	8S+NhkgPNOtP6BX5wEThmcC08nbz79JTM0WgFk4j3tktbS9d59e06n1KeyP3qhg=
X-Gm-Gg: ASbGncu+RzgtDub1i5/WBgegPBFuzRXzojm5gTE6De71jeAXNISfeVajOBj0WPtaSIo
	S2fm9vWa1rgXJ0AmJDY2PQdjCSsU1JThNoJMubphsge6YAqAzZ+H0BtcHVMQZxQhOVpe95jZD4h
	pkJzQ/sj4AlmYqPdmUyUegzBVpkSPZj/k56v2BSmrt5boxW6c4eYAbpLCGQCDAY0g924B6HMXmh
	aJyVqM6VLGjxX8H8QFOznznP4tPN3wAgVFEWybHlRwIx5nO3A00lJtCunoOrKlzdErP2CH556ud
	ePObPfsZVq6RMBuP9cBNz9+K4QsPsHJijUtUZJd3a5XxcF7as3ZDxyZOkQ==
X-Google-Smtp-Source: AGHT+IFLEnmaQXwA+RH1booCyaG9+or+G+muqfT8GCpoI2uuGUFMyD0LCVE1muL7WO/wlnwcoEr3/Q==
X-Received: by 2002:a05:600c:1d9a:b0:439:4a2a:f318 with SMTP id 5b1f17b1804b1-439581c17f3mr8639005e9.28.1739318149510;
        Tue, 11 Feb 2025 15:55:49 -0800 (PST)
Received: from [192.168.0.156] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04cda4sm2862615e9.1.2025.02.11.15.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 15:55:49 -0800 (PST)
Message-ID: <84682c43-e480-41df-a258-1f5311bb441a@linaro.org>
Date: Tue, 11 Feb 2025 23:55:47 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] regulator: qcom_usb_vbus: Add support for PMI8998
 VBUS
To: "James A. MacInnes" <james.a.macinnes@gmail.com>,
 linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, quic_wcheng@quicinc.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org
References: <20250211194918.2517593-1-james.a.macinnes@gmail.com>
 <20250211194918.2517593-3-james.a.macinnes@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250211194918.2517593-3-james.a.macinnes@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2025 19:49, James A. MacInnes wrote:
> +	// Determine PMIC type
> +	pmic_type = of_device_get_match_data(dev);
> +	if (pmic_type && strcmp(pmic_type, "pmi8998") == 0) {
> +		qcom_usb_vbus_rdesc.curr_table = curr_table_pmi8998;
> +		qcom_usb_vbus_rdesc.n_current_limits =
> +			ARRAY_SIZE(curr_table_pmi8998);
> +	} else if (pmic_type && strcmp(pmic_type, "pm8150b") == 0) {
> +		qcom_usb_vbus_rdesc.curr_table = curr_table_pm8150b;
> +		qcom_usb_vbus_rdesc.n_current_limits =
> +			ARRAY_SIZE(curr_table_pm8150b);
> +	} else {
> +		return -ENODEV;
> +	}
>   	qcom_usb_vbus_rdesc.enable_reg = base + CMD_OTG;
>   	qcom_usb_vbus_rdesc.enable_mask = OTG_EN;
>   	qcom_usb_vbus_rdesc.csel_reg = base + OTG_CURRENT_LIMIT_CFG;
> @@ -80,18 +99,22 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
>   	rdev = devm_regulator_register(dev, &qcom_usb_vbus_rdesc, &config);
>   	if (IS_ERR(rdev)) {
>   		ret = PTR_ERR(rdev);
> -		dev_err(dev, "not able to register vbus reg %d\n", ret);
> +		dev_err(dev, "Failed to register vbus reg %d\n", ret);
>   		return ret;
>   	}
>   
>   	/* Disable HW logic for VBUS enable */
>   	regmap_update_bits(regmap, base + OTG_CFG, OTG_EN_SRC_CFG, 0);
>   
> +	dev_info(dev, "Registered QCOM %s VBUS regulator\n",
> +		 pmic_type);
> +
>   	return 0;
>   }
>   
>   static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
> -	{ .compatible = "qcom,pm8150b-vbus-reg" },
> +	{ .compatible = "qcom,pm8150b-vbus-reg", .data = "pm8150b" },
> +	{ .compatible = "qcom,pmi8998-vbus-reg", .data = "pmi8998" },

I think the other two said much the same thing but .data should point to 
the differentiator instead of being a string which you disjoin on and 
then hook your differentiated data.

i.e.

.data = &my_driver_specific_static_data_here.

---
bod

