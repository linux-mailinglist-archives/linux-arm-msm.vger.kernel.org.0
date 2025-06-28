Return-Path: <linux-arm-msm+bounces-62922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD8CAECA40
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 22:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A01F7A5904
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 20:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B3225C827;
	Sat, 28 Jun 2025 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LMb9UkE5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2443C221FCD
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 20:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751142261; cv=none; b=kWi9+zaHqIVPU8t0raus6BmTLinFuDL4848jlkm6pgVEeb1rPPRsxti9JUkUVrc+J+ONMW7m+O6PnMRUw9bRlteTOeRS292lDV9BQo1YEP4DVkIHfpM+ZP+fvGWx1/XVdmxcxHZI+3LFEYgpFuiFlBoRZqgMr+Y7vl2Pn14Rbpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751142261; c=relaxed/simple;
	bh=8gdecDXnG6cU5IKCi4OgHyNsNET60nAw4Noa5uFKKLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhRmizwv+cSFZ5QpJNe1i5YtfNsuqn/fdjaWVxvIqO33t6Ng9UTOWqlDKLWHdl6G460JKYUPRmw//qirJ289jlClUinqp3qwjRrfpv2YCzahk3optFULqsieAlru/ZYigfFBxT8ArplG5X/jNUQ/GSikF9NJHHRwxDgpuByuYNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LMb9UkE5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SCQlx2004594
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 20:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mpOz3yuvtvcwZVxQnTkI6bIQKXvzeNUmNhtfGI4YBsQ=; b=LMb9UkE5jMjv1W/A
	Xua2oSFDp7d0F5AQfcjWnW5kxNZFuCA8D5HMEJnA37nygU4Wz/SSBx3tzmjm0BER
	4Lov6GIuo3eLq32WJXpTAP8yyHfccIli8nRW/o+kCQUTr3CGXJzkJvfhR2wUfeUn
	CGSZmKgLW/OaCjZVurzzv/U0NkioRIDSmJr2CGhbPp7L1EIvMmpAoIA8EX9KK6u+
	ogL2FNxgU7rK60/F94pXZoK6CZApCEM1KDnbXZXJs+x4jfhOQjx/rKzRZb4p2jao
	1p98/RYWoqLkJrE62Miiwm+9IUASDHNYJrLFj4BW127N0mVNgJfORx9B3XpgzSW5
	JsWk+w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm189f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 20:24:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb1f84a448so9088116d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 13:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751142254; x=1751747054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mpOz3yuvtvcwZVxQnTkI6bIQKXvzeNUmNhtfGI4YBsQ=;
        b=BSbSygxMEDNSvpFOGz5gAHYnqB34qalBQo18HIIWdbHwyqsWrqzCQRfMFh9NAaXaPe
         Owu3llV2j7ydRV9Q/+FW7bNJQxAzwho4p0rxWG6a+zkOPPFFf8LaCSVS7OfDW4gzrjtK
         FLynx1Uzwim92ECVOnSxG3j7JdJRnUqLOAXmt6yyhyuzy7Rg4AuefuMnVpFNSMBhe5+M
         CYtkiKXVuW7QJ07A4J2nX5YmiQHBP141mG2nsq5c7yz/INf1F+g+sD/OrYMtvLal26to
         yOWbAnHHX5FdWa727w9oRDDDdT0VlfATX8fp6n5c8j9CmDHOYNa3wm2XDROzv6Jn2HNP
         BS4g==
X-Forwarded-Encrypted: i=1; AJvYcCVFK7PXknNokg/oUXAjAHLWEwEfnUwlYpGnXftfpdUitdZyfwyNuICzJEIt3j3NL+IDN9H7MbmdGDhYjb2o@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs2ENaVymDhc6YoMlgyJgmsVYdV91ae77JCvQG4ZxN78VOkzuF
	6dQb3mwNnn8ln1FrpC2Njh+XGh5DwPTFA1BAdQHKt00x65xlwfMVRPIWovaO0HancixUTQNZwio
	VNi8ErscTrroLveW7CEqHkoYzBHUqLjzqoAo+mAxP8rH91cjKC1FOSpHFzEDg+U2tgmYr
X-Gm-Gg: ASbGnctUnP07LuLXKZqvxSNMP2jUA2DYHn3IOYLVK5J9mR1224lFxLnVczTvpMxCzUu
	gtmoaI697DJ+vCuFzJYNxBCL4Y+PFNFaW3yCGDnsgA6TukzYI/gKaIpKVToaZOF0ehewXiEEXc3
	KnVyCvAcrWI3Dv+EnTlHVj0npMFnqHQWGUBuOi6Vfb2ZM+wTO1tAmnWx7ap9uGdzyeSGkfDxhsw
	BOr2LFy+ewnEQGFa1CYTwdv+oJvzOHDA8OivkqQP54O0fxbVb+Uy0SG4mHQBHPVeOvQxXKj9vOL
	w+1lAcVpFzDqrIu/awxJAb8349m26cVWitmw+eN/ChMdoMHs
X-Received: by 2002:a05:620a:4547:b0:7d3:e931:17e3 with SMTP id af79cd13be357-7d4439fb9d1mr944853485a.42.1751142253522;
        Sat, 28 Jun 2025 13:24:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9DAkm//IYdpoP4JbKng4B3Lh+d1bYk7L/HoBjUZKs/PT8b15EcvZvT9+2HMCcqexgUoXS+g==
X-Received: by 2002:a05:620a:4547:b0:7d3:e931:17e3 with SMTP id af79cd13be357-7d4439fb9d1mr944849285a.42.1751142252541;
        Sat, 28 Jun 2025 13:24:12 -0700 (PDT)
Received: from [192.168.68.102] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a892e529c5sm6167281f8f.63.2025.06.28.13.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 13:24:11 -0700 (PDT)
Message-ID: <00b63483-8012-4a04-9486-536a7b236497@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 21:24:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: codecs: add new pm4125 audio codec driver
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-3-e52933c429a0@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250626-pm4125_audio_codec_v1-v1-3-e52933c429a0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68604f6f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=KQ6Ie6V8oocTXoA0KxQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7oJUZcYPzLke848rL_40dJ6VPT5u-sS8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE3MSBTYWx0ZWRfX6h4aCBSnNbEG
 0941+1/dnuICe1pBHyKWukykG2shb8Y6DWSG90uB7NP0Zz0643h+6rQKj04VbpKG8NmJxtPZae/
 tVe7G4s4Pq1lBQivFRcabnnHN4Eaglob6ZUBj5fTUlLc4TFNQmO2w1H3LPLXOzYqy0mRSYY+RXV
 ocMNzPFR83hU7Ia8iTQHy0B2OdmBTNmOCEbPqRbVpW0XUobyJiLq9ZsaX0Dww1IMGvAH4gziGMM
 nZdkPbWYz9yY2ClfWtlqyCwaYSbqf5pmxhV9NixOR9WO+rB5TLoGkqVczYfRH7lt2I+Zh0OaDdq
 rtnMZ6djyy1wHKgxPIJS8BvcZx0Byn1HNv5tbyH/ApY46MODhTct1j48t4kegfhPmZCn/qWooah
 z9JuTagW5nJcQPX2/WMsd3LBFdaGkBFQVDUw0tjNrAH8HLUd4wMYzsVT9YatTMNZl1ERvksV
X-Proofpoint-GUID: 7oJUZcYPzLke848rL_40dJ6VPT5u-sS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280171

On 6/26/25 12:50 AM, Alexey Klimov wrote:
> The audio codec is found in Qualcomm PM2250/PM4125 PMICs and is used on
> platforms like Qualcomm QCM2290. It has soundwire interface and
> corresponding RX and TX slave devices.
> 
> It has only two input channels: HPH left and right. The line output (LO)
> is linked to HPHL so the hardware has some limitations regarding concurrent
> playback via HPH and LO for instance.
> 
> Not all functionality is implemented and there are some number of
> placeholders. Mostly output functionality like analog and digital mics is
> missing at this point and implemented in a possible minimal way.
> The codec driver also uses WCD MBCH framework. The MBHC functionality is
> also implemented in a minimalistic way to enable IRQs.

Lets try to fill these gaps in next version, I have tested Headset,
Lineout  and MIC on my side with additional changes to this.

> 
> Despite all limitations in its current state the line out and HPH playback
> work.

Thanks Alexey for all the work porting the driver from downstream audio
kernel.

my comments below.

> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/codecs/Kconfig      |   19 +
>  sound/soc/codecs/Makefile     |    8 +
>  sound/soc/codecs/pm4125-sdw.c |  485 +++++++++++
>  sound/soc/codecs/pm4125.c     | 1848 +++++++++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/pm4125.h     |  375 +++++++++
>  5 files changed, 2735 insertions(+)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 6d7e4725d89cd33647770e4f2c4e81445b8335ce..69b08021d165f83f4a7ca18e476cfc7e2473f490 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -297,6 +297,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_WCD937X_SDW
>  	imply SND_SOC_WCD938X_SDW
>  	imply SND_SOC_WCD939X_SDW
> +	imply SND_SOC_PM4125_SDW
>  	imply SND_SOC_LPASS_MACRO_COMMON
>  	imply SND_SOC_LPASS_RX_MACRO
>  	imply SND_SOC_LPASS_TX_MACRO
> @@ -2316,6 +2317,24 @@ config SND_SOC_WCD939X_SDW
>  	  The WCD9390/9395 is a audio codec IC Integrated in
>  	  Qualcomm SoCs like SM8650.
>  
> +config SND_SOC_PM4125
> +	depends on SND_SOC_PM4125_SDW
> +	tristate
> +	depends on SOUNDWIRE || !SOUNDWIRE
> +	select SND_SOC_WCD_CLASSH
> +
> +config SND_SOC_PM4125_SDW
> +	tristate "PM4125 audio codec - SDW"
> +	select SND_SOC_PM4125
> +	select SND_SOC_WCD_MBHC
> +	select REGMAP_IRQ
> +	depends on SOUNDWIRE
> +	select REGMAP_SOUNDWIRE
> +	help
> +	  The PMIC PM4125 has an in-built audio codec IC used with SoCs
> +	  like QCM2290, and it is connected via soundwire and SPMI.
> +	  To compile this codec driver say Y or m.
> +
>  config SND_SOC_WL1273
>  	tristate
>  
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index a68c3d192a1b6ccec513c6bc447c29be532ea70c..e993cc9803c4da60daf230a8181673b45c06aa5b 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -348,6 +348,8 @@ snd-soc-wcd938x-y := wcd938x.o
>  snd-soc-wcd938x-sdw-y := wcd938x-sdw.o
>  snd-soc-wcd939x-y := wcd939x.o
>  snd-soc-wcd939x-sdw-y := wcd939x-sdw.o
> +snd-soc-pm4125-y := pm4125.o
> +snd-soc-pm4125-sdw-y := pm4125-sdw.o
>  snd-soc-wl1273-y := wl1273.o
>  snd-soc-wm-adsp-y := wm_adsp.o
>  snd-soc-wm0010-y := wm0010.o
> @@ -779,6 +781,12 @@ ifdef CONFIG_SND_SOC_WCD939X_SDW
>  # avoid link failure by forcing sdw code built-in when needed
>  obj-$(CONFIG_SND_SOC_WCD939X) += snd-soc-wcd939x-sdw.o
>  endif
> +obj-$(CONFIG_SND_SOC_PM4125_SDW) += snd-soc-pm4125-sdw.o
> +obj-$(CONFIG_SND_SOC_PM4125)   += snd-soc-pm4125.o
> +ifdef CONFIG_SND_SOC_PM4125_SDW
> +# avoid link failure by forcing sdw code built-in when needed
> +obj-$(CONFIG_SND_SOC_PM4125) += snd-soc-pm4125-sdw.o
> +endif
>  obj-$(CONFIG_SND_SOC_WL1273)	+= snd-soc-wl1273.o
>  obj-$(CONFIG_SND_SOC_WM0010)	+= snd-soc-wm0010.o
>  obj-$(CONFIG_SND_SOC_WM1250_EV1) += snd-soc-wm1250-ev1.o
> diff --git a/sound/soc/codecs/pm4125-sdw.c b/sound/soc/codecs/pm4125-sdw.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d09c4f5fb3b7b7918a1a0c25750046b212f1063f
> --- /dev/null
> +++ b/sound/soc/codecs/pm4125-sdw.c
> @@ -0,0 +1,485 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> +// Copyright, 2025 Linaro Ltd
> +
> +#include <linux/component.h>
> +#include <linux/device.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_registers.h>
> +#include <linux/soundwire/sdw_type.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/soc.h>
> +#include "pm4125.h"
> +
> +static struct pm4125_sdw_ch_info pm4125_sdw_rx_ch_info[] = {
> +	WCD_SDW_CH(PM4125_HPH_L, PM4125_HPH_PORT, BIT(0)),
> +	WCD_SDW_CH(PM4125_HPH_R, PM4125_HPH_PORT, BIT(1)),
> +	WCD_SDW_CH(PM4125_COMP_L, PM4125_COMP_PORT, BIT(0)),
> +	WCD_SDW_CH(PM4125_COMP_R, PM4125_COMP_PORT, BIT(1)),
> +};
> +
> +static struct pm4125_sdw_ch_info pm4125_sdw_tx_ch_info[] = {
> +	WCD_SDW_CH(PM4125_ADC1, PM4125_ADC_1_PORT, BIT(0)),
> +	WCD_SDW_CH(PM4125_DMIC0, PM4125_DMIC_0_3_MBHC_PORT, BIT(0)),
> +	WCD_SDW_CH(PM4125_DMIC1, PM4125_DMIC_0_3_MBHC_PORT, BIT(1)),
> +	WCD_SDW_CH(PM4125_DMIC2, PM4125_DMIC_0_3_MBHC_PORT, BIT(2)),
these does not look correct. there are 2 ADCs .
> +};
> +
> +static struct sdw_dpn_prop pm4125_dpn_prop[PM4125_MAX_SWR_PORTS] = {
> +	{
> +		.num = 1,
> +		.type = SDW_DPN_SIMPLE,
> +		.min_ch = 1,
> +		.max_ch = 8,
> +		.simple_ch_prep_sm = true,
> +	}, {
> +		.num = 2,
> +		.type = SDW_DPN_SIMPLE,
> +		.min_ch = 1,
> +		.max_ch = 4,
> +		.simple_ch_prep_sm = true,
> +	}
> +};
> +
> +struct device *pm4125_sdw_device_get(struct device_node *np)
> +{
> +	return bus_find_device_by_of_node(&sdw_bus_type, np);
> +}
> +EXPORT_SYMBOL_GPL(pm4125_sdw_device_get);
> +
> +int pm4125_sdw_hw_params(struct pm4125_sdw_priv *priv,
> +			 struct snd_pcm_substream *substream,
> +			 struct snd_pcm_hw_params *params,
> +			 struct snd_soc_dai *dai)
> +{
> +	struct sdw_port_config port_config[PM4125_MAX_SWR_PORTS];
> +	unsigned long ch_mask;
> +	int i, j;
> +
> +	priv->sconfig.ch_count = 1;
> +	priv->active_ports = 0;
> +	for (i = 0; i < PM4125_MAX_SWR_PORTS; i++) {
> +		ch_mask = priv->port_config[i].ch_mask;
> +		if (!ch_mask)
> +			continue;
> +
> +		for_each_set_bit(j, &ch_mask, 4)
> +			priv->sconfig.ch_count++;
> +
> +		port_config[priv->active_ports] = priv->port_config[i];
> +		priv->active_ports++;
> +	}
> +
> +	priv->sconfig.bps = 1;
> +	priv->sconfig.frame_rate = params_rate(params);
> +	priv->sconfig.direction =
> +		priv->is_tx ? SDW_DATA_DIR_TX : SDW_DATA_DIR_RX;
> +	priv->sconfig.type = SDW_STREAM_PCM;
> +
> +	return sdw_stream_add_slave(priv->sdev, &priv->sconfig,
> +				    &port_config[0], priv->active_ports,
> +				    priv->sruntime);
> +}
> +EXPORT_SYMBOL_GPL(pm4125_sdw_hw_params);
> +
> +static int pm4125_update_status(struct sdw_slave *slave,
> +				enum sdw_slave_status status)
> +{
> +	struct pm4125_sdw_priv *priv = dev_get_drvdata(&slave->dev);
> +
> +	if (priv->regmap && status == SDW_SLAVE_ATTACHED) {
> +		/*
> +		 * Write out any cached changes that happened between
> +		 * probe and attach
> +		 */
> +		regcache_cache_only(priv->regmap, false);
> +		return regcache_sync(priv->regmap);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Handle Soundwire out-of-band interrupt event by triggering
> + * the first irq of the slave_irq irq domain, which then will
> + * be handled by the regmap_irq threaded irq.
> + * Looping is to ensure no interrupts were missed in the process.
> + */
> +static int pm4125_interrupt_callback(struct sdw_slave *slave,
> +				     struct sdw_slave_intr_status *status)
> +{
> +	struct pm4125_sdw_priv *priv = dev_get_drvdata(&slave->dev);
> +	struct irq_domain *slave_irq = priv->slave_irq;
> +	u32 sts1, sts2, sts3;
> +
> +	do {
> +		handle_nested_irq(irq_find_mapping(slave_irq, 0));
> +		regmap_read(priv->regmap, PM4125_DIG_SWR_INTR_STATUS_0, &sts1);
> +		regmap_read(priv->regmap, PM4125_DIG_SWR_INTR_STATUS_1, &sts2);
> +		regmap_read(priv->regmap, PM4125_DIG_SWR_INTR_STATUS_2, &sts3);
> +
> +	} while (sts1 || sts2 || sts3);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct reg_default pm4125_defaults[] = {
> +	{ PM4125_ANA_MICBIAS_MICB_1_2_EN,        0x01 },
> +	{ PM4125_ANA_MICBIAS_MICB_3_EN,          0x00 },
> +	{ PM4125_ANA_MICBIAS_LDO_1_SETTING,      0x21 },
> +	{ PM4125_ANA_MICBIAS_LDO_1_CTRL,         0x01 },
> +	{ PM4125_ANA_TX_AMIC1,                   0x00 },
> +	{ PM4125_ANA_TX_AMIC2,                   0x00 },
> +	{ PM4125_ANA_MBHC_MECH,                  0x39 },
> +	{ PM4125_ANA_MBHC_ELECT,                 0x08 },
> +	{ PM4125_ANA_MBHC_ZDET,                  0x10 },
> +	{ PM4125_ANA_MBHC_RESULT_1,              0x00 },
> +	{ PM4125_ANA_MBHC_RESULT_2,              0x00 },
> +	{ PM4125_ANA_MBHC_RESULT_3,              0x00 },
> +	{ PM4125_ANA_MBHC_BTN0_ZDET_VREF1,       0x00 },
> +	{ PM4125_ANA_MBHC_BTN1_ZDET_VREF2,       0x10 },
> +	{ PM4125_ANA_MBHC_BTN2_ZDET_VREF3,       0x20 },
> +	{ PM4125_ANA_MBHC_BTN3_ZDET_DBG_400,     0x30 },
> +	{ PM4125_ANA_MBHC_BTN4_ZDET_DBG_1400,    0x40 },
> +	{ PM4125_ANA_MBHC_MICB2_RAMP,            0x00 },
> +	{ PM4125_ANA_MBHC_CTL_1,                 0x02 },
> +	{ PM4125_ANA_MBHC_CTL_2,                 0x05 },
> +	{ PM4125_ANA_MBHC_PLUG_DETECT_CTL,       0xE9 },
> +	{ PM4125_ANA_MBHC_ZDET_ANA_CTL,          0x0F },
> +	{ PM4125_ANA_MBHC_ZDET_RAMP_CTL,         0x00 },
> +	{ PM4125_ANA_MBHC_FSM_STATUS,            0x00 },
> +	{ PM4125_ANA_MBHC_ADC_RESULT,            0x00 },
> +	{ PM4125_ANA_MBHC_CTL_CLK,               0x30 },
> +	{ PM4125_ANA_MBHC_ZDET_CALIB_RESULT,     0x00 },
> +	{ PM4125_ANA_NCP_EN,                     0x00 },
> +	{ PM4125_ANA_NCP_VCTRL,                  0xA7 },
> +	{ PM4125_ANA_HPHPA_CNP_CTL_1,            0x54 },
> +	{ PM4125_ANA_HPHPA_CNP_CTL_2,            0x2B },
> +	{ PM4125_ANA_HPHPA_PA_STATUS,            0x00 },
> +	{ PM4125_ANA_HPHPA_FSM_CLK,              0x12 },
> +	{ PM4125_ANA_HPHPA_L_GAIN,               0x00 },
> +	{ PM4125_ANA_HPHPA_R_GAIN,               0x00 },
> +	{ PM4125_SWR_HPHPA_HD2,                  0x1B },
> +	{ PM4125_ANA_HPHPA_SPARE_CTL,            0x02 },
> +	{ PM4125_ANA_SURGE_EN,                   0x38 },
> +	{ PM4125_ANA_COMBOPA_CTL,                0x35 },
> +	{ PM4125_ANA_COMBOPA_CTL_4,              0x84 },
> +	{ PM4125_ANA_COMBOPA_CTL_5,              0x05 },
> +	{ PM4125_ANA_RXLDO_CTL,                  0x86 },
> +	{ PM4125_ANA_MBIAS_EN,                   0x00 },
> +	{ PM4125_DIG_SWR_CHIP_ID0,               0x00 },
> +	{ PM4125_DIG_SWR_CHIP_ID1,               0x00 },
> +	{ PM4125_DIG_SWR_CHIP_ID2,               0x0C },
> +	{ PM4125_DIG_SWR_CHIP_ID3,               0x01 },
> +	{ PM4125_DIG_SWR_SWR_TX_CLK_RATE,        0x00 },
> +	{ PM4125_DIG_SWR_CDC_RST_CTL,            0x03 },
> +	{ PM4125_DIG_SWR_TOP_CLK_CFG,            0x00 },
> +	{ PM4125_DIG_SWR_CDC_RX_CLK_CTL,         0x00 },
> +	{ PM4125_DIG_SWR_CDC_TX_CLK_CTL,         0x33 },
> +	{ PM4125_DIG_SWR_SWR_RST_EN,             0x00 },
> +	{ PM4125_DIG_SWR_CDC_RX_RST,             0x00 },
> +	{ PM4125_DIG_SWR_CDC_RX0_CTL,            0xFC },
> +	{ PM4125_DIG_SWR_CDC_RX1_CTL,            0xFC },
> +	{ PM4125_DIG_SWR_CDC_TX_ANA_MODE_0_1,    0x00 },
> +	{ PM4125_DIG_SWR_CDC_COMP_CTL_0,         0x00 },
> +	{ PM4125_DIG_SWR_CDC_RX_DELAY_CTL,       0x66 },
> +	{ PM4125_DIG_SWR_CDC_RX_GAIN_0,          0x55 },
> +	{ PM4125_DIG_SWR_CDC_RX_GAIN_1,          0xA9 },
> +	{ PM4125_DIG_SWR_CDC_RX_GAIN_CTL,        0x00 },
> +	{ PM4125_DIG_SWR_CDC_TX0_CTL,            0x68 },
> +	{ PM4125_DIG_SWR_CDC_TX1_CTL,            0x68 },
> +	{ PM4125_DIG_SWR_CDC_TX_RST,             0x00 },
> +	{ PM4125_DIG_SWR_CDC_REQ0_CTL,           0x01 },
> +	{ PM4125_DIG_SWR_CDC_REQ1_CTL,           0x01 },
> +	{ PM4125_DIG_SWR_CDC_RST,                0x00 },
> +	{ PM4125_DIG_SWR_CDC_AMIC_CTL,           0x02 },
> +	{ PM4125_DIG_SWR_CDC_DMIC_CTL,           0x00 },
> +	{ PM4125_DIG_SWR_CDC_DMIC1_CTL,          0x00 },
> +	{ PM4125_DIG_SWR_CDC_DMIC1_RATE,         0x01 },
> +	{ PM4125_DIG_SWR_PDM_WD_CTL0,            0x00 },
> +	{ PM4125_DIG_SWR_PDM_WD_CTL1,            0x00 },
> +	{ PM4125_DIG_SWR_INTR_MODE,              0x00 },
> +	{ PM4125_DIG_SWR_INTR_MASK_0,            0xFF },
> +	{ PM4125_DIG_SWR_INTR_MASK_1,            0x7F },
> +	{ PM4125_DIG_SWR_INTR_MASK_2,            0x0C },
> +	{ PM4125_DIG_SWR_INTR_STATUS_0,          0x00 },
> +	{ PM4125_DIG_SWR_INTR_STATUS_1,          0x00 },
> +	{ PM4125_DIG_SWR_INTR_STATUS_2,          0x00 },
> +	{ PM4125_DIG_SWR_INTR_CLEAR_0,           0x00 },
> +	{ PM4125_DIG_SWR_INTR_CLEAR_1,           0x00 },
> +	{ PM4125_DIG_SWR_INTR_CLEAR_2,           0x00 },
> +	{ PM4125_DIG_SWR_INTR_LEVEL_0,           0x00 },
> +	{ PM4125_DIG_SWR_INTR_LEVEL_1,           0x2A },
> +	{ PM4125_DIG_SWR_INTR_LEVEL_2,           0x00 },
> +	{ PM4125_DIG_SWR_CDC_CONN_RX0_CTL,       0x00 },
> +	{ PM4125_DIG_SWR_CDC_CONN_RX1_CTL,       0x00 },
> +	{ PM4125_DIG_SWR_LOOP_BACK_MODE,         0x00 },
> +	{ PM4125_DIG_SWR_DRIVE_STRENGTH_0,       0x00 },
> +	{ PM4125_DIG_SWR_DIG_DEBUG_CTL,          0x00 },
> +	{ PM4125_DIG_SWR_DIG_DEBUG_EN,           0x00 },
> +	{ PM4125_DIG_SWR_DEM_BYPASS_DATA0,       0x55 },
> +	{ PM4125_DIG_SWR_DEM_BYPASS_DATA1,       0x55 },
> +	{ PM4125_DIG_SWR_DEM_BYPASS_DATA2,       0x55 },
> +	{ PM4125_DIG_SWR_DEM_BYPASS_DATA3,       0x01 },
> +};
> +
> +static bool pm4125_rdwr_register(struct device *dev, unsigned int reg)
> +{
> +	if (reg > PM4125_ANA_BASE_ADDR &&
> +	    reg < PM4125_ANALOG_REGISTERS_MAX_SIZE)
> +		return pm4125_reg_access_analog[PM4125_REG(reg)] & WR_REG;
Lets not bring in some additional layer here from downstream, pl use the
registers directly here as we do for other codecs.

> +
> +	if (reg > PM4125_DIG_BASE_ADDR &&
> +	    reg < PM4125_DIGITAL_REGISTERS_MAX_SIZE)
> +		return pm4125_reg_access_digital[PM4125_REG(reg)] & WR_REG;
> +
> +	return false;
> +}
> +
> +static bool pm4125_readable_register(struct device *dev, unsigned int reg)
> +{
> +	if (reg > PM4125_ANA_BASE_ADDR &&
> +	    reg < PM4125_ANALOG_REGISTERS_MAX_SIZE)
> +		return pm4125_reg_access_analog[PM4125_REG(reg)] & RD_REG;
> +
> +	if (reg > PM4125_DIG_BASE_ADDR &&
> +	    reg < PM4125_DIGITAL_REGISTERS_MAX_SIZE)
> +		return pm4125_reg_access_digital[PM4125_REG(reg)] & RD_REG;
> +
> +	return pm4125_rdwr_register(dev, reg);
> +}
> +
> +static bool pm4125_volatile_register(struct device *dev, unsigned int reg)
> +{
> +
> +	if (reg > PM4125_ANA_BASE_ADDR &&
> +	    reg < PM4125_ANALOG_REGISTERS_MAX_SIZE)
> +		if ((pm4125_reg_access_analog[PM4125_REG(reg)] & RD_REG) &&
> +		     !(pm4125_reg_access_analog[PM4125_REG(reg)] & WR_REG))
> +			return true;
> +
> +	if (reg > PM4125_DIG_BASE_ADDR &&
> +	    reg < PM4125_DIGITAL_REGISTERS_MAX_SIZE)
> +		if ((pm4125_reg_access_digital[PM4125_REG(reg)] & RD_REG) &&
> +		     !(pm4125_reg_access_digital[PM4125_REG(reg)] & WR_REG))
> +			return true;
> +	return false;
> +}
> +
> +static const struct regmap_config pm4125_regmap_config = {
> +	.name = "pm4125_csr",
> +	.reg_bits = 32,
> +	.val_bits = 8,
> +	.cache_type = REGCACHE_MAPLE,
> +	.reg_defaults = pm4125_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(pm4125_defaults),
> +	.max_register = PM4125_MAX_REGISTER,
> +	.readable_reg = pm4125_readable_register,
> +	.writeable_reg = pm4125_rdwr_register,
> +	.volatile_reg = pm4125_volatile_register,
> +};
> +
> +static const struct sdw_slave_ops pm4125_slave_ops = {
> +	.update_status = pm4125_update_status,
> +	.interrupt_callback = pm4125_interrupt_callback,
> +};
> +
> +static int pm4125_sdw_component_bind(struct device *dev,
> +				     struct device *master, void *data)
> +{
> +	pm_runtime_set_autosuspend_delay(dev, 3000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +}
> +
> +static void pm4125_sdw_component_unbind(struct device *dev,
> +					struct device *master, void *data)
> +{
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +}
> +
> +static const struct component_ops pm4125_sdw_component_ops = {
> +	.bind = pm4125_sdw_component_bind,
> +	.unbind = pm4125_sdw_component_unbind,
> +};
> +
> +static int pm4125_probe(struct sdw_slave *pdev,
> +			const struct sdw_device_id *id)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct pm4125_sdw_priv *priv;
> +	u8 master_ch_mask[PM4125_MAX_SWR_CH_IDS];
> +	int master_ch_mask_size = 0;
> +	int ret, i;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Port map index starts at 0,
> +	 * however the data port for this codec start at index 1
> +	 */
> +	if (of_property_present(dev->of_node, "qcom,tx-port-mapping")) {
> +		priv->is_tx = true;
> +		ret = of_property_read_u32_array(dev->of_node,
> +						 "qcom,tx-port-mapping",
> +						 &pdev->m_port_map[1],
> +						 PM4125_MAX_TX_SWR_PORTS);
> +	} else {
> +		ret = of_property_read_u32_array(dev->of_node,
> +						 "qcom,rx-port-mapping",
> +						 &pdev->m_port_map[1],
> +						 PM4125_MAX_SWR_PORTS);
> +	}
> +	if (ret < 0)
> +		dev_info(dev, "Error getting static port mapping for %s (%d)\n",
> +			 priv->is_tx ? "TX" : "RX", ret);
> +
> +	priv->sdev = pdev;
> +	dev_set_drvdata(dev, priv);
> +
> +	pdev->prop.scp_int1_mask = SDW_SCP_INT1_IMPL_DEF |
> +				   SDW_SCP_INT1_BUS_CLASH |
> +				   SDW_SCP_INT1_PARITY;
> +	pdev->prop.lane_control_support = true;
> +	pdev->prop.simple_clk_stop_capable = true;
> +
> +	memset(master_ch_mask, 0, PM4125_MAX_SWR_CH_IDS);
> +
> +	if (priv->is_tx) {
> +		master_ch_mask_size =
> +			of_property_count_u8_elems(dev->of_node,
> +						   "qcom,tx-channel-mapping");
> +
> +		if (master_ch_mask_size)
> +			ret = of_property_read_u8_array(dev->of_node,
> +						"qcom,tx-channel-mapping",
> +						master_ch_mask,
> +						master_ch_mask_size);
> +	} else {
> +		master_ch_mask_size =
> +			of_property_count_u8_elems(dev->of_node,
> +						   "qcom,rx-channel-mapping");
> +
> +		if (master_ch_mask_size)
> +			ret = of_property_read_u8_array(dev->of_node,
> +						"qcom,rx-channel-mapping",
> +						master_ch_mask,
> +						master_ch_mask_size);
> +	}
> +
> +	if (ret < 0)
> +		dev_info(dev, "Static channel mapping not specified using device channel maps\n");
> +
> +	if (priv->is_tx) {
> +		pdev->prop.source_ports = GENMASK(PM4125_MAX_TX_SWR_PORTS, 0);
> +		pdev->prop.src_dpn_prop = pm4125_dpn_prop;
> +		priv->ch_info = &pm4125_sdw_tx_ch_info[0];
> +
> +		for (i = 0; i < master_ch_mask_size; i++)
> +			priv->ch_info[i].master_ch_mask =
> +					PM4125_SWRM_CH_MASK(master_ch_mask[i]);
> +
> +		pdev->prop.wake_capable = true;
> +
> +		priv->regmap = devm_regmap_init_sdw(pdev,
> +						    &pm4125_regmap_config);
we do have 100 chars per line, do not split the lines unless required.

> +		if (IS_ERR(priv->regmap))
> +			return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +					     "Regmap init failed\n");
> +
> +		/* Start in cache-only until device is enumerated */
> +		regcache_cache_only(priv->regmap, true);
> +	} else {
> +		pdev->prop.sink_ports = GENMASK(PM4125_MAX_SWR_PORTS - 1, 0);
> +		pdev->prop.sink_dpn_prop = pm4125_dpn_prop;
> +		priv->ch_info = &pm4125_sdw_rx_ch_info[0];
> +
> +		for (i = 0; i < master_ch_mask_size; i++)
> +			priv->ch_info[i].master_ch_mask =
> +					PM4125_SWRM_CH_MASK(master_ch_mask[i]);
> +	}
> +
> +	ret = component_add(dev, &pm4125_sdw_component_ops);
> +	if (ret)
> +		return ret;
> +
> +	/* Set suspended until aggregate device is bind */
> +	pm_runtime_set_suspended(dev);
> +
> +	return 0;
> +}
> +
> +static int pm4125_remove(struct sdw_slave *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	component_del(dev, &pm4125_sdw_component_ops);
> +
> +	return 0;
> +}
> +
> +static const struct sdw_device_id pm4125_slave_id[] = {
> +	SDW_SLAVE_ENTRY(0x0217, 0x10c, 0), /* Soundwire pm4125 RX/TX Device ID */
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(sdw, pm4125_slave_id);
> +
> +static int __maybe_unused pm4125_sdw_runtime_suspend(struct device *dev)
> +{
> +	struct pm4125_sdw_priv *priv = dev_get_drvdata(dev);
> +
> +	if (priv->regmap) {
> +		regcache_cache_only(priv->regmap, true);
> +		regcache_mark_dirty(priv->regmap);
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused pm4125_sdw_runtime_resume(struct device *dev)
> +{
> +	struct pm4125_sdw_priv *priv = dev_get_drvdata(dev);
> +
> +	if (priv->regmap) {
> +		regcache_cache_only(priv->regmap, false);
> +		regcache_sync(priv->regmap);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops pm4125_sdw_pm_ops = {
> +	SET_RUNTIME_PM_OPS(pm4125_sdw_runtime_suspend, pm4125_sdw_runtime_resume, NULL)
> +};
> +
> +static struct sdw_driver pm4125_codec_driver = {
> +	.probe = pm4125_probe,
> +	.remove = pm4125_remove,
> +	.ops = &pm4125_slave_ops,
> +	.id_table = pm4125_slave_id,
> +	.driver = {
> +		.name = "pm4125-codec",
> +		.pm = &pm4125_sdw_pm_ops,
> +	}
> +};
> +module_sdw_driver(pm4125_codec_driver);
> +
> +MODULE_DESCRIPTION("PM4125 SDW codec driver");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..58435b9c75865b06b344c6d79800aa9b4bac3abd
> --- /dev/null
> +++ b/sound/soc/codecs/pm4125.c
> @@ -0,0 +1,1848 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> +// Copyright (c) 2025, Linaro Ltd
> +
> +#include <linux/component.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +#include <sound/jack.h>
> +#include <sound/pcm_params.h>
> +#include <sound/pcm.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/soc.h>
> +#include <sound/tlv.h>
> +
> +#include "wcd-mbhc-v2.h"
> +#include "pm4125.h"
> +
> +#define WCD_MBHC_HS_V_MAX		1600
> +#define PM4125_MBHC_MAX_BUTTONS		8
> +
> +#define PM4125_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
> +		      SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
> +		      SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000 |\
> +		      SNDRV_PCM_RATE_384000)
> +
> +/* Fractional Rates */
> +#define PM4125_FRAC_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_88200 |\
> +			   SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_352800)
> +
> +#define PM4125_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |\
> +			SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
> +
> +/* Registers in SPMI addr space */
> +#define PM4125_CODEC_RESET_REG		0xF3DB
> +#define PM4125_CODEC_OFF		0x1
> +#define PM4125_CODEC_ON			0x0
> +#define PM4125_CODEC_FOUNDRY_ID_REG	0x7
> +
> +enum {
> +	HPH_COMP_DELAY,
> +	HPH_PA_DELAY,
> +};
> +
> +enum {
> +	AIF1_PB = 0,
> +	AIF1_CAP,
> +	NUM_CODEC_DAIS,
> +};
> +
> +struct pm4125_priv {
> +	struct sdw_slave *tx_sdw_dev;
> +	struct pm4125_sdw_priv *sdw_priv[NUM_CODEC_DAIS];
> +	struct device *txdev;
> +	struct device *rxdev;
> +	struct device_node *rxnode;
> +	struct device_node *txnode;
> +	struct regmap *regmap;
> +	struct regmap *spmi_regmap;
> +	/* mbhc module */
> +	struct wcd_mbhc *wcd_mbhc;
> +	struct wcd_mbhc_config mbhc_cfg;
> +	struct wcd_mbhc_intr intr_ids;
> +	struct irq_domain *virq;
> +	const struct regmap_irq_chip *pm4125_regmap_irq_chip;
> +	struct regmap_irq_chip_data *irq_chip;
> +	struct regulator_bulk_data supplies[PM4125_MAX_BULK_SUPPLY];
> +	struct regulator *buck_supply;

unused.

> +	struct snd_soc_jack *jack;
> +	unsigned long status_mask;
> +	s32 micb_ref[PM4125_MAX_MICBIAS];
> +	s32 pullup_ref[PM4125_MAX_MICBIAS];
> +	u32 hph_mode;
> +	int ear_rx_path;
> +	u32 micb1_mv;
> +	u32 micb2_mv;
> +	u32 micb3_mv;
> +
> +	int hphr_pdm_wd_int;
> +	int hphl_pdm_wd_int;
> +	bool comp1_enable;
> +	bool comp2_enable;
> +
> +	atomic_t rx_clk_cnt;
> +	atomic_t ana_clk_count;
unused
> +};
> +
> +static const DECLARE_TLV_DB_SCALE(line_gain, 0, 7, 1);
> +static const DECLARE_TLV_DB_SCALE(analog_gain, 0, 25, 1);
> +
> +static const struct wcd_mbhc_field pm4125_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
> +	WCD_MBHC_FIELD(WCD_MBHC_L_DET_EN, PM4125_ANA_MBHC_MECH, 0x80),
> +	WCD_MBHC_FIELD(WCD_MBHC_GND_DET_EN, PM4125_ANA_MBHC_MECH, 0x40),
> +	WCD_MBHC_FIELD(WCD_MBHC_MECH_DETECTION_TYPE, PM4125_ANA_MBHC_MECH, 0x20),
> +	WCD_MBHC_FIELD(WCD_MBHC_MIC_CLAMP_CTL, PM4125_ANA_MBHC_PLUG_DETECT_CTL, 0x30),
> +	WCD_MBHC_FIELD(WCD_MBHC_ELECT_DETECTION_TYPE, PM4125_ANA_MBHC_ELECT, 0x08),
> +	WCD_MBHC_FIELD(WCD_MBHC_HS_L_DET_PULL_UP_CTRL, PM4125_ANA_MBHC_PLUG_DETECT_CTL, 0x1F),
> +	WCD_MBHC_FIELD(WCD_MBHC_HS_L_DET_PULL_UP_COMP_CTRL, PM4125_ANA_MBHC_MECH, 0x04),
> +	WCD_MBHC_FIELD(WCD_MBHC_HPHL_PLUG_TYPE, PM4125_ANA_MBHC_MECH, 0x10),
> +	WCD_MBHC_FIELD(WCD_MBHC_GND_PLUG_TYPE, PM4125_ANA_MBHC_MECH, 0x08),
> +	WCD_MBHC_FIELD(WCD_MBHC_SW_HPH_LP_100K_TO_GND, PM4125_ANA_MBHC_MECH, 0x01),
> +	WCD_MBHC_FIELD(WCD_MBHC_ELECT_SCHMT_ISRC, PM4125_ANA_MBHC_ELECT, 0x06),
> +	WCD_MBHC_FIELD(WCD_MBHC_FSM_EN, PM4125_ANA_MBHC_ELECT, 0x80),
> +	WCD_MBHC_FIELD(WCD_MBHC_INSREM_DBNC, PM4125_ANA_MBHC_PLUG_DETECT_CTL, 0x0F),
> +	WCD_MBHC_FIELD(WCD_MBHC_BTN_DBNC, PM4125_ANA_MBHC_CTL_1, 0x03),
> +	WCD_MBHC_FIELD(WCD_MBHC_HS_VREF, PM4125_ANA_MBHC_CTL_2, 0x03),
> +	WCD_MBHC_FIELD(WCD_MBHC_HS_COMP_RESULT, PM4125_ANA_MBHC_RESULT_3, 0x08),
> +	WCD_MBHC_FIELD(WCD_MBHC_IN2P_CLAMP_STATE, PM4125_ANA_MBHC_RESULT_3, 0x10),
> +	WCD_MBHC_FIELD(WCD_MBHC_MIC_SCHMT_RESULT, PM4125_ANA_MBHC_RESULT_3, 0x20),
> +	WCD_MBHC_FIELD(WCD_MBHC_HPHL_SCHMT_RESULT, PM4125_ANA_MBHC_RESULT_3, 0x80),
> +	WCD_MBHC_FIELD(WCD_MBHC_HPHR_SCHMT_RESULT, PM4125_ANA_MBHC_RESULT_3, 0x40),
> +	WCD_MBHC_FIELD(WCD_MBHC_BTN_RESULT, PM4125_ANA_MBHC_RESULT_3, 0x07),
> +	WCD_MBHC_FIELD(WCD_MBHC_BTN_ISRC_CTL, PM4125_ANA_MBHC_ELECT, 0x70),
> +	WCD_MBHC_FIELD(WCD_MBHC_ELECT_RESULT, PM4125_ANA_MBHC_RESULT_3, 0xFF),
> +	WCD_MBHC_FIELD(WCD_MBHC_MICB_CTRL, PM4125_ANA_MICBIAS_MICB_1_2_EN, 0xC0),
> +	WCD_MBHC_FIELD(WCD_MBHC_HPHR_PA_EN, PM4125_ANA_HPHPA_CNP_CTL_2, 0x40),
> +	WCD_MBHC_FIELD(WCD_MBHC_HPHL_PA_EN, PM4125_ANA_HPHPA_CNP_CTL_2, 0x80),
> +	WCD_MBHC_FIELD(WCD_MBHC_HPH_PA_EN, PM4125_ANA_HPHPA_CNP_CTL_2, 0xC0),
> +	WCD_MBHC_FIELD(WCD_MBHC_SWCH_LEVEL_REMOVE, PM4125_ANA_MBHC_RESULT_3, 0x10),
> +	WCD_MBHC_FIELD(WCD_MBHC_FSM_STATUS, PM4125_ANA_MBHC_FSM_STATUS, 0x01),
> +	WCD_MBHC_FIELD(WCD_MBHC_MUX_CTL, PM4125_ANA_MBHC_CTL_2, 0x70),
> +	WCD_MBHC_FIELD(WCD_MBHC_MOISTURE_STATUS, PM4125_ANA_MBHC_FSM_STATUS, 0x20),
> +	WCD_MBHC_FIELD(WCD_MBHC_HPHL_OCP_DET_EN, PM4125_ANA_HPHPA_CNP_CTL_2, 0x01),
> +	WCD_MBHC_FIELD(WCD_MBHC_HPHR_OCP_DET_EN, PM4125_ANA_HPHPA_CNP_CTL_2, 0x01),
> +	WCD_MBHC_FIELD(WCD_MBHC_HPHL_OCP_STATUS, PM4125_DIG_SWR_INTR_STATUS_0, 0x80),
> +	WCD_MBHC_FIELD(WCD_MBHC_HPHR_OCP_STATUS, PM4125_DIG_SWR_INTR_STATUS_0, 0x20),
> +	WCD_MBHC_FIELD(WCD_MBHC_ADC_EN, PM4125_ANA_MBHC_CTL_1, 0x08),
> +	WCD_MBHC_FIELD(WCD_MBHC_ADC_COMPLETE, PM4125_ANA_MBHC_FSM_STATUS, 0x40),
> +	WCD_MBHC_FIELD(WCD_MBHC_ADC_TIMEOUT, PM4125_ANA_MBHC_FSM_STATUS, 0x80),
> +	WCD_MBHC_FIELD(WCD_MBHC_ADC_RESULT, PM4125_ANA_MBHC_ADC_RESULT, 0xFF),
> +	WCD_MBHC_FIELD(WCD_MBHC_MICB2_VOUT, PM4125_ANA_MICBIAS_LDO_1_SETTING, 0x3F),
> +	WCD_MBHC_FIELD(WCD_MBHC_ADC_MODE, PM4125_ANA_MBHC_CTL_1, 0x10),
> +	WCD_MBHC_FIELD(WCD_MBHC_DETECTION_DONE, PM4125_ANA_MBHC_CTL_1, 0x04),
> +	WCD_MBHC_FIELD(WCD_MBHC_ELECT_ISRC_EN, PM4125_ANA_MBHC_ZDET, 0x02),
> +};
> +
> +static const struct regmap_irq pm4125_irqs[PM4125_NUM_IRQS] = {
> +	REGMAP_IRQ_REG(PM4125_IRQ_MBHC_BUTTON_PRESS_DET, 0, BIT(0)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_MBHC_BUTTON_RELEASE_DET, 0, BIT(1)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_MBHC_ELECT_INS_REM_DET, 0, BIT(2)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_MBHC_ELECT_INS_REM_LEG_DET, 0, BIT(3)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_MBHC_SW_DET, 0, BIT(4)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_HPHR_OCP_INT, 0, BIT(5)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_HPHR_CNP_INT, 0, BIT(6)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_HPHL_OCP_INT, 0, BIT(7)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_HPHL_CNP_INT, 1, BIT(0)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_EAR_CNP_INT, 1, BIT(1)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_EAR_SCD_INT, 1, BIT(2)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_AUX_CNP_INT, 1, BIT(3)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_AUX_SCD_INT, 1, BIT(4)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_HPHL_PDM_WD_INT, 1, BIT(5)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_HPHR_PDM_WD_INT, 1, BIT(6)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_AUX_PDM_WD_INT, 1, BIT(7)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_LDORT_SCD_INT, 2, BIT(0)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_MBHC_MOISTURE_INT, 2, BIT(1)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_HPHL_SURGE_DET_INT, 2, BIT(2)),
> +	REGMAP_IRQ_REG(PM4125_IRQ_HPHR_SURGE_DET_INT, 2, BIT(3)),
> +};
> +
> +static int pm4125_handle_post_irq(void *data)
> +{
> +	struct pm4125_priv *pm4125;
> +
> +	if (data)
> +		pm4125 = (struct pm4125_priv *)data;
> +	else
> +		return IRQ_HANDLED;
This will result in interrupt storm, as you are not clearning the source.

> +
> +	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_0, 0);
> +	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_1, 0);
> +	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_2, 0);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const u32 pm4125_config_regs[] = {
> +	PM4125_DIG_SWR_INTR_LEVEL_0,
> +};
> +
> +static const struct regmap_irq_chip pm4125_regmap_irq_chip = {
> +	.name = "pm4125",
> +	.irqs = pm4125_irqs,
> +	.num_irqs = ARRAY_SIZE(pm4125_irqs),
> +	.num_regs = 3,
> +	.status_base = PM4125_DIG_SWR_INTR_STATUS_0,
> +	.mask_base = PM4125_DIG_SWR_INTR_MASK_0,
> +	.ack_base = PM4125_DIG_SWR_INTR_CLEAR_0,
> +	.use_ack = 1,
> +	.clear_ack = 1,
> +	.config_base = pm4125_config_regs,
> +	.num_config_bases = ARRAY_SIZE(pm4125_config_regs),
> +	.num_config_regs = 1,
> +	.runtime_pm = true,
> +	.handle_post_irq = pm4125_handle_post_irq,
> +	.irq_drv_data = NULL,
> +};
> +
> +static void pm4125_reset(struct pm4125_priv *pm4125)
> +{
> +	regmap_write(pm4125->spmi_regmap,
> +		     PM4125_CODEC_RESET_REG, PM4125_CODEC_OFF);
> +	usleep_range(20, 30);
> +
> +	regmap_write(pm4125->spmi_regmap,
> +		     PM4125_CODEC_RESET_REG, PM4125_CODEC_ON);
> +	usleep_range(5000, 5010);
> +}
> +
> +static void pm4125_io_init(struct regmap *regmap)
> +{
> +	/* Disable HPH OCP */
> +	regmap_update_bits(regmap, PM4125_ANA_HPHPA_CNP_CTL_2, 0x03, 0x00);
pl use defines instead of using magic values.
applies to most part of the driver.
also pl take a look at
snd_soc_component_read/write_field() functions which are handy
> +
> +	/* Enable surge protection */
> +	regmap_update_bits(regmap, PM4125_ANA_SURGE_EN, 0xC0, 0xC0);
> +
> +	/* Disable mic bias pull down */
> +	regmap_update_bits(regmap, PM4125_ANA_MICBIAS_MICB_1_2_EN, 0x01, 0x00);
> +}
> +
> +static int pm4125_global_mbias_disable(struct snd_soc_component *component)
> +{
> +	snd_soc_component_update_bits(component, PM4125_ANA_MBIAS_EN,
> +				      0x10, 0x00);
> +	snd_soc_component_update_bits(component, PM4125_ANA_MBIAS_EN,
> +				      0x20, 0x00);
> +	return 0;
> +}
> +
> +static int pm4125_global_mbias_enable(struct snd_soc_component *component)
> +{
> +	snd_soc_component_update_bits(component, PM4125_ANA_MBIAS_EN,
> +				      0x20, 0x20);
> +	snd_soc_component_update_bits(component, PM4125_ANA_MBIAS_EN,
> +				      0x10, 0x10);
> +	usleep_range(1000, 1100);
> +	return 0;
> +}
> +
> +static int pm4125_rx_clk_enable(struct snd_soc_component *component)

looks like the rxclk can be converted into a proper dapm supply widget.

> +{
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +
> +	if (atomic_read(&pm4125->rx_clk_cnt))
> +		return 0;
> +
> +	snd_soc_component_update_bits(component, PM4125_DIG_SWR_CDC_RX_CLK_CTL,
> +				      0x10, 0x10);
> +	snd_soc_component_update_bits(component, PM4125_DIG_SWR_CDC_RX_CLK_CTL,
> +				      0x20, 0x20);
> +	usleep_range(5000, 5100);
> +
> +	pm4125_global_mbias_enable(component);
> +
> +	snd_soc_component_update_bits(component, PM4125_ANA_HPHPA_FSM_CLK,
> +				      0x7F, 0x11);
> +	snd_soc_component_update_bits(component, PM4125_ANA_HPHPA_FSM_CLK,
> +				      0x80, 0x80);
> +	snd_soc_component_update_bits(component, PM4125_ANA_NCP_VCTRL,
> +				      0x07, 0x06);
> +	snd_soc_component_update_bits(component, PM4125_ANA_NCP_EN,
> +				      0x01, 0x01);
> +	usleep_range(500, 510);
> +
> +	atomic_inc(&pm4125->rx_clk_cnt);
> +
> +	return 0;
> +}
> +
> +static int pm4125_rx_clk_disable(struct snd_soc_component *component)
> +{
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +
> +	if (!atomic_read(&pm4125->rx_clk_cnt)) {
> +		dev_err(component->dev, "clk already disabled\n");
> +		return 0;
> +	}
> +
> +	atomic_dec(&pm4125->rx_clk_cnt);
> +
> +	snd_soc_component_update_bits(component,
> +				      PM4125_ANA_HPHPA_FSM_CLK,
> +				      0x80, 0x00);
> +	snd_soc_component_update_bits(component,
> +				      PM4125_ANA_HPHPA_FSM_CLK,
> +				      0x7F, 0x00);
> +	snd_soc_component_update_bits(component,
> +				      PM4125_ANA_NCP_EN,
> +				      0x01, 0x00);
> +	snd_soc_component_update_bits(component,
> +				      PM4125_DIG_SWR_CDC_RX_CLK_CTL,
> +				      0x20, 0x00);
> +	snd_soc_component_update_bits(component,
> +				      PM4125_DIG_SWR_CDC_RX_CLK_CTL,
> +				      0x10, 0x00);
> +	pm4125_global_mbias_disable(component);
> +
> +	return 0;
> +}
> +
> +static int pm4125_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
> +				       struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +					snd_soc_dapm_to_component(w->dapm);
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		pm4125_rx_clk_enable(component);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_ANA_HPHPA_CNP_CTL_1,
> +					      0x02, 0x02);
> +
> +		snd_soc_component_update_bits(component,
> +					      PM4125_SWR_HPHPA_HD2,
> +					      0x38, 0x38);
> +
> +		set_bit(HPH_COMP_DELAY, &pm4125->status_mask);
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +
drop space.
> +		if (pm4125->comp1_enable) {
> +			snd_soc_component_update_bits(component,
> +						PM4125_DIG_SWR_CDC_COMP_CTL_0,
> +						0x02, 0x02);
> +
> +			if (pm4125->comp2_enable)
> +				snd_soc_component_update_bits(component,
> +						PM4125_DIG_SWR_CDC_COMP_CTL_0,
> +						0x01, 0x01);
> +			/*
> +			 * 5ms sleep is required after COMP is enabled as per
> +			 * HW requirement
> +			 */
> +			if (test_bit(HPH_COMP_DELAY, &pm4125->status_mask)) {
> +				usleep_range(5000, 5100);
> +				clear_bit(HPH_COMP_DELAY, &pm4125->status_mask);
> +			}
> +		} else {
> +			snd_soc_component_update_bits(component,
> +						PM4125_DIG_SWR_CDC_COMP_CTL_0,
> +						0x02, 0x00);
> +		}
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX0_CTL,
> +					      0x80, 0x00);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX_GAIN_CTL,
> +					      0x04, 0x04);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX_CLK_CTL,
> +					      0x01, 0x01);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX_CLK_CTL,
> +					      0x01, 0x00);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX_GAIN_CTL,
> +					      0x04, 0x00);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX0_CTL,
> +					      0x80, 0x80);
> +		if (pm4125->comp1_enable)
> +			snd_soc_component_update_bits(component,
> +						PM4125_DIG_SWR_CDC_COMP_CTL_0,
> +						0x02, 0x00);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pm4125_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
> +				       struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +					snd_soc_dapm_to_component(w->dapm);
this can fit in 100 chars.

> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		pm4125_rx_clk_enable(component);
> +
> +		snd_soc_component_update_bits(component,
> +					      PM4125_ANA_HPHPA_CNP_CTL_1,
> +					      0x02, 0x02);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_SWR_HPHPA_HD2,
> +					      0x07, 0x07);
> +
> +		set_bit(HPH_COMP_DELAY, &pm4125->status_mask);
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		if (pm4125->comp2_enable) {
> +			snd_soc_component_update_bits(component,
> +						PM4125_DIG_SWR_CDC_COMP_CTL_0,
> +						0x01, 0x01);
> +
> +			if (pm4125->comp1_enable)
> +				snd_soc_component_update_bits(component,
> +						PM4125_DIG_SWR_CDC_COMP_CTL_0,
> +						0x02, 0x02);
> +			/*
> +			 * 5ms sleep is required after COMP is enabled
> +			 * as per HW requirement
> +			 */
> +			if (test_bit(HPH_COMP_DELAY, &pm4125->status_mask)) {
> +				usleep_range(5000, 5100);
> +				clear_bit(HPH_COMP_DELAY, &pm4125->status_mask);
> +			}
> +		} else {
> +			snd_soc_component_update_bits(component,
> +						PM4125_DIG_SWR_CDC_COMP_CTL_0,
> +						0x01, 0x00);
> +		}
> +
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX1_CTL,
> +					      0x80, 0x00);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX_GAIN_CTL,
> +					      0x08, 0x08);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX_CLK_CTL,
> +					      0x02, 0x02);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX_CLK_CTL,
> +					      0x02, 0x00);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX_GAIN_CTL,
> +					      0x08, 0x00);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX1_CTL,
> +					      0x80, 0x80);
> +
> +		if (pm4125->comp2_enable)
> +			snd_soc_component_update_bits(component,
> +						PM4125_DIG_SWR_CDC_COMP_CTL_0,
> +						0x01, 0x00);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pm4125_codec_ear_lo_dac_event(struct snd_soc_dapm_widget *w,
> +					 struct snd_kcontrol *kcontrol,
> +					 int event)
> +{
> +	struct snd_soc_component *component =
> +					snd_soc_dapm_to_component(w->dapm);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		pm4125_rx_clk_enable(component);
> +
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX0_CTL,
> +					      0x80, 0x00);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX_CLK_CTL,
> +					      0x01, 0x01);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX_GAIN_CTL,
> +					      0x04, 0x04);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX_CLK_CTL,
> +					      0x01, 0x00);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX_GAIN_CTL,
> +					      0x04, 0x00);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_RX0_CTL,
> +					      0x80, 0x80);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pm4125_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
> +				       struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +					snd_soc_dapm_to_component(w->dapm);
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		set_bit(HPH_PA_DELAY, &pm4125->status_mask);
> +		usleep_range(200, 210);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_PDM_WD_CTL1,
> +					      0x03, 0x03);
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		if (test_bit(HPH_PA_DELAY, &pm4125->status_mask)) {
> +			usleep_range(5000, 5100);
> +			clear_bit(HPH_PA_DELAY, &pm4125->status_mask);
> +		}
> +
> +		enable_irq(pm4125->hphr_pdm_wd_int);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		disable_irq_nosync(pm4125->hphr_pdm_wd_int);
> +		set_bit(HPH_PA_DELAY, &pm4125->status_mask);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		if (test_bit(HPH_PA_DELAY, &pm4125->status_mask)) {
> +			usleep_range(5000, 5100);
> +			clear_bit(HPH_PA_DELAY, &pm4125->status_mask);
> +		}
> +
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_PDM_WD_CTL1,
> +					      0x03, 0x00);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pm4125_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
> +				       struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +					snd_soc_dapm_to_component(w->dapm);
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		usleep_range(200, 210);
> +		set_bit(HPH_PA_DELAY, &pm4125->status_mask);
Am really not following the logic here, we set the bit here and check
the bit in POST_PMU and then we set BIT in PRE_PMD and clear it int
POST_PMD.

So this bit will be set in all the cases.

why do we even need this bit to be set, can we not use the dealy by default?

> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_PDM_WD_CTL0,
> +					      0x03, 0x03);
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		if (test_bit(HPH_PA_DELAY, &pm4125->status_mask)) {
> +			usleep_range(5000, 5100);
> +			clear_bit(HPH_PA_DELAY, &pm4125->status_mask);
> +		}
> +
> +		enable_irq(pm4125->hphl_pdm_wd_int);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		disable_irq_nosync(pm4125->hphl_pdm_wd_int);
> +		set_bit(HPH_PA_DELAY, &pm4125->status_mask);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		if (test_bit(HPH_PA_DELAY, &pm4125->status_mask)) {
> +			usleep_range(5000, 5100);
> +			clear_bit(HPH_PA_DELAY, &pm4125->status_mask);
> +		}
> +
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_PDM_WD_CTL0,
> +					      0x03, 0x00);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pm4125_codec_enable_lo_pa(struct snd_soc_dapm_widget *w,
> +				     struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +					snd_soc_dapm_to_component(w->dapm);
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		snd_soc_component_update_bits(component,
> +					      PM4125_ANA_COMBOPA_CTL_5,
> +					      0x04, 0x00);
> +		usleep_range(1000, 1010);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_ANA_COMBOPA_CTL_4,
> +					      0x0F, 0x0F);
> +		usleep_range(1000, 1010);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_ANA_COMBOPA_CTL,
> +					      0x40, 0x40);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_PDM_WD_CTL0,
> +					      0x03, 0x03);
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		usleep_range(5000, 5010);
> +
> +		snd_soc_component_update_bits(component,
> +					      PM4125_ANA_COMBOPA_CTL_4,
> +					      0x0F, 0x04);
> +		enable_irq(pm4125->hphl_pdm_wd_int);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		disable_irq_nosync(pm4125->hphl_pdm_wd_int);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		usleep_range(2000, 2010);
> +
Empty lining is really not consistent across the code, either use it
consistently or not use it at all.

> +		snd_soc_component_update_bits(component,
> +					      PM4125_ANA_COMBOPA_CTL,
> +					      0x40, 0x00);
> +		usleep_range(5000, 5100);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_PDM_WD_CTL0,
> +					      0x03, 0x00);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pm4125_codec_enable_ear_pa(struct snd_soc_dapm_widget *w,
> +				      struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +					snd_soc_dapm_to_component(w->dapm);
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		snd_soc_component_update_bits(component,
> +					      PM4125_ANA_COMBOPA_CTL_5,
> +					      0x04, 0x00);
> +		usleep_range(1000, 1010);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_ANA_COMBOPA_CTL_4,
> +					      0x0F, 0x0F);
> +		usleep_range(1000, 1010);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_ANA_COMBOPA_CTL,
> +					      0x40, 0x00);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_PDM_WD_CTL0,
> +					      0x03, 0x03);
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		usleep_range(5000, 5010);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_ANA_COMBOPA_CTL_4,
> +					      0x0F, 0x04);
> +
> +		enable_irq(pm4125->hphl_pdm_wd_int);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		disable_irq_nosync(pm4125->hphl_pdm_wd_int);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		usleep_range(5000, 5010);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_PDM_WD_CTL0,
> +					      0x03, 0x00);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pm4125_enable_rx1(struct snd_soc_dapm_widget *w,
> +			     struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +					snd_soc_dapm_to_component(w->dapm);
> +
> +	if (event == SND_SOC_DAPM_POST_PMD)
> +		pm4125_rx_clk_disable(component);

if we convert the rx clk into dapm, then things will be inplace
automatically and you do not do this kinda handling.

> +
> +	return 0;
> +}
> +
> +static int pm4125_enable_rx2(struct snd_soc_dapm_widget *w,
> +			     struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +					snd_soc_dapm_to_component(w->dapm);
> +
> +	if (event == SND_SOC_DAPM_POST_PMD)
> +		pm4125_rx_clk_disable(component);
> +
> +	return 0;
> +}

This function is duplicate of pm4125_enable_rx1()...

> +
> +static int pm4125_get_micb_vout_ctl_val(u32 micb_mv)
> +{
> +	if (micb_mv < 1600 || micb_mv > 2850) {
> +		pr_err("Unsupported micbias voltage (%u mV)\n", micb_mv);
> +		return -EINVAL;
> +	}
> +
> +	return (micb_mv - 1600) / 50;
> +}
> +
> +static int pm4125_codec_enable_adc(struct snd_soc_dapm_widget *w,
> +				   struct snd_kcontrol *kcontrol, int event)
> +{
Lets add the code needed for ADC in next spin.
> +	return 0;

> +}
> +
> +static int pm4125_codec_enable_dmic(struct snd_soc_dapm_widget *w,
> +				    struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +					snd_soc_dapm_to_component(w->dapm);
> +	u16 dmic_clk_reg;
> +
> +	switch (w->shift) {
> +	case 0:
> +	case 1:
Can we use proper names here, instead of 1 and 0, can we use
PM4125_DMIC0, PM4125_DMIC1 ?

> +		dmic_clk_reg = PM4125_DIG_SWR_CDC_DMIC1_CTL;
Also why can not we pass this as reg to the widget? then you can avoid
all this switch caseing.

> +		break;
> +	default:
> +		dev_err(component->dev, "Invalid DMIC selection\n");
> +		return -EINVAL;
> +	}
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_AMIC_CTL,
> +					      0x02, 0x00);
> +		snd_soc_component_update_bits(component,
> +					      dmic_clk_reg,
> +					      0x08, 0x08);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		snd_soc_component_update_bits(component,
> +					      dmic_clk_reg,
> +					      0x08, 0x00);
> +		snd_soc_component_update_bits(component,
> +					      PM4125_DIG_SWR_CDC_AMIC_CTL,
> +					      0x02, 0x02);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pm4125_micbias_control(struct snd_soc_component *component,
> +				  int micb_num, int req, bool is_dapm)
> +{
Lets implement this in v2.
> +	return 0;
> +}
> +
> +static int __pm4125_codec_enable_micbias(struct snd_soc_dapm_widget *w,
> +					 int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	int micb_num = w->shift;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		pm4125_micbias_control(component, micb_num,
> +				       MICB_ENABLE, true);
MICBIAS 3 needs internal LDO pull up, as we can not connect it to
vairable voltage.

> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		usleep_range(1000, 1100);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		pm4125_micbias_control(component, micb_num,
> +					MICB_DISABLE, true);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pm4125_codec_enable_micbias(struct snd_soc_dapm_widget *w,
> +				       struct snd_kcontrol *kcontrol, int event)
> +{
> +	return __pm4125_codec_enable_micbias(w, event);
Why do we need this boiler plate, same comment applies to other parts of
the code too.

> +}
> +
> +static int __pm4125_codec_enable_micbias_pullup(struct snd_soc_dapm_widget *w,
> +						int event)
> +{
> +	struct snd_soc_component *component =
> +					snd_soc_dapm_to_component(w->dapm);
> +	int micb_num = w->shift;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		pm4125_micbias_control(component, micb_num, MICB_PULLUP_ENABLE,
> +				       true);
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		usleep_range(1000, 1100);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		pm4125_micbias_control(component, micb_num, MICB_PULLUP_DISABLE,
> +				       true);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pm4125_codec_enable_micbias_pullup(struct snd_soc_dapm_widget *w,
> +					      struct snd_kcontrol *kcontrol,
> +					      int event)
> +{
> +	return __pm4125_codec_enable_micbias_pullup(w, event);
> +}
> +
> +static int pm4125_connect_port(struct pm4125_sdw_priv *sdw_priv, u8 port_idx,
> +			       u8 ch_id, bool enable)
> +{
> +	struct sdw_port_config *port_config =
> +					&sdw_priv->port_config[port_idx - 1];
> +	const struct pm4125_sdw_ch_info *ch_info = &sdw_priv->ch_info[ch_id];
> +	struct sdw_slave *sdev = sdw_priv->sdev;
> +	u8 port_num = ch_info->port_num;
> +	u8 ch_mask = ch_info->ch_mask;
> +	u8 mstr_port_num, mstr_ch_mask;
> +
> +	port_config->num = port_num;
> +
> +	mstr_port_num = sdev->m_port_map[port_num];
> +	mstr_ch_mask = ch_info->master_ch_mask;
> +
> +	if (enable) {
> +		port_config->ch_mask |= ch_mask;
> +		sdw_priv->master_channel_map[mstr_port_num] |= mstr_ch_mask;
> +	} else {
> +		port_config->ch_mask &= ~ch_mask;
> +		sdw_priv->master_channel_map[mstr_port_num] &= ~mstr_ch_mask;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pm4125_get_compander(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +					snd_soc_kcontrol_component(kcontrol);
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +	struct soc_mixer_control *mc;
> +	bool hphr;
> +
> +	mc = (struct soc_mixer_control *)(kcontrol->private_value);
> +	hphr = mc->shift;
> +
> +	ucontrol->value.integer.value[0] = hphr ? pm4125->comp2_enable :
> +						  pm4125->comp1_enable;
> +	return 0;
> +}
> +
> +static int pm4125_set_compander(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +					snd_soc_kcontrol_component(kcontrol);
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +	struct pm4125_sdw_priv *sdw_priv = pm4125->sdw_priv[AIF1_PB];
> +	int value = ucontrol->value.integer.value[0];
> +	struct soc_mixer_control *mc;
> +	int portidx;
> +	bool hphr;
> +
> +	mc = (struct soc_mixer_control *)(kcontrol->private_value);
> +	hphr = mc->shift;
> +
> +	if (hphr) {
> +		if (value == pm4125->comp2_enable)
> +			return 0;
> +
> +		pm4125->comp2_enable = value;
> +	} else {
> +		if (value == pm4125->comp1_enable)
> +			return 0;
> +
> +		pm4125->comp1_enable = value;
> +	}
> +
> +	portidx = sdw_priv->ch_info[mc->reg].port_num;
> +
> +	pm4125_connect_port(sdw_priv, portidx, mc->reg, value ? true : false);
> +
> +	return 1;
> +}
> +
> +static int pm4125_get_swr_port(struct snd_kcontrol *kcontrol,
> +			       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mixer =
> +			(struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(comp);
> +	struct pm4125_sdw_priv *sdw_priv;
> +	int dai_id = mixer->shift;
> +	int ch_idx = mixer->reg;
> +	int portidx;
> +
> +	sdw_priv = pm4125->sdw_priv[dai_id];
> +	portidx = sdw_priv->ch_info[ch_idx].port_num;
> +
> +	ucontrol->value.integer.value[0] = sdw_priv->port_enable[portidx];
> +
> +	return 0;
> +}
> +
> +static int pm4125_set_swr_port(struct snd_kcontrol *kcontrol,
> +			       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mixer =
> +			(struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(comp);
> +	struct pm4125_sdw_priv *sdw_priv;
> +	int dai_id = mixer->shift;
> +	int ch_idx = mixer->reg;
> +	int portidx;
> +	bool enable;
> +
> +	sdw_priv = pm4125->sdw_priv[dai_id];
> +
> +	portidx = sdw_priv->ch_info[ch_idx].port_num;
> +
> +	enable = ucontrol->value.integer.value[0];
> +
> +	if (enable == sdw_priv->port_enable[portidx]) {
> +		pm4125_connect_port(sdw_priv, portidx, ch_idx, enable);
> +		return 0;
> +	}
> +
> +	sdw_priv->port_enable[portidx] = enable;
> +	pm4125_connect_port(sdw_priv, portidx, ch_idx, enable);
> +
> +	return 1;
> +}
> +
> +static const struct snd_kcontrol_new hph_type_detect_controls[] = {
> +	SOC_SINGLE_EXT("HPH Type", 0, 0, WCD_MBHC_HPH_STEREO, 0, NULL, NULL),
> +};
> +
> +static const struct snd_kcontrol_new impedance_detect_controls[] = {
> +	SOC_SINGLE_EXT("HPHL Impedance", 0, 0, INT_MAX, 0, NULL, NULL),
> +	SOC_SINGLE_EXT("HPHR Impedance", 0, 1, INT_MAX, 0, NULL, NULL),

What are these supposed to read?

> +};
> +
> +static void pm4125_mbhc_mbhc_bias_control(struct snd_soc_component *component,
> +					  bool enable)
> +{
> +	snd_soc_component_update_bits(component, PM4125_ANA_MBHC_ELECT, 0x01,
> +				      enable ? 0x01 : 0x00);
> +}
> +
> +static void pm4125_mbhc_program_btn_thr(struct snd_soc_component *component,
> +					int *btn_low, int *btn_high,
> +					int num_btn, bool is_micbias)
> +{
> +	int i, vth;
> +
> +	if (num_btn > WCD_MBHC_DEF_BUTTONS) {
> +		dev_err(component->dev, "%s: invalid number of buttons: %d\n",
> +			__func__, num_btn);
> +		return;
> +	}
> +
> +	for (i = 0; i < num_btn; i++) {
> +		vth = ((btn_high[i] * 2) / 25) & 0x3F;
> +		snd_soc_component_write_field(component,
> +					PM4125_ANA_MBHC_BTN0_ZDET_VREF1 + i,
> +					0xfc, vth << 2);
> +	}
> +}
> +
> +static const struct wcd_mbhc_cb mbhc_cb = {
> +	.clk_setup = NULL,
> +	.mbhc_bias = pm4125_mbhc_mbhc_bias_control,
> +	.set_btn_thr = pm4125_mbhc_program_btn_thr,
> +	.micbias_enable_status = NULL,
> +	.hph_pull_up_control_v2 = NULL,
> +	.mbhc_micbias_control = NULL,
> +	.mbhc_micb_ramp_control = NULL,
> +	.mbhc_micb_ctrl_thr_mic = NULL,
> +	.compute_impedance = NULL,
> +	.mbhc_gnd_det_ctrl = NULL,
> +	.hph_pull_down_ctrl = NULL,
> +	.mbhc_moisture_config = NULL,
> +	.mbhc_get_moisture_status = NULL,
> +	.mbhc_moisture_polling_ctrl = NULL,
> +	.mbhc_moisture_detect_en = NULL,
Either we add mbhc or not, having these dummy functions is not really
helping.

> +};
> +
> +static int pm4125_mbhc_init(struct snd_soc_component *component)
> +{
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +	struct wcd_mbhc_intr *intr_ids = &pm4125->intr_ids;
> +
> +	intr_ids->mbhc_sw_intr =
> +		regmap_irq_get_virq(pm4125->irq_chip,
> +				    PM4125_IRQ_MBHC_SW_DET);
> +
> +	intr_ids->mbhc_btn_press_intr =
> +		regmap_irq_get_virq(pm4125->irq_chip,
> +				    PM4125_IRQ_MBHC_BUTTON_PRESS_DET);
> +
> +	intr_ids->mbhc_btn_release_intr =
> +		regmap_irq_get_virq(pm4125->irq_chip,
> +				    PM4125_IRQ_MBHC_BUTTON_RELEASE_DET);
> +
> +	intr_ids->mbhc_hs_ins_intr =
> +		regmap_irq_get_virq(pm4125->irq_chip,
> +				    PM4125_IRQ_MBHC_ELECT_INS_REM_LEG_DET);
> +
> +	intr_ids->mbhc_hs_rem_intr =
> +		regmap_irq_get_virq(pm4125->irq_chip,
> +				    PM4125_IRQ_MBHC_ELECT_INS_REM_DET);
> +
> +	intr_ids->hph_left_ocp =
> +		regmap_irq_get_virq(pm4125->irq_chip,
> +				    PM4125_IRQ_HPHL_OCP_INT);
> +
> +	intr_ids->hph_right_ocp =
> +		regmap_irq_get_virq(pm4125->irq_chip,
> +				    PM4125_IRQ_HPHR_OCP_INT);
> +
> +	pm4125->wcd_mbhc = wcd_mbhc_init(component, &mbhc_cb, intr_ids,
> +					 pm4125_mbhc_fields, false);
> +	if (IS_ERR(pm4125->wcd_mbhc))
> +		return PTR_ERR(pm4125->wcd_mbhc);
> +
> +	snd_soc_add_component_controls(component, impedance_detect_controls,
> +				       ARRAY_SIZE(impedance_detect_controls));
> +	snd_soc_add_component_controls(component, hph_type_detect_controls,
> +				       ARRAY_SIZE(hph_type_detect_controls));
> +	return 0;
> +}
> +
> +static void pm4125_mbhc_deinit(struct snd_soc_component *component)
> +{
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +
> +	wcd_mbhc_deinit(pm4125->wcd_mbhc);
> +}
> +
> +static const struct snd_kcontrol_new pm4125_snd_controls[] = {
> +	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
> +		       pm4125_get_compander, pm4125_set_compander),
> +	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
> +		       pm4125_get_compander, pm4125_set_compander),
> +
> +	SOC_SINGLE_TLV("HPHL Volume", PM4125_ANA_HPHPA_L_GAIN, 0, 20, 1,
> +		       line_gain),
> +	SOC_SINGLE_TLV("HPHR Volume", PM4125_ANA_HPHPA_R_GAIN, 0, 20, 1,
> +		       line_gain),
> +	SOC_SINGLE_TLV("ADC1 Volume", PM4125_ANA_TX_AMIC1, 0, 8, 0,
> +		       analog_gain),
> +	SOC_SINGLE_TLV("ADC2 Volume", PM4125_ANA_TX_AMIC2, 0, 8, 0,
> +		       analog_gain),
> +
> +	SOC_SINGLE_EXT("HPHL Switch", PM4125_HPH_L, 0, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> +	SOC_SINGLE_EXT("HPHR Switch", PM4125_HPH_R, 0, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> +	SOC_SINGLE_EXT("LO Switch", PM4125_LO, 0, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> +
> +	SOC_SINGLE_EXT("ADC1 Switch", PM4125_ADC1, 1, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> +	SOC_SINGLE_EXT("ADC2 Switch", PM4125_ADC2, 1, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> +	SOC_SINGLE_EXT("DMIC0 Switch", PM4125_DMIC0, 1, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> +	SOC_SINGLE_EXT("DMIC1 Switch", PM4125_DMIC1, 1, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> +	SOC_SINGLE_EXT("MBHC Switch", PM4125_MBHC, 1, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> +	SOC_SINGLE_EXT("DMIC2 Switch", PM4125_DMIC2, 1, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> +};
> +
> +static const struct snd_kcontrol_new adc1_switch[] = {
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
> +};
> +
> +static const struct snd_kcontrol_new adc2_switch[] = {
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
> +};
> +
> +static const struct snd_kcontrol_new adc3_switch[] = {
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
> +};
> +
> +static const struct snd_kcontrol_new dmic1_switch[] = {
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
> +};
> +
> +static const struct snd_kcontrol_new dmic2_switch[] = {
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
> +};
> +
> +static const struct snd_kcontrol_new ear_rdac_switch[] = {
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
> +};
> +
> +static const struct snd_kcontrol_new lo_rdac_switch[] = {
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
> +};
> +
> +static const struct snd_kcontrol_new hphl_rdac_switch[] = {
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
> +};
> +
> +static const struct snd_kcontrol_new hphr_rdac_switch[] = {
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
> +};
> +
> +static const char * const adc2_mux_text[] = {
> +	"INP2", "INP3"
> +};
> +
> +static const struct soc_enum adc2_enum =
> +	SOC_ENUM_SINGLE(PM4125_ANA_TX_AMIC2, 4,
> +			ARRAY_SIZE(adc2_mux_text), adc2_mux_text);
> +
> +static const struct snd_kcontrol_new tx_adc2_mux =
> +				SOC_DAPM_ENUM("ADC2 MUX Mux", adc2_enum);
> +
> +static const struct snd_soc_dapm_widget pm4125_dapm_widgets[] = {
> +	/* Input widgets */
> +	SND_SOC_DAPM_INPUT("AMIC1"),
> +	SND_SOC_DAPM_INPUT("AMIC2"),
> +	SND_SOC_DAPM_INPUT("AMIC3"),
> +	SND_SOC_DAPM_INPUT("IN1_HPHL"),
> +	SND_SOC_DAPM_INPUT("IN2_HPHR"),
> +
> +	/* TX widgets */
> +	SND_SOC_DAPM_ADC_E("ADC1", NULL, SND_SOC_NOPM, 0, 0,
> +			   pm4125_codec_enable_adc,
> +			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_ADC_E("ADC2", NULL, SND_SOC_NOPM, 1, 0,
> +			   pm4125_codec_enable_adc,
> +			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +
> +	SND_SOC_DAPM_MUX("ADC2 MUX", SND_SOC_NOPM, 0, 0, &tx_adc2_mux),
> +
> +	/* TX mixers */
> +	SND_SOC_DAPM_MIXER_E("ADC1_MIXER", SND_SOC_NOPM, 0, 0,
> +			     adc1_switch, ARRAY_SIZE(adc1_switch),
> +			     NULL, SND_SOC_DAPM_PRE_PMU |
> +			     SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_MIXER_E("ADC2_MIXER", SND_SOC_NOPM, 1, 0,
> +			     adc2_switch, ARRAY_SIZE(adc2_switch),
> +			     NULL, SND_SOC_DAPM_PRE_PMU |
> +			     SND_SOC_DAPM_POST_PMD),
> +
> +	/* MIC_BIAS widgets */
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS1", SND_SOC_NOPM, MIC_BIAS_1, 0,
> +			    pm4125_codec_enable_micbias,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS2", SND_SOC_NOPM, MIC_BIAS_2, 0,
> +			    pm4125_codec_enable_micbias,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS3", SND_SOC_NOPM, MIC_BIAS_3, 0,
> +			    pm4125_codec_enable_micbias,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +
> +	SND_SOC_DAPM_SUPPLY("PA_VPOS", SND_SOC_NOPM, 0, 0, NULL, 0),
> +
> +	/* RX widgets */
> +	SND_SOC_DAPM_PGA_E("EAR PGA", PM4125_ANA_COMBOPA_CTL, 7, 0, NULL, 0,
> +			   pm4125_codec_enable_ear_pa,
> +			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_PGA_E("LO PGA", PM4125_ANA_COMBOPA_CTL, 7, 0, NULL, 0,
> +			   pm4125_codec_enable_lo_pa,
> +			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_PGA_E("HPHL PGA", PM4125_ANA_HPHPA_CNP_CTL_2, 7, 0, NULL, 0,
> +			   pm4125_codec_enable_hphl_pa,
> +			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_PGA_E("HPHR PGA", PM4125_ANA_HPHPA_CNP_CTL_2, 6, 0, NULL, 0,
> +			   pm4125_codec_enable_hphr_pa,
> +			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
> +
> +	SND_SOC_DAPM_DAC_E("RDAC1", NULL, SND_SOC_NOPM, 0, 0,
> +			   pm4125_codec_hphl_dac_event,
> +			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_DAC_E("RDAC2", NULL, SND_SOC_NOPM, 0, 0,
> +			   pm4125_codec_hphr_dac_event,
> +			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_DAC_E("RDAC3", NULL, SND_SOC_NOPM, 0, 0,
> +			   pm4125_codec_ear_lo_dac_event,
> +			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
> +
> +	SND_SOC_DAPM_MIXER_E("RX1", SND_SOC_NOPM, 0, 0, NULL, 0,
> +			     pm4125_enable_rx1, SND_SOC_DAPM_PRE_PMU |
> +			     SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_MIXER_E("RX2", SND_SOC_NOPM, 0, 0, NULL, 0,
> +			     pm4125_enable_rx2, SND_SOC_DAPM_PRE_PMU |
> +			     SND_SOC_DAPM_POST_PMD),
> +
> +	/* RX mixer widgets */
> +	SND_SOC_DAPM_MIXER("EAR_RDAC", SND_SOC_NOPM, 0, 0,
> +			   ear_rdac_switch, ARRAY_SIZE(ear_rdac_switch)),
> +	SND_SOC_DAPM_MIXER("LO_RDAC", SND_SOC_NOPM, 0, 0,
> +			   lo_rdac_switch, ARRAY_SIZE(lo_rdac_switch)),
> +	SND_SOC_DAPM_MIXER("HPHL_RDAC", SND_SOC_NOPM, 0, 0,
> +			   hphl_rdac_switch, ARRAY_SIZE(hphl_rdac_switch)),
> +	SND_SOC_DAPM_MIXER("HPHR_RDAC", SND_SOC_NOPM, 0, 0,
> +			   hphr_rdac_switch, ARRAY_SIZE(hphr_rdac_switch)),
> +
> +	/* TX output widgets */
> +	SND_SOC_DAPM_OUTPUT("ADC1_OUTPUT"),
> +	SND_SOC_DAPM_OUTPUT("ADC2_OUTPUT"),
> +
> +	/* RX output widgets */
> +	SND_SOC_DAPM_OUTPUT("EAR"),
> +	SND_SOC_DAPM_OUTPUT("LO"),
> +	SND_SOC_DAPM_OUTPUT("HPHL"),
> +	SND_SOC_DAPM_OUTPUT("HPHR"),
> +
> +	/* MIC_BIAS pull up widgets */
> +	SND_SOC_DAPM_SUPPLY("VA MIC BIAS1", SND_SOC_NOPM, MIC_BIAS_1, 0,
> +			    pm4125_codec_enable_micbias_pullup,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_SUPPLY("VA MIC BIAS2", SND_SOC_NOPM, MIC_BIAS_2, 0,
> +			    pm4125_codec_enable_micbias_pullup,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_SUPPLY("VA MIC BIAS3", SND_SOC_NOPM, MIC_BIAS_3, 0,
> +			    pm4125_codec_enable_micbias_pullup,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +
> +	/* TX widgets */
> +	SND_SOC_DAPM_ADC_E("DMIC1", NULL, SND_SOC_NOPM, 0, 0,
> +			   pm4125_codec_enable_dmic,
> +			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_ADC_E("DMIC2", NULL, SND_SOC_NOPM, 1, 0,
> +			   pm4125_codec_enable_dmic,
> +			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +
> +	/* TX mixer widgets */
> +	SND_SOC_DAPM_MIXER_E("DMIC1_MIXER", SND_SOC_NOPM, 0,
> +			     0, dmic1_switch, ARRAY_SIZE(dmic1_switch),
> +			     NULL, SND_SOC_DAPM_PRE_PMU |
> +			     SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_MIXER_E("DMIC2_MIXER", SND_SOC_NOPM, 1,
> +			     0, dmic2_switch, ARRAY_SIZE(dmic2_switch),
> +			     NULL, SND_SOC_DAPM_PRE_PMU |
> +			     SND_SOC_DAPM_POST_PMD),
> +
> +	/* Output widgets */
> +	SND_SOC_DAPM_OUTPUT("DMIC1_OUTPUT"),
> +	SND_SOC_DAPM_OUTPUT("DMIC2_OUTPUT"),
> +};
> +
> +static const struct snd_soc_dapm_route pm4125_audio_map[] = {
> +	{ "ADC1_OUTPUT", NULL, "ADC1_MIXER" },
> +	{ "ADC1_MIXER", "Switch", "ADC1" },
> +	{ "ADC1", NULL, "AMIC1" },
> +
> +	{ "ADC2_OUTPUT", NULL, "ADC2_MIXER" },
> +	{ "ADC2_MIXER", "Switch", "ADC2" },
> +	{ "ADC2", NULL, "ADC2 MUX" },
> +	{ "ADC2 MUX", "INP3", "AMIC3" },
> +	{ "ADC2 MUX", "INP2", "AMIC2" },
> +
> +	{ "IN1_HPHL", NULL, "PA_VPOS" },
> +	{ "RX1", NULL, "IN1_HPHL" },
> +	{ "RDAC1", NULL, "RX1" },
> +	{ "HPHL_RDAC", "Switch", "RDAC1" },
> +	{ "HPHL PGA", NULL, "HPHL_RDAC" },
> +	{ "HPHL", NULL, "HPHL PGA" },
> +
> +	{ "IN2_HPHR", NULL, "PA_VPOS" },
> +	{ "RX2", NULL, "IN2_HPHR" },
> +	{ "RDAC2", NULL, "RX2" },
> +	{ "HPHR_RDAC", "Switch", "RDAC2" },
> +	{ "HPHR PGA", NULL, "HPHR_RDAC" },
> +	{ "HPHR", NULL, "HPHR PGA" },
> +
> +	{ "RDAC3", NULL, "RX1" },
> +	{ "EAR_RDAC", "Switch", "RDAC3" },
> +	{ "EAR PGA", NULL, "EAR_RDAC" },
> +	{ "EAR", NULL, "EAR PGA" },
> +
> +	{ "RDAC3", NULL, "RX1" },
> +	{ "LO_RDAC", "Switch", "RDAC3" },
> +	{ "LO PGA", NULL, "LO_RDAC" },
> +	{ "LO", NULL, "LO PGA" },
> +
> +	{ "DMIC1_OUTPUT", NULL, "DMIC1_MIXER" },
> +	{ "DMIC1_MIXER", "Switch", "DMIC1" },
> +
> +	{ "DMIC2_OUTPUT", NULL, "DMIC2_MIXER" },
> +	{ "DMIC2_MIXER", "Switch", "DMIC2" },
> +};
> +
> +static int pm4125_set_micbias_data(struct pm4125_priv *pm4125)
> +{
> +	int vout_ctl;
> +
> +	/* Set micbias voltage */
> +	vout_ctl = pm4125_get_micb_vout_ctl_val(pm4125->micb1_mv);
> +	if (vout_ctl < 0)
> +		return -EINVAL;
> +
> +	regmap_update_bits(pm4125->regmap, PM4125_ANA_MICBIAS_LDO_1_SETTING,
> +			   0xF8, vout_ctl << 3);
> +	return 0;
> +}
> +
> +static irqreturn_t pm4125_wd_handle_irq(int irq, void *data)
> +{
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct irq_chip pm4125_codec_irq_chip = {
> +	.name = "pm4125_codec",
> +};
> +
> +static int pm4125_codec_irq_chip_map(struct irq_domain *irqd, unsigned int virq,
> +				     irq_hw_number_t hw)
> +{
> +	irq_set_chip_and_handler(virq, &pm4125_codec_irq_chip,
> +				 handle_simple_irq);
> +	irq_set_nested_thread(virq, 1);
> +	irq_set_noprobe(virq);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops pm4125_domain_ops = {
> +	.map = pm4125_codec_irq_chip_map,
> +};
> +
> +static int pm4125_irq_init(struct pm4125_priv *pm4125, struct device *dev)
> +{
> +	pm4125->virq = irq_domain_add_linear(NULL, 1, &pm4125_domain_ops, NULL);
> +	if (!(pm4125->virq)) {
> +		dev_err(dev, "%s: Failed to add IRQ domain\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	return devm_regmap_add_irq_chip(dev, pm4125->regmap,
> +					irq_create_mapping(pm4125->virq, 0),
> +					IRQF_ONESHOT, 0,
> +					&pm4125_regmap_irq_chip,
> +					&pm4125->irq_chip);
> +}
> +
> +static int pm4125_soc_codec_probe(struct snd_soc_component *component)
> +{
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +	struct sdw_slave *tx_sdw_dev = pm4125->tx_sdw_dev;
> +	struct device *dev = component->dev;
> +	unsigned long time_left;
> +	int i, ret;
> +
> +	time_left = wait_for_completion_timeout(
> +					&tx_sdw_dev->initialization_complete,
> +					msecs_to_jiffies(5000));
> +	if (!time_left) {
> +		dev_err(dev, "soundwire device init timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	snd_soc_component_init_regmap(component, pm4125->regmap);
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	pm4125_io_init(pm4125->regmap);
> +
> +	/* Set all interrupts as edge triggered */
> +	for (i = 0; i < pm4125_regmap_irq_chip.num_regs; i++)
> +		regmap_write(pm4125->regmap,
> +			     (PM4125_DIG_SWR_INTR_LEVEL_0 + i), 0);
> +
> +	pm_runtime_put(dev);
> +
> +	pm4125->hphr_pdm_wd_int =
> +		regmap_irq_get_virq(pm4125->irq_chip,
> +				    PM4125_IRQ_HPHR_PDM_WD_INT);
> +	pm4125->hphl_pdm_wd_int =
> +		regmap_irq_get_virq(pm4125->irq_chip,
> +				    PM4125_IRQ_HPHL_PDM_WD_INT);
> +
> +	/* Request for watchdog interrupt */
> +	ret = devm_request_threaded_irq(dev, pm4125->hphr_pdm_wd_int, NULL,
> +					pm4125_wd_handle_irq,
> +					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
> +					"HPHR PDM WDOG INT", pm4125);
> +	if (ret)
> +		dev_err(dev, "Failed to request HPHR wdt interrupt: %d\n", ret);
> +
> +	ret = devm_request_threaded_irq(dev, pm4125->hphl_pdm_wd_int, NULL,
> +					pm4125_wd_handle_irq,
> +					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
> +					"HPHL PDM WDOG INT", pm4125);
> +	if (ret)
> +		dev_err(dev, "Failed to request HPHL wdt interrupt: %d\n", ret);
> +
> +	disable_irq_nosync(pm4125->hphr_pdm_wd_int);
> +	disable_irq_nosync(pm4125->hphl_pdm_wd_int);
> +
> +	ret = pm4125_mbhc_init(component);
> +	if (ret)
> +		dev_err(component->dev, "mbhc initialization failed\n");
> +
> +	return ret;
> +}
> +
> +static void pm4125_soc_codec_remove(struct snd_soc_component *component)
> +{
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +
> +	pm4125_mbhc_deinit(component);
> +	free_irq(pm4125->hphl_pdm_wd_int, pm4125);
> +	free_irq(pm4125->hphr_pdm_wd_int, pm4125);
> +}
> +
> +static int pm4125_codec_set_jack(struct snd_soc_component *comp,
> +				 struct snd_soc_jack *jack, void *data)
> +{
> +	struct pm4125_priv *pm4125 = dev_get_drvdata(comp->dev);
> +	int ret = 0;
> +
> +	if (jack)
> +		ret = wcd_mbhc_start(pm4125->wcd_mbhc, &pm4125->mbhc_cfg, jack);
> +	else
> +		wcd_mbhc_stop(pm4125->wcd_mbhc);
> +
> +	return ret;
> +}
> +
> +static const struct snd_soc_component_driver soc_codec_dev_pm4125 = {
> +	.name = "pm4125_codec",
> +	.probe = pm4125_soc_codec_probe,
> +	.remove = pm4125_soc_codec_remove,
> +	.controls = pm4125_snd_controls,
> +	.num_controls = ARRAY_SIZE(pm4125_snd_controls),
> +	.dapm_widgets = pm4125_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(pm4125_dapm_widgets),
> +	.dapm_routes = pm4125_audio_map,
> +	.num_dapm_routes = ARRAY_SIZE(pm4125_audio_map),
> +	.set_jack = pm4125_codec_set_jack,
> +	.endianness = 1,
> +};
> +
> +static void pm4125_dt_parse_micbias_info(struct device *dev,
> +					 struct pm4125_priv *priv)
> +{
> +	struct device_node *np = dev->of_node;
> +	u32 prop_val = 0;
> +	int ret;
> +
> +	ret = of_property_read_u32(np, "qcom,micbias1-microvolt", &prop_val);
> +	if (!ret)
> +		priv->micb1_mv = prop_val / 1000;
> +	else
> +		dev_warn(dev, "Micbias1 DT property not found\n");
> +
> +	ret = of_property_read_u32(np, "qcom,micbias2-microvolt", &prop_val);
> +	if (!ret)
> +		priv->micb2_mv = prop_val / 1000;
> +	else
> +		dev_warn(dev, "Micbias2 DT property not found\n");
> +
> +	ret = of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val);
> +	if (!ret)
> +		priv->micb3_mv = prop_val / 1000;
> +	else
> +		dev_warn(dev, "Micbias3 DT property not found\n");
> +}
> +
> +static bool pm4125_swap_gnd_mic(struct snd_soc_component *component)
> +{
> +	return true;

why true all the time? Isn't this suppose to control a mux or a gpio?


> +}
> +
> +static int pm4125_codec_hw_params(struct snd_pcm_substream *substream,
> +				  struct snd_pcm_hw_params *params,
> +				  struct snd_soc_dai *dai)
> +{
> +	struct pm4125_priv *pm4125 = dev_get_drvdata(dai->dev);
> +	struct pm4125_sdw_priv *sdw_priv = pm4125->sdw_priv[dai->id];
> +
> +	return pm4125_sdw_hw_params(sdw_priv, substream, params, dai);
> +}
> +
> +static int pm4125_codec_free(struct snd_pcm_substream *substream,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct pm4125_priv *pm4125 = dev_get_drvdata(dai->dev);
> +	struct pm4125_sdw_priv *sdw_priv = pm4125->sdw_priv[dai->id];
> +
> +	return sdw_stream_remove_slave(sdw_priv->sdev, sdw_priv->sruntime);
> +}
> +
> +static int pm4125_codec_set_sdw_stream(struct snd_soc_dai *dai, void *stream,
> +				       int direction)
> +{
> +	struct pm4125_priv *pm4125 = dev_get_drvdata(dai->dev);
> +	struct pm4125_sdw_priv *sdw_priv = pm4125->sdw_priv[dai->id];
> +
> +	sdw_priv->sruntime = stream;
> +
> +	return 0;
> +}
> +
> +static int pm4125_get_channel_map(const struct snd_soc_dai *dai,
> +				  unsigned int *tx_num, unsigned int *tx_slot,
> +				  unsigned int *rx_num, unsigned int *rx_slot)
> +{
> +	struct pm4125_priv *pm4125 = dev_get_drvdata(dai->dev);
> +	struct pm4125_sdw_priv *sdw_priv = pm4125->sdw_priv[dai->id];
> +	int i;
> +
> +	switch (dai->id) {
> +	case AIF1_PB:
> +		if (!rx_slot || !rx_num) {
> +			dev_err(dai->dev, "Invalid rx_slot %p or rx_num %p\n",
> +				rx_slot, rx_num);
> +			return -EINVAL;
> +		}
> +
> +		for (i = 0; i < SDW_MAX_PORTS; i++)
> +			rx_slot[i] = sdw_priv->master_channel_map[i];
> +
> +		*rx_num = i;
> +		break;
> +	case AIF1_CAP:
> +		if (!tx_slot || !tx_num) {
> +			dev_err(dai->dev, "Invalid tx_slot %p or tx_num %p\n",
> +				tx_slot, tx_num);
> +			return -EINVAL;
> +		}
> +
> +		for (i = 0; i < SDW_MAX_PORTS; i++)
> +			tx_slot[i] = sdw_priv->master_channel_map[i];
> +
> +		*tx_num = i;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_dai_ops pm4125_sdw_dai_ops = {
> +	.hw_params = pm4125_codec_hw_params,
> +	.hw_free = pm4125_codec_free,
> +	.set_stream = pm4125_codec_set_sdw_stream,
> +	.get_channel_map = pm4125_get_channel_map,
> +};
> +
> +static struct snd_soc_dai_driver pm4125_dais[] = {
> +	[0] = {
> +		.name = "pm4125-sdw-rx",
> +		.playback = {
> +			.stream_name = "WCD AIF Playback",
> +			.rates = PM4125_RATES | PM4125_FRAC_RATES,
> +			.formats = PM4125_FORMATS,
> +			.rate_min = 8000,
> +			.rate_max = 384000,
> +			.channels_min = 1,
> +			.channels_max = 4,
> +		},
> +		.ops = &pm4125_sdw_dai_ops,
> +	},
> +	[1] = {
> +		.name = "pm4125-sdw-tx",
> +		.capture = {
> +			.stream_name = "WCD AIF Capture",
> +			.rates = PM4125_RATES,
> +			.formats = PM4125_FORMATS,
> +			.rate_min = 8000,
> +			.rate_max = 192000,
> +			.channels_min = 1,
> +			.channels_max = 4,
> +		},
> +		.ops = &pm4125_sdw_dai_ops,
> +	},
> +};
> +
> +static int pm4125_bind(struct device *dev)
> +{
> +	struct pm4125_priv *pm4125 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* Give the SDW subdevices some more time to settle */
> +	usleep_range(15000, 15010);
> +
> +	ret = component_bind_all(dev, pm4125);
> +	if (ret) {
> +		dev_err(dev, "Slave bind failed, ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	pm4125->rxdev = pm4125_sdw_device_get(pm4125->rxnode);
> +	if (!pm4125->rxdev) {
> +		dev_err(dev, "could not find slave with matching of node\n");
> +		return -EINVAL;
> +	}
> +
> +	pm4125->sdw_priv[AIF1_PB] = dev_get_drvdata(pm4125->rxdev);
> +	pm4125->sdw_priv[AIF1_PB]->pm4125 = pm4125;
> +
> +	pm4125->txdev = pm4125_sdw_device_get(pm4125->txnode);
> +	if (!pm4125->txdev) {
> +		dev_err(dev, "could not find txslave with matching of node\n");
> +		return -EINVAL;
> +	}
> +
> +	pm4125->sdw_priv[AIF1_CAP] = dev_get_drvdata(pm4125->txdev);
> +	pm4125->sdw_priv[AIF1_CAP]->pm4125 = pm4125;
> +	pm4125->tx_sdw_dev = dev_to_sdw_dev(pm4125->txdev);
> +	if (!pm4125->tx_sdw_dev) {
> +		dev_err(dev, "could not get txslave with matching of dev\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * As TX is the main CSR reg interface, which should not be suspended first.
> +	 * expicilty add the dependency link
> +	 */
> +	if (!device_link_add(pm4125->rxdev, pm4125->txdev,
> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
> +		dev_err(dev, "Could not devlink TX and RX\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!device_link_add(dev, pm4125->txdev,
> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
> +		dev_err(dev, "Could not devlink WCD and TX\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!device_link_add(dev, pm4125->rxdev,
> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
> +		dev_err(dev, "Could not devlink WCD and RX\n");
> +		return -EINVAL;
> +	}
> +
> +	pm4125->regmap = dev_get_regmap(&pm4125->tx_sdw_dev->dev, NULL);
> +	if (!pm4125->regmap) {
> +		dev_err(dev, "could not get TX device regmap\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = pm4125_irq_init(pm4125, dev);
> +	if (ret) {
> +		dev_err(dev, "IRQ init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	pm4125->sdw_priv[AIF1_PB]->slave_irq = pm4125->virq;
> +	pm4125->sdw_priv[AIF1_CAP]->slave_irq = pm4125->virq;
> +
> +	ret = pm4125_set_micbias_data(pm4125);
> +	if (ret < 0) {
> +		dev_err(dev, "Bad micbias pdata\n");
> +		return ret;
> +	}
> +
> +	ret = snd_soc_register_component(dev, &soc_codec_dev_pm4125,
> +					 pm4125_dais, ARRAY_SIZE(pm4125_dais));
> +	if (ret)
> +		dev_err(dev, "Codec registration failed\n");
> +
> +	return ret;
> +}
> +
> +static void pm4125_unbind(struct device *dev)
> +{
> +	struct pm4125_priv *pm4125 = dev_get_drvdata(dev);
> +
> +	snd_soc_unregister_component(dev);
> +	device_link_remove(dev, pm4125->txdev);
> +	device_link_remove(dev, pm4125->rxdev);
> +	device_link_remove(pm4125->rxdev, pm4125->txdev);
> +	component_unbind_all(dev, pm4125);
> +}
> +
> +static const struct component_master_ops pm4125_comp_ops = {
> +	.bind = pm4125_bind,
> +	.unbind = pm4125_unbind,
> +};
> +
> +static int pm4125_add_slave_components(struct pm4125_priv *pm4125,
> +				       struct device *dev,
> +				       struct component_match **matchptr)
> +{
> +	struct device_node *np = dev->of_node;
> +
> +	pm4125->rxnode = of_parse_phandle(np, "qcom,rx-device", 0);
> +	if (!pm4125->rxnode) {
> +		dev_err(dev, "Couldn't parse phandle to qcom,rx-device!\n");
> +		return -ENODEV;
> +	}
> +	of_node_get(pm4125->rxnode);
> +	component_match_add_release(dev, matchptr, component_release_of,
> +				    component_compare_of, pm4125->rxnode);
> +
> +	pm4125->txnode = of_parse_phandle(np, "qcom,tx-device", 0);
> +	if (!pm4125->txnode) {
> +		dev_err(dev, "Couldn't parse phandle to qcom,tx-device\n");
> +			return -ENODEV;
> +	}
> +	of_node_get(pm4125->txnode);
> +	component_match_add_release(dev, matchptr, component_release_of,
> +				    component_compare_of, pm4125->txnode);
> +
> +	return 0;
> +}
> +
> +static int pm4125_probe(struct platform_device *pdev)
> +{
> +	struct component_match *match = NULL;
> +	struct device *dev = &pdev->dev;
> +	struct pm4125_priv *pm4125;
> +	struct wcd_mbhc_config *cfg;
> +	int ret;
> +
> +	pm4125 = devm_kzalloc(dev, sizeof(*pm4125), GFP_KERNEL);
> +	if (!pm4125)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, pm4125);
> +
> +	cfg = &pm4125->mbhc_cfg;
> +	cfg->swap_gnd_mic = pm4125_swap_gnd_mic;
> +
> +	pm4125->supplies[0].supply = "vdd-io";
> +	pm4125->supplies[1].supply = "vdd-cp";
> +	pm4125->supplies[2].supply = "vdd-mic-bias";
> +	pm4125->supplies[3].supply = "vdd-pa-vpos";
> +
> +	ret = devm_regulator_bulk_get(dev, PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get supplies\n");
> +
> +	ret = regulator_bulk_enable(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
> +	if (ret) {
> +		regulator_bulk_free(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
> +		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
> +	}
> +
> +	pm4125_dt_parse_micbias_info(dev, pm4125);
> +
> +	cfg->mbhc_micbias = MIC_BIAS_2;
> +	cfg->anc_micbias = MIC_BIAS_2;
> +	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
> +	cfg->num_btn = PM4125_MBHC_MAX_BUTTONS;
> +	cfg->micb_mv = pm4125->micb2_mv;
> +	cfg->linein_th = 5000;
> +	cfg->hs_thr = 1700;
> +	cfg->hph_thr = 50;
> +
> +	pm4125->spmi_regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!pm4125->spmi_regmap)
> +		return -ENXIO;
> +
> +	pm4125_reset(pm4125);
> +
> +	wcd_dt_parse_mbhc_data(dev, &pm4125->mbhc_cfg);
> +
> +	ret = pm4125_add_slave_components(pm4125, dev, &match);
> +	if (ret)
> +		goto err_disable_regulators;
> +
> +	ret = component_master_add_with_match(dev, &pm4125_comp_ops, match);
> +	if (ret)
> +		goto err_disable_regulators;
> +
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	return 0;
> +
> +err_disable_regulators:
> +	regulator_bulk_disable(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
> +	regulator_bulk_free(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
> +
> +	return ret;
> +}
> +
> +static void pm4125_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct pm4125_priv *pm4125 = dev_get_drvdata(dev);
> +
> +	component_master_del(&pdev->dev, &pm4125_comp_ops);
> +
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +
> +	regulator_bulk_disable(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
> +	regulator_bulk_free(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
> +}
> +
> +#if defined(CONFIG_OF)
> +static const struct of_device_id pm4125_of_match[] = {
> +	{ .compatible = "qcom,pm4125-codec" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, pm4125_of_match);
> +#endif
> +
> +static struct platform_driver pm4125_codec_driver = {
> +	.probe = pm4125_probe,
> +	.remove = pm4125_remove,
> +	.driver = {
> +		.name = "pm4125_codec",
> +		.of_match_table = of_match_ptr(pm4125_of_match),
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +
> +module_platform_driver(pm4125_codec_driver);
> +MODULE_DESCRIPTION("PM4125 audio codec driver");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/codecs/pm4125.h b/sound/soc/codecs/pm4125.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..2c5e8218202d92a0adc493413368991a406471b0
> --- /dev/null
> +++ b/sound/soc/codecs/pm4125.h
> @@ -0,0 +1,375 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _PM4125_REGISTERS_H
> +#define _PM4125_REGISTERS_H
> +
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_type.h>
> +
> +#define PM4125_ANA_BASE_ADDR	0x3000
> +#define PM4125_DIG_BASE_ADDR	0x3400
> +
> +#define PM4125_REG(reg)	((reg > PM4125_DIG_BASE_ADDR) ? \
> +			 (reg - PM4125_DIG_BASE_ADDR) : \
> +			 (reg - PM4125_ANA_BASE_ADDR))
> +
> +enum {
> +	REG_NO_ACCESS,
> +	RD_REG,
> +	WR_REG,
> +	RD_WR_REG
> +};
> +
Both PM4125_REG(), and RD/WR_REG does not make sense, please use the
registers directly in the regmap config callbacks.

...
> +#define PM4125_MAX_MICBIAS			3
> +#define PM4125_MAX_BULK_SUPPLY			4
> +#define PM4125_MAX_SWR_CH_IDS			15
> +#define PM4125_SWRM_CH_MASK(ch_idx)		BIT(ch_idx - 1)
> +
> +enum pm4125_tx_sdw_ports {
> +	PM4125_ADC_1_PORT = 1,
> +	PM4125_DMIC_0_3_MBHC_PORT,
> +	PM4125_MAX_TX_SWR_PORTS = PM4125_DMIC_0_3_MBHC_PORT,
> +};
> +
> +enum pm4125_rx_sdw_ports {
> +	PM4125_HPH_PORT = 1,
> +	PM4125_COMP_PORT,
> +	PM4125_MAX_SWR_PORTS = PM4125_COMP_PORT,
> +};
> +
> +struct pm4125_sdw_ch_info {
> +	int port_num;
> +	unsigned int ch_mask;
> +	unsigned int master_ch_mask;
> +};
> +
> +#define WCD_SDW_CH(id, pn, cmask)	\
> +	[id] = {			\
> +		.port_num = pn,		\
> +		.ch_mask = cmask,	\
> +		.master_ch_mask = cmask,	\
> +	}
> +
> +struct pm4125_priv;
> +struct pm4125_sdw_priv {
> +	struct sdw_slave *sdev;
> +	struct sdw_stream_config sconfig;
> +	struct sdw_stream_runtime *sruntime;
> +	struct sdw_port_config port_config[PM4125_MAX_SWR_PORTS];
> +	struct pm4125_sdw_ch_info *ch_info;
> +	bool port_enable[PM4125_MAX_SWR_CH_IDS];
> +	unsigned int master_channel_map[SDW_MAX_PORTS];
> +	int active_ports;
> +	int num_ports;
> +	bool is_tx;
> +	struct pm4125_priv *pm4125;
> +	struct irq_domain *slave_irq;
> +	struct regmap *regmap;
> +};
> +
> +#if IS_ENABLED(CONFIG_SND_SOC_PM4125_SDW)
> +int pm4125_sdw_free(struct pm4125_sdw_priv *pm4125,
> +		    struct snd_pcm_substream *substream,
> +		    struct snd_soc_dai *dai);
> +int pm4125_sdw_set_sdw_stream(struct pm4125_sdw_priv *pm4125,
> +			      struct snd_soc_dai *dai,
> +			      void *stream, int direction);
> +int pm4125_sdw_hw_params(struct pm4125_sdw_priv *pm4125,
> +			 struct snd_pcm_substream *substream,
> +			 struct snd_pcm_hw_params *params,
> +			 struct snd_soc_dai *dai);
> +
> +struct device *pm4125_sdw_device_get(struct device_node *np);
> +
> +#else
> +int pm4125_sdw_free(struct pm4125_sdw_priv *pm4125,
Should this be static inline, if not you will endup with multiple
defination of the function.
same for other stubs too.

> +		    struct snd_pcm_substream *substream,
> +		    struct snd_soc_dai *dai)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +int pm4125_sdw_set_sdw_stream(struct pm4125_sdw_priv *pm4125,
> +			      struct snd_soc_dai *dai,
> +			      void *stream, int direction)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +int pm4125_sdw_hw_params(struct pm4125_sdw_priv *pm4125,
> +			 struct snd_pcm_substream *substream,
> +			 struct snd_pcm_hw_params *params,
> +			 struct snd_soc_dai *dai)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
> +enum {
> +	/* INTR_CTRL_INT_MASK_0 */
> +	PM4125_IRQ_MBHC_BUTTON_PRESS_DET = 0,
> +	PM4125_IRQ_MBHC_BUTTON_RELEASE_DET,
> +	PM4125_IRQ_MBHC_ELECT_INS_REM_DET,
> +	PM4125_IRQ_MBHC_ELECT_INS_REM_LEG_DET,
> +	PM4125_IRQ_MBHC_SW_DET,
> +	PM4125_IRQ_HPHR_OCP_INT,
> +	PM4125_IRQ_HPHR_CNP_INT,
> +	PM4125_IRQ_HPHL_OCP_INT,
> +
> +	/* INTR_CTRL_INT_MASK_1 */
> +	PM4125_IRQ_HPHL_CNP_INT,
> +	PM4125_IRQ_EAR_CNP_INT,
> +	PM4125_IRQ_EAR_SCD_INT,
> +	PM4125_IRQ_AUX_CNP_INT,
> +	PM4125_IRQ_AUX_SCD_INT,
> +	PM4125_IRQ_HPHL_PDM_WD_INT,
> +	PM4125_IRQ_HPHR_PDM_WD_INT,
> +	PM4125_IRQ_AUX_PDM_WD_INT,
> +
> +	/* INTR_CTRL_INT_MASK_2 */
> +	PM4125_IRQ_LDORT_SCD_INT,
> +	PM4125_IRQ_MBHC_MOISTURE_INT,
> +	PM4125_IRQ_HPHL_SURGE_DET_INT,
> +	PM4125_IRQ_HPHR_SURGE_DET_INT,
> +	PM4125_NUM_IRQS,
> +};
> +
> +enum pm4125_tx_sdw_channels {
> +	PM4125_ADC1,
> +	PM4125_ADC2,
> +	PM4125_ADC3,
> +	PM4125_DMIC0,
> +	PM4125_DMIC1,
> +	PM4125_MBHC,
> +	PM4125_DMIC2,
> +	PM4125_DMIC3,
> +	PM4125_DMIC4,
> +	PM4125_DMIC5,
> +	PM4125_DMIC6,
do we really have so many channels on TX, AFAIU, its only 2 channels and
two lanes.
> +};
> +
> +enum pm4125_rx_sdw_channels {
> +	PM4125_HPH_L,
> +	PM4125_HPH_R,
> +	PM4125_CLSH,
> +	PM4125_COMP_L,
> +	PM4125_COMP_R,
> +	PM4125_LO,
> +	PM4125_DSD_R,
> +	PM4125_DSD_L,
Do we have so many channes? AFAIU, this is only 4 channels and 1 lane.

> +};
> +
> +#endif /* _PM4125_REGISTERS_H */
> 


