Return-Path: <linux-arm-msm+bounces-52263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF87A6D469
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05D471890C40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 06:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50859204845;
	Mon, 24 Mar 2025 06:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g27OB5To"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2212202C22;
	Mon, 24 Mar 2025 06:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742799104; cv=none; b=G0gav9s2vgjOfPLnPWjHfFeagoNXGTr4gI/G3pFYYdhQcMuMqMAQIUisGsdY4H9SHaOYq8v7VYLvViKzQQHsAkTBrKjMeJ3EWsbDSqN6nxfdD+5LPPQNu+ItrbIaCQ8X88w9SAyhPQ+zBjzfVW453zss4ruHvHhoV71mt/EKG/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742799104; c=relaxed/simple;
	bh=t4/X8HBCn2/0xGw0ibwZxd+D7K/W6+woZ236EKPJF94=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KUhDUogbFTVlYUWeTkeIM5g+C4evqbamBsNIMh0VOXNy9747J4VddiGK4fKTgbMu9bOv438qc08ro8vT7OHmz29SgvumtGzOT7iKzfPPBapkg+8X0QMCGVhTBw8k1eWocJEVdjWQgo6RPvOBf8iCMXeSruMBnk3UswcSmlFOLRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g27OB5To; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6bw3k031457;
	Mon, 24 Mar 2025 06:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2BmV3u593lkICMeXn4dWt/GaEgIv7UlyJbMeXZJm6fI=; b=g27OB5ToXp+PQrY+
	uet1pFN++tbqHinlKlJOwvgVxw8+n0w5cupMhw5ysx8kK3Tw9FUHru3wDSM4nWmu
	u44rhtaMxPcCuG2XRi03plqdqXBny3fm5TeQAjtFViTCYirAZ0e8Spq/LbIva50t
	+F9cpNMnf0/fVTAR5Y6v9zvOwc6aKVDG6cGRmn8RBppfAL+2+lC9ldtYk/PpWCoM
	qd+jQvnljfjuzphhqpme71/teR8m6LzFmfzvq0MrseotDxYxJHYkD6jYF1Ta94ns
	e5rtZI8MyCYk7PJs19uEQKBW8rdQlA9M7yw4N6/BztnjrNQ6vCIP56H0e6U+uPqX
	Ec1JuA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hne5ua6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 06:51:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O6pNJ6004644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 06:51:23 GMT
Received: from [10.233.19.224] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 23 Mar
 2025 23:51:18 -0700
Message-ID: <f4cc9d3e-0079-47a4-bee7-32221b37df65@quicinc.com>
Date: Mon, 24 Mar 2025 14:51:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <quic_qianyu@quicinc.com>, <sfr@canb.auug.org.au>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <U9NTFHDe_r-uUozJFJGmc7VpxMDx39onKby4M3B_sy0jJ2fr7-iXkS801m2slu8PXanf7Y7faBxuZ8fzWiKxTg==@protonmail.internalid>
 <20250320055502.274849-3-quic_wenbyao@quicinc.com>
 <7dc8700f-0d53-45f5-bfff-2bec71c7053e@linaro.org>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <7dc8700f-0d53-45f5-bfff-2bec71c7053e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4bZ011oTBBWHLyE3D42KmUuTLccUKLHG
X-Proofpoint-ORIG-GUID: 4bZ011oTBBWHLyE3D42KmUuTLccUKLHG
X-Authority-Analysis: v=2.4 cv=JvPxrN4C c=1 sm=1 tr=0 ts=67e100eb cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=Upqwyp-cVDBhw83K_eoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 clxscore=1011
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240049

On 3/21/2025 6:06 AM, Bryan O'Donoghue wrote:
> On 20/03/2025 05:55, Wenbin Yao wrote:
>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>
>> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI 
>> slot
>> voltage rails can be described under this node in the board's dts.
>>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi 
>> b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> index 46b79fce9..32e8d400a 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> @@ -3287,6 +3287,16 @@ opp-128000000 {
>>                       opp-peak-kBps = <15753000 1>;
>>                   };
>>               };
>> +            pcie3port: pcie@0 { 
>
> Missing newline, please check your dtb checks.

Will fix in the next version.

>
>
>> +                device_type = "pci";
>> +                compatible = "pciclass,0604";
>> +                reg = <0x0 0x0 0x0 0x0 0x0>;
>> +                bus-range = <0x01 0xff>;
>> +
>> +                #address-cells = <3>;
>> +                #size-cells = <2>;
>> +                ranges;
>> +            };
>>           };
>
> Why is pice3port the only port to be enabled ?
>
> What about the other ports ?

Only PCIe3 requires PCI slot power driver to power on its slots, other
ports don‘t need it.

>>           pcie3_phy: phy@1be0000 {
>> -- 
>> 2.34.1
>>
>>
>
> ---
> bod

-- 
With best wishes
Wenbin


