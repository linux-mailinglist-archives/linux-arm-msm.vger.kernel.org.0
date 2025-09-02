Return-Path: <linux-arm-msm+bounces-71673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98399B40B1E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 18:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 419D53ABE31
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AF131353B;
	Tue,  2 Sep 2025 16:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WePLZTkW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8ED4414;
	Tue,  2 Sep 2025 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831957; cv=none; b=LbuTezHw3IrQvwpmG/Q7LAUEXyExmX8BUx0oyGYhlgFoohI8NzcQI64aVmBbT/ZKFChbOagXTMVi1vQWAIVq62er1xReZzxX+dpsa1C2JXoX9+PkCvVdRrtet8mAYBT50V2SjUhgIj5SbHC9oRQGvoPGEobcD9mIrcdNVxEThuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831957; c=relaxed/simple;
	bh=vUXypJ18lQCM+xP/e8NI3zmL2F363vWlFGuHjpHKdRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T+dJAituzdf5g0+9nRfeUinTHefbbB3L0ZkaAIUKt37orEOMIRzGmt3/bMrShvPoIQUlb0X7qy/llyX79oLz9QK1qpYM9byDO8upYuOxS4wOPB/C8D2uFtW9jBeyXJVHZuMOEMIwk9c1FYS3pn+g+1hxaXUPjpzDpQLbktIjcNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WePLZTkW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqAXX023418;
	Tue, 2 Sep 2025 16:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EfhDgAtwv6P38F7QKMGTLu24j05KdSW6kvsh3bBpKnk=; b=WePLZTkWJYnZlMxZ
	QJkjPjlsrySr+yl+jDp1uRUhBqWx6XhIV5IJ3dmqoXXYKtvDeB9mSb3ehaLePfjd
	GokNgqIb8Ead/bj9U580qlkFveSZJKmCbE4Ib68BKC2DRe2ZkeGTh0YBp3Qch7CI
	2xiMvhFLsKXMALwgvWVXPqzdBO+543l9w9eoRbcaO4+uA0gWnrwBx5M3YvDUo2Q4
	kUzhSyPnUL3CjGijshOcvvktLpmPh/DoB6HhofDIcf7MbULUoR7dh+WIakE7WEGl
	tYiZts29TY4bTjv7hx/pzopztycwls6SJBnDyykiqFia2+0IN7QBTuVC9jNH0DiA
	KEXySA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp8s5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 16:52:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 582GqLlf003891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Sep 2025 16:52:21 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 2 Sep
 2025 09:52:16 -0700
Message-ID: <0107dcce-45cb-419f-814b-3eccbbbe628d@quicinc.com>
Date: Tue, 2 Sep 2025 22:22:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/4] ufs: dt-bindings: Document gear and rate limit
 properties
To: Krzysztof Kozlowski <krzk@kernel.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <bvanassche@acm.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20250901155801.26988-1-quic_rdwivedi@quicinc.com>
 <20250901155801.26988-2-quic_rdwivedi@quicinc.com>
 <5cbfa653-03c3-41dd-a309-406eaf3b6033@kernel.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <5cbfa653-03c3-41dd-a309-406eaf3b6033@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jmrf0Wd2ZfccECOcCgtmPPvkmmJAsBOd
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b720c6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=hsxNhXGD_D1a_R53JcAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jmrf0Wd2ZfccECOcCgtmPPvkmmJAsBOd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX5YGkezkKtL+t
 19eaxxyMb+aTPAaRP6PaCXCVx6R/KHzsVxzxG7q4hsXPnBlmIQS3jevRal3jEwGBAqp3MWk92lE
 mRwMz+lQnFuw+oLRjFThWP659IpcgDnT9GAnkIYbtrfGGmaGmeLV4KaJAS4iZpZ3CF+x6faV5uI
 /Hb0EedfjLD8ZiSv4t4ljVpiIxjkP/iHnZtDeCeLU2545t9a2w7yOxRpAL272xYC3apIc+TMEHn
 DGnVDgAOHQ24g4mRybnePHWSnyFjL2YE51KW/kVX6J0aQK0hXlz0Lbi46n6J3+09EdgSIm4nCl9
 yNzdV5O8gl3C8KBQDdjkv0xv+0HoJebCNG9Di2q0GH4GzsUQ8LabcGjeTk60RgygoJKs9F1Dg45
 5ewyXtbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001



On 02-Sep-25 11:42 AM, Krzysztof Kozlowski wrote:
> On 01/09/2025 17:57, Ram Kumar Dwivedi wrote:
>> Add optional "limit-hs-gear" and "limit-rate" properties to the
>> UFS controller common binding. These properties allow limiting
>> the maximum HS gear and rate.
>>
>> This is useful in cases where the customer board may have signal
>> integrity, clock configuration or layout issues that prevent reliable
>> operation at higher gears. Such limitations are especially critical in
>> those platforms, where stability is prioritized over peak performance.
>>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> ---
>>  .../devicetree/bindings/ufs/ufs-common.yaml      | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>> index 31fe7f30ff5b..b4c99fee552f 100644
>> --- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>> +++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>> @@ -89,6 +89,22 @@ properties:
>>  
>>    msi-parent: true
>>  
>> +  limit-hs-gear:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 1
>> +    maximum: 5
> 
> No improvements.

Hi Krzysztof,

I have updated it in the next patchset.

Thanks,
Ram.> 
>> +    default: 5
>> +    description:
>> +      Restricts the maximum HS gear used in both TX and RX directions.
>> +
>> +  limit-rate:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    enum: [Rate-A, Rate-B]
> 
> lowercase
I have updated it in the next patchset.

Thanks,
Ram.> 
>> +    default: Rate-B
> 
> 
> Best regards,
> Krzysztof


