Return-Path: <linux-arm-msm+bounces-1311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B823F7F2820
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 09:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAF291C20CEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 08:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C0A2111E;
	Tue, 21 Nov 2023 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lJcTTwaI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26333122
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 00:54:58 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40806e4106dso15990905e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 00:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700556896; x=1701161696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otq3ALRxe++QUvLrV4/TVquGRndcT0xfQrH6cb3Rskg=;
        b=lJcTTwaIWujSEjxxc9wBSl9wRQP0mI6jHgo5EeaO8DrebN/dTsZl89bqWdavRUybja
         Zs6gy7K8trKds8clzxv2FVusCs+P+HJOAP3wPB4VUrZvsWocsPpFYOmMuAe5u2gRw/Re
         /7ENGq+np8kO6DdbGax5cHCTzKGZc8RBWebb+cwTIz9n97rfEqPrq8cwfiB5tVmUvvxt
         HY6m5XspDgta6Ru6JFd/W+gomCGFz8w2DISJ6Qvb0bscjdNWDaUqZkELyCi0T+e4ySxC
         Vu2yftSbrylhQq8kjLDEt3UZK0qVK82Gy7Fe9sUx0B8QR7Ji8JlpyATJYuhEaNfiuIxt
         axOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700556896; x=1701161696;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=otq3ALRxe++QUvLrV4/TVquGRndcT0xfQrH6cb3Rskg=;
        b=AbiwEf3KMc9X6AaCnjGA42o2G6z6IrtWDW08mrdiJNFCBbH9MWHPstRS+0u7JtiibC
         aUopVBdnMYXjELcpdzbwKGpXJGZ+gJp+v2oZ30QXPtY/l/IE4x+TITOCzSBUueLdcCzm
         BycdyyUym0hlozgHXHOulAQk8aV2CPl43lbTkWFxpozz4qVETUgcy2pUx0gOu6UYNTZi
         m+GpohxwkjO7+hEZ4o579+dFBW9qjSY/0pjfmG7QNBvbmAv2K2FyzKfM1PyqdhVgeY/z
         ox0nbc/B5wk3S4VvZAKzCNMNQW9Wzz9QdM21NoECzFaOIFXYEFGHFd83wvUptXIwxLCP
         LfZw==
X-Gm-Message-State: AOJu0YyL4TK1VkgbjWjifPicYyhvgdDsvH61/8ThDNAKnaA/YsQ0KxPU
	lPCInolLTin4QNcp9YgfopZsZg==
X-Google-Smtp-Source: AGHT+IFADuqm6L4CxUTwIxunECOPJfoAiZe6Pg6csuXZHkljgO0oDrkbXSkDGqblPsEZ5abWzF4WnQ==
X-Received: by 2002:a05:600c:5ca:b0:408:36bb:5b0c with SMTP id p10-20020a05600c05ca00b0040836bb5b0cmr1580274wmd.7.1700556896172;
        Tue, 21 Nov 2023 00:54:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2a39:bc19:20b6:16a? ([2a01:e0a:982:cbb0:2a39:bc19:20b6:16a])
        by smtp.gmail.com with ESMTPSA id m10-20020a7bca4a000000b00407b93d8085sm20147567wml.27.2023.11.21.00.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 00:54:55 -0800 (PST)
Message-ID: <8e029bc5-3abf-462d-8a20-3ac5180da8bd@linaro.org>
Date: Tue, 21 Nov 2023 09:54:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v6 4/6] drm/bridge: implement generic DP HPD bridge
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
 <20231103230414.1483428-5-dmitry.baryshkov@linaro.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20231103230414.1483428-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2023 00:03, Dmitry Baryshkov wrote:
> Several USB-C controllers implement a pretty simple DRM bridge which
> implements just the HPD notification operations. Add special helper
> for creating such simple bridges.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/Kconfig          |   8 ++
>   drivers/gpu/drm/bridge/Makefile         |   1 +
>   drivers/gpu/drm/bridge/aux-hpd-bridge.c | 164 ++++++++++++++++++++++++
>   include/drm/bridge/aux-bridge.h         |  18 +++
>   4 files changed, 191 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index f12eab62799f..19d2dc05c397 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -21,6 +21,14 @@ config DRM_AUX_BRIDGE
>   	  Simple transparent bridge that is used by several non-DRM drivers to
>   	  build bridges chain.
>   
> +config DRM_AUX_HPD_BRIDGE
> +	tristate
> +	depends on DRM_BRIDGE && OF
> +	select AUXILIARY_BUS
> +	help
> +	  Simple bridge that terminates the bridge chain and provides HPD
> +	  support.
> +
>   menu "Display Interface Bridges"
>   	depends on DRM && DRM_BRIDGE
>   
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 918e3bfff079..017b5832733b 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
> +obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
>   obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
>   obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>   obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> new file mode 100644
> index 000000000000..4defac8ec63f
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + *
> + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> + */
> +#include <linux/auxiliary_bus.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +
> +#include <drm/drm_bridge.h>
> +#include <drm/bridge/aux-bridge.h>
> +
> +static DEFINE_IDA(drm_aux_hpd_bridge_ida);
> +
> +struct drm_aux_hpd_bridge_data {
> +	struct drm_bridge bridge;
> +	struct device *dev;
> +};
> +
> +static void drm_aux_hpd_bridge_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +	ida_free(&drm_aux_hpd_bridge_ida, adev->id);
> +
> +	of_node_put(adev->dev.platform_data);
> +
> +	kfree(adev);
> +}
> +
> +static void drm_aux_hpd_bridge_unregister_adev(void *_adev)
> +{
> +	struct auxiliary_device *adev = _adev;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +/**
> + * drm_dp_hpd_bridge_register - Create a simple HPD DisplayPort bridge
> + * @parent: device instance providing this bridge
> + * @np: device node pointer corresponding to this bridge instance
> + *
> + * Creates a simple DRM bridge with the type set to
> + * DRM_MODE_CONNECTOR_DisplayPort, which terminates the bridge chain and is
> + * able to send the HPD events.
> + *
> + * Return: device instance that will handle created bridge or an error code
> + * encoded into the pointer.
> + */
> +struct device *drm_dp_hpd_bridge_register(struct device *parent,
> +					  struct device_node *np)
> +{
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> +	if (!adev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = ida_alloc(&drm_aux_hpd_bridge_ida, GFP_KERNEL);
> +	if (ret < 0) {
> +		kfree(adev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	adev->id = ret;
> +	adev->name = "dp_hpd_bridge";
> +	adev->dev.parent = parent;
> +	adev->dev.of_node = parent->of_node;
> +	adev->dev.release = drm_aux_hpd_bridge_release;
> +	adev->dev.platform_data = np;
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret) {
> +		ida_free(&drm_aux_hpd_bridge_ida, adev->id);
> +		kfree(adev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret = devm_add_action_or_reset(parent, drm_aux_hpd_bridge_unregister_adev, adev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return &adev->dev;
> +
> +}
> +EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
> +
> +/**
> + * drm_aux_hpd_bridge_notify - notify hot plug detection events
> + * @dev: device created for the HPD bridge
> + * @status: output connection status
> + *
> + * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
> + * detection events for bridges created via drm_dp_hpd_bridge_register().
> + *
> + * This function shall be called in a context that can sleep.
> + */
> +void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
> +
> +	if (!data)
> +		return;
> +
> +	drm_bridge_hpd_notify(&data->bridge, status);
> +}
> +EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
> +
> +static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
> +				    enum drm_bridge_attach_flags flags)
> +{
> +	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
> +}
> +
> +static const struct drm_bridge_funcs drm_aux_hpd_bridge_funcs = {
> +	.attach	= drm_aux_hpd_bridge_attach,
> +};
> +
> +static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
> +				   const struct auxiliary_device_id *id)
> +{
> +	struct drm_aux_hpd_bridge_data *data;
> +
> +	data = devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->dev = &auxdev->dev;
> +	data->bridge.funcs = &drm_aux_hpd_bridge_funcs;
> +	data->bridge.of_node = dev_get_platdata(data->dev);
> +	data->bridge.ops = DRM_BRIDGE_OP_HPD;
> +	data->bridge.type = id->driver_data;
> +
> +	auxiliary_set_drvdata(auxdev, data);
> +
> +	return devm_drm_bridge_add(data->dev, &data->bridge);
> +}
> +
> +static const struct auxiliary_device_id drm_aux_hpd_bridge_table[] = {
> +	{ .name = KBUILD_MODNAME ".dp_hpd_bridge", .driver_data = DRM_MODE_CONNECTOR_DisplayPort, },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(auxiliary, drm_aux_hpd_bridge_table);
> +
> +static struct auxiliary_driver drm_aux_hpd_bridge_drv = {
> +	.name = "aux_hpd_bridge",
> +	.id_table = drm_aux_hpd_bridge_table,
> +	.probe = drm_aux_hpd_bridge_probe,
> +};
> +module_auxiliary_driver(drm_aux_hpd_bridge_drv);
> +
> +MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
> +MODULE_DESCRIPTION("DRM HPD bridge");
> +MODULE_LICENSE("GPL");
> diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
> index 441ab3f0e920..33adaf4e4daa 100644
> --- a/include/drm/bridge/aux-bridge.h
> +++ b/include/drm/bridge/aux-bridge.h
> @@ -7,6 +7,8 @@
>   #ifndef DRM_AUX_BRIDGE_H
>   #define DRM_AUX_BRIDGE_H
>   
> +#include <drm/drm_connector.h>
> +
>   #if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
>   int drm_aux_bridge_register(struct device *parent);
>   #else
> @@ -16,4 +18,20 @@ static inline int drm_aux_bridge_register(struct device *parent)
>   }
>   #endif
>   
> +#if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
> +struct device *drm_dp_hpd_bridge_register(struct device *parent,
> +					  struct device_node *np);
> +void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
> +#else
> +static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
> +							struct device_node *np)
> +{
> +	return 0;
> +}
> +
> +static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
> +{
> +}
> +#endif
> +
>   #endif

LGTM:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

