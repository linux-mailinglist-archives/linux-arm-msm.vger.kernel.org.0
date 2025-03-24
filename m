Return-Path: <linux-arm-msm+bounces-52264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A30D0A6D47E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCDAB3ADF96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 06:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935211F1300;
	Mon, 24 Mar 2025 06:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SHTai/tw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B541EA7C7;
	Mon, 24 Mar 2025 06:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742799384; cv=none; b=PcD4DvRYuzZZjH4fnySlYlcC3WtdjX0kmzfJ+HvbMaJXHq8iHG49KdMv5sjGDp8SAOrNWhHjYMag/KekgR7A25TojspSM8r/PXdpnuvgmf2Q4eiFxxCRgap/NAiquosFY4cnLLPNvrEy7P/UJj7RFZdK5MrPUNlSrP0AV27C//E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742799384; c=relaxed/simple;
	bh=wUjEegEqvZW00LVkk78JoSqVQ7KAlpBEsnWnnVZ9iu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=psCZ3Z9Rlw0s9hdY1tI0IEwSsBEzjLJdddOyyVrtes8BW3OvIHgvrzkJChtkiSKtbf9K4CixZ1a8SI+s/m/FNcMoqWkp5k6rsKqzNySJF2jgLQxedypqt9VgO/LQgRn7mZFYLIDgTqYlzmHO44Efi3RS2E97wMbDsMA0P9TRsxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SHTai/tw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6c2cw021847;
	Mon, 24 Mar 2025 06:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rwnCXb5J3d5nedzVUrVNYMUsqBCkn8NNvKJiPcVbUdk=; b=SHTai/twgyM7gb8g
	5cKZjNrePvVziUcqz4uQzprwcB0IzDQ9ekiVsvndF643cQmk5lhmfMGgFrgGPwh0
	4LpH4Z3ODbkBjRZXLHD2MGtqODQyUDoE7pCH/9HwZZXXWKKdLiWOAdXJPuYNIT4f
	kVeyvXoVBZ3arqm4qyQ+35/XNos+SwEoWch0w/RLMoDFFkiEryGLivMQ6FniwvY6
	lwove6JiyB3pW4B+dv7mBWL6uhbr67uXftnTgSptzKyxXQymevyIh+5dpSlTwLef
	eB8tqZDHaOi5kHv+rV7wpNciH7qPwnALdUfikwwZCTMz2TqI77r7s4KQ3xcxY8nJ
	jvIcZA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hmhk3cpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 06:56:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O6u4pL006717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 06:56:04 GMT
Received: from [10.233.19.224] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 23 Mar
 2025 23:56:00 -0700
Message-ID: <6964f197-07c8-469c-b4e5-710a099752b4@quicinc.com>
Date: Mon, 24 Mar 2025 14:55:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: defconfig: enable PCI Power Control for
 PCIe3
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <quic_qianyu@quicinc.com>, <sfr@canb.auug.org.au>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <zqBb_94gbwLzHgbAiLqgbuGg9wmeV1jUxHOsMXDdZToeTtRrtUimm8ra7GB48DXWU-ZOvC5mO8EY0uvxz46ISg==@protonmail.internalid>
 <20250320055502.274849-2-quic_wenbyao@quicinc.com>
 <fff943a6-4322-43d0-9821-08375bc5376c@linaro.org>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <fff943a6-4322-43d0-9821-08375bc5376c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=C4PpyRP+ c=1 sm=1 tr=0 ts=67e10205 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=lMbmitncurX1WqZc_pgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: V7AIMNvHzfeIzE9tqeottGNncaAJM3tb
X-Proofpoint-ORIG-GUID: V7AIMNvHzfeIzE9tqeottGNncaAJM3tb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=962 priorityscore=1501 impostorscore=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240049

On 3/21/2025 6:01 AM, Bryan O'Donoghue wrote:
> On 20/03/2025 05:55, Wenbin Yao wrote:
>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>
>> Enable the pwrctrl driver, which is utilized to manage the power 
>> supplies
>> of the devices connected to the PCI slots. This ensures that the voltage
>> rails of the x8 PCI slots on the X1E80100 - QCP can be correctly turned
>> on/off if they are described under PCIe port device tree node.
>>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>> ---
>>   arch/arm64/configs/defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 85ec2fba1..de86d1121 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -245,6 +245,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
>>   CONFIG_PCI_ENDPOINT=y
>>   CONFIG_PCI_ENDPOINT_CONFIGFS=y
>>   CONFIG_PCI_EPF_TEST=m
>> +CONFIG_PCI_PWRCTL_SLOT=y
>>   CONFIG_DEVTMPFS=y
>>   CONFIG_DEVTMPFS_MOUNT=y
>>   CONFIG_FW_LOADER_USER_HELPER=y
>> -- 
>> 2.34.1
>>
>>
>
> PCI_PWRCTL_SLOT is a tristate symbol why be a "y" instead of an "m" 
> i.e. compile this into the kernel instead of having it be a module ?

It can be compiled as module if this is preferred.

>
> ---
> bod

-- 
With best wishes
Wenbin


