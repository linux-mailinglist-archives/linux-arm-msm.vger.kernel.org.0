Return-Path: <linux-arm-msm+bounces-34567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B4B9A04F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 11:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03B0CB24318
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 09:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A5C1D90C8;
	Wed, 16 Oct 2024 09:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RMRy5I3+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F41158D9C;
	Wed, 16 Oct 2024 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729069325; cv=none; b=TiJL2/2bGVa0GkCSb1/GLY7ZCd42303R91+jWTa01J6UXx4gp5zTyq1zDfLjHvlm8AnBHuK9NlZCbl2TBB27+504Yo0MbsQtvbfrYLJiQh5hp5qoDN+qVsvIvyjSMd9jSuIBXRewuXP5xGgtTyIMH7tBpI/lqZ1wuxz6rAH8mhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729069325; c=relaxed/simple;
	bh=9WmOd5cuRPa8MBmjlDk2f0Dy15AkJh/f/HhfJIVXuY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WduOCn0JuKSuBZgag8k6SlVZskvcUQ1NZrycR9NHk9JyJsbQ92Qa/xbOoxPg0bUV9iyRaAfBkkSfZd5wBWLprejDSfdGqDlGK8B7Xt3yh9u22zys6OUAG74sn4Ls729Kcn6DJMjb6WbNzCBHYug17sIzmq/SS3wXn5sWy4kJCU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RMRy5I3+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G8PuiF031193;
	Wed, 16 Oct 2024 09:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P03ly6JJchAmvFrJIVoUSG5+HOwrB2V0T7m+9PqeQKg=; b=RMRy5I3+A8z5zx8n
	63UBfVh5EZ+4KE5AFbQduXqVkg1TH4a6bUPshgCmIULfxDkjnvWJR3dfEXx1k/XC
	aEmDGTRi2TP4fjH3Ksdqrs3orI8qsAKpYN4elB69zPcabg1CovC9iAx5wReKbfjP
	9HiZfEKAjchUXC5A6q1DZBSfO6Bmu0jgJib7lQg+YMiHD5Mt7FhDSTVvVV8lA+2T
	/o+g8l6eIL4hbMcCQmeKY64X5NE4oKuIQDyyb6ea3qhnkrQF+hxqfEXrRc7RjOIu
	z4P7pOmKkeoxq0JiovujIR3FQGl/reEu4HYA0tboP9eRkxaiMvuvpS/dNYus4vSO
	e1QxRw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8nq0cuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 09:01:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49G91vhg025261
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 09:01:57 GMT
Received: from [10.217.222.28] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 02:01:55 -0700
Message-ID: <f46a9180-ca71-458e-9693-ed9badc85e72@quicinc.com>
Date: Wed, 16 Oct 2024 14:31:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: qcom: qcom_tzmem: Implement sanity
 checks
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241014111527.2272428-1-quic_kuldsing@quicinc.com>
 <20241014111527.2272428-3-quic_kuldsing@quicinc.com>
 <CAMRc=MfR8rK3EnZx3_9rxkwgv6f8jA4X0u0cGBkpJ89d5i1MKw@mail.gmail.com>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <CAMRc=MfR8rK3EnZx3_9rxkwgv6f8jA4X0u0cGBkpJ89d5i1MKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JrUwdrMhQ4qL68B6d0Dgb7noeN768y8k
X-Proofpoint-GUID: JrUwdrMhQ4qL68B6d0Dgb7noeN768y8k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160059


On 10/14/2024 6:38 PM, Bartosz Golaszewski wrote:
> On Mon, Oct 14, 2024 at 1:19 PM Kuldeep Singh <quic_kuldsing@quicinc.com> wrote:
>>
>> The qcom_tzmem driver currently has exposed APIs that lack validations
>> on required input parameters. This oversight can lead to unexpected null
>> pointer dereference crashes.
>>
> 
> The commit message is not true. None of the things you changed below
> can lead to a NULL-pointer dereference.>
>> To address this issue, add sanity for required input parameters.
>>
>> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
>> ---
>>  drivers/firmware/qcom/qcom_tzmem.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
>> index 92b365178235..977e48fec32f 100644
>> --- a/drivers/firmware/qcom/qcom_tzmem.c
>> +++ b/drivers/firmware/qcom/qcom_tzmem.c
>> @@ -203,6 +203,9 @@ qcom_tzmem_pool_new(const struct qcom_tzmem_pool_config *config)
>>
>>         might_sleep();
>>
>> +       if (!config->policy)
>> +               return ERR_PTR(-EINVAL);
> 
> This is already handled by the default case of the switch.

Ack. Need to drop.
https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/qcom_tzmem.c#L218

While examining qcom_tzmem_pool_free under the same principle, it
appears the following check is unnecessary.
https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/qcom_tzmem.c#L268

> 
>> +
>>         switch (config->policy) {
>>         case QCOM_TZMEM_POLICY_STATIC:
>>                 if (!config->initial_size)
>> @@ -412,6 +415,9 @@ void qcom_tzmem_free(void *vaddr)
>>  {
>>         struct qcom_tzmem_chunk *chunk;
>>
>> +       if (!vaddr)
>> +               return;
>> +
>>         scoped_guard(spinlock_irqsave, &qcom_tzmem_chunks_lock)
>>                 chunk = radix_tree_delete_item(&qcom_tzmem_chunks,
>>                                                (unsigned long)vaddr, NULL);
> 
> This would lead to a WARN() as the lookup would inevitably fail. We
> can possibly keep this bit but please change the commit message.

Sure, will reword commit message.

-- 
Regards
Kuldeep

