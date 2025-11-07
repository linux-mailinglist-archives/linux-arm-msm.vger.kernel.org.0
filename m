Return-Path: <linux-arm-msm+bounces-80690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE51C3E5B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 04:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE1693AAD08
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 03:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BA013D891;
	Fri,  7 Nov 2025 03:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tjf0XBXd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFD51E32D3;
	Fri,  7 Nov 2025 03:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762486614; cv=none; b=pIn5sJl0GcUUJUyIwW4lXOinynfFGTIgiOL2pjq1fYXFI0zCf4DHTAbcpV8lg1izYmGxSoNjRkHFbLrKUyzKjQSG2wguCL06m0a0XkAxQRFcqwDb8ZKu00+NoraymcvwK40eQC4jkyQyY3mE31hD4Sk0cyghhdfuGX6TPBa8oQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762486614; c=relaxed/simple;
	bh=nVriIHzmashBkCW2VFpuMwrSeYJMPKJ3QDEHWU2OVgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AbRegyl9cmuNaHMIZn7B8tLIdUCyhXIP8zMBHzAyMydJ1dmptjOqdv8QdO1+izIkdYxtXk+bOTpbOBo+/W1A3VAUjEK5QHyVX7k6UywuxvaDfuvq0+2Nhoy6Jt1C920xcY9pwVxQOv9gaSZZza5bdNBOiYBo5u7X5GS6TiHaKJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Tjf0XBXd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6Ndjeh4131640;
	Fri, 7 Nov 2025 03:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nf8RXttBqHji/3Sicd9Mom5Ri4WDh6MyyrJMGfCdhZ0=; b=Tjf0XBXd7Ad02lNR
	o5WefUVdELiW9gBsyOllUN45CgFtE2QFQsC3YB8m5KQdcwp6zzAnKIzJ18WnjMxC
	op5RRsoIDde0cPVhFBwOya8AWbLttMIkoF5AnwIdaiVsjZ61MtonVl4EtC1GKWPp
	I+77fx1KCYbW3jLReMIornM9+7ujwbBtZks56iRIKkSKDP4qDWqJfGHYUpFWrilY
	LQ/x/I1xBdr2HH/vtkTd4tlVDpj8o4uIwicz1BIMnPCkTNyW5UGItzutDTB3G4OE
	uwX7wWYAMfZ9RHv4Nvt2LaU0SvwM+N2sZvS9BbeKIzwberqX+ZIUBtB45CUdmnQE
	F5aUvg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x2k0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 03:36:38 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A73ab6e019243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Nov 2025 03:36:37 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 6 Nov
 2025 19:36:35 -0800
Message-ID: <d0dca2e9-ccbe-4c3b-9008-80f0030d39ec@quicinc.com>
Date: Fri, 7 Nov 2025 11:36:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Bluetooth: hci_qca: Convert timeout from jiffies
 to ms
To: Paul Menzel <pmenzel@molgen.mpg.de>
CC: <dmitry.baryshkov@oss.qualcomm.com>, <marcel@holtmann.org>,
        <luiz.dentz@gmail.com>, <linux-bluetooth@vger.kernel.org>,
        <stable@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_chejiang@quicinc.com>
References: <20251106140103.1406081-1-quic_shuaz@quicinc.com>
 <20251106140103.1406081-3-quic_shuaz@quicinc.com>
 <3676d7e4-5a28-4e8a-bc55-1386b4fbc58f@molgen.mpg.de>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <3676d7e4-5a28-4e8a-bc55-1386b4fbc58f@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAyNiBTYWx0ZWRfX+tg7KLcQ/cxR
 CuWXlXb2/72+nfDGM7i/ZKUpdE6483O/OjDK5b43GO5hxZTnVCcnyU1BEOlJvA39qWMdVlP/GxG
 pp6k7qsuZ/jeqYzuOfpj/aU92CmdaNMoNReyWBNKIHxraL86bRwbUnNoxhI+y2I8r7zKHdpMEvX
 k5ZyiGc6wbJN3GG6K0GX3DRartuX/89l/6DH2otSqT9HqlXeFf7ewWtVLh18KaQGTnSPltNBxab
 nkOR8ilAKSCP/tXkxmZ5ixbolpRTBs0ehJ3G3Y9mlivTMBZocWjMOcSSDIWa4e2GQcFI35iLkRT
 oGQcpSUYozR1D6aukbwU68soKWXsJMH2NeaKcNejjGdg+NH5p7WY/cixhD+IgROViilBU/Xf0Zi
 gEPVosy0NHZy/p0ouBELLVTxG9aKNQ==
X-Proofpoint-ORIG-GUID: CUSZOZYcoMoyewKP-UNk6lqjLecc1v5i
X-Proofpoint-GUID: CUSZOZYcoMoyewKP-UNk6lqjLecc1v5i
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690d6946 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=aVdW3E6abQPMYJYOtfMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070026

Dear Paul

On 11/6/2025 10:27 PM, Paul Menzel wrote:
> Dear Shuai,
> 
> 
> Thank you for your patch.
> 
> Am 06.11.25 um 15:01 schrieb Shuai Zhang:
>> Since the timer uses jiffies as its unit rather than ms, the timeout value
>> must be converted from ms to jiffies when configuring the timer. Otherwise,
>> the intended 8s timeout is incorrectly set to approximately 33s.
>>
>> Cc: stable@vger.kernel.org
> 
> A Fixes: tag is needed.
> 
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>   drivers/bluetooth/hci_qca.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index fa6be1992..c14b2fa9d 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1602,7 +1602,7 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
>>       struct qca_data *qca = hu->priv;
>>         wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
>> -                TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
>> +                TASK_UNINTERRUPTIBLE, msecs_to_jiffies(MEMDUMP_TIMEOUT_MS));
>>         clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>>   }
> 
> With the Fixes: tag added, feel free to add:
> 
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> 
> 

Thank you for your suggestion. I will update and resubmit. 

> Kind regards,
> 
> Paul

Best regards,
Shuai


