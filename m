Return-Path: <linux-arm-msm+bounces-54546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E021A90A7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 19:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E635C1906DCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 17:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFAA217671;
	Wed, 16 Apr 2025 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMofM81g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C41214A7C
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 17:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744825922; cv=none; b=rxNN2+F2ptYt7UbWEFrU1V6zipo19OuBLK/8AozsTFz5NNzyfjpvfCAI9ltSuGfOU075Nfb301jb6US7/WT0TIhASxiu/6DTtZCuBuh7lIWrCOZdHm9sZuANR2sk/d+Qr7ybjJp4+CMhrBF3Z1R17J0SRetKBOdriI989kNVNAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744825922; c=relaxed/simple;
	bh=FHF80+TAaiF3iXQUxEhvh6JTEbHMB0yRy4mrUUlFBqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NeluGiIjNiAiNkCg3IkG+V8hz1GWo8vZzYoReQT9sPjxPCKMWRdifZyHpddjwGpeu6nfSBtM9Npvmq5Fd4tOf0cL8d60/DfxOZ3slzTwH18tGR+qbIuvMYbwMrfGLfq0ZtaIcTOVdpRgzWg0WBEPIZdUUGra4NvQ4JXzp+1Wy7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMofM81g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mDQu020539
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 17:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5pmctK1Tr+I/l712rxqAECJA15ahdHQ8zwALeKKjYY=; b=cMofM81gdD+S3Y9Z
	SfmcXozq7mfib5IEJxf9+KeW+HA2EVsPubKzLJ8LjysfDwjUhnKHFnTQni1ff5m1
	YgrBFmYX7YkWHXgq7BdYz3G7dGUM952jjf32Rf6MgJ621C1cpa3GRQ9FskHsvYK9
	oevWWjA7nFWYpDPwx/b2WlZlv7Jb0aUcVbv012qvEj50cEodJ7F1JbyhcoyHElOH
	ZkDFTyIV0eE5uergsHmE5xGCSyyNSQ/gRWLy7c+ziIYgPvk0rr4bNyODfZxRz3fm
	BghhPqdwm29VlaXk+kkWA3hFvQiampjHNZdxRoDmFsER6GKGXBa+MVl6unsG3OyS
	jPM7bw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wmcr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 17:51:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2241e7e3addso61618635ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 10:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744825917; x=1745430717;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V5pmctK1Tr+I/l712rxqAECJA15ahdHQ8zwALeKKjYY=;
        b=SzT9UGkndWN+lIFlGVAjn7tPed7nE2i+HSMgjBuAzarodEUC101HwNttlER84bFxtc
         MFTMNqdQczRnbZwrXNNfy35wd8lx2h3pn5bdJInR3MM9zhNgHkO05pyfHvpFJyLCahTQ
         EWqwZ0PHvrnSoYH7xe8AkoE/n+QmCAu1ESC8r8h2iB+k+Nghlezkd45BsIimnajYgCjr
         6Cp5PFDK8Hw6lyhFM20AvphIXc6NLE3LNAEZOZZQz8u9KPT5xN5aGGSaclfdrX/LUg8v
         I8WrSav5ydwsm46tJOsal2pSIsbg5ZidX/uTNyaqSlY854wL/j516spYDS3k/ctGpHsA
         epfA==
X-Forwarded-Encrypted: i=1; AJvYcCXJgpE19cnvAnf0+th2nvjorocFPyzvN/oXUQoUfdIVcQQ/KXqKHxI7G44utmsvKS4QVMxgoec5VZlYJiFe@vger.kernel.org
X-Gm-Message-State: AOJu0YyTjC/AtEzZegkqoGG8feFbceRTlV49EGN0O6EkRlu93e5iAKFR
	Bw/x42kmxw7iXQt3rYzhnmbM6p9vA6f2qNNrZD/H4be18krjiDUbJ+uCG5uZpj/G8mCyF3HAvBS
	0HuTbk2PupEDGQzxqLDn/MMSgQEfkB/lYlkNrNtefFKsqi/FHgTrpydpxOnrohHIq
X-Gm-Gg: ASbGncsGP7ftSV5TxQRL7QIP5rZ2g/+jdfWCF8efma9CGh4ybTE0brgebYeMW9t5Onn
	s7/HOIbSNrYbXKzWkflfV1cbWln3USseCPsw5aGETHdGX2RaPiZ9Jn1nBCq4ZicX+c1K1Xzt0xu
	VtMbz+hGHuSiufG0rRrBAObPU4DNaLRFeAQEMY57y1KkfxCPwI0Zq7vhpKo8NojUFhxGpmJIZmH
	bsjOtX0vI3hzvemTejCz+i5E/sbln3z9jAh+SwgOUCeCxkj/ZaEiLv9L0Iz2ffZlVoH7aTkBcqf
	2zEdTjnX3hWWeBWrz58UrLymhVDnyqFR7vf6WAvUbiA=
X-Received: by 2002:a17:902:e806:b0:223:5e6a:57ab with SMTP id d9443c01a7336-22c3597ee39mr40894945ad.39.1744825917067;
        Wed, 16 Apr 2025 10:51:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBBh895n5PHGGk4xFwNiJSEFm0TRS2bV+6pyeHxlVKUwuhtV4iIkGq6YnLmD4RRZx0r4AhgA==
X-Received: by 2002:a17:902:e806:b0:223:5e6a:57ab with SMTP id d9443c01a7336-22c3597ee39mr40894435ad.39.1744825916570;
        Wed, 16 Apr 2025 10:51:56 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.231.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcc816sm17235435ad.206.2025.04.16.10.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 10:51:56 -0700 (PDT)
Message-ID: <26b70e1b-861f-4c94-47a7-a267c41cadbb@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 23:21:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/4] PCI: Add link down handling for host bridges
Content-Language: en-US
To: manivannan.sadhasivam@linaro.org,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
        linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
 <20250416-pcie-reset-slot-v2-3-efe76b278c10@linaro.org>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250416-pcie-reset-slot-v2-3-efe76b278c10@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67ffee3e cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ozAjUsZc/ya1UnB0O6+iCQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=WP6hIalcOMfy4p2eL3AA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BqELhp-AEAlFyUnHRuX0oSAYscsSJlx5
X-Proofpoint-GUID: BqELhp-AEAlFyUnHRuX0oSAYscsSJlx5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160146



On 4/16/2025 9:59 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> The PCI link, when down, needs to be recovered to bring it back. But that
> cannot be done in a generic way as link recovery procedure is specific to
> host bridges. So add a new API pci_host_handle_link_down() that could be
> called by the host bridge drivers when the link goes down.
> 
> The API will iterate through all the slots and calls the pcie_do_recovery()
> function with 'pci_channel_io_frozen' as the state. This will result in the
> execution of the AER Fatal error handling code. Since the link down
> recovery is pretty much the same as AER Fatal error handling,
> pcie_do_recovery() helper is reused here. First the AER error_detected
> callback will be triggered for the bridge and the downstream devices. Then,
> pcie_do_slot_reset() will be called for each slots, which will reset the
> slots using 'reset_slot' callback to recover the link. Once that's done,
> resume message will be broadcasted to the bridge and the downstream devices
> indicating successful link recovery.
> 
> In case if the AER support is not enabled in the kernel, only
> pci_bus_error_reset() will be called for each slots as there is no way we
> could inform the drivers about link recovery.
> 
The PCIe endpoint drivers are registering with err_handlers and they
will be invoked only from pcie_do_recovery, but there are getting built
by default irrespective of AER is enabled or not.

Does it make sense to built err.c irrespective of AER is enabled or not
to use common logic without the need of having dependency on AER.

Also since err.c is tied with AER, DPC also had a hard requirement
to enable AER which is not needed technically.

- Krishna Chaitanya.
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/pci/pci.h      | 21 +++++++++++++++++++++
>   drivers/pci/pcie/err.c | 27 +++++++++++++++++++++++++++
>   drivers/pci/probe.c    |  7 +++++++
>   include/linux/pci.h    |  1 +
>   4 files changed, 56 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index b81e99cd4b62a3022c8b07a09f212f6888674487..6c1d4c5a82d68e5842636ff296a8d3a06487cb11 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -966,6 +966,7 @@ int pci_aer_clear_status(struct pci_dev *dev);
>   int pci_aer_raw_clear_status(struct pci_dev *dev);
>   void pci_save_aer_state(struct pci_dev *dev);
>   void pci_restore_aer_state(struct pci_dev *dev);
> +void pcie_do_recover_slots(struct pci_host_bridge *host);
>   #else
>   static inline void pci_no_aer(void) { }
>   static inline void pci_aer_init(struct pci_dev *d) { }
> @@ -975,6 +976,26 @@ static inline int pci_aer_clear_status(struct pci_dev *dev) { return -EINVAL; }
>   static inline int pci_aer_raw_clear_status(struct pci_dev *dev) { return -EINVAL; }
>   static inline void pci_save_aer_state(struct pci_dev *dev) { }
>   static inline void pci_restore_aer_state(struct pci_dev *dev) { }
> +static inline void pcie_do_recover_slots(struct pci_host_bridge *host)
> +{
> +	struct pci_bus *bus = host->bus;
> +	struct pci_dev *dev;
> +	int ret;
> +
> +	if (!host->reset_slot)
> +		dev_warn(&host->dev, "Missing reset_slot() callback\n");
> +
> +	for_each_pci_bridge(dev, bus) {
> +		if (!pci_is_root_bus(bus))
> +			continue;
> +
> +		ret = pci_bus_error_reset(dev);
> +		if (ret)
> +			pci_err(dev, "Failed to reset slot: %d\n", ret);
> +		else
> +			pci_info(dev, "Slot has been reset\n");
> +	}
> +}
>   #endif
>   
>   #ifdef CONFIG_ACPI
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index b834fc0d705938540d3d7d3d8739770c09fe7cf1..70d8cd37255c5638fddf38e13ea87cb8ebe8553f 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -270,3 +270,30 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   
>   	return status;
>   }
> +
> +static pci_ers_result_t pcie_do_slot_reset(struct pci_dev *dev)
> +{
> +	int ret;
> +
> +	ret = pci_bus_error_reset(dev);
> +	if (ret) {
> +		pci_err(dev, "Failed to reset slot: %d\n", ret);
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
> +	pci_info(dev, "Slot has been reset\n");
> +
> +	return PCI_ERS_RESULT_RECOVERED;
> +}
> +
> +void pcie_do_recover_slots(struct pci_host_bridge *host)
> +{
> +	struct pci_bus *bus = host->bus;
> +	struct pci_dev *dev;
> +
> +	for_each_pci_bridge(dev, bus) {
> +		if (pci_is_root_bus(bus))
> +			pcie_do_recovery(dev, pci_channel_io_frozen,
> +					 pcie_do_slot_reset);
> +	}
> +}
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 364fa2a514f8a68fb18bded3259c6847d3932f8b..60ad20eea0259797e68afa7979bb1fc24b6f213b 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -3249,6 +3249,13 @@ int pci_host_probe(struct pci_host_bridge *bridge)
>   }
>   EXPORT_SYMBOL_GPL(pci_host_probe);
>   
> +void pci_host_handle_link_down(struct pci_host_bridge *bridge)
> +{
> +	dev_info(&bridge->dev, "Recovering slots due to Link Down\n");
> +	pcie_do_recover_slots(bridge);
> +}
> +EXPORT_SYMBOL_GPL(pci_host_handle_link_down);
> +
>   int pci_bus_insert_busn_res(struct pci_bus *b, int bus, int bus_max)
>   {
>   	struct resource *res = &b->busn_res;
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 8d7d2a49b76cf64b4218b179cec495e0d69ddf6f..76e977af2d524200b67f39a6d0417ee565cf5116 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1157,6 +1157,7 @@ struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
>   				    struct pci_ops *ops, void *sysdata,
>   				    struct list_head *resources);
>   int pci_host_probe(struct pci_host_bridge *bridge);
> +void pci_host_handle_link_down(struct pci_host_bridge *bridge);
>   int pci_bus_insert_busn_res(struct pci_bus *b, int bus, int busmax);
>   int pci_bus_update_busn_res_end(struct pci_bus *b, int busmax);
>   void pci_bus_release_busn_res(struct pci_bus *b);
> 

