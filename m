Return-Path: <linux-arm-msm+bounces-38109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 979709CFE5D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2024 12:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B9591F23F2E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2024 11:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73297199924;
	Sat, 16 Nov 2024 10:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3w1XcpS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E80198A05
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Nov 2024 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731754793; cv=none; b=iHDd6rNq52ZtKAVqSTiuPiOvHZAH99lY+jESq6NuTF6l6TJ1/7pGdPXPAKaHqABFP0IamIgpkPjY6IhXC+5AGmfLpaX3GOeL9wzXytAJcuaafnAKkVXyVnl+bXZLFHuc8gpMMKvKPeIpeDNI3jGKkTLngFy9jWzaVnkNuxFZRlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731754793; c=relaxed/simple;
	bh=PmscolI2mXDpV5YWhryXJvU3acF2ZXS/LdkkOpo9VBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nucQP0+83F0AWUGjWQCt3QiecsqvEpcJ9OUoqolvCwBnv41PClacLW+nZk7m4TA/twk6wS/EWV7b+d0WQx+C8iIdwMV9M2Yqw1MM5NzchD0r8VQREk4MzUTqFKdtzB573tQH7v7xDUkqPM2kQXOxjfxWfy2r8O06efR2HJ6u6m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3w1XcpS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AGAe1xU031121
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Nov 2024 10:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEuNRKRraARg6X+M5WAemGgIFgKlUbbFf4Gt3VpVQJM=; b=d3w1XcpSRBic/M87
	kAtfrEMKMS1qBYxdcjfPxVQayNAYX90pvOmUY9F+xEntPJV/EzelBQ1KZfsvt8jP
	mDvhomGr7iezyJApgEaDDENs4qV0VDIcfYFj4OQDWBH0CXIk/DFHJ6caF0oG1mEc
	gE+bcanukuTFhNnPgs3KrMafpvBFa/6v5fSJBR0dk1X9sITIj72pazKQ9sxsp7M3
	Wdnxdf8Gj7Akhc3ea3zEeciHVxq1WgL+ZnqqLBh1kp+OHKmN6fmM4CON8PFzJS8r
	ximTwUFc0PbqcaUrVlYyjVd3gPu9zQ+XDjkn5BKKNF8lUhiyBsK93O4mQiyHmK2B
	vUN8Gw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xmjhgkaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Nov 2024 10:59:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d37d9868b8so7639836d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Nov 2024 02:59:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731754783; x=1732359583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dEuNRKRraARg6X+M5WAemGgIFgKlUbbFf4Gt3VpVQJM=;
        b=n952rukNJ0LuscLR6NlcQ6J1OiF0X8EehaPDbYghh4dqAKDENM9ar2GkZKZM1iKpHu
         lVzY/oyAYuTXDcYQGCAFYaR7h2g1I0o7VvMl/NG1YFQD/BiemvkT2s2avem9GuZL5sM/
         q4ILqu/mz+w/hCuhfoE7hbhIUz5RELR83GZDh2GQIdSuOuWurircvweMHKukAPT/I7xK
         meP9ziP+EZKxDwcooqs7cjKUjdRba2A40O3E4ZbFAssPOx7iUOsAE4G+BeITlQEN2/H7
         sS4A7EYtdQVxT2MAoHy9J1YlxWC9k6XEEHn13Q4wVYqo/QKVr+MdaIIIWYJIBBqytvOX
         nT0w==
X-Gm-Message-State: AOJu0Ywv26pAT4Rh3ORg90Jlj7dy6PIYz+BNAStB2z10BfWqW5e4BLvs
	ZeGrocduYcQgl9N7hLll6nIDTNCkSJGcSz6RPVQnd3NdJBQzQCMR6Kx677NLg2RPw5ACrOR8D2s
	J/dsh9V2z/FgnCekdwXKjvgK7s8YO92Jt8+9OqscsAxxEfDM7BX9aocxFmt8btGWs
X-Received: by 2002:a05:620a:1a1b:b0:7a9:a632:3fde with SMTP id af79cd13be357-7b3622f386emr335474885a.12.1731754782869;
        Sat, 16 Nov 2024 02:59:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW+gW9FI7yso5UxsZITQpBrw4PMNQefqja8TjwYbVn37wZwMPcwlKXxGwnu/dMB3DbJXvq8w==
X-Received: by 2002:a05:620a:1a1b:b0:7a9:a632:3fde with SMTP id af79cd13be357-7b3622f386emr335472585a.12.1731754782494;
        Sat, 16 Nov 2024 02:59:42 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e0812aesm286231166b.176.2024.11.16.02.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2024 02:59:41 -0800 (PST)
Message-ID: <7dd7ecd2-c8a1-4800-8746-2b6166d3ae1c@oss.qualcomm.com>
Date: Sat, 16 Nov 2024 11:59:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] PCI: of: Add API to retrieve equalization presets
 from device tree
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        quic_mrana@quicinc.com, quic_vbadigan@quicinc.com, kernel@quicinc.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20241116-presets-v1-0-878a837a4fee@quicinc.com>
 <20241116-presets-v1-2-878a837a4fee@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241116-presets-v1-2-878a837a4fee@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oIx4-5-rKblfdXF1omCTsT9DWED4PSrS
X-Proofpoint-ORIG-GUID: oIx4-5-rKblfdXF1omCTsT9DWED4PSrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411160093

On 16.11.2024 2:37 AM, Krishna chaitanya chundru wrote:
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
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  drivers/pci/of.c  | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/pci/pci.h | 17 +++++++++++++--
>  2 files changed, 77 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index dacea3fc5128..0d37bc231956 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -826,3 +826,65 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
>  	return slot_power_limit_mw;
>  }
>  EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
> +
> +int of_pci_get_equalization_presets(struct device *dev,
> +				    struct pci_eq_presets *presets,
> +				    int num_lanes)
> +{
> +	int ret;
> +
> +	if (of_property_present(dev->of_node, "eq-presets-8gts")) {
> +		presets->eq_presets_8gts = devm_kzalloc(dev, sizeof(u16) * num_lanes, GFP_KERNEL);
> +		if (!presets->eq_presets_8gts)

If you make this an array with enum indices, you can make a for loop and
read "eq-presets-%ugts", (8 << i)

Konrad

