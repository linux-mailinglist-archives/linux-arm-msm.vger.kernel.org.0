Return-Path: <linux-arm-msm+bounces-50944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BD0A5BE65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 12:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36DDE3A5A78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 11:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903EF2500D0;
	Tue, 11 Mar 2025 11:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkwUeDI7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFDB1EE001
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741690971; cv=none; b=blcrPM2iqmtj5n2bg5a7HzG9xo/4KCMJHcD8cQa0MAX0J/70ITVHXSIc4mt+OFKTbNXhZwneBJcY/msvnn1F+XYYU6DoM6GdVPzwEUlygfOy9uaalQSnsQNnNJylH7FBk9QsVEnvCkUxfqzDVqqb748Y9Z/8wBOS+0Hd4WzeKkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741690971; c=relaxed/simple;
	bh=OG9yCNW/vLXkjL1UJNfdpinYRRTJIjKoUvm6/hw2Tjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXv5qgbjfI5ibAoMpUiI/YPHCbTl3AMdSw0fpBzNxKuH5zXFHRSY/gSEyTfr2LY7hfBxqTLFhNjOL45dZ2UihKWJkfMRzhQ877h7XpHtL8xopTt3p0aT0fBrOweu/4lQTLWLNmuDVCJLYJeTnGdh2MnAE4QEixrkOkZ7O19F4II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PkwUeDI7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B788mF025707
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 11:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GV6m8Ea3fXu54GabXySXUwHNgdLEKAmBjtoceSFkt1c=; b=PkwUeDI7UMuYKstI
	AkTZg6g4eFb57xBrGAHINkAMtSxmI+rdhcbRb+0OnSUQketsCltxEiuYGVvD/TXR
	LtKE9Gl7hw+2H+F5SFoNZZxVewxy1HMD70wLuNQr7rZ98riosBW5gE2LG/QhgwfL
	0OdKVfCR+F5DpjuBE+UsjQTvGLrsVwgYORZD8auRdZgin3rYMgiUur6a1Zmw+vhD
	vhsNyT4RkoLEHKjbLLzRybUfHu9oMeAGX6f5hpHc6S5foMRAko9unI6ygy2mfnSA
	hWge+BioDyUTPiPPTtk2aECzU5nm+3pQwu/lf3xoyeU4tEJF0tLaRqmLBXldBPmY
	c22H1g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewk87wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 11:02:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2240fea0482so136800495ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 04:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741690967; x=1742295767;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GV6m8Ea3fXu54GabXySXUwHNgdLEKAmBjtoceSFkt1c=;
        b=an1AEsWCbZG4WCM3gyufBu4wbut+wtOk+32OvrN+KPJTrxIwQSy/kuXFoE31/qUPQi
         IuPK0z5UW4wvuWuhfIsNcwzYcSW+qMYPP4u2jaHPPIKpnnIhspb5FLlV/nCesHf8QaoQ
         V/5Ghpb2r7+iOlcVVZM0Z8pTKuh459yiN189jqQ7zr9oyUYg+7azb66ltklM9HdROHcJ
         epcPRWniNjzsTBC6H5KWMfAXcazECq62/DrzB2mUhddh/9loCC8p9UEhQidahqvvniZN
         medGb7XP7bCa86kMOAR3gqVYx/vZGoMP7HkXkwz9GNEgo3hORviIYdqzWq4tzCdA2c2H
         FpIw==
X-Forwarded-Encrypted: i=1; AJvYcCVZsztDJMhQ4C2EwzPoyBDyVVPFln3+iuWF0RxAI5dryewFEBdLVVu3yJh+RoPRpl2kYD5GgAIEYA+wwRlP@vger.kernel.org
X-Gm-Message-State: AOJu0YxRpr5Bit9pDgOVugYFR5hXgohwFBOS844bmCebxO9BxIsb6pBq
	Wl/IFXWLaJ3qNudAjbtcNH/TzgTtJRKVXFvifaoxD29BJ775271lgpjaiq15PEQiic+V1LgKBd7
	VngnIn9QNFF9jF08fzBS/EGwA4/3NYTEz/+fHeHO6WorCKFcNBs/xzHgwGvb3DCgU
X-Gm-Gg: ASbGncuPgnyNP0xawPwYl8f9CwPG7VB/w/lpZaAgfK56C/5t4rdIwZknLm6/9Owsjdv
	6AMgMV4JI3CtSkImAQrBQgFm3EjNb+zU8iHfSpUoqHwoweHzC3XhFTe1LrCW/NIzbeR7syNvl0S
	dDXuQzN0tjGrVvcamBKBeTcleD81AA/LZrULScF8m9oMHPCVcaxu96UVjrh6CI0v8xBtHd28OC1
	IY/Wl6nODL2qdhCNuIAWUVwq2tZ3XRhSGLsyXk74EG5FyQJcRHEf5f7cwwUxAuJgmV/h6zv5IZc
	Yj1HIo9vIH5yeORr66KwCdagsj7I/4a5LZh446+I07PTmQ==
X-Received: by 2002:a17:903:22c8:b0:224:1ef:1e00 with SMTP id d9443c01a7336-2242888ab4cmr268903435ad.19.1741690967295;
        Tue, 11 Mar 2025 04:02:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElQe14QmLb/YA4RxX7Xfv6ED5NHOblsuRV8M9Glm1MDzl5sQt1xexHeF266ceJ4bgRlzcyUA==
X-Received: by 2002:a17:903:22c8:b0:224:1ef:1e00 with SMTP id d9443c01a7336-2242888ab4cmr268903125ad.19.1741690966912;
        Tue, 11 Mar 2025 04:02:46 -0700 (PDT)
Received: from [10.92.192.202] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a91c37sm94938345ad.163.2025.03.11.04.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 04:02:46 -0700 (PDT)
Message-ID: <69f4c303-bba1-7d68-7701-01820ce8701b@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 16:32:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 3/4] PCI: dwc: Improve handling of PCIe lane
 configuration
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
References: <20250225-preset_v6-v7-0-a593f3ef3951@oss.qualcomm.com>
 <20250225-preset_v6-v7-3-a593f3ef3951@oss.qualcomm.com>
 <20250306034459.uc4qlnsnxijotplo@thinkpad>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250306034459.uc4qlnsnxijotplo@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Tr8chCXh c=1 sm=1 tr=0 ts=67d01858 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=9b1j0kiYQJ7ZwPQ1bTgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: A9lYQf2__eIrXfi1qYDmV1J84S-70zWo
X-Proofpoint-ORIG-GUID: A9lYQf2__eIrXfi1qYDmV1J84S-70zWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110073



On 3/6/2025 9:14 AM, Manivannan Sadhasivam wrote:
> On Tue, Feb 25, 2025 at 05:15:06PM +0530, Krishna Chaitanya Chundru wrote:
>> Currently even if the number of lanes hardware supports is equal to
>> the number lanes provided in the devicetree, the driver is trying to
>> configure again the maximum number of lanes which is not needed.
>>
>> Update number of lanes only when it is not equal to hardware capability.
>>
> 
> 'Update max link width only...'
> 
>> And also if the num-lanes property is not present in the devicetree
>> update the num_lanes with the maximum hardware supports.
> 
> '...update 'pci->num_lanes' with the hardware supported maximum link width using
> the newly introduced dw_pcie_link_get_max_link_width() API.'
> 
>>
>> Introduce dw_pcie_link_get_max_link_width() to get the maximum lane
>> width the hardware supports.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-designware-host.c |  3 +++
>>   drivers/pci/controller/dwc/pcie-designware.c      | 11 ++++++++++-
>>   drivers/pci/controller/dwc/pcie-designware.h      |  1 +
>>   3 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
>> index ffaded8f2df7..dd56cc02f4ef 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>> @@ -504,6 +504,9 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>>   
>>   	dw_pcie_iatu_detect(pci);
>>   
>> +	if (pci->num_lanes < 1)
>> +		pci->num_lanes = dw_pcie_link_get_max_link_width(pci);
>> +
>>   	/*
>>   	 * Allocate the resource for MSG TLP before programming the iATU
>>   	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
>> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
>> index 145e7f579072..9fc5916867b6 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware.c
>> +++ b/drivers/pci/controller/dwc/pcie-designware.c
>> @@ -737,12 +737,21 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci)
>>   
>>   }
>>   
>> +int dw_pcie_link_get_max_link_width(struct dw_pcie *pci)
>> +{
>> +	u8 cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>> +	u32 lnkcap = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCAP);
>> +
>> +	return FIELD_GET(PCI_EXP_LNKCAP_MLW, lnkcap);
>> +}
>> +
>>   static void dw_pcie_link_set_max_link_width(struct dw_pcie *pci, u32 num_lanes)
>>   {
>> +	int max_lanes = dw_pcie_link_get_max_link_width(pci);
>>   	u32 lnkcap, lwsc, plc;
>>   	u8 cap;
>>   
>> -	if (!num_lanes)
>> +	if (max_lanes == num_lanes)
> 
> This gives the assumption that the link width in PCIE_PORT_LINK_CONTROL and
> PCIE_LINK_WIDTH_SPEED_CONTROL registers are same as MLW. Is it really true as
> per the DWC spec?
> 
You are correct both the values are not matching and as we are not sure
side effect of not updating it I will revert this logic.

- Krishna Chaitanya.
> - Mani
> 

