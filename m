Return-Path: <linux-arm-msm+bounces-55031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7DBA97F16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 08:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4216F17A933
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 06:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8994266B54;
	Wed, 23 Apr 2025 06:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D/ggPlTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA179253F35;
	Wed, 23 Apr 2025 06:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745389522; cv=none; b=W+cDpeF+GsrQahtUqdsYXKjLXyIt1k4I5Bi9KwyMwbU2m3OB59ajZrKhbFcJz2xO1atiEoQ+U5xdhdyrDGiXIvaFbcGG09fFn232Tkctdxzushy+9UPE1VznQkgOcNJ+ZTzJC7VWUQF93EtYW/rkP4Q9oF9+XMYmfhmT8dTwLYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745389522; c=relaxed/simple;
	bh=6qnxKc0f9rvCcfHiQkorFfqk2KNxYLg7OSH1dxyGexA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iGe+hW9bAYNTdw5s7YcWQXa227DwMOg7QQqf7ZaTz+DfAZVKoi5HK4r6p31gAIPfbgYASOXvRk1oXxnj5v8x1h2dytSU2WqSJCjo6yEykeRPumeLj1UuuYdejHCtrPXom4++lKVbRHHEZEb06N8S+0BfWML0lbb5AbUgVSnEbHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D/ggPlTa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iAbp016181;
	Wed, 23 Apr 2025 06:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0h6gBE7xHeyNQK25TtzLbx21KR/zAHGHaZbS28nq3k=; b=D/ggPlTawwKCL/d/
	rGp2zjTrNVlLWqhuogssAKtRWfLzUo2TcKo636nkR3vWE1K2eC/Cx90Dg4Rwmzp1
	VD06+yb48PudFD1rh8gRLAbjeZc9+qQToO1WR675/3pcKV6IrNGzBRH9xkG7/uXR
	B21Wi5vcKQxYqcMGVKFTFE9Ip094rnZ2zvmfUFS8lYve149bpuJB8OUYHYD7uTy5
	+m5QjqYhNqYi9iQS186fHQCiqb4OrKBpCNsjzFWevvQhnTt+rA0kfNtzsj5leM1h
	7byVWxGebwa1SH90FSNxbP4aL9GximqnNfoDzPFeRY/bcyLBuSR+uDiRxGmIwef2
	C2kEZg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3h2pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:24:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N6OoCR023755
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:24:50 GMT
Received: from [10.216.16.5] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 23:24:45 -0700
Message-ID: <e7717264-a975-475b-8db3-be360e0edd6f@quicinc.com>
Date: Wed, 23 Apr 2025 11:54:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/3] scsi: ufs: qcom: Add support to disable UFS LPM
 Feature
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "beanhuo@micron.com"
	<beanhuo@micron.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "mani@kernel.org"
	<mani@kernel.org>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
        "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
 <20250417124645.24456-4-quic_nitirawa@quicinc.com>
 <070f15425ba2535a0bb165d61243dc3e3f63d672.camel@mediatek.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <070f15425ba2535a0bb165d61243dc3e3f63d672.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Vzsk_YJ29Xg95rd4mOVhZvLW7ll_ib7K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0MSBTYWx0ZWRfXw+qCni5+e+1f LtdozlQo/cEe50VzU9D46YqZV5J275eGkDi6REMc7hSwwTi2AdLokQNHIwUHEpMxZP8Rb0Z13de rIgTlnF2QojfB6NbwtMRHi9xeZ6FuwvNbssy2rMKsgeuiTfRzqIz+Dyap4X3nliVrcGLO65Tpwd
 c+4cM8oBQ933onL70xv+J2yfQdQXqzMaBYIXGvZxHTjyMaBrbgTR5Sw4dbsmYydPUjoezDnsfJh updt9t2Gmhju+74kb4hhR4akvxcjjMo5LAG4g6Rjx0k4EgJbiHspCDFFKic4YGHwDzNP7IeIE57 LlfWPck0zIFbsVNmd/Z5HsYqucKOpBLTYXJFoaLcLh4kek032h4HlK3N4ClUKb2XeaM5TGLaZLl
 xaJldH1MRAGUZpGvh3fSI/XVALoZJs7Ru5qQSztyshIMIEskuJont5Hu4MaqDDezWUEzBuU4
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680887b3 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=DBNj-jGEmPe37kIgScQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Vzsk_YJ29Xg95rd4mOVhZvLW7ll_ib7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_03,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=848 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230041



On 4/23/2025 10:30 AM, Peter Wang (王信友) wrote:
> On Thu, 2025-04-17 at 18:16 +0530, Nitin Rawat wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> There are emulation FPGA platforms or other platforms where UFS low
>> power mode is either unsupported or power efficiency is not a
>> critical
>> requirement.
>>
>> Disable all low power mode UFS feature based on the "disable-lpm"
>> device
>> tree property parsed in platform driver.
>>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-
>> qcom.c
>> index 1b37449fbffc..1024edf36b68 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -1014,13 +1014,14 @@ static void ufs_qcom_set_host_caps(struct
>> ufs_hba *hba)
>>
>>   static void ufs_qcom_set_caps(struct ufs_hba *hba)
>>   {
>> -       hba->caps |= UFSHCD_CAP_CLK_GATING |
>> UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
>> -       hba->caps |= UFSHCD_CAP_CLK_SCALING |
>> UFSHCD_CAP_WB_WITH_CLK_SCALING;
>> -       hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
>> -       hba->caps |= UFSHCD_CAP_WB_EN;
>> -       hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
>> -       hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
>> -
>> +       if (!hba->disable_lpm) {
>> +               hba->caps |= UFSHCD_CAP_CLK_GATING |
>> UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
>> +               hba->caps |= UFSHCD_CAP_CLK_SCALING |
>> UFSHCD_CAP_WB_WITH_CLK_SCALING;
>> +               hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
>> +               hba->caps |= UFSHCD_CAP_WB_EN;
>>
> 
> Hi, Nitin,
> 
> If hba->disable_lpm is true, WB should enable?
> Normally, you don't care about low power, so why wouldn't you enable
> WB?
> 
Hi Peter,

Thanks for review. Agree with you.
I will update this in next patchset.

Regards,
Nitin


> Thanks.
> Peter
> 
> 
> 
>> +               hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
>> +               hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
>> +       }
>>          ufs_qcom_set_host_caps(hba);
>>   }
>>
>> --
>> 2.48.1
>>
> 


