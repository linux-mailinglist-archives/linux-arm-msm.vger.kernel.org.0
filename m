Return-Path: <linux-arm-msm+bounces-23841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A245914071
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 04:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FBCC1F22CEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 02:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EBF46BA;
	Mon, 24 Jun 2024 02:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="osuUdAC8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692D12CA7;
	Mon, 24 Jun 2024 02:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719195758; cv=none; b=hIfz+kMemOtofoOTyt2fiN+3ZilB56jKtMIDopIfoKFf7iqclqYJeim2Jh0vWMNePPQEmF4JMzeod+MtQw8LS6guZdKDXiNmhNLXur+b/xut1cnaA9nehiFRat6kZjlZSFjmEVs3qLLrlNLsRcavZPepoaZ7E/i30KY3qkVdKNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719195758; c=relaxed/simple;
	bh=NJc/1wQz2cF5K+NH6UrIdglOJXmicz7pC1224fwouAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pqzT41B97lNsM1P0R78SwmqWjyCyO6xk9z0DI2ZHL8eNVxEP2FzeQ3Bvs6CABFPa8+Qp7FpSB7MYfeyuTXATCIKpfhix2KaUmQVGnkEn1tOU0oe8eDp0viFmw24zmdI+oTa3jXJYOvv67BodhBr4Ovz2bi4gKDxg0JieOhkJ/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=osuUdAC8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O0QCIT026303;
	Mon, 24 Jun 2024 02:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1e1Nh5HuZAf77NAKCyR2GIxqdMZWdjZ1pNGKL8eFJA=; b=osuUdAC8+l5kXIs7
	eHNUszJ1rziC4kbsoN6cNnLjCx7yEhAXWUCBVFfnM84bYJuqTRlior/CPqTOCj9n
	cCA0bT1qBR01cBps/HjU8TKhOFTqZK5eq74twRaMhunTsDdRMIb2kUr6WeuIolty
	M4RfRbEjlN7njkjX2Vo9pgreJ4dzRvUCXxmAUW/fNzGnueDcWdvTG/jOqsW5IO3I
	PGH8G/Q6sX3Z0r/PTQ09SbbqulmW96DWXiqHDfN6Er2WoeeP7qxGPY92k4MFerei
	n7VMtqMkoAWaFBHE9/OlltLEUDTpLLV1mQyroRHPxmp1CtfUTTsQ2hRc8npamdgF
	7L0m4g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnjrtk39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 02:22:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45O2MThx004250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 02:22:29 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 23 Jun
 2024 19:22:24 -0700
Message-ID: <af2a373d-9627-4067-80d7-3029e6f0fa34@quicinc.com>
Date: Mon, 24 Jun 2024 10:22:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/4] arm64: dts: qcom: add base AIM300 dtsi
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Fenglin Wu
	<quic_fenglinw@quicinc.com>
References: <20240618072202.2516025-1-quic_tengfan@quicinc.com>
 <20240618072202.2516025-4-quic_tengfan@quicinc.com>
 <7eb1c459-90d2-4b49-a226-0ced8216cee6@linaro.org>
 <04517096-38a0-465f-86f7-7e8c7de702a2@quicinc.com>
 <e344335f-be60-4568-97be-728257684310@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <e344335f-be60-4568-97be-728257684310@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: q1wIdE8g6-It4Fy0a0w-_w33H5NAJT32
X-Proofpoint-ORIG-GUID: q1wIdE8g6-It4Fy0a0w-_w33H5NAJT32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_01,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=727
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240018



On 6/22/2024 7:09 PM, Konrad Dybcio wrote:
> On 20.06.2024 2:46 AM, Tengfei Fan wrote:
>>
>>
>> On 6/19/2024 3:06 AM, Konrad Dybcio wrote:
>>>
>>>
>>> On 6/18/24 09:22, Tengfei Fan wrote:
>>>> AIM300 Series is a highly optimized family of modules designed to
>>>> support AIoT applications. It integrates QCS8550 SoC, UFS and PMIC
>>>> chip etc.
>>>> Here is a diagram of AIM300 SoM:
>>>>             +----------------------------------------+
>>>>             |AIM300 SoM                              |
>>>>             |                                        |
>>>>             |                           +-----+      |
>>>>             |                      |--->| UFS |      |
>>>>             |                      |    +-----+      |
>>>>             |                      |                 |
>>>>             |                      |                 |
>>>>        3.7v |  +-----------------+ |    +---------+  |
>>>>     ---------->|       PMIC      |----->| QCS8550 |  |
>>>>             |  +-----------------+      +---------+  |
>>>>             |                      |                 |
>>>>             |                      |                 |
>>>>             |                      |    +-----+      |
>>>>             |                      |--->| ... |      |
>>>>             |                           +-----+      |
>>>>             |                                        |
>>>>             +----------------------------------------+
>>>>
>>>> Co-developed-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>>>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +&ufs_mem_hc {
>>>> +    reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
>>>> +    vcc-supply = <&vreg_l17b_2p5>;
>>>> +    vcc-max-microamp = <1300000>;
>>>> +    vccq-supply = <&vreg_l1g_1p2>;
>>>> +    vccq-max-microamp = <1200000>;
>>>> +    vdd-hba-supply = <&vreg_l3g_1p2>;
>>>
>>> These regulators should generally have:
>>>
>>> regulator-allow-set-load;
>>> regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>>>                              RPMH_REGULATOR_MODE_HPM>;
>>>
>>> although the current setup you have never lets them exit HPM
>>>
>>> Konrad
>>
>> I understand your point is that these settings need to be added to allthe child regulator nodes of regulators-0, regulators-1, regulators-2, regulators-3, regulators-4 and regulators-5. Is that correct?
> 
> No, I only meant the three references in the UFS node (l17b, l1g, l3g),
> although I suppose such properties should be there by default on all
> regulators in order to save power.. but most boards don't do that (yet),
> as nobody wants to waste their time with potentially one more thing to
> debug

Thank you for clarifying this. I will create a new patch to support 
these since this patch series have already been applied.

> 
> Konrad

-- 
Thx and BRs,
Tengfei Fan

