Return-Path: <linux-arm-msm+bounces-68538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 664E6B2129A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17A32424A9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E42129BDBF;
	Mon, 11 Aug 2025 16:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fjKkVDbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DAE1A9F9D;
	Mon, 11 Aug 2025 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754931294; cv=none; b=ANZ5XYu2ABxEzghqKeVGXyzcxODRqMxcFXNGR5emh/4G0Riyw3uPpLAPHSLtaVZZr2IwgI2tJnw/Yn/0eeY8BUmH9qBP7BXJn4E0mQcWx+IddmoF1ZjVKRLzG7lrof9uj4ENDNpqUkf6bEwnnzy+co78KHf7lFUzre8jfSaNrbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754931294; c=relaxed/simple;
	bh=ZGt+p08oHdbLkYuiWh/Tz5VD7GjaLJTOK0rVBJdfwtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sOWFaFplYtCEikhpALKDeQ2oE7IQJ97g8l141crsJp2aCp9pERUn/Y1rI69Ihy4N+VImADQK483SrPOaXbwXlX8ZEDeOGqaO4PGTcrFvxY4k4ry30IMAfOXRb0Fuz6RlX6VO+zqJ+eS0SqutXLlR2AdURMHgWQkybXUZUePOH24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fjKkVDbE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFBxwo006181;
	Mon, 11 Aug 2025 16:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SL6BgA+WcBvuMIY77uel/uKLCF3VnOVk87TVduJNN+U=; b=fjKkVDbE1ULONjbc
	0jQTZMSwO8J08gY1XEUTl+AhwmUgjiVUmhyikv+AzbWZTOcA81ekCbkRy4tgO5v9
	7RXW+tFxuE9Ucq0DbQTrsWK0Py5ylM6zXwjSCbjMG2jhnI+04v5Vd36KGq7zwUSl
	OUXOBeRCLCEi2OeeRBiXvA15vq+ZUPnrp+b4zAjvmREDoWnm/krzDLQF9A0p/Km7
	yLbY1QYOISfdWiHHIrnddnLPEDkvTsAiegKaI9Ii8426fiieDSFF1lq+Q1Cd6WHD
	89/391ry4attgdxBMtGoUESleq3jpOvMO9FPdsHmazWu9UArp/zGpHBCX/R31nf2
	gxmFQg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxb89hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 16:54:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57BGscTb020043
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 16:54:38 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 11 Aug
 2025 09:54:33 -0700
Message-ID: <9ff100b4-a3a5-4364-8172-1ccb5566e50c@quicinc.com>
Date: Mon, 11 Aug 2025 22:24:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] arm64: dts: qcom: sm8650: Enable MCQ support for
 UFS controller
To: Krzysztof Kozlowski <krzk@kernel.org>, <mani@kernel.org>,
        <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250811143139.16422-1-quic_rdwivedi@quicinc.com>
 <20250811143139.16422-3-quic_rdwivedi@quicinc.com>
 <67aedb2a-3ccc-4440-b2ff-b3dbedf5e25c@kernel.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <67aedb2a-3ccc-4440-b2ff-b3dbedf5e25c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689a204f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=L1kT8yVtU14eprXNtIQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX63E7qFo4pURL
 q/+l4evnNvfVwVp7Gc/xaPVwue8tg3JGq5OlaMqMwYkt+XaNmg2+dlYlP2KMuMja0uDqpL1X4Kg
 Z0xxYGpGiM5pAMVvS5QKazjtaTX0GZVNibNDmVnftaWeRG8vXg/JL7qqvSvsMJXk8wUqTjFsGis
 RS8Q3hljUwXFaYyrMtonuSQPLU4CK7DwZgYD5o5n3vXmoSO0CJfNIUgo2pInt24aadBWLQSkhge
 2TN13uIkBWVEG1PH/Exm+gcZyDiemIHLX43+JdkZ6s2S4FMgnJTU9E4Vzzpre101CL1XQEoR8ys
 jCN3q+we7cmpyuL82OFhOl6tuz1PseuYqB9RQIz4xa4BK1BvDdmCMUw6ciINS6Ax2nboQbCss+z
 4qiCw0xz
X-Proofpoint-ORIG-GUID: u45KLYEv_FIjwBI41TTw4vwFCYGAOrdP
X-Proofpoint-GUID: u45KLYEv_FIjwBI41TTw4vwFCYGAOrdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097



On 11-Aug-25 8:13 PM, Krzysztof Kozlowski wrote:
> On 11/08/2025 16:31, Ram Kumar Dwivedi wrote:
>> Enable Multi-Circular Queue (MCQ) support for the UFS host controller
>> on the Qualcomm SM8650 platform by updating the device tree node. This
>> includes adding new register region for MCQ and specifying the MSI parent
>> required for MCQ operation.
>>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> Way you organize your patchset is confusing. Why DTS is in the middle?
> It suggests dependency and this would be strong objection from me.

Hi Krzysztof,

My current patch submission order is as follows:

1.DT binding
2.Device tree
3.Driver changes

Please let me know if you'd prefer to rearrange the order and place the driver patch in the middle.


Regards,
Ram
> 
> Please read carefully writing bindings, submitting patches in DT and SoC
> maintainer profile.
> 
> Best regards,
> Krzysztof


