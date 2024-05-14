Return-Path: <linux-arm-msm+bounces-19826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7E58C5123
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 13:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC76C281F5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 11:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F254929D06;
	Tue, 14 May 2024 10:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mkOS96N6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2607A1CFB2;
	Tue, 14 May 2024 10:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715684102; cv=none; b=eo0JPZ0mcBv4+yRsSsPuJ0wv9UbIgD/anIipta4DKcbT5HQeL21gCnCZTDVE0xUUDa4U1lIASWFVa+/bBJ7cUDdxRqlxwy0WEmrdhNb+NDsWRRZ3YDPkbDMnFL8u7O/tagllN+VkZoxXLKPH166JzbPHBiktLhbtIXpVceVMOnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715684102; c=relaxed/simple;
	bh=aYR1eZ8kr84KU/iH3MiAHsNKrACN/BhWJG1zs3EpEeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=buvp2uG2Vn1Hk6COsrcJ5+Ryk314/bHORVBAkOA9mGzuax+s1qQ7IMjTAjJtH9tJYiOO5Ebu6go0QubR5kG4nOhLOqoITeFOyiWWK/svZFkVuOyHPBxAENrazEPTO6wE5xfcYsVKQjhaG6DuvdtZBetgQhm8wVtI2S+X8xOOF/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mkOS96N6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44E8hLbC023875;
	Tue, 14 May 2024 10:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=7Bo+nderALaOSTlE7QBlXAwjL5XUIIfsXSuQqM2dxeM=; b=mk
	OS96N6JPwqo8dYpF9aUBRCPuGQMjndL+1IknEa+VYhMr0GLEyFQSE6p8fVBPyElN
	0Ok7s8J8L3iLtiIEMR3g1UjMgCCR53jcPtwH753O9JrGwYVBfT/sMfxNomzFeaSD
	62LXGPA5Zqb3RsnfDtQIIoyumbUYP9hHt2lQZgzJRpqE1iiSRc7SLStT12K4koLm
	ZPpzeR3UeQOJ5OHHkxpyx5HY/C6YkuJkJnyNeu/UdtFxTIEE7knRhQ9v5o9FRAs/
	zFxPXPGxGHQTAnhW7hUjbb6HENrlp5EhbQyzC6sXSHAYx4G1Iw3491PYBAfEjtz5
	1XmzK1Y75kasOIQmVp/A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y2125e13k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 10:54:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44EAsgZd013233
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 10:54:42 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 May
 2024 03:54:36 -0700
Message-ID: <f1c8eca4-b5cf-662d-8ccc-ff51b4b44eb9@quicinc.com>
Date: Tue, 14 May 2024 16:24:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 2/5] mailbox: Add support for QTI CPUCP mailbox
 controller
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <sudeep.holla@arm.com>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <jassisinghbrar@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <dmitry.baryshkov@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <conor+dt@kernel.org>,
        <quic_gkohli@quicinc.com>, <quic_nkela@quicinc.com>,
        <quic_psodagud@quicinc.com>, <abel.vesa@linaro.org>
References: <20240422164035.1045501-1-quic_sibis@quicinc.com>
 <20240422164035.1045501-3-quic_sibis@quicinc.com> <ZjTdNwzA4F-GxYY5@pluto>
Content-Language: en-US
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <ZjTdNwzA4F-GxYY5@pluto>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jkQCSV4VmlOyJPxj7koqdW0Cu-bFonNO
X-Proofpoint-ORIG-GUID: jkQCSV4VmlOyJPxj7koqdW0Cu-bFonNO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_05,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=808 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140077



On 5/3/24 18:18, Cristian Marussi wrote:
> On Mon, Apr 22, 2024 at 10:10:32PM +0530, Sibi Sankar wrote:
>> Add support for CPUSS Control Processor (CPUCP) mailbox controller,
>> this driver enables communication between AP and CPUCP by acting as
>> a doorbell between them.
>>
> 
> Hi Sibi,
> 
> one small reflection about locking on the RX path down below...
> 
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>

Hey Christian,
Thanks for taking time to review the series :)

> 
> [snip]
> 
>> +struct qcom_cpucp_mbox {
>> +	struct mbox_chan chans[APSS_CPUCP_IPC_CHAN_SUPPORTED];
>> +	struct mbox_controller mbox;
>> +	void __iomem *tx_base;
>> +	void __iomem *rx_base;
>> +};
>> +
>> +static inline int channel_number(struct mbox_chan *chan)
>> +{
>> +	return chan - chan->mbox->chans;
>> +}
>> +
>> +static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
>> +{
>> +	struct qcom_cpucp_mbox *cpucp = data;
>> +	struct mbox_chan *chan;
>> +	unsigned long flags;
>> +	u64 status;
>> +	u32 val;
>> +	int i;
>> +
>> +	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
>> +
>> +	for_each_set_bit(i, (unsigned long *)&status, APSS_CPUCP_IPC_CHAN_SUPPORTED) {
>> +		val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
>> +		chan = &cpucp->chans[i];
>> +		/* Provide mutual exclusion with changes to chan->cl */
>> +		spin_lock_irqsave(&chan->lock, flags);
>> +		if (chan->cl)
> 
> So the spinlock here is needed to properly check for races on chan->cl
> being NULLified by concurrent calls to mbox_channel_free()...the end
> result, though, is that you disable IRQs here on each single data
> processed on the RX path, while calling mbox_chan_received_data(), in order
> to avoid the remote (but real) possibility that the mbox users could free
> the channel while some traffic is still in-flight and processed by this ISR.
> 
> Note that, though, that mbox_channel_free() calls straight away at start
> your controller provided qcom_cpucp_mbox_shutdown() method, where you disable
> the IRQ at the HW level in the chip: this means that the only race which could
> then happen between the call to .shutdown and chan->cl = NULL, would happen in
> any already executing qcom_cpucp_mbox_irq_fn() ISR...
> 
> So, I was thinking, what if you add a
> 
> 	sincronize_irq(cpucp->irq);
> 
> in your shutdown right after having disabled the HW IRQs.
> 
> This would mean waiting for the termination of any IRQ handlers pending on your
> cpucp->irq (field that does not exist as of now :D), right after having
> disabled such irq and so just before NULLifying chan->cl...in this way you
> should be able to safely drop this spinlock call from the host RX path,
> because once you chan->cl = NULL is executed, the IRQs are disabled and
> any ongoing ISR would have been terminated.
> 
> syncronize_irq() is blocking of course, potentially, but the shutdown
> method in mbox_chan_ops is allowed to be blocking looking at the comments.
> 
> ...not sure if all of this is worth to avoid this small section of code to be
> run with IRQs disabled....note though that the mbox_chan_received_data() calls
> straight away into the client provided cl->callback....so the real lenght of this
> code path is uncertain ....
> 
> ...just an idea to reason about...

In addition to shutdown, Bjorn was worried about handling the setup
scenario as well. Since there are multiple channels, irq handler could
end up dereferencing a half baked cl of the second channel while it's
still being setup. Of course this could happen only if the status bits
aren't cleared by the bootloader though. If it's just the shutdown path
your rec should work fine :)

-Sibi

> 
> Thanks,
> Cristian

