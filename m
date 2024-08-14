Return-Path: <linux-arm-msm+bounces-28542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C1F95214E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 19:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F4601F23834
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8BE1BDABF;
	Wed, 14 Aug 2024 17:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="enix922Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C991BBBF5;
	Wed, 14 Aug 2024 17:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723656821; cv=none; b=hSlm54uQ24N+sFvICXBQL/BW7AF3hSD5PIrqik1awjhrCPX7b+VFUg/xARu7HOr17U2FzVjvFDgq0aGIdNKUfmAzyq4LNDwtrNa9kgIWw21fYOgWSsM2T26zxiX4NpEaT/XRXOfOx/mgPNT6DlmWY/1MJGd1w6KPJPy0Paex+K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723656821; c=relaxed/simple;
	bh=qW313UBQGR3gEXNLUX8gvtIdZKYgGqiIZ9ytYY4uhGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Pelyji0FqMotNw7wylmjTReBTmFRN2jd0e/C7x0bwMg3dad+RusZGvxAjraorjvh7W8hUKaS8Pa6paG6TkRdE6pB0vCZn8hLPC/ZsjwU/gtinP9EJ/FKkdTlcIXVq9bK4AfjQYarOhNncls2BHVI36omCIe8mfnL1qxwnOoBxgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=enix922Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EAIOaQ027669;
	Wed, 14 Aug 2024 17:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0CSchhOZBCnI007wjWG8xfaij950P5dZODlWFqceWqo=; b=enix922YMp2OpEPE
	T0/HmoBawNQgV4Taf6a4WL/8rpmLI44juk6Ng68UyUwXMFitA0CMQ9n2AW/kt3Ky
	XdTqcYlMNToqHU0H/wQgkKSP2gZ2vIPZs1PUa3imFzpCGsGX8/h6BTT+0W8DQVLh
	Ww2CHpPxgqg633CdiJMjOR5+abaOC+gqPKTYzWoEDWziKXkOh6qUDuyM9uGwu30C
	TYt5NwR35XROEiY8vCKjJw2t7aAkWxf7EETiA8AtGr5n14zxnlAfjddOXK84gW0W
	Bf2lztbV2ABW/oik/wFhjF1DedmrIxN4c6qyfPyxRmcLS7Y8vf0ndSB6iA8rtZ1p
	NuQMVA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x3etbx4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 17:33:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EHXYD2009140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 17:33:34 GMT
Received: from [10.71.108.157] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 10:33:33 -0700
Message-ID: <8bb412f8-4fe1-40ca-8414-bb77c66899ae@quicinc.com>
Date: Wed, 14 Aug 2024 10:33:33 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: qcom: eud: Update compatible
 strings for eud
To: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Elson Serrao <quic_eserrao@quicinc.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <20240807183205.803847-1-quic_molvera@quicinc.com>
 <20240807183205.803847-2-quic_molvera@quicinc.com>
 <dfb1ac84-f011-45ea-9fb1-b8c6bc36cabc@kernel.org>
 <46d0627d-877b-41f3-83f6-4c33b562f460@quicinc.com>
 <0ebb1ca3-722d-422f-9f71-fcc61c3470b0@kernel.org>
 <2b118a49-2229-4346-ab21-0aa5377d7a4e@kernel.org>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <2b118a49-2229-4346-ab21-0aa5377d7a4e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nxuzAiGod5w_q4PCUjqp3vfgpmeOsAhf
X-Proofpoint-ORIG-GUID: nxuzAiGod5w_q4PCUjqp3vfgpmeOsAhf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_13,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015 mlxlogscore=775
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408140120



On 8/14/2024 3:30 AM, Konrad Dybcio wrote:
> On 14.08.2024 8:15 AM, Krzysztof Kozlowski wrote:
>> On 13/08/2024 22:03, Melody Olvera wrote:
>>>
>>> On 8/8/2024 4:00 AM, Krzysztof Kozlowski wrote:
>>>> On 07/08/2024 20:32, Melody Olvera wrote:
>>>>> The EUD can more accurately be divided into two types; a secure type
>>>>> which requires that certain registers be updated via scm call and a
>>>>> nonsecure type which must access registers nonsecurely. Thus, change
>>>>> the compatible strings to reflect secure and nonsecure eud usage.
>>>>>
>>>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml | 6 +++---
>>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>>>> index f2c5ec7e6437..476f92768610 100644
>>>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>>>> @@ -17,8 +17,8 @@ properties:
>>>>>      compatible:
>>>>>        items:
>>>>>          - enum:
>>>>> -          - qcom,sc7280-eud
>>>>> -      - const: qcom,eud
>>>>> +          - qcom,secure-eud
>>>>> +          - qcom,eud
>>>> Commit msg did not explain me why DT bindings rules are avoided here and
>>>> you drop existing SoC specific compatible.
>>>>
>>>> This really does not look like having any sense at all, I cannot come up
>>>> with logic behind dropping existing users. You could deprecate it, but
>>>> then why exactly this device should have exception from generic bindings
>>>> rule?
>>> Understood. I won't drop this compatible string. Is alright to add the
>>> additional compatible as is?
>> You always need SoC specific compatible.
> Melody, is there any way to discover (that won't crash the board if we
> guess wrong) whether secure accessors are needed?
>

Unfortunately, no. We considered several options, but none guarantee 
that we will avoid
a crash if we try non-securely. The secure call also won't give a 
specific error if it fails either
(for security reasons) so we can't know if a secure access failed 
because it's supposed to be
accessed non-securely or for another reason; hence this approach. If there's
another way to achieve this functionality that might be better, I'm all 
ears.

Thanks,
Melody

