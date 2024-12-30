Return-Path: <linux-arm-msm+bounces-43655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C7F9FE766
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 16:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D85B21627BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 15:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DB71A83E9;
	Mon, 30 Dec 2024 15:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpB6tEpq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48EC149C55
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735571055; cv=none; b=KE+4jxY67YGTLAiyyW5O3AusLaAR81zHHInQwxi4R891lAlvegeKWLag8WWNo80Po3OR8UfSd5c0Ld0s/ajh4a5rwhxtKkjyqxBfBDFuXoZAREPQ7/9Wkz1UvjjgIrodgZHVywRhQ5NMFKMr0rnkswMqfgq+jyLQcHyUcoCXqiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735571055; c=relaxed/simple;
	bh=XD35P6k4H4YdSMUIGKnYdsnRKZ9J6Njp6z7u88h3q4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c4bEXbQyA9l0avSG6fTAFgebHNp4VLTQkxoSYwkZ53swsc1EMYm/Z9MXveMgrfgtpHNXqzf5vPjyvBpst6Vytn34DF+mhkwGWcTHvPaNlKHTdldp/3lBtcneHchpaD+/zLBIpZj75bV00wji4YSURs/Rdz8xS+ifaccTAzDl7po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpB6tEpq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUF1SYY031574
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyyKYsl7DFCLsbwMpwlajhYJ1z5ldXz7DIn7vZjoBGw=; b=EpB6tEpqABanlW7O
	d5cKFrfM7UPJP2z7aAEFJgpK4EZAXF9u3T6IokxxZtRfCu0hC0boahNjhPzUGr+v
	8sYucaWxil/SH6pFOiQru9VETPornlvdCR6THondlxj4BjoZ/fo307JKv3omjSRD
	djtq9Ft95Kg537zzQlUsu/ZsuNURSWbiPSh+C8PZh8PJ2eBJROrvtrXH8QGNreVF
	CMs2vgQj3OZxH2G82MITkFcPNVeiyIAJKyVW6w8lG1tWtUC5lQJMH3B8xpxxHgvk
	EfFPUsJ015d/KdigOeYV9AUoIQPeMH9kgsMCm9tFe13Ttm5IoLYfDOyNGEIgVPS8
	E2kchg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uwt08083-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:04:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6ea8fc9acso96024285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 07:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735571050; x=1736175850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JyyKYsl7DFCLsbwMpwlajhYJ1z5ldXz7DIn7vZjoBGw=;
        b=Lxe+oWFak7Vk0VD5B1TV0RmFuY5Az45DpdvZwRPpOZ9aNcDEZkm8NaG1vdlVGxR+CW
         uhMako1vDGiYjXny1kV99oPCEDx2N9rR4qaIxtT+hZFAuhSyPVPHKNOid5U2DarX25lM
         Ve27uff8KeUTyeK9AOb3cAt1h6ofSjKQ+OyGj1ZouNjHWxOCp84R7PLifbhqWkAq2alA
         5XMaICCzefYGH0xEy3srn9ZihwzktgkBEQhZ3AjPox01/L4D3QpraOYrvy0jgMwZs980
         7njdEdW6iV2lmFfe2nyuqLbLAycfdh+zaUHR9LkmABO5DlOVRDWdFtVENWe4GSQOhuJL
         Sc+w==
X-Gm-Message-State: AOJu0YwZn57XEjo9opTNEMVASRUTZDumuikKJEB7sUE/hCLeWAHKUmhS
	TmtD7LNX0R1XOAE+e7TNY/6s3wOX5sEjNp9Zt9KJGlXJ6Ctgo0gOPVnMi5ZxD4m22bfatPRO4lu
	RalA6EKDYc6WsyAFvu+YRuDU26Eoqr35mA85ik+GVu6ldu3lRbh2crQE9cswfyUQu
X-Gm-Gg: ASbGncudVxmjVLY+SGw+jHSbWWqgBATT6QpDlPpthSu6a0gwXpOcvJvdY9OzrcAKd9n
	XArtMjl4Qk4PY0rgcQmN3t8FzpGEMJ+QFdD+AWzCdPJ18FHch8lAJdiQ9UL1miz9izG2Rm0zhJ/
	63WOL/wmRvlLQulZs6zdGorzwSj7EkDYWGAqHWURiVMQ4PUT0vb1R0frLM8GDX/lhJT+BulPVRP
	LKeUg2Zl+nKFxNi/sOFdzbx1XVit9vcBXNeF7/YmpBP1CtA3WICFxnwWkKCCiJ3RWWd/olXPXOq
	WuU4rIBxqpRJcX3SIajO5ic4DhM7Qvmzv5Q=
X-Received: by 2002:a05:620a:4096:b0:7b6:dae0:3eae with SMTP id af79cd13be357-7b9ba73a951mr1886675285a.6.1735571050291;
        Mon, 30 Dec 2024 07:04:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcq1jtuz/dIKh/1mtUNEnjT3/KVCp8sEhK2kgpaguEjtZFZkJbdzNhJrjAHHxyh6zu+viIkA==
X-Received: by 2002:a05:620a:4096:b0:7b6:dae0:3eae with SMTP id af79cd13be357-7b9ba73a951mr1886673085a.6.1735571049950;
        Mon, 30 Dec 2024 07:04:09 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f23bsm15251674a12.32.2024.12.30.07.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 07:04:09 -0800 (PST)
Message-ID: <12fb6164-fa53-46e7-9a22-bb9b373f9860@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 16:04:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] PCI: dwc: Add ECAM support with iATU configuration
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com, mmareddy@quicinc.com,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
References: <20241224-enable_ecam-v2-0-43daef68a901@oss.qualcomm.com>
 <20241224-enable_ecam-v2-2-43daef68a901@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241224-enable_ecam-v2-2-43daef68a901@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6rhyp_4iIwXXAa2lUs-WGqxxDSrLWYBn
X-Proofpoint-GUID: 6rhyp_4iIwXXAa2lUs-WGqxxDSrLWYBn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300130

On 24.12.2024 3:10 PM, Krishna Chaitanya Chundru wrote:
> From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> 
> The current implementation requires iATU for every configuration
> space access which increases latency & cpu utilization.
> 
> Designware databook 5.20a, section 3.10.10.3 says about CFG Shift Feature,
> which shifts/maps the BDF (bits [31:16] of the third header DWORD, which
> would be matched against the Base and Limit addresses) of the incoming
> CfgRd0/CfgWr0 down to bits[27:12]of the translated address.
> 
> Configuring iATU in config shift feature enables ECAM feature to access the
> config space, which avoids iATU configuration for every config access.
> 
> Add "ctrl2" into struct dw_pcie_ob_atu_cfg  to enable config shift feature.
> 
> As DBI comes under config space, this avoids remapping of DBI space
> separately. Instead, it uses the mapped config space address returned from
> ECAM initialization. Change the order of dw_pcie_get_resources() execution
> to achieve this.
> 
> Enable the ECAM feature if the config space size is equal to size required
> to represent number of buses in the bus range property, add a function
> which checks this. The DWC glue drivers uses this function and decide to
> enable ECAM mode or not.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/Kconfig                |   1 +
>  drivers/pci/controller/dwc/pcie-designware-host.c | 136 +++++++++++++++++++---
>  drivers/pci/controller/dwc/pcie-designware.c      |   2 +-
>  drivers/pci/controller/dwc/pcie-designware.h      |  11 ++
>  4 files changed, 130 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index b6d6778b0698..73c3aed6b60a 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -9,6 +9,7 @@ config PCIE_DW
>  config PCIE_DW_HOST
>  	bool
>  	select PCIE_DW
> +	select PCI_HOST_COMMON
>  
>  config PCIE_DW_EP
>  	bool
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index d2291c3ceb8b..4e07fefe12e1 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -418,6 +418,61 @@ static void dw_pcie_host_request_msg_tlp_res(struct dw_pcie_rp *pp)
>  	}
>  }
>  
> +static int dw_pcie_config_ecam_iatu(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct dw_pcie_ob_atu_cfg atu = {0};
> +	struct resource_entry *bus;
> +	int ret, bus_range_max;

resource_size_t for bus_range_max since you feed it the ouput of
resource_size()

> +
> +	bus = resource_list_first_type(&pp->bridge->windows, IORESOURCE_BUS);
> +
> +	/*
> +	 * Root bus under the root port doesn't require any iATU configuration
> +	 * as DBI space will represent Root bus configuration space.
> +	 * Immediate bus under Root Bus, needs type 0 iATU configuration and
> +	 * remaining buses need type 1 iATU configuration.
> +	 */
> +	atu.index = 0;
> +	atu.type = PCIE_ATU_TYPE_CFG0;
> +	atu.cpu_addr = pp->cfg0_base + SZ_1M;
> +	atu.size = SZ_1M;
> +	atu.ctrl2 = PCIE_ATU_CFG_SHIFT_MODE_ENABLE;
> +	ret = dw_pcie_prog_outbound_atu(pci, &atu);
> +	if (ret)
> +		return ret;
> +
> +	bus_range_max = resource_size(bus->res);
> +
> +	/* Configure remaining buses in type 1 iATU configuration */
> +	atu.index = 1;
> +	atu.type = PCIE_ATU_TYPE_CFG1;
> +	atu.cpu_addr = pp->cfg0_base + SZ_2M;
> +	atu.size = (SZ_1M * (bus_range_max - 2));

This explodes badly with:

bus-range = <0 0>;


> +	atu.ctrl2 = PCIE_ATU_CFG_SHIFT_MODE_ENABLE;
> +	return dw_pcie_prog_outbound_atu(pci, &atu);

A newline before the return statement would make it prettier

[...]

> +bool dw_pcie_ecam_supported(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct platform_device *pdev = to_platform_device(pci->dev);
> +	struct resource *config_res, *bus_range;
> +	u64 bus_config_space_count;
> +
> +	bus_range = resource_list_first_type(&pp->bridge->windows, IORESOURCE_BUS)->res;
> +	if (!bus_range)
> +		return false;
> +
> +	config_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "config");
> +	if (!config_res)
> +		return false;
> +
> +	bus_config_space_count = resource_size(config_res) >> PCIE_ECAM_BUS_SHIFT;
> +	if (resource_size(bus_range) > bus_config_space_count)
> +		return false;
> +
> +	return true;

return bus_config_space_count <= resource_size(bus_range);

Konrad

