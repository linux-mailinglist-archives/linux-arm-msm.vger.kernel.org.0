Return-Path: <linux-arm-msm+bounces-27071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B95D193CF75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 10:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD24D1C21E73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 08:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A4A176FBE;
	Fri, 26 Jul 2024 08:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mPHqZagA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820DB176ABD;
	Fri, 26 Jul 2024 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721981958; cv=none; b=GzGWJ4Zo9nS720ny7yGRItUrKfDzfmIhI54aCaNwtCQGC2BwzMzoLv+P7wAdnuYYmSV6Ut/qyPoUF1A2hcO8QV7uxqLyhMAZpmOpbbpm7bOAc7SKDx/M/ZoCDX1daEWgQlxsvEL3WOETazUx1bqlqGXq8KNeyJVooRaeShp4FU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721981958; c=relaxed/simple;
	bh=b0hZHMHdOCCC1gCaHcvQIdCIQnQjt3SAU3/9jz+NPZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Xmny/pHU15bK5R0sst2WJsvXtmXlr0DfXOcTydYB4bNO4EdRnaRVsZ1IJr3D1hSgy3i9F7oYTEVRnKAbrnpsNH4XQU6+/jaUG2LdFEjeZsAWcXApB7IsPnHav4C9SjFvCua62onmKHG2yAo7Ly3ULpKuqAikLlqT93L5RIbrU9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mPHqZagA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46Q7pI68023458;
	Fri, 26 Jul 2024 08:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TpMvZ/F5VAdyrXjWuZ6honAJQfBiWDrR/whqPTUKyOA=; b=mPHqZagAC4wjMkhH
	C+5aWaJJba9MnKNEch3Lv6rXCigy8kQpRPqCxKd6uiOA/XhGLHPLcwSV29Rm1/Tq
	3PhlAUelangYV4I+9vWO2Etiu9xPpodvN7CyOBwtIrUJd/VMUPpAC405lUHJo8Ug
	TSULnK0qHaf6rICsj9QrXRCosLSIXZ38cZtw7TRRAEGXlAxGFhTRmXzDNKIGOCGW
	LJHLlC9NaEy/kSvkiKHklREZTtATwADOtqNHora1/iJJJ9zOKXJQHcc06X8U7UAL
	NtnD8Z0KgaO1uQHw/+ZzBVrpIHd6Rw6C5wpsUCDTsCvzR9R3zABAhY7mRNPtIqD1
	3/rG1w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40m7sag2bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 08:19:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46Q8J62e025432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 08:19:06 GMT
Received: from [10.218.10.146] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 01:19:01 -0700
Message-ID: <f1c3450d-60bc-4f64-842d-f335338b2986@quicinc.com>
Date: Fri, 26 Jul 2024 13:48:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm4450: add camera, display and
 gpu clock controller
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul
	<vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>
References: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
 <20240611133752.2192401-9-quic_ajipan@quicinc.com>
 <76f5e3c7-a90b-42d2-8169-e5e2211a14a1@linaro.org>
 <ba7d12d3-c582-45ec-beed-e81182fe3252@quicinc.com>
 <95a835e2-9fd9-467b-bd0a-8eeb80ddf678@linaro.org>
 <9c3de930-47b7-45a9-bf7e-6e506ea2accc@quicinc.com>
 <8f7cdb31-c50d-4690-b878-518bad545612@linaro.org>
 <46e6f1f0-d244-4e53-99ce-9fee339dc4de@quicinc.com>
 <f9a23663-7a1d-44dc-8e0b-8463c3c88a29@linaro.org>
 <dd8ad439-f74c-4bb6-9066-73394bb9befe@quicinc.com>
 <164c62e8-6846-4d0b-81f5-8ed6e76abd5f@linaro.org>
Content-Language: en-US
From: Ajit Pandey <quic_ajipan@quicinc.com>
In-Reply-To: <164c62e8-6846-4d0b-81f5-8ed6e76abd5f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: R-gDrgExbxtJjBua--coFMrLSGVUuxwv
X-Proofpoint-GUID: R-gDrgExbxtJjBua--coFMrLSGVUuxwv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_05,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407260053



On 7/16/2024 4:09 PM, Konrad Dybcio wrote:
> On 16.07.2024 10:39 AM, Taniya Das wrote:
>>
>>
>> On 7/12/2024 6:10 PM, Konrad Dybcio wrote:
>>> On 12.07.2024 2:31 PM, Ajit Pandey wrote:
>>>>
>>>>
>>>> On 7/12/2024 5:52 PM, Konrad Dybcio wrote:
>>>>> On 12.07.2024 11:53 AM, Ajit Pandey wrote:
>>>>>>
>>>>>>
>>>>>> On 7/11/2024 3:25 PM, Konrad Dybcio wrote:
>>>>>>> On 3.07.2024 11:16 AM, Ajit Pandey wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 6/13/2024 1:11 PM, Konrad Dybcio wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 6/11/24 15:37, Ajit Pandey wrote:
>>>>>>>>>> Add device node for camera, display and graphics clock controller on
>>>>>>>>>> Qualcomm SM4450 platform.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
>>>>>>>>>> ---
>>>>>>>>>
>>>>>>>>> None of these nodes reference a power domain (which would usually be
>>>>>>>>> CX/MX/MMCX). This way, the RPMhPDs will never be scaled.
>>>>>>>>>
>>>>>>>>> The current upstream implementation only allows one power domain to be
>>>>>>>>> scaled, but that's better than none (see other DTs for recent SoCs).
>>>>>>>>>
>>>>>>>>> Konrad
>>>>>>>>
>>>>>>>> SM4450 doesn't support MMCX and CX/MX domains will remain active so
>>>>>>>> power-domains property is actually not required for SM4450 clock nodes.
>>>>>>>
>>>>>>> It's not only about them being active.. some PLLs require e.g. MX to be
>>>>>>> at a certain level, or the system will be unstable
>>>>>>>
>>>>>>> Konrad
>>>>>>
>>>>>> With active I mean CX/MX rails will be default running at minimum level required for clock controllers. Adding power-domains property for CX/MX rails is like a redundant code as that will also scale such rails at default specified minimum level only. Also we hadn't added such property for other targets DT nodes to scale up CX/MX at minimum level.
>>>>>
>>>>> What I mean here is that, the minimum level may not be enough. In such case
>>>>> you would also add a required-opps = <&handle_to_rpmhpd_opp_level>
>>>>>
>>>>> Konrad
>>>>>
>>>>
>>>> Apologies, but could you please elaborate the use-case where minimum level isn't enough ? I guess for clock controllers configuration min level of CX/MX would be suffice, client will anyhow scale such rails to higher levels depending on their use-case.
>>>
>>> The main issue here is with PLLs within the clock controllers. Nobody
>>> votes for them. It's an unsolved problem and we currently work around
>>> cases where it's necessary by requiring that (with runtime pm, so when
>>> there's active consumers of the clock controller) the attached power
>>> domain is at >= SOME_LEVEL
>>>
>>> Konrad
>>
>> Konrad, this target (SM4450) have all the PLLs connected to CX/MX(again this is not collapsible). At boot the RPMHPD driver would keep the rails at minimum level and which is good to operate for the clock controller. I do not see currently this requirement you pose here specifically for SM4450.
>>
>> As part of the PLL requirement within clock controller, this is definitely a requirement which we plan to RFC soon. There are discussions already in progress on how to handle this requirement.
> 
> Ok, if it works, let's keep it as is until that RFC
> 
> Konrad

Thanks Konrad, please provide your ack on this patch if it looks fine 
for now.
-- 
Regards
Ajit

