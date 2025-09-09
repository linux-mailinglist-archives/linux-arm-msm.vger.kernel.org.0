Return-Path: <linux-arm-msm+bounces-72692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B565B4A361
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 09:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC52C175F84
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 07:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0722A30507E;
	Tue,  9 Sep 2025 07:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="msNInWXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F402FF64E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 07:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757402498; cv=none; b=O4MvSokQPuDIC8YXWTIvV8ogN6QKndzWLygz0uvznOrU52G4OIcElEbxKUiBlT5hv4NOfBUzcAiZi1cDzp3VxNprVsFxPMmgGpGQuE+Dlj7Hq7y2+4z0PDkwgxyFEN8fEUxUUhHQ8MsXT8ncsAXN9WGYdDRJOzk4q1FhqtE3JRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757402498; c=relaxed/simple;
	bh=FZYcu02d23gGvTYtiwlzcioKxi440bDzszvTGMtYclo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VTfOx2ut018PdK4ylmr/mb1O50STinF8fr4iOXpMbnUSZ6mhRSUUFDy52w0O9YMPJNT8zLFSa0h7Zam97E4IGSTl4/kZoUHY+oA6KhAF48ckyEZmym1ozfLBXdY0Cl8UybJpYRFp1Wx3DordnY/kxubDjQQutoRWYziSk5YfwBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=msNInWXk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso46207725e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 00:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757402495; x=1758007295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/If2BlMRU5hmxDmkphdZQWc2KIPCNetMGj6QmRvd2sI=;
        b=msNInWXkT0SOaf37Txl/xbifcFhHxkqkNLQT7w7EBwUTiMWlsBvK40u1Isq6MIfdOn
         a7bqzPaQDZsux9vvp1w5gpby5NEvCgIiPojkzyp8tp1gmo3cP9u46qMz21UVutu3FH+X
         eGU8irwn2oRzFR7Wy5hG9/ltjBU6KZitfzEfZpLXkdHZMnmKoA+49v1HN6mx9Ag5cteS
         rTBhyO9XlSPU9+9xizL5pDEDROn2pZu77k2NdHSqQn49vEynUnWZ7WRUFKriQkzN1j6Q
         iMUEJlcYvJaLpvqsqcInny1cJXgNEOkSVaeKba9k8xvcXD9gqxPEkrCtdjkr06h2ao67
         U2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402495; x=1758007295;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/If2BlMRU5hmxDmkphdZQWc2KIPCNetMGj6QmRvd2sI=;
        b=jVlynKPHiWV0tm+8NMGtF95/dyc6tStVJxhlwwvfF/8GxALCG2zXPjyuTzYNtiYj/h
         GEO5VpRF13YSe2qiSxF/fLYoQ+KPONT6nlWW+7go+ni9AzgyoV2RBoEHoU/i7GWbqlqn
         UzvCu6nKSeSfR6OHzI/dxyAdtrnqRzRfpTqe5Dbx0UhhOUg5DV8MD8kZWpnlDvmdA3Il
         Q6nMYixs59Gpuyc1bh7EKZA4ATxK3IhK4DXTXjvvfRGo4hYj1MzZc/AJicf1UzZpHK3b
         +FW7XuRxn8kJ4VTKjf6XuycyJTak2QHrpJx3bHAyKkcvcalFBnite4oH65WvmTfvQdV1
         6YgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG4Wd4++G/aW8Op+P+bekenERuaCyMn8ylAQBDuYTtcoIFphbkGm7WhcOpobkINxiOgpOOYpbjhljNBnMU@vger.kernel.org
X-Gm-Message-State: AOJu0YztS9r7YYh2+izESWOuclIHYAeb57JT59SkMZp8l39LCh5hp1jy
	IYv6ke4JcT4m0yDymUzkAOCFl9ScxwJH9/swoFDCQ0noYrBYef5LajCgrbW3ehoKxk8=
X-Gm-Gg: ASbGncsSK1Vnk7ZqjBCYuRwCsBqOKpqRIRUiS1uSIP12BUwa8aTOaibJf/HJ5cUfg7Q
	9FtjK84bClrzUSueKXQ9um89SQmSb/C8fg8ffuVfHsbcK+D6vuGHldSP3yYjTTGKvJRy6XoPpRt
	JXTICSXWAkjGmx2UYXE/RWfhl9qq/xai42/B8+6wo7tFcHaluCXAOUYWtEZSGgoHF1HD4zUebka
	jkQVcbSTM+rEigqzstP7FLbe4fQLQLPUEUD73jQ3VDo4GM/a/h/W1ChsWjtrApRLecbvgTvKuou
	t0fkOiaZjKX7ODzz+wmqb3AH0fOcW24YtMZRJGcTIcevebDSehO8jCBIy6J1vQWuqOrE8Az7JAO
	LDuIQ1h4FcFwyCfcxBIS2JyBg0klP2FU/hiNYprTW8uQBnnEgqdo7DnvVchFxEYu2rpgcL1lPC2
	zWzmgtL60=
X-Google-Smtp-Source: AGHT+IFNocqpkjHVd4blpS2YweyUe/pouVlEX5U9yahCP7qMq/q0m882V0be09wucGuQT1GOgWRbjQ==
X-Received: by 2002:a05:600c:4694:b0:45d:d908:dc02 with SMTP id 5b1f17b1804b1-45ddded9c21mr88532585e9.31.1757402495001;
        Tue, 09 Sep 2025 00:21:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:25ab:4e12:265b:4b6? ([2a01:e0a:3d9:2080:25ab:4e12:265b:4b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9cdbsm1485006f8f.16.2025.09.09.00.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 00:21:34 -0700 (PDT)
Message-ID: <b8156d1e-a4a5-46dd-8b78-4f2528a177c3@linaro.org>
Date: Tue, 9 Sep 2025 09:21:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/5] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
 <20250908-topic-x1e80100-hdmi-v3-4-c53b0f2bc2fb@linaro.org>
 <dfhvmeo3pnjubgiwvakpzhzgl6uwlopyrkwuqyhfqw6jfh4mty@t4lhuh4jh6af>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <dfhvmeo3pnjubgiwvakpzhzgl6uwlopyrkwuqyhfqw6jfh4mty@t4lhuh4jh6af>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2025 23:24, Dmitry Baryshkov wrote:
> On Mon, Sep 08, 2025 at 03:04:21PM +0200, Neil Armstrong wrote:
>> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
>> of a combo glue to route either lanes to the 4 shared physical lanes.
>>
>> The routing of the lanes can be:
>> - 2 DP + 2 USB3
>> - 4 DP
>> - 2 USB3
>>
>> Get the lanes mapping from DT and stop registering the USB-C
>> muxes in favor of a static mode and orientation detemined
>> by the lanes mapping.
>>
>> This allows supporting boards with direct connection of USB3 and
>> DisplayPort lanes to the QMP Combo PHY lanes, not using the
>> USB-C Altmode feature.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 132 ++++++++++++++++++++++++++++--
>>   1 file changed, 124 insertions(+), 8 deletions(-)
> 
> Looking at the patch... Would it be possible to make it more generic? I
> think some of the RockChips also have similar combo USB+DP PHY (and
> similar issues). I believe, Mediatek might also have the same issue.

Since they don't use the data-lanes property, it's hard to make it generic and I would
avoid migrating their DT to data-lanes just to solve HDMI on the Thinkpas T14s...

Let's solve this first, and code can be aggregated afterwards if the DT representation is correct.

> 
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> index 7b5af30f1d028c592500e723ecd27b54ed554709..f3f91a69dc8b81e049cd06f7ab4f04baf57776cd 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <linux/of_address.h>
>> +#include <linux/of_graph.h>
>>   #include <linux/phy/phy.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/regulator/consumer.h>
>> @@ -1744,6 +1745,21 @@ static const u8 qmp_dp_v6_pre_emphasis_hbr_rbr[4][4] = {
>>   	{ 0x22, 0xff, 0xff, 0xff }
>>   };
>>   
>> +static const u32 usb3_data_lane_mapping[][2] = {
>> +	[TYPEC_ORIENTATION_NORMAL] = { 1, 0 },
>> +	[TYPEC_ORIENTATION_REVERSE] = { 2, 3 },
>> +};
>> +
>> +static const u32 dp_2_data_lanes_mapping[][2] = {
>> +	[TYPEC_ORIENTATION_NORMAL] = { 0, 1 },
>> +	[TYPEC_ORIENTATION_REVERSE] = { 3, 2 },
>> +};
>> +
>> +static const u32 dp_4_data_lanes_mapping[][4] = {
>> +	[TYPEC_ORIENTATION_NORMAL] = { 0, 1, 2, 3 },
>> +	[TYPEC_ORIENTATION_REVERSE] = { 3, 2, 1, 0 },
>> +};
>> +
>>   struct qmp_combo;
>>   
>>   struct qmp_combo_offsets {
>> @@ -4167,9 +4183,114 @@ static int qmp_combo_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_node_put;
>>   
>> -	ret = qmp_combo_typec_register(qmp);
>> -	if (ret)
>> -		goto err_node_put;
>> +	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
>> +
>> +	if (of_find_property(dev->of_node, "mode-switch", NULL) ||
>> +	    of_find_property(dev->of_node, "orientation-switch", NULL)) {
>> +		ret = qmp_combo_typec_register(qmp);
>> +		if (ret)
>> +			goto err_node_put;
>> +	} else {
> 
> At least this needs to be extracted to a function (or set of functions).

Yes I was not sure about how to split, and overall I'm not supeer happy about the design.

> 
>> +		enum typec_orientation usb3_orientation = TYPEC_ORIENTATION_NONE;
>> +		enum typec_orientation dp_orientation = TYPEC_ORIENTATION_NONE;
>> +		struct device_node *usb3_ep, *dp_ep;
>> +		u32 data_lanes[4];
>> +		int count, i;
>> +
>> +		usb3_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
>> +		dp_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 1);
>> +
>> +		if (usb3_ep) {
>> +			ret = of_property_count_u32_elems(usb3_ep, "data-lanes");
>> +			if (ret == -EINVAL)
>> +				/* Property isn't here, ignore property */
> 
> In all thsese error cases we are leaking a ref count on usb3_ep and
> dp_ep.

It would be much simpler to solve in a separate function.

> 
>> +				goto usb3_mapping_done;
>> +			if (ret < 0)
>> +				goto err_node_put;
>> +
>> +			count = ret;
>> +			if (count != 2)
>> +				/* Property size is invalid, ignore property */
>> +				goto usb3_mapping_done;
>> +
>> +			ret = of_property_read_u32_array(usb3_ep, "data-lanes", data_lanes, count);
>> +			if (ret)
>> +				goto err_node_put;
>> +
>> +			for (i = TYPEC_ORIENTATION_NORMAL; i <= TYPEC_ORIENTATION_REVERSE; i++)
>> +				if (!memcmp(data_lanes, usb3_data_lane_mapping[i], sizeof(u32) * 2))
>> +					break;
>> +
>> +			if (i >= TYPEC_ORIENTATION_REVERSE)
>> +				/* Property value is invalid, ignore property */
>> +				goto usb3_mapping_done;
>> +
>> +			usb3_orientation = i;
>> +		}
>> +
>> +usb3_mapping_done:
>> +		of_node_put(usb3_ep);
>> +
>> +		if (dp_ep) {
>> +			ret = of_property_count_u32_elems(dp_ep, "data-lanes");
>> +			if (ret == -EINVAL)
>> +				/* Property isn't here, ignore property */
>> +				goto dp_mapping_done;
>> +			if (ret < 0)
>> +				goto err_node_put;
>> +
>> +			count = ret;
>> +			if (count != 2 && count != 4)
>> +				/* Property size is invalid, ignore property */
>> +				goto dp_mapping_done;
>> +
>> +			ret = of_property_read_u32_array(dp_ep, "data-lanes", data_lanes, count);
>> +
>> +			if (ret)
>> +				goto err_node_put;
>> +
>> +			for (i = TYPEC_ORIENTATION_NORMAL; i <= TYPEC_ORIENTATION_REVERSE; i++) {
>> +				switch (count) {
>> +				case 2:
>> +					ret = memcmp(data_lanes, dp_2_data_lanes_mapping[i],
>> +						      sizeof(u32) * count);
>> +					break;
>> +				case 4:
>> +					ret = memcmp(data_lanes, dp_4_data_lanes_mapping[i],
>> +						     sizeof(u32) * count);
>> +					break;
>> +				}
>> +
>> +				if (!ret)
>> +					break;
>> +			}
>> +
>> +			if (i >= TYPEC_ORIENTATION_REVERSE)
>> +				/* Property value is invalid, ignore property */
>> +				goto dp_mapping_done;
>> +
>> +			dp_orientation = i;
>> +		}
>> +
>> +dp_mapping_done:
>> +		of_node_put(dp_ep);
>> +
>> +		if (dp_orientation == TYPEC_ORIENTATION_NONE &&
>> +		    usb3_orientation != TYPEC_ORIENTATION_NONE) {
>> +			qmp->qmpphy_mode = QMPPHY_MODE_USB3_ONLY;
>> +			qmp->orientation = usb3_orientation;
>> +		} else if (usb3_orientation == TYPEC_ORIENTATION_NONE &&
>> +			 dp_orientation != TYPEC_ORIENTATION_NONE) {
>> +			qmp->qmpphy_mode = QMPPHY_MODE_DP_ONLY;
>> +			qmp->orientation = dp_orientation;
>> +		} else if (dp_orientation != TYPEC_ORIENTATION_NONE &&
>> +			 dp_orientation == usb3_orientation) {
>> +			qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
>> +			qmp->orientation = dp_orientation;
>> +		} else {
>> +			dev_warn(dev, "unable to determine orientation & mode from data-lanes");
>> +		}
>> +	}
>>   
>>   	ret = drm_aux_bridge_register(dev);
>>   	if (ret)
>> @@ -4189,11 +4310,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_node_put;
>>   
>> -	/*
>> -	 * The hw default is USB3_ONLY, but USB3+DP mode lets us more easily
>> -	 * check both sub-blocks' init tables for blunders at probe time.
>> -	 */
>> -	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
>>   
>>   	qmp->usb_phy = devm_phy_create(dev, usb_np, &qmp_combo_usb_phy_ops);
>>   	if (IS_ERR(qmp->usb_phy)) {
>>
>> -- 
>> 2.34.1
>>
> 


