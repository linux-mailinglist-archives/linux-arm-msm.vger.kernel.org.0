Return-Path: <linux-arm-msm+bounces-78103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E59BF5319
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 10:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7458318C24FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 08:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE392F90D3;
	Tue, 21 Oct 2025 08:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fEQSxvRD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7401F2FB609;
	Tue, 21 Oct 2025 08:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761034357; cv=none; b=PxDQkQCnW0egwauI330tA+oHNEHTGsR1EnRGdyU6APHiHD22X7ARgPYsqk468m42RbXfv/oninz1Ye+OvIqEoG7uWC3DYZljHsCaakc/KRpgJ7ia6mzUhRAT0StfUbHhW7vDzaoqjN7TvhbFYtu/xMq8wqllc48DnAJHmZqaMnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761034357; c=relaxed/simple;
	bh=oySc4WA24pGv5iB5xogr64p/zSPwdTpUx5E3vfpKKzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tD6wvCQmaliBlq6au302e/cGkXVNId2pwH92vdGIe0d4hhHGj6bzAEMK5y432joukKIB9iLgdLiUNf8VXUkafss62vlfxCH560YZuHNox/gr/7cRSRGt7hmWZ7T0O1tPy2lmhcAnlg0cxKJOqFnilFyWM403kqBE5cDTooDaPr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fEQSxvRD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL0qcs026895;
	Tue, 21 Oct 2025 08:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PlRKub4ZRab2rc3htR2JhHC1Ub/AG26RngoYf/t8lR4=; b=fEQSxvRD3x90XyaB
	DqoYnNmiU7E8nJUHKMsxKXprx31FJojzgpb0w/D2924soZpw/HHpSr+hrOSy0Uqz
	PbTYW/2oBGoDKU/krgiS229yCJGoyV0DwfmGEkJSiubfldGXnrGuJjCKCOVtEPho
	FwSRKW0OA5xyKFWNsx2Wy32Id8DNJX+zSot9Hrg9ED1LFGkzEehyKrVUqjMnMfNS
	gEXRkf9GwiKfMknWcT7pxfUZvzEI0JmaW7CsboHYqgOriUArOZCBuntu7qFeIf/b
	uRO/vAftr0Om0qicq8KRoPcEWAHT/S4xJQtYtOSMBVR7OxRE8AEclXNlXXJQ82VT
	1wwCWw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pfwc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 08:12:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59L8CPLC024746
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 08:12:25 GMT
Received: from [10.217.239.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 21 Oct
 2025 01:12:22 -0700
Message-ID: <c239bce2-4bef-4085-8a74-c6d7c863febf@quicinc.com>
Date: Tue, 21 Oct 2025 13:42:09 +0530
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
Content-Language: en-US
From: Deepak Kumar Singh <quic_deesin@quicinc.com>
In-Reply-To: <15c56c70-928a-4939-86a2-e7b81f1596a6@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX+nOnaz4rmmHM
 zKN8d9+0ckIs1/9AcdxrLVBWbnnhwfvXPRKUUiM+4DrCieE5EDwZ0jOg0cOTxeX5etde8qpOC/N
 wHIX7dj6PmZ2SYoJeFzNDB5vk1aTD7BRwe9Bk5qL+iM5ECoNimlAOSX3pYoWnzj/znbMmkzyspg
 0ZM3iqeHJaGZTQB7JL+88sTu4ai/WAXuzcHSsZBrxxim8pcEBpMoSr89IkANyi5YlsPRtcJf+Hh
 0Fx0aaUGFGSujWPJ63rqpqf/bcw5q8jouWrD/QP4zjNYSVRVd0Cblt+0DRdqGWyIXTwm6cMO1GD
 yWFrPZCm2LSb3qkHxqIpZcIaslyxhJTS8cSrAt8+6Cs4CXQbRBNh4Oeg4Ru8cabql73Wi7RlFPR
 OWGAQw5xJrdplSeNg2J1j7klzHGA5g==
X-Proofpoint-GUID: AbZmesitRKtUVhIJsoKErmOg9XqplUyo
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f7406a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SMMCJtFpidMdBd4wOSMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: AbZmesitRKtUVhIJsoKErmOg9XqplUyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000



On 9/24/2025 8:20 PM, Konrad Dybcio wrote:
> On 9/24/25 6:18 AM, Jingyi Wang wrote:
>> From: Chris Lew <chris.lew@oss.qualcomm.com>
>>
>> A remoteproc booted during earlier boot stages such as UEFI or the
>> bootloader, may need to be attached to without restarting the remoteproc
>> hardware. To do this the remoteproc will need to check the ready and
>> handover states in smp2p without an interrupt notification.
>>
>> Add support for the .irq_get_irqchip_state callback so remoteproc can
>> read the current state of the fatal, ready and handover bits.
>>
>> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>> index cb515c2340c1..e2cfd9ec8875 100644
>> --- a/drivers/soc/qcom/smp2p.c
>> +++ b/drivers/soc/qcom/smp2p.c
>> @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>>   	}
>>   }
>>   
>> +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
>> +{
>> +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
>> +	unsigned int pid = smp2p->remote_pid;
>> +	char buf[SMP2P_MAX_ENTRY_NAME];
>> +	struct smp2p_smem_item *in;
>> +	struct smp2p_entry *entry;
>> +	size_t size;
>> +	int i;
>> +
>> +	in = qcom_smem_get(pid, smem_id, &size);
>> +	if (IS_ERR(in))
>> +		return;
>> +
>> +	smp2p->in = in;
>> +
>> +	/* Check if version is initialized and set to v2 */
>> +	if (in->version == 0)
>> +		return;
> 
> This doesn't seem to be fully in line with the comment
> 
> Konrad
> 
Hi Konard,

Can you please elaborate more on this?
in->version == 0 means remote has not initialized the version yet, so no 
need of enumerating entries. For other case i.e in->version == 1 or 2, 
in entries added by early booted remote has to be enumerated.

Thanks,
Deepak


