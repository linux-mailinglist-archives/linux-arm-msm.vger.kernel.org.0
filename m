Return-Path: <linux-arm-msm+bounces-28721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA24954017
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 05:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 389781C21380
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 03:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D7C482CD;
	Fri, 16 Aug 2024 03:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WwQ7sfOE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF946F2E0;
	Fri, 16 Aug 2024 03:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723779763; cv=none; b=B5k70sQCoGDpIFP6Sb965Mzwuh79qnR3cgIKb00M0kTJ8Pf+KFavrmmQYnO5wXM2KT3JDiOYaDhuWwQ7Bu5ahnIGoJDVZpftgIarcPnAhEEIuuE6xaLmQ1AGf09jDRv3nFRHSQH+CH6/wHnmjd/t/c7JtHTCNeoaQFwOyLRiMv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723779763; c=relaxed/simple;
	bh=WZ1OK58Hx+R2DQvNl64uL0au7gftJRQb0jKZcwS8v18=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lFvBHUjvgutgMWwc2sZ8mRpEaScdmNIexwpc5dzBYCpGsMWOvZ+BeDkdo3ybJZed0Spn3KClXYe8UAlUIn0j/59YP/vg4gLADgARtXzdLv9FwEiCX0NFL6QuHv1mzkiQkj9YTtPJ+u8seBGuQdBF0hHg2CfTQb+f5IsmclIyGJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WwQ7sfOE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FKbxAq017861;
	Fri, 16 Aug 2024 03:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1/jkkrKCkMtArS0AjJ2tj3NvDCJus6VEJpFXSU7sYo=; b=WwQ7sfOEfY4Efvmx
	qGyoCJfCy1vWShJ9/MJz5+asDpm/pUrPzwfcCNPZ06rSoSo/zPmpU5m6SnZAWVpd
	QFp5upHZofUWaNZK1k51Nc9EW4cxZ7MUI5G4+BIiZvapM8jDxRqT1O68lk9w5Pwj
	JqpJCWtPurG+HHUkwjMVlWMB6VYMf90DEjTYs6UNYCz2yp1kEnjM34RHcN4hfm/f
	y78uSq9em3pBHe2PiJfnUb9/uUA9XII3DSTYZh73GHQJHR8LfQ/OFZr6ItYBnX6r
	XjX0FXfU22oSGoKnFl+vc/5HASWryxFIBcTOx+lwN6bueCyFFz37zCs0LDsr0QVd
	JLyhXg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 411rvr8n7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 03:42:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G3g2qQ027108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 03:42:02 GMT
Received: from [10.216.10.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 Aug
 2024 20:41:56 -0700
Message-ID: <f9492c14-b07f-43d1-6f78-a895f2d8a2d9@quicinc.com>
Date: Fri, 16 Aug 2024 09:11:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] perf/dwc_pcie: Fix registration issue in multi PCIe
 controller instances
To: Yicong Yang <yangyicong@huawei.com>
CC: Shuai Xue <xueshuai@linux.alibaba.com>,
        Jing Zhang
	<renyu.zj@linux.alibaba.com>,
        Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Yicong
 Yang" <yangyicong@hisilicon.com>,
        Jonathan Cameron
	<Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <quic_vbadigan@quicinc.com>,
        <quic_nitegupt@quicinc.com>, <quic_skananth@quicinc.com>,
        <quic_ramkri@quicinc.com>, <quic_parass@quicinc.com>,
        <quic_mrana@quicinc.com>
References: <20240731-dwc_pmu_fix-v1-0-ca47d153e5b2@quicinc.com>
 <20240731-dwc_pmu_fix-v1-1-ca47d153e5b2@quicinc.com>
 <3dcb4074-9958-b454-7456-9dcc455dd736@huawei.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <3dcb4074-9958-b454-7456-9dcc455dd736@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r2iBRan8AZGdOzGNAzzf4Xc1jnfDCqtD
X-Proofpoint-ORIG-GUID: r2iBRan8AZGdOzGNAzzf4Xc1jnfDCqtD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1011 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160025



On 8/15/2024 7:10 PM, Yicong Yang wrote:
> On 2024/7/31 12:23, Krishna chaitanya chundru wrote:
>> When there are multiple of instances of PCIe controllers, registration
>> to perf driver fails with this error.
>> sysfs: cannot create duplicate filename '/devices/platform/dwc_pcie_pmu.0'
>> CPU: 0 PID: 166 Comm: modprobe Not tainted 6.10.0-rc2-next-20240607-dirty
>> Hardware name: Qualcomm SA8775P Ride (DT)
>> Call trace:
>>   dump_backtrace.part.8+0x98/0xf0
>>   show_stack+0x14/0x1c
>>   dump_stack_lvl+0x74/0x88
>>   dump_stack+0x14/0x1c
>>   sysfs_warn_dup+0x60/0x78
>>   sysfs_create_dir_ns+0xe8/0x100
>>   kobject_add_internal+0x94/0x224
>>   kobject_add+0xa8/0x118
>>   device_add+0x298/0x7b4
>>   platform_device_add+0x1a0/0x228
>>   platform_device_register_full+0x11c/0x148
>>   dwc_pcie_register_dev+0x74/0xf0 [dwc_pcie_pmu]
>>   dwc_pcie_pmu_init+0x7c/0x1000 [dwc_pcie_pmu]
>>   do_one_initcall+0x58/0x1c0
>>   do_init_module+0x58/0x208
>>   load_module+0x1804/0x188c
>>   __do_sys_init_module+0x18c/0x1f0
>>   __arm64_sys_init_module+0x14/0x1c
>>   invoke_syscall+0x40/0xf8
>>   el0_svc_common.constprop.1+0x70/0xf4
>>   do_el0_svc+0x18/0x20
>>   el0_svc+0x28/0xb0
>>   el0t_64_sync_handler+0x9c/0xc0
>>   el0t_64_sync+0x160/0x164
>> kobject: kobject_add_internal failed for dwc_pcie_pmu.0 with -EEXIST,
>> don't try to register things with the same name in the same directory.
>>
>> This is because of having same bdf value for devices under two different
>> controllers.
>>
>> Update the logic to use sbdf which is a unique number in case of
>> multi instance also.
>>
>> Fixes: af9597adc2f1 ("drivers/perf: add DesignWare PCIe PMU driver")
> 
> Did you run into this on a QCOM platform with Patch 4/4 since there's
> multiple PCIe domains?
> 
Yes we ran this in QCOM platform where it has multiple PCIe instances.
>> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
>> ---
>>   drivers/perf/dwc_pcie_pmu.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
>> index c5e328f23841..c115348b8d53 100644
>> --- a/drivers/perf/dwc_pcie_pmu.c
>> +++ b/drivers/perf/dwc_pcie_pmu.c
>> @@ -556,10 +556,10 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
>>   {
>>   	struct platform_device *plat_dev;
>>   	struct dwc_pcie_dev_info *dev_info;
>> -	u32 bdf;
>> +	u32 sbdf;
>>   
>> -	bdf = PCI_DEVID(pdev->bus->number, pdev->devfn);
>> -	plat_dev = platform_device_register_data(NULL, "dwc_pcie_pmu", bdf,
>> +	sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
>> +	plat_dev = platform_device_register_data(NULL, "dwc_pcie_pmu", sbdf,
>>   						 pdev, sizeof(*pdev));
>>   
>>   	if (IS_ERR(plat_dev))
>> @@ -611,15 +611,15 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
>>   	struct pci_dev *pdev = plat_dev->dev.platform_data;
>>   	struct dwc_pcie_pmu *pcie_pmu;
>>   	char *name;
>> -	u32 bdf, val;
>> +	u32 sbdf, val;
>>   	u16 vsec;
>>   	int ret;
>>   
>>   	vsec = pci_find_vsec_capability(pdev, pdev->vendor,
>>   					DWC_PCIE_VSEC_RAS_DES_ID);
>>   	pci_read_config_dword(pdev, vsec + PCI_VNDR_HEADER, &val);
>> -	bdf = PCI_DEVID(pdev->bus->number, pdev->devfn);
>> -	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", bdf);
>> +	sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
> 
> sbdf is also registerd as the id of the platform device in platform_device_register_data() above,
> can we use it directly here without encoding it again?
> 
> Thanks.
> 
ack.

- Krishna chaitanya.
>> +	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
>>   	if (!name)
>>   		return -ENOMEM;
>>   
>> @@ -650,7 +650,7 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
>>   	ret = cpuhp_state_add_instance(dwc_pcie_pmu_hp_state,
>>   				       &pcie_pmu->cpuhp_node);
>>   	if (ret) {
>> -		pci_err(pdev, "Error %d registering hotplug @%x\n", ret, bdf);
>> +		pci_err(pdev, "Error %d registering hotplug @%x\n", ret, sbdf);
>>   		return ret;
>>   	}
>>   
>> @@ -663,7 +663,7 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
>>   
>>   	ret = perf_pmu_register(&pcie_pmu->pmu, name, -1);
>>   	if (ret) {
>> -		pci_err(pdev, "Error %d registering PMU @%x\n", ret, bdf);
>> +		pci_err(pdev, "Error %d registering PMU @%x\n", ret, sbdf);
>>   		return ret;
>>   	}
>>   	ret = devm_add_action_or_reset(&plat_dev->dev, dwc_pcie_unregister_pmu,
>>

