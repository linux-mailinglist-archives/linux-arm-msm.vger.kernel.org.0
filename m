Return-Path: <linux-arm-msm+bounces-52267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9D8A6D4CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6204E16E4DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E17250BEB;
	Mon, 24 Mar 2025 07:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KoJ8EIlg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857642505C5;
	Mon, 24 Mar 2025 07:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742800461; cv=none; b=VD2XJvXYgHmmV/rkNAwZ0zoNwb8k7sabMILAW5JhdGG+njl6ewwG8SNlEnOjdcq8UjIoachY5dup1UjlK2NamoWmcPL8qTr9BDQkUKfJYLqN6/PZNyri96kxnUwe5msAc8zmF4yAYNq69yDAnH22LzDzI05UhH0SjefIdT/9BZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742800461; c=relaxed/simple;
	bh=cRNrg1u6o08+zKtkeHQ6J4lnkX3hUQxeeww1lzXrAdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GiaEbIEUB+RWMEQkDq1vmSoow/Xm9t7MqPNfE0iEqyo2IoGAA0hnBi77x14yXVbDZBIpALUDH4QusugTvjnqotEVsMxKBJTbm6tITqFEBb5ChMsUM7rEuPX2iQKWPPpIIjN3iOFwJNjahqYhhuvG48N2mL0V7ej0D+SJ0yLRlcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KoJ8EIlg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6c1BF020445;
	Mon, 24 Mar 2025 07:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tj0r9h1K2TgurpxFryA4T10K1SMt2ovLYRkqdsps4hU=; b=KoJ8EIlgmQcaIFj3
	5z+hKw3v+RQY0W0OYPwAquc6fMewrLugCNvP8nFxgI9aIwxVKhYfc541L/Mb0ZYc
	4CGME+7Ej4uWKrFy3r+whCpxX9mNnRVnlUmiDoWXFF8lnHNdsj9Zp3hFZCmPO0JZ
	QwrvKYJOT1nX/mICK4LkMDZfXFDvK39T5IPygZbjxA2IMDsp80d4uu8CG8OmBJUw
	s2gObBuQj1WiH/1CvQB9cqmlBqqp82q0uIGd08po6aZf5Ho1cn7GH3X1dkDDdvOd
	jOSBpGU/2cZXgeItB+vgTRkZvLdHbLFsJxbTzvY3BdKNHmsHinAIX/DcyLZvGWEI
	sNmroQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hmt03dab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:14:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O7E2KA004560
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:14:02 GMT
Received: from [10.233.19.224] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Mar
 2025 00:13:57 -0700
Message-ID: <7707be54-5b42-42ea-b957-811fc45233c6@quicinc.com>
Date: Mon, 24 Mar 2025 15:13:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100-qcp: Add power control
 and sideband signals for PCIe3
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <quic_qianyu@quicinc.com>, <sfr@canb.auug.org.au>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <20250320055502.274849-4-quic_wenbyao@quicinc.com>
 <8379e009-9619-4c2b-986a-8ccb9ebaa083@kernel.org>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <8379e009-9619-4c2b-986a-8ccb9ebaa083@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jGFQE3zUtR8IV9CrrIlFYWbWTeE8gnYX
X-Proofpoint-ORIG-GUID: jGFQE3zUtR8IV9CrrIlFYWbWTeE8gnYX
X-Authority-Analysis: v=2.4 cv=aqGyCTZV c=1 sm=1 tr=0 ts=67e1063b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=B4APhY1HzHtPLpehiVQA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240051

On 3/21/2025 3:39 PM, Krzysztof Kozlowski wrote:
> On 20/03/2025 06:55, Wenbin Yao wrote:
>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>
>> Add perst, wake and clkreq sideband signals and required regulators in
>> PCIe3 controller and PHY device tree node. Describe the voltage rails of
>> the x8 PCI slots for PCIe3 port.
>>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 119 ++++++++++++++++++++++
>>   1 file changed, 119 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
>> index 28086a2bc..9cd313802 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
>> @@ -318,6 +318,48 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
>>   		regulator-boot-on;
>>   	};
>>   
>> +	vreg_pcie_12v: regulator-pcie_12v {
> Don't send the downstream code.
>
> Underscore are not allowed in node names plus:
>
> Please use name for all fixed regulators which matches current format
> recommendation: 'regulator-[0-9]v[0-9]'
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml?h=v6.11-rc1#n46
>
> Best regards,
> Krzysztof

Will fix in the next version.

-- 
With best wishes
Wenbin


