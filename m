Return-Path: <linux-arm-msm+bounces-34733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFD29A2175
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 13:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDAEA1C21BDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960D81DC1AF;
	Thu, 17 Oct 2024 11:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HsnUXjQC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824741D90AD;
	Thu, 17 Oct 2024 11:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729165973; cv=none; b=KJ+5HElq4PsYgC2iDS+sDP4cZVMKZNPVkhGHv5d1lBcku6Ka5PDhcdbTT4EhRDo8bjgOh10Do6OyO9kurLX8GpEcPrLU0DO1/o/HUyfUFmVzi3Qe+aiCvdlKEdNvlS7K88zccOizQwOFo5o/NDmdPdddbFjDrmgB4AMOeCipCZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729165973; c=relaxed/simple;
	bh=H0gwYu7Bit465d2vhK9i5XgdeR3gNV4zGhKRx9ow+sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QCKzGqvAaVVatIdsXtCtrE9PROs57LjARk3JFLeKNaGyfNR9uvxRQ7WtLu0MxvS9+QPerfew0ep6PaQiewY8Eo/Da2mT+dAYK0Agas8fxGimGXfB1hfEBwjdmO8XJWWxWJ5mlpYp0n1kO1icy821a94UGGZmiqpWzVn0fB7oaGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HsnUXjQC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H71AAj031193;
	Thu, 17 Oct 2024 11:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hBI3QqtWRjF9uXlP6+feMspKh5MHVA4qsgiU1NZ/e4=; b=HsnUXjQCeUi6Ahnv
	P+P8vaAOLaXOGuX4WJOvVR7Jja4Tgp5lNOTsG0DOKR1Q8qJTvnYo8dniSrG7jaaP
	6hRWoKAHzf1KBFHsmOXci/AcKsbH1jwFFwPxBnwIH2Qw6alWKQ936UTu9re19gvN
	ZnBFxh4QyKb9kNdavJnt/2m7LIextDerG4MCNG08Xy0t3UohB+DwrUAajKWHND85
	+hVB37pq9Z165qBKW1WGpoM/TJfmz4ZowcD+Xxo4bY/SRoOBdHTYvT3bsBeu2KKV
	t3oqIdHXp6ZA/DiesOT6sIZVF5SKB4EdqFw0c9FtFaAXTp/Kg2Ew/duLri3AqnrY
	gBujEw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8nq4gsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 11:52:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HBqgCt001688
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 11:52:42 GMT
Received: from [10.214.67.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 04:52:39 -0700
Message-ID: <037f6cea-28c7-4114-b542-7f12aa1bcb1f@quicinc.com>
Date: Thu, 17 Oct 2024 17:22:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mailbox: qcom-cpucp-mbox: Add support for SC7280
 CPUCP mailbox controller
To: Bjorn Andersson <andersson@kernel.org>
CC: Sibi Sankar <quic_sibis@quicinc.com>,
        Jassi Brar
	<jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "Ramakrishna
 Gottimukkula" <quic_rgottimu@quicinc.com>
References: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
 <20240924050941.1251485-3-quic_kshivnan@quicinc.com>
 <daorjvhony2y2ye2b3tus37bzux4hqqmhftyjsem7fz5cp2z42@a7ftfpnuvbja>
Content-Language: en-US
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
In-Reply-To: <daorjvhony2y2ye2b3tus37bzux4hqqmhftyjsem7fz5cp2z42@a7ftfpnuvbja>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6ll_INOkeOorh8ArqBOodnoMPhfQSgHo
X-Proofpoint-GUID: 6ll_INOkeOorh8ArqBOodnoMPhfQSgHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170079

Thank you, Bjorn, for taking the time to review this patch series.


On 10/6/2024 8:03 AM, Bjorn Andersson wrote:
> On Tue, Sep 24, 2024 at 10:39:40AM GMT, Shivnandan Kumar wrote:
>> The SC7280 CPUCP mailbox controller is compatible with legacy mailbox
>> hardware.
> 
> "mailbox hardware" is a very vague description of something.
> 
>> Implement support for this functionality which enable HLOS to
>> CPUCP communication.
>>
> 
> Please describe the problem that this solves. What "legacy mailbox
> hardware"? Why do you want to talk to the CPUCP?  What is a HLOS? What
> is the CPUCP?
> 

ACK, I will add description in next patch series.

> It seems from the patch that the current implementation supports
> something we call "version 2" of the cpucp mailbox interface and you're
> adding support for v1. Please make sure that the commit message describe
> such things.
> 

ACK

>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> ---
>>   drivers/mailbox/qcom-cpucp-mbox.c | 156 +++++++++++++++++++++++-------
>>   1 file changed, 122 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
>> index e5437c294803..faae6e069ea1 100644
>> --- a/drivers/mailbox/qcom-cpucp-mbox.c
>> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
>> @@ -13,18 +13,24 @@
>>   #include <linux/platform_device.h>
>>
>>   #define APSS_CPUCP_IPC_CHAN_SUPPORTED		3
>> -#define APSS_CPUCP_MBOX_CMD_OFF			0x4
>> -
>> -/* Tx Registers */
>> -#define APSS_CPUCP_TX_MBOX_CMD(i)		(0x100 + ((i) * 8))
>>
>>   /* Rx Registers */
>> -#define APSS_CPUCP_RX_MBOX_CMD(i)		(0x100 + ((i) * 8))
>> -#define APSS_CPUCP_RX_MBOX_MAP			0x4000
>> -#define APSS_CPUCP_RX_MBOX_STAT			0x4400
>> -#define APSS_CPUCP_RX_MBOX_CLEAR		0x4800
>> -#define APSS_CPUCP_RX_MBOX_EN			0x4c00
>> -#define APSS_CPUCP_RX_MBOX_CMD_MASK		GENMASK_ULL(63, 0)
>> +#define APSS_CPUCP_V2_RX_MBOX_CMD_MASK		GENMASK_ULL(63, 0)
>> +#define APSS_CPUCP_V1_SEND_IRQ_VAL		BIT(28)
>> +#define APSS_CPUCP_V1_CLEAR_IRQ_VAL		BIT(3)
>> +#define APSS_CPUCP_V1_STATUS_IRQ_VAL		BIT(3)
>> +
>> +struct qcom_cpucp_mbox_desc {
>> +	u32 enable_reg;
> 
> Do you really need these parameters to be dynamic? E.g. you only touch
> enable_reg from the v2 code paths...
> 

Will remove this in next patch series.

>> +	u32 map_reg;
>> +	u32 rx_reg;
>> +	u32 tx_reg;
>> +	u32 status_reg;
>> +	u32 clear_reg;
>> +	u32 chan_stride;
> 
> "u32" tells me that this has to be 32 bits, e.g. because the value is
> going into a register... But these are just offsets...
> 
> Please use "unsigned int" to denote "a natural number".
> 

ACK

>> +	bool v2_mbox;
> 
> How about "version" and give it a value 1 or 2?
> 

Ok, will do like that.

>> +	u32 num_chans;
>> +};
>>
>>   /**
>>    * struct qcom_cpucp_mbox - Holder for the mailbox driver
>> @@ -35,6 +41,7 @@
>>    */
>>   struct qcom_cpucp_mbox {
>>   	struct mbox_chan chans[APSS_CPUCP_IPC_CHAN_SUPPORTED];
>> +	const struct qcom_cpucp_mbox_desc *desc;
>>   	struct mbox_controller mbox;
>>   	void __iomem *tx_base;
>>   	void __iomem *rx_base;
>> @@ -48,13 +55,40 @@ static inline int channel_number(struct mbox_chan *chan)
>>   static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
> 
> Why is the existing function renamed "v2" and this newly introduced
> function not given a version?
> 

ACK

>>   {
>>   	struct qcom_cpucp_mbox *cpucp = data;
>> +	const struct qcom_cpucp_mbox_desc *desc = cpucp->desc;
>> +	int i;
>> +
>> +	for (i = 0; i < desc->num_chans; i++) {
>> +		u32 val = readl(cpucp->rx_base + desc->status_reg + (i * desc->chan_stride));
>> +		struct mbox_chan *chan = &cpucp->chans[i];
>> +		unsigned long flags;
>> +
>> +		if (val & APSS_CPUCP_V1_STATUS_IRQ_VAL) {
>> +			writel(APSS_CPUCP_V1_CLEAR_IRQ_VAL,
>> +			       cpucp->rx_base + desc->clear_reg + (i * desc->chan_stride));
>> +			/* Make sure reg write is complete before proceeding */
>> +			mb();
>> +			spin_lock_irqsave(&chan->lock, flags);
>> +			if (chan->cl)
>> +				mbox_chan_received_data(chan, NULL);
>> +			spin_unlock_irqrestore(&chan->lock, flags);
>> +		}
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t qcom_cpucp_v2_mbox_irq_fn(int irq, void *data)
>> +{
>> +	struct qcom_cpucp_mbox *cpucp = data;
>> +	const struct qcom_cpucp_mbox_desc *desc = cpucp->desc;
>>   	u64 status;
>>   	int i;
>>
>> -	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
>> +	status = readq(cpucp->rx_base + desc->status_reg);
>>
>> -	for_each_set_bit(i, (unsigned long *)&status, APSS_CPUCP_IPC_CHAN_SUPPORTED) {
>> -		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
>> +	for_each_set_bit(i, (unsigned long *)&status, desc->num_chans) {
>> +		u32 val = readl(cpucp->rx_base + desc->rx_reg + (i * desc->chan_stride));
>>   		struct mbox_chan *chan = &cpucp->chans[i];
>>   		unsigned long flags;
>>
>> @@ -62,7 +96,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
>>   		spin_lock_irqsave(&chan->lock, flags);
>>   		if (chan->cl)
>>   			mbox_chan_received_data(chan, &val);
>> -		writeq(BIT(i), cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
>> +		writeq(BIT(i), cpucp->rx_base + desc->clear_reg);
>>   		spin_unlock_irqrestore(&chan->lock, flags);
>>   	}
>>
>> @@ -72,12 +106,15 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
>>   static int qcom_cpucp_mbox_startup(struct mbox_chan *chan)
>>   {
>>   	struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
>> +	const struct qcom_cpucp_mbox_desc *desc = cpucp->desc;
>>   	unsigned long chan_id = channel_number(chan);
>>   	u64 val;
>>
>> -	val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
>> -	val |= BIT(chan_id);
>> -	writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
>> +	if (desc->v2_mbox) {
>> +		val = readq(cpucp->rx_base + desc->enable_reg);
>> +		val |= BIT(chan_id);
>> +		writeq(val, cpucp->rx_base + desc->enable_reg);
>> +	}
> 
> No equivalent in "legacy"?

Yes, right

>>
>>   	return 0;
>>   }
>> @@ -85,22 +122,26 @@ static int qcom_cpucp_mbox_startup(struct mbox_chan *chan)
>>   static void qcom_cpucp_mbox_shutdown(struct mbox_chan *chan)
>>   {
>>   	struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
>> +	const struct qcom_cpucp_mbox_desc *desc = cpucp->desc;
>>   	unsigned long chan_id = channel_number(chan);
>>   	u64 val;
>>
>> -	val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
>> -	val &= ~BIT(chan_id);
>> -	writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
>> +	if (desc->v2_mbox) {
>> +		val = readq(cpucp->rx_base + desc->enable_reg);
>> +		val &= ~BIT(chan_id);
>> +		writeq(val, cpucp->rx_base + desc->enable_reg);
>> +	}
> 
> Ditto
> 

We do not have equivalent in "legacy".

>>   }
>>
>>   static int qcom_cpucp_mbox_send_data(struct mbox_chan *chan, void *data)
>>   {
>>   	struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
>> +	const struct qcom_cpucp_mbox_desc *desc = cpucp->desc;
>> +	u32 val = desc->v2_mbox ? *(u32 *)data : APSS_CPUCP_V1_SEND_IRQ_VAL;
> 
> Please rewrite this without ternary operators.
> 

ACK

>>   	unsigned long chan_id = channel_number(chan);
>> -	u32 *val = data;
>> -
>> -	writel(*val, cpucp->tx_base + APSS_CPUCP_TX_MBOX_CMD(chan_id) + APSS_CPUCP_MBOX_CMD_OFF);
>> +	u32 offset = desc->v2_mbox ? (chan_id * desc->chan_stride) : 0;
>>
>> +	writel(val, cpucp->tx_base + desc->tx_reg + offset);
>>   	return 0;
>>   }
>>
>> @@ -112,41 +153,66 @@ static const struct mbox_chan_ops qcom_cpucp_mbox_chan_ops = {
>>
>>   static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
>>   {
>> +	const struct qcom_cpucp_mbox_desc *desc;
>>   	struct device *dev = &pdev->dev;
>>   	struct qcom_cpucp_mbox *cpucp;
>>   	struct mbox_controller *mbox;
>> +	struct resource *res;
>>   	int irq, ret;
>>
>> +	desc = device_get_match_data(&pdev->dev);
>> +	if (!desc)
>> +		return -EINVAL;
>> +
>>   	cpucp = devm_kzalloc(dev, sizeof(*cpucp), GFP_KERNEL);
>>   	if (!cpucp)
>>   		return -ENOMEM;
>>
>> -	cpucp->rx_base = devm_of_iomap(dev, dev->of_node, 0, NULL);
>> -	if (IS_ERR(cpucp->rx_base))
>> -		return PTR_ERR(cpucp->rx_base);
>> +	cpucp->desc = desc;
>> +
>> +	if (desc->v2_mbox) {
>> +		cpucp->rx_base = devm_of_iomap(dev, dev->of_node, 0, NULL);
>> +		if (IS_ERR(cpucp->rx_base))
>> +			return PTR_ERR(cpucp->rx_base);
>> +	/* Legacy mailbox quirks due to shared region with EPSS register space */
> 
> Why can't we have the same code in both cases?
> 


RX address space share region with EPSS. Due to which devm_of_iomap 
returns -EBUSY.

>> +	} else {
>> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +		if (!res) {
>> +			dev_err(&pdev->dev, "Failed to get the device base address\n");
> 
> It's not only base address.
> 

Will add appropriate print statement.

>> +			return -ENODEV;
>> +		}
>> +		cpucp->rx_base = devm_ioremap(dev, res->start, resource_size(res));
>> +		if (!cpucp->rx_base) {
>> +			dev_err(dev, "Failed to ioremap the cpucp rx irq addr\n");
>> +			return -ENOMEM;
>> +		}
>> +	}
>>
>>   	cpucp->tx_base = devm_of_iomap(dev, dev->of_node, 1, NULL);
>>   	if (IS_ERR(cpucp->tx_base))
>>   		return PTR_ERR(cpucp->tx_base);
>>
>> -	writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
>> -	writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
>> -	writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
>> +	if (desc->v2_mbox) {
>> +		writeq(0, cpucp->rx_base + desc->enable_reg);
>> +		writeq(0, cpucp->rx_base + desc->clear_reg);
>> +		writeq(0, cpucp->rx_base + desc->map_reg);
> 
> 
> Is there a reason why the legacy system does not need or want to clear
> these?
> 

Legacy system does not have equivalent registers.

>> +	}
>>
>>   	irq = platform_get_irq(pdev, 0);
>>   	if (irq < 0)
>>   		return irq;
>>
>> -	ret = devm_request_irq(dev, irq, qcom_cpucp_mbox_irq_fn,
>> -			       IRQF_TRIGGER_HIGH, "apss_cpucp_mbox", cpucp);
>> +	ret = devm_request_irq(dev, irq, desc->v2_mbox ? qcom_cpucp_v2_mbox_irq_fn :
>> +		qcom_cpucp_mbox_irq_fn, IRQF_TRIGGER_HIGH, "apss_cpucp_mbox", cpucp);
> 
> The use of a ternary operator, in combination with odd line wrapping
> makes this completely unreadable. Please fix.
> 

ACK

>>   	if (ret < 0)
>>   		return dev_err_probe(dev, ret, "Failed to register irq: %d\n", irq);
>>
>> -	writeq(APSS_CPUCP_RX_MBOX_CMD_MASK, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
>> +	if (desc->v2_mbox)
>> +		writeq(APSS_CPUCP_V2_RX_MBOX_CMD_MASK, cpucp->rx_base + desc->map_reg);
>>
>>   	mbox = &cpucp->mbox;
>>   	mbox->dev = dev;
>> -	mbox->num_chans = APSS_CPUCP_IPC_CHAN_SUPPORTED;
>> +	mbox->num_chans = desc->num_chans;
>>   	mbox->chans = cpucp->chans;
>>   	mbox->ops = &qcom_cpucp_mbox_chan_ops;
>>
>> @@ -157,8 +223,30 @@ static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
>>   	return 0;
>>   }
>>
>> +static const struct qcom_cpucp_mbox_desc sc7280_cpucp_mbox = {
>> +	.tx_reg = 0xC,
>> +	.chan_stride = 0x1000,
>> +	.status_reg = 0x30C,
> 
> Lowercase hex digits please (although the question above whether these
> needs to be defined remains).

ACK

> 
>> +	.clear_reg = 0x308,
>> +	.v2_mbox = false,
>> +	.num_chans = 2,
>> +};
>> +
>> +static const struct qcom_cpucp_mbox_desc x1e80100_cpucp_mbox = {
>> +	.rx_reg = 0x104,
>> +	.tx_reg = 0x104,
>> +	.chan_stride = 0x8,
>> +	.map_reg = 0x4000,
>> +	.status_reg = 0x4400,
>> +	.clear_reg = 0x4800,
>> +	.enable_reg = 0x4C00,
>> +	.v2_mbox = true,
>> +	.num_chans = 3,
>> +};
>> +
>>   static const struct of_device_id qcom_cpucp_mbox_of_match[] = {
>> -	{ .compatible = "qcom,x1e80100-cpucp-mbox" },
>> +	{ .compatible = "qcom,x1e80100-cpucp-mbox", .data = &x1e80100_cpucp_mbox},
>> +	{ .compatible = "qcom,sc7280-cpucp-mbox", .data = &sc7280_cpucp_mbox},
> 
> Perhaps I'm missing something, but seems like the only information you
> actually need to pass here is 1 or 2, to denote which version/code paths
> you should take through the driver.
> 

okay, I will rename sc7280_cpucp_mbox and x1e80100_cpucp_mbox structures 
as v1 and v2 respectively.

> Regards,
> Bjorn
> 
>>   	{}
>>   };
>>   MODULE_DEVICE_TABLE(of, qcom_cpucp_mbox_of_match);
>> --
>> 2.25.1
>>

