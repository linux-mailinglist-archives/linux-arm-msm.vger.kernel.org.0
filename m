Return-Path: <linux-arm-msm+bounces-71760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7FEB4188E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 420A75606EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35812E3B15;
	Wed,  3 Sep 2025 08:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KQZiLdjJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDF32EB86D
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 08:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756888202; cv=none; b=abbUFmI03XM+VuEF4f2XmcQVZyBFyQm136k1zyFHu2ndTJUj6JGlF8Zrmkr3+bM1UL5EetOYlS9oZjepIAJ0ZDG7jO3HPj5AblolOcJPaelowVDpUN5uC+A/POMSGy3kjJN8a8cbDu9KNR9FK2Gdtg8kP/vaw5xmvgZ1wpmhIP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756888202; c=relaxed/simple;
	bh=eLm1ibHSl6C/nhQUzCCAlK0LgU/3CEeRAhkJW8A8p/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyhhOONfuRCqt4siWI/dmijwg9xkYkeXJinnkJ6eWYk8CVpesS+j97TwixtIEFis7NMESE+PaUZiBQ1UUVm3wDMQZ/By/K0EbWVeSX5kHQcVqopUZA+o2ZKBlUVyLVTNWetNQrZ76scTS+h1puDrbLGdPWhfJbnPjRQkgPSF28Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KQZiLdjJ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ce4ed7a73fso3203693f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 01:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756888199; x=1757492999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjmjCN+3zw+/8oyX8dyZS8w/WP3vRhQB2nXarHS92x4=;
        b=KQZiLdjJYYoEDjQmjvnyXh7rKRfwalIAMYRSfUWLnB9Yi7bnX//Ze4ssgYveXeJ55c
         toGvsIhenqd/3FMhgSp2ZuMc1TAzc62FmJ6iZzBc97jtgyI5bXJitzfmjS5UpDEzERnA
         RAZ8VVpSNNOcyLNSZLleg2lFk2v965H+a22qm/l7jw1+/9veALJk/fuqN35do1aidSZC
         8YoK3mxD951xjQuX8G/VOc25FEk7UItwJGwjkyxsM/gT1o6L+O/hTleOjQfMHtiOe+4j
         xlcgs/VWA10Q1A7+5jtwltUDfTC9YmrWSG7UpWWpyMvfH1hBsJO+2BEyfwCVc5oaCs1a
         xelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756888199; x=1757492999;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JjmjCN+3zw+/8oyX8dyZS8w/WP3vRhQB2nXarHS92x4=;
        b=l71ALH4omVm4XS+UwO9UnxAeo0BcLsVdWWo4fwbLh+fltTrc7MkNt1Ri9021FNNmw2
         D53Qzybs1a+frYRsJbqPsBQEpRG327Z5zyEs9QKz5oJF9NEgDpRK/Wr+xZMoSJRwJoNK
         wHgt/KAvwZKn8rU7gOmun05jRKSs3Qy29PuOwei+dRTUx+/gWx33OnpBq8Crf8vS1PzP
         kQ2jUbDMH4BuGBsmCv9oizL2TlSjVnnDwuAnqfvm/PsYO4Pk2ASgNnTze2IWMsTRTgFY
         1aAb7z26153PoRZ8JFI+qscL5L8C0HrKzNObXpg4u8o3qg5vApcmeyMveDrRuNowczNj
         1kVg==
X-Forwarded-Encrypted: i=1; AJvYcCUm10d1kek5+VTzM4znXrGIrYbm3tD6wkOGmHV1aFvCnn/q5hlFi2NqCg/I726gF4PkpH/Ri0AEjs+wOYc+@vger.kernel.org
X-Gm-Message-State: AOJu0YzT9FiKvXlk62aXQ6n7E3vbzT3V/j7gAehynbLCfdF9j3a9EhVM
	PD+fQCMUbWcgJz2iCqx/Lt8m2Wpzd55wAEwrMclDGtsN80iyuw7KLkTrCb0j2opPsW0=
X-Gm-Gg: ASbGncsZMTrVhwFpVjmIyVBne4+TSSAdG3YvI4AZ9su6utmycLnmk8nL3eDyFTqekqy
	oHiaENld1hQp4Oc/0Po09l1vAK/tGm/vAUcetX/VO0IbST546oqSEgtiaXby6dwI5a/Uyz1ZyJK
	vDxeJsmiMp/kRjqEkZLtI9b6Yv6csVBSKM4RnRZdThpMdGsnjIVx/r9Kgb8uNxRC6ilr2c0KGNf
	ABK0MYem0bqUW81LfVrq8nLeS38QH2mPmnyK7AmoF26INjqPo6KVIbI+dq1fn5NGHlPxmi0z8nP
	tWBGK3VSOGd12Zjl01phjnJjN8/qXIpVBC1yoNMk6+poCV6TGxovN5vAXYaZo5D4u3hyNnVXvDM
	KvCV3I/LKylvfney6Pcw6LAuuh+uD9b2oG4ZRt9WkEm0TJs77zO+fZLlN3C3LZrEje99Vci+y
X-Google-Smtp-Source: AGHT+IG5MWTyIoLg0UMwWdMG+cUYtmiralF9pLt3yP8qA7dJI+3zBqQtDgGEzwcvvTkyFY2f0pG/6g==
X-Received: by 2002:a05:6000:290d:b0:3d1:721:31c7 with SMTP id ffacd0b85a97d-3d1e03c6916mr10315756f8f.51.1756888198632;
        Wed, 03 Sep 2025 01:29:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:431c:dad5:266c:f97? ([2a01:e0a:3d9:2080:431c:dad5:266c:f97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6dc1sm312841475e9.1.2025.09.03.01.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 01:29:58 -0700 (PDT)
Message-ID: <f6372ebb-c237-4409-b3a9-8f458be85034@linaro.org>
Date: Wed, 3 Sep 2025 10:29:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 7/8] power: supply: qcom_battmgr: Add charge control
 support
To: fenglin.wu@oss.qualcomm.com, Sebastian Reichel <sre@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
 David Collins <david.collins@oss.qualcomm.com>,
 =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kernel@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250826-qcom_battmgr_update-v3-0-74ea410ef146@oss.qualcomm.com>
 <20250826-qcom_battmgr_update-v3-7-74ea410ef146@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20250826-qcom_battmgr_update-v3-7-74ea410ef146@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/08/2025 09:18, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Add charge control support for SM8550 and X1E80100. It's supported
> with below two power supply properties:
> 
> charge_control_end_threshold: The battery SoC (State of Charge)
> threshold at which the charging should be terminated.
> 
> charge_control_start_threshold: The battery SoC threshold at
> which the charging should be resumed.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>   drivers/power/supply/qcom_battmgr.c | 290 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 283 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index 174d3f83ac2b070bb90c21a498686e91cc629ebe..23c68eb942f1b213f634e31a45420b3e113e2764 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -7,6 +7,7 @@
>   #include <linux/auxiliary_bus.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
> +#include <linux/nvmem-consumer.h>
>   #include <linux/of_device.h>
>   #include <linux/power_supply.h>
>   #include <linux/property.h>
> @@ -68,6 +69,9 @@ enum qcom_battmgr_variant {
>   #define BATT_RESISTANCE			21
>   #define BATT_POWER_NOW			22
>   #define BATT_POWER_AVG			23
> +#define BATT_CHG_CTRL_EN		24
> +#define BATT_CHG_CTRL_START_THR		25
> +#define BATT_CHG_CTRL_END_THR		26
>   
>   #define BATTMGR_USB_PROPERTY_GET	0x32
>   #define BATTMGR_USB_PROPERTY_SET	0x33
> @@ -92,6 +96,13 @@ enum qcom_battmgr_variant {
>   #define WLS_TYPE			5
>   #define WLS_BOOST_EN			6
>   
> +#define BATTMGR_CHG_CTRL_LIMIT_EN	0x48
> +#define CHARGE_CTRL_START_THR_MIN	50
> +#define CHARGE_CTRL_START_THR_MAX	95
> +#define CHARGE_CTRL_END_THR_MIN		55
> +#define CHARGE_CTRL_END_THR_MAX		100
> +#define CHARGE_CTRL_DELTA_SOC		5
> +
>   struct qcom_battmgr_enable_request {
>   	struct pmic_glink_hdr hdr;
>   	__le32 battery_id;
> @@ -126,6 +137,13 @@ struct qcom_battmgr_discharge_time_request {
>   	__le32 reserved;
>   };
>   
> +struct qcom_battmgr_charge_ctrl_request {
> +	struct pmic_glink_hdr hdr;
> +	__le32 enable;
> +	__le32 target_soc;
> +	__le32 delta_soc;
> +};
> +
>   struct qcom_battmgr_message {
>   	struct pmic_glink_hdr hdr;
>   	union {
> @@ -238,6 +256,8 @@ struct qcom_battmgr_info {
>   	unsigned int capacity_warning;
>   	unsigned int cycle_count;
>   	unsigned int charge_count;
> +	unsigned int charge_ctrl_start;
> +	unsigned int charge_ctrl_end;
>   	char model_number[BATTMGR_STRING_LEN];
>   	char serial_number[BATTMGR_STRING_LEN];
>   	char oem_info[BATTMGR_STRING_LEN];
> @@ -426,6 +446,8 @@ static const u8 sm8350_bat_prop_map[] = {
>   	[POWER_SUPPLY_PROP_INTERNAL_RESISTANCE] = BATT_RESISTANCE,
>   	[POWER_SUPPLY_PROP_STATE_OF_HEALTH] = BATT_SOH,
>   	[POWER_SUPPLY_PROP_POWER_NOW] = BATT_POWER_NOW,
> +	[POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD] = BATT_CHG_CTRL_START_THR,
> +	[POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD] = BATT_CHG_CTRL_END_THR,
>   };
>   
>   static int qcom_battmgr_bat_sm8350_update(struct qcom_battmgr *battmgr,
> @@ -496,7 +518,8 @@ static int qcom_battmgr_bat_get_property(struct power_supply *psy,
>   	if (!battmgr->service_up)
>   		return -EAGAIN;
>   
> -	if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
> +	if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
> +	    battmgr->variant == QCOM_BATTMGR_X1E80100)
>   		ret = qcom_battmgr_bat_sc8280xp_update(battmgr, psp);
>   	else
>   		ret = qcom_battmgr_bat_sm8350_update(battmgr, psp);
> @@ -601,6 +624,12 @@ static int qcom_battmgr_bat_get_property(struct power_supply *psy,
>   	case POWER_SUPPLY_PROP_TIME_TO_FULL_AVG:
>   		val->intval = battmgr->status.charge_time;
>   		break;
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD:
> +		val->intval = battmgr->info.charge_ctrl_start;
> +		break;
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		val->intval = battmgr->info.charge_ctrl_end;
> +		break;
>   	case POWER_SUPPLY_PROP_MANUFACTURE_YEAR:
>   		val->intval = battmgr->info.year;
>   		break;
> @@ -626,6 +655,149 @@ static int qcom_battmgr_bat_get_property(struct power_supply *psy,
>   	return 0;
>   }
>   
> +static int qcom_battmgr_set_charge_control(struct qcom_battmgr *battmgr,
> +					   u32 target_soc, u32 delta_soc)
> +{
> +	struct qcom_battmgr_charge_ctrl_request request = {
> +		.hdr.owner = cpu_to_le32(PMIC_GLINK_OWNER_BATTMGR),
> +		.hdr.type = cpu_to_le32(PMIC_GLINK_REQ_RESP),
> +		.hdr.opcode = cpu_to_le32(BATTMGR_CHG_CTRL_LIMIT_EN),
> +		.enable = cpu_to_le32(1),
> +		.target_soc = cpu_to_le32(target_soc),
> +		.delta_soc = cpu_to_le32(delta_soc),
> +	};
> +
> +	return qcom_battmgr_request(battmgr, &request, sizeof(request));
> +}
> +
> +static int qcom_battmgr_set_charge_start_threshold(struct qcom_battmgr *battmgr, int start_soc)
> +{
> +	u32 target_soc, delta_soc;
> +	int ret;
> +
> +	if (start_soc < CHARGE_CTRL_START_THR_MIN ||
> +	    start_soc > CHARGE_CTRL_START_THR_MAX) {
> +		dev_err(battmgr->dev, "charge control start threshold exceed range: [%u - %u]\n",
> +			CHARGE_CTRL_START_THR_MIN, CHARGE_CTRL_START_THR_MAX);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * If the new start threshold is larger than the old end threshold,
> +	 * move the end threshold one step (DELTA_SOC) after the new start
> +	 * threshold.
> +	 */
> +	if (start_soc > battmgr->info.charge_ctrl_end) {
> +		target_soc = start_soc + CHARGE_CTRL_DELTA_SOC;
> +		target_soc = min_t(u32, target_soc, CHARGE_CTRL_END_THR_MAX);
> +		delta_soc = target_soc - start_soc;
> +		delta_soc = min_t(u32, delta_soc, CHARGE_CTRL_DELTA_SOC);
> +	} else {
> +		target_soc =  battmgr->info.charge_ctrl_end;
> +		delta_soc = battmgr->info.charge_ctrl_end - start_soc;
> +	}
> +
> +	mutex_lock(&battmgr->lock);
> +	ret = qcom_battmgr_set_charge_control(battmgr, target_soc, delta_soc);
> +	mutex_unlock(&battmgr->lock);
> +	if (!ret) {
> +		battmgr->info.charge_ctrl_start = start_soc;
> +		battmgr->info.charge_ctrl_end = target_soc;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_battmgr_set_charge_end_threshold(struct qcom_battmgr *battmgr, int end_soc)
> +{
> +	u32 delta_soc = CHARGE_CTRL_DELTA_SOC;
> +	int ret;
> +
> +	if (end_soc < CHARGE_CTRL_END_THR_MIN ||
> +	    end_soc > CHARGE_CTRL_END_THR_MAX) {
> +		dev_err(battmgr->dev, "charge control end threshold exceed range: [%u - %u]\n",
> +			CHARGE_CTRL_END_THR_MIN, CHARGE_CTRL_END_THR_MAX);
> +		return -EINVAL;
> +	}
> +
> +	if (battmgr->info.charge_ctrl_start && end_soc > battmgr->info.charge_ctrl_start)
> +		delta_soc = end_soc - battmgr->info.charge_ctrl_start;
> +
> +	mutex_lock(&battmgr->lock);
> +	ret = qcom_battmgr_set_charge_control(battmgr, end_soc, delta_soc);
> +	mutex_unlock(&battmgr->lock);
> +	if (!ret) {
> +		battmgr->info.charge_ctrl_start = end_soc - delta_soc;
> +		battmgr->info.charge_ctrl_end = end_soc;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_battmgr_charge_control_thresholds_init(struct qcom_battmgr *battmgr)
> +{
> +	int ret;
> +	u8 en, end_soc, start_soc, delta_soc;
> +
> +	ret = nvmem_cell_read_u8(battmgr->dev->parent, "charge_limit_en", &en);
> +	if (!ret && en != 0) {
> +		ret = nvmem_cell_read_u8(battmgr->dev->parent, "charge_limit_end", &end_soc);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = nvmem_cell_read_u8(battmgr->dev->parent, "charge_limit_delta", &delta_soc);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (delta_soc >= end_soc)
> +			return -EINVAL;
> +
> +		start_soc = end_soc - delta_soc;
> +		end_soc = clamp(end_soc, CHARGE_CTRL_END_THR_MIN, CHARGE_CTRL_END_THR_MAX);
> +		start_soc = clamp(start_soc, CHARGE_CTRL_START_THR_MIN, CHARGE_CTRL_START_THR_MAX);
> +
> +		battmgr->info.charge_ctrl_start = start_soc;
> +		battmgr->info.charge_ctrl_end = end_soc;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_battmgr_bat_is_writeable(struct power_supply *psy,
> +					 enum power_supply_property psp)
> +{
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD:
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		return 1;
> +	default:
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_battmgr_bat_set_property(struct power_supply *psy,
> +					 enum power_supply_property psp,
> +					 const union power_supply_propval *pval)
> +{
> +	struct qcom_battmgr *battmgr = power_supply_get_drvdata(psy);
> +
> +	if (!battmgr->service_up)
> +		return -EAGAIN;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD:
> +		return qcom_battmgr_set_charge_start_threshold(battmgr, pval->intval);
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		return qcom_battmgr_set_charge_end_threshold(battmgr, pval->intval);
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>   static const enum power_supply_property sc8280xp_bat_props[] = {
>   	POWER_SUPPLY_PROP_STATUS,
>   	POWER_SUPPLY_PROP_PRESENT,
> @@ -659,6 +831,43 @@ static const struct power_supply_desc sc8280xp_bat_psy_desc = {
>   	.get_property = qcom_battmgr_bat_get_property,
>   };
>   
> +static const enum power_supply_property x1e80100_bat_props[] = {
> +	POWER_SUPPLY_PROP_STATUS,
> +	POWER_SUPPLY_PROP_PRESENT,
> +	POWER_SUPPLY_PROP_TECHNOLOGY,
> +	POWER_SUPPLY_PROP_CYCLE_COUNT,
> +	POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
> +	POWER_SUPPLY_PROP_VOLTAGE_NOW,
> +	POWER_SUPPLY_PROP_POWER_NOW,
> +	POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
> +	POWER_SUPPLY_PROP_CHARGE_FULL,
> +	POWER_SUPPLY_PROP_CHARGE_EMPTY,
> +	POWER_SUPPLY_PROP_CHARGE_NOW,
> +	POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN,
> +	POWER_SUPPLY_PROP_ENERGY_FULL,
> +	POWER_SUPPLY_PROP_ENERGY_EMPTY,
> +	POWER_SUPPLY_PROP_ENERGY_NOW,
> +	POWER_SUPPLY_PROP_TEMP,
> +	POWER_SUPPLY_PROP_MANUFACTURE_YEAR,
> +	POWER_SUPPLY_PROP_MANUFACTURE_MONTH,
> +	POWER_SUPPLY_PROP_MANUFACTURE_DAY,
> +	POWER_SUPPLY_PROP_MODEL_NAME,
> +	POWER_SUPPLY_PROP_MANUFACTURER,
> +	POWER_SUPPLY_PROP_SERIAL_NUMBER,
> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD,
> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,

Is it expected to _not_ have POWER_SUPPLY_PROP_STATE_OF_HEALTH & POWER_SUPPLY_PROP_INTERNAL_RESISTANCE here ?

Neil

> +};
> +
> +static const struct power_supply_desc x1e80100_bat_psy_desc = {
> +	.name = "qcom-battmgr-bat",
> +	.type = POWER_SUPPLY_TYPE_BATTERY,
> +	.properties = x1e80100_bat_props,
> +	.num_properties = ARRAY_SIZE(x1e80100_bat_props),
> +	.get_property = qcom_battmgr_bat_get_property,
> +	.set_property = qcom_battmgr_bat_set_property,
> +	.property_is_writeable = qcom_battmgr_bat_is_writeable,
> +};
> +
>   static const enum power_supply_property sm8350_bat_props[] = {
>   	POWER_SUPPLY_PROP_STATUS,
>   	POWER_SUPPLY_PROP_HEALTH,
> @@ -691,6 +900,42 @@ static const struct power_supply_desc sm8350_bat_psy_desc = {
>   	.get_property = qcom_battmgr_bat_get_property,
>   };
>   
> +static const enum power_supply_property sm8550_bat_props[] = {
> +	POWER_SUPPLY_PROP_STATUS,
> +	POWER_SUPPLY_PROP_HEALTH,
> +	POWER_SUPPLY_PROP_PRESENT,
> +	POWER_SUPPLY_PROP_CHARGE_TYPE,
> +	POWER_SUPPLY_PROP_CAPACITY,
> +	POWER_SUPPLY_PROP_VOLTAGE_OCV,
> +	POWER_SUPPLY_PROP_VOLTAGE_NOW,
> +	POWER_SUPPLY_PROP_VOLTAGE_MAX,
> +	POWER_SUPPLY_PROP_CURRENT_NOW,
> +	POWER_SUPPLY_PROP_TEMP,
> +	POWER_SUPPLY_PROP_TECHNOLOGY,
> +	POWER_SUPPLY_PROP_CHARGE_COUNTER,
> +	POWER_SUPPLY_PROP_CYCLE_COUNT,
> +	POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
> +	POWER_SUPPLY_PROP_CHARGE_FULL,
> +	POWER_SUPPLY_PROP_MODEL_NAME,
> +	POWER_SUPPLY_PROP_TIME_TO_FULL_AVG,
> +	POWER_SUPPLY_PROP_TIME_TO_EMPTY_AVG,
> +	POWER_SUPPLY_PROP_INTERNAL_RESISTANCE,
> +	POWER_SUPPLY_PROP_STATE_OF_HEALTH,
> +	POWER_SUPPLY_PROP_POWER_NOW,
> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD,
> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> +};
> +
> +static const struct power_supply_desc sm8550_bat_psy_desc = {
> +	.name = "qcom-battmgr-bat",
> +	.type = POWER_SUPPLY_TYPE_BATTERY,
> +	.properties = sm8550_bat_props,
> +	.num_properties = ARRAY_SIZE(sm8550_bat_props),
> +	.get_property = qcom_battmgr_bat_get_property,
> +	.set_property = qcom_battmgr_bat_set_property,
> +	.property_is_writeable = qcom_battmgr_bat_is_writeable,
> +};
> +
>   static int qcom_battmgr_ac_get_property(struct power_supply *psy,
>   					enum power_supply_property psp,
>   					union power_supply_propval *val)
> @@ -766,7 +1011,8 @@ static int qcom_battmgr_usb_get_property(struct power_supply *psy,
>   	if (!battmgr->service_up)
>   		return -EAGAIN;
>   
> -	if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
> +	if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
> +	    battmgr->variant == QCOM_BATTMGR_X1E80100)
>   		ret = qcom_battmgr_bat_sc8280xp_update(battmgr, psp);
>   	else
>   		ret = qcom_battmgr_usb_sm8350_update(battmgr, psp);
> @@ -888,7 +1134,8 @@ static int qcom_battmgr_wls_get_property(struct power_supply *psy,
>   	if (!battmgr->service_up)
>   		return -EAGAIN;
>   
> -	if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
> +	if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
> +	    battmgr->variant == QCOM_BATTMGR_X1E80100)
>   		ret = qcom_battmgr_bat_sc8280xp_update(battmgr, psp);
>   	else
>   		ret = qcom_battmgr_wls_sm8350_update(battmgr, psp);
> @@ -1085,6 +1332,9 @@ static void qcom_battmgr_sc8280xp_callback(struct qcom_battmgr *battmgr,
>   	case BATTMGR_BAT_CHARGE_TIME:
>   		battmgr->status.charge_time = le32_to_cpu(resp->time);
>   		break;
> +	case BATTMGR_CHG_CTRL_LIMIT_EN:
> +		battmgr->error = 0;
> +		break;
>   	default:
>   		dev_warn(battmgr->dev, "unknown message %#x\n", opcode);
>   		break;
> @@ -1198,6 +1448,12 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
>   		case BATT_POWER_NOW:
>   			battmgr->status.power_now = le32_to_cpu(resp->intval.value);
>   			break;
> +		case BATT_CHG_CTRL_START_THR:
> +			battmgr->info.charge_ctrl_start = le32_to_cpu(resp->intval.value);
> +			break;
> +		case BATT_CHG_CTRL_END_THR:
> +			battmgr->info.charge_ctrl_end = le32_to_cpu(resp->intval.value);
> +			break;
>   		default:
>   			dev_warn(battmgr->dev, "unknown property %#x\n", property);
>   			break;
> @@ -1280,6 +1536,7 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
>   		}
>   		break;
>   	case BATTMGR_REQUEST_NOTIFICATION:
> +	case BATTMGR_CHG_CTRL_LIMIT_EN:
>   		battmgr->error = 0;
>   		break;
>   	default:
> @@ -1299,7 +1556,8 @@ static void qcom_battmgr_callback(const void *data, size_t len, void *priv)
>   
>   	if (opcode == BATTMGR_NOTIFICATION)
>   		qcom_battmgr_notification(battmgr, data, len);
> -	else if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
> +	else if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
> +		 battmgr->variant == QCOM_BATTMGR_X1E80100)
>   		qcom_battmgr_sc8280xp_callback(battmgr, data, len);
>   	else
>   		qcom_battmgr_sm8350_callback(battmgr, data, len);
> @@ -1346,11 +1604,13 @@ static char *qcom_battmgr_battery[] = { "battery" };
>   static int qcom_battmgr_probe(struct auxiliary_device *adev,
>   			      const struct auxiliary_device_id *id)
>   {
> +	const struct power_supply_desc *psy_desc;
>   	struct power_supply_config psy_cfg_supply = {};
>   	struct power_supply_config psy_cfg = {};
>   	const struct of_device_id *match;
>   	struct qcom_battmgr *battmgr;
>   	struct device *dev = &adev->dev;
> +	int ret;
>   
>   	battmgr = devm_kzalloc(dev, sizeof(*battmgr), GFP_KERNEL);
>   	if (!battmgr)
> @@ -1376,8 +1636,19 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
>   	else
>   		battmgr->variant = QCOM_BATTMGR_SM8350;
>   
> -	if (battmgr->variant == QCOM_BATTMGR_SC8280XP) {
> -		battmgr->bat_psy = devm_power_supply_register(dev, &sc8280xp_bat_psy_desc, &psy_cfg);
> +	ret = qcom_battmgr_charge_control_thresholds_init(battmgr);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "failed to init battery charge control thresholds\n");
> +
> +	if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
> +	    battmgr->variant == QCOM_BATTMGR_X1E80100) {
> +		if (battmgr->variant == QCOM_BATTMGR_X1E80100)
> +			psy_desc = &x1e80100_bat_psy_desc;
> +		else
> +			psy_desc = &sc8280xp_bat_psy_desc;
> +
> +		battmgr->bat_psy = devm_power_supply_register(dev, psy_desc, &psy_cfg);
>   		if (IS_ERR(battmgr->bat_psy))
>   			return dev_err_probe(dev, PTR_ERR(battmgr->bat_psy),
>   					     "failed to register battery power supply\n");
> @@ -1397,7 +1668,12 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
>   			return dev_err_probe(dev, PTR_ERR(battmgr->wls_psy),
>   					     "failed to register wireless charing power supply\n");
>   	} else {
> -		battmgr->bat_psy = devm_power_supply_register(dev, &sm8350_bat_psy_desc, &psy_cfg);
> +		if (battmgr->variant == QCOM_BATTMGR_SM8550)
> +			psy_desc = &sm8550_bat_psy_desc;
> +		else
> +			psy_desc = &sm8350_bat_psy_desc;
> +
> +		battmgr->bat_psy = devm_power_supply_register(dev, psy_desc, &psy_cfg);
>   		if (IS_ERR(battmgr->bat_psy))
>   			return dev_err_probe(dev, PTR_ERR(battmgr->bat_psy),
>   					     "failed to register battery power supply\n");
> 


