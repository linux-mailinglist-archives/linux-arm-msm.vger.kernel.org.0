Return-Path: <linux-arm-msm+bounces-52497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EAFA70EF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 03:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5CE116B6D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 02:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7FF13A86C;
	Wed, 26 Mar 2025 02:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EAIgLZ7t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC93376034;
	Wed, 26 Mar 2025 02:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742955897; cv=none; b=Tc0uAsfC4jMYD2/VR2BYgxyvW7E4paViAxcL5jJwYhW+rnyPhyjGm3pFG4eUkHjnbwfGMTw/dmK1DQZvItuTJWYVPiGjgiHQuCd/OTe0chFI5URUCJnQGtqlUHTXAt8xq9LEbzYiDRY+tmXSg6lU+hrqHlTvYzyT1FsyKiKVtjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742955897; c=relaxed/simple;
	bh=1BUPVkqMFasCU5WhK8Ft7Rrnkt/BIQYUmfyxZjEuw4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=igjYYp7/byli5/ieiIm6qggVlVkgozi6A/qUF2npJS04Q3vRItSmbBEfqmwmfh5CmD50LvtfrIpQRLmC9OkdVPO+ctEriZ7YUACONWQBPN0E91MZwLAynsiqWRrXxLpYErexXPcEscj8gv99uaOA5oo7iH7kFcYDW5dqYsVwBvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EAIgLZ7t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PGaVig014435;
	Wed, 26 Mar 2025 02:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nHvdmnGDWmN2+ek+yppcGVoDBmxrqx9exoQKZVIwT7I=; b=EAIgLZ7tFDGeM8dJ
	lv81bThRQJKNSPJgomw2RQ3z1VdZLDvZU+6KmhWyEti+LJBYH1LehQSVqeHXuRHJ
	j56FiTrwTENzjik3I4ypxfw8t485XWYFJgzOKU8dAP/IHfsvj6R+Z8z6Xr0L8hMO
	cNOsDTCbFwBbarhlR61tvvLQX3sCq2T3lOQrdrbdxhquTibTyPQL59KWv2XjgSF1
	Tnt1jhrLQGvZOvsgB8RiPz8JmsoXeZBBXN+1fvSb0sK+IjXeQn9ZbTk8RrG1qlwG
	dxwvFWp02v3DXW55w5cH08OXy4q2Erz9ahGhtSq/ov243PG+h2DcbzsFBxpmycDL
	r0xoDQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45k7qjdcuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 02:24:38 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52Q2ObW9021429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 02:24:37 GMT
Received: from [10.233.19.224] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 19:24:33 -0700
Message-ID: <a0c0d25d-4004-4a95-83c0-36fc76c35e7b@quicinc.com>
Date: Wed, 26 Mar 2025 10:24:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: defconfig: enable PCI Power Control for
 PCIe3
To: Krzysztof Kozlowski <krzk@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <quic_qianyu@quicinc.com>, <sfr@canb.auug.org.au>,
        <linux-arm-kernel@lists.infradead.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <20250320055502.274849-2-quic_wenbyao@quicinc.com>
 <694b6638-92b2-4ac0-a175-bd29aea6cba9@kernel.org>
 <CAMRc=MfZrRp=VuEOLuMY_04JdyRrD+joGL56LwRFQ-+D-8Z_6w@mail.gmail.com>
 <9ea8fe39-b818-403b-bd69-815e58eb2949@quicinc.com>
 <fbd5c153-b73a-4dbc-a923-4e3d3924e748@kernel.org>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <fbd5c153-b73a-4dbc-a923-4e3d3924e748@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _hdiVxvW5NL98UkZ_7FgRmKcIXS60dLJ
X-Proofpoint-GUID: _hdiVxvW5NL98UkZ_7FgRmKcIXS60dLJ
X-Authority-Analysis: v=2.4 cv=feOty1QF c=1 sm=1 tr=0 ts=67e36566 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=QgMpMe-T9jvHLLvuksgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=960 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260012

On 3/24/2025 3:38 PM, Krzysztof Kozlowski wrote:
> On 24/03/2025 08:09, Wenbin Yao (Consultant) wrote:
>> On 3/21/2025 5:43 PM, Bartosz Golaszewski wrote:
>>> On Fri, Mar 21, 2025 at 8:37 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>> On 20/03/2025 06:55, Wenbin Yao wrote:
>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>
>>>>> Enable the pwrctrl driver, which is utilized to manage the power supplies
>>>>> of the devices connected to the PCI slots. This ensures that the voltage
>>>>> rails of the x8 PCI slots on the X1E80100 - QCP can be correctly turned
>>>>> on/off if they are described under PCIe port device tree node.
>>>>>
>>>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>>>>> ---
>>>>>    arch/arm64/configs/defconfig | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>>>> index 85ec2fba1..de86d1121 100644
>>>>> --- a/arch/arm64/configs/defconfig
>>>>> +++ b/arch/arm64/configs/defconfig
>>>>> @@ -245,6 +245,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
>>>>>    CONFIG_PCI_ENDPOINT=y
>>>>>    CONFIG_PCI_ENDPOINT_CONFIGFS=y
>>>>>    CONFIG_PCI_EPF_TEST=m
>>>>> +CONFIG_PCI_PWRCTL_SLOT=y
>>>> Bartosz,
>>>>
>>>> Wasn't the intention to select it the same way as PCI_PWRCTL_PWRSEQ is
>>>> selected?
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>> For sure. I would expect there to be something like:
>>>
>>> select PCI_PWRCTL_SLOT if ARCH_QCOM
>>>
>>> in Kconfig and nothing in defconfig.
>>>
>>> Bartosz
>> IIUC, pci slot power driver is a common driver that could be used by all DT
>> based platform.
>
> You are not responding to the raised problem.

There is a slight difference between PCI_PWRCTL_SLOT and PCI_PWRCTL_PWRSEQ.
PCI_PWRCTL_PWRSEQ is selected by ath11k/ath12k, but PCI_PWRCTL_SLOT has no
specific endpoint device driver to select it. Could PCI_PWRCTL_SLOT be
selected along with HAVE_PWRCTL when ARCH_QCOM is enabled? Or can we add
select PCI_PWRCTL_SLOT if HAVE_PWRCTL in the Kconfig of portdrv?

>
> Best regards,
> Krzysztof

-- 
With best wishes
Wenbin


