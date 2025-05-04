Return-Path: <linux-arm-msm+bounces-56674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CC4AA839A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 04:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6773C3BF752
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 02:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724AA54640;
	Sun,  4 May 2025 02:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mJQM36X/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40DF2FB6;
	Sun,  4 May 2025 02:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746325069; cv=none; b=MmVA266tEQrED2aoMHkGb/i7oRrSgN9R4YiYmpvR+E8fBD64QTtHitE+MMflNBF54BiOu5K0Umy0zKEU6Cy1O38VkhKNlC79v6DR44HWkU7L/StkOoBodTgwnes7NU14uKCYKAaa90+uugu4u3v29fHoswHRLkVYnCxGTmMALns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746325069; c=relaxed/simple;
	bh=5NeyMMIS4SZYCdUdtWmJdCjRc+ODgHvf4ZgdwiJJnD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qmwffx8605kHEvI4k5wLLycjQUNPO/k0O8rMoovDe6HUpszR0RtqKww/On/FItqzbOwXy92pycBPqr1fjk+xfL8a4bbjF+1jSYEIBL5UKSILWIwqhe/LXdU8fgOQXHdv0NtDzDZbquL5C1JhQUJruCAED2ZCgdmgZwMlukJELTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mJQM36X/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5440sdVr029355;
	Sun, 4 May 2025 02:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XyUBmEte4QszpyUnEqycbjY7YzHmOGbdtPVYj57blxs=; b=mJQM36X/ASBl2HrP
	Jmsye/BYuOnYVhcWdobHInUU/Ofim14VGNBBFjK/oqCjAdTwh+TmTxREgi3/hSZM
	BLAuhBHl4QZDVA/m0SOyrnuIcW0CXUOCs/oDbsk9W9GGBv3QefDmQoqjNYj15Th7
	+wyUzs3ZiajshnSgTqAFq573j5VsnuCIt0V8Gl18nw+SJQELZTxpukd3teChtc1T
	PLyVoI5QZb0QABb8ndYInjuZmKvODhpuj1YyVPND2Ruq7U/5hYgyB2CRhpHteH3f
	GzIr6NSb/6f8YSft5ugcrd9sc5OeJCmYJ1EEh+7e2VorpvomsRwVHFoiZzBAeCYM
	f+UzEQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rse97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 02:17:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5442HSqD015670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 4 May 2025 02:17:28 GMT
Received: from [10.253.79.250] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 3 May 2025
 19:17:24 -0700
Message-ID: <35dbe18b-2c10-4af2-8ffc-05278158be68@quicinc.com>
Date: Sun, 4 May 2025 10:17:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Update IPQ5018 xo_board_clk to use
 fixed factor clock
To: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-6-27902c1c4071@outlook.com>
 <frlw5n2fxu5wxrlaahiuwlgaeg4rsqk7ushpcgvc2q4mzorrzf@e4axknhir4el>
 <DS7PR19MB888312EBE14582523C3B95209D8D2@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <DS7PR19MB888312EBE14582523C3B95209D8D2@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hmTCiVMof6DDP74HuMGvZMmTRFMwCj1_
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6816ce44 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=rGiGdXKnD2MgKQmdEHQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: hmTCiVMof6DDP74HuMGvZMmTRFMwCj1_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAyMCBTYWx0ZWRfXzDJbOfqc992O
 os3xN0E5bFRcozVc0QYaSOXfVM9Rq2BT13cuufWbulayRmMV3jxjeFGI2m8jaqZExeNphg5YNje
 voJi5cILtaXqQaRpi0wOwCcd2hMhgmuBS3OOIzOFbi1DwqQjfyN8/Uuzf1wbRkq+EZ8CKlhYoKW
 gCGrKdDgbFEyXzncp94eaaI+LOibx+/wZv6jlKMq7rREI7B8ziB3bqCrPdtX6GEneR9rYvaXxM/
 QoS4W99BIGBu588rCUvR8PgcL8BJX4nnNlAlhm2DwyQHprqbRvry1F9eNXv3TL000veRBK7Od/Y
 K/Lk5zf0os3gLIqBSeHLPr87k7hn4COekV6wkJKAHgEzRx9CPX4f5Q3/0Avh+jRp5u+27C1U9hd
 EpoqbHclrOrPZSr9yOwWtp7zbWiFLfYeTD7Rm2YwYPlSxgJxykU7lROZtHM/1M5j4+llFNQR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=862
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040020



On 5/2/2025 11:53 PM, George Moussalem wrote:
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55- 
>>> v1.dts b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
>>> index 
>>> 5bb021cb29cd39cb95035bfac1bdbc976439838b..7a25af57749c8e8c9a6a185437886b04b0d99e8e 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
>>> +++ b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
>>> @@ -124,5 +124,6 @@ uart_pins: uart-pins-state {
>>>   };
>>>   &xo_board_clk {
>>> -    clock-frequency = <24000000>;
>>> +    clock-div = <4>;
>>> +    clock-mult = <1>;
>>>   };
>>
>> Is the divider a part of the SoC? If so, please move these values to 
>> the SoC dtsi file.
> 
> my 'best guess' is that the ref clk for ipq5018 is always 96MHZ and the 
> XO board clk is 24MHZ, so it should be safe to move it to the dtsi, but 
> this is purely based on the 5 different board types I have.
> 
> @Luo Jie: can you confirm the above?

The xo_board_clk is achieved by the bootstrap PINs, which should be
always 24 MHZ, we can move it to the RDP common DTSI if it is existed.


