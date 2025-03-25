Return-Path: <linux-arm-msm+bounces-52423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AC6A6E941
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 06:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF4987A3517
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 05:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023721A8F97;
	Tue, 25 Mar 2025 05:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f8VvlodX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E7B149DE8;
	Tue, 25 Mar 2025 05:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742880057; cv=none; b=h1GfvKlAWj8w2o94irPYQ+8Xc/6+S6YTWetGYF/S33vucvnm0rOA1cZQ9MAlN0ZRaUA3S7PsNhD4WTRGBwnGJoH5C1gBo1dfWCyjCuo1vzm7oGD4HnSTHceHGnZs+u3Q200TlJ84KeHeUcTKOR/nNGt4laCo429Pz7Gg/FqhgRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742880057; c=relaxed/simple;
	bh=qXD97ZUHqYiJnZohYLFLbrftwnOclPGBDCBAuRUUFtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HBhW5P/UxIgT9uCuWpA1YYmt2fmZ8nT01yDgJuI31c2514Zd7zU7MBWeo+ivP3LbaVxblHySQy0rOwD4aJlHilijDuD2o+xG2UkRvrUwBleFybbPrh9mvCsOhe8oW6xyz7u3AqtLQI2zO46B3yEopHD0yd8Kwxtaw3ZxpLwaiRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f8VvlodX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OIj1Ls015727;
	Tue, 25 Mar 2025 05:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/ZKsWZszj9a6vz4X4eyTuRLzkjltBj4c+jz9QDw2gg=; b=f8VvlodXOqa9THTL
	RpikKS9p2GNYuY7JAshP4r2VJNvGEnZLrZCzTnCG9ZaI5nzPGbgr6Khxf8/WPOxU
	hCk3xLbxAw6dKdtAhh0j0DVGHL0oBEV5h9G/xknZ3hIbjaS18VutGVx/d2MdpIrV
	b06g/KeLz0opHyp73BRFtAc6wFPu7fBpN4ujUmCPVch6BmU17bNT2Kj+yXPAcBQk
	dhCvm59USwc4Ol+m1FYqOUBXm1M1v+6fCqYaAFM+XwCAR2PSCXCz1fwYOor3xjoZ
	sTvCuVZnCzdRqsJqsn/HSoI2ygGaihNglrmvxW8+6R8/PDAtVosxBJrPNiFSoVnT
	9xqKXA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hn9wehy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 05:20:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52P5KlIk004471
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 05:20:47 GMT
Received: from [10.217.238.57] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Mar
 2025 22:20:44 -0700
Message-ID: <2bc16a4e-96d6-4175-a52c-e344115fc4ac@quicinc.com>
Date: Tue, 25 Mar 2025 10:50:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: add QCrypto node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
 <2mlmhzllhb5fhcbwtupy2nk74my5hruliayyr3kayrjvmtou25@em5encygrn2i>
 <7b219289-4f3d-4428-a0af-42491acb1cbb@quicinc.com>
 <uohwigzosxv2onh7dtgvhqdkdu2jufiukp6ztxrvfbjoihrypx@cq3apkdx2rhw>
 <d5f67734-db1e-4096-98f9-3f026e4bd46b@kernel.org>
Content-Language: en-US
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
In-Reply-To: <d5f67734-db1e-4096-98f9-3f026e4bd46b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YijUQdsRbaWW6ijmO6YaxxhiAHOV4-qw
X-Proofpoint-ORIG-GUID: YijUQdsRbaWW6ijmO6YaxxhiAHOV4-qw
X-Authority-Analysis: v=2.4 cv=CPoqXQrD c=1 sm=1 tr=0 ts=67e23d31 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=wEgAGjhJSUDKPyw9TBoA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_02,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250035



On 3/1/2025 7:06 PM, Krzysztof Kozlowski wrote:
> On 28/02/2025 15:14, Bjorn Andersson wrote:
>> On Fri, Feb 28, 2025 at 11:01:16AM +0530, Yuvaraj Ranganathan wrote:
>>> On 2/28/2025 5:56 AM, Bjorn Andersson wrote:
>>>> On Thu, Feb 27, 2025 at 11:38:16PM +0530, Yuvaraj Ranganathan wrote:
>>>>> The initial QCE node change is reverted by the following patch 
>>>>
>>>> s/is/was/
>>>>
>>>>> https://lore.kernel.org/all/20250128115333.95021-1-krzysztof.kozlowski@linaro.org/
>>>>> because of the build warning,
>>>>>
>>>>>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>>>>>     ...
>>>>>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
>>>>>
>>>>> Add the QCE node back that fix the warnings.
>>>>>
>>>>
>>>> Are you saying that adding this node back will fix the warning?
>>>>
>>>> I'd expect that you would say something like "The changes to the
>>>> Devicetree binding has accepted, so add the node back".
>>>>
>>>> Regards,
>>>> Bjorn
>>>>
>>>>> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++++++++
>>>>>  1 file changed, 12 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>>>> index 23049cc58896..b0d77b109305 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>>>> @@ -2418,6 +2418,18 @@ cryptobam: dma-controller@1dc4000 {
>>>>>  				 <&apps_smmu 0x481 0x00>;
>>>>>  		};
>>>>>  
>>>>> +		crypto: crypto@1dfa000 {
>>>>> +			compatible = "qcom,sa8775p-qce", "qcom,sm8150-qce", "qcom,qce";
>>>>> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
>>>>> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
>>>>> +			dma-names = "rx", "tx";
>>>>> +			iommus = <&apps_smmu 0x480 0x00>,
>>>>> +				 <&apps_smmu 0x481 0x00>;
>>>>> +			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 0
>>>>> +					 &mc_virt SLAVE_EBI1 0>;
>>>>> +			interconnect-names = "memory";
>>>>> +		};
>>>>> +
>>>>>  		stm: stm@4002000 {
>>>>>  			compatible = "arm,coresight-stm", "arm,primecell";
>>>>>  			reg = <0x0 0x4002000 0x0 0x1000>,
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>
>>> DeviceTree bindings were accepted but the comptabile string does not
>>> properly bind to it. Hence, adding the correct binding string in the
>>> compatible has resolved the issue.
>>>
>>
>> Please then write that in the commit message.
>>
>>
>> That said, what did you base this patch on? While I have picked
>> Krzysztof's two reverts in my local tree, I have not yet published them.
>> So your patch is not even based on v6.14-rc1, which now is 4 weeks old.
>>
>> Patches sent upstream should be built and tested on a suitable upstream
>> branch!
> 
> I sent reverts because author, even though pinged more than once (!),
> ignored reported problems.
> 
> It seems that reverting the code gets some attention, so maybe author
> will fix the original issue and my reverts can be dropped/ignored.
> 
> Best regards,
> Krzysztof

The original issue was not observed at our end during the first time
validation and its due to some environment issue. This patch does
resolves the issue and it is validated against the linux-next master branch.

Thanks,
Yuvaraj.


