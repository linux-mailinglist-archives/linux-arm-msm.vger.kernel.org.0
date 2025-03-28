Return-Path: <linux-arm-msm+bounces-52718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD1DA74427
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 07:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5127D3A9E29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 06:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBF921148A;
	Fri, 28 Mar 2025 06:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtN/PI1z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DEAC2C8
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 06:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743144754; cv=none; b=X9bkOnoYYfD4Yp+D8dtLMTaXfvOHD6BGtUs4yT/u/O0iqNWCiGVd14wgK0vx7hhJhaQYf3bxzSvrAAV3XzKqirC5+07CT9QPN2VZUmXp/TEf82+6eM1vBOjO3Oe3KAIOJ+b3fZKn9uKpXIbISSxv9WsA9QoxWN9jEaFypSV33gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743144754; c=relaxed/simple;
	bh=9lHxPXrnLv9eBmUN4XlRv6P9qYNb/DkhwAuIpFAGeHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEpKGzXYW24c/S4k5iljzoZNGahyijRkwI/fFrWPdoXxsOowI2j2q7QsbkRAP1sZzP65xATUKbpC1Um8nggYJDNTKWsefeElxEO2q751poOYlHPJ+Wobr/ETMorbto+et20OJVSmBIja3/nfRhcts3OZvZfWAkdEtinnvzqIehU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtN/PI1z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S2C2xK023507
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 06:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fL0wsoPCEVHd0F5W/C0Cm1sTkZq1pOZ2ziK/M8hcTqQ=; b=DtN/PI1z21utNG/i
	EytiAu/kdHNrS9iKShHmnWRbiIyGdCoFK0Z1mDqeoBWI49HMULYgXfbBvWCkrotL
	QME7WckGb/rAsXrMsUz66cxnQV7r3BYLvCldFret/Gk3BJ3YQbedxqhqTLKYhHC9
	cLdEHg5ZIlN35HzODx2GkGuTesuL5YeM8QB5HSBOnqBpf1+DyJI0/q0IZxQU756x
	RTHUniPOCV8rWe5JE7NpgGtEcfnmtaJAnN8EvcMh8LumKvyvE0bfogjIOKf3/dnx
	B/Sy90i1ww3wEdBfX2IZnT0xpNmvl+rg/0iGi749SyqQWJghtHpmPqS/aklLgtmI
	rrsFqw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45njsc0kum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 06:52:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2240a96112fso55397685ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 23:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743144751; x=1743749551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fL0wsoPCEVHd0F5W/C0Cm1sTkZq1pOZ2ziK/M8hcTqQ=;
        b=q59E/Si3jz1F/FpBq8ON2iX1pqW9ntcsxjQJPoH128gw3jnEUYKuGAloU7/9x+LO2R
         lLzCHaVznGwnIAt0c1IlhF6ersMRwtN6pvHEEbqQSpBEFqOegs0gNIEaGrXgJ5krMahj
         90RI95ih+iUWJT3n2oHwpDI/1CrOoUfjKZ4gLwwduaQ5I2mJzy0WhvRWs2MEWWGW4g8w
         5KLMKwgw45lpwCOfC4AYxqVg1rvjMSyfgLAz6zkv+OEx+8PN1o58opfiHYXDVuDVZuSB
         ZVUPlUZ2mr47FQbomhXgoULy9z2NrmblG4mY8CNRi5zPbJJ0Q7fQNEsCgFkhfZQJZj2g
         P7vw==
X-Forwarded-Encrypted: i=1; AJvYcCVs+NB1qNtaV7q66hmv2JNiCcMqnYeB77UzxNSYfhj8VPG744fO/CY8equYkI0ujsVK8aJA1YH3G0THwwvT@vger.kernel.org
X-Gm-Message-State: AOJu0YzJTA4yEbR+VmkIlyYBuQtdvnZnlqhnSycdkDPcPWpojkIqRLBm
	V/WXCZ4tMy48PTA+KkE/Q9cK++W01ylx1usRbuhZIFsGfpdmUowTCQRluUAyFLyLcyCWSpDPSlM
	02bZtEAMZj8p08b72Kdx+ZCV+nqxMpGFhdSshwLr3SxeyJrdC20YWskNMjjNrMF7Q
X-Gm-Gg: ASbGncuThWdDFHcD+lr/ss1C+4tDR/Lc7WLYZi5zMXJD1GGVhGwEcXdVMKJ5E3wXupp
	kZ3s7qfYQIBXyZ4J0T46Rs1sV0Th3R5lFbedmKds7Bp5jfSJ7Em9+sTi+ARUwVobhbaE3OfjeMZ
	8OmJGGdINUvi89VaWdJNnlEyBS2otRdSCCJYPO+/Zwd7f3pNIJA3WXrqHTFWJzseWhGazkKHAwO
	ggcvyI03TbzFAzhHJKYk2M6nJRJK8IBz3HIzO+hXuVkUsU3dEcbAzo4HpeBWLhuWRxfzVEEYNhj
	Sk8LwpV+KC1c3HlF2rAfXj1KqP4ZubAdNV7Zvr7xfhf+VQ==
X-Received: by 2002:a05:6a00:88e:b0:736:5545:5b84 with SMTP id d2e1a72fcca58-73960e0cdb6mr11297944b3a.3.1743144750891;
        Thu, 27 Mar 2025 23:52:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHcHQwhgg0IH/oYdx4ttXb7q2lYkNiP8atH6NOJ54/TnmCTiuOM9YtfoaujKYd6jAJA9jQZA==
X-Received: by 2002:a05:6a00:88e:b0:736:5545:5b84 with SMTP id d2e1a72fcca58-73960e0cdb6mr11297875b3a.3.1743144750186;
        Thu, 27 Mar 2025 23:52:30 -0700 (PDT)
Received: from [10.92.192.202] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710b493esm1016147b3a.149.2025.03.27.23.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 23:52:29 -0700 (PDT)
Message-ID: <bc8cbbfd-b96f-21b6-6c6d-dd1b97f16035@oss.qualcomm.com>
Date: Fri, 28 Mar 2025 12:22:23 +0530
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
 <7a0724ad-89a5-0ccd-eba5-ca4871ce1cdd@oss.qualcomm.com>
 <epg6mtsnemzwnqvsze7zbkehovxvu6fpmw52kzfrjmjahadg66@k4gprl4zg5b3>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <epg6mtsnemzwnqvsze7zbkehovxvu6fpmw52kzfrjmjahadg66@k4gprl4zg5b3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fJk53Yae c=1 sm=1 tr=0 ts=67e64730 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=gJnbMjkyvPzYppnzV1QA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: tZcY-5GYim0DkWYcAxcON3AMOcDZnjvt
X-Proofpoint-ORIG-GUID: tZcY-5GYim0DkWYcAxcON3AMOcDZnjvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=992 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280045



On 3/28/2025 12:13 PM, Manivannan Sadhasivam wrote:
> On Fri, Mar 28, 2025 at 10:54:25AM +0530, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 3/28/2025 10:09 AM, Manivannan Sadhasivam wrote:
>>> On Sun, Mar 16, 2025 at 09:39:02AM +0530, Krishna Chaitanya Chundru wrote:
>>>> PCIe equalization presets are predefined settings used to optimize
>>>> signal integrity by compensating for signal loss and distortion in
>>>> high-speed data transmission.
>>>>
>>>> As per PCIe spec 6.0.1 revision section 8.3.3.3 & 4.2.4 for data rates
>>>> of 8.0 GT/s, 16.0 GT/s, 32.0 GT/s, and 64.0 GT/s, there is a way to
>>>> configure lane equalization presets for each lane to enhance the PCIe
>>>> link reliability. Each preset value represents a different combination
>>>> of pre-shoot and de-emphasis values. For each data rate, different
>>>> registers are defined: for 8.0 GT/s, registers are defined in section
>>>> 7.7.3.4; for 16.0 GT/s, in section 7.7.5.9, etc. The 8.0 GT/s rate has
>>>> an extra receiver preset hint, requiring 16 bits per lane, while the
>>>> remaining data rates use 8 bits per lane.
>>>>
>>>> Based on the number of lanes and the supported data rate,
>>>> of_pci_get_equalization_presets() reads the device tree property and
>>>> stores in the presets structure.
>>>>
>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>>>    drivers/pci/of.c  | 44 ++++++++++++++++++++++++++++++++++++++++++++
>>>>    drivers/pci/pci.h | 32 +++++++++++++++++++++++++++++++-
>>>>    2 files changed, 75 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>>>> index 7a806f5c0d20..18691483e108 100644
>>>> --- a/drivers/pci/of.c
>>>> +++ b/drivers/pci/of.c
>>>> @@ -851,3 +851,47 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
>>>>    	return slot_power_limit_mw;
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
>>>> +
>>>> +/**
>>>> + * of_pci_get_equalization_presets - Parses the "eq-presets-Ngts" property.
>>>> + *
>>>> + * @dev: Device containing the properties.
>>>> + * @presets: Pointer to store the parsed data.
>>>> + * @num_lanes: Maximum number of lanes supported.
>>>> + *
>>>> + * If the property is present, read and store the data in the @presets structure.
>>>> + * Else, assign a default value of PCI_EQ_RESV.
>>>> + *
>>>> + * Return: 0 if the property is not available or successfully parsed else
>>>> + * errno otherwise.
>>>> + */
>>>> +int of_pci_get_equalization_presets(struct device *dev,
>>>> +				    struct pci_eq_presets *presets,
>>>> +				    int num_lanes)
>>>> +{
>>>> +	char name[20];
>>>> +	int ret;
>>>> +
>>>> +	presets->eq_presets_8gts[0] = PCI_EQ_RESV;
>>>> +	ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
>>>> +					 presets->eq_presets_8gts, num_lanes);
>>>> +	if (ret && ret != -EINVAL) {
>>>> +		dev_err(dev, "Error reading eq-presets-8gts :%d\n", ret);
>>>
>>> 'Error reading eq-presets-8gts: %d'
>>>
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	for (int i = 0; i < EQ_PRESET_TYPE_MAX - 1; i++) {
>>>> +		presets->eq_presets_Ngts[i][0] = PCI_EQ_RESV;
>>>> +		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << (i + 1));
>>>> +		ret = of_property_read_u8_array(dev->of_node, name,
>>>> +						presets->eq_presets_Ngts[i],
>>>> +						num_lanes);
>>>> +		if (ret && ret != -EINVAL) {
>>>> +			dev_err(dev, "Error reading %s :%d\n", name, ret);
>>>
>>> 'Error reading %s: %d'
>>>
>>>> +			return ret;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
>>>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>>>> index 01e51db8d285..78c9cc0ad8fa 100644
>>>> --- a/drivers/pci/pci.h
>>>> +++ b/drivers/pci/pci.h
>>>> @@ -9,6 +9,8 @@ struct pcie_tlp_log;
>>>>    /* Number of possible devfns: 0.0 to 1f.7 inclusive */
>>>>    #define MAX_NR_DEVFNS 256
>>>> +#define MAX_NR_LANES 16
>>>
>>> Why did you limit to 16?
>>>
>> As per PCIe spec we support maximum of 16 lanes only right
>>
> 
> No. PCIe spec defines Max Link Width up to 32 lanes. Though, we have only seen
> 16 lanes used widely. This field should correspond to 'Maximum Link Width' value
> in the Link Capabilities Register.
> 
As per spec 6.0.1 section 7.5.3.6 Link Capabilities Register max link
width is x16 only.

- Krishna Chaitanya.
> - Mani
> 

