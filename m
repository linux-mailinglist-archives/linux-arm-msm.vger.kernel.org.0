Return-Path: <linux-arm-msm+bounces-67229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B49B16D9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 10:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A96F6583462
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 08:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997E129346F;
	Thu, 31 Jul 2025 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p8G/WOVv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1045220C009;
	Thu, 31 Jul 2025 08:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753950898; cv=none; b=t8BnTOzQ4Ovy1xydlfRsDleNP0EYbHzKfiYBbAvSf5X9D1B4umIu3tLQng0T6bMSqhkSzO4shD3NYa+XXwzkPXSeeiOYvDfjJ/E0ZzKbz0Pfuj/ZFjvwNU4y9KxSpZXBhjJjxN4T7o6nkEdkjS5CGB3ulIbeWe+TYvqjTYuPo/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753950898; c=relaxed/simple;
	bh=VCSvo3FC7RmoaRuh+VHn0AuTpu+7KIZOOhf/Aea7hhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m/dfC/PLDVJvj7+x4NJgHzBwCdRlV2OwNUUHnLybGUT/QuP4tytXmexxeR++7le7qkxiKtog5sYRmyXS4VL7tro9wlvXFhaHb57n3GrNtJ2l9KqKJPm29xGXQUSsM43Ybw2m1YBfUOD4WpLYeNN+jP3uTtD4vwIcJWVNyB8Fphg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p8G/WOVv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fPxG031810;
	Thu, 31 Jul 2025 08:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1hpmdvYzgq5FYOLzTDfoQbbdXIbPlXHF+uABAReT/w=; b=p8G/WOVvjUiIk0wR
	5uVFfXMM9cJp1vJbcFWbL2QxFso9goXnt2/gbsGYvzGi+ZSO6qfKxdBfV+na5muB
	w/PygNZpUItknXwIoe+y6ZNMdh4Pla7XGzARcAb2IpNlHPJt2vjjV3yQCLCVFumk
	QSd3HQfrxD/J+djZneahU5PPLIJNeGJeT2ietqa8Yddd3PW0BWv3/trTj6mpaqog
	licWV2OtC2wZG2rMa6bF5+uHaRK+M+fGXyEzMovI5mz2zcYk5yGxDANcaD0ycG+T
	8DYG28i+tvSfyrJiHIujuxMhl7EzIOsTTctXaJcpkzTXQkqeJTclkMi7IpszXVGV
	WDkkJg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xmey3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 08:34:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56V8YaGN004767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 08:34:36 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 31 Jul
 2025 01:34:31 -0700
Message-ID: <40ace3bc-7e5d-417a-b51a-148c5f498992@quicinc.com>
Date: Thu, 31 Jul 2025 14:04:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/3] arm64: dts: qcom: sm8650: Enable MCQ support for
 UFS controller
To: Krzysztof Kozlowski <krzk@kernel.org>, <mani@kernel.org>,
        <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250730082229.23475-1-quic_rdwivedi@quicinc.com>
 <20250730082229.23475-3-quic_rdwivedi@quicinc.com>
 <eab85cb3-7185-4474-9428-8699fbe4a8e5@kernel.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <eab85cb3-7185-4474-9428-8699fbe4a8e5@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA1OCBTYWx0ZWRfX3PSo2kA0jfdI
 j104pu3PEbEv2O7UB8ikFcC7SDFNHvsyHR1URyx9QBBV1JPlOnclQYtIUfKjXi71KlGsQlaY+8C
 Aju492vgefYdvbM6mxL92DKV7rmdrxmZxnArQqQ7Opy816BQo2Wntecx/qOa87GNOMBO2WHNDuw
 jRw5d4tZ4kxfiSy1nB2KTOfMsiVBRLEX60GhzgNcEhMBjFTRzegzdKYjaaalaCI0/N+YMmbN6EP
 jb2fn7vBgTPDAJ//Z9bD24zYUlvcKy1atXbZ/co5yY3VLlArov6iCynq0P3FYuOLAvHoM9l86Dk
 HJviXwBli9JRdmcFyivQTGytQZsjpZlxwghyD26pHSKDu4uNqEBLZGjla67rP1af0eJWSKaoU/r
 cMSdiNYxcid0uykTXN4umaPFU9JgBiWGfs6tGm63iL+wEtk7ynwxSGT5MMjCbKAGACe49H7L
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=688b2a9c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=tmieQKLTGtwJ4DsHDJoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: beaF7mcItC4dzvdkle8yG7bLbbMdBIjS
X-Proofpoint-GUID: beaF7mcItC4dzvdkle8yG7bLbbMdBIjS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310058



On 31-Jul-25 12:15 PM, Krzysztof Kozlowski wrote:
> On 30/07/2025 10:22, Ram Kumar Dwivedi wrote:
>> Enable Multi-Circular Queue (MCQ) support for the UFS host controller
>> on the Qualcomm SM8650 platform by updating the device tree node. This
>> includes adding new register regions and specifying the MSI parent
>> required for MCQ operation.
>>
>> MCQ is a modern queuing model for UFS that improves performance and
>> scalability by allowing multiple hardware queues. 
>>
>> Changes:
>> - Add reg entries for mcq_sqd and mcq_vs regions.
>> - Define reg-names for the new regions.
>> - Specify msi-parent for interrupt routing.
>>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index e14d3d778b71..5d164fe511ba 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -3982,7 +3982,12 @@ ufs_mem_phy: phy@1d80000 {
>>  
>>  		ufs_mem_hc: ufshc@1d84000 {
>>  			compatible = "qcom,sm8650-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
>> -			reg = <0 0x01d84000 0 0x3000>;
>> +			reg = <0 0x01d84000 0 0x3000>,
>> +			      <0 0x01da5000 0 0x2000>,
>> +			      <0 0x01da4000 0 0x0010>;
> 
> 
> These are wrong address spaces. Open your datasheet and look there.
>
Hi Krzysztof,

I’ve reviewed it again, and it is correct and functioning as expected both on our upstream and downstream codebase.
I think it is probably overlooked by you. Can you please double check from your end?

Thanks,
Ram.
 
> 
> Best regards,
> Krzysztof




