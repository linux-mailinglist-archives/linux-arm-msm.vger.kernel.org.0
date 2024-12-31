Return-Path: <linux-arm-msm+bounces-43699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C3B9FECDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 05:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D24EB1882F4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 04:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8522816C684;
	Tue, 31 Dec 2024 04:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAUX3s7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C20014B942
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 04:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735620479; cv=none; b=p5i+Wywt+JzWDotB9fislx8GSo76U4b6/u+Xfmw4tWDMqy2v6YeccbAXKDEQLrOqK/sfTz84QbFdwfesI9xhCLOChmV889Ne1XeoqC+6cJxmqywdew75HTm2lwDMrZ+XqP82H9j1/JM6aN+nTOamFv28rttRY+DEKyD9jNLBlpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735620479; c=relaxed/simple;
	bh=UpH7lfEEkfF8NKFKKgvKrQxfQlrAYZpimtTRVKfmnzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcvbrjZOlk7wvi8bTyfkf6oo74ie7f2etisSeekp0QAOG2autptuvA3QrqEfTb2rgj62lH5VbxnxgONDn8zgGt72Lwx3M4Hk4X3nC+d0LwVb1flC4heGryUU6eYaruKau09ny6Bn3qsRdEK+qP3e2gHNBlRDfO8LL4PvMte8ueM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAUX3s7v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV0gm6E024095
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 04:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZKqfrwjFddNEtBKNkH5xy3hzGi3JwSNPhz3E+7WNCHY=; b=YAUX3s7vU2NqdxH9
	cdB4d87vWLTk/pQgj40W9kFbOwSYnXOPrB/XGOdHdQSIUU7WnU6G+zLZa7ihI4hr
	Z/mLTB5pH0h3Wgq3OGIGkBpcr5JYrclVzSYBMHe3bvwcpAdhVNsIRW6EtQMr7wk5
	GmL8EEDlaGcIe9yEhtIZR97ZtZG63/rxPVXGqVlNuheaSR2JUqFjNejcdpQyUAXW
	rgF61zO2YA3INdsJGy28czhmUzxjanTnVl9667E9JhDXTizFLScQU7Jf1EhsK3Qy
	EbzYvILSsLUKwwc9Y9Ae9OkzpH+TU+QYUoY2ezU99IZWGufHtlXKAQvQpWiyCc44
	QsJEKg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v6af0cxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 04:47:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21640607349so183534645ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 20:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735620474; x=1736225274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKqfrwjFddNEtBKNkH5xy3hzGi3JwSNPhz3E+7WNCHY=;
        b=c5yDyiDz7RxC1MHRNGFJ2Qa5xlMhx+yr6aArf1zagT/Zib6iVPNTRlirVA1C6YucqK
         1P8fWuDhB+wHy36yXP3vmonHlfPgyPPhRfn/t4hETWlPahItxDA+wZ/sGTlXHSAxnOhv
         DcfcPR2YhdbRLumjyhisv4B6JdXEeBHq6rPAOnGTbctMfLAe430/rX20Vu8up4Zt2Fol
         fm2Xeoan0OLA6wUdNZUY2khpbWQb/pnEWzPIlU2F1UWPVUc/LG3LqJpZjsi+V0ICJJSM
         WHXFsdIzVB1jA0sKHA76GbOXph//7vzhh+VrtexBv5PxrqSY9r3ApFIU3rgUz5rMi+Zj
         kROA==
X-Gm-Message-State: AOJu0YyN4YuuynJCa4TyqFugs86U7+mJWm3fscq6I2s5lMqPtiHTJfk9
	Fwcbdm+oJfHCxLfaxf/sNImi+P+w6aXW5fgKH2iSpvoJSVUeOibfUkeJFih/2nnSD520S9km/n0
	SlIFnf/YSG4P7dSEhbClpQWAZfzn+b2Utt1fZNtwRJdkWlajh21pnVqDB1b57YvRs
X-Gm-Gg: ASbGncsImrli+ZmMiYIIt+L7YipPq1a7CsSfJUucVvs+mV5/dOhkUy4pVommRWiT4u8
	zUjWOa6EeDGujzBB8up0XK2J/aQM8XlbcZbWpGpISCSndTN2O7FOmGilPtE4SNKcoufK86I3GPR
	TL6BYI+25mnhcPNOnmYSnKEQum1VBaq8mI9SuYsb4JbdfC5f9NpgrUBy22BQEWeDhbeUsHOSlRE
	OptudxS4kpLyT9y1UHxa+KIu1doUzdpoMZCoyfSUbxRtz5oiNmw3QVsTq16DfaACAR0zVFSJAUd
	Sv3QZn5OeBI=
X-Received: by 2002:a17:902:c943:b0:216:2e5e:96ff with SMTP id d9443c01a7336-219e6cd7bc3mr637512055ad.0.1735620473934;
        Mon, 30 Dec 2024 20:47:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfnXVELaWhLUrVfPNUy3g+GH/Lxzp3x2ulb0cHgWBczGzXYRn3hC7nFJP3anYXCMh564ZqtA==
X-Received: by 2002:a17:902:c943:b0:216:2e5e:96ff with SMTP id d9443c01a7336-219e6cd7bc3mr637511645ad.0.1735620473541;
        Mon, 30 Dec 2024 20:47:53 -0800 (PST)
Received: from [10.92.200.237] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6c17sm186615175ad.221.2024.12.30.20.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 20:47:53 -0800 (PST)
Message-ID: <2684f4b3-b79d-14a2-c547-8b1f7000737c@oss.qualcomm.com>
Date: Tue, 31 Dec 2024 10:17:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/4] PCI: dwc: Add ECAM support with iATU configuration
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com, mmareddy@quicinc.com,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
References: <20241224-enable_ecam-v2-0-43daef68a901@oss.qualcomm.com>
 <20241224-enable_ecam-v2-2-43daef68a901@oss.qualcomm.com>
 <12fb6164-fa53-46e7-9a22-bb9b373f9860@oss.qualcomm.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <12fb6164-fa53-46e7-9a22-bb9b373f9860@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r_EFX85e5AaW9QI5-klSS5gc8WmcN19W
X-Proofpoint-GUID: r_EFX85e5AaW9QI5-klSS5gc8WmcN19W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412310038


On 12/30/2024 8:34 PM, Konrad Dybcio wrote:
> On 24.12.2024 3:10 PM, Krishna Chaitanya Chundru wrote:
>> From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
>>
>> The current implementation requires iATU for every configuration
>> space access which increases latency & cpu utilization.
>>
>> Designware databook 5.20a, section 3.10.10.3 says about CFG Shift Feature,
>> which shifts/maps the BDF (bits [31:16] of the third header DWORD, which
>> would be matched against the Base and Limit addresses) of the incoming
>> CfgRd0/CfgWr0 down to bits[27:12]of the translated address.
>>
>> Configuring iATU in config shift feature enables ECAM feature to access the
>> config space, which avoids iATU configuration for every config access.
>>
>> Add "ctrl2" into struct dw_pcie_ob_atu_cfg  to enable config shift feature.
>>
>> As DBI comes under config space, this avoids remapping of DBI space
>> separately. Instead, it uses the mapped config space address returned from
>> ECAM initialization. Change the order of dw_pcie_get_resources() execution
>> to achieve this.
>>
>> Enable the ECAM feature if the config space size is equal to size required
>> to represent number of buses in the bus range property, add a function
>> which checks this. The DWC glue drivers uses this function and decide to
>> enable ECAM mode or not.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/Kconfig                |   1 +
>>   drivers/pci/controller/dwc/pcie-designware-host.c | 136 +++++++++++++++++++---
>>   drivers/pci/controller/dwc/pcie-designware.c      |   2 +-
>>   drivers/pci/controller/dwc/pcie-designware.h      |  11 ++
>>   4 files changed, 130 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
>> index b6d6778b0698..73c3aed6b60a 100644
>> --- a/drivers/pci/controller/dwc/Kconfig
>> +++ b/drivers/pci/controller/dwc/Kconfig
>> @@ -9,6 +9,7 @@ config PCIE_DW
>>   config PCIE_DW_HOST
>>   	bool
>>   	select PCIE_DW
>> +	select PCI_HOST_COMMON
>>   
>>   config PCIE_DW_EP
>>   	bool
>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
>> index d2291c3ceb8b..4e07fefe12e1 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>> @@ -418,6 +418,61 @@ static void dw_pcie_host_request_msg_tlp_res(struct dw_pcie_rp *pp)
>>   	}
>>   }
>>   
>> +static int dw_pcie_config_ecam_iatu(struct dw_pcie_rp *pp)
>> +{
>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>> +	struct dw_pcie_ob_atu_cfg atu = {0};
>> +	struct resource_entry *bus;
>> +	int ret, bus_range_max;
> resource_size_t for bus_range_max since you feed it the ouput of
> resource_size()
>
>> +
>> +	bus = resource_list_first_type(&pp->bridge->windows, IORESOURCE_BUS);
>> +
>> +	/*
>> +	 * Root bus under the root port doesn't require any iATU configuration
>> +	 * as DBI space will represent Root bus configuration space.
>> +	 * Immediate bus under Root Bus, needs type 0 iATU configuration and
>> +	 * remaining buses need type 1 iATU configuration.
>> +	 */
>> +	atu.index = 0;
>> +	atu.type = PCIE_ATU_TYPE_CFG0;
>> +	atu.cpu_addr = pp->cfg0_base + SZ_1M;
>> +	atu.size = SZ_1M;
>> +	atu.ctrl2 = PCIE_ATU_CFG_SHIFT_MODE_ENABLE;
>> +	ret = dw_pcie_prog_outbound_atu(pci, &atu);
>> +	if (ret)
>> +		return ret;
>> +
>> +	bus_range_max = resource_size(bus->res);
>> +
>> +	/* Configure remaining buses in type 1 iATU configuration */
>> +	atu.index = 1;
>> +	atu.type = PCIE_ATU_TYPE_CFG1;
>> +	atu.cpu_addr = pp->cfg0_base + SZ_2M;
>> +	atu.size = (SZ_1M * (bus_range_max - 2));
> This explodes badly with:
>
> bus-range = <0 0>;

The bus range = <0 0> is not a valid configuration but with bus-range = 
<0 1> it will

be a issue I will update the logic next series, thanks for pointing it out.

- Krishna Chaitanya.

>
>> +	atu.ctrl2 = PCIE_ATU_CFG_SHIFT_MODE_ENABLE;
>> +	return dw_pcie_prog_outbound_atu(pci, &atu);
> A newline before the return statement would make it prettier
>
> [...]
>
>> +bool dw_pcie_ecam_supported(struct dw_pcie_rp *pp)
>> +{
>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>> +	struct platform_device *pdev = to_platform_device(pci->dev);
>> +	struct resource *config_res, *bus_range;
>> +	u64 bus_config_space_count;
>> +
>> +	bus_range = resource_list_first_type(&pp->bridge->windows, IORESOURCE_BUS)->res;
>> +	if (!bus_range)
>> +		return false;
>> +
>> +	config_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "config");
>> +	if (!config_res)
>> +		return false;
>> +
>> +	bus_config_space_count = resource_size(config_res) >> PCIE_ECAM_BUS_SHIFT;
>> +	if (resource_size(bus_range) > bus_config_space_count)
>> +		return false;
>> +
>> +	return true;
> return bus_config_space_count <= resource_size(bus_range);
>
> Konrad

