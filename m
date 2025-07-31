Return-Path: <linux-arm-msm+bounces-67216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E40A0B16C4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 08:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCEBA620457
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 06:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB12928D8C1;
	Thu, 31 Jul 2025 06:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ASqWgTMd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3479A1AF0AF;
	Thu, 31 Jul 2025 06:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753945165; cv=none; b=FldeSw3QPiQD6ZSjxYOdo5fxE/6PSlUG25uRl7FVkAHbGvaPel1IVOgLCZZuVkjUU6yaWy+BDXcg/DJ5q4UoCvrXgwBO3TsxjHaML8KYxuaI5KPvm9T/anQzNqqnyu66OiHPtQ/djoMecmO8jA8EEqykgeYEneg3MHMiPrVt5O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753945165; c=relaxed/simple;
	bh=b9ujBfIXNQV8UG1TqJKXGa7J63Moota+Y+MrudQJUSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S2YefELTJksFssIvk42rpv9XStZ6HOPB+fcGgPybMJeyQptHj/L52pSg+FSF8DioKsubXwvHZwzZnJLWAuIc/6Er2IL0wPEM7FAUM8W3NHIrevHzBrI+1dJ0bNFe7med8jnv0Rc9rD03z/GldGeSPHs1fFVPDXV+fdVbsHT7nEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ASqWgTMd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1g7tt001148;
	Thu, 31 Jul 2025 06:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eGkqLkINn90zknW0qsrPvPZ0Gzxa2BEZUJQ6TXkuEBk=; b=ASqWgTMd0ef21ROE
	8Yd5l4wczaPeElbockI7ZWOwwrkvg9AG+Pjc5pFlG0xsopiDu8NSjMLDUiYPsQ9X
	oLaakQ+yZTrLZQsHkBRI9+0GtlEsfMgdPFZAUl9bipPuS48V6BW0O4T7nCdYbkcM
	bUBOrGwq5Xi3RziYFhXR/nn3khcfKD3Q4FKRFTmHMs1/j6QwikcfnIk7HgHyG28Q
	z683NqUO70FCfNf5a1M1VmMFHGDSGbgsjRBMldzDSD0qJeCP+kzpJ2YEvwdBxJgl
	7Iadja7UI5nVx9BisTGUGMlg30IWptfJ0thfU/hK58jIn8iizUZ0TiqA/nk7HK1y
	Nu6m9Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860ep41m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 06:59:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56V6xBNh030571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 06:59:11 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 30 Jul
 2025 23:59:07 -0700
Message-ID: <148b46f3-2109-4c15-b7d8-17963b38095a@quicinc.com>
Date: Thu, 31 Jul 2025 12:29:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] dt-bindings: ufs: qcom: Split SC7280 and similar into
 separate file
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "Avri Altman" <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<mani@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        Andy Gross
	<agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Ram Kumar
 Dwivedi" <quic_rdwivedi@quicinc.com>
References: <20250730-dt-bindings-ufs-qcom-v1-0-4cec9ff202dc@linaro.org>
 <df8b3c85-d572-4cee-863b-35fe6a5ed9ff@quicinc.com>
 <6ebe7084-bb00-4fac-b64d-e08e188f3005@kernel.org>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <6ebe7084-bb00-4fac-b64d-e08e188f3005@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wIowLcM2AHFMnCnbvwWyjAE3Sskhxeku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA0NiBTYWx0ZWRfX/2zeYns3p5UK
 X7HH45gjEmZCNRGUFr910K9bNDyefSk+j9dtqgU6ClZoFHFsmCuMRt4y2/Zrx0yn34pJqepNBqC
 f5oKgbE+91v8DKSF+XWCyL2qvk+XqmEQNCzT/nyiy0R0DlpNveGSKPCdtV39GzbujYxhK6mKRaG
 A4QLJT63Gw68ySabl1aHXOiUzMLc7XUauamJvVPnvaX5jqCurFxxKz1X0ro8LOZZTxzi+FsIiy6
 c4yezvk36rmCj4WNMvLaQqr7mgxEOJZib5WQxoegj7UMcn2W8MMpImJguvhU9Qb2xW3Kb/PIl8T
 P0mzkIuds7lAVG+OFCe8XEQdY+7sLU9ZJFGgbqdJGfiDQVW/RtTqNsUIVy3oYvAkCg+s0u4EuoJ
 nz2qyZ1jrz35pQSNilYeTAwZuWGgizw9b8MiX+x/89CRFFFtzv/BomVGl79SuCqOgKlQA68s
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=688b1440 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=il2M3Yh6ggYqQNPrDR4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wIowLcM2AHFMnCnbvwWyjAE3Sskhxeku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310046



On 7/30/2025 7:55 PM, Krzysztof Kozlowski wrote:
> On 30/07/2025 15:53, Nitin Rawat wrote:
>>
>>
>> On 7/30/2025 6:05 PM, Krzysztof Kozlowski wrote:
>>> The binding for Qualcomm SoC UFS controllers grew and it will grow
>>> further.  It already includes several conditionals, partially for
>>> difference in handling encryption block (ICE, either as phandle or as IO
>>> address space) but it will further grow for MCQ.
>>>
>>> See also: lore.kernel.org/r/20250730082229.23475-1-quic_rdwivedi@quicinc.com
>>>
>>> The question is whether SM8650 and SM8750 should have their own schemas,
>>> but based on bindings above I think all devices here have MCQ?
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>>
>> Hi Krzysztof,
>>
>> If I understand correctly, you're splitting the YAML files based on MCQ
>> (Multi-Circular Queue) support:
> 
> Not entirely, I don't know which devices support MCQ. I split based on
> common parts in the binding.
> 
>>
>> -qcom,sc7280-ufshc.yaml includes targets that support MCQ
>> -qcom,ufs-common.yaml includes common properties
>> -qcom,ufs.yaml includes targets that do not support MCQ
>>
>>
>> In future, if a new property applies to both some MCQ and some
>> non-MCQ targets, we would need to update both YAML files. In the current
> 
> No
> 
>> implementation, we handle such cases using if-else conditions to include
>> the new property.
> 
> Hm?
> 
>>
>> For reference, only SM8650 and SM8750 currently support MCQ, though more
>> targets may be added later.
> 
> Are you sure? Are you claiming that SM8550 hardware does not support MCQ?

Offcourse I can say that because I am working on Qualcomm UFS Driver.

> 
>>
>> Regarding the patch
>> lore.kernel.org/r/20250730082229.23475-1-quic_rdwivedi@quicinc.com,
>> instead of using two separate YAML files, we could use if-else
>> conditions to differentiate the reg and reg-name properties between MCQ
>> targets (SM8650 and SM8750) and non-MCQ targets (all others).
> 
> It's a mess already and you want to make it messy. I already responded
> on that.
> 
> Best regards,
> Krzysztof


