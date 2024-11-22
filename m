Return-Path: <linux-arm-msm+bounces-38748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD7B9D5833
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 03:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AA392815CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 02:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E954CB5B;
	Fri, 22 Nov 2024 02:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fI+Xqnqy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCAA13AF2;
	Fri, 22 Nov 2024 02:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732241799; cv=none; b=bacE0EHwZYrLfUFYA3UkhC0OTyH3hEnsUzcQzjf1BDVZZ5DRl9Du0UXCfxGgJoiZCchSJUpmqEqRX2ZRJMeVPt9WjakBMdG4TNGKZOyCgbp3qu0fKZrJOUFXXY1wTYbAi9UsQVQH4YiuA3SM2YqtkPSKeSj2XVQy9t2IiAWmPY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732241799; c=relaxed/simple;
	bh=Qxh4VoR988MNVHxZSNX1FHhxIqHmcSJo0UM6ZWkc/Bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T8R4qiFjAJMg62x+hedzPgq3GqIifCMLOxOGqJj2A/d9adcKztjcOECde3HuTDzCmE4zKttdq1JwcAtv8jp1FMMji0rFKAJnGTINjSwyubefnE5aJygwfmQBGTn2g32pb0YSJuLX6Dknb5gRgdEWJR9Q2YkYOmbdAmrCgtPIEJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fI+Xqnqy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALGl6HL020915;
	Fri, 22 Nov 2024 02:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lC9EgTBbCvdZ5THVVrfvLHr8NQOqRmsT50MIRnTyFAM=; b=fI+Xqnqyca8AmoPa
	aooPib76VnF4co9uuRrm991k9n30L3AzxTi/dLEXe1kHYoc0gjpIgXwGyEuCUjZN
	HhYujmKp/jvdvi84uQw4OxBJcNKUyTju8NmsAfL8C7liAlazka4MD/5qBMRmGIdp
	1nHNNz1lwb/78avdaPo3vB3YkRnvJIgudVoFrexvh72C9JTsI9JtcRtJzCdG6uub
	n/CPS50FVQE84HKcLZwas0XgDWFdafI5+qaOctgDQ+9nr65kNgwWpzFx4/Gdxx6p
	YBjGvL8MbFdru1ZgOKbSRC+b2RaibhrJ7kIH1tyC5MSKTKDAeeo8BNICFadfHipg
	diHtIg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320wk2ryq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 02:16:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM2GS16031392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 02:16:28 GMT
Received: from [10.253.34.50] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 18:16:24 -0800
Message-ID: <856982c0-f411-48c6-9ef0-c2b21f849304@quicinc.com>
Date: Fri, 22 Nov 2024 10:16:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: bluetooth: Add qca6698 compatible
 string
To: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao
	<quic_rjliao@quicinc.com>,
        <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_mohamull@quicinc.com>
References: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
 <20241120095428.1122935-3-quic_chejiang@quicinc.com>
 <smwxrjvdvyxw6tknucl6fb5jpjau2q4jcyjxpunbtt5ep6xsr4@ztuyfkrwgxoo>
 <44932c08-000f-4e6c-89b3-d7556a0a7a88@quicinc.com>
 <CAA8EJpq1u6ngze81LKAcGzQEJz=yJ-u6MjvRMJHdKp3aPVnewg@mail.gmail.com>
 <e8645b6c-7f78-4051-9e29-2276197714ed@quicinc.com>
Content-Language: en-US
From: quic_zijuhu <quic_zijuhu@quicinc.com>
In-Reply-To: <e8645b6c-7f78-4051-9e29-2276197714ed@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: O5pYA4s_CJCRiKY4m2Hy-A1WWwdxm6W-
X-Proofpoint-GUID: O5pYA4s_CJCRiKY4m2Hy-A1WWwdxm6W-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220018

On 11/22/2024 9:55 AM, Cheng Jiang (IOE) wrote:
> Hi Dmitry,
> 
> On 11/22/2024 12:28 AM, Dmitry Baryshkov wrote:
>> On Thu, 21 Nov 2024 at 06:12, Cheng Jiang <quic_chejiang@quicinc.com> wrote:
>>>
>>> Hi Dmitry,
>>>
>>> On 11/20/2024 6:44 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Nov 20, 2024 at 05:54:26PM +0800, Cheng Jiang wrote:
>>>>> Add QCA6698 qcom,qca6698-bt compatible strings.
>>>>
>>>> Why? Is it the same chip as WCN6855 or a different chip? Is it
>>>> completely compatible?
>>>>
>>> They are different chips. But it's compatible with WCN6855.
>>
>> So, do we really need new compat? Will/can it use the same firmware?
> We need to use a different firmware. Let me check if using 
> "firmware-name" allows us to omit the new soc type. 
> From the driver's perspective, the only change is the need to load a 
> different firmware.
> 

it is a good idea to use existing optional property firmware-name to
specify RAMPATCH additionally. that would simplify logic a lot for your
requirements. (^^)(^^).

>>
>>>>>
>>>>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>>>>> ---
>>>>>  .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml   | 2 ++
>>>>>  1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>>> index 9019fe7bcdc6..527f947289af 100644
>>>>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>>> @@ -18,6 +18,7 @@ properties:
>>>>>      enum:
>>>>>        - qcom,qca2066-bt
>>>>>        - qcom,qca6174-bt
>>>>> +      - qcom,qca6698-bt
>>>>>        - qcom,qca9377-bt
>>>>>        - qcom,wcn3988-bt
>>>>>        - qcom,wcn3990-bt
>>>>> @@ -175,6 +176,7 @@ allOf:
>>>>>          compatible:
>>>>>            contains:
>>>>>              enum:
>>>>> +              - qcom,qca6698-bt
>>>>>                - qcom,wcn6855-bt
>>>>>      then:
>>>>>        required:
>>>>> --
>>>>> 2.25.1
>>>>>
>>>>
>>>
>>
>>
> 


