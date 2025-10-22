Return-Path: <linux-arm-msm+bounces-78314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC9CBFB7D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 12:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E19FF18C18BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 10:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F4B285418;
	Wed, 22 Oct 2025 10:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G43QsmnS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61D830CDB6;
	Wed, 22 Oct 2025 10:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761130658; cv=none; b=mqQhSgYw1eFdjxIZ8zf4c1WL0To8V2PV6NT8aHamgppUCluTjK3UuQSsXUiV7GYODRSE+QK43pf+5kr0/4Tdm0vvmzLGHEjyN20J9hluAkwca2/XR+JJaAwiWl+frlQQ5ose3ps/wAgQ3EUZDmyOgCfWxENe2mbK5PTnAWw4lSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761130658; c=relaxed/simple;
	bh=44hU0A5XT2BwsHVd3ivjnoGEMq7A5g8C8+pnZd5xNew=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dGfuuXd18QSbzSbkpYQEzby7CmT6L21sM0nrhMBPbDDu2yiynHA2/SfhyM3mZikLUkRtuxaIlENr3obnKTbcCCO51FGSzxXNguLWRmPdbZ63RvaHBdOL5zX6GVxgX/8qk5NX3apBZSF2rJPQE0+EKunWl7+vJly5D1ktfKHT4jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G43QsmnS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MARP7p032755;
	Wed, 22 Oct 2025 10:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f06OL6NZEmM+0LyUYN42vSElcbvRsxauO9buSCOP0xo=; b=G43QsmnStAGReJFk
	a0GPsgu1GU17zVgRkJCtXHCKoibRL/Fedh8z4otafFYddhsatKfy9I2mEADaKt+V
	B+eOfUHkkyiEuQq3XQYyekzvfou92PfS3eS8BMAq2ST9ODYM3SzChu3yY12B+hD7
	uji9xTeKsP4FdHJUtNVpQ0XEI/vP5TBYqsXiEHiAQsJb9d3/pMcF0iOP1yaFnyFG
	vMABVryUIeJ5KST79fBZGOI1MWjFuEcB9vRZyXoe3ikR2Vk5gzrEJN4oRhp1qptk
	tNqBo5AlxZyZD1BfZm5qv4LyktvUDv0dqlHfg7PUJmZai9dA/Sz9Dvs1dtzi0MwR
	JEN4ug==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w9yxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 10:57:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59MAvXAn000484
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 10:57:33 GMT
Received: from [10.217.239.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 22 Oct
 2025 03:57:31 -0700
Message-ID: <f2a46da9-23f1-425e-8978-0fa412ed1dfa@quicinc.com>
Date: Wed, 22 Oct 2025 16:27:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: smp2p: Add irqchip state support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingyi Wang
	<jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Chris Lew
	<chris.lew@oss.qualcomm.com>
References: <20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com>
 <20250923-smp2p-v1-1-2c045af73dac@oss.qualcomm.com>
 <15c56c70-928a-4939-86a2-e7b81f1596a6@oss.qualcomm.com>
 <c239bce2-4bef-4085-8a74-c6d7c863febf@quicinc.com>
 <344f0f72-27c5-4b88-99ee-f71065cc3a5f@oss.qualcomm.com>
Content-Language: en-US
From: Deepak Kumar Singh <quic_deesin@quicinc.com>
In-Reply-To: <344f0f72-27c5-4b88-99ee-f71065cc3a5f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hekN36Yw8v3FeFHKGgHl-ERJY-yNqlM6
X-Proofpoint-GUID: hekN36Yw8v3FeFHKGgHl-ERJY-yNqlM6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX7xpFnLzN7OaQ
 6KMX0s4EOsypsG5nYKjym5yGSp3gSYF0+aaz9aR7wN79hXS6W9souT3DHM71aTlg2ji54R8w2fc
 zt9WSBEx/jMSlTXtUtiozvlReQUETLZvt3Rlvd96wAwNFko0SkAlnyRpfi8tWPVbm1W2Sd48H8N
 vLkrOKUfQwuvP+DMWeEqk8X57UDZiMfIO3jwM5sab4tZ/9ywDeINZhe4gwVk8t9pLM7OWYx1j+K
 O8sOQSPR7Sc9qi3SQSuRYmZ2sv+MRF0Nq4mwFowyAZYQnhV4PKuVFGqlb9deXk9zmwhOKvIsdYP
 eOCH460jiG5iIhu8g8MA/SyYrVS/AVG4MFfi+p63YMC4o64dGgFn8D7/8lPS+Odw5afXJiHDRSv
 P50aAsDNu4iIaD7IXV3wMNFo2JrNUg==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f8b89e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JP9Gpur_04sB__cSA64A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090



On 10/21/2025 3:05 PM, Konrad Dybcio wrote:
> On 10/21/25 10:12 AM, Deepak Kumar Singh wrote:
>>
>>
>> On 9/24/2025 8:20 PM, Konrad Dybcio wrote:
>>> On 9/24/25 6:18 AM, Jingyi Wang wrote:
>>>> From: Chris Lew <chris.lew@oss.qualcomm.com>
>>>>
>>>> A remoteproc booted during earlier boot stages such as UEFI or the
>>>> bootloader, may need to be attached to without restarting the remoteproc
>>>> hardware. To do this the remoteproc will need to check the ready and
>>>> handover states in smp2p without an interrupt notification.
>>>>
>>>> Add support for the .irq_get_irqchip_state callback so remoteproc can
>>>> read the current state of the fatal, ready and handover bits.
>>>>
>>>> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
>>>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> ---
>>>>    drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 55 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>>>> index cb515c2340c1..e2cfd9ec8875 100644
>>>> --- a/drivers/soc/qcom/smp2p.c
>>>> +++ b/drivers/soc/qcom/smp2p.c
>>>> @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>>>>        }
>>>>    }
>>>>    +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
>>>> +{
>>>> +    unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
>>>> +    unsigned int pid = smp2p->remote_pid;
>>>> +    char buf[SMP2P_MAX_ENTRY_NAME];
>>>> +    struct smp2p_smem_item *in;
>>>> +    struct smp2p_entry *entry;
>>>> +    size_t size;
>>>> +    int i;
>>>> +
>>>> +    in = qcom_smem_get(pid, smem_id, &size);
>>>> +    if (IS_ERR(in))
>>>> +        return;
>>>> +
>>>> +    smp2p->in = in;
>>>> +
>>>> +    /* Check if version is initialized and set to v2 */
>>>> +    if (in->version == 0)
>>>> +        return;
>>>
>>> This doesn't seem to be fully in line with the comment
>>>
>>> Konrad
>>>
>> Hi Konard,
>>
>> Can you please elaborate more on this?
>> in->version == 0 means remote has not initialized the version yet, so no need of enumerating entries. For other case i.e in->version == 1 or 2, in entries added by early booted remote has to be enumerated.
> 
> It's not at all obvious that 0 is supposed to mean "uninitialized"
> 
> Please #define it
> 
> Konrad
I think that can be added or instead we can replace (in->version == 0 
)with (in->version != SMP2P_VERSION_2).


