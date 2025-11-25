Return-Path: <linux-arm-msm+bounces-83312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7899DC869A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 19:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F12D4352C51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 18:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6805D32BF42;
	Tue, 25 Nov 2025 18:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Jim8+58U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD1F3016F7;
	Tue, 25 Nov 2025 18:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764095244; cv=none; b=KYE9gUwJn9W3SvvbDgeYyuFmBfZqfju2ABb0ZaAm83lJ+mLSn2znFj8kxJbye0kR9stUU2XaJmLWP5vr28WPgTk9XLBRJjcWVFK7VW+uwJbhETnle0gM79pjyMmStMaiKm88sWaSKOwNkr/VPlWkI+B73+1EeJls1vrVOhNNQ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764095244; c=relaxed/simple;
	bh=D5iiZOFCpBi34fnB/V1wZn9h/I60jvhZMNn7bfZ6WbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CL6kWjDQtIkJFGNlKeiNlUOuwtW4Q2qqIkHYooGptrvND/8Ki9AQFZLJHEUR0RvIrDRaSBK9/icwXb6Ma9XQ78qVz87c2txhXY+Z4sKFn+QS2oh//Zkb21KFb3dUnxw6hV8lb2dTVGQtgRla/DZXFY36SrwnOywn21RLMsT5vzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Jim8+58U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APB5Nmr3255832;
	Tue, 25 Nov 2025 18:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	raqFLOf+cjUtyRNavlPkqhmfYBZAW/Kq7rzBIiDQePs=; b=Jim8+58U/nEGqaxT
	gV7thGznZItBDniioLbDTZTYjcwaglIlRSloZwYZNdAdwG1QGKt5M4nF/4md+Onm
	+radVBbK1KK+OqfmBmsP5updRu1zCxinH3d3eGuZRnojQ6VePLTFSXSmab2SpG2l
	Ls8db4Wi+ZDvZspEsozr0iiLTOnyu/eVHE2+O3R0KG6iCX/HFZet4UdHW4NP8Zgc
	j/OE6GYwj1tROPlplHiQHchme6CKSJRVUthB84jTRrKSBlxb93Yv0KZlt2NWk0xQ
	jv7DoSE33PYSFP3a2gQvmGuxtXjPBxlD/4rGpamaBxc3k0CB7ZE8R7SMRqKjtPAq
	9fwthA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anb9c1960-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 18:27:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5APIRGZp022654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 18:27:16 GMT
Received: from [10.216.17.164] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 25 Nov
 2025 10:27:13 -0800
Message-ID: <05a2580a-260b-4cb8-8970-4ec46ee8da7e@quicinc.com>
Date: Tue, 25 Nov 2025 23:57:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das
	<taniya.das@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey
	<ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-1-89a594985a46@oss.qualcomm.com>
 <gxjidpjoc6h2rvuqpv2wjynumj6qfk6ktznte6igem5g4gt4ai@ukflachqlg3i>
 <ab4bd349-9f63-4a2f-b643-414510adf8f9@oss.qualcomm.com>
 <a1ab1656-d140-457d-8b25-f2c65c4770a7@oss.qualcomm.com>
 <ykiqrdylblbfgozswsogqtiqj3tdbjrk77kunllqfwf6dhhwrl@tmcnamk55yh3>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <ykiqrdylblbfgozswsogqtiqj3tdbjrk77kunllqfwf6dhhwrl@tmcnamk55yh3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TBbMPiY5_6HX0B7-AZ-QttRMukDDE_9C
X-Proofpoint-ORIG-GUID: TBbMPiY5_6HX0B7-AZ-QttRMukDDE_9C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE1NCBTYWx0ZWRfX/VyCE5tlKyVF
 aTWVWVEZq7zxHjZ4Za4aIog67L7seO11vVtEsWHpYIMOIBWbFQFipJvoquqFNBegoiEDLVeiaie
 TdaEECsAJTzxfUXw8+VVNluVKXAjaExQ3RmiHv8lDkbJnCg9XsgTLhDw6yJs+yE4lDoMtgGrGxu
 HASKfqktSpCtQmNPhWP9zALBuWZvi6iA5JvQJv+q/S6FECLGClQuayqJmClWRnEeiuBoicSuGzf
 WVNeU3UGtddWgD9m2JOf7iqIRjYUkPifRkFVwSG2i2nER6aNbfggIjt3zBWv+ENR7Dep9iU6OOL
 S+xEVz9nWdT4+tomg1uHGw75z88kKGEvk+/wh4ES5poGGVz2/TBkpmbJzQZWN0BWObMY0dLuY3r
 JFREtMDVYks6AoqTvkMXsQXDayXUDA==
X-Authority-Analysis: v=2.4 cv=VKbQXtPX c=1 sm=1 tr=0 ts=6925f505 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=IjlTTp32iJfPQkFbh5AA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250154



On 11/25/2025 11:55 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 11:45:23PM +0530, Taniya Das wrote:
>>
>>
>> On 11/22/2025 3:30 PM, Taniya Das wrote:
>>>
>>>
>>> On 11/22/2025 2:10 AM, Dmitry Baryshkov wrote:
>>>> On Fri, Nov 21, 2025 at 11:26:27PM +0530, Taniya Das wrote:
>>>>> Add the RPMH clocks present in Kaanapali SoC.
>>>>>
>>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/clk/qcom/clk-rpmh.c | 41 +++++++++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 41 insertions(+)
>>>>>
>>>>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>>>>> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..c3d923a829f16f5a73ea148aca231a0d61d3396d 100644
>>>>> --- a/drivers/clk/qcom/clk-rpmh.c
>>>>> +++ b/drivers/clk/qcom/clk-rpmh.c
>>>>> @@ -395,6 +395,18 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
>>>>>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
>>>>>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
>>>>>  
>>>>> +DEFINE_CLK_RPMH_VRM(clk1, _a1_e0, "C1A_E0", 1);
>>>>> +DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
>>>>
>>>> This got better, but not enough. Why do we have now clk[12]_a1_e0, but
>>>> clk[3458]_a, describing the same kind of resources?
>>>
>>> I am going to fix those as Dmitry.
>>>
>>
>> Dmitry, I have fixed this on Glymur to ensure to use "div" and "e0"
>> https://lore.kernel.org/lkml/20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com/T/#u
> 
> The patch should have been a part of this series. It makes little sense
> on its own.
> 

Sure, Dmitry I will add it as part of this series in the next patchset.

>>
>>>>> +
>>>>> +DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
>>>>> +DEFINE_CLK_RPMH_VRM(clk4, _a2_e0, "C4A_E0", 2);
>>>>> +DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
>>>>> +DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
>>>>> +DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
>>>>> +DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
>>>>> +
>>>>> +DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
>>>>> +
>>>>>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
>>>>>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
>>>>>  DEFINE_CLK_RPMH_BCM(ipa, "IP0");
>>>>
>>>
>>
>> -- 
>> Thanks,
>> Taniya Das
>>
> 


