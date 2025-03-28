Return-Path: <linux-arm-msm+bounces-52713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D83AA74346
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 06:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B23D41887E5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 05:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE1520DD74;
	Fri, 28 Mar 2025 05:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dQpQ2U9Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8D418DB03
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 05:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743139476; cv=none; b=LcMtY4X4afOnONJ0QEVFX5/wDBAsocJUyFvXi8Z+VjA3xD97yznUfO8TVr9FQPveRXrGyzabGmY6zb9+nRPRZvSzH9ohl6GtYuuuPiaUP3f2AwUj63jejeBvS+LNEqpWV0vepcrbmqLrqixdzN0Ge/02eN+jcBYJE37RMeItD+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743139476; c=relaxed/simple;
	bh=hKwE0aVj7IxvPgqbug4g8fwgNRQS3t1i+9RqDv29W3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRHKuSoLjLq++WuLXRLnUiaroVg0f0/gGU87pBBGkE35pN0aIg/72+E2JOh6SwNXAgC98fAhPLHLDo6jDhAlhbU21TdbLA9nuOJ0mZ33SKg5tIx0yPkUTHmsLjMmScScW1GhIUptpZneDVnLUVv2eF+LKD6qbrveoMefp+Zn+n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dQpQ2U9Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RFI2nX025667
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 05:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QSK0TFoPYN4H7p8t4mXqY9o9fUEjdQFFbsNmfIJdZ1g=; b=dQpQ2U9Y2CX//k4l
	gx8DBLqDIuov7liNgOfVdZtMJt6yvqOw4TdP4KqswW8V8Ka7LUZ9nY5CJfRiawUo
	ZnE8y5wti0LeBjeM62+HgBC3sfJDq8MhY9dq/yPOkN/TTO0cLusKIHq9KkiVlWWe
	DOO5urZAdMcdgQK6/MISwmfUvL7ATeFtTWEc0mpF1IzETczZCSLXydCxzoZZWkLy
	V0Cip2AnVX+UJGjieF3BJj9omLDUo0L+9vid4rf531lW+3Ax051rSA2LqKbeUUet
	Kmxu+1thsu/9P98x46dh4aLFeVDGZzGx8HggVSjgbs+Liu6BrY3Cf8fK5jkZa46T
	tYvhCg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0nuua9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 05:24:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff69646218so4806240a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 22:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743139473; x=1743744273;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSK0TFoPYN4H7p8t4mXqY9o9fUEjdQFFbsNmfIJdZ1g=;
        b=TfYo3A2STpgjroopup1OOIBqtIKjKjghboveri8fHTzc1vTsmFeZdgjkNwPRvS1P4o
         IlAun7CdgVwIt6MEQuwRmV19xu4dK6g/RVihh88xtgUqVkWA3lj/y7QVUR+KTLGxRm+w
         pz8m4A8ysYSWyh7bUq9KQkRPwgPsHuEnVTRQByxB9uTSVi51YxBQtIinDZPceOsL0vSN
         uyJ+AEpG882FLPmgafQipiPDpkgfNu2UyicqCKfM4FEBCF8Ge+v0cRHfQUzRbC/sd8gs
         Q5LInhsB7ynpA7pdqIZ1oX/yxUyTvK7uXe1vUKEle9kKpcfYomQ+rHTdDwRE+BvTpbuQ
         K4tQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1AQzT9PTWfRqJF2RBChsnTJT2Mj0NgcJ44c7VNg6JA4kMzHT1oQnedt+q0cgrA0+C0VhmG3AiY4pZrVUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwmMkjwbxonEVv+7EKUpgElfTifIQAlBu2A996zzehCRj55euw9
	qxsidt7Gk/P6YbDkgKI8W/26nItnsVcIW9KNJAnifL4berybMazu2Niqe5YAbhD1AykNGHiOSpM
	xkqS6W/dBbIq9d+xPC8BAcAOL2D15trsOIWUhO+wGVOtgBWonHwa1xpq9mc0uL+CR
X-Gm-Gg: ASbGncvHDY6UFgUinyPXiSe8TaYehz2mS1d9PMLp1iTvgyzTIwLFb/At/e5lABJZn20
	DeqEFt7t6nPG5dNSAMkAYZvcU34quNd6NsEtz3DDs4zKQc4m9ccbGHvCZ2RVL/SPPoD6W8J6W1l
	rAQf8nqWJ4wiuJC9NX66xd9hwNYVMLO4ikC8vU2APr6asli+MecP483gLcMwzrTMVavQ68rmONR
	O1/gi1UUJqRsVXGGAEEF5BAmOKEatq2BxeT9FMzns9Spn50QMtTyFQ/LUdu8Wdfv2uL8aWxdbHT
	ik+FwTg2MXjjHHDhPMYhlmfWEqjYj711a/YSjrFnqRllCw==
X-Received: by 2002:a05:6a20:a108:b0:1fa:9819:b064 with SMTP id adf61e73a8af0-1fea2d70237mr12642145637.18.1743139472667;
        Thu, 27 Mar 2025 22:24:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ6Ufty4NvxamcgmWJLeaXvoKya4Z1DfFIgAAvJV3k/9x3mn97U7mCVnp7j3hgm0R0G+mdyg==
X-Received: by 2002:a05:6a20:a108:b0:1fa:9819:b064 with SMTP id adf61e73a8af0-1fea2d70237mr12642107637.18.1743139472118;
        Thu, 27 Mar 2025 22:24:32 -0700 (PDT)
Received: from [10.92.192.202] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93ba1b22bsm795906a12.77.2025.03.27.22.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 22:24:31 -0700 (PDT)
Message-ID: <7a0724ad-89a5-0ccd-eba5-ca4871ce1cdd@oss.qualcomm.com>
Date: Fri, 28 Mar 2025 10:54:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 2/4] PCI: of: Add of_pci_get_equalization_presets() API
Content-Language: en-US
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
References: <20250316-preset_v6-v8-0-0703a78cb355@oss.qualcomm.com>
 <20250316-preset_v6-v8-2-0703a78cb355@oss.qualcomm.com>
 <gl2klkvpkb2vrxrzdqbqjomfis66tldy6witvbqdd2ig3st3rw@jstguoejcofa>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <gl2klkvpkb2vrxrzdqbqjomfis66tldy6witvbqdd2ig3st3rw@jstguoejcofa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HcYKXZOoQ5OPv4QtybCnWhekjT5NY7t4
X-Authority-Analysis: v=2.4 cv=AcaxH2XG c=1 sm=1 tr=0 ts=67e63291 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=wBt9fhMRhOodALO6grUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: HcYKXZOoQ5OPv4QtybCnWhekjT5NY7t4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280035



On 3/28/2025 10:09 AM, Manivannan Sadhasivam wrote:
> On Sun, Mar 16, 2025 at 09:39:02AM +0530, Krishna Chaitanya Chundru wrote:
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
>> Based on the number of lanes and the supported data rate,
>> of_pci_get_equalization_presets() reads the device tree property and
>> stores in the presets structure.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/of.c  | 44 ++++++++++++++++++++++++++++++++++++++++++++
>>   drivers/pci/pci.h | 32 +++++++++++++++++++++++++++++++-
>>   2 files changed, 75 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index 7a806f5c0d20..18691483e108 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
>> @@ -851,3 +851,47 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
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
>> + * If the property is present, read and store the data in the @presets structure.
>> + * Else, assign a default value of PCI_EQ_RESV.
>> + *
>> + * Return: 0 if the property is not available or successfully parsed else
>> + * errno otherwise.
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
> 
> 'Error reading eq-presets-8gts: %d'
> 
>> +		return ret;
>> +	}
>> +
>> +	for (int i = 0; i < EQ_PRESET_TYPE_MAX - 1; i++) {
>> +		presets->eq_presets_Ngts[i][0] = PCI_EQ_RESV;
>> +		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << (i + 1));
>> +		ret = of_property_read_u8_array(dev->of_node, name,
>> +						presets->eq_presets_Ngts[i],
>> +						num_lanes);
>> +		if (ret && ret != -EINVAL) {
>> +			dev_err(dev, "Error reading %s :%d\n", name, ret);
> 
> 'Error reading %s: %d'
> 
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 01e51db8d285..78c9cc0ad8fa 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -9,6 +9,8 @@ struct pcie_tlp_log;
>>   /* Number of possible devfns: 0.0 to 1f.7 inclusive */
>>   #define MAX_NR_DEVFNS 256
>>   
>> +#define MAX_NR_LANES 16
> 
> Why did you limit to 16?
> 
As per PCIe spec we support maximum of 16 lanes only right

- Krishna Chaitanya.
> - Mani
> 

