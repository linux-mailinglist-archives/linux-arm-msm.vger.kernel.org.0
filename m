Return-Path: <linux-arm-msm+bounces-41979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CB09F0A5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DD9A1885310
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881AA1C3C0C;
	Fri, 13 Dec 2024 11:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mXOqpihD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDDD1C3BF7;
	Fri, 13 Dec 2024 11:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734087812; cv=none; b=H8FSJS1oBhyQY+J+NEcBZPUi/54WlKHNSCz59gzL791rnthq0cFSNEuy50wY7DAcFzYPQUutiP9UxGGk7jlBW+hzyRNUZyFvyryDApEkYxyI+tQwXYrHgWIMEsSOXrQ3mLfx3mxN4X0ezxt+cpceDe4Z6DFJxZKaGhgrUlXIP7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734087812; c=relaxed/simple;
	bh=Y78Mz78RAdNwHQ8ftX2m65E/Vh21ww/qnriYusuHvio=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SP84V/HGQc1YrbpVI6ymJ6RC+fUdZ81wLEdw53lNh2aOgPQ7ralWJXOfNFGqf0o/UZIA7bYrJQy5QOkOJSbXoD+azWs92OogvVhPWkKMw97oxTk8RzTg6Aou6sy2GZg0ebMrlngRLltnpM4c+pi9O+P7QrkINe75k0GFtO9zHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mXOqpihD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDA3waB013188;
	Fri, 13 Dec 2024 11:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n9tYyFO/FaDLbzKfGlWc+DC2EscPlqUCrQMQM+7bmiM=; b=mXOqpihDdWYJ+DW1
	3oZ1apOUJ74XNUtggGedXrTncgxt5hy135PboTJLdLiFCn7hh/U28wqelK6jyg5d
	y0fbN6tdCk3kWd748iaRogz5Rx2S5iCc3QDyr8pJ7p6bUyje4eIL0exGEa0gHidH
	+5DKNdjvAFSjDozn8EOGnJFavf0YnplIcsCjgYMLHLYJUTkqMRSmoTzXTa0c/x1C
	0dlrx8Oay8JF14z19x0wE6aJXUP3LEE/ZMtkn8GSUUP2as93hmhvffGIVT2e2ebr
	2b8V84N466I9nP8my3sTNUR8kKCaop0nA4CCw3tDCkpOqf+SD7U4fNRxzuIQ1bag
	45UrCg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjudg6d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:03:26 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDB3Pb8029402
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:03:25 GMT
Received: from [10.239.133.118] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 03:03:20 -0800
Message-ID: <9104547a-9bb7-47ee-b360-07678a320844@quicinc.com>
Date: Fri, 13 Dec 2024 19:03:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Enable secondary USB controller
 on QCS615 Ride
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20241211-add_usb_host_mode_for_qcs615-v2-0-2c4abdf67635@quicinc.com>
 <20241211-add_usb_host_mode_for_qcs615-v2-2-2c4abdf67635@quicinc.com>
 <cc3edfc6-f53c-401b-b766-f8e560eb24b9@oss.qualcomm.com>
 <4476bfe9-41fb-4ec3-b352-624fba75cf3f@quicinc.com>
 <CAA8EJprMTtJnpeG0itjm157pzspJ50BVCv5SpYfqzkUYyKHZ+w@mail.gmail.com>
Content-Language: en-US
From: Song Xue <quic_songxue@quicinc.com>
In-Reply-To: <CAA8EJprMTtJnpeG0itjm157pzspJ50BVCv5SpYfqzkUYyKHZ+w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3sitWRhNfEEM8-2kJ3A_h7Q7ZCdyybOp
X-Proofpoint-ORIG-GUID: 3sitWRhNfEEM8-2kJ3A_h7Q7ZCdyybOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130076



On 12/13/2024 4:12 PM, Dmitry Baryshkov wrote:
> On Fri, 13 Dec 2024 at 08:59, Song Xue <quic_songxue@quicinc.com> wrote:
>>
>>
>>
>> On 12/13/2024 2:14 AM, Konrad Dybcio wrote:
>>> On 11.12.2024 9:26 AM, Song Xue wrote:
>>>> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>
>>>> Enable secondary USB controller on QCS615 Ride platform. The secondary
>>>> USB controller is made "host", as it is a Type-A port.
>>>>
>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>> Co-developed-by: Song Xue <quic_songxue@quicinc.com>
>>>> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs615-ride.dts | 28 ++++++++++++++++++++++++++++
>>>>    1 file changed, 28 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> index f41319ff47b983d771da52775fa78b4385c4e532..26ce0496d13ccbfea392c6d50d9edcab85fbc653 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> @@ -203,6 +203,15 @@ &gcc {
>>>>                <&sleep_clk>;
>>>>    };
>>>>
>>>> +&pm8150_gpios {
>>>> +    usb2_en_state: usb2-en-state {
>>>> +            pins = "gpio10";
>>>> +            function = "normal";
>>>> +            output-high;
>>>> +            power-source = <0>;
>>>> +    };
>>>
>>> Does this go to an enable pin of a vreg / switch?
>>
>> Thanks for comment.
>> We go to enable the pin of PMIC chip. The pin of PMIC is connecting to
>> host-enable pin of USB converter. Need pin of PMIC chip to be high
>> level, when USB is as host mode.
> 
> What kind of USB converter are we talking about?

It is like USB charging controller and Power Switch.

Thanks
Song
> 
>>>
>>> I think we settled on describing such cases as fixed regulators
>>> (that are always-on for now) - would you remember, +Dmitry?
>>>
>>> The rest looks good.
>>>
>>> Konrad
>>
> 
> 


