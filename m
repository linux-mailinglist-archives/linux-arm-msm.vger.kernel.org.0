Return-Path: <linux-arm-msm+bounces-80770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 235A7C3FDBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 13:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 23A424E7893
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 12:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A683271F3;
	Fri,  7 Nov 2025 12:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fJpGf1I2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8DA2DEA8C;
	Fri,  7 Nov 2025 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762517477; cv=none; b=gLphT6iN8lHmmu3t4HLiUeDmZ8A2LVg5z3riWWUlih5l55cjAXPjGPGZEMu8UXTPgjxmJSRIikJx1D3XMvuw2UL1pmIM4mChWnDeEbLQCPXs6vFP+p3T7p+YYa2H0hia6HK4ZEceE1Y3fysI0VDO8LAoBsia19CaqxWdU5rLvZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762517477; c=relaxed/simple;
	bh=hpVr8iyO7KGqD2WBV4SGKNp+0Tu8kexwAFvNHJZsQLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aWtSyWEPDvLNcEDydoKcduFf0efKeFzhdng+uwpFI0V/YlkPHeuUDSL/UUUZeK9CaLQ5Jq945UQS6qUvOmvCRj6FUDw/6aZDsKWVGVcMcXIkOTpMI43d/PFClH6ebdrSV+XMY6nbBglU6fXAbXfoFpl4lu2N6W35TtsPAkCEDXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fJpGf1I2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A758uSr557751;
	Fri, 7 Nov 2025 12:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKJwrIblNVll+XvukvV4wZxNBbHDoBGgVYbGrDMsKq8=; b=fJpGf1I25+oZVvsF
	+kT9cRiP4mO/XNbfkk1VXzR1t8t6QBSHtTK4QWm+YPI+0noF/4Y6Ex03gijgdRfN
	Uh1xt1mszDB/rBxL+7J1Ov09NzN/BuCoTxKIfjfEDX0G/h0jeDUGzviqoc2ezeX3
	VT9YO0odaGk3XnjWurPbkMNhzLT6d/QJpKRI+LxS0S3NqAe3h/Wp9ua+wgUlGnbk
	1hbVD83cci0sH8od3XzA626YFqG4vYnBzfHJ9+YKEa4YACKH0WHlQBg84Zw8OyI9
	gSFWoLU3iMILOeEGYz71RjDoMWTk4E82Yt3tkg1JRMmhpntTIoC4sGzKAxEK5AYt
	VZkMsQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yr9u00a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 12:11:11 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A7CBBMW025956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Nov 2025 12:11:11 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Fri, 7 Nov
 2025 04:09:58 -0800
Message-ID: <ace738bf-f40f-46ac-9b17-bac658d2a290@quicinc.com>
Date: Fri, 7 Nov 2025 20:09:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: btusb: add new custom firmwares
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        <linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_chejiang@quicinc.com>, <quic_jiaymao@quicinc.com>,
        <quic_chezhou@quicinc.com>
References: <20251107021345.2759890-1-quic_shuaz@quicinc.com>
 <jztfgic2kbziqradykdmyqv6st3lue23snweawlxtmprqd3ifu@t3gw2o4g5qfx>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <jztfgic2kbziqradykdmyqv6st3lue23snweawlxtmprqd3ifu@t3gw2o4g5qfx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=DrpbOW/+ c=1 sm=1 tr=0 ts=690de1df cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Z3BhJ2cJuhskXHIy3gwA:9 a=QEXdDO2ut3YA:10 a=1R1Xb7_w0-cA:10
 a=OREKyDgYLcYA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 0NKRCAy15mT4tuWyXgxV_4RLIx39QKIl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA5OSBTYWx0ZWRfX90rD9E6BZHBk
 hqE5Z9YGHFBYGqniqdiuPdmKfweVOmZXxqwZr4sfp3ZC9oTRhbmd8Vk6ZSPbYd2gu1+bEyFRDpu
 pySUw48PMgM8kQUuH9FfHrgL8sEXaJDftjq9dGANseWDbTfV7HbTE+8m2OLNmmkWvt0J7dVFkvD
 mPNs8OacUdDTZcQqxzdT1ttl28HxYHWBeRnL1LMo6bdVgooiilUBB+EG15t3q6IXc5pEOsrOsnf
 iVJkvpPoybVHHojjs7L5kjlTQJrkmIT8vsOzDWFuik//E52ZdVvpmrTCZlkaRXsY36Jvz4/HV7A
 XSikZZMtfM/FkH4wbrTlrI9l8wSAmyd7lG8tpbLzshtTfdQre+ySuQKyjrf9waDkdcVRua41i4p
 3HfVLt4pf3E5g1QdCIc7oXfklZ6r7A==
X-Proofpoint-GUID: 0NKRCAy15mT4tuWyXgxV_4RLIx39QKIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070099

Hi Dmitry

On 11/7/2025 11:13 AM, Dmitry Baryshkov wrote:
> On Fri, Nov 07, 2025 at 10:13:45AM +0800, Shuai Zhang wrote:
>> There are custom-made firmwares based on board ID for a given QCA BT
>> chip sometimes, and they are different with existing firmwares and put
>> in a separate subdirectory to avoid conflict, for example:
>> QCA2066, as a variant of WCN6855, has firmwares under 'qca/QCA2066/'
>> of linux-firmware repository.
> 
> These are generic phrases regarding QCA2066. Describe why and what is
> done in the patch (e.g. why do you add new entry to that table).
> 
>>
>> Cc: stable@vger.kernel.org
> 
> There is little point for CC'ing stable if this is not a fix (and it's
> not, it lacks a corresponding tag).
> 

I tried not adding Cc: stable@vger.kernel.org, but this question occurred.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree."



>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> 
> Please migrate to the @oss.qualcomm.com address.

I am currently submitting an application for an OSS account.

> 
>> ---
>>  drivers/bluetooth/btusb.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>> index dcbff7641..7175e9b2d 100644
>> --- a/drivers/bluetooth/btusb.c
>> +++ b/drivers/bluetooth/btusb.c
>> @@ -3273,6 +3273,7 @@ static const struct qca_device_info qca_devices_table[] = {
>>  
>>  static const struct qca_custom_firmware qca_custom_btfws[] = {
>>  	{ 0x00130201, 0x030A, "QCA2066" },
>> +	{ 0x00130201, 0x030B, "QCA2066" },
>>  	{ },
>>  };
>>  
>> -- 
>> 2.34.1
>>
> 

Best,regard
Shuai


