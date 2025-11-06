Return-Path: <linux-arm-msm+bounces-80512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EB5C3920F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 06:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A21BF189AD6A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 05:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9036B1DF99A;
	Thu,  6 Nov 2025 05:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fN2DOnbK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7jN9jgJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE9EBA3F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 05:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762405254; cv=none; b=j6Be6YG+9BWEzdfV2Ab0fV31p0A56NAwG8Nu2uwCGjrKdGe1d1PXC8gmmPqSQPaCUokLIL8X6xSIWIvg/14g7tKQkxvQZYitSHBlT2hYFgx6Clz4Pirh9pmwJ9/5d7B6Xu8RVJcrnIUzv5YnsR4B+IxUssjv4SsguVAC1Ths+K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762405254; c=relaxed/simple;
	bh=XRjGtf1Knh3hgzogzHExgaV4xgq+KvChXNiYIl0g/c4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hzfPf/Pn+QA98sLLl/MOyMP+EOeZuMSbwtKqKwzJ09bwlevrclaUPYpQ4RwJuN0OYr/mifInUNb0ofclAicx8RTm1ZIquOld0K0aupkr6tKR8yKCT4Xfr2t/uYOHXZgJcGCQT8cjDRMQLmtQphy87d1jPwXp/cBNE0jn2oOeKPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fN2DOnbK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7jN9jgJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KFAY11657014
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 05:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VcUQ37bTN6AllIXQSzVCUA/2pHn6xqb/TkBAa8Q0CI=; b=fN2DOnbKlk18IDdZ
	JRzOJqy4w4y6+I+1DfSz5x5TtGgU3/dtCYnYNe/rF35V1R6oOUw4q0c9jGL97io6
	kTwx14la8sv72w7TfflGhSpukAckXn+2muBMWJi9kAMi31KLp6Og6Z7cBv2Tj507
	2MtZPiBZq1CoRt3vZBfG2Kv1csFPA0HXqA4bLJtJozkRDKg38kVNsotjUtdiajmy
	0z4nWe+yUT8qMaEIN7UknmBTU6TVjVoHzR27VlcINCKQYPKIF3/byXr5YaXIHeHZ
	JR4TI9Pc+Uw1KfWmavDNw0AvmtckjXTZcbK+t1a4o/IQzgb4AKF4Yn+uT4emctJc
	RjBgeg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8831ad9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 05:00:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7aa9f595688so82952b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 21:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762405251; x=1763010051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VcUQ37bTN6AllIXQSzVCUA/2pHn6xqb/TkBAa8Q0CI=;
        b=D7jN9jgJKh64hq3oyO7whil7ekreY+mLoOhVydP2hsKVdIxQdvOMnLbb8uUbXh8+b0
         YGtWKwKU6OqiZCzhxQQF03bIZW9iSxd1AclolhwB5y+s/RfCyPMWYnn/6loqGi5iFiPE
         mcKBwVRamn6gUj7iTRtW1lvuIfMV3ejt6LTj85qazP5ZcJBRAOWEmVK4K0a9X/uMTr6H
         DzETnUb2IKaK7MfUqu+3QjZKjoDxtULx+2i/EtLbNUzeUz7uv9SsIbTME/IvveXc2Ujz
         nfzT2kiN4MJw/6iDA4C4BrJJJtqar727C5pMirGlT0SO7S0oyp1kqDYfb9Fynr9Jf0l3
         +JwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762405251; x=1763010051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VcUQ37bTN6AllIXQSzVCUA/2pHn6xqb/TkBAa8Q0CI=;
        b=AegbM64978xO5r67m3apd6AL0S/G0rAdGjYwueo5NP0WxS5qYRpq3Gu1j8bbR4j7Pw
         e1X2ZesGW8nF7/q7/bsgUY7Kd9BuBM5m3mWJ80+HUZW0v7JvWD36Zd+WMlhSQkHzLoYP
         TWc5DSrUeH6l6ZFBl59RMieG5YopXgdVgm3TWATuP/uWE2VH7zw6drS2cMl3cHPd70hF
         ZjS+74G7DRtZkxp/PR1D52gr+b+9sZQd4Ynz30tnFghDa6tMqD6LGNU7Blo7kgp/Ezp3
         MeUpEHxu20Ncp/cZHTyIK2ShdZVYAlmb+6T5FOBeUzGRz37wJOd8IUcyXrbTwlx3iad8
         xrBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPTbwB/p1k/ScxQjBau483lEVzhFaUWMjdZ1RMhW16IGf2kNvKVjeQlVfiPTHdFel96sFmf2+vdzDxTl4w@vger.kernel.org
X-Gm-Message-State: AOJu0YzeE3QD9n5XPUM0cc9QsOq+p8GnZMwbpgXCxl1b4dYuh1yK95EL
	aICEcM1x6PYw6iYTy8/w4R4mOHfOmDCbcRVOooD9sC6Q2HpiXDJxWGtHc9z3+tNhs1pzRd6wj4F
	D+gROp/gB1Rmq9TDfITwWCt0CT3cQ5GvPJUHNizXF4W4pg+Lrg0ZipN4ro5P5P5pxuc4l
X-Gm-Gg: ASbGncvwTsuJM6BsnbV5UH9hfsrsUQG8ePaIpdLFwo2KBYg9jyOTyThluuo3YtHc+yB
	xK70t9NYz/3Vx8gOvPMBOFNdd+mECEB8cGm1ZlZ57LNNKAoaCWA4wcGZ6pcQt7lNBpZV5hDSMGi
	LZk4Y8YMK/+ARJfjJTEfCMDfQbK4ju8VDQNZSKZ4qv5NsiAaKt5KK6Lkyjr0gB7iA2PBLGrBoTx
	EzU7jpJUkK5V4JaA6QtYDANxsI1y7bWOIk+lZKEAZyIrwrwA+wptFOh9YMfKtZiRXogIFChrom5
	rDu975dPyJoic8gWOteHJ6iV1B3gblwMk8pUmtjSPNxG8tAvGYBvr1521LcpxxDeFlDG9Is2lS7
	d79bzMu/o4m6abxZwnWBQkhn+o3ukg8g=
X-Received: by 2002:a05:6a21:3294:b0:341:a18c:dd80 with SMTP id adf61e73a8af0-34f839e02cdmr8281595637.4.1762405251126;
        Wed, 05 Nov 2025 21:00:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoZvD3PSRV3YeZCJj9DTySpLI8Sq4of4sBAy+31LPEveUTKkYFf/liRbgSaGeyzkkY9H6wag==
X-Received: by 2002:a05:6a21:3294:b0:341:a18c:dd80 with SMTP id adf61e73a8af0-34f839e02cdmr8281525637.4.1762405250453;
        Wed, 05 Nov 2025 21:00:50 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d098fdd7sm540915a91.0.2025.11.05.21.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 21:00:50 -0800 (PST)
Message-ID: <e459b4de-52f1-4c20-be84-07efdc9fed93@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 10:30:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Program correct T_POWER_ON value for L1.2 exit
 timing
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com
References: <20251104175657.GA1861670@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20251104175657.GA1861670@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2UGsClXt4L1JWJbuuX5-CHXs2Ko7Ede0
X-Proofpoint-GUID: 2UGsClXt4L1JWJbuuX5-CHXs2Ko7Ede0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAzNyBTYWx0ZWRfX0XvsPqZEkfgu
 ZRZf9v9AakYwuC5BsmpsBhPATo4ZlA3bVNzHOGYgEOT2XqDAZEayiClU378pntii3e44EiMkE92
 JuuKJDgmUzmsoZBQ73sS4fSmxmWFuu4scS4+gK2AP36a77ud1+NCS5Uev+yVbHENVgw7a+NrA94
 w0kGF1MY/FAd/8cGQmDqKLyJd/sMawapUC/yTmtik9VALD+GkQcgadggY3hnB3aNpIg1UVy/r64
 5Gadvgrc47liLaykQ8aTAFGq2M2wAOdYtf9dDyexoi2VcZ0/OsJeoE9hC7M/HotOATjB08PDcfk
 G2FMK+Yk4QqDeC6XhpCC/VJx/+tkmEDK5bUDaCp3Ix9XUmUfaFJePqbII6B8xGeCO73VnGnVz7D
 D2esvk/iAEKMVQQz+kd0EEZuI7j7JA==
X-Authority-Analysis: v=2.4 cv=Mdhhep/f c=1 sm=1 tr=0 ts=690c2b83 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wBt9fhMRhOodALO6grUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060037


On 11/4/2025 11:26 PM, Bjorn Helgaas wrote:
> On Tue, Nov 04, 2025 at 05:42:45PM +0530, Krishna Chaitanya Chundru wrote:
>> The T_POWER_ON indicates the time (in μs) that a Port requires the port
>> on the opposite side of Link to wait in L1.2.Exit after sampling CLKREQ#
>> asserted before actively driving the interface. This value is used by
>> the ASPM driver to compute the LTR_L1.2_THRESHOLD.
>>
>> Currently, the root port exposes a T_POWER_ON value of zero in the L1SS
>> capability registers, leading to incorrect LTR_L1.2_THRESHOLD calculations.
>> This can result in improper L1.2 exit behavior and can trigger AER's.
>>
>> To address this, program the T_POWER_ON value to 80us (scale = 1,
>> value = 8) in the PCI_L1SS_CAP register during host initialization. This
>> ensures that ASPM can take the root port's T_POWER_ON value into account
>> while calculating the LTR_L1.2_THRESHOLD value.
> I think the question is whether the value depends on the circuit
> design of a particular platform (and should therefore come from DT),
> or whether it depends solely on the qcom device.
Yes it depends on design.
> PCIe r7.0, sec 5.5.4, says:
>
>    The T_POWER_ON and Common_Mode_Restore_Time fields must be
>    programmed to the appropriate values based on the components and AC
>    coupling capacitors used in the connection linking the two
>    components. The determination of these values is design
>    implementation specific.
>
> That suggests to me that maybe there should be devicetree properties
> related to these.  Obviously these would not be qcom-specific since
> this is standard PCIe stuff.

Yes Bjorn these are PCIe stuff only, I can go to Device tree route if we 
have different values for each target, as of now we are using this same 
value in all targets as recommended by our HW team. If there is at least 
one more target or one more vendor who needs to program this we can take 
devicetree property route.

I am ok to go with devicetree way also if you insists. - Krishna Chaitanya.

> Use "μs" or "us" consistently; there's a mix above.
>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index c48a20602d7fa4c50056ccf6502d3b5bf0a8287f..52a3412bd2584c8bf5d281fa6a0ed22141ad1989 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -1252,6 +1252,27 @@ static bool qcom_pcie_link_up(struct dw_pcie *pci)
>>   	return val & PCI_EXP_LNKSTA_DLLLA;
>>   }
>>   
>> +static void qcom_pcie_program_t_pwr_on(struct dw_pcie *pci)
>> +{
>> +	u16 offset;
>> +	u32 val;
>> +
>> +	offset = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
>> +	if (offset) {
>> +		dw_pcie_dbi_ro_wr_en(pci);
>> +
>> +		val = readl(pci->dbi_base + offset + PCI_L1SS_CAP);
>> +		/* Program T power ON value to 80us */
>> +		val &= ~(PCI_L1SS_CAP_P_PWR_ON_SCALE | PCI_L1SS_CAP_P_PWR_ON_VALUE);
>> +		val |= FIELD_PREP(PCI_L1SS_CAP_P_PWR_ON_SCALE, 1);
>> +		val |= FIELD_PREP(PCI_L1SS_CAP_P_PWR_ON_VALUE, 8);
>> +
>> +		writel(val, pci->dbi_base + offset + PCI_L1SS_CAP);
>> +
>> +		dw_pcie_dbi_ro_wr_dis(pci);
>> +	}
>> +}
>> +
>>   static void qcom_pcie_phy_power_off(struct qcom_pcie *pcie)
>>   {
>>   	struct qcom_pcie_port *port;
>> @@ -1302,6 +1323,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>>   			goto err_disable_phy;
>>   	}
>>   
>> +	qcom_pcie_program_t_pwr_on(pci);
>> +
>>   	qcom_ep_reset_deassert(pcie);
>>   
>>   	if (pcie->cfg->ops->config_sid) {
>>
>> ---
>> base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
>> change-id: 20251104-t_power_on_fux-70dc68377941
>>
>> Best regards,
>> -- 
>> Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>

