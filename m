Return-Path: <linux-arm-msm+bounces-68823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18051B22B9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 17:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5283D1A22EC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 15:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7692F5483;
	Tue, 12 Aug 2025 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hcenBkK3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC482F546F;
	Tue, 12 Aug 2025 15:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755012254; cv=none; b=bZCamn5Gf2WJw/231h2TxEg/uSwcnGkDXnO+AqH1pKgJQQlTKrC6QaomWPI5Elj1FaGHRJMITUCxSqZ4VfyvnKeQKI24u+WEl//g9rQGumkMgrAQ4vfSkv0ZXdjvYWY84O+OnAApKIEO3wofsgw/WPriDh3sDcN38bexmcqIG9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755012254; c=relaxed/simple;
	bh=30yPRQBKhF1sBwqIUODZ/JKK+AQMMqhM1j80Zu8h0lI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CES9Ud0WeTYIyqpW/mFagImf02593gKe6ymw/bP4SYEgSyMxHaMi31YBHyhliLLGkK1NPsQ448Vt3bKKIhrC7gMmvEAm8sDJSVEd3e+mabjCUrDfXkJnzI55+Hn4FS7lMRy7l9G5+gxD6KkulaEGIwTxDZjO1dfXPNbAp6U6KD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hcenBkK3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvjLL012593;
	Tue, 12 Aug 2025 15:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3cjXHwMaWiX5/OP582acD5h+jjOdYS5FldMvq9RW0M4=; b=hcenBkK3GC8wxgCG
	6ag75kHiwmOde+0ORZrx2cS28mDU4M1uMUdmL0bvrwzgCHxlqxSVOHXDwuWKqL7q
	NsiGRuWtOJoSFqeqmLS7n0v9xyGsMtKCR3hSxnOLifYJAL/xp71ZMXNWGwpqmAUd
	5nasBDS9ngWgA1iIS71LXKSSp7KDORoyhXo8ARIGfBQ04Jz1BCgpi0igtxDUYIut
	bfyPFhYBjX5cVrydGBKAnVMeKXAwKMqA0mt09PvoqVw+I59lmG3z0QwG4ylSeAcy
	OA+OY66DU1UzJ/xov5SIw+U3ZslJju/8swkKxXH8zdUZU5y+J79q3s4SYQ2QwNK1
	bXQ04g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv0kqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 15:23:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57CFNwF9010964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 15:23:58 GMT
Received: from [10.216.60.9] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 12 Aug
 2025 08:23:52 -0700
Message-ID: <3ac1efc5-4c17-410e-8a84-948e5c9cdd1a@quicinc.com>
Date: Tue, 12 Aug 2025 20:53:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] arm64: dts: qcom: sm8650: Enable MCQ support for
 UFS controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <mani@kernel.org>,
        <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250811143139.16422-1-quic_rdwivedi@quicinc.com>
 <20250811143139.16422-3-quic_rdwivedi@quicinc.com>
 <67aedb2a-3ccc-4440-b2ff-b3dbedf5e25c@kernel.org>
 <9ff100b4-a3a5-4364-8172-1ccb5566e50c@quicinc.com>
 <27qmlr3lie54lyigl5v434yzvbes5twy6zgtkqb52ycfh23vsp@zdg57ifh7kog>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <27qmlr3lie54lyigl5v434yzvbes5twy6zgtkqb52ycfh23vsp@zdg57ifh7kog>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689b5c8f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=GiozvvAXbBCNVtD0RQIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EAODzY8Jadu8K-twJvAUUxb6RdQKm2wk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX2xFoNpSCmq3z
 5GBl/P/YdDYcxIn7/xlYzMBqlWJnAXztN0cnuDb6GQcIChkyLDQw/669Vxs6W8luiIX8+tj6DZ0
 4KjKoLw04+zQSPLYptI6qsl6GislkUoo3BMSmjwkNeIkFNkigF9Jga8xHedda9jyD6kpZeoqc2I
 r31jLsghFvdisJnVdtDTdWV6sQAlZ6YiRw2fZoXtusGSdiFsAT9tHepgwPPEQH2ZqFZ2ajjG+tJ
 sEE0CI1QxRIO6euPvgBqyrZ6OY73e7CUuNh3afM9QkzwKw+T81yY7FADa8UIQi5ZMADWSSADdEs
 NZqUJeWoLtvdX6YnXNa/6wVKbUXX99RYwUg4rAYLuYgpJqF5DQ9mDeWdupbPkkVzA5cd8KiO1eA
 98r/Ysxx
X-Proofpoint-GUID: EAODzY8Jadu8K-twJvAUUxb6RdQKm2wk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025



On 12-Aug-25 4:25 PM, Dmitry Baryshkov wrote:
> On Mon, Aug 11, 2025 at 10:24:29PM +0530, Ram Kumar Dwivedi wrote:
>>
>>
>> On 11-Aug-25 8:13 PM, Krzysztof Kozlowski wrote:
>>> On 11/08/2025 16:31, Ram Kumar Dwivedi wrote:
>>>> Enable Multi-Circular Queue (MCQ) support for the UFS host controller
>>>> on the Qualcomm SM8650 platform by updating the device tree node. This
>>>> includes adding new register region for MCQ and specifying the MSI parent
>>>> required for MCQ operation.
>>>>
>>>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 ++++++-
>>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> Way you organize your patchset is confusing. Why DTS is in the middle?
>>> It suggests dependency and this would be strong objection from me.
>>
>> Hi Krzysztof,
>>
>> My current patch submission order is as follows:
>>
>> 1.DT binding
>> 2.Device tree
>> 3.Driver changes
>>
>> Please let me know if you'd prefer to rearrange the order and place the driver patch in the middle.
> 
> THe recommended way is opposite:
> 
> - DT bindings
> - Driver changes
> - DT changes
> 
> This lets maintainers to pick up their parts with less troubles.

Hi Dmitry and Krzysztof,

Thanks for the suggestion. I'll update the next patchset order to
follow the recommended structure:
1. DT bindings
2. Driver changes
3. DT changes

Appreciate the guidance.

Thanks,
Ram.

> 
>>
>>
>> Regards,
>> Ram
>>>
>>> Please read carefully writing bindings, submitting patches in DT and SoC
>>> maintainer profile.
>>>
>>> Best regards,
>>> Krzysztof
>>
> 


