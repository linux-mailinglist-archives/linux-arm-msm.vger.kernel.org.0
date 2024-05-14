Return-Path: <linux-arm-msm+bounces-19825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C92338C4EF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 12:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32EDBB21452
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 10:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC322130A46;
	Tue, 14 May 2024 09:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bAQdHfQi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8832441C92;
	Tue, 14 May 2024 09:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715679696; cv=none; b=moezDdbqlVH3AUVaIIBAHN636As9U6V940iRhieg9t3Xblll6NOa3qBKLvrIUrWPYF5i1AKHhxqNHcAS6hebSBpvu10mybmXddD79br48QSJwtc7X8NEiE4FPKhjlTVfyNYjrdzbWN1EAvTt1DtCix//JZeWQ5SGV75V4BAKwZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715679696; c=relaxed/simple;
	bh=6Mpki/jgyWpWWGGJV4ESw5IWm8xrmEmTKvIk5CIA3rE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HhnmJdlRpytHXVJ2IU+bW8dga6Mvc5qjsLEm/TozZOoHXJXUtAVJEmHDXNl4sSrphw8J0RhGcZMy6Sl+IUyD3JngHt15WcC5NBv9Qbv2cOyYd71KObsS6AByNAygZFcCappoh0SvxgyW5TALsgIbuYMs+8gYTUxy9MHYiDh9ROE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bAQdHfQi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44E8vN45017392;
	Tue, 14 May 2024 09:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=8uUkafmgXXMUT8WTcpQ4QYtKIX13jsJ7pq+c+B0mXb4=; b=bA
	QdHfQi8a2Mp7Nv6q2UxTjxaCSVHTCNzYSKzlQ+SD2gqrjNnLcujUC4WzjC7TbKtO
	LzMNEk4cpcm6wvYv9IwZXPR9rg6bxLKEw5pJzPFc+y4SLESNQj8QBV0l7kdg5W2O
	CmGHOiD4RfHchZE/59EStLQmSLXQTFu0Sa1budO0xpJwSJ+TKY5mhaK546Al1jJv
	SQssEewYAaXhc+1M10gkNnAOuT86lJdJ5M2yEMmWJfpplHvlKEhLufPM+UK7C9P1
	/c2STcmc3pJ9iqvNvnZ7LHmDbXv4vY5PRuKDPhQQkKkCU2L0N/QIisJSpo4S7bGg
	RWY/f/IVE0bN6EONKoSA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y20w1wskt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 09:37:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44E9b5Co018515
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 09:37:05 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 May
 2024 02:36:59 -0700
Message-ID: <7e398958-7272-5812-6115-e866fa18af4b@quicinc.com>
Date: Tue, 14 May 2024 15:06:25 +0530
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
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <dmitry.baryshkov@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <conor+dt@kernel.org>,
        <quic_gkohli@quicinc.com>, <quic_nkela@quicinc.com>,
        <quic_psodagud@quicinc.com>, <abel.vesa@linaro.org>
References: <20240422164035.1045501-1-quic_sibis@quicinc.com>
 <20240422164035.1045501-3-quic_sibis@quicinc.com>
 <CABb+yY2mjc0BmvdUxZvkEvFMS30g=h5F7aHEKogfH9=W0C1a2w@mail.gmail.com>
Content-Language: en-US
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <CABb+yY2mjc0BmvdUxZvkEvFMS30g=h5F7aHEKogfH9=W0C1a2w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6xCsEPTOMxKUPq3n0eV9utPfC0RbPWfQ
X-Proofpoint-GUID: 6xCsEPTOMxKUPq3n0eV9utPfC0RbPWfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_04,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=879 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405140067



On 5/1/24 07:44, Jassi Brar wrote:
> On Mon, Apr 22, 2024 at 11:41 AM Sibi Sankar <quic_sibis@quicinc.com> wrote:
>>
>> Add support for CPUSS Control Processor (CPUCP) mailbox controller,
>> this driver enables communication between AP and CPUCP by acting as
>> a doorbell between them.
>>

Hey Jassi,

Thanks for taking time to review the series :).

>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
> 
> Do you want to add an entry in the MAINTAINERS ?

Thanks will add in the next re-spin.

> 
>> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
>   .....
>> +static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
>> +{
>> +       struct qcom_cpucp_mbox *cpucp = data;
>> +       struct mbox_chan *chan;
>> +       unsigned long flags;
>> +       u64 status;
>> +       u32 val;
>> +       int i;
>> +
> The variables flags, val and chan are better inside the for loop below.

Ack.

-Sibi

> 
>> +       status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
>> +
>> +       for_each_set_bit(i, (unsigned long *)&status, APSS_CPUCP_IPC_CHAN_SUPPORTED) {
>> +               val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
>> +               chan = &cpucp->chans[i];
>> +               /* Provide mutual exclusion with changes to chan->cl */
>> +               spin_lock_irqsave(&chan->lock, flags);
>> +               if (chan->cl)
>> +                       mbox_chan_received_data(chan, &val);
>> +               writeq(BIT(i), cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
>> +               spin_unlock_irqrestore(&chan->lock, flags);
>> +       }
>> +
>> +       return IRQ_HANDLED;
>> +}
>> +
> 
> Thanks
> Jassi

