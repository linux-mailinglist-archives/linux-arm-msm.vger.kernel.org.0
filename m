Return-Path: <linux-arm-msm+bounces-69102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B677EB25AC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 07:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F23E51B6594A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 05:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303571F4CB2;
	Thu, 14 Aug 2025 05:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cp7JjuGC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3301D63CD;
	Thu, 14 Aug 2025 05:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755148807; cv=none; b=St6lKtNCfX5RHYYVCzXec4sGQSLr80rvo6YnpHksYG7oc15JbEVC4NZNGpf244w7DFvcujjwVujXjZVo2PlLdvAb5EeKOrMCCCCSZUvpbm7yRbUO5tAZZj0FjjAjXyz1pL+nX8odp/SPK3Zq+hqArFTDJbOE1klZIeGFZFeouH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755148807; c=relaxed/simple;
	bh=955GqPAx8+URVP5fY56hA3MhwoymFtwtrSWj9sBohN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tBpWP4XWdjiypf0oYuQV2nhJSQdbt9mcqpSUM6Bq5cBcbUiHSV71iyUFppcvyR270YLLU0X+IIz9rIn6yJMGEXLmNPIdusl3t5onj9ieEo3drCT/OJwkttt+DPQVcfESAu9pVB0ME7sU5KY8OJWKIKk8nnibFwCesqmv1QYj0uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cp7JjuGC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DNM9In012828;
	Thu, 14 Aug 2025 05:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uszgH5P/IYDYRsCNm3CMGbNPevj32rAgSJ0vjKqpt8I=; b=cp7JjuGC9m4cg9Bk
	hJavT0pHqiOmnT/oAsWfz/z43HzZ4xD00lWiY0Kkptq3LUptXdQVcVAsZMmWC51J
	GzCDpRdb6MB2YKyyX41Lb9EwASkzJkUfVUzH7m9rQnu7g3ZmoCNycvpscKZANhcz
	viMNPljp+b32keX0N2RKcjtrG/66W37Wl1SENhSGDaPpobKeOxoFLJG4D+Q/Iut0
	p4as+onvt+kaN59QdG7N6ZhdcZp66UDJHRhYXzB8jsWJgTxGvMBDKdMlVTM4U168
	6hOZqUw71TVYAnJd0gdLlGcXZUPdFrIgmoSceXTQ4vZ4qB1tTnd29VqMzxHuthxW
	kzAruw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxcgqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 05:20:00 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57E5Jxru014048
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 05:19:59 GMT
Received: from [10.216.12.89] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 22:19:55 -0700
Message-ID: <eaafc695-642c-f2db-3745-d17375365621@quicinc.com>
Date: Thu, 14 Aug 2025 10:49:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC v2 1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Prakash Gupta <quic_guptap@quicinc.com>
References: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
 <20250806-b4-sm8750-iris-dts-v2-1-2ce197525eed@linaro.org>
 <e414163e-e171-466f-965d-afb9203d32fa@oss.qualcomm.com>
 <2ok6o4e5pz4ichhchycqkns2afzce5y6ppjr2av4yz3wc3iatk@m3cdck7csavt>
 <956e5828-303a-44ce-d41e-0f7b977581a8@quicinc.com>
 <2vtxgzwsr6sztu35zeebuho3ie4bbifb75v5usxfzcys2ufx4f@fnig7kqij3us>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <2vtxgzwsr6sztu35zeebuho3ie4bbifb75v5usxfzcys2ufx4f@fnig7kqij3us>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX9yZJTlTvqGDe
 Ab/2j9CK9A7CdW9MGycVkIjGtX7B3VCZ/TeqbfB1B5lg8KWFwHmaOL/Ofadw8H+5U0NYp7B+s5a
 K9gZJYQR8/IIwMBosR8rgqJAsCUUDsJf7QMaC0TM1SeTJFs2Rqn1r4qewRKrQtLZfatRWagijZU
 49vZqe8EFzM4bpSgrYaZ39c1TBieM2WolWexLsAgrKzY9yaKc+YQ6lKgX85uTQ4lEn32XT036a0
 +Tn9gQQhabosJJYWT128xAmv+JUqWeu2S56YQNtiG4EjfjRKmnjJGTvJ3Fu/EkMy81aW+ast18d
 BoI/ZVJL+n9wYj+vUZnTp2SErA8yzA2v9boiBdFyVz5PTZ+c9kVUydv1aUeEtaDtUKtKhyAYzW4
 g6RZOXJz
X-Proofpoint-GUID: nl1WqAgO1vGZ5pv-OxhJA5Q_i_MV_r-b
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689d7200 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=IRH4XuX63il44M5YX5MA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: nl1WqAgO1vGZ5pv-OxhJA5Q_i_MV_r-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057



On 8/14/2025 12:11 AM, Dmitry Baryshkov wrote:
> On Tue, Aug 12, 2025 at 09:01:36PM +0530, Vikash Garodia wrote:
>>
>> On 8/12/2025 8:09 PM, Dmitry Baryshkov wrote:
>>> On Tue, Aug 12, 2025 at 04:21:12PM +0200, Konrad Dybcio wrote:
>>>> On 8/6/25 2:38 PM, Krzysztof Kozlowski wrote:
>>>>> Add Iris video codec to SM8750 SoC, which comes with significantly
>>>>> different powering up sequence than previous SM8650, thus different
>>>>> clocks and resets.  For consistency keep existing clock and clock-names
>>>>> naming, so the list shares common part.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +			iris_opp_table: opp-table {
>>>>> +				compatible = "operating-points-v2";
>>>>> +
>>>>> +				opp-240000000 {
>>>>> +					opp-hz = /bits/ 64 <240000000>;
>>>>> +					required-opps = <&rpmhpd_opp_low_svs_d1>,
>>>>> +							<&rpmhpd_opp_low_svs_d1>;
>>>>> +				};
>>>>> +
>>>>> +				opp-338000000 {
>>>>> +					opp-hz = /bits/ 64 <338000000>;
>>>>> +					required-opps = <&rpmhpd_opp_low_svs>,
>>>>> +							<&rpmhpd_opp_low_svs>;
>>>>> +				};
>>>>> +
>>>>> +				opp-420000000 {
>>>>> +					opp-hz = /bits/ 64 <420000000>;
>>>>> +					required-opps = <&rpmhpd_opp_svs>,
>>>>> +							<&rpmhpd_opp_svs>;
>>>>> +				};
>>>>> +
>>>>> +				opp-444000000 {
>>>>> +					opp-hz = /bits/ 64 <444000000>;
>>>>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>>>>> +							<&rpmhpd_opp_svs_l1>;
>>>>> +				};
>>>>> +
>>>>> +				opp-533333334 {
>>>>> +					opp-hz = /bits/ 64 <533333334>;
>>>>> +					required-opps = <&rpmhpd_opp_nom>,
>>>>> +							<&rpmhpd_opp_nom>;
>>>>> +				};
>>>>
>>>> There's an additional OPP: 570 MHz @ NOM_L1
>>>>
>>>> +Dmitry, Vikash, please make sure you're OK with the iommu entries
>>>
>>> We still don't have a way to describe it other way at this point.
>>
>> I could validate the extended "iommu-map-masks" proposal. Given that we have a
> 
> Was it posted? If not, let's get it ASAP.

iommu-range (+Prakash) is a WIP, which is needed alognwith iommu-map-mask.

> 
>> new binding for SM8750 [1] , does it make sense to add iommus min/max as [1,5] ?
> 
> Why [1, 5]? It should be [1, 2] or just [1, 1] + your proposal.

[1,2] should be good for the iris device and remaining SIDs can be covered with
device allocated dynamically via iommu-map-mask proposal

> 
>> such that later if new property is introduced "iommu-map-mask", it does not
>> break ABI.
>>
>> iommus = <&apps_smmu 0x1940 0>;
>> iommu-map-masks = <0 &apps_smmu 0x1947 1 0>;
>>
>> [1] https://lore.kernel.org/all/20250804-sm8750-iris-v2-1-6d78407f8078@linaro.org/
>>
>> Regards,
>> Vikash
>>>
>>>>
>>>> the other properties look OK
>>>>
>>>> Konrad
>>>
> 

