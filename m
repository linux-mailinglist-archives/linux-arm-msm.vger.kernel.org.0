Return-Path: <linux-arm-msm+bounces-52265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F366A6D4A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCD20188E2D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F502505A5;
	Mon, 24 Mar 2025 07:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RZCpy7ic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA4D282F0;
	Mon, 24 Mar 2025 07:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742800219; cv=none; b=QwrXy7yQmZvFOOxCNRx5b5nB6PePtlEXBM6/BiBTtnu+khmiKy5m+jJsM3d7oAs9lJxM7X9Kdz5JS9huukAbOLgfVogL0I08lU4hPMldig/xREOnAbLj/OsWAiORcF5BjD9IZgxnDkyeYZJvFrIUsX6y0kaTzGpm2QUzZbbiZA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742800219; c=relaxed/simple;
	bh=/E5r7FctBSlsnK6qvtNAZnnSmDu3x/s835r10KpoGMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DBTp4NH8Pbxh7a+kCHZFIheqfS73eg5CPDRWRP1z0i/D2b+gU0Z4uIWb6x1cZjWVdnvk76E/xBxEErR8R7K2Tn9l4s4/F7I8c3sbNaDcCtSgK+rUf5f0vaA3KFSOSh6m+94jGV1bgch2w2VC/QvUVdiQER0jCImLSA25VLGy7gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RZCpy7ic; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6bxXH000457;
	Mon, 24 Mar 2025 07:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ngufI78IFU7yCiFrUdhla7M+4msjXhssA/3I0fUkc8=; b=RZCpy7icQiOHzGd6
	Ibaq8xuuzPN6Fs7QreXFLZ4h0gzrwj57c8ArPBxXq4cjLVwz5Z4a36W38LuiK0B0
	WrVqqoJxXyIR3ZcYlP28bWbPe89kxvSxdBaj8IosA5g1hMFbGp9d3F9qYMScd5mw
	gJrTydS3ijuzuYGI3LaiuNoOPvJBJWZBJFXkMYDuBXOerewvTJyEhsC8mWhsdnRV
	pWyPjhmfFn/A99fKyjEITU+pJK6wUPoYfvgfWHjr2ChILiS1qGa2Pq2cTgAJevfh
	W8TqVfBblFeujjR5VZcCKGoLstsuR4PCwO3FMq+te+WLNUXv/ETSKc1SXvsP29zA
	0g+Jag==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hn9wbcka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:10:02 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O7A16L028038
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:10:01 GMT
Received: from [10.233.19.224] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Mar
 2025 00:09:57 -0700
Message-ID: <9ea8fe39-b818-403b-bd69-815e58eb2949@quicinc.com>
Date: Mon, 24 Mar 2025 15:09:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: defconfig: enable PCI Power Control for
 PCIe3
To: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk@kernel.org>
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
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <CAMRc=MfZrRp=VuEOLuMY_04JdyRrD+joGL56LwRFQ-+D-8Z_6w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W5rVTvp_6yXf7rqNN-IOLx3unxZyMuqQ
X-Proofpoint-ORIG-GUID: W5rVTvp_6yXf7rqNN-IOLx3unxZyMuqQ
X-Authority-Analysis: v=2.4 cv=CPoqXQrD c=1 sm=1 tr=0 ts=67e1054b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=5vY_lBfp_abUPGzNiLoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=892
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240051

On 3/21/2025 5:43 PM, Bartosz Golaszewski wrote:
> On Fri, Mar 21, 2025 at 8:37 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 20/03/2025 06:55, Wenbin Yao wrote:
>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>
>>> Enable the pwrctrl driver, which is utilized to manage the power supplies
>>> of the devices connected to the PCI slots. This ensures that the voltage
>>> rails of the x8 PCI slots on the X1E80100 - QCP can be correctly turned
>>> on/off if they are described under PCIe port device tree node.
>>>
>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>>> ---
>>>   arch/arm64/configs/defconfig | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>> index 85ec2fba1..de86d1121 100644
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -245,6 +245,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
>>>   CONFIG_PCI_ENDPOINT=y
>>>   CONFIG_PCI_ENDPOINT_CONFIGFS=y
>>>   CONFIG_PCI_EPF_TEST=m
>>> +CONFIG_PCI_PWRCTL_SLOT=y
>> Bartosz,
>>
>> Wasn't the intention to select it the same way as PCI_PWRCTL_PWRSEQ is
>> selected?
>>
>> Best regards,
>> Krzysztof
>>
> For sure. I would expect there to be something like:
>
> select PCI_PWRCTL_SLOT if ARCH_QCOM
>
> in Kconfig and nothing in defconfig.
>
> Bartosz

IIUC, pci slot power driver is a common driver that could be used by all DT
based platform.

-- 
With best wishes
Wenbin


