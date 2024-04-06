Return-Path: <linux-arm-msm+bounces-16603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C89A89A7F8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Apr 2024 02:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 945081C21053
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Apr 2024 00:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E460816;
	Sat,  6 Apr 2024 00:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lQxJMbZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DCF3C00;
	Sat,  6 Apr 2024 00:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712364227; cv=none; b=AH8gR5axw8kl5WdPAJcJ/Gv5KGCwdUJSKSzLIKKI7VY5X6P/St05Br9LxeY5vHtq7c0wEw9LZ+Z3vM23wmDH/0K4VnkAuCfoDcZhQp/ibO8lwOx3q78gigqg7PQS8mD37jXq0M5ECggwaKBA6gZ0sKHOShs4yWD5z8+dTe02yG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712364227; c=relaxed/simple;
	bh=GscaTqWHv92TtIuEI4/E+2OV1IglybIzWBLarigaB+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JDvvCkk1+ZLmIskN4vD7A2KF9cozWh04E1NqfoCuOrbcUoB9XOpRM4WmCf17ayjhM6IUdxBjwxlS4CAJqP/vRg6lTiuOl+x58ar1sjy4n40Od9lV2ff7LuGzl8V73p/0r5ArGU17ORhYfYDstY6FUzsrLFVXH8VV9qh1Wjfxv94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lQxJMbZG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4360hcUT027927;
	Sat, 6 Apr 2024 00:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=BpKiqv5ze0m6rjN3vuN/6LSBZGyBipiV4Ab9lBp1OsY=; b=lQ
	xJMbZGTKei0HGzQq7QRBoR/ukX94aXh9wujBHEV9X7eQdNO/1YfPHrZ0XCukfGbH
	/cOyzCVKAbpea4bQODJpzvFn91KZHQ8yGeKW5miAb+eM/MoluRwZtmj6pNayk1ay
	DTae7EKlMea1NPAFwM6uJWypMWP6q0oLZ1UboTITVsCySeCLsNk4Y4HwD+4qR4VK
	gDPaR/NxFK49QMROnpTxiMiWMy2KCra47kLttiCDHRjG/m9i3bC9o8xCYtrVm2OH
	OnZ6XgXAFyihbXqPeuC2UGmqy/Vw7Yp2fkK+2A1j5VwPrl/3EJAWio5Dj5L9F23d
	y7I0R1y8svMP0VXwhFzw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xahgt1b0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Apr 2024 00:43:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4360haov021152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 6 Apr 2024 00:43:36 GMT
Received: from [10.110.52.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 17:43:35 -0700
Message-ID: <d10199df-5fb3-407b-b404-a0a4d067341f@quicinc.com>
Date: Fri, 5 Apr 2024 17:43:35 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] PCI: Add Qualcomm PCIe ECAM root complex driver
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <linux-pci@vger.kernel.org>, <lpieralisi@kernel.org>, <kw@linux.com>,
        <robh@kernel.org>, <bhelgaas@google.com>, <andersson@kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_ramkri@quicinc.com>, <quic_nkela@quicinc.com>,
        <quic_shazhuss@quicinc.com>, <quic_msarkar@quicinc.com>,
        <quic_nitegupt@quicinc.com>
References: <20240405183014.GA1964459@bhelgaas>
From: Mayank Rana <quic_mrana@quicinc.com>
In-Reply-To: <20240405183014.GA1964459@bhelgaas>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rzVs7c-h2ppn1VlFNxH4BZG2sRU8LOl_
X-Proofpoint-ORIG-GUID: rzVs7c-h2ppn1VlFNxH4BZG2sRU8LOl_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_31,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1011
 lowpriorityscore=0 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404060002

Hi Bjorn

Thanks for reviewing change.
On 4/5/2024 11:30 AM, Bjorn Helgaas wrote:
> On Thu, Apr 04, 2024 at 12:11:24PM -0700, Mayank Rana wrote:
>> On some of Qualcomm platform, firmware configures PCIe controller into
>> ECAM mode allowing static memory allocation for configuration space of
>> supported bus range. Firmware also takes care of bringing up PCIe PHY
>> and performing required operation to bring PCIe link into D0. Firmware
> 
> I think link state would be L0, not D0.
ACK
>> also manages system resources (e.g. clocks/regulators/resets/ bus voting).
>> Hence add Qualcomm PCIe ECAM root complex driver which enumerates PCIe
>> root complex and connected PCIe devices. Firmware won't be enumerating
>> or powering up PCIe root complex until this driver invokes power domain
>> based notification to bring PCIe link into D0/D3cold mode.
> 
> Again.
ACK. will repharse it.
>> +config PCIE_QCOM_ECAM
>> +	tristate "QCOM PCIe ECAM host controller"
>> +	depends on ARCH_QCOM && PCI
>> +	depends on OF
>> +	select PCI_MSI
>> +	select PCI_HOST_COMMON
>> +	select IRQ_DOMAIN
>> +	help
>> +	 Say 'Y' here if you want to use ECAM shift mode compatible Qualcomm
>> +	 PCIe root host controller. The controller is programmed using firmware
>> +	 to support ECAM compatible memory address space.
> 
> Instead of adding this at the end, place this entry so the entire list
> remains sorted by vendor name.
> 
> Other related entries are "Qualcomm PCIe controller ..." (not "QCOM").
> 
> Use "ECAM PCIe controller (host mode)" (not "PCIe ECAM host
> controller") so it matches similar entries.
Ok. will rephrase and move as suggested.

>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
> Does this actually work?  I expected "#define dev_fmt" since you're
> using dev_err(), etc below.
Yes. look like it is not needed anymore for this driver as very limited 
pr_* usage.
>> +#include <linux/irqchip/chained_irq.h>
> 
> Can this be reworked so it doesn't use chained IRQs?  I admit to not
> being an IRQ expert, but I have the impression that it's better to
> avoid the chained IRQ model when possible.  See
> https://lore.kernel.org/all/20231108153133.GA393726@bhelgaas/
Ok. will review shared information, and try to rework upon this.

>> +#define	MSI_DB_ADDR	0xa0000000
>
> Where does this come from and why is it hard-coded here?  Looks like a 
> magic address that maybe should come from DT?
Yes it is DB address to generate MSI, and it is not tied with directly 
with any
hardware/platform. Hence hardcoding here.
>> + * struct qcom_msi_irq - MSI IRQ information
>> + * @client:	pointer to MSI client struct
>> + * @grp:	group the irq belongs to
> 
> s/irq/IRQ/ in comments for consistency (other occurrences below).
> Same for s/pcie/PCIe/ and s/msi/MSI/.
ACK
>> +static void qcom_msi_mask_irq(struct irq_data *data)
>> +{
>> +	struct irq_data *parent_data;
>> +	struct qcom_msi_irq *msi_irq;
>> +	struct qcom_msi_grp *msi_grp;
>> +	struct qcom_msi *msi;
>> +	unsigned long flags;
>> +
>> +	parent_data = data->parent_data;
>> +	if (!parent_data)
>> +		return;
> 
> Drop this test; I think it only detects logic errors in the driver or
> memory corruptions, and we want to find out about those.
ACK
>> +static void qcom_msi_unmask_irq(struct irq_data *data)
>> +{
>> +	struct irq_data *parent_data;
>> +	struct qcom_msi_irq *msi_irq;
>> +	struct qcom_msi_grp *msi_grp;
>> +	struct qcom_msi *msi;
>> +	unsigned long flags;
>> +
>> +	parent_data = data->parent_data;
>> +	if (!parent_data)
>> +		return;
> 
> Drop.
ACK
>> +static struct irq_chip qcom_msi_irq_chip = {
>> +	.name		= "qcom_pci_msi",
>> +	.irq_enable	= qcom_msi_unmask_irq,
>> +	.irq_disable	= qcom_msi_mask_irq,
>> +	.irq_mask	= qcom_msi_mask_irq,
>> +	.irq_unmask	= qcom_msi_unmask_irq,
> 
> Name these so they match the struct member, e.g., the name should
> contain "irq_mask", not "mask_irq") so grep finds them easily.
ACK
>> +static struct msi_domain_ops qcom_msi_domain_ops = {
>> +	.msi_prepare	= qcom_msi_domain_prepare,
> 
> Rename so function name includes the struct member name.
ACK
>> +static int qcom_msi_irq_set_affinity(struct irq_data *data,
>> +				const struct cpumask *mask, bool force)
>> +{
>> +	struct irq_data *parent_data = irq_get_irq_data(irqd_to_hwirq(data));
>> +	int ret = 0;
>> +
>> +	if (!parent_data)
>> +		return -ENODEV;
>> +
>> +	/* set affinity for MSI HW IRQ */
> 
> Unnecessary comment.
ACK
>> +	if (parent_data->chip->irq_set_affinity)
>> +		ret = parent_data->chip->irq_set_affinity(parent_data, mask, force);
>> +
>> +	return ret;
> 
> Drop "ret" and return directly, e.g.,
> 
>    if (parent_data->chip->irq_set_affinity)
>      return parent_data->chip->irq_set_affinity(...);
> 
>    return 0;
ACK
>> +static void qcom_msi_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>> +{
>> +	struct irq_data *parent_data = irq_get_irq_data(irqd_to_hwirq(data));
>> +	struct qcom_msi_irq *msi_irq = irq_data_get_irq_chip_data(data);
>> +	struct qcom_msi_client *client = msi_irq->client;
>> +
>> +	if (!parent_data)
>> +		return;
> 
> Drop.
ACK
>> +static void qcom_msi_irq_domain_free(struct irq_domain *domain, unsigned int virq,
>> +				unsigned int nr_irqs)
>> +{
>> +	struct irq_data *data = irq_domain_get_irq_data(domain, virq);
>> +	struct qcom_msi_client *client;
>> +	struct qcom_msi_irq *msi_irq;
>> +	struct qcom_msi *msi;
>> +
>> +	if (!data)
>> +		return;
> 
> Drop.
ACK
>> +static int qcom_msi_irq_setup(struct qcom_msi *msi)
>> +{
>> +	struct qcom_msi_grp *msi_grp;
>> +	struct qcom_msi_irq *msi_irq;
>> +	int i, index, ret;
>> +	unsigned int irq;
>> +
>> +	/* setup each MSI group. nr_hwirqs == nr_grps */
>> +	for (i = 0; i < msi->nr_hwirqs; i++) {
>> +		irq = irq_of_parse_and_map(msi->dev->of_node, i);
>> +		if (!irq) {
>> +			dev_err(msi->dev,
>> +				"MSI: failed to parse/map interrupt\n");
> 
> Possibly include "i" to identify the offending entry.
ACK

Regards,
Mayank

