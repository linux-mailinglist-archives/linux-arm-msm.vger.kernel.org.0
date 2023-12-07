Return-Path: <linux-arm-msm+bounces-3768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F7C809137
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 20:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EABD928177E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 19:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AD24F5FE;
	Thu,  7 Dec 2023 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aapZXh8g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFE71731
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 11:24:57 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c9f7fe6623so14583681fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 11:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701977096; x=1702581896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YVaODAR3o/Ibyy68Y5wtq42VvON75SYxd68wi+HuMbg=;
        b=aapZXh8gNXnkNDyCEaF2CkI3afCG7YiDlbr+psnIu7TKK+I8/1APWcUZ/u96GhYc3M
         UpWSLUmZcpReZ/5bXvPoD41Zf1ZAOKWUW6N1kFXXonaaM3Qq6aTGFI6t/Axs7U+Sihbp
         m3JuYFAE7Es77L8dQvZi8lCSL1rpK3E54UVHBiLNCU72XGWTvgxdaZZU5mG+5kwleuDM
         yvz5E0GKj0yO4vLf2hbozliSLvwOQbfqOIMDoETznw2dlNtk2sTXK5yg9eUDCWj6fpH9
         U7PKdF1m54Bgobii2+ki5ZHodDNnyMVjNXjTIiYPq6azn/ckmQbX53D937kEwDl3YP9l
         avGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701977096; x=1702581896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVaODAR3o/Ibyy68Y5wtq42VvON75SYxd68wi+HuMbg=;
        b=mrGCO7zjLDqqCd2tEPH75ujfQwNr3m5QSlHTBEdEkgzYVy3AYW8dkyPb2etXD1vDtv
         SZcnNaFZbtzJ8D7/+K0PpX9uio898WnK7wY691CIMZ9Hcw3u597Br8kxkz/hbtUWXY5Z
         EVxbKcxw2oqnKjtYrTdtk/dX4UjmmjUyvuKnRGwkMsXhEX0WrPRkDR9Ai82JWlMB4Cbj
         zL6HGwt2xbrd7ua0BMoLcGYbfpSJaSNFG+6p1QR1tbyyGJaXuQ409u273WHQHj+tRGy9
         7DkXL712V2u1JsQwbGom8TIgS4u8JE2lPG0C+ujj/318SBAZnpO9G406b9M2UJsnf+6F
         riPw==
X-Gm-Message-State: AOJu0YyTZSMm8pG9RVoyMDBC9tBT06FUExQCllU5faIiYDs4VZfNV2W1
	NXSzTUeJBZgGfvOKwPBB9asYwg==
X-Google-Smtp-Source: AGHT+IFbt/5mwz2PM1xcvV0ngLhtlHgCEprELvE1ziPZmZYPzXnNF0jvMRZNxbcmV6BSINZKU+pZmw==
X-Received: by 2002:a2e:97d3:0:b0:2ca:18de:126b with SMTP id m19-20020a2e97d3000000b002ca18de126bmr1347468ljj.43.1701977095729;
        Thu, 07 Dec 2023 11:24:55 -0800 (PST)
Received: from [172.30.205.181] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a11-20020a05651c010b00b002ca0a5dc73csm24380ljb.9.2023.12.07.11.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 11:24:55 -0800 (PST)
Message-ID: <71459bab-05b9-41f6-bb32-2b744736487d@linaro.org>
Date: Thu, 7 Dec 2023 20:24:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] power: supply: Add Acer Aspire 1 embedded controller
 driver
Content-Language: en-US
To: Nikita Travkin <nikita@trvn.ru>, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20231207-aspire1-ec-v1-0-ba9e1c227007@trvn.ru>
 <20231207-aspire1-ec-v1-2-ba9e1c227007@trvn.ru>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231207-aspire1-ec-v1-2-ba9e1c227007@trvn.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/7/23 12:20, Nikita Travkin wrote:
> Acer Aspire 1 is a Snapdragon 7c based laptop. It uses an embedded
> controller to control the charging and battery management, as well as to
> perform a set of misc functions.
> 
> Unfortunately, while all this functionality is implemented in ACPI, it's
> currently not possible to use ACPI to boot Linux on such Qualcomm
> devices. To allow Linux to still support the features provided by EC,
> this driver reimplments the relevant ACPI parts. This allows us to boot
> the laptop with Device Tree and retain all the features.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
[...]

> +	case POWER_SUPPLY_PROP_CAPACITY:
> +		val->intval = le16_to_cpu(ddat.capacity_now) * 100
> +			      / le16_to_cpu(sdat.capacity_full);
It may be just my OCD and im not the maintainer here, but I'd do
/= here

[...]

> +	case POWER_SUPPLY_PROP_MODEL_NAME:
> +		if (sdat.model_id - 1 < ARRAY_SIZE(aspire_ec_psy_battery_model))
> +			val->strval = aspire_ec_psy_battery_model[sdat.model_id - 1];
> +		else
> +			val->strval = "Unknown";
Would it make sense to print the model_id that's absent from the LUT
here and similarly below?

> +		break;
> +
> +	case POWER_SUPPLY_PROP_MANUFACTURER:
> +		if (sdat.vendor_id - 3 < ARRAY_SIZE(aspire_ec_psy_battery_vendor))
> +			val->strval = aspire_ec_psy_battery_vendor[sdat.vendor_id - 3];
> +		else
> +			val->strval = "Unknown";
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
Another ocd trip, i'd add a newline before return

> +	return 0;
> +}
[...]

> +	/*
> +	 * The original ACPI firmware actually has a small sleep in the handler.
> +	 *
> +	 * It seems like in most cases it's not needed but when the device
> +	 * just exits suspend, our i2c driver has a brief time where data
> +	 * transfer is not possible yet. So this delay allows us to suppress
> +	 * quite a bunch of spurious error messages in dmesg. Thus it's kept.
Ouch.. do you think i2c-geni needs fixing on this part?

[...]

> +	switch (id) {
> +	case 0x0: /* No event */
> +		break;
Is this a NOP/watchdog sort of thing?

[...]

> +
> +static struct i2c_driver aspire_ec_driver = {
> +	.driver = {
> +		.name = "aspire-ec",
> +		.of_match_table = aspire_ec_of_match,
> +		.pm = pm_sleep_ptr(&aspire_ec_pm_ops),
> +	},
> +	.probe = aspire_ec_probe,
> +	.id_table = aspire_ec_id,
Since it's tristate, I'd expect an entry for .remove_new here

Konrad

