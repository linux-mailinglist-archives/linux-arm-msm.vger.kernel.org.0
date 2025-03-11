Return-Path: <linux-arm-msm+bounces-50943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4440EA5BE61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 12:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 754B116CB09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 11:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC5A2512DF;
	Tue, 11 Mar 2025 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ly03n0sG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1EA22686F
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741690905; cv=none; b=n5tkmJ0A4BvBr5Pe243o+cj7pslTPfApohkH0T2dwDBAi8j5ExVKVHzmUc1msSDCPNDucb2jB4pYEPMeczEGgMz9E61Z5H4qY5gfFCpgn0z7t08PiHn/YPpB+eaNIcCxuyV5naSdjmzJ64HCMkZhZhDx4NLx+4l38BSPLYO5cyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741690905; c=relaxed/simple;
	bh=A+f6h6EfmTGtZRZEGW74yESJsS+IX3pOBHVErJKcIns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cr8oZqfRrL0e+syhIPzO/7ecYNZPtf5xFD0htPmxMDV3byIkAj7gKTJR2SP2XLyFpu9g9gATBD11ux7sfIYj9bKQfqnTZ5sPvHIUSMzaQcuHb+JIkMg0a0WufAzesFih1baAlOhGboLoWbDyvBjtBD6oyPafjiDrFavVqxVriGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ly03n0sG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7ofji010119
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 11:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	awHQ8/tSf8UnEsKyWlG4BaSlcVJSFDh55E2Y4eShfpE=; b=ly03n0sGnyRbWXZc
	Eqmmn8T5v7nvzm1W+54NHl4VONNYs+ofF3qBBVxJmnT9jQ+LSElHdo7V953oVPwb
	62Rw2UoZPLYr+cMO7iaOSMZW6X9oLfwB/k826PojqKeSSKsKueQ8ovkS259fw12p
	+e5Cl0IGU5bj6UTfE3wym/GZEZcQbvRdulNkEJSqnp+hFKPkc3zatm5Xe067lr6q
	ybhm0xllpzRjurkpzT0NGZ8lvTAw1t3zG3r0MlErqBSrP4YrvJ+kGuZQWgaa0GG7
	T+JK9SNCjnmf7b/XorQg7IB3olq7itSCVXWETV/YzwBzK0Q5yiuPsW7uJeC+ESnN
	yW96Ng==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ah4s0jkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 11:01:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so6850173a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 04:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741690901; x=1742295701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awHQ8/tSf8UnEsKyWlG4BaSlcVJSFDh55E2Y4eShfpE=;
        b=OMtwu/V+KmRyfcoMm0BZP3J9/vhCOG78R/XynMvH6RMedmJobt9Zw4/Synq7/TaBZ4
         NKQ2DbZqSkifsESNIy2Tkvoc+WhaR/y6jca5Rk7cU7vgIrbIYkBiyo3G/P1HgzzK8irm
         3TcbXIZxdajap99MsRZ9gm8JSDc7ZbyPPb6aAERQYM1B7QkOv4YTJT/ACsaYhEn7Hi1E
         v3BnSz03OkSgW+KVkdhTdSD44qReXPOzS7e02zjI8w1jSnZ+/+kA2id4WDyGxzPZ+b1s
         DtCDNatYyq4O9gLHGuBVeYeWwqk6ROLkFHy2zoel/YsGVgWyIpSfvOOaR9Zf9gVAyagY
         WnKA==
X-Forwarded-Encrypted: i=1; AJvYcCWSXNzg61CwuuVNkiZ+6nybhNI2P9eydE0Lu8lau5D6vyG97R4sm0Omzqd9O7F2+PbVwMo97DPqgLrAf63N@vger.kernel.org
X-Gm-Message-State: AOJu0YzxoxqKgHjX5D2IBgRGfSbB6X+lNXpY+JVpalPZM3ANSX0AFW1Z
	bParEezleKnZEBfmdDKJy2agEHestboIHS6uRvxGOVQXxfAwm+xlIL3Kp5Qfjn25Rsk8Be80ood
	8QmDKjUYC1wQy6oBRnni1Xe9mUuALWtp3RjCsAN9Dm9ILv6W8A6MzEjWY7C/3M+Q+
X-Gm-Gg: ASbGncvN+xIwj2e4hUvEL/INuFjlfHAx8P39Ypcyg5od8mp5SMbONcqyMAGwyhL78ra
	MZ6aD3iKckLlq+dXuzaOrVPDC/1dHtcaIdnKIsx+UF05lJi39FhiQQAirxKokyprLbHf7mB2m9a
	jEH1lay8RuIhS0boTxGlLiXTte6XQOnHiPBsWPMdDCNemfc+d2x3DFc/v1Wll9ltZyWU5EJ3rnX
	2DbFAr/GvVgOaBVCcI9xzLor6omgUww2IwCJA0P9OIcdgw7SXyVtUGWHDHVwZ9VQF/AGztRihub
	pBXHxZy9kBR8rBOYPsnr6tSiit8J8A6aVflZ9+uy7W9gog==
X-Received: by 2002:a17:90b:164f:b0:2fe:a0ac:5fcc with SMTP id 98e67ed59e1d1-2ff7cf3e3eamr20418703a91.34.1741690900609;
        Tue, 11 Mar 2025 04:01:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvJShX7YcLtJuvnkvs5xiC1/MxsI3XPL/xg/+Wod3SHY2aB1lbaMeinxu1i1VNUiUbskVt6w==
X-Received: by 2002:a17:90b:164f:b0:2fe:a0ac:5fcc with SMTP id 98e67ed59e1d1-2ff7cf3e3eamr20418654a91.34.1741690900084;
        Tue, 11 Mar 2025 04:01:40 -0700 (PDT)
Received: from [10.92.192.202] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e7388sm10834772a91.35.2025.03.11.04.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 04:01:39 -0700 (PDT)
Message-ID: <9be6ce8e-f0e2-7226-e900-3a0c2506a16a@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 16:31:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 2/4] PCI: of: Add API to retrieve equalization presets
 from device tree
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?=
 <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_mrana@quicinc.com, quic_vbadigan@quicinc.com
References: <20250225-preset_v6-v7-0-a593f3ef3951@oss.qualcomm.com>
 <20250225-preset_v6-v7-2-a593f3ef3951@oss.qualcomm.com>
 <20250306032250.vzfhznmionz3qkx7@thinkpad>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250306032250.vzfhznmionz3qkx7@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYVH5xRf c=1 sm=1 tr=0 ts=67d01816 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=OvU543Yhaul-O2FZsO4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: mItrEqp__9tzj_6gKpkAdJ5vd8-owNxH
X-Proofpoint-ORIG-GUID: mItrEqp__9tzj_6gKpkAdJ5vd8-owNxH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503110073



On 3/6/2025 8:52 AM, Manivannan Sadhasivam wrote:
> On Tue, Feb 25, 2025 at 05:15:05PM +0530, Krishna Chaitanya Chundru wrote:
>> PCIe equalization presets are predefined settings used to optimize
>> signal integrity by compensating for signal loss and distortion in
>> high-speed data transmission.
>>
>> As per PCIe spec 6.0.1 revision section 8.3.3.3 & 4.2.4 for data rates
>> of 8.0 GT/s, 16.0 GT/s, 32.0 GT/s, and 64.0 GT/s, there is a way to
>> configure lane equalization presets for each lane to enhance the PCIe
>> link reliability. Each preset value represents a different combination
>> of pre-shoot and de-emphasis values. For each data rate, different
>> registers are defined: for 8.0 GT/s, registers are defined in section
>> 7.7.3.4; for 16.0 GT/s, in section 7.7.5.9, etc. The 8.0 GT/s rate has
>> an extra receiver preset hint, requiring 16 bits per lane, while the
>> remaining data rates use 8 bits per lane.
>>
>> Based on the number of lanes and the supported data rate, this function
>> reads the device tree property and stores in the presets structure.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/of.c  | 43 +++++++++++++++++++++++++++++++++++++++++++
>>   drivers/pci/pci.h | 27 ++++++++++++++++++++++++++-
>>   2 files changed, 69 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index 7a806f5c0d20..9ebe7d0e4e0c 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
>> @@ -851,3 +851,46 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
>>   	return slot_power_limit_mw;
>>   }
>>   EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
>> +
>> +/**
>> + * of_pci_get_equalization_presets - Parses the "eq-presets-Ngts" property.
>> + *
>> + * @dev: Device containing the properties.
>> + * @presets: Pointer to store the parsed data.
>> + * @num_lanes: Maximum number of lanes supported.
>> + *
>> + * If the property is present read and store the data in the preset structure
>> + * else assign default value 0xff to indicate property is not present.
> 
> 'If the property is present, read and store the data in the @presets structure.
> Else, assign a default value of PCI_EQ_RESV.'
> 
>> + *
>> + * Return: 0 if the property is not available or successfully parsed; errno otherwise.
>> + */
>> +int of_pci_get_equalization_presets(struct device *dev,
>> +				    struct pci_eq_presets *presets,
>> +				    int num_lanes)
>> +{
>> +	char name[20];
>> +	int ret;
>> +
>> +	presets->eq_presets_8gts[0] = PCI_EQ_RESV;
>> +	ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
>> +					 presets->eq_presets_8gts, num_lanes);
>> +	if (ret && ret != -EINVAL) {
>> +		dev_err(dev, "Error reading eq-presets-8gts :%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	for (int i = 0; i < EQ_PRESET_TYPE_MAX; i++) {
>> +		presets->eq_presets_Ngts[i][0] = PCI_EQ_RESV;
>> +		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << (i + 1));
>> +		ret = of_property_read_u8_array(dev->of_node, name,
>> +						presets->eq_presets_Ngts[i],
>> +						num_lanes);
>> +		if (ret && ret != -EINVAL) {
>> +			dev_err(dev, "Error reading %s :%d\n", name, ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 01e51db8d285..c8d44b21ef03 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -9,6 +9,8 @@ struct pcie_tlp_log;
>>   /* Number of possible devfns: 0.0 to 1f.7 inclusive */
>>   #define MAX_NR_DEVFNS 256
>>   
>> +#define MAX_NR_LANES 16
>> +
>>   #define PCI_FIND_CAP_TTL	48
>>   
>>   #define PCI_VSEC_ID_INTEL_TBT	0x1234	/* Thunderbolt */
>> @@ -808,6 +810,20 @@ static inline u64 pci_rebar_size_to_bytes(int size)
>>   
>>   struct device_node;
>>   
>> +#define PCI_EQ_RESV	0xff
>> +
>> +enum equalization_preset_type {
> 
> For the sake of completeness, you should add EQ_PRESET_TYPE_8GTS also. You could
> skip it while reading the of_property_read_u8_array().
Can we add like this to make parsing logic easier otherwise while
deference the presets array we need to subtract -1.
currently we are using like this presets[EQ_PRESET_TYPE_16GTS] if
we want to keep in same way we need to use like below.

	EQ_PRESET_TYPE_8GTS,
	EQ_PRESET_TYPE_16GTS = 0,
> 
>> +	EQ_PRESET_TYPE_16GTS,
>> +	EQ_PRESET_TYPE_32GTS,
>> +	EQ_PRESET_TYPE_64GTS,
>> +	EQ_PRESET_TYPE_MAX
>> +};
>> +
>> +struct pci_eq_presets {
>> +	u16 eq_presets_8gts[MAX_NR_LANES];
>> +	u8 eq_presets_Ngts[EQ_PRESET_TYPE_MAX][MAX_NR_LANES];
>> +};
>> +
>>   #ifdef CONFIG_OF
>>   int of_get_pci_domain_nr(struct device_node *node);
>>   int of_pci_get_max_link_speed(struct device_node *node);
>> @@ -822,7 +838,9 @@ void pci_release_bus_of_node(struct pci_bus *bus);
>>   
>>   int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
>>   bool of_pci_supply_present(struct device_node *np);
>> -
>> +int of_pci_get_equalization_presets(struct device *dev,
>> +				    struct pci_eq_presets *presets,
>> +				    int num_lanes);
>>   #else
>>   static inline int
>>   of_get_pci_domain_nr(struct device_node *node)
>> @@ -867,6 +885,13 @@ static inline bool of_pci_supply_present(struct device_node *np)
>>   {
>>   	return false;
>>   }
>> +
>> +static inline int of_pci_get_equalization_presets(struct device *dev,
>> +						  struct pci_eq_presets *presets,
>> +						  int num_lanes)
>> +{
> 
> Don't you need to initialize presets to PCI_EQ_RESV?
> 
I will update in the next patch.

- Krishna Chaitanya.
> - Mani
> 

