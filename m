Return-Path: <linux-arm-msm+bounces-12921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B25F86BA86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 23:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E9B01C21EC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 22:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8673C1361AF;
	Wed, 28 Feb 2024 22:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UCW6aDwP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AFC1361A5;
	Wed, 28 Feb 2024 22:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709157917; cv=none; b=QZ2ggte4LH9vz/O4KT8ENjnUkSLktSwoD/FO7GL3382U6G1NCUHZGQPx39+64yKWB6OvROn7A2d4cPqGOHUQ7sEVGtCIdRJFDLaQxd+LnT2xK7fqH08xVdhZOV4iTkW00KyphT49HZFsd1y/yM+sdMbY7VYMj50jd/SQrQBS++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709157917; c=relaxed/simple;
	bh=11t/FTRE0cf2EqjDh4YJsGKcZxm59XASKPdmoWaqNCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OpBbAWEuufH+ACkZ/f/jlnvA9eIxVtAUlMuerws7zQrP7Eg51lYXusU60I/5KOM7wp2MHXszFLg+rE4Nsh4VaXmOvb+xPED5q3QN9PFxAWXNxBBaRMeUH8xmPZqEdFNZnW01zE2/hw+ILuESimjRVvwFc/HghBv69POpn1uWw84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UCW6aDwP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41SKT5Nh004597;
	Wed, 28 Feb 2024 22:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=5lN3aH6J7KARNWoMolvJiFw86gWoxQtAUt3u8IOAS1w=; b=UC
	W6aDwP1HglPeKsNVWw9gT4qh2ZVe61vIyMUoTBhCDlKdLxXdmBgDpcPd2RseGy/o
	ovorH0AV7Ko/BCbW090jPH7hlYlTmlgf0tB5YV1l/ms/IRJCM4b8cfc4AP9o/RJl
	z90AIln+276DHbdfdCKP2X9FBDH44uYid8sj2Wo+OIxjOaZQIhG0sqDVg4uJJhWM
	224ymikhab3EHeYumhc+dFbRcMghoRThn2sK2k+B6VW0ZeOiD7WeGA7/A/4K7zBK
	NEEjBQawZ7P4NK+qqUM7/8IVqxz6lPm7w9gKVdGz0F6juWILs71GV8V/wHVCtPdt
	fDrifIGNo/ulw9DLlQKg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wj1d9sy7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 22:04:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41SM4sKm011037
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 22:04:54 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 28 Feb
 2024 14:04:53 -0800
Message-ID: <ffa82d23-2731-4126-bcfc-2dd82255c0f6@quicinc.com>
Date: Wed, 28 Feb 2024 14:04:53 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/panel: add samsung s6e3fa7 panel driver
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg
	<sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter
	<daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20240209001639.387374-6-mailingradian@gmail.com>
 <20240209001639.387374-8-mailingradian@gmail.com>
 <09ef60d6-8404-4a2f-b2f5-8cd77668e4f0@quicinc.com> <ZcayjJxSKwprA0y_@radian>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <ZcayjJxSKwprA0y_@radian>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xnJWLzOqwQhP10btwP4z6gmLWkDBB_TK
X-Proofpoint-ORIG-GUID: xnJWLzOqwQhP10btwP4z6gmLWkDBB_TK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280175



On 2/9/2024 3:17 PM, Richard Acayan wrote:
> On Thu, Feb 08, 2024 at 05:34:57PM -0800, Jessica Zhang wrote:
>> On 2/8/2024 4:16 PM, Richard Acayan wrote:
>>> The S6E3FA7 display controller is enabled in every Pixel 3a (non-XL)
>>> variant. Add the driver for it, generated by
>>> linux-mdss-dsi-panel-driver-generator.
>>>
>>> There are other panels connected to the same S6E3FA7 display controller,
>>> such as the AMS604NL01 panel, which are incompatible with this driver.
>>> Name the device tree compatible after the panel model according to
>>> iFixit.
>>>
>>> Link: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
>>> Link: https://android.googlesource.com/kernel/msm/+/7fda1cd7b64710dafac5f34899611c6d35eb4cd2/arch/arm64/boot/dts/google/dsi-panel-s6e3fa7-1080p-cmd.dtsi
>>> Link: https://github.com/msm8953-mainline/linux/blob/v6.6.12-r0/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
>>> Link: https://www.ifixit.com/Guide/Image/meta/muyjtLQTHu6MDkhK
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---
>>>    drivers/gpu/drm/panel/Kconfig                 |   9 +
>>>    drivers/gpu/drm/panel/Makefile                |   1 +
>>>    drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c | 285 ++++++++++++++++++
>>>    3 files changed, 295 insertions(+)
>>>    create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
>>>
>>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>>> index 8f3783742208..a693b03f680e 100644
>>> --- a/drivers/gpu/drm/panel/Kconfig
>>> +++ b/drivers/gpu/drm/panel/Kconfig
>>> @@ -577,6 +577,15 @@ config DRM_PANEL_SAMSUNG_DB7430
>>>    	  DB7430 DPI display controller used in such devices as the
>>>    	  LMS397KF04 480x800 DPI panel.
>>> +config DRM_PANEL_SAMSUNG_S6E3FA7
>>> +	tristate "Samsung S6E3FA7 panel driver"
>>> +	depends on OF
>>> +	depends on DRM_MIPI_DSI
>>> +	depends on BACKLIGHT_CLASS_DEVICE
>>> +	help
>>> +	  Say Y here if you want to enable support for the Samsung S6E3FA7
>>> +	  1920x2220 panel.
>>> +
>>>    config DRM_PANEL_SAMSUNG_S6D16D0
>>>    	tristate "Samsung S6D16D0 DSI video mode panel"
>>>    	depends on OF
>>> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
>>> index d94a644d0a6c..560b62129f68 100644
>>> --- a/drivers/gpu/drm/panel/Makefile
>>> +++ b/drivers/gpu/drm/panel/Makefile
>>> @@ -59,6 +59,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
>>>    obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
>>>    obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
>>>    obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0) += panel-samsung-s6d7aa0.o
>>> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FA7) += panel-samsung-s6e3fa7.o
>>>    obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o
>>>    obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
>>>    obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0) += panel-samsung-s6e63m0.o
>>> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c b/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
>>> new file mode 100644
>>> index 000000000000..10bc8fb5f1f9
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
>>> @@ -0,0 +1,285 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Driver for the Samsung S6E3FA7 panel.
>>> + *
>>> + * Copyright (c) 2022-2024, The Linux Foundation. All rights reserved.
>>
>>
>> Hi Richard,
>>
>> Not really sure about the copyright dates -- since this is a completely new
>> file to this tree, wouldn't the year be just 2024?
> 
> That would be more concise, but the original driver was generated and
> added to a kernel fork [1] in 2022 and amendments have been made since then.

Ah, got it. Sounds good.

In that case

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> [1] https://gitlab.com/sdm670-mainline/linux/-/blob/sdm670-v6.2.6/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c?ref_type=tags
> 
>>
>> The rest LGTM.
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
>>> + * Copyright (c) 2013, The Linux Foundation. All rights reserved.
>>> + */ > +
>>> +#include <linux/backlight.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +
>>> +#include <video/mipi_display.h>
>>> +
>>> +#include <drm/drm_mipi_dsi.h>
>>> +#include <drm/drm_modes.h>
>>> +#include <drm/drm_panel.h>
>>> +
>>> +struct s6e3fa7_panel {
>>> +	struct drm_panel panel;
>>> +	struct mipi_dsi_device *dsi;
>>> +	struct gpio_desc *reset_gpio;
>>> +};
>>> +
>>> +static inline struct s6e3fa7_panel *to_s6e3fa7_panel(struct drm_panel *panel)
>>> +{
>>> +	return container_of(panel, struct s6e3fa7_panel, panel);
>>> +}
>>> +
>>> +static void s6e3fa7_panel_reset(struct s6e3fa7_panel *ctx)
>>> +{
>>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>> +	usleep_range(1000, 2000);
>>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>>> +	usleep_range(10000, 11000);
>>> +}
>>> +
>>> +static int s6e3fa7_panel_on(struct s6e3fa7_panel *ctx)
>>> +{
>>> +	struct mipi_dsi_device *dsi = ctx->dsi;
>>> +	struct device *dev = &dsi->dev;
>>> +	int ret;
>>> +
>>> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +	msleep(120);
>>> +
>>> +	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "Failed to set tear on: %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
>>> +	mipi_dsi_dcs_write_seq(dsi, 0xf4,
>>> +			       0xbb, 0x23, 0x19, 0x3a, 0x9f, 0x0f, 0x09, 0xc0,
>>> +			       0x00, 0xb4, 0x37, 0x70, 0x79, 0x69);
>>> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
>>> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>>> +
>>> +	ret = mipi_dsi_dcs_set_display_on(dsi);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "Failed to set display on: %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int s6e3fa7_panel_prepare(struct drm_panel *panel)
>>> +{
>>> +	struct s6e3fa7_panel *ctx = to_s6e3fa7_panel(panel);
>>> +	struct device *dev = &ctx->dsi->dev;
>>> +	int ret;
>>> +
>>> +	s6e3fa7_panel_reset(ctx);
>>> +
>>> +	ret = s6e3fa7_panel_on(ctx);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
>>> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>> +		return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int s6e3fa7_panel_unprepare(struct drm_panel *panel)
>>> +{
>>> +	struct s6e3fa7_panel *ctx = to_s6e3fa7_panel(panel);
>>> +
>>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int s6e3fa7_panel_disable(struct drm_panel *panel)
>>> +{
>>> +	struct s6e3fa7_panel *ctx = to_s6e3fa7_panel(panel);
>>> +	struct mipi_dsi_device *dsi = ctx->dsi;
>>> +	struct device *dev = &dsi->dev;
>>> +	int ret;
>>> +
>>> +	ret = mipi_dsi_dcs_set_display_off(dsi);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "Failed to set display off: %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +	msleep(120);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct drm_display_mode s6e3fa7_panel_mode = {
>>> +	.clock = (1080 + 32 + 32 + 78) * (2220 + 32 + 4 + 78) * 60 / 1000,
>>> +	.hdisplay = 1080,
>>> +	.hsync_start = 1080 + 32,
>>> +	.hsync_end = 1080 + 32 + 32,
>>> +	.htotal = 1080 + 32 + 32 + 78,
>>> +	.vdisplay = 2220,
>>> +	.vsync_start = 2220 + 32,
>>> +	.vsync_end = 2220 + 32 + 4,
>>> +	.vtotal = 2220 + 32 + 4 + 78,
>>> +	.width_mm = 62,
>>> +	.height_mm = 127,
>>> +};
>>> +
>>> +static int s6e3fa7_panel_get_modes(struct drm_panel *panel,
>>> +				 struct drm_connector *connector)
>>> +{
>>> +	struct drm_display_mode *mode;
>>> +
>>> +	mode = drm_mode_duplicate(connector->dev, &s6e3fa7_panel_mode);
>>> +	if (!mode)
>>> +		return -ENOMEM;
>>> +
>>> +	drm_mode_set_name(mode);
>>> +
>>> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>>> +	connector->display_info.width_mm = mode->width_mm;
>>> +	connector->display_info.height_mm = mode->height_mm;
>>> +	drm_mode_probed_add(connector, mode);
>>> +
>>> +	return 1;
>>> +}
>>> +
>>> +static const struct drm_panel_funcs s6e3fa7_panel_funcs = {
>>> +	.prepare = s6e3fa7_panel_prepare,
>>> +	.unprepare = s6e3fa7_panel_unprepare,
>>> +	.disable = s6e3fa7_panel_disable,
>>> +	.get_modes = s6e3fa7_panel_get_modes,
>>> +};
>>> +
>>> +static int s6e3fa7_panel_bl_update_status(struct backlight_device *bl)
>>> +{
>>> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
>>> +	u16 brightness = backlight_get_brightness(bl);
>>> +	int ret;
>>> +
>>> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int s6e3fa7_panel_bl_get_brightness(struct backlight_device *bl)
>>> +{
>>> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
>>> +	u16 brightness;
>>> +	int ret;
>>> +
>>> +	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	return brightness;
>>> +}
>>> +
>>> +static const struct backlight_ops s6e3fa7_panel_bl_ops = {
>>> +	.update_status = s6e3fa7_panel_bl_update_status,
>>> +	.get_brightness = s6e3fa7_panel_bl_get_brightness,
>>> +};
>>> +
>>> +static struct backlight_device *
>>> +s6e3fa7_panel_create_backlight(struct mipi_dsi_device *dsi)
>>> +{
>>> +	struct device *dev = &dsi->dev;
>>> +	const struct backlight_properties props = {
>>> +		.type = BACKLIGHT_RAW,
>>> +		.brightness = 1023,
>>> +		.max_brightness = 1023,
>>> +	};
>>> +
>>> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
>>> +					      &s6e3fa7_panel_bl_ops, &props);
>>> +}
>>> +
>>> +static int s6e3fa7_panel_probe(struct mipi_dsi_device *dsi)
>>> +{
>>> +	struct device *dev = &dsi->dev;
>>> +	struct s6e3fa7_panel *ctx;
>>> +	int ret;
>>> +
>>> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>> +	if (!ctx)
>>> +		return -ENOMEM;
>>> +
>>> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>>> +	if (IS_ERR(ctx->reset_gpio))
>>> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
>>> +				     "Failed to get reset-gpios\n");
>>> +
>>> +	ctx->dsi = dsi;
>>> +	mipi_dsi_set_drvdata(dsi, ctx);
>>> +
>>> +	dsi->lanes = 4;
>>> +	dsi->format = MIPI_DSI_FMT_RGB888;
>>> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
>>> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
>>> +
>>> +	drm_panel_init(&ctx->panel, dev, &s6e3fa7_panel_funcs,
>>> +		       DRM_MODE_CONNECTOR_DSI);
>>> +	ctx->panel.prepare_prev_first = true;
>>> +
>>> +	ctx->panel.backlight = s6e3fa7_panel_create_backlight(dsi);
>>> +	if (IS_ERR(ctx->panel.backlight))
>>> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
>>> +				     "Failed to create backlight\n");
>>> +
>>> +	drm_panel_add(&ctx->panel);
>>> +
>>> +	ret = mipi_dsi_attach(dsi);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
>>> +		drm_panel_remove(&ctx->panel);
>>> +		return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void s6e3fa7_panel_remove(struct mipi_dsi_device *dsi)
>>> +{
>>> +	struct s6e3fa7_panel *ctx = mipi_dsi_get_drvdata(dsi);
>>> +	int ret;
>>> +
>>> +	ret = mipi_dsi_detach(dsi);
>>> +	if (ret < 0)
>>> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
>>> +
>>> +	drm_panel_remove(&ctx->panel);
>>> +}
>>> +
>>> +static const struct of_device_id s6e3fa7_panel_of_match[] = {
>>> +	{ .compatible = "samsung,s6e3fa7-ams559nk06" },
>>> +	{ /* sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, s6e3fa7_panel_of_match);
>>> +
>>> +static struct mipi_dsi_driver s6e3fa7_panel_driver = {
>>> +	.probe = s6e3fa7_panel_probe,
>>> +	.remove = s6e3fa7_panel_remove,
>>> +	.driver = {
>>> +		.name = "panel-samsung-s6e3fa7",
>>> +		.of_match_table = s6e3fa7_panel_of_match,
>>> +	},
>>> +};
>>> +module_mipi_dsi_driver(s6e3fa7_panel_driver);
>>> +
>>> +MODULE_AUTHOR("Richard Acayan <mailingradian@gmail.com>");
>>> +MODULE_DESCRIPTION("DRM driver for Samsung S6E3FA7 command mode DSI panel");
>>> +MODULE_LICENSE("GPL");
>>> -- 
>>> 2.43.0
>>>
>>>
> 

