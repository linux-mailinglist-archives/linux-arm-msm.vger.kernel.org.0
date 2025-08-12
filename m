Return-Path: <linux-arm-msm+bounces-68824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D461EB22BBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 17:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8802E426961
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 15:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622122882DE;
	Tue, 12 Aug 2025 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SrgXhh1C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74C6A921;
	Tue, 12 Aug 2025 15:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755012708; cv=none; b=qLtgz69kHu9Qj0EOwEF1PySyW5qfvG/HvQ9eUE7t/ZT06a+b1sww7vhIAH4Wx+4gtnuNOrp0z5WTw6oBd/2O6hlepRVZpxES5J2F/oTb+imaLb0b8PviDFdH1ChYt7keCkt65F8iO2sDYAeTvQYcwv1SSgOfknKLtvw6Xal0h7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755012708; c=relaxed/simple;
	bh=7Hv+ueAWXCZtucc5ihKieZHy7B8J1yy5o2aV43q1n4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RcFAXIUchM8k5gqZzOBEaS1/RzBR5ggxQut154LNoHQQHbbwn++GkBh7WQesq/5OmbEmqUzoFuXVYvT3sHY9W68sN8R9/dJ6tw3gmDOs0KRaWPuHbwH8tc129wDmz7XoUNVVZc8bw/UfH7kWLzOWEZvz9ggbyzDHn+rW5mqIvHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SrgXhh1C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAw5MP005086;
	Tue, 12 Aug 2025 15:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7blMCBvW2GltCpqVvVOPApYy/QCz0KiQXGkPuenrorg=; b=SrgXhh1C/Js4b0Ia
	qN6WYypsfJa3FB1x3H/Vt7W3s8yfOQMeqUlcAVd/yrt0UFNP/nFxDBRfO5AhzVrM
	o66+ADKtw+Nnz+Sbl8l7US5Aoj0n/kT/ySkkygO7Dxs/BRrsfhdm/Lmpy+WyHmz0
	VG4oaE7Qc69NkMu6QIti6v5VDMmiwhq/PLPcz+17Vxhu1lXNiK/i/lnv1jMptEob
	UlTKAWjSf2IfyNjHp3731al2qs0xqSV30mVDm4k4w3P8iZ4YiuiYc6Go43oyIUTs
	Ek+NMDZ+sTybUEmX2DzpGfZcQ34ABAISQdehPk4O+09M9blTujw5x2mQDcmcCREI
	AXoLuQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmgmd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 15:31:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57CFVgCh012103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 15:31:42 GMT
Received: from [10.216.52.158] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 12 Aug
 2025 08:31:39 -0700
Message-ID: <956e5828-303a-44ce-d41e-0f7b977581a8@quicinc.com>
Date: Tue, 12 Aug 2025 21:01:36 +0530
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
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
 <20250806-b4-sm8750-iris-dts-v2-1-2ce197525eed@linaro.org>
 <e414163e-e171-466f-965d-afb9203d32fa@oss.qualcomm.com>
 <2ok6o4e5pz4ichhchycqkns2afzce5y6ppjr2av4yz3wc3iatk@m3cdck7csavt>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <2ok6o4e5pz4ichhchycqkns2afzce5y6ppjr2av4yz3wc3iatk@m3cdck7csavt>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfXxurZ0jmjwxEn
 XcpM6fR3f42zvOVvQkJeGHlefNG4c/05a71IoUFwq3mAj9KBKC3UWEHl1fWZtc7nJcLS8UP3U2/
 xkyMo7FP5TjmKVpBMj6rSdhc1RD7H++/jbCHl0F8P37DNziG3HOcsf8Z8NNn1PyTECr7Zrm4ToA
 VYisXUFFqvLqqSOtepanQjULOZHXRFxYwTm0CuIH3WY2sg65+e+cQoAj6NOTSeNXwRpiSOXa0Ct
 +UJ/UPJPxYBK+Q+x9PYHOglOQAyhQJ/99b1vynqHh1KuCQC3LBtnBi1yH+S5gMK/TpokS/XLGIo
 +kHGMo2zTl1Nvvf9rhzrN9Yee5fZy1OaRf0eAKFpSNtm7JLbKTP7edbuWt2IbYZK0JrD9rJ0KMr
 QItjEBAw
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=689b5e5f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=U5oYCqrO6Bkvc5ZcE2kA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YLnD3H0oEglZlYbY7akfBn5mPFIsdvNl
X-Proofpoint-ORIG-GUID: YLnD3H0oEglZlYbY7akfBn5mPFIsdvNl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035


On 8/12/2025 8:09 PM, Dmitry Baryshkov wrote:
> On Tue, Aug 12, 2025 at 04:21:12PM +0200, Konrad Dybcio wrote:
>> On 8/6/25 2:38 PM, Krzysztof Kozlowski wrote:
>>> Add Iris video codec to SM8750 SoC, which comes with significantly
>>> different powering up sequence than previous SM8650, thus different
>>> clocks and resets.  For consistency keep existing clock and clock-names
>>> naming, so the list shares common part.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>
>> [...]
>>
>>> +			iris_opp_table: opp-table {
>>> +				compatible = "operating-points-v2";
>>> +
>>> +				opp-240000000 {
>>> +					opp-hz = /bits/ 64 <240000000>;
>>> +					required-opps = <&rpmhpd_opp_low_svs_d1>,
>>> +							<&rpmhpd_opp_low_svs_d1>;
>>> +				};
>>> +
>>> +				opp-338000000 {
>>> +					opp-hz = /bits/ 64 <338000000>;
>>> +					required-opps = <&rpmhpd_opp_low_svs>,
>>> +							<&rpmhpd_opp_low_svs>;
>>> +				};
>>> +
>>> +				opp-420000000 {
>>> +					opp-hz = /bits/ 64 <420000000>;
>>> +					required-opps = <&rpmhpd_opp_svs>,
>>> +							<&rpmhpd_opp_svs>;
>>> +				};
>>> +
>>> +				opp-444000000 {
>>> +					opp-hz = /bits/ 64 <444000000>;
>>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>>> +							<&rpmhpd_opp_svs_l1>;
>>> +				};
>>> +
>>> +				opp-533333334 {
>>> +					opp-hz = /bits/ 64 <533333334>;
>>> +					required-opps = <&rpmhpd_opp_nom>,
>>> +							<&rpmhpd_opp_nom>;
>>> +				};
>>
>> There's an additional OPP: 570 MHz @ NOM_L1
>>
>> +Dmitry, Vikash, please make sure you're OK with the iommu entries
> 
> We still don't have a way to describe it other way at this point.

I could validate the extended "iommu-map-masks" proposal. Given that we have a
new binding for SM8750 [1] , does it make sense to add iommus min/max as [1,5] ?
such that later if new property is introduced "iommu-map-mask", it does not
break ABI.

iommus = <&apps_smmu 0x1940 0>;
iommu-map-masks = <0 &apps_smmu 0x1947 1 0>;

[1] https://lore.kernel.org/all/20250804-sm8750-iris-v2-1-6d78407f8078@linaro.org/

Regards,
Vikash
> 
>>
>> the other properties look OK
>>
>> Konrad
> 

