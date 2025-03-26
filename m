Return-Path: <linux-arm-msm+bounces-52516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF81A7142D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 10:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EAE23B8675
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 09:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42E81A23AC;
	Wed, 26 Mar 2025 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kQs7lNn3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F3D15C15F;
	Wed, 26 Mar 2025 09:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742982847; cv=none; b=ABwDYpy3tgHyQ2PueyY0VDczJJsHsv7QyC8j3YTVV3IRxLdUgCmKie1HkGnT9zQJY6aeQO3BPXiflFyZuvJGS7rVsJMCSiWQbKohg4PpGa09HrnV3k82nR/+2+75g+Rv7oayDvta3LLVN2IAsU58HgonySXi2rKzelsq7cfDIR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742982847; c=relaxed/simple;
	bh=k3xOx2L5T5uwhIlLEsuP7+yjMjaqocpL/LO1sdtSp6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=B23FkWuBQKupWBei8N8+PraFFyI/9zuGzQlw+koHI1d8kUqRHtzZeuDoIIWANZaJjA53L+TQOkuo4+b/wepfcjA8Lro7u52mVm2vnIU9SwoJjeSS5E4B1eRvvu/Nm6tvVsAxG10nP9G7mrCGVSG61y6ahdW+rfKlAmTMZik4mSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kQs7lNn3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q73Aof014495;
	Wed, 26 Mar 2025 09:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ceZG7l6B0d1+aYQcqeMCmDD0PGRx5R8qbIHuQdIywsg=; b=kQs7lNn3wot6jpCw
	TxzSYiigHdUuOOzzRMfCRqdwW8eOPrsYwK+wBwroqug3aMJ9ozZHufa+wwkdmasF
	JOpYO+fMO8i142VdbNDshvTJo4OK7kwzO4KlvzKcXDbQ4JC1WF5uiT2ba4tui43t
	fzc2T61+0edmUvS8/+5gLLIrDN+Kawk3/5z0em9Q5qW07/rHouufBKymL1heDCoi
	hzw95JS2XKj68Ypah0covKGfOPwkLQ/RoTnEj+tZJY5VihAs6aV63BMJaK3onD2X
	IwiGKjkdKI6iT7HzxJDD/a7sjxFX7aKo0Am791yO3HuyYvLAdB1VHy0C8yJQUlsf
	OfPYWQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mb9mrrwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 09:53:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52Q9rnfL023987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 09:53:49 GMT
Received: from [10.217.217.240] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Mar
 2025 02:53:45 -0700
Message-ID: <33c03e94-5e8b-44cf-be32-fb571ca73a17@quicinc.com>
Date: Wed, 26 Mar 2025 15:23:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ufs: qcom: Add quirks for Samsung UFS devices
To: Bart Van Assche <bvanassche@acm.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
References: <20250325083857.23653-1-quic_mapa@quicinc.com>
 <c0691392-1523-4863-a722-d4f4640e4e28@acm.org>
Content-Language: en-US
From: MANISH PANDEY <quic_mapa@quicinc.com>
In-Reply-To: <c0691392-1523-4863-a722-d4f4640e4e28@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cs+bk04i c=1 sm=1 tr=0 ts=67e3ceae cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=knVEYwfTpz3OwYGDc58A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 5pM4El_C-nyUT3i7996LadfatyjJQgU-
X-Proofpoint-ORIG-GUID: 5pM4El_C-nyUT3i7996LadfatyjJQgU-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_02,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=589 malwarescore=0 lowpriorityscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260060



On 3/25/2025 5:12 PM, Bart Van Assche wrote:
> On 3/25/25 4:38 AM, Manish Pandey wrote:
>> Introduce quirks for Samsung UFS devices to override PA hibern8 time,
>> PA TX HSG1 sync length, and TX_HS_EQUALIZER for the Qualcomm UFS Host
>> controller. These adjustments are essential to maintain the proper
>> functionality of Samsung UFS devices for Qualcomm UFS Host controller.
> 
> Which of these quirks are required for all host controllers and which of
> these quirks are only required for Qualcomm host controllers?
> 

PA_TX_HSG1_SYNC_LENGTH and PA_TX_DEEMPHASIS_TUNING are specific to the 
Qualcomm host controller.

The QUIRK_PA_HIBER8TIME may also be necessary for other SoC vendors host 
controllers. For instance, the ufs-exynos.c file implements a similar 
approach in the fsd_ufs_post_link() function:

ufshcd_dme_set(hba, UIC_ARG_MIB(0x15A7), max_rx_hibern8_time_cap + 1);

https://lore.kernel.org/lkml/001101d874c1$3d850eb0$b88f2c10$@samsung.com/

Should we consider moving the QUIRK_PA_HIBER8TIME quirk to the ufshcd 
driver? Please advise.

>> +    equalizer_val = (gear == 5) ? DEEMPHASIS_3_5_dB : NO_DEEMPHASIS;
> > I think that the parenthesis can be removed from the above statement
> without reducing readability of the code.
> 
> Thanks,
> 
> Bart.

equalizer_val = gear == 5 ? DEEMPHASIS_3_5_dB : NO_DEEMPHASIS;
equalizer_val = (gear == 5) ? DEEMPHASIS_3_5_dB : NO_DEEMPHASIS;

i have used parenthesis for better readability and to make the 
conditional expression more explicit.

Thanks
Manish


