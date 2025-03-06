Return-Path: <linux-arm-msm+bounces-50435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5062A54133
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 04:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 769A23ABD5E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 03:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D931198A37;
	Thu,  6 Mar 2025 03:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u4FCKJ1a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC75192D8F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 03:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741231380; cv=none; b=CC+qFiBZ5hfXU+9+VYt45e/Mc0SOQtbE8uVRchShf91eIW6Cm8g5O4lfhDQIiAPujjHLbqTIo7cTV+Zc/0P72ikbrMHPUnzRsX17dvXOdcCdpWieE+2KYwgFzu1XKHzczk8Sla2KIGmlfcuVLdiDihjm5Jc6hJ1px/rpNSy7b58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741231380; c=relaxed/simple;
	bh=Ru/CpGpxmay/9MsSLlCOfSZnuKnc/nvpzizPFZJ2vUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLZZGgzQdlFtcNi4KvVzKXlEGpUe1Rtmi/EIEXp7bsjZTGpJtwil3HFE3UvML4j9dKJtbG7+cTu59cZbni2bZVttjBkERGfvmZJb50PlfzeCa0Nh3MVB7gnzoLVBmd4Mko8WyD4JClMIyo9Q8ORRoZ8/SPz8vnjbf4Gi9d5Qtys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u4FCKJ1a; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2232aead377so2847095ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 19:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741231377; x=1741836177; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kVRUb8q7uQnpUvlMyzRGCkdnBEaB/99BqJE+CFAT52A=;
        b=u4FCKJ1a/5FlPi3yxllrioCGopfyEFkRgtOeU7QN7xKS0zFrAgKgX4a6bnOkwgGzp2
         oX15Otuxr0DnoPNRWe+xLn1+rD9j2xB001WSY4nW0LmaBYuCpKHi9iQFfq/keJLzMqIp
         ecNqDUR5367BXvap1vc/EDmEEdJsejYCl5O6iMVlV5XeirIw6oD+eE+9OwV3m0axBL6d
         QQNhcoABnWRddfQnMCNeIXv0oEFUdDPEwlNJFKbas1uOj7vDMIGHxy5LuSevhuHMx68Y
         aoHpQRdwr7A8rvIz+q5z6Mj01hIApEmopaDk9IPtQuGN2+YN3dROUlo2zqTpYhf2OxsM
         s19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741231377; x=1741836177;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVRUb8q7uQnpUvlMyzRGCkdnBEaB/99BqJE+CFAT52A=;
        b=Hq1yXhbr0CceFXjOWKOXS/qiva16uKjMhr/EDOZtzs2PX8gpWClYu25kj0Cqqp6nHw
         n6Lfs5bNQmCt40/lFXaW+t1l5yKX38EV7j44FMtp5oQ5om3lhu5wiDrK7D7zSFKDOM4X
         qH7wBjoL1zDq/Ir2qswOPHuEDMUq1KCzwAEEwaBIlILlfIkskemm6A7edZBGNou0plHa
         0O0Tr0OoGAwsjHaC5+lQiya9Hd5L2EeaGlKWHbbIopKOJo0O1gx1mVngRJ7xeAAJpT2Q
         JGC33yR1fWulrqIQPc+lpyO9pTCpJsuAbwL3FaawFpkrV5t1eBsE3JQQlnhknNBaoq6S
         jl0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhjHk5QuLZGftm8n46M2q0VtRdlqZ/yHMf3rAAl0hk+deQjs8nvsTfWAbMEbr5vGcX1j8mlKfcGFiKqIfH@vger.kernel.org
X-Gm-Message-State: AOJu0YyrbN1lOaf989w79n0xhNsW5CGHzWgsrKPKLhO6YBTSADs5OF8b
	rfd+0Mj70bKk+xoROTviiRVJq/bEHxE2qw3cBwqLy2RIZoagP+Am88IeZEMUFg==
X-Gm-Gg: ASbGncuom6HgRExMqGKhqE8lZIjT1Sac+/L2FM7LWG49wU9RoEPgx6bBup8xDo80Wye
	2DjT8mHGziOkSGubjpFfJYH9oQG7jNXii8GHM6//zaYOPfzrR/NoMhnQQtYuD4nb3Gmw1HYXQfG
	Q8fi3PUBXGoYvafr/9mkUwodoW3OZvAlauktsqWa/3EzxGqgVT/6pgaGUzuU9g7+Eyhis4Anr1E
	Dgixvxt5/U3fwb2tjeUhlHorfHEFG07Ev+9h1BWYPMzVHIH3ddLNpVuEcjnH1KpehYhVYGHBrlT
	oh7JbwQ8zUzU34MilTXKc14tE971JqEElGgv1wkOZizqe9SXoZ4CGrI=
X-Google-Smtp-Source: AGHT+IFKgh0FiksUVgR3j46APqXiDJlCf1FcFsiDNFfW2pnSFNjsBifU8IM2NHTcJLX+Pjppt76cJA==
X-Received: by 2002:a17:902:d4c8:b0:220:e5be:29c8 with SMTP id d9443c01a7336-223f1cf56camr94178765ad.32.1741231377300;
        Wed, 05 Mar 2025 19:22:57 -0800 (PST)
Received: from thinkpad ([120.56.193.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a9193fsm1689105ad.164.2025.03.05.19.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 19:22:56 -0800 (PST)
Date: Thu, 6 Mar 2025 08:52:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	quic_mrana@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v7 2/4] PCI: of: Add API to retrieve equalization presets
 from device tree
Message-ID: <20250306032250.vzfhznmionz3qkx7@thinkpad>
References: <20250225-preset_v6-v7-0-a593f3ef3951@oss.qualcomm.com>
 <20250225-preset_v6-v7-2-a593f3ef3951@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250225-preset_v6-v7-2-a593f3ef3951@oss.qualcomm.com>

On Tue, Feb 25, 2025 at 05:15:05PM +0530, Krishna Chaitanya Chundru wrote:
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
>  drivers/pci/of.c  | 43 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/pci/pci.h | 27 ++++++++++++++++++++++++++-
>  2 files changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index 7a806f5c0d20..9ebe7d0e4e0c 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -851,3 +851,46 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
>  	return slot_power_limit_mw;
>  }
>  EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
> +
> +/**
> + * of_pci_get_equalization_presets - Parses the "eq-presets-Ngts" property.
> + *
> + * @dev: Device containing the properties.
> + * @presets: Pointer to store the parsed data.
> + * @num_lanes: Maximum number of lanes supported.
> + *
> + * If the property is present read and store the data in the preset structure
> + * else assign default value 0xff to indicate property is not present.

'If the property is present, read and store the data in the @presets structure.
Else, assign a default value of PCI_EQ_RESV.'

> + *
> + * Return: 0 if the property is not available or successfully parsed; errno otherwise.
> + */
> +int of_pci_get_equalization_presets(struct device *dev,
> +				    struct pci_eq_presets *presets,
> +				    int num_lanes)
> +{
> +	char name[20];
> +	int ret;
> +
> +	presets->eq_presets_8gts[0] = PCI_EQ_RESV;
> +	ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
> +					 presets->eq_presets_8gts, num_lanes);
> +	if (ret && ret != -EINVAL) {
> +		dev_err(dev, "Error reading eq-presets-8gts :%d\n", ret);
> +		return ret;
> +	}
> +
> +	for (int i = 0; i < EQ_PRESET_TYPE_MAX; i++) {
> +		presets->eq_presets_Ngts[i][0] = PCI_EQ_RESV;
> +		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << (i + 1));
> +		ret = of_property_read_u8_array(dev->of_node, name,
> +						presets->eq_presets_Ngts[i],
> +						num_lanes);
> +		if (ret && ret != -EINVAL) {
> +			dev_err(dev, "Error reading %s :%d\n", name, ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 01e51db8d285..c8d44b21ef03 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -9,6 +9,8 @@ struct pcie_tlp_log;
>  /* Number of possible devfns: 0.0 to 1f.7 inclusive */
>  #define MAX_NR_DEVFNS 256
>  
> +#define MAX_NR_LANES 16
> +
>  #define PCI_FIND_CAP_TTL	48
>  
>  #define PCI_VSEC_ID_INTEL_TBT	0x1234	/* Thunderbolt */
> @@ -808,6 +810,20 @@ static inline u64 pci_rebar_size_to_bytes(int size)
>  
>  struct device_node;
>  
> +#define PCI_EQ_RESV	0xff
> +
> +enum equalization_preset_type {

For the sake of completeness, you should add EQ_PRESET_TYPE_8GTS also. You could
skip it while reading the of_property_read_u8_array().

> +	EQ_PRESET_TYPE_16GTS,
> +	EQ_PRESET_TYPE_32GTS,
> +	EQ_PRESET_TYPE_64GTS,
> +	EQ_PRESET_TYPE_MAX
> +};
> +
> +struct pci_eq_presets {
> +	u16 eq_presets_8gts[MAX_NR_LANES];
> +	u8 eq_presets_Ngts[EQ_PRESET_TYPE_MAX][MAX_NR_LANES];
> +};
> +
>  #ifdef CONFIG_OF
>  int of_get_pci_domain_nr(struct device_node *node);
>  int of_pci_get_max_link_speed(struct device_node *node);
> @@ -822,7 +838,9 @@ void pci_release_bus_of_node(struct pci_bus *bus);
>  
>  int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
>  bool of_pci_supply_present(struct device_node *np);
> -
> +int of_pci_get_equalization_presets(struct device *dev,
> +				    struct pci_eq_presets *presets,
> +				    int num_lanes);
>  #else
>  static inline int
>  of_get_pci_domain_nr(struct device_node *node)
> @@ -867,6 +885,13 @@ static inline bool of_pci_supply_present(struct device_node *np)
>  {
>  	return false;
>  }
> +
> +static inline int of_pci_get_equalization_presets(struct device *dev,
> +						  struct pci_eq_presets *presets,
> +						  int num_lanes)
> +{

Don't you need to initialize presets to PCI_EQ_RESV?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

