Return-Path: <linux-arm-msm+bounces-73956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14497B8004A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2D47163C09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A283D2D7DDD;
	Wed, 17 Sep 2025 14:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S9LDaaun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010362D4B71;
	Wed, 17 Sep 2025 14:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119401; cv=none; b=IzYUVq2fHRFoF9GGhY2oQ1yOl6J3lSis7+Go1nDQi6lPlE59Gq3emRVzvC3Jo5dGNUvqfeTZ3/VYjoZA3rjFlwlEM+P+gR1rQBhPZoRRu1clkz1MYjK5D2nCpiLSI0v0h5X6OnFcLASPUyKS+Vzuk8TfhpKRuVVHe6DMARg2S/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119401; c=relaxed/simple;
	bh=6AC9IsRJupEPZp611yucaK3pIYA+QofGgL5/NzSNUgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uNSBOED+6iaLueZsuv6pS6uOyc+6Ln5EODgM8N5gpukwFwUYh0uk6QQi2M7g3rOfT8typIvkf4rseteOjYA1RgZOpZNoWZgYDiM5ssztnIempE/1fMltnskB0OFjkAmTUZU4WSpBNSXSatxqU6YPEXw6fct4S5iF/r4HoAgrOo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S9LDaaun; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XfmS010827;
	Wed, 17 Sep 2025 14:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jawXIxis37bWIPOnqourLw0/qXEIwvwtvxlta3lSn7I=; b=S9LDaaunSk35t9We
	wqxw2m5U488RVf+3I1tfmC8Cs6JIYP2+9QEfSzdXUAnzgCIiS3cRMWROyuWqvpcB
	6ZOQsGTUxu2uPDc6bsLfPDjM1f73fJRYk5Bt5pS/cuxD5lgvSdHga0d3Pjb1FK75
	/WQW04C4/UfOiP4yoc2tCuot48MxZWQ0KUADbY6lxlhUEreN7l2IduTX014kLyXW
	vXCDGIKdh6RaoRqQ2KkqTwQQfBCSXe9665dE+jbqrUXfyDv+DqeI5ofHHExVlzpc
	sGZlI4KMgF7yBcKEa2718wS8EqfDGzrJWq4fBDRTD8l/7sWXKcNygUWePGCo5hHB
	YjugkA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxtp9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:29:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58HETl9v012967
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:29:47 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 17 Sep
 2025 07:29:43 -0700
Message-ID: <8138a25e-eb1b-4edc-92d1-270066b8fc85@quicinc.com>
Date: Wed, 17 Sep 2025 19:59:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 2/4] ufs: ufs-qcom: Remove redundant re-assignment to
 hs_rate
To: Alim Akhtar <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
 <CGME20250902164935epcas5p14139d20b5d385b99edfc0da60865dd98@epcas5p1.samsung.com>
 <20250902164900.21685-3-quic_rdwivedi@quicinc.com>
 <3a9201dc1c8e$affa1c10$0fee5430$@samsung.com>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <3a9201dc1c8e$affa1c10$0fee5430$@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX0z6uE4Lx1C4G
 NL+W9Rd4ytpvINNx8Z45mZuF697l16+nWLfZumhOpeosTWQvPaRR/QlmMYA522ZvC9SH1fuOLbj
 SN1LfnMT72plrSm9wEvPC6FYQkYIsoYNU1CHph1qfdBduju03AyzMhbM4UiJFuckAzGEcsGvD+4
 165+wp8P3P/bPk97+WK1+6IALNaSOnjZpi6GLmw238XIiG+1zb4KjsfypYqhyuutamLt9hKwr5n
 45UXPgbsREISEn5o+NvzyHSlAeUdz7GfT4k8Uu34Q/bd6cRPU5+dc2sOptB55Do6kom+U+Oy3Pl
 dtofFuMizxwjPnCD2mBmz+8WncKRSVLDUgmw/y8rwxKZCOQ+YsmtRVfvq5Ar+ZrchMThcAnmL73
 eU8rtdKo
X-Proofpoint-ORIG-GUID: Zp6r04OFxRdBFBG5JyIeQwTXDFXOnjmT
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cac5dc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=hD80L64hAAAA:8 a=JF9118EUAAAA:8 a=N54-gffFAAAA:8 a=VwQbUJbxAAAA:8
 a=bLk-5xynAAAA:8 a=yPCof4ZbAAAA:8 a=OIpetahlEYfThk03V3EA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=xVlTc564ipvMDusKsbsT:22 a=zSyb8xVVt2t83sZkrLMb:22
X-Proofpoint-GUID: Zp6r04OFxRdBFBG5JyIeQwTXDFXOnjmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202



On 03-Sep-25 10:23 AM, Alim Akhtar wrote:
> 
> 
>> -----Original Message-----
>> From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> Sent: Tuesday, September 2, 2025 10:19 PM
>> To: alim.akhtar@samsung.com; avri.altman@wdc.com;
>> bvanassche@acm.org; robh@kernel.org; krzk+dt@kernel.org;
>> conor+dt@kernel.org; mani@kernel.org;
>> James.Bottomley@HansenPartnership.com; martin.petersen@oracle.com
>> Cc: linux-scsi@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org
>> Subject: [PATCH V5 2/4] ufs: ufs-qcom: Remove redundant re-assignment to
>> hs_rate
>>
>> Remove the redundant else block that assigns PA_HS_MODE_B to hs_rate,
>> as it is already assigned in ufshcd_init_host_params(). This avoids
>> unnecessary reassignment and prevents overwriting hs_rate when it is
>> explicitly set to a different value.
>>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> ---
> Better to send non-dependent patches separately.

Hi Alim,

Thanks for the suggestion. This patch is essential for our
ufs-qcom changes to function correctly. Without it,
the rate limit would be overwritten.

Thanks,
Ram.> 
> Feel free to add:
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>  
> 
>>  drivers/ufs/host/ufs-qcom.c | 8 ++------
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index
>> 9574fdc2bb0f..1a93351fb70e 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -494,12 +494,8 @@ static int ufs_qcom_power_up_sequence(struct
>> ufs_hba *hba)
>>  	 * If the HS-G5 PHY gear is used, update host_params->hs_rate to
>> Rate-A,
>>  	 * so that the subsequent power mode change shall stick to Rate-A.
>>  	 */
>> -	if (host->hw_ver.major == 0x5) {
>> -		if (host->phy_gear == UFS_HS_G5)
>> -			host_params->hs_rate = PA_HS_MODE_A;
>> -		else
>> -			host_params->hs_rate = PA_HS_MODE_B;
>> -	}
>> +	if (host->hw_ver.major == 0x5 && host->phy_gear == UFS_HS_G5)
>> +		host_params->hs_rate = PA_HS_MODE_A;
>>
>>  	mode = host_params->hs_rate == PA_HS_MODE_B ?
>> PHY_MODE_UFS_HS_B : PHY_MODE_UFS_HS_A;
>>
>> --
>> 2.50.1
> 
> 


