Return-Path: <linux-arm-msm+bounces-16216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4288966BC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 09:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB82F1C25B10
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 07:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F05D6FE22;
	Wed,  3 Apr 2024 07:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v5DsnB9J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF396FE11
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712129856; cv=none; b=nYQ8AAN/5+druByzEEb63fH/HlwVo5bGXpdkD28aIaC3PoUhBi7FSuhfjECgQzJXlq/1Va1q1W2jpDfxogF97wZ2ZGf83UTcmx4wrjQ5zXembq5yM/cxPX5R5f8kcJY/FxpiP/Q4zHt00Hbgb/hry2T8d+cJnapUUX+iW5ag2KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712129856; c=relaxed/simple;
	bh=oHnPouv8s2n/nIs0TaSMHZ5hHjaM+UoosTlA0kf4zg0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aH/SrEGXFWZWezsil+HzYGOwMunclthdogfTVYuaDhXg/iVCzZRmAVQYPgAncI5vFqx6c0pgSupxlZNTyz5iKaC83ph1O+PzVXAcbTO6HtKe5rq48HPoNUjN5Vqhliulfc22qhtu2nHp2BEDt6CMNi3V/i8ityzSDgGHoltoRQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v5DsnB9J; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3416df43cabso4224437f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 00:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712129853; x=1712734653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geNaRfEIOujwtBOUShY9nwBxqmYXpD+/mHRnOtbcQkE=;
        b=v5DsnB9J9nZs/kVvkD1l8ZJ26DgLxephPHhlFly6bFpe+oBF03T98mfRdiVZ1GbLXo
         5itsv6suac1JuoPQf9VMCztDMkwKhMEgK1Ez+MU21UTpBRaFRi6U7x8uBqoR7aVbL0zO
         BEx4Lv6TIjH93rwma6gOVJkG8Mk5xrCTzpK6y5J8KHFrJ24r9s/mAty+GH90fHBBjWKv
         fCWGQA2LO0wf/itA1Rg4jTRGOs5VYhm1rT7LoDGWZTIJ8l/K+1SqKQyEgYNIITFR0j77
         iqJJdrbmOvm8+rHv9WG7D0OXuIv9ihnOM3FjM6+6LySClvGots+Upp4Yjk3K2JYULCfl
         NlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712129853; x=1712734653;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=geNaRfEIOujwtBOUShY9nwBxqmYXpD+/mHRnOtbcQkE=;
        b=mDAMS59S8B9J+jk56fSHjyVs+K5HNkcwwWUp/+dNs64ApmwH0W+qt8bVbQXz8XJ+de
         nB0CeXEQg3rF03bf7vAv/bYr3xUtZ+1BMZgN4HBV4wZpNHYDrjKCtfh+YRJ54lMoj7DG
         y4kdkK/s4dtLh7YN5+rcbHDjkc2Au73qntK6OjLV4R/ylAzl8tqldPt42HRtl8EzCJEK
         SgvZdTtK0FEev/di/WvJZPLwQJwhDl/5mccyCxIbO+XuJblBTUU833HSPdn2wKp1oJ96
         yl3gOPDIz9/PU8x5pLHJku7AkkTLpR+EtoWCN7psaNaoshQ4bUfJQj0vxYq/YpN+ugPt
         3Hrg==
X-Forwarded-Encrypted: i=1; AJvYcCWovpZyx+EaSBIiFFQ1nKMMd3V+/6Nslo9NZwuJsm6pJS0ELUsLiNNXH2D5LqsO054Sk/NXBn4khTN+VsKWJYZkJVYIGU7E2VKDwv7aTA==
X-Gm-Message-State: AOJu0Yy8WxXpBYOgyULyU2JQGm/5hVXsu0s7qEEDL8A+GngIsAuWMWCp
	GOJdF6YgxrA0mb6SKghul1LIo8F5bEGTOvthyK0rI1l8gGmANmIF8G/6ZcnDbMA=
X-Google-Smtp-Source: AGHT+IEbYXZQ1kBd1abb3np2eMxoOx5CTXOOtylFlOtLCsBr/9Y2EzqqkWkq5FxSgC0vZVo69UGQZg==
X-Received: by 2002:adf:ed8e:0:b0:341:abd4:a6e8 with SMTP id c14-20020adfed8e000000b00341abd4a6e8mr1366658wro.60.1712129852474;
        Wed, 03 Apr 2024 00:37:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:d6d:8d9b:bb47:c974? ([2a01:e0a:982:cbb0:d6d:8d9b:bb47:c974])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d6385000000b003437e334a4dsm2486617wru.69.2024.04.03.00.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 00:37:32 -0700 (PDT)
Message-ID: <0ca97dbb-f6dc-4e62-b292-2f7d1d590cfd@linaro.org>
Date: Wed, 3 Apr 2024 09:37:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v8 7/7] spmi: pmic-arb: Add multi bus support
To: Abel Vesa <abel.vesa@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
 <20240402-spmi-multi-master-support-v8-7-ce6f2d14a058@linaro.org>
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
In-Reply-To: <20240402-spmi-multi-master-support-v8-7-ce6f2d14a058@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2024 14:07, Abel Vesa wrote:
> Starting with HW version 7, there are actually two separate buses
> (with two separate sets of wires). So add support for the second bus.
> The first platform that needs this support for the second bus is the
> Qualcomm X1 Elite, so add the compatible for it as well.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   drivers/spmi/spmi-pmic-arb.c | 138 +++++++++++++++++++++++++++++++++++++------
>   1 file changed, 120 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 3db622ed80de..52b9e275a7b2 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -13,6 +13,7 @@
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/of_address.h>
>   #include <linux/of_irq.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
> @@ -95,6 +96,8 @@ enum pmic_arb_channel {
>   	PMIC_ARB_CHANNEL_OBS,
>   };
>   
> +#define PMIC_ARB_MAX_BUSES		2
> +
>   /* Maximum number of support PMIC peripherals */
>   #define PMIC_ARB_MAX_PERIPHS		512
>   #define PMIC_ARB_MAX_PERIPHS_V7		1024
> @@ -148,6 +151,7 @@ struct spmi_pmic_arb;
>    * @min_apid:		minimum APID (used for bounding IRQ search)
>    * @max_apid:		maximum APID
>    * @irq:		PMIC ARB interrupt.
> + * @id:			unique ID of the bus
>    */
>   struct spmi_pmic_arb_bus {
>   	struct spmi_pmic_arb	*pmic_arb;
> @@ -165,6 +169,7 @@ struct spmi_pmic_arb_bus {
>   	u16			min_apid;
>   	u16			max_apid;
>   	int			irq;
> +	u8			id;
>   };
>   
>   /**
> @@ -179,7 +184,8 @@ struct spmi_pmic_arb_bus {
>    * @ee:			the current Execution Environment
>    * @ver_ops:		version dependent operations.
>    * @max_periphs:	Number of elements in apid_data[]
> - * @bus:		per arbiter bus instance
> + * @buses:		per arbiter buses instances
> + * @buses_available:	number of buses registered
>    */
>   struct spmi_pmic_arb {
>   	void __iomem		*rd_base;
> @@ -191,7 +197,8 @@ struct spmi_pmic_arb {
>   	u8			ee;
>   	const struct pmic_arb_ver_ops *ver_ops;
>   	int			max_periphs;
> -	struct spmi_pmic_arb_bus *bus;
> +	struct spmi_pmic_arb_bus *buses[PMIC_ARB_MAX_BUSES];
> +	int			buses_available;
>   };
>   
>   /**
> @@ -220,7 +227,7 @@ struct spmi_pmic_arb {
>   struct pmic_arb_ver_ops {
>   	const char *ver_str;
>   	int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
> -	int (*init_apid)(struct spmi_pmic_arb_bus *bus);
> +	int (*init_apid)(struct spmi_pmic_arb_bus *bus, int index);
>   	int (*ppid_to_apid)(struct spmi_pmic_arb_bus *bus, u16 ppid);
>   	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
>   	int (*offset)(struct spmi_pmic_arb_bus *bus, u8 sid, u16 addr,
> @@ -309,8 +316,8 @@ static int pmic_arb_wait_for_done(struct spmi_controller *ctrl,
>   			}
>   
>   			if (status & PMIC_ARB_STATUS_FAILURE) {
> -				dev_err(&ctrl->dev, "%s: %#x %#x: transaction failed (%#x)\n",
> -					__func__, sid, addr, status);
> +				dev_err(&ctrl->dev, "%s: %#x %#x: transaction failed (%#x) reg: 0x%x\n",
> +					__func__, sid, addr, status, offset);
>   				WARN_ON(1);
>   				return -EIO;
>   			}
> @@ -326,8 +333,8 @@ static int pmic_arb_wait_for_done(struct spmi_controller *ctrl,
>   		udelay(1);
>   	}
>   
> -	dev_err(&ctrl->dev, "%s: %#x %#x: timeout, status %#x\n",
> -		__func__, sid, addr, status);
> +	dev_err(&ctrl->dev, "%s: %#x %#x %#x: timeout, status %#x\n",
> +		__func__, bus->id, sid, addr, status);
>   	return -ETIMEDOUT;
>   }
>   
> @@ -1006,11 +1013,17 @@ static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
>   	return 0;
>   }
>   
> -static int pmic_arb_init_apid_v1(struct spmi_pmic_arb_bus *bus)
> +static int pmic_arb_init_apid_v1(struct spmi_pmic_arb_bus *bus, int index)
>   {
>   	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
>   	u32 *mapping_table;
>   
> +	if (index) {
> +		dev_err(&bus->spmic->dev, "Unsupported buses count %d detected\n",
> +			index);
> +		return -EINVAL;
> +	}
> +
>   	mapping_table = devm_kcalloc(&bus->spmic->dev, pmic_arb->max_periphs,
>   				     sizeof(*mapping_table), GFP_KERNEL);
>   	if (!mapping_table)
> @@ -1253,11 +1266,17 @@ static int pmic_arb_offset_v2(struct spmi_pmic_arb_bus *bus, u8 sid, u16 addr,
>   	return 0x1000 * pmic_arb->ee + 0x8000 * apid;
>   }
>   
> -static int pmic_arb_init_apid_v5(struct spmi_pmic_arb_bus *bus)
> +static int pmic_arb_init_apid_v5(struct spmi_pmic_arb_bus *bus, int index)
>   {
>   	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
>   	int ret;
>   
> +	if (index) {
> +		dev_err(&bus->spmic->dev, "Unsupported buses count %d detected\n",
> +			index);
> +		return -EINVAL;
> +	}
> +
>   	bus->base_apid = 0;
>   	bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
>   					PMIC_ARB_FEATURES_PERIPH_MASK;
> @@ -1329,6 +1348,50 @@ static int pmic_arb_get_core_resources_v7(struct platform_device *pdev,
>   	return pmic_arb_get_obsrvr_chnls_v2(pdev);
>   }
>   
> +/*
> + * Only v7 supports 2 buses. Each bus will get a different apid count, read
> + * from different registers.
> + */
> +static int pmic_arb_init_apid_v7(struct spmi_pmic_arb_bus *bus, int index)
> +{
> +	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
> +	int ret;
> +
> +	if (index == 0) {
> +		bus->base_apid = 0;
> +		bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
> +						   PMIC_ARB_FEATURES_PERIPH_MASK;
> +	} else if (index == 1) {
> +		bus->base_apid = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
> +						  PMIC_ARB_FEATURES_PERIPH_MASK;
> +		bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES1) &
> +						   PMIC_ARB_FEATURES_PERIPH_MASK;
> +	} else {
> +		dev_err(&bus->spmic->dev, "Unsupported buses count %d detected\n",
> +			bus->id);
> +		return -EINVAL;
> +	}
> +
> +	if (bus->base_apid + bus->apid_count > pmic_arb->max_periphs) {
> +		dev_err(&bus->spmic->dev, "Unsupported APID count %d detected\n",
> +			bus->base_apid + bus->apid_count);
> +		return -EINVAL;
> +	}
> +
> +	ret = pmic_arb_init_apid_min_max(bus);
> +	if (ret)
> +		return ret;
> +
> +	ret = pmic_arb_read_apid_map_v5(bus);
> +	if (ret) {
> +		dev_err(&bus->spmic->dev, "could not read APID->PPID mapping table, rc= %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   /*
>    * v7 offset per ee and per apid for observer channels and per apid for
>    * read/write channels.
> @@ -1581,7 +1644,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v5 = {
>   static const struct pmic_arb_ver_ops pmic_arb_v7 = {
>   	.ver_str		= "v7",
>   	.get_core_resources	= pmic_arb_get_core_resources_v7,
> -	.init_apid		= pmic_arb_init_apid_v5,
> +	.init_apid		= pmic_arb_init_apid_v7,
>   	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
>   	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
>   	.offset			= pmic_arb_offset_v7,
> @@ -1605,6 +1668,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>   				  struct device_node *node,
>   				  struct spmi_pmic_arb *pmic_arb)
>   {
> +	int bus_index = pmic_arb->buses_available;
>   	struct spmi_pmic_arb_bus *bus;
>   	struct device *dev = &pdev->dev;
>   	struct spmi_controller *ctrl;
> @@ -1623,7 +1687,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>   
>   	bus = spmi_controller_get_drvdata(ctrl);
>   
> -	pmic_arb->bus = bus;
> +	pmic_arb->buses[bus_index] = bus;
>   
>   	bus->ppid_to_apid = devm_kcalloc(dev, PMIC_ARB_MAX_PPID,
>   					 sizeof(*bus->ppid_to_apid),
> @@ -1666,12 +1730,13 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>   	bus->cnfg = cnfg;
>   	bus->irq = irq;
>   	bus->spmic = ctrl;
> +	bus->id = bus_index;
>   
> -	ret = pmic_arb->ver_ops->init_apid(bus);
> +	ret = pmic_arb->ver_ops->init_apid(bus, bus_index);
>   	if (ret)
>   		return ret;
>   
> -	dev_dbg(&pdev->dev, "adding irq domain\n");
> +	dev_dbg(&pdev->dev, "adding irq domain for bus %d\n", bus_index);
>   
>   	bus->domain = irq_domain_add_tree(dev->of_node,
>   					  &pmic_arb_irq_domain_ops, bus);
> @@ -1684,14 +1749,53 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>   					 pmic_arb_chained_irq, bus);
>   
>   	ctrl->dev.of_node = node;
> +	dev_set_name(&ctrl->dev, "spmi-%d", bus_index);
>   
>   	ret = devm_spmi_controller_add(dev, ctrl);
>   	if (ret)
>   		return ret;
>   
> +	pmic_arb->buses_available++;
> +
>   	return 0;
>   }
>   
> +static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
> +					struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
> +	struct device_node *child;
> +	int ret;
> +
> +	/* legacy mode doesn't provide child node for the bus */
> +	if (of_device_is_compatible(node, "qcom,spmi-pmic-arb"))
> +		return spmi_pmic_arb_bus_init(pdev, node, pmic_arb);
> +
> +	for_each_available_child_of_node(node, child) {
> +		if (of_node_name_eq(child, "spmi")) {
> +			ret = spmi_pmic_arb_bus_init(pdev, child, pmic_arb);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static void spmi_pmic_arb_deregister_buses(struct spmi_pmic_arb *pmic_arb)
> +{
> +	int i;
> +
> +	for (i = 0; i < PMIC_ARB_MAX_BUSES; i++) {
> +		struct spmi_pmic_arb_bus *bus = pmic_arb->buses[i];
> +
> +		irq_set_chained_handler_and_data(bus->irq,
> +						 NULL, NULL);
> +		irq_domain_remove(bus->domain);
> +	}
> +}
> +
>   static int spmi_pmic_arb_probe(struct platform_device *pdev)
>   {
>   	struct spmi_pmic_arb *pmic_arb;
> @@ -1762,21 +1866,19 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
>   
>   	pmic_arb->ee = ee;
>   
> -	return spmi_pmic_arb_bus_init(pdev, dev->of_node, pmic_arb);
> +	return spmi_pmic_arb_register_buses(pmic_arb, pdev);
>   }
>   
>   static void spmi_pmic_arb_remove(struct platform_device *pdev)
>   {
>   	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> -	struct spmi_pmic_arb_bus *bus = pmic_arb->bus;
>   
> -	irq_set_chained_handler_and_data(bus->irq,
> -					 NULL, NULL);
> -	irq_domain_remove(bus->domain);
> +	spmi_pmic_arb_deregister_buses(pmic_arb);
>   }
>   
>   static const struct of_device_id spmi_pmic_arb_match_table[] = {
>   	{ .compatible = "qcom,spmi-pmic-arb", },
> +	{ .compatible = "qcom,x1e80100-spmi-pmic-arb", },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, spmi_pmic_arb_match_table);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

