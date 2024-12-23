Return-Path: <linux-arm-msm+bounces-43124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F1B9FADDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 12:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1BFD164611
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 11:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FBB196434;
	Mon, 23 Dec 2024 11:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zft3yCMA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C388518BC19
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 11:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734954436; cv=none; b=bt6MWlqEAKAgzePI0ItXwwG9RSN+gI2MeXSrB+eL1lHrohG2+OGk2Lj6qs3PTKppPQiNW91YLgK7jyBONNCj4UT8CkK8xulmzr1zoJ7K6W8N+XsrizkQWXDGb04QwMcCiRbrHHAhHo+nNUrO5y6KvGMqJ6f7oRroAT5T1taw2Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734954436; c=relaxed/simple;
	bh=9B0swlY1icHspmzhbtnmpjXB5ErYiUPiOOG7FNdfGCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlHSSyWSQsPjOXw0YY3I2vq0FttIGdMigRr3JlkXwmTXDZ/pCcI3zzU5tGifkzObfP/zBtKh2qnCRszQ5qoVFIPnTjeqpriBqm1F0fWHN6domRJXkJHae1zVqAovO4PbQpyXmJ07LJjXbFuQ79nXMXKddBGJfYAYflAKtix+5K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zft3yCMA; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3035210e2d1so35641541fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 03:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734954433; x=1735559233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g7flEVlk8MpTJOgTC9yYtanlDHLTp9jgY7oIg2zLVp8=;
        b=Zft3yCMAfSkfb1CmOb6WTndLnvlgKzVsPD4hXB//uJX358uIbqc8PdzzUq/1mhsX2j
         +kJZRXDFSc8CkekWtO4Eil+hqnYugC/D8+QhhaOWep0sTJ7BIf5DB0VQLGtCxJxMo0QQ
         EYgoW4FAMJ4YCdf+W8FsqM+qEC+cVfZingdsZXyG2bZJSG9eCAt0ZM7v5Fho2x7Ux1YM
         YBpO9ZDG8M8aY/1k3EzEPZChoi7529/NchMNVD1BX5AwW8xHtw0Hq+3uGXV+svx46Ciz
         p59mptzJVGlI726xQNaYKtYJvednLNntZD27hJwxbdoVIOCU29M+o6sRKYs1H7uz1z2U
         Qucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734954433; x=1735559233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7flEVlk8MpTJOgTC9yYtanlDHLTp9jgY7oIg2zLVp8=;
        b=mFK2IhaJcOLYCuFoM1bPzqjGw+qThZucN1O3G6BMBBhK92vr30OJEh09EpiV7lBAPn
         lGi+s9AYFB/ig/Jzj12lpDlN4qFvQV+Tjw/dGePzADpbola1h4H7JedwEQbZRZekBFtF
         d7LfH2z4DeomR4IJNICpqLwEUEK8W/US92tLIL0TtLMHydX5aYGOJV6gfL6euEBmY3iA
         N3zCGkc6yVj3c1M/OUWerU2pRZt0y2DYXWfnE/VVs7hfJhQHoSLtZ3PWXP/IJhIQgsHG
         W+F3tOhp5WlcDuzKNoQSkP9averG5BmwOkHscjJMvnMy24L8rsAnAvXPehnF4pQNqrQ1
         VjTA==
X-Forwarded-Encrypted: i=1; AJvYcCW/7pUg9NNxrsRReC7ev0h5iGTcwgNlwjizDuk4t2luDvujtq7bl0+bvDBrSjGvTeKWM79EG8PDSRmlfzdC@vger.kernel.org
X-Gm-Message-State: AOJu0YxikK7bCMEdn/Jat3nIA43lqKKdcn6xm0IUjAuGWZnSiz8dU/lg
	//rRHmouLWhYMWj4yBMrT7dzusJkaTqo3frYoWw6rjNVDY6cY3iTPQ5va0WA0ZY=
X-Gm-Gg: ASbGncuzlJFznDVdK8lSvFREg+wDIY605BvLNZbuRbhdmB4RXkPH/NkEEPvj/rZeyLQ
	SVz99EHbxh7ZJS0UaCwXN8Y00xNIiwrqw8m8H5gToPJoVObhAZghZGuFhRK+Qgw2XMNs28/vpsZ
	lZsoOv2aPiJFEgN6DhQxxPGwUqW9i+SOJLwPaGkG1jsf+XFi6ZckMhaHodT1/GBGh+Ly5sLsuLu
	wPrd1mp4kxyCwpOokuGkaw8C7/gM6uwdEYC6KxBta7nz8rMqI+Cs7D5o7V8y9d/Uid6uNIZI//x
	YUSQL36J7X0xfymiIEqFcWF0mGPj2BZOyRdb
X-Google-Smtp-Source: AGHT+IHLyRi7Tw7aBKCX/6QAu/E4dS/9nNWC1QwOhKkG5IJ629IcuSzAa7yysmIgIEYb+glTHefHsA==
X-Received: by 2002:a05:651c:545:b0:2ff:bb68:4233 with SMTP id 38308e7fff4ca-3046862f303mr47513551fa.33.1734954432965;
        Mon, 23 Dec 2024 03:47:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad99d51sm14072201fa.32.2024.12.23.03.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 03:47:12 -0800 (PST)
Date: Mon, 23 Dec 2024 13:47:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, 
	quic_mrana@quicinc.com, quic_vbadigan@quicinc.com, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v3 2/4] PCI: of: Add API to retrieve equalization presets
 from device tree
Message-ID: <piccoomv7rx4dvvfdoesmxbzrdqz4ld6ii6neudsdf4hjj2yzm@2bcuacwa4feb>
References: <20241223-preset_v2-v3-0-a339f475caf5@oss.qualcomm.com>
 <20241223-preset_v2-v3-2-a339f475caf5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223-preset_v2-v3-2-a339f475caf5@oss.qualcomm.com>

On Mon, Dec 23, 2024 at 12:21:15PM +0530, Krishna Chaitanya Chundru wrote:
> PCIe equalization presets are predefined settings used to optimize
> signal integrity by compensating for signal loss and distortion in
> high-speed data transmission.
> 
> As per PCIe spec 6.0.1 revision section 8.3.3.3 & 4.2.4 for data rates
> of 8.0 GT/s, 16.0 GT/s, 32.0 GT/s, and 64.0 GT/s, there is a way to
> configure lane equalization presets for each lane to enhance the PCIe
> link reliability. Each preset value represents a different combination
> of pre-shoot and de-emphasis values. For each data rate, different
> registers are defined: for 8.0 GT/s, registers are defined in section
> 7.7.3.4; for 16.0 GT/s, in section 7.7.5.9, etc. The 8.0 GT/s rate has
> an extra receiver preset hint, requiring 16 bits per lane, while the
> remaining data rates use 8 bits per lane.
> 
> Based on the number of lanes and the supported data rate, this function
> reads the device tree property and stores in the presets structure.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/of.c  | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/pci/pci.h | 17 +++++++++++++++--
>  2 files changed, 60 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index dacea3fc5128..99e0e7ae12e9 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -826,3 +826,48 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
>  	return slot_power_limit_mw;
>  }
>  EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
> +

kerneldoc? Define who should free the memory and how.

> +int of_pci_get_equalization_presets(struct device *dev,
> +				    struct pci_eq_presets *presets,
> +				    int num_lanes)
> +{
> +	char name[20];
> +	void **preset;
> +	void *temp;
> +	int ret;
> +
> +	if (of_property_present(dev->of_node, "eq-presets-8gts")) {
> +		presets->eq_presets_8gts = devm_kzalloc(dev, sizeof(u16) * num_lanes, GFP_KERNEL);
> +		if (!presets->eq_presets_8gts)
> +			return -ENOMEM;
> +
> +		ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
> +						 presets->eq_presets_8gts, num_lanes);
> +		if (ret) {
> +			dev_err(dev, "Error reading eq-presets-8gts %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	for (int i = 1; i < sizeof(struct pci_eq_presets) / sizeof(void *); i++) {
> +		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << i);
> +		if (of_property_present(dev->of_node, name)) {
> +			temp = devm_kzalloc(dev, sizeof(u8) * num_lanes, GFP_KERNEL);
> +			if (!temp)
> +				return -ENOMEM;
> +
> +			ret = of_property_read_u8_array(dev->of_node, name,
> +							temp, num_lanes);
> +			if (ret) {
> +				dev_err(dev, "Error %s %d\n", name, ret);
> +				return ret;
> +			}
> +
> +			preset = (void **)((u8 *)presets + i * sizeof(void *));

Ugh.

> +			*preset = temp;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 14d00ce45bfa..82362d58bedc 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -731,7 +731,12 @@ static inline u64 pci_rebar_size_to_bytes(int size)
>  }
>  
>  struct device_node;
> -
> +struct pci_eq_presets {
> +	void *eq_presets_8gts;
> +	void *eq_presets_16gts;
> +	void *eq_presets_32gts;
> +	void *eq_presets_64gts;

Why are all of those void*? 8gts is u16*, all other are u8*.

> +};

Empty lines before and after the struct definition.

>  #ifdef CONFIG_OF
>  int of_pci_parse_bus_range(struct device_node *node, struct resource *res);
>  int of_get_pci_domain_nr(struct device_node *node);
> @@ -746,7 +751,9 @@ void pci_set_bus_of_node(struct pci_bus *bus);
>  void pci_release_bus_of_node(struct pci_bus *bus);
>  
>  int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
> -
> +int of_pci_get_equalization_presets(struct device *dev,
> +				    struct pci_eq_presets *presets,
> +				    int num_lanes);

Keep the empty line.

>  #else
>  static inline int
>  of_pci_parse_bus_range(struct device_node *node, struct resource *res)
> @@ -793,6 +800,12 @@ static inline int devm_of_pci_bridge_init(struct device *dev, struct pci_host_br
>  	return 0;
>  }
>  
> +static inline int of_pci_get_equalization_presets(struct device *dev,
> +						  struct pci_eq_presets *presets,
> +						  int num_lanes)
> +{
> +	return 0;
> +}
>  #endif /* CONFIG_OF */
>  
>  struct of_changeset;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

