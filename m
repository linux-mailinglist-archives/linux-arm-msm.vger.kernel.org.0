Return-Path: <linux-arm-msm+bounces-62415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C136EAE7FA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C715B1C2112F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFE828EA69;
	Wed, 25 Jun 2025 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fIzbdzCx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3F329A9FA;
	Wed, 25 Jun 2025 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847682; cv=none; b=EQCdR21fpIZ1EYsUYptTxn/m+g5eYDpPYO6S2M/0c85CxXyQsvbZeknqfsZocCufR4+SE/okisqqHExKGHBBzkQemo6DpVhvND1Csf5zqPMS7cStNyZYgVcMIeaX5kp+0JVyzerpqQlrdCBiHd+GP7yTy6QusdyUOW/wsotiq88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847682; c=relaxed/simple;
	bh=dA5ZCy6HQqEkPHgSujZ/C9IiG2ZeoOXHBOqgYKQ8Ow8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SzmB76weEdHYkwPy4hEmpA85Ag7WQNMm+F3wyr1/xMepcygXQZsHihrwh8+Gc6NIZ5E2w0E2+UnU+RTjoerNNaUEO14q4urOeHI9uMzyChoeZYmKYZo5f8pgOqOwNZt7UPBrqYHs9awjOusj72CbC3+vEgasXaXfmQXbP17ByQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fIzbdzCx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAV0V5022703;
	Wed, 25 Jun 2025 10:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BfrFEUPqOh3EWJBb82sN4PO9NfKDcWv3vyibL0dYnyw=; b=fIzbdzCxHeX9X74j
	AKWgSm+XHP1W+eu+VFo0lwceC0uMZBMfQnflXB/Hse7vB9sxnUF1hOHhcifPZy7u
	iOpY907t0DA/qQrjnMlG4brkOG01VDt7wFYGGtF1js6rcu8/4C1t2Ic6T6Oy8hvf
	YpbcpnACo3j3PcjtOt+7aWw3ItHqZFlM4ZD+sRGDZgZK3QjKQycIdYmpeNh9fC/G
	o0TCrMFQeRsswjpLXK1edwNkv/rMbPxwLmy2DBh3mOybfPhIhqmyWoEOAHwH6pjj
	yTKtSjVPQYMteZuMWjfjuFLXcyX/oKqvc64e+XLyWdqIPMi4Q5K5hdoBmNA4Z9+n
	ocKPMw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88f9aar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:34:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAYalI014555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:34:36 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 25 Jun
 2025 03:34:32 -0700
Message-ID: <2e892bda-c9a4-46b3-9331-0978d4dabab4@quicinc.com>
Date: Wed, 25 Jun 2025 16:04:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Add video clock controller
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250623-sc8180x-videocc-dt-v1-1-9d210c140600@quicinc.com>
 <b5d181d8-26bc-4855-a8df-ab352837e800@oss.qualcomm.com>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <b5d181d8-26bc-4855-a8df-ab352837e800@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3OCBTYWx0ZWRfX3eRva1y0KiPo
 R5V2ew7ghdddghyYp4yuRTlny/W/I8dD10F3p0p5PeZQwuADCr0kbgUL/6UbySGGTum1DBaqVur
 RSPnNt9mIQu2S1sQLbgf8AHydMUEXGkXL1otpmWWulnHZ2nkKht4Oq7gonj/NjrcfSXc7nE7h/P
 Mqp9uS/IlLjC1C6LMN9/jsPseWyHQNbLvOltCBuvZgMgEj8lha2P1R/E8aMqz0HvLZp+F1HjFCp
 zy8wb32008yQrN7wUuj1XBTAhzMe3OrUiT3tdH9+TJPpwX2SwzRuDmtHM/R12f0sXuruaON6BxD
 +9UKcG0kxi+9HoPLHnIPmD7S2VJDbNWjuvnGeDv77o/iPxhZ5kxC/EmPPVA//8ATHoWBv1YVB7S
 yR8F6KDmdswZDrPzApXSWLxuO7GEg3G9PihbK7iWwfx/r8IKqp8N2ZT39X0hOsOWlopRHZRv
X-Proofpoint-ORIG-GUID: gyb5z3Cud4ZfJN-AuZSHAEpS2rSfrrDl
X-Proofpoint-GUID: gyb5z3Cud4ZfJN-AuZSHAEpS2rSfrrDl
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685bd0bd cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=Ud0PsPdOlkabNkr14dYA:9 a=QEXdDO2ut3YA:10 a=aWhxIMAnu1oA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250078


On 6/23/2025 3:38 PM, Konrad Dybcio wrote:
> On 6/23/25 10:14 AM, Satya Priya Kakitapalli wrote:
>> Add device node for video clock controller on Qualcomm
>> SC8180X platform.
>>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>> Add device node for video clock controller on Qualcomm
>> SC8180X platform.
> Because you added this text under '---', it will not be included in
> the commit log (and we want it to be there), please put the message
> above your sign-off


I did not add this manually, seems it was appended by b4

https://b4.docs.kernel.org/en/latest/contributor/prep.html#what-if-the-series-only-has-a-single-patch


I have already mentioned the same message in the commit text above my 
sign-off.


>
>> ---
>>   arch/arm64/boot/dts/qcom/sc8180x.dtsi | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>> index b74ce3175d209b569e634073662307964158b340..4590c2ff68a9885d8047d728bbf2dea0236d5b8f 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>> @@ -10,6 +10,7 @@
>>   #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
>>   #include <dt-bindings/clock/qcom,rpmh.h>
>>   #include <dt-bindings/clock/qcom,sc8180x-camcc.h>
>> +#include <dt-bindings/clock/qcom,videocc-sm8150.h>
>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
>>   #include <dt-bindings/interconnect/qcom,sc8180x.h>
>> @@ -2943,6 +2944,19 @@ usb_sec_dwc3_ss: endpoint {
>>   			};
>>   		};
>>   
>> +		videocc: clock-controller@ab00000 {
>> +			compatible = "qcom,sm8150-videocc";
> If the blocks are truly 1:1 shared, with no additional software changes
> required, please still include a 8180-specific compatible in the front,
> with a 8150 fallback:
>
> "qcom,sc8180x-videocc", "qcom,sm8150-videocc"
>
> which will require a dt-bindings update


Sure, I will add the new compatible for sc8180x and update the bindings.



