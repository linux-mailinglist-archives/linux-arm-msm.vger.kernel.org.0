Return-Path: <linux-arm-msm+bounces-63972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BA1AFC362
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F3205612B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 06:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5ACC2236F0;
	Tue,  8 Jul 2025 06:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ordBoJLk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DC72222C3;
	Tue,  8 Jul 2025 06:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751957571; cv=none; b=c/RhM0daQfu6GH1qBe+spLxDoiuVTtnZVG/NOy2C+mIBW2mnwj6xjpspB/bn7YG3cgYR/iJGx6OY+EqKqD8Fh7MHRpiYkqvUIHZlYgknzad9H0ibSxzxOMkHs1pKEyIenFZhVcjhP8vaPTulTCf7U9kym5hShMkG1hk9i8P4CLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751957571; c=relaxed/simple;
	bh=jcG3qlnbWk8WqqGTJYaj2OrAGDNeIKWe3vfXI6RVxBk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=P7YlYF3wdqVeIBHR01BIcm32p7GfZrGIs6g6v86VyTism9pIRxqTkufasqoaz7UTOXsKpjNKHzgmTqaDH5lydqU6FZeCSK7T0f45UNI/2uQOC+J3D5vpGdYi/Rx8Hh3cNzECtHk9SQZ/SSpAqTwVW1IIXM5O9FWUCYK90BJN6aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ordBoJLk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567IN5Ik018796;
	Tue, 8 Jul 2025 06:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RufHfEATVHVY1xtSnpwn1IM85ww4BCIq7kfcaYeKcfM=; b=ordBoJLkNcOw6yYq
	HMILTk0sRvTvsdc/4zKKz0FfWz4mUXtQLNJ1AxOICWXr16dQ02hXotyltV/MHNzk
	wiGmVEbM19puzEnKkwWYkCmIBEdcsfxWo/w31AkoqOXYB1LqZgZYy1bIEbD+uDdS
	GEbSG2MK4FRhoBhE2ND01oKRIEd6nbYhWZqfunqSruO450YaDF6rkZvHiNd3YbyI
	og2PradV/Mfvd7bX2oB0j6peOg3iC8Hx5CUQV+xf8FzzIB75RuW8jq0wtuHeUJVt
	91Qw/Ogpu5WolF4tEvR+J6DlnyhYLoU0XIJFWooLgWhoq4XIsDrooT4zwnuhf3uN
	w2J02A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0wb582-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 06:52:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5686qj4u008058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Jul 2025 06:52:45 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 7 Jul
 2025 23:52:40 -0700
Message-ID: <8c3c55f3-5cfa-42a1-bf39-e1988315fbca@quicinc.com>
Date: Tue, 8 Jul 2025 12:22:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: qcom,videocc: Add sc8180x
 compatible
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20250702-sc8180x-videocc-dt-v3-0-916d443d8a38@quicinc.com>
 <20250702-sc8180x-videocc-dt-v3-1-916d443d8a38@quicinc.com>
 <mzmer4g7df7xqhnstpfhyzcm2irpmsk4iwtx6esjksp34lpkk5@76lrsoyb5cp6>
 <20250703-robust-analytic-hummingbird-88eb3b@krzk-bin>
 <9c463005-3582-4bee-bd9f-cd0b415f5e65@quicinc.com>
Content-Language: en-US
In-Reply-To: <9c463005-3582-4bee-bd9f-cd0b415f5e65@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3V73cH9DMb2qhG2N_vDRFx314db7T_om
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA1NCBTYWx0ZWRfX9fsceRa1EYrd
 XWjOUjmDOrQX/1zM6G2Qlyzuyydpt068TBpvuqcyGfbyxxG2dLED/jS35MdtirmPZLOzk9gtI80
 7uqJqG6J4mF67sD3I3VvFgvgF2gxPprNt//EBf5jRTqcmdDwsUzODI9upeDVNvJq5NN2gQh2Qwp
 6UQc5la2FKvG5jxClI/N5TRfQZJrCEGI/l2XTsL31Kkz78pjXltOejKdKzB4lLUqBvZHd+Hy9Y7
 tSyIBbnWwzTftCzKa8XFSuV/nlMdHuExNNAvIUvDqNT0mknxIo3JvrqJ1HPZI0pCnejKKmKqFFA
 +Y7TUwduMc5qR++uZ7RUndAkAJ4yMqtzApU+JsP3fVJMHTMqjXSvDGqoyX6giIDgBiTeiCs+ijr
 EDgKa4DDVJgQgt2GmmlmgIPjlkkwE6SXI0Ua1u69h7H+2DqPjpTXfHrUe71rxchbzZlyvRVf
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686cc03e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=ela0q1gkDnq4QfPF5NsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 3V73cH9DMb2qhG2N_vDRFx314db7T_om
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080054

Hi Krzysztof,


On 7/4/2025 4:41 PM, Satya Priya Kakitapalli wrote:
>
> On 7/3/2025 12:55 PM, Krzysztof Kozlowski wrote:
>> On Thu, Jul 03, 2025 at 01:29:06AM +0300, Dmitry Baryshkov wrote:
>>>> -      - qcom,sc7180-videocc
>>>> -      - qcom,sc7280-videocc
>>>> -      - qcom,sdm845-videocc
>>>> -      - qcom,sm6350-videocc
>>>> -      - qcom,sm8150-videocc
>>>> -      - qcom,sm8250-videocc
>>>> +    oneOf:
>>>> +      - enum:
>>>> +          - qcom,sc7180-videocc
>>>> +          - qcom,sc7280-videocc
>>>> +          - qcom,sdm845-videocc
>>>> +          - qcom,sm6350-videocc
>>>> +          - qcom,sm8150-videocc
>>>> +          - qcom,sm8250-videocc
>>>> +      - items:
>>>> +          - const: qcom,sc8180x-videocc
>>>> +          - const: qcom,sm8150-videocc
>>>>       clocks:
>>>>       minItems: 1
>>>> @@ -111,6 +115,7 @@ allOf:
>>>>         properties:
>>>>           compatible:
>>>>             enum:
>>>> +            - qcom,sc8180x-videocc
>>> Is there a need for this? Isn't it already covered by the SM8150 entry?
>> Yes and no. Yes - some change here is needed as I explained. No - this
>> exact change does not work, so it is obviously redundant.
>
>
> Yes, I agree. I'll add 'contains:' throughout the schema and remove 
> this compatible since anyway it matches with sm8150 compatible.
>

I checked this further and see that 'contains' is only needed for 
devices having multiple compatibles or using fallback.
Since we are not using the fallback for any of the other compatibles in 
this schema, I will add contains only for the sm8150 if/then block.


>
> Thanks,
>
> Satya Priya
>
>

