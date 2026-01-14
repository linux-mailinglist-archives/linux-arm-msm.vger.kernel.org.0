Return-Path: <linux-arm-msm+bounces-88893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD5ED1BF55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 02:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9797301F8F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 01:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6951D2E9EC7;
	Wed, 14 Jan 2026 01:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYBAir8A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4yTelpc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E4D2BEFE8
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768354721; cv=none; b=SAFoEOq5ruZ4LG01LO0ulbNcm/WrXXgMeIqbWRdqWzp3HzVphTnhCVYC5Jfl8Fx6rQgtDBiW2HzJIeOGv44VUI33dv1jF9hZ6r8cUe6nql53Hpyas1QmOwf13xMP8/5+2UkF6t7OAweWKJgs6wi1qIFmbXJ/6XX00DdXS/EFXUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768354721; c=relaxed/simple;
	bh=KK8wnxIaKlArpxryP/lw3jZCYJxqDR58ifuFphzujQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFYASqzBf573GwXhI+5SX2lH+5y5jK0uRiMDhNu6dqkHUAOaZOPBPD5dpxE8VfY7y1/USrJcEhjZxdKAVw4/QynBYxDl+SDipdiitVhKKV08oykgCTssW2J98EManCX8u3OJKFLpcVzZnWiIq5iSJPWPRZz1663/W8LIkST8MdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYBAir8A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4yTelpc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E178uk1651274
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+JxpUs01w1ZHDzz6b1KIXflRCXPF+YyWM6dLPPydn5U=; b=CYBAir8AvwPZabpN
	aHmL6WzAR7tPWvWGhHZhRLIRl82cz+YaNI5OFl/uSu73m8mEuxP+ZzTyxarkl7t7
	GleP/7zVBJDVMJR689AsSkQqGCWdF8h+Ncag79DzsEqzX5rs2tB2es4aq3R/E80D
	X0cBGvGUPx3HC1AOVRJanGKmFY/HIyg9pDwsEauQ0nLGgLS7hPTkvn6idhdjajER
	PrgD7sEbBbHit23Nx6Ay+eJPWrDORiSkZTUu34bFCJiFXzVYSeKWyEsulw1ocXvc
	dmk8/xRzYjfrl4hLJ5WeNBLJtBOFiD4yxbc5RAqBqq4PWXBEG2cq2+/9xTSD6FBM
	3H2iOg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp16x02j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:38:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c3dfa080662so222044a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768354711; x=1768959511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+JxpUs01w1ZHDzz6b1KIXflRCXPF+YyWM6dLPPydn5U=;
        b=L4yTelpcjJb9HI8BU2/UMdJTw3NMt6wbtsei0iYA55dQmgoiK4igCmZTVbRFjOlmBU
         r6hTFnlQpVuhmqC0OhCH91B/tt5tvBlZVbQbZ/Jg5TSPjg3IgyGnrF3o+6rmNyJ1fh/n
         aJKlzhqJ+vRUOPTcrPAgHP0pgL6EyAlOL0onMxF4IJM0nOVHq9Ieb0zjflZCLr3ZUaXy
         WEuo7NkinQWvs/5VZYlQtiV6KNJLnF6bsDxcyoArUrMkCzthfNdbJMvSQ4bCu1wUkzvm
         eMPAGXCS5wJXS8CyUV0jAhEs4j1cjssrqbmd2GetDtOLwd+/RCUhyr2RTAdcaVlX8pz0
         w8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768354711; x=1768959511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JxpUs01w1ZHDzz6b1KIXflRCXPF+YyWM6dLPPydn5U=;
        b=oLFYW715Zcmidob2CcDp1HfNiLViC+fs6eCLWivhYPW/EbxM4ShfG7VHrZFOYncp3/
         sixy3PcTRVAPrj86lVLQnSAgObAhFzI/aYH0w/UMQM6jWLEBRFQaOp3y+QZR4Yi8UF5D
         Ve3/XiZibxl6N8pINJmZ/HEIAPIha1vb4tcm4MSbVb0mqVoeidcOm9R1DXJWSui6vZt7
         0Mf1PFJEGdfI7D9XqJywaPO02Kw5hJ9uAo96UiJrvpfn9Rf17XJPy+FZMqLi3DnIgiPs
         NTAoqN6NBpJyx+9UNEmK2GvUPZpZkVPziHxdeboFIq2exS2JqbjT7Mcf9Cxj98FoqApx
         qDvg==
X-Forwarded-Encrypted: i=1; AJvYcCX/ID658F+LRcTv/DU/nf8sSV44VOpphPokPljulrMTVEwnmmM8+CsSAmzxxoiUsBlQq150sZpZptv7Pxj6@vger.kernel.org
X-Gm-Message-State: AOJu0YyUj8dh8HKW4Uw9+x2qGm4y77Z7HCq/3lJLkOWGgQdXFWzeMKxf
	W5T2SWIzeVWX257QbbdAAkPPoC2CHcK0XAV9+Cb0Cx8tNm3a4GXmD690b5fEeK0vwIKPIuzLxHO
	gbu320sXBvJYYMjVEF0NvNDVjq0J4zbr8EqZcOTh/6OKW5OFeeRQSagj1jwos3mcwk2WA
X-Gm-Gg: AY/fxX5iYnvQFC1oYnSwt5BF9+DArztu5oU5DbyHnfO9OQoP5VSQV5ctY9DCxBZ7kxe
	uofOT/sw6Plun4HrqgLMIJGAQndAZNvvWzshN4JVgucQ6v7WcdjFhXV6/2/hkwtQ830GFYYXp42
	dLR5RgN9mkbMbT21d/DtGSmlLJGgTvG196qcSA6CM6VfZaEiLtb0wSjr09pHZE10piOUA44M4dA
	XEU0iiA3rji98XHuC73HtkNM1x9C7LtAQUCo3cuFl0INvi1V3AOMeoNFdaVvNa30Rea6TtJU3Bg
	jB4PJkkdG4dy/PUA3eOB9XmSLxkZGlFtvzATEsoxg+3yId5frQY6kBY5GSwVXPjuL7FtmNAHkeC
	Fon+7oysmXhkFpsApyrDAZAFmTfhM8QH0EHCdHO7IwuXjGM3o37ZCpuTkg83OvQR4HBq04yXxBp
	hWPw==
X-Received: by 2002:a05:6a21:3086:b0:2cf:afc1:cc3c with SMTP id adf61e73a8af0-38bed2f52b9mr1029655637.16.1768354711447;
        Tue, 13 Jan 2026 17:38:31 -0800 (PST)
X-Received: by 2002:a05:6a21:3086:b0:2cf:afc1:cc3c with SMTP id adf61e73a8af0-38bed2f52b9mr1029629637.16.1768354710928;
        Tue, 13 Jan 2026 17:38:30 -0800 (PST)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faf8sm21879256a12.7.2026.01.13.17.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 17:38:30 -0800 (PST)
Message-ID: <e10925ab-85f5-460e-96b0-fc7c219c9517@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 09:38:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add PURWA-IOT-SOM platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com>
 <20260113102822.590677-3-yijie.yang@oss.qualcomm.com>
 <nfhjbfqflsrye7hqbtgwr5hwkwdtq5z4tbvnta7lk7p7jtvhl4@zbttn6coc7br>
 <7050d5e6-ddcc-4ccf-99b6-0888318c5d7f@oss.qualcomm.com>
 <cjp7sppitjxu4utsag3dqn4k3hvfsczcnv3h32uwjotwidklin@xmxbe3jqmovs>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <cjp7sppitjxu4utsag3dqn4k3hvfsczcnv3h32uwjotwidklin@xmxbe3jqmovs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ULLes7mBDIhU8opE4MAJPHv4CAuPKUUQ
X-Proofpoint-ORIG-GUID: ULLes7mBDIhU8opE4MAJPHv4CAuPKUUQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAwOSBTYWx0ZWRfX9yAzv5wLWnKd
 0dGpp+TcZjDppn5317H09xDiY5RQ4+jj6LRICbkN7kunM0FVEz4w8hmvzEci2CSFOFqUAExDs02
 5FOBD0RbniQ2VgIAFSzSHzb53kwfJvq41TUtqR+HAEOtsR8a65gdDHpv3ybxosLBCQxBAgOQRPE
 g7aaQwaNDfTv1yykoGDUqy24qvcTtzLbOnWjj9JKpDpWqJ3TfjYyGG8lWL8tmgXPB8z1fFaHv+2
 +u376L3QvT+Xm2CkNEngRMGhVlF+/vEuj8SYCbq6gG9JOopYPnG39O7A9V5Qrh5CHUwDw3+rBTf
 x08ImZ2w27JzYJ74hqxTrPIs4ykf/lOJZpchu18ynZIWM4d6uHR6giljogNhLrj4c/NIqpE+7VX
 NXszSkhwYMVX9BZcu5w7S6ea1EiCaiTO8oBJV5RdzJlAo2/npFC6+IcSz/84UhRx2gs2mrP9e5h
 odRWkZf5TtHZdkUEtvg==
X-Authority-Analysis: v=2.4 cv=JvT8bc4C c=1 sm=1 tr=0 ts=6966f398 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=udvmD9vXOxOWEHquDVAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140009



On 1/14/2026 1:50 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 13, 2026 at 12:29:43PM +0100, Konrad Dybcio wrote:
>> On 1/13/26 11:47 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jan 13, 2026 at 06:28:15PM +0800, YijieYang wrote:
>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>
>>>> The PURWA-IOT-SOM is a compact computing module that integrates a System
>>>> on Chip (SoC) — specifically the x1p42100 — along with essential
>>>> components optimized for IoT applications. It is designed to be mounted on
>>>> carrier boards, enabling the development of complete embedded systems.
>>>>
>>>> Make the following peripherals on the SOM enabled:
>>>> - Regulators on the SOM
>>>> - Reserved memory regions
>>>> - PCIe3, PCIe4, PCIe5, PCIe6a
>>>> - USB0 through USB6 and their PHYs
>>>> - ADSP, CDSP
>>>> - Graphic
>>>>
>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>> ---
>>>>   .../qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi}   | 11 +++++------
>>>>   1 file changed, 5 insertions(+), 6 deletions(-)
>>>>   copy arch/arm64/boot/dts/qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi} (99%)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>>>> similarity index 99%
>>>> copy from arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>>>> copy to arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>>>> index b8e3e04a6fbd..fb90beb1096f 100644
>>>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>>>> @@ -3,11 +3,14 @@
>>>>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>    */
>>>>   
>>>> -#include "hamoa.dtsi"
>>>> +#include "purwa.dtsi"
>>>>   #include "hamoa-pmics.dtsi"
>>>>   #include <dt-bindings/gpio/gpio.h>
>>>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>>   
>>>> +/delete-node/ &pmc8380_6;
>>>> +/delete-node/ &pmc8380_6_thermal;
>>>> +
>>>>   / {
>>>>   	reserved-memory {
>>>>   		linux,cma {
>>>> @@ -378,16 +381,12 @@ vreg_l3j_0p8: ldo3 {
>>>>   	};
>>>>   };
>>>>   
>>>> -&iris {
>>>> -	status = "okay";
>>>> -};
>>>
>>> Why?
>>
>> Purwa has a slightly different Iris hw version (8.1.2 on Hamoa, 8.1.11 on Purwa)
>> which I would assume is slighly weaker, plus there's probably a freqtbl change
>>
>> Let's take this as-is and enable it later
> 
> => commit message, please.

Will do.

> 
>>
>> +Vikash, Dikshita this seems like a really low-hanging fruit, could you take
>> a look at Purwa support in Iris?
>>
>> Konrad
> 

-- 
Best Regards,
Yijie


