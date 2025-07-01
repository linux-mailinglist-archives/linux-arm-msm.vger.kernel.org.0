Return-Path: <linux-arm-msm+bounces-63217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2E0AEF909
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 14:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 464DA3A8308
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A495F273D90;
	Tue,  1 Jul 2025 12:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oQ8XjfBp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11DD18DB27
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 12:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373806; cv=none; b=AvsnrOJcigLO2ZN5wNp8XhBS3xMK7QvfVL8yEJwjjZyLfW9+2PHXPliPx2SC5rgLUwuN08KPDIb+RuJ8VqLs/R/YFrW8ZcliywclFzmoKaGj5eXbS9XNcL4asZPlRuyiC6JmWlqvDrSp3h2dX6Ely9og0kvaCz7vwMzf3V4K82M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373806; c=relaxed/simple;
	bh=7NWxO7PaQI8/4JG0A3Vx4+jVhpSF8WKBKHv2nqV56Ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oDrjViLDn8ao/ozwXRrgztzn//uVLGXxw0s1tB83CB5cEqG4g3/Hmiu8qcgRSG8vjGlTiXa0qOBGMxCS6PK+T/vs9N4L1pGSEKkyf/gFARVM4rzt+QK+fuxZ/OIVUzp+ToCztpY9vGBaWG0QBAlXQNTN03IYCfTfRKB6sWjFJqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oQ8XjfBp; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae36e88a5daso637906566b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 05:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751373803; x=1751978603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vO82p+Ymyw4qd8ylLEXsAIS4Z9o8M8tSvKaMqhmYjc8=;
        b=oQ8XjfBpvw1Pv2n4JNw1ODJ5YmJXXVaE4qUY/fOmm4FLQguPgLstiDTsKIj3RFabKZ
         fKYL6spcRYFIYp9a+U9SjyM+CdoclLepxWGwAqcyVQlrhLpNSMdTDfZ0rsjxOO47+gow
         nBpD2/6Qae1Vn4EVMY3say8QvyahDhv/MVNK/nkyeh+nxiemFj3mbtLSFTpsH0Wx+GT6
         +WWjGcc6aUemqC0QzUDFtSNCHXiM0oKj6zxYGdmH7idXlzy4NiDIpJGXCWwim3D6ySkS
         Cd5iiDXIOA5oCBkVHZ4rlznsgqRh1vv+V0UJx7sw8DLx4+Ow/aPo5mQkRKEG/PhSMcaW
         uixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373803; x=1751978603;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vO82p+Ymyw4qd8ylLEXsAIS4Z9o8M8tSvKaMqhmYjc8=;
        b=uE/NF5ODL6NH0BW7AWbBWjFOr9gYdqmzkBXBlKLe/KDJ8/4p33Hk4h8QViimhW0uDo
         RIEpQHwdo1tSPwF6Ia4hwHyc1+aMe8FC6Bm2PcYtEguiQFUGH48kE2zO2JH5H3lWjmvi
         V+cYw+jAUyoSzb5blfIjMaeXfju61egjBf+89F7cdrS7vE6X6eYAvFKZW3zTtCVGZwO0
         /Dia2LM30WrX+JFStmVXFZ9F4TzN1K1JvRrg4pA5b/K4SrwYcRcufbVCddQ2eZVVkmKo
         s7QnIf4z/mpsV5Awe5DsJKZ4pjTme1waL4BKSpFc7sduB7VvuZUou8lODlH4N7o3MDMh
         cjMA==
X-Forwarded-Encrypted: i=1; AJvYcCUv6POASxwO/KYSBtDORoRAZQIG/3tNLMD5ox0MZww3/h5tVOnpDEXmFsegYUdgyMbqI7biSPCQp8LyXtPb@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ5pg3g5a1n1zc6ZvNqYct4/rT04DAbXIrGrRzPas+3curxDaL
	51c3ZgeyFARTZRY7Nzqh3b1CloAQCqYCufR5W5JcUCt7fnBKlh1xa0Dc6207MZGk97c=
X-Gm-Gg: ASbGncu8KWeIfxM2dq+bsk5YkM8zzB5uDA7ThYj40IHuZfizCnI/gGNXkCfeWHfCJJW
	HnMcvLu1f670n/L0bGBzGXQdgO6gPw44OR2iRsjNQ7ElHyM/VslkUUAiGaDmKRysQT8u+cUcmiS
	BU0Ji7Vy08l9jmHkfwh4EaG4aXtQVryDNXyW+OctbzvynlivaTnCFasTlPcaTluDALoBaKT5OCo
	bq8qJNXxX1TKsyE16jcCLFwHTsbCPAS8KTFS28iyG/KZYajF6Xo74dlvQ1E0o2jwcAEtIO0gJSi
	VxEZRQHEb5y2imUCRMaViypKhQt/75gQZbm/hfAV3XgsqraSyOl7DA3/oGNE6I4H5k1aTGR22vq
	OqlBvYBxLg0oVhoJ2hOHFoDUJnbY=
X-Google-Smtp-Source: AGHT+IE6xeF663Ehtkx+Tn7K0YByRaw3WGT5qhe7eblpPQ0dM4VjdYTgHjq2bWdoW1KfC5x11Xkqkg==
X-Received: by 2002:a17:907:c78b:b0:ade:cdec:7085 with SMTP id a640c23a62f3a-ae34fee181emr1637881166b.26.1751373803200;
        Tue, 01 Jul 2025 05:43:23 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659fdesm872608566b.69.2025.07.01.05.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:43:22 -0700 (PDT)
Message-ID: <177a3018-1170-4c92-8657-32edc165bb47@linaro.org>
Date: Tue, 1 Jul 2025 13:43:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] media: i2c: imx355: Support device tree probing and
 resource management
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250630225944.320755-7-mailingradian@gmail.com>
 <Vrnknr6oE7SMsU5fexDRxfCdLZypJp6UaPEae_ubAOcQuXsTWz6kOpoQB3jZWXUlEu09hp5XjfLAXD2AhuOK9A==@protonmail.internalid>
 <20250630225944.320755-9-mailingradian@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250630225944.320755-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/06/2025 23:59, Richard Acayan wrote:
> A device tree compatible makes it possible for this driver to be used on
> Open Firmware devices. Initialization of resources such as the reset
> GPIO and voltage regulators can be specified in the device tree and
> handled by the driver. Add support for this so the Pixel 3a can use the
> driver.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/media/i2c/imx355.c | 63 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index b2dce67c0b6b..42bd08e8ac50 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -3,9 +3,14 @@
> 
>   #include <linux/unaligned.h>
>   #include <linux/acpi.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>   #include <media/v4l2-ctrls.h>
>   #include <media/v4l2-device.h>
>   #include <media/v4l2-event.h>
> @@ -121,6 +126,16 @@ struct imx355 {
>   	 * Protect access to sensor v4l2 controls.
>   	 */
>   	struct mutex mutex;
> +
> +	struct clk *mclk;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[3];
> +};
> +
> +static const char * const imx355_supply_names[] = {
> +	"vana",
> +	"vdig",
> +	"vio",
>   };
> 
>   static const struct imx355_reg imx355_global_regs[] = {
> @@ -1683,6 +1698,7 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
>   static int imx355_probe(struct i2c_client *client)
>   {
>   	struct imx355 *imx355;
> +	size_t i;
>   	int ret;
> 
>   	imx355 = devm_kzalloc(&client->dev, sizeof(*imx355), GFP_KERNEL);
> @@ -1694,6 +1710,42 @@ static int imx355_probe(struct i2c_client *client)
>   	/* Initialize subdev */
>   	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
> 
> +	for (i = 0; i < ARRAY_SIZE(imx355_supply_names); i++)
> +		imx355->supplies[i].supply = imx355_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(&client->dev,
> +				      ARRAY_SIZE(imx355->supplies),
> +				      imx355->supplies);
> +	if (ret) {
> +		dev_err_probe(&client->dev, ret, "could not get regulators");
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(imx355->supplies),
> +				    imx355->supplies);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}

You should stick to dev_err_probe().

There's no reason to enable the rails this early either, should be in a 
dedicated power_on() function called in the right place with its own 
cleanup logic for error - to save us from replicating cleanup with jump 
labels.

> +
> +	imx355->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +	if (IS_ERR(imx355->reset_gpio)) {
> +		ret = PTR_ERR(imx355->reset_gpio);
> +		dev_err_probe(&client->dev, ret, "failed to get gpios");
> +		goto error_vreg_disable;
> +	}
> +
> +	imx355->mclk = devm_clk_get(&client->dev, "mclk");
> +	if (IS_ERR(imx355->mclk)) {
> +		ret = PTR_ERR(imx355->mclk);
> +		dev_err_probe(&client->dev, ret, "failed to get mclk");
> +		goto error_vreg_disable;
> +	}
> +
> +	clk_prepare_enable(imx355->mclk);
> +	usleep_range(12000, 13000);
This should go into a dedicated power_on() routine which is reusable, so 
that we have one place to get the power-on sequence right.

Something like drivers/media/i2c/ov02e10.c::ov02e10_power_on()

> +
>   	/* Check module identity */
>   	ret = imx355_identify_module(imx355);

If you move identify_module to come after get_hwcfg then all of the 
above code can be buried inside of get_hwcfg which IMO would be a nice 
pattern to follow.

driver/media/i2c/ov02[c|e].c

---bod

