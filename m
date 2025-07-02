Return-Path: <linux-arm-msm+bounces-63308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C81AF081D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 03:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B1381BC8366
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 01:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA05F54758;
	Wed,  2 Jul 2025 01:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R6AjMW9U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9981798F
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 01:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751420587; cv=none; b=acvVsor0deGjp70t2TGpTlH3ROwTMrAPOexAyf4T0LRsfZgT1nQA7Le9lz5v4MLSiBAlPijcXnCUidLZN8WQitJveMKtLtpk5bmRffr9av1qFf6H2ZAkrjNxD4XmxFJZQmFXOizSh23hb5Mq51Jg3Ub3GVm4hk2Gfi7Hrrh308M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751420587; c=relaxed/simple;
	bh=ocwGYZtPkKI+Sb9WeLe4q/1JO4zzPRQfZ/xglgL1odQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=BPtsLL853yBBn8CX5qSAe6vpIjKqs1XQMarXT9yBd5hQg7qO4eg7en7570IZxJoGSlMUlAbr19016yO/KylZlTzuNp6aCBnDuOPobUqNXsu1WtTk1OtFCc5h0MSYzPJu2dFQAvOEGGbu5LVz4lPHFH5lmu+83DAzrpTYLjMpOcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R6AjMW9U; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so37358265e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 18:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751420583; x=1752025383; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYFu8d/VkRqk1KL+H0JAP0NaVCgAHnwy7aILnhThZZI=;
        b=R6AjMW9U0GQZjBjQhLVgIWssZA8r/IWWCtGHWeweFOSgsdPeb3Ot7gCBRNmu+N6W+4
         nZONXxJM1JyQfXCujxM4xM7tahQyM1VFO8noAZ9q0fgWLc3H49s+RAnCnqR+Bcgjr723
         JWKJNDowKwLv3Er4WLYqlx5/Wk47zc7oU8ZGG1WeR29Eh+3P+j0gdCYW7snz2O/RmDeX
         Xj6s/6rgbcDFYgbXFqastRBdk9jITYeMTaCi/YrEIjcaCgQYtTWYCTnUVtF39UMJYGxU
         79bV0CD34gcO9vPM8mB06HAFReCIb7wP58Mq1/xeh6oAFAvivWzcGJff+aLw8xXf3arD
         Z8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751420583; x=1752025383;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cYFu8d/VkRqk1KL+H0JAP0NaVCgAHnwy7aILnhThZZI=;
        b=ApSQb+j7oTStUOCwdLWdk5CxvGSNlOY6p34i1m6nat1T1inukrqznYH2VIdE5XJ56i
         Oe4BIYfZb3KHjtn3IO8Pa01TT8hPTYVKG/2WtuNPwz8AiTkNdMK5z3NcofDEZgwvLK6j
         LaZ1JNv9OvwZxPr41xn856Ox9oMqGBuW3SLFbip8Wply2btsCsVvxu+Aetjc14jW9i/v
         1ftZvJW7UsRn0/5zsEswUcQ7axpQLxSRGdtrROCqvwMU6coGFCu9FEeCYlb3CSzNgPOw
         1QFQISKMj/ptUFI/YPNOP48Ik8aaxH3im7R+Z3ISqqv7BJ46mSEKPuXfoijvUY3eeK6F
         N7DQ==
X-Forwarded-Encrypted: i=1; AJvYcCViHWIq8jcsmO1YQw0aPAgKIASx6J2qZnVhc3apG9iJGFU/IQdzegkM5uZsiVK4Nj0nTvuNfe6S4iYvzr9Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyP1fLwZ5Flmydf6p6lNVYxrt4YaRe/BRsj6JviBTff2vusln67
	bC9mMIdtxe9cqGlMyo09ARvpTc0LvJFgkyU+def+yY1YIj6CgNI1WRUnZEdaUMyPQvU=
X-Gm-Gg: ASbGnctiN/zWQ3CDhI0f8OurRtztYo9pxZfCDW7DJXlop8G6Hr2XVR22egawvUjKX5M
	//zNj/CFLmBW1yPBtXDU+pzW/AM1B74JP69y8qiNZH9sC9/bSVDHZUGmS1PSqPcJGEvyBSEGY/m
	wptH7CtN6dIcFs1ZnzeXR4se+Gm1cgcOk2P6G7ymmaGKwTJLuWzuEadlsUPn5aT0knGDrhlCVK6
	UW+UX+avS4nlU4f1viFKZZEostjIFllGqDAtRWee0yLPeaDC0yEpu0UfThrPiznHCOsDgIRLBrx
	AkQzSYfUt0QSF634Ii4U58y7rS4JOjZl3OwRvFwTcgrQx5Magj4BEaW5+cr++BXFwS7L
X-Google-Smtp-Source: AGHT+IE6uofbuX/+t3i3C+jz76Xz8CuUT3eNKEyaEjrdiymIoO7j8WqxmPpnxf+6NTO/tlotw5vfkg==
X-Received: by 2002:a05:600c:64cd:b0:451:edc8:7806 with SMTP id 5b1f17b1804b1-454a3737bb9mr8447665e9.32.1751420582558;
        Tue, 01 Jul 2025 18:43:02 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:4dad:b69a:9c81:2e57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fdfa6sm186193775e9.22.2025.07.01.18.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 18:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 02:43:01 +0100
Message-Id: <DB16S3FI8AXX.1LA99XCPAW1UF@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Srinivas
 Kandagatla" <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>
Cc: "Lee Jones" <lee@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] ASoC: codecs: add new pm4125 audio codec driver
X-Mailer: aerc 0.20.0
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-3-e52933c429a0@linaro.org>
 <00b63483-8012-4a04-9486-536a7b236497@oss.qualcomm.com>
In-Reply-To: <00b63483-8012-4a04-9486-536a7b236497@oss.qualcomm.com>

On Sat Jun 28, 2025 at 9:24 PM BST, Srinivas Kandagatla wrote:
> On 6/26/25 12:50 AM, Alexey Klimov wrote:
>> The audio codec is found in Qualcomm PM2250/PM4125 PMICs and is used on
>> platforms like Qualcomm QCM2290. It has soundwire interface and
>> corresponding RX and TX slave devices.
>>=20
>> It has only two input channels: HPH left and right. The line output (LO)
>> is linked to HPHL so the hardware has some limitations regarding concurr=
ent
>> playback via HPH and LO for instance.
>>=20
>> Not all functionality is implemented and there are some number of
>> placeholders. Mostly output functionality like analog and digital mics i=
s
>> missing at this point and implemented in a possible minimal way.
>> The codec driver also uses WCD MBCH framework. The MBHC functionality is
>> also implemented in a minimalistic way to enable IRQs.
>
> Lets try to fill these gaps in next version, I have tested Headset,
> Lineout  and MIC on my side with additional changes to this.

Yep.


>> Despite all limitations in its current state the line out and HPH playba=
ck
>> work.
>
> Thanks Alexey for all the work porting the driver from downstream audio
> kernel.
>
> my comments below.

It is a bit difficult to follow comments so if I miss smth please let me kn=
ow.

>> Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  sound/soc/codecs/Kconfig      |   19 +
>>  sound/soc/codecs/Makefile     |    8 +
>>  sound/soc/codecs/pm4125-sdw.c |  485 +++++++++++
>>  sound/soc/codecs/pm4125.c     | 1848 ++++++++++++++++++++++++++++++++++=
+++++++
>>  sound/soc/codecs/pm4125.h     |  375 +++++++++
>>  5 files changed, 2735 insertions(+)
>>=20
>> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
>> index 6d7e4725d89cd33647770e4f2c4e81445b8335ce..69b08021d165f83f4a7ca18e=
476cfc7e2473f490 100644
>> --- a/sound/soc/codecs/Kconfig
>> +++ b/sound/soc/codecs/Kconfig
>> @@ -297,6 +297,7 @@ config SND_SOC_ALL_CODECS
>>  	imply SND_SOC_WCD937X_SDW
>>  	imply SND_SOC_WCD938X_SDW
>>  	imply SND_SOC_WCD939X_SDW
>> +	imply SND_SOC_PM4125_SDW
>>  	imply SND_SOC_LPASS_MACRO_COMMON
>>  	imply SND_SOC_LPASS_RX_MACRO
>>  	imply SND_SOC_LPASS_TX_MACRO
>> @@ -2316,6 +2317,24 @@ config SND_SOC_WCD939X_SDW
>>  	  The WCD9390/9395 is a audio codec IC Integrated in
>>  	  Qualcomm SoCs like SM8650.
>> =20
>> +config SND_SOC_PM4125
>> +	depends on SND_SOC_PM4125_SDW
>> +	tristate
>> +	depends on SOUNDWIRE || !SOUNDWIRE
>> +	select SND_SOC_WCD_CLASSH
>> +
>> +config SND_SOC_PM4125_SDW
>> +	tristate "PM4125 audio codec - SDW"
>> +	select SND_SOC_PM4125
>> +	select SND_SOC_WCD_MBHC
>> +	select REGMAP_IRQ
>> +	depends on SOUNDWIRE
>> +	select REGMAP_SOUNDWIRE
>> +	help
>> +	  The PMIC PM4125 has an in-built audio codec IC used with SoCs
>> +	  like QCM2290, and it is connected via soundwire and SPMI.
>> +	  To compile this codec driver say Y or m.
>> +
>>  config SND_SOC_WL1273
>>  	tristate
>> =20
>> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
>> index a68c3d192a1b6ccec513c6bc447c29be532ea70c..e993cc9803c4da60daf230a8=
181673b45c06aa5b 100644
>> --- a/sound/soc/codecs/Makefile
>> +++ b/sound/soc/codecs/Makefile
>> @@ -348,6 +348,8 @@ snd-soc-wcd938x-y :=3D wcd938x.o
>>  snd-soc-wcd938x-sdw-y :=3D wcd938x-sdw.o
>>  snd-soc-wcd939x-y :=3D wcd939x.o
>>  snd-soc-wcd939x-sdw-y :=3D wcd939x-sdw.o
>> +snd-soc-pm4125-y :=3D pm4125.o
>> +snd-soc-pm4125-sdw-y :=3D pm4125-sdw.o
>>  snd-soc-wl1273-y :=3D wl1273.o
>>  snd-soc-wm-adsp-y :=3D wm_adsp.o
>>  snd-soc-wm0010-y :=3D wm0010.o
>> @@ -779,6 +781,12 @@ ifdef CONFIG_SND_SOC_WCD939X_SDW
>>  # avoid link failure by forcing sdw code built-in when needed
>>  obj-$(CONFIG_SND_SOC_WCD939X) +=3D snd-soc-wcd939x-sdw.o
>>  endif
>> +obj-$(CONFIG_SND_SOC_PM4125_SDW) +=3D snd-soc-pm4125-sdw.o
>> +obj-$(CONFIG_SND_SOC_PM4125)   +=3D snd-soc-pm4125.o
>> +ifdef CONFIG_SND_SOC_PM4125_SDW
>> +# avoid link failure by forcing sdw code built-in when needed
>> +obj-$(CONFIG_SND_SOC_PM4125) +=3D snd-soc-pm4125-sdw.o
>> +endif
>>  obj-$(CONFIG_SND_SOC_WL1273)	+=3D snd-soc-wl1273.o
>>  obj-$(CONFIG_SND_SOC_WM0010)	+=3D snd-soc-wm0010.o
>>  obj-$(CONFIG_SND_SOC_WM1250_EV1) +=3D snd-soc-wm1250-ev1.o
>> diff --git a/sound/soc/codecs/pm4125-sdw.c b/sound/soc/codecs/pm4125-sdw=
.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..d09c4f5fb3b7b7918a1a0c25=
750046b212f1063f
>> --- /dev/null
>> +++ b/sound/soc/codecs/pm4125-sdw.c
>> @@ -0,0 +1,485 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights =
reserved.
>> +// Copyright, 2025 Linaro Ltd
>> +
>> +#include <linux/component.h>
>> +#include <linux/device.h>
>> +#include <linux/irq.h>
>> +#include <linux/irqdomain.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <linux/slab.h>
>> +#include <linux/soundwire/sdw.h>
>> +#include <linux/soundwire/sdw_registers.h>
>> +#include <linux/soundwire/sdw_type.h>
>> +#include <sound/soc-dapm.h>
>> +#include <sound/soc.h>
>> +#include "pm4125.h"
>> +
>> +static struct pm4125_sdw_ch_info pm4125_sdw_rx_ch_info[] =3D {
>> +	WCD_SDW_CH(PM4125_HPH_L, PM4125_HPH_PORT, BIT(0)),
>> +	WCD_SDW_CH(PM4125_HPH_R, PM4125_HPH_PORT, BIT(1)),
>> +	WCD_SDW_CH(PM4125_COMP_L, PM4125_COMP_PORT, BIT(0)),
>> +	WCD_SDW_CH(PM4125_COMP_R, PM4125_COMP_PORT, BIT(1)),
>> +};
>> +
>> +static struct pm4125_sdw_ch_info pm4125_sdw_tx_ch_info[] =3D {
>> +	WCD_SDW_CH(PM4125_ADC1, PM4125_ADC_1_PORT, BIT(0)),
>> +	WCD_SDW_CH(PM4125_DMIC0, PM4125_DMIC_0_3_MBHC_PORT, BIT(0)),
>> +	WCD_SDW_CH(PM4125_DMIC1, PM4125_DMIC_0_3_MBHC_PORT, BIT(1)),
>> +	WCD_SDW_CH(PM4125_DMIC2, PM4125_DMIC_0_3_MBHC_PORT, BIT(2)),
> these does not look correct. there are 2 ADCs .

Ok, this needs to be fixed.


[...]


>> +static bool pm4125_rdwr_register(struct device *dev, unsigned int reg)
>> +{
>> +	if (reg > PM4125_ANA_BASE_ADDR &&
>> +	    reg < PM4125_ANALOG_REGISTERS_MAX_SIZE)
>> +		return pm4125_reg_access_analog[PM4125_REG(reg)] & WR_REG;
> Lets not bring in some additional layer here from downstream, pl use the
> registers directly here as we do for other codecs.

Ok, let's fix this.


[...]

>> +static int pm4125_probe(struct sdw_slave *pdev,
>> +			const struct sdw_device_id *id)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	struct pm4125_sdw_priv *priv;
>> +	u8 master_ch_mask[PM4125_MAX_SWR_CH_IDS];
>> +	int master_ch_mask_size =3D 0;
>> +	int ret, i;
>> +
>> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	/*
>> +	 * Port map index starts at 0,
>> +	 * however the data port for this codec start at index 1
>> +	 */
>> +	if (of_property_present(dev->of_node, "qcom,tx-port-mapping")) {
>> +		priv->is_tx =3D true;
>> +		ret =3D of_property_read_u32_array(dev->of_node,
>> +						 "qcom,tx-port-mapping",
>> +						 &pdev->m_port_map[1],
>> +						 PM4125_MAX_TX_SWR_PORTS);
>> +	} else {
>> +		ret =3D of_property_read_u32_array(dev->of_node,
>> +						 "qcom,rx-port-mapping",
>> +						 &pdev->m_port_map[1],
>> +						 PM4125_MAX_SWR_PORTS);
>> +	}
>> +	if (ret < 0)
>> +		dev_info(dev, "Error getting static port mapping for %s (%d)\n",
>> +			 priv->is_tx ? "TX" : "RX", ret);
>> +
>> +	priv->sdev =3D pdev;
>> +	dev_set_drvdata(dev, priv);
>> +
>> +	pdev->prop.scp_int1_mask =3D SDW_SCP_INT1_IMPL_DEF |
>> +				   SDW_SCP_INT1_BUS_CLASH |
>> +				   SDW_SCP_INT1_PARITY;
>> +	pdev->prop.lane_control_support =3D true;
>> +	pdev->prop.simple_clk_stop_capable =3D true;
>> +
>> +	memset(master_ch_mask, 0, PM4125_MAX_SWR_CH_IDS);
>> +
>> +	if (priv->is_tx) {
>> +		master_ch_mask_size =3D
>> +			of_property_count_u8_elems(dev->of_node,
>> +						   "qcom,tx-channel-mapping");
>> +
>> +		if (master_ch_mask_size)
>> +			ret =3D of_property_read_u8_array(dev->of_node,
>> +						"qcom,tx-channel-mapping",
>> +						master_ch_mask,
>> +						master_ch_mask_size);
>> +	} else {
>> +		master_ch_mask_size =3D
>> +			of_property_count_u8_elems(dev->of_node,
>> +						   "qcom,rx-channel-mapping");
>> +
>> +		if (master_ch_mask_size)
>> +			ret =3D of_property_read_u8_array(dev->of_node,
>> +						"qcom,rx-channel-mapping",
>> +						master_ch_mask,
>> +						master_ch_mask_size);
>> +	}
>> +
>> +	if (ret < 0)
>> +		dev_info(dev, "Static channel mapping not specified using device chan=
nel maps\n");
>> +
>> +	if (priv->is_tx) {
>> +		pdev->prop.source_ports =3D GENMASK(PM4125_MAX_TX_SWR_PORTS, 0);
>> +		pdev->prop.src_dpn_prop =3D pm4125_dpn_prop;
>> +		priv->ch_info =3D &pm4125_sdw_tx_ch_info[0];
>> +
>> +		for (i =3D 0; i < master_ch_mask_size; i++)
>> +			priv->ch_info[i].master_ch_mask =3D
>> +					PM4125_SWRM_CH_MASK(master_ch_mask[i]);
>> +
>> +		pdev->prop.wake_capable =3D true;
>> +
>> +		priv->regmap =3D devm_regmap_init_sdw(pdev,
>> +						    &pm4125_regmap_config);
> we do have 100 chars per line, do not split the lines unless required.

Heh, I see, thanks. Checkpatch seems to check for 100 chars now.


[..]

>> diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..58435b9c75865b06b344c6d7=
9800aa9b4bac3abd
>> --- /dev/null
>> +++ b/sound/soc/codecs/pm4125.c
>> @@ -0,0 +1,1848 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights =
reserved.
>> +// Copyright (c) 2025, Linaro Ltd
>> +
>> +#include <linux/component.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/slab.h>
>> +#include <sound/jack.h>
>> +#include <sound/pcm_params.h>
>> +#include <sound/pcm.h>
>> +#include <sound/soc-dapm.h>
>> +#include <sound/soc.h>
>> +#include <sound/tlv.h>
>> +
>> +#include "wcd-mbhc-v2.h"
>> +#include "pm4125.h"
>> +
>> +#define WCD_MBHC_HS_V_MAX		1600
>> +#define PM4125_MBHC_MAX_BUTTONS		8
>> +
>> +#define PM4125_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
>> +		      SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
>> +		      SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000 |\
>> +		      SNDRV_PCM_RATE_384000)
>> +
>> +/* Fractional Rates */
>> +#define PM4125_FRAC_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_88200 =
|\
>> +			   SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_352800)
>> +
>> +#define PM4125_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_=
LE |\
>> +			SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
>> +
>> +/* Registers in SPMI addr space */
>> +#define PM4125_CODEC_RESET_REG		0xF3DB
>> +#define PM4125_CODEC_OFF		0x1
>> +#define PM4125_CODEC_ON			0x0
>> +#define PM4125_CODEC_FOUNDRY_ID_REG	0x7
>> +
>> +enum {
>> +	HPH_COMP_DELAY,
>> +	HPH_PA_DELAY,
>> +};
>> +
>> +enum {
>> +	AIF1_PB =3D 0,
>> +	AIF1_CAP,
>> +	NUM_CODEC_DAIS,
>> +};
>> +
>> +struct pm4125_priv {
>> +	struct sdw_slave *tx_sdw_dev;
>> +	struct pm4125_sdw_priv *sdw_priv[NUM_CODEC_DAIS];
>> +	struct device *txdev;
>> +	struct device *rxdev;
>> +	struct device_node *rxnode;
>> +	struct device_node *txnode;
>> +	struct regmap *regmap;
>> +	struct regmap *spmi_regmap;
>> +	/* mbhc module */
>> +	struct wcd_mbhc *wcd_mbhc;
>> +	struct wcd_mbhc_config mbhc_cfg;
>> +	struct wcd_mbhc_intr intr_ids;
>> +	struct irq_domain *virq;
>> +	const struct regmap_irq_chip *pm4125_regmap_irq_chip;
>> +	struct regmap_irq_chip_data *irq_chip;
>> +	struct regulator_bulk_data supplies[PM4125_MAX_BULK_SUPPLY];
>> +	struct regulator *buck_supply;
>
> unused.

Needs to be removed, yep.

>> +	struct snd_soc_jack *jack;
>> +	unsigned long status_mask;
>> +	s32 micb_ref[PM4125_MAX_MICBIAS];
>> +	s32 pullup_ref[PM4125_MAX_MICBIAS];
>> +	u32 hph_mode;
>> +	int ear_rx_path;
>> +	u32 micb1_mv;
>> +	u32 micb2_mv;
>> +	u32 micb3_mv;
>> +
>> +	int hphr_pdm_wd_int;
>> +	int hphl_pdm_wd_int;
>> +	bool comp1_enable;
>> +	bool comp2_enable;
>> +
>> +	atomic_t rx_clk_cnt;
>> +	atomic_t ana_clk_count;
> unused

Ok.


[..]

>> +static int pm4125_handle_post_irq(void *data)
>> +{
>> +	struct pm4125_priv *pm4125;
>> +
>> +	if (data)
>> +		pm4125 =3D (struct pm4125_priv *)data;
>> +	else
>> +		return IRQ_HANDLED;
> This will result in interrupt storm, as you are not clearning the source.
>
>> +
>> +	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_0, 0);
>> +	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_1, 0);
>> +	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_2, 0);
>> +
>> +	return IRQ_HANDLED;
>> +}

Do you mean that it should be:

static int pm4125_handle_post_irq(void *data)
{
	struct pm4125_priv *pm4125 =3D (struct pm4125_priv *)data;

	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_0, 0);
	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_1, 0);
	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_2, 0);

	return IRQ_HANDLED;
} =20

I need to fix irq_drv_data =3D NULL in pm4125_regmap_irq_chip then.
IIRC it is always NULL.
The same behaviour as in wcd937x.c

>> +static const u32 pm4125_config_regs[] =3D {
>> +	PM4125_DIG_SWR_INTR_LEVEL_0,
>> +};
>> +
>> +static const struct regmap_irq_chip pm4125_regmap_irq_chip =3D {
>> +	.name =3D "pm4125",
>> +	.irqs =3D pm4125_irqs,
>> +	.num_irqs =3D ARRAY_SIZE(pm4125_irqs),
>> +	.num_regs =3D 3,
>> +	.status_base =3D PM4125_DIG_SWR_INTR_STATUS_0,
>> +	.mask_base =3D PM4125_DIG_SWR_INTR_MASK_0,
>> +	.ack_base =3D PM4125_DIG_SWR_INTR_CLEAR_0,
>> +	.use_ack =3D 1,
>> +	.clear_ack =3D 1,
>> +	.config_base =3D pm4125_config_regs,
>> +	.num_config_bases =3D ARRAY_SIZE(pm4125_config_regs),
>> +	.num_config_regs =3D 1,
>> +	.runtime_pm =3D true,
>> +	.handle_post_irq =3D pm4125_handle_post_irq,
>> +	.irq_drv_data =3D NULL,
>> +};
>> +
>> +static void pm4125_reset(struct pm4125_priv *pm4125)
>> +{
>> +	regmap_write(pm4125->spmi_regmap,
>> +		     PM4125_CODEC_RESET_REG, PM4125_CODEC_OFF);
>> +	usleep_range(20, 30);
>> +
>> +	regmap_write(pm4125->spmi_regmap,
>> +		     PM4125_CODEC_RESET_REG, PM4125_CODEC_ON);
>> +	usleep_range(5000, 5010);
>> +}
>> +
>> +static void pm4125_io_init(struct regmap *regmap)
>> +{
>> +	/* Disable HPH OCP */
>> +	regmap_update_bits(regmap, PM4125_ANA_HPHPA_CNP_CTL_2, 0x03, 0x00);
> pl use defines instead of using magic values.
> applies to most part of the driver.
> also pl take a look at
> snd_soc_component_read/write_field() functions which are handy


Ok, this will be some rework in order to do this.


>> +	/* Enable surge protection */
>> +	regmap_update_bits(regmap, PM4125_ANA_SURGE_EN, 0xC0, 0xC0);
>> +
>> +	/* Disable mic bias pull down */
>> +	regmap_update_bits(regmap, PM4125_ANA_MICBIAS_MICB_1_2_EN, 0x01, 0x00)=
;
>> +}
>> +
>> +static int pm4125_global_mbias_disable(struct snd_soc_component *compon=
ent)
>> +{
>> +	snd_soc_component_update_bits(component, PM4125_ANA_MBIAS_EN,
>> +				      0x10, 0x00);
>> +	snd_soc_component_update_bits(component, PM4125_ANA_MBIAS_EN,
>> +				      0x20, 0x00);
>> +	return 0;
>> +}
>> +
>> +static int pm4125_global_mbias_enable(struct snd_soc_component *compone=
nt)
>> +{
>> +	snd_soc_component_update_bits(component, PM4125_ANA_MBIAS_EN,
>> +				      0x20, 0x20);
>> +	snd_soc_component_update_bits(component, PM4125_ANA_MBIAS_EN,
>> +				      0x10, 0x10);
>> +	usleep_range(1000, 1100);
>> +	return 0;
>> +}
>> +
>> +static int pm4125_rx_clk_enable(struct snd_soc_component *component)
>
> looks like the rxclk can be converted into a proper dapm supply widget.

I'll check that. Thank you.


[..]

>> +static int pm4125_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
>> +				       struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_component *component =3D
>> +					snd_soc_dapm_to_component(w->dapm);
>> +	struct pm4125_priv *pm4125 =3D snd_soc_component_get_drvdata(component=
);
>> +
>> +	switch (event) {
>> +	case SND_SOC_DAPM_PRE_PMU:
>> +		pm4125_rx_clk_enable(component);
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_ANA_HPHPA_CNP_CTL_1,
>> +					      0x02, 0x02);
>> +
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_SWR_HPHPA_HD2,
>> +					      0x38, 0x38);
>> +
>> +		set_bit(HPH_COMP_DELAY, &pm4125->status_mask);
>> +		break;
>> +	case SND_SOC_DAPM_POST_PMU:
>> +
> drop space.

Ok.

>> +		if (pm4125->comp1_enable) {
>> +			snd_soc_component_update_bits(component,
>> +						PM4125_DIG_SWR_CDC_COMP_CTL_0,
>> +						0x02, 0x02);
>> +
>> +			if (pm4125->comp2_enable)
>> +				snd_soc_component_update_bits(component,
>> +						PM4125_DIG_SWR_CDC_COMP_CTL_0,
>> +						0x01, 0x01);
>> +			/*
>> +			 * 5ms sleep is required after COMP is enabled as per
>> +			 * HW requirement
>> +			 */
>> +			if (test_bit(HPH_COMP_DELAY, &pm4125->status_mask)) {
>> +				usleep_range(5000, 5100);
>> +				clear_bit(HPH_COMP_DELAY, &pm4125->status_mask);
>> +			}
>> +		} else {
>> +			snd_soc_component_update_bits(component,
>> +						PM4125_DIG_SWR_CDC_COMP_CTL_0,
>> +						0x02, 0x00);
>> +		}
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_DIG_SWR_CDC_RX0_CTL,
>> +					      0x80, 0x00);
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_DIG_SWR_CDC_RX_GAIN_CTL,
>> +					      0x04, 0x04);
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_DIG_SWR_CDC_RX_CLK_CTL,
>> +					      0x01, 0x01);
>> +		break;
>> +	case SND_SOC_DAPM_POST_PMD:
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_DIG_SWR_CDC_RX_CLK_CTL,
>> +					      0x01, 0x00);
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_DIG_SWR_CDC_RX_GAIN_CTL,
>> +					      0x04, 0x00);
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_DIG_SWR_CDC_RX0_CTL,
>> +					      0x80, 0x80);
>> +		if (pm4125->comp1_enable)
>> +			snd_soc_component_update_bits(component,
>> +						PM4125_DIG_SWR_CDC_COMP_CTL_0,
>> +						0x02, 0x00);
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pm4125_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
>> +				       struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_component *component =3D
>> +					snd_soc_dapm_to_component(w->dapm);
> this can fit in 100 chars.

Ok.

[...]

>> +static int pm4125_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
>> +				       struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_component *component =3D
>> +					snd_soc_dapm_to_component(w->dapm);
>> +	struct pm4125_priv *pm4125 =3D snd_soc_component_get_drvdata(component=
);
>> +
>> +	switch (event) {
>> +	case SND_SOC_DAPM_PRE_PMU:
>> +		usleep_range(200, 210);
>> +		set_bit(HPH_PA_DELAY, &pm4125->status_mask);
> Am really not following the logic here, we set the bit here and check
> the bit in POST_PMU and then we set BIT in PRE_PMD and clear it int
> POST_PMD.
>
> So this bit will be set in all the cases.
>
> why do we even need this bit to be set, can we not use the dealy by defau=
lt?

I guess it makes a lot of sense to remove it.


>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_DIG_SWR_PDM_WD_CTL0,
>> +					      0x03, 0x03);
>> +		break;
>> +	case SND_SOC_DAPM_POST_PMU:
>> +		if (test_bit(HPH_PA_DELAY, &pm4125->status_mask)) {
>> +			usleep_range(5000, 5100);
>> +			clear_bit(HPH_PA_DELAY, &pm4125->status_mask);
>> +		}
>> +
>> +		enable_irq(pm4125->hphl_pdm_wd_int);
>> +		break;
>> +	case SND_SOC_DAPM_PRE_PMD:
>> +		disable_irq_nosync(pm4125->hphl_pdm_wd_int);
>> +		set_bit(HPH_PA_DELAY, &pm4125->status_mask);
>> +		break;
>> +	case SND_SOC_DAPM_POST_PMD:
>> +		if (test_bit(HPH_PA_DELAY, &pm4125->status_mask)) {
>> +			usleep_range(5000, 5100);
>> +			clear_bit(HPH_PA_DELAY, &pm4125->status_mask);
>> +		}
>> +
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_DIG_SWR_PDM_WD_CTL0,
>> +					      0x03, 0x00);
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pm4125_codec_enable_lo_pa(struct snd_soc_dapm_widget *w,
>> +				     struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_component *component =3D
>> +					snd_soc_dapm_to_component(w->dapm);
>> +	struct pm4125_priv *pm4125 =3D snd_soc_component_get_drvdata(component=
);
>> +
>> +	switch (event) {
>> +	case SND_SOC_DAPM_PRE_PMU:
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_ANA_COMBOPA_CTL_5,
>> +					      0x04, 0x00);
>> +		usleep_range(1000, 1010);
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_ANA_COMBOPA_CTL_4,
>> +					      0x0F, 0x0F);
>> +		usleep_range(1000, 1010);
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_ANA_COMBOPA_CTL,
>> +					      0x40, 0x40);
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_DIG_SWR_PDM_WD_CTL0,
>> +					      0x03, 0x03);
>> +		break;
>> +	case SND_SOC_DAPM_POST_PMU:
>> +		usleep_range(5000, 5010);
>> +
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_ANA_COMBOPA_CTL_4,
>> +					      0x0F, 0x04);
>> +		enable_irq(pm4125->hphl_pdm_wd_int);
>> +		break;
>> +	case SND_SOC_DAPM_PRE_PMD:
>> +		disable_irq_nosync(pm4125->hphl_pdm_wd_int);
>> +		break;
>> +	case SND_SOC_DAPM_POST_PMD:
>> +		usleep_range(2000, 2010);
>> +
> Empty lining is really not consistent across the code, either use it
> consistently or not use it at all.

Ok.


[...]

>> +static int pm4125_enable_rx1(struct snd_soc_dapm_widget *w,
>> +			     struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_component *component =3D
>> +					snd_soc_dapm_to_component(w->dapm);
>> +
>> +	if (event =3D=3D SND_SOC_DAPM_POST_PMD)
>> +		pm4125_rx_clk_disable(component);
>
> if we convert the rx clk into dapm, then things will be inplace
> automatically and you do not do this kinda handling.

Thanks. I need to check this.

>> +
>> +	return 0;
>> +}
>> +
>> +static int pm4125_enable_rx2(struct snd_soc_dapm_widget *w,
>> +			     struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_component *component =3D
>> +					snd_soc_dapm_to_component(w->dapm);
>> +
>> +	if (event =3D=3D SND_SOC_DAPM_POST_PMD)
>> +		pm4125_rx_clk_disable(component);
>> +
>> +	return 0;
>> +}
>
> This function is duplicate of pm4125_enable_rx1()...

Heh. Ok.

>> +static int pm4125_get_micb_vout_ctl_val(u32 micb_mv)
>> +{
>> +	if (micb_mv < 1600 || micb_mv > 2850) {
>> +		pr_err("Unsupported micbias voltage (%u mV)\n", micb_mv);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return (micb_mv - 1600) / 50;
>> +}
>> +
>> +static int pm4125_codec_enable_adc(struct snd_soc_dapm_widget *w,
>> +				   struct snd_kcontrol *kcontrol, int event)
>> +{
> Lets add the code needed for ADC in next spin.

Yes.


>> +static int pm4125_codec_enable_dmic(struct snd_soc_dapm_widget *w,
>> +				    struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_component *component =3D
>> +					snd_soc_dapm_to_component(w->dapm);
>> +	u16 dmic_clk_reg;
>> +
>> +	switch (w->shift) {
>> +	case 0:
>> +	case 1:
> Can we use proper names here, instead of 1 and 0, can we use
> PM4125_DMIC0, PM4125_DMIC1 ?


Okay.


>> +		dmic_clk_reg =3D PM4125_DIG_SWR_CDC_DMIC1_CTL;
> Also why can not we pass this as reg to the widget? then you can avoid
> all this switch caseing.


No idea. Let me check if I'll be able to fix that.


>> +		break;
>> +	default:
>> +		dev_err(component->dev, "Invalid DMIC selection\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	switch (event) {
>> +	case SND_SOC_DAPM_PRE_PMU:
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_DIG_SWR_CDC_AMIC_CTL,
>> +					      0x02, 0x00);
>> +		snd_soc_component_update_bits(component,
>> +					      dmic_clk_reg,
>> +					      0x08, 0x08);
>> +		break;
>> +	case SND_SOC_DAPM_POST_PMD:
>> +		snd_soc_component_update_bits(component,
>> +					      dmic_clk_reg,
>> +					      0x08, 0x00);
>> +		snd_soc_component_update_bits(component,
>> +					      PM4125_DIG_SWR_CDC_AMIC_CTL,
>> +					      0x02, 0x02);
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pm4125_micbias_control(struct snd_soc_component *component,
>> +				  int micb_num, int req, bool is_dapm)
>> +{
> Lets implement this in v2.


Yes, agree.


>> +static int __pm4125_codec_enable_micbias(struct snd_soc_dapm_widget *w,
>> +					 int event)
>> +{
>> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->d=
apm);
>> +	int micb_num =3D w->shift;
>> +
>> +	switch (event) {
>> +	case SND_SOC_DAPM_PRE_PMU:
>> +		pm4125_micbias_control(component, micb_num,
>> +				       MICB_ENABLE, true);
> MICBIAS 3 needs internal LDO pull up, as we can not connect it to
> vairable voltage.


Are we missing some code here? Maybe let's see if we can add it then?


>> +		break;
>> +	case SND_SOC_DAPM_POST_PMU:
>> +		usleep_range(1000, 1100);
>> +		break;
>> +	case SND_SOC_DAPM_POST_PMD:
>> +		pm4125_micbias_control(component, micb_num,
>> +					MICB_DISABLE, true);
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pm4125_codec_enable_micbias(struct snd_soc_dapm_widget *w,
>> +				       struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	return __pm4125_codec_enable_micbias(w, event);
> Why do we need this boiler plate, same comment applies to other parts of
> the code too.

I tried to make a minimal working version (that doesn't horribly fail) that
we're going to update with more patches during next submission.


[..]

>> +static const struct snd_kcontrol_new hph_type_detect_controls[] =3D {
>> +	SOC_SINGLE_EXT("HPH Type", 0, 0, WCD_MBHC_HPH_STEREO, 0, NULL, NULL),
>> +};
>> +
>> +static const struct snd_kcontrol_new impedance_detect_controls[] =3D {
>> +	SOC_SINGLE_EXT("HPHL Impedance", 0, 0, INT_MAX, 0, NULL, NULL),
>> +	SOC_SINGLE_EXT("HPHR Impedance", 0, 1, INT_MAX, 0, NULL, NULL),
>
> What are these supposed to read?


Erm, nothing at this point? It is a stub for future changes.


>> +static void pm4125_mbhc_mbhc_bias_control(struct snd_soc_component *com=
ponent,
>> +					  bool enable)
>> +{
>> +	snd_soc_component_update_bits(component, PM4125_ANA_MBHC_ELECT, 0x01,
>> +				      enable ? 0x01 : 0x00);
>> +}
>> +
>> +static void pm4125_mbhc_program_btn_thr(struct snd_soc_component *compo=
nent,
>> +					int *btn_low, int *btn_high,
>> +					int num_btn, bool is_micbias)
>> +{
>> +	int i, vth;
>> +
>> +	if (num_btn > WCD_MBHC_DEF_BUTTONS) {
>> +		dev_err(component->dev, "%s: invalid number of buttons: %d\n",
>> +			__func__, num_btn);
>> +		return;
>> +	}
>> +
>> +	for (i =3D 0; i < num_btn; i++) {
>> +		vth =3D ((btn_high[i] * 2) / 25) & 0x3F;
>> +		snd_soc_component_write_field(component,
>> +					PM4125_ANA_MBHC_BTN0_ZDET_VREF1 + i,
>> +					0xfc, vth << 2);
>> +	}
>> +}
>> +
>> +static const struct wcd_mbhc_cb mbhc_cb =3D {
>> +	.clk_setup =3D NULL,
>> +	.mbhc_bias =3D pm4125_mbhc_mbhc_bias_control,
>> +	.set_btn_thr =3D pm4125_mbhc_program_btn_thr,
>> +	.micbias_enable_status =3D NULL,
>> +	.hph_pull_up_control_v2 =3D NULL,
>> +	.mbhc_micbias_control =3D NULL,
>> +	.mbhc_micb_ramp_control =3D NULL,
>> +	.mbhc_micb_ctrl_thr_mic =3D NULL,
>> +	.compute_impedance =3D NULL,
>> +	.mbhc_gnd_det_ctrl =3D NULL,
>> +	.hph_pull_down_ctrl =3D NULL,
>> +	.mbhc_moisture_config =3D NULL,
>> +	.mbhc_get_moisture_status =3D NULL,
>> +	.mbhc_moisture_polling_ctrl =3D NULL,
>> +	.mbhc_moisture_detect_en =3D NULL,
> Either we add mbhc or not, having these dummy functions is not really
> helping.


Okay, then I can remove it then.


[...]


>> +static bool pm4125_swap_gnd_mic(struct snd_soc_component *component)
>> +{
>> +	return true;
>
> why true all the time? Isn't this suppose to control a mux or a gpio?


I can see if I can remove it or let me know if you have code that implement=
s
this. It was supposed to be a stub.


[...]

>> diff --git a/sound/soc/codecs/pm4125.h b/sound/soc/codecs/pm4125.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..2c5e8218202d92a0adc49341=
3368991a406471b0
>> --- /dev/null
>> +++ b/sound/soc/codecs/pm4125.h
>> @@ -0,0 +1,375 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only
>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights =
reserved.
>> + */
>> +
>> +#ifndef _PM4125_REGISTERS_H
>> +#define _PM4125_REGISTERS_H
>> +
>> +#include <linux/soundwire/sdw.h>
>> +#include <linux/soundwire/sdw_type.h>
>> +
>> +#define PM4125_ANA_BASE_ADDR	0x3000
>> +#define PM4125_DIG_BASE_ADDR	0x3400
>> +
>> +#define PM4125_REG(reg)	((reg > PM4125_DIG_BASE_ADDR) ? \
>> +			 (reg - PM4125_DIG_BASE_ADDR) : \
>> +			 (reg - PM4125_ANA_BASE_ADDR))
>> +
>> +enum {
>> +	REG_NO_ACCESS,
>> +	RD_REG,
>> +	WR_REG,
>> +	RD_WR_REG
>> +};
>> +
> Both PM4125_REG(), and RD/WR_REG does not make sense, please use the
> registers directly in the regmap config callbacks.


Yes, okay.


> ...
>> +#define PM4125_MAX_MICBIAS			3
>> +#define PM4125_MAX_BULK_SUPPLY			4
>> +#define PM4125_MAX_SWR_CH_IDS			15
>> +#define PM4125_SWRM_CH_MASK(ch_idx)		BIT(ch_idx - 1)
>> +
>> +enum pm4125_tx_sdw_ports {
>> +	PM4125_ADC_1_PORT =3D 1,
>> +	PM4125_DMIC_0_3_MBHC_PORT,
>> +	PM4125_MAX_TX_SWR_PORTS =3D PM4125_DMIC_0_3_MBHC_PORT,
>> +};
>> +
>> +enum pm4125_rx_sdw_ports {
>> +	PM4125_HPH_PORT =3D 1,
>> +	PM4125_COMP_PORT,
>> +	PM4125_MAX_SWR_PORTS =3D PM4125_COMP_PORT,
>> +};
>> +
>> +struct pm4125_sdw_ch_info {
>> +	int port_num;
>> +	unsigned int ch_mask;
>> +	unsigned int master_ch_mask;
>> +};
>> +
>> +#define WCD_SDW_CH(id, pn, cmask)	\
>> +	[id] =3D {			\
>> +		.port_num =3D pn,		\
>> +		.ch_mask =3D cmask,	\
>> +		.master_ch_mask =3D cmask,	\
>> +	}
>> +
>> +struct pm4125_priv;
>> +struct pm4125_sdw_priv {
>> +	struct sdw_slave *sdev;
>> +	struct sdw_stream_config sconfig;
>> +	struct sdw_stream_runtime *sruntime;
>> +	struct sdw_port_config port_config[PM4125_MAX_SWR_PORTS];
>> +	struct pm4125_sdw_ch_info *ch_info;
>> +	bool port_enable[PM4125_MAX_SWR_CH_IDS];
>> +	unsigned int master_channel_map[SDW_MAX_PORTS];
>> +	int active_ports;
>> +	int num_ports;
>> +	bool is_tx;
>> +	struct pm4125_priv *pm4125;
>> +	struct irq_domain *slave_irq;
>> +	struct regmap *regmap;
>> +};
>> +
>> +#if IS_ENABLED(CONFIG_SND_SOC_PM4125_SDW)
>> +int pm4125_sdw_free(struct pm4125_sdw_priv *pm4125,
>> +		    struct snd_pcm_substream *substream,
>> +		    struct snd_soc_dai *dai);
>> +int pm4125_sdw_set_sdw_stream(struct pm4125_sdw_priv *pm4125,
>> +			      struct snd_soc_dai *dai,
>> +			      void *stream, int direction);
>> +int pm4125_sdw_hw_params(struct pm4125_sdw_priv *pm4125,
>> +			 struct snd_pcm_substream *substream,
>> +			 struct snd_pcm_hw_params *params,
>> +			 struct snd_soc_dai *dai);
>> +
>> +struct device *pm4125_sdw_device_get(struct device_node *np);
>> +
>> +#else
>> +int pm4125_sdw_free(struct pm4125_sdw_priv *pm4125,
> Should this be static inline, if not you will endup with multiple
> defination of the function.
> same for other stubs too.

Thanks, I'll check that.


>> +		    struct snd_pcm_substream *substream,
>> +		    struct snd_soc_dai *dai)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +int pm4125_sdw_set_sdw_stream(struct pm4125_sdw_priv *pm4125,
>> +			      struct snd_soc_dai *dai,
>> +			      void *stream, int direction)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +int pm4125_sdw_hw_params(struct pm4125_sdw_priv *pm4125,
>> +			 struct snd_pcm_substream *substream,
>> +			 struct snd_pcm_hw_params *params,
>> +			 struct snd_soc_dai *dai)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +#endif
>> +
>> +enum {
>> +	/* INTR_CTRL_INT_MASK_0 */
>> +	PM4125_IRQ_MBHC_BUTTON_PRESS_DET =3D 0,
>> +	PM4125_IRQ_MBHC_BUTTON_RELEASE_DET,
>> +	PM4125_IRQ_MBHC_ELECT_INS_REM_DET,
>> +	PM4125_IRQ_MBHC_ELECT_INS_REM_LEG_DET,
>> +	PM4125_IRQ_MBHC_SW_DET,
>> +	PM4125_IRQ_HPHR_OCP_INT,
>> +	PM4125_IRQ_HPHR_CNP_INT,
>> +	PM4125_IRQ_HPHL_OCP_INT,
>> +
>> +	/* INTR_CTRL_INT_MASK_1 */
>> +	PM4125_IRQ_HPHL_CNP_INT,
>> +	PM4125_IRQ_EAR_CNP_INT,
>> +	PM4125_IRQ_EAR_SCD_INT,
>> +	PM4125_IRQ_AUX_CNP_INT,
>> +	PM4125_IRQ_AUX_SCD_INT,
>> +	PM4125_IRQ_HPHL_PDM_WD_INT,
>> +	PM4125_IRQ_HPHR_PDM_WD_INT,
>> +	PM4125_IRQ_AUX_PDM_WD_INT,
>> +
>> +	/* INTR_CTRL_INT_MASK_2 */
>> +	PM4125_IRQ_LDORT_SCD_INT,
>> +	PM4125_IRQ_MBHC_MOISTURE_INT,
>> +	PM4125_IRQ_HPHL_SURGE_DET_INT,
>> +	PM4125_IRQ_HPHR_SURGE_DET_INT,
>> +	PM4125_NUM_IRQS,
>> +};
>> +
>> +enum pm4125_tx_sdw_channels {
>> +	PM4125_ADC1,
>> +	PM4125_ADC2,
>> +	PM4125_ADC3,
>> +	PM4125_DMIC0,
>> +	PM4125_DMIC1,
>> +	PM4125_MBHC,
>> +	PM4125_DMIC2,
>> +	PM4125_DMIC3,
>> +	PM4125_DMIC4,
>> +	PM4125_DMIC5,
>> +	PM4125_DMIC6,
> do we really have so many channels on TX, AFAIU, its only 2 channels and
> two lanes.
>> +};
>> +
>> +enum pm4125_rx_sdw_channels {
>> +	PM4125_HPH_L,
>> +	PM4125_HPH_R,
>> +	PM4125_CLSH,
>> +	PM4125_COMP_L,
>> +	PM4125_COMP_R,
>> +	PM4125_LO,
>> +	PM4125_DSD_R,
>> +	PM4125_DSD_L,
> Do we have so many channes? AFAIU, this is only 4 channels and 1 lane.

I thought it is 2 or 4 channels and 2 lanes for rx.
But for tx it is 2 channels and 1 lane.

Anyways, this needs to be fixed.

Thank you for your comments.

Best regards,
Alexey

