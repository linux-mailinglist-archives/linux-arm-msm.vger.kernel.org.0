Return-Path: <linux-arm-msm+bounces-58770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6F8ABE329
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 20:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 700963B368D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 18:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBF926C390;
	Tue, 20 May 2025 18:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cBANUNKC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4654B7485;
	Tue, 20 May 2025 18:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747767010; cv=none; b=LkCtmjAoky19WH08rucUpW078cixrm7Z8KNhwqR9ncqLXnXJqYxw9Y5/dy4oQ+Qd/7npiJm0KeCavtyr8AXUCw+2a0aLkhlIXSZ96khvQtC9OF7H34lfQEMnaNG2029O2FIirw35Y2aSGInSvV8qLb/VnaoD8qQBwULSIfoA2n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747767010; c=relaxed/simple;
	bh=6Lnn3GqVGVVpIae4N7ErXID389sl4HFnh/pYMIp0FqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eNyleFfzVSR9AIg9hqMWm9GTif4yLS0XI2FL/NAbX25IZkhBKZO8ScTA/AxNsEwWoMsIvXSs0Kipknc1ejjW64nrsEc4a/GzhIBx8J2tlS4D+aougIYEpjEfP2dwqGUXM/62k8Rt17tsEaN7lrPv4HW5oiJZysT6vJVsg9g1/WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cBANUNKC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdlZ2000390;
	Tue, 20 May 2025 18:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YwwOOZ4Ib1jTCjsElnolscM+JmuESjPhBiOX9D7oyOE=; b=cBANUNKCrcPfnl3e
	lO3MC1doLOPDb0PHunPo+YSP42iDtSMfOJ+PZky+u8gsYu2dWLgiTXdC+yeJR+SH
	HJuq5ZbBR0W6fUTccdjdapr6DBSqRfYJi7pXbpNeODfEwmnZAG3sLaYlAhg7rEs3
	qdSJK+6Ngvl6xxXXbAjGEB/vPoyhTRGzA53Kw5tKjadLviKlPOGlA3eBJioWyG27
	jkmnzi50qgjDfdtkADFlcVV2JAbNC37Rz8MckJKot9j2wsiG4eS/famwoBmL4a2g
	Gx1LRrln7QLyEMId3xlucMHbiOf0S0jIJ0MdrhXMWMOn13VJmC5ccZ7lilwFGoEv
	pkeucw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf18bx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 18:49:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54KIni73007658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 18:49:44 GMT
Received: from [10.216.45.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 May
 2025 11:49:38 -0700
Message-ID: <80d8888c-41d9-4650-8be7-11e71610a4b8@quicinc.com>
Date: Wed, 21 May 2025 00:19:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] scsi: ufs: dt-bindings: Document UFS Disable LPM
 property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Pavan Kondeti
	<pavan.kondeti@oss.qualcomm.com>
CC: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>, <mani@kernel.org>,
        <conor+dt@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <beanhuo@micron.com>,
        <peter.wang@mediatek.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250506163705.31518-1-quic_nitirawa@quicinc.com>
 <20250506163705.31518-2-quic_nitirawa@quicinc.com>
 <667e43a7-a33c-491b-83ca-fe06a2a5d9c3@kernel.org>
 <9974cf1d-6929-4c7f-8472-fd19c7a40b12@quicinc.com>
 <8ebe4439-eab8-456a-ac91-b53956eab633@quicinc.com>
 <852e3d10-5bf8-4b2e-9447-fe15c1aaf3ba@quicinc.com>
 <8aa09712-5543-4bda-bf9e-a29c61656445@kernel.org>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <8aa09712-5543-4bda-bf9e-a29c61656445@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g18pLlX3KE5ASdjU72c3vhesiSI_Gz-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE1NyBTYWx0ZWRfXwLw4MceZVD6e
 HO/+hplFE34pqKSvNYSJntEVxZapCag4cNu2UngsJzGLfaIGFOrqDjYCrmkQn0ShvnVJdsf9I3x
 X1CF9p8/stcDrD0GSMFih6XilnuUmbiyn4p8NlG9ld/E8mid+3PjVbdPo/OG8kPIesvOLWiC9wz
 d06ALU4kWPpQK43ZpmnfAcOMC3t4uBPgcM1xmdjaOlJH97FYGaOMbGpnmJk6jnqzDDRyX4RrGvk
 mjwf3YfQp+SmWcLHvz35A4xANqccN6IR6sgj9Rlk3BVlfev8r8afU1zKxWBHsMAk8DKesF3Qehd
 mTC03fHhZuTjSWpYQxagQsXm1th/BmSjP9NkkKh5616gvzfUYcNsWMz1/jQMV1S7PqR4YJM9+He
 yi/mZvIxsTdZFFSo4fQ+B3sQ8oUmJdotatM2aPlvW9vU2pxj5c6Z6jtKuVJ+dBFApZ5M4HNm
X-Authority-Analysis: v=2.4 cv=F6JXdrhN c=1 sm=1 tr=0 ts=682ccec8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=KaFcgfFQSMWrpGzCsUQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: g18pLlX3KE5ASdjU72c3vhesiSI_Gz-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_08,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200157



On 5/20/2025 1:39 PM, Krzysztof Kozlowski wrote:
> On 12/05/2025 09:41, Pavan Kondeti wrote:
>> On Mon, May 12, 2025 at 09:45:49AM +0530, Nitin Rawat wrote:
>>>
>>>
>>> On 5/7/2025 8:34 PM, Nitin Rawat wrote:
>>>>
>>>>
>>>> On 5/6/2025 11:46 PM, Krzysztof Kozlowski wrote:
>>>>> On 06/05/2025 18:37, Nitin Rawat wrote:
>>>>>> Disable UFS low power mode on emulation FPGA platforms or other
>>>>>> platforms
>>>>>
>>>>> Why wouldn't you like to test LPM also on FPGA designs? I do not see
>>>>> here correlation.
>>>>
>>>> Hi Krzysztof,
>>>>
>>>> Since the FPGA platform doesn't support UFS Low Power Modes (such as the
>>>> AutoHibern8 feature specified in the UFS specification), I have included
>>>> this information in the hardware description (i.e dts).
>>>
>>>
>>> Hi Krzysztof,
>>>
>>> Could you please share your thoughts on my above comment? If you still see
>>> concerns, I may need to consider other options like modparam.
>>>
>>
>> I understand why you are inclining towards the module param here. Before
>> we take that route,
>>
>> Is it possible to use a different compatible (for ex: qcom,sm8650-emu-ufshc) for UFS controller
>> on the emulation platform and apply the quirk in the driver based on the device_get_match_data()
>> based detection?
> 
> I do not get what are the benefits of upstreaming such patches. It feels
> like you have some internal product, which will never be released, no
> one will ever use it and eventually will be obsolete even internally. We
> don't want patches for every broken feature or every broken hardware.

Hi Krzysztof,

Thank you for your review and opinions. I would like to clarify that 
this is a platform requirement rather than a broken feature. 
Additionally, there are few automotive targets, in addition to the FPGA 
platform, where Low Power Mode (LPM) is not a requirement. For these 
platforms, the LPM disable changes are currently maintained downstream.

My apology for not including the automotive requirements in my previous 
commit messages.

In my opinion, since these platforms do not support LPM, I requested 
that this be reflected in the hardware description (i.e. DTS)). However, 
I am open to suggestions and am willing to proceed with module 
parameters if you have concerns regarding the device tree.


Regards,
Nitin


> 
> Best regards,
> Krzysztof
> 


