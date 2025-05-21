Return-Path: <linux-arm-msm+bounces-58965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9349DABFF63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 00:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE91B18964CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 22:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADB9239E6C;
	Wed, 21 May 2025 22:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RwmDeznQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40024148827;
	Wed, 21 May 2025 22:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866128; cv=none; b=ftIr8OHyMvuLu8YfaIT/MGy4blwBaLwuHj6Bh/Pl6c6UGEJF+jDc7eMW4Z2otKQuwET4bTiraau8ha4rJrnBekS8WZCBC8r9j/0OE/hm3KuI1lktRJocd1Iw7XMPt2pbbSBjCqPa6jN+3zQrQ8cSfhQSkV5Rr6/ZwZcFmkrTWzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866128; c=relaxed/simple;
	bh=vA/MxhqO8bqOwQ/qQYUCbyCoqzwivcp7M67bymdZDrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=csBpIxwC++H3yEy7arK3CaF3Wq8yNCsyxkEJCsphit/+Mf1MkVbr3vUKKOsfcXa3UUWl8RYkJJoK2O7lbM1ScoOXY53e94tatcHqNOgETWVtqUHhRFImZ3jL9dTaUKLNazTfvBr42JwrnamfvUMONJV/VNhhAbzQVyDMmZFn3ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RwmDeznQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LI2OtK031724;
	Wed, 21 May 2025 22:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POcXLIudDGVcz6rdm3O49J2/G55IJi0wf+rYtTutV1E=; b=RwmDeznQ4sPduLK/
	SVwv1AJDFndXkGloLCmpMJ//VS1Mi95FqlFbRgPqKGCzB65QOu2XJ262fyCVlqZS
	pseIZwpvFG24VIhEISQHaUecQqyEGwm0YPfcn32cujxgSna2RWZ38fIjaOiqZ4Fu
	K7nbn8Lyk+YIYBwv1u1cbbtCMfB107QNiTW2CLNPbu99blYzcbQXTh4ZOpXVw/fZ
	Rz190knd9B5sGVuy5V6/bUn/Mb6xBUeiOaNwOwMS+6Qx5NRqIV0ybRNHHsCThdOI
	vPH1+oiwAhwjrwhPJy59H3I+UTIyaHe75GcV2eHP06gNyZkEsKv29Bvcj5DWS383
	4zazCg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c22wb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:21:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LMLdgh009813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:21:39 GMT
Received: from [10.216.45.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 15:21:33 -0700
Message-ID: <e04f35f7-f4b3-4269-8524-b6aaeb1ace0c@quicinc.com>
Date: Thu, 22 May 2025 03:51:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 11/11] scsi: ufs: qcom: Prevent calling phy_exit before
 phy_init
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <andersson@kernel.org>,
        <neil.armstrong@linaro.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <konrad.dybcio@oss.qualcomm.com>, <quic_rdwivedi@quicinc.com>,
        <quic_cang@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-12-quic_nitirawa@quicinc.com>
 <xxkv25y4m2lr6746fddzlxmgmgqazdqh2pjfzymuatkmrthsnw@6i52rpntjl34>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <xxkv25y4m2lr6746fddzlxmgmgqazdqh2pjfzymuatkmrthsnw@6i52rpntjl34>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIyMiBTYWx0ZWRfX3QPt0jfG8roO
 9QAgJ1YvYP0ggtHPeilULKSwzM1pZHmLkq2bZXhkfeL2elsv9MZB0d7jHpdNLXYCIb2D6JUNj6C
 w+NpWuAvRXO+sHviEC99kVydIqFvBVhbyIs0PuhKxEG90DWJEHFVisV10s297fRmkGXVaEINS34
 JyTonX4pAzBK18JjfzfZjxCfIzSJh1b91BsBlBNMUzth1Kk5qJQi0FwX0OqrfuLpymsarli+kYT
 N20yuFr0dlF+VEKnhPB+j+UrQ/sx7N8VBrpO6wxx7R4BDr+Mhy3WA6WY1C9051OB/K4jEyTEBFq
 GK79dYTkt11crIxUFwXAzcWADJSQQ0KwwpucooKTTyQCL28h9MaXtLTztITgr4M2M51KeKTEB4p
 3d67NLsBrsNwkLYmsGfXyyYJfW6B0rbgnc1FLhPBYITFKKyjX4PigYn5RS8oiYWnQPhUWV6U
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682e51f4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=mrhtVqWoyDjAaArD0-sA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vn7evCruDhawtzabzytE2MzsdJMgj9DQ
X-Proofpoint-GUID: vn7evCruDhawtzabzytE2MzsdJMgj9DQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210222



On 5/21/2025 7:35 PM, Manivannan Sadhasivam wrote:
> On Thu, May 15, 2025 at 09:57:22PM +0530, Nitin Rawat wrote:
>> Prevent calling phy_exit before phy_init to avoid abnormal power
>> count and the following warning during boot up.
>>
>> [5.146763] phy phy-1d80000.phy.0: phy_power_on was called before phy_init
>>
>> Fixes: 7bac65687510 ("scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()")
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> You should move this fix to the start of the series so that it can be applied
> separately if needed and also to be backported cleanly.

sure , will move

> 
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 583db910efd4..bd7f65500db7 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -540,7 +540,6 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>>   
>>   	if (phy->power_count) {
>>   		ufs_qcom_phy_power_off(hba);
>> -		phy_exit(phy);
>>   	}
> 
> You don't need braces now.
will remove.
> 
> - Mani
> 


