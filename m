Return-Path: <linux-arm-msm+bounces-79130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A2AC13ADD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9AFBD3510F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B901A2E7F39;
	Tue, 28 Oct 2025 09:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTxfZJ3t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372D42E6CDE
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642290; cv=none; b=jeW1LBQ+c3gSJ0OfQLN4LGyCX54iWPYN91nqJzWvpw0LNRs2B6e5BgZkFKiPpLci9XK96uVAqUUmgAeVgZZJqHbXvVguEW+4VWVw5DReBMS1fuTJvg9QDyi28OLB5bOpXHTxD203K+d8qTZRpSw4/jW35nZIYLvV4iTpH5pfH7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642290; c=relaxed/simple;
	bh=gJL/VQkEebJZeilLCE8uIPc2mNo+c91Tynj4Uuw7Jx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ThAmTYBHlIO8zhS7rvk4iGGOTNf+rePwAuqutkUR4VaQ1sAFLvhGyDUwwH08/PGroiWoMFfNg4YtdaOKVQ0QDunXSMHQfA1FixIewgikrFEO1OE36hDqwaeBwqRB57kT1XFU60dnsqi5mPPFVOq5+VJF2yo7m15GUAIxkNeEABw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTxfZJ3t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S8rwJN2881589
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kgjycyY05GqmtglQxd9XJy3hOTKLwLYP/qRgt/w4UOo=; b=pTxfZJ3t6EtY2/GJ
	F5v9qkUTzh1ABl/3z8zDmBdAFd0ezVjSMroliqwBzOB1HyYeDRFwwWngxNNKb6Ee
	eci0he05mEsQlxI0Z30R12H1sbVi5eXqmZn1LAEjKYLvMeIo0uBzly62/sWgSM3D
	Jxqc7RcnPdoFEWCqGarYmN/UCiU7gSCnSelgtIXCju/ygfgxPO0RJdVyppRuKzgI
	pylKX3bIwaz6dQfb1wHwhrce18+twMqsGwdJ3Q+mnGxl284WIag+ExVPaipwE8ap
	0hq7cVIiCvBhxGbHIxyAgtak4Cd8goUTCOJyhhFvDT0swxmSQwsDpMvPuvk8F9IL
	tlZOIA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a29uhb5uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:04:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87dfd456d01so17042216d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 02:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761642287; x=1762247087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgjycyY05GqmtglQxd9XJy3hOTKLwLYP/qRgt/w4UOo=;
        b=RL41J9U8xK6BZhZQEb17DHt/4UHMcc6MB0L7dl+sByEZIkFZ4vYrxvKsG8m2GpCAWF
         IQ0CUK8wE3nvRS8uUqeEOydwg8EqfZnGvcelPJCW7ZLaK/tVmJIDgHJm5earURlpZZw0
         ehYoIVRina7DMsfQMFN3NAf2AXPkJp2Ag7THdFn7IFxJukkEffHC9pyCxBkhGPkd2/AB
         Y+cudF7az9l63vF8qoZVlYhYzGcth38zJTv/j/uqfCqDrLh0tdFls7weTBNHFrkiyf2+
         v8wBdyDXCNc0DTLcZCMwf5qa4sn+FExOtCXrsGNG++Vit2ZymxJsKK95znlMMd9lb2Dp
         3BlA==
X-Forwarded-Encrypted: i=1; AJvYcCVMBo8hjrdmjo6xQLhwN6stGfHKJcpCDzkovsDHbYVGqLqxs5jSkWANHf3r4N96C8SiHF5SQjFE6iVk85BK@vger.kernel.org
X-Gm-Message-State: AOJu0YwBzRtCOPRQlIqF609NktAirW8FBkBZFMAIP49dJ6U33bad3H0J
	pK+tojPft2nGAJGtuN+qJBIuFvnJ1P2X+lOGRndI6Eebf1yV4NH9dzn5O0h7XKbWOR8j3SrrS/f
	WGMi/9Dg6ho44ygRSg2hV+OW233V5jl6b89qHzqEl6oszmr1v99ByIq/4NgyCMHYn/PiA
X-Gm-Gg: ASbGnctIn/k+2hcR34/YYkxwL8flMT2dN/CLTyuPVTf081YVD4UhzHcjt70YmVqzZtY
	K18KQUdnIYjQ549Z+k3S+q7oIEdkVJqrMEyC6MIE4kOkIFrapt3Iu2VpC9oUd5xBBvlZzi+pewt
	5U2jwUapEQuzTgTcTM53DshClzpjvJTckXIT5qLNebU7yWBFdPngq8bCOyTgiBswi/3Ja7zCBnL
	3ZWfLeOZCsgV6LLid88UbUb02Yr/WTCkp223cC0TreBcKGdjJgq0fD6AcypK5EV8F93a/GeKuFR
	ivyUbPSvNilnxZ6lcNbUhTmshFtQamfUt9Jt7++GkQRM6cOE1+mJl1i1CVd54wzkBH5hpJZ7KQv
	yeu1aOSPN4VQjsAEUprVPy7DNAwXBFkiY14mEsnW/lUNfg2bOcVaIT5eF
X-Received: by 2002:a05:6214:2681:b0:876:2e1a:e77b with SMTP id 6a1803df08f44-87ffb15347cmr19874796d6.7.1761642287134;
        Tue, 28 Oct 2025 02:04:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGQpFCfAyIuLZ3osfOfScjn4ZNf/jIirr/F3GlO3TYl9NHKnRmcgJmbEit6T1kcw8HvVBZjA==
X-Received: by 2002:a05:6214:2681:b0:876:2e1a:e77b with SMTP id 6a1803df08f44-87ffb15347cmr19874636d6.7.1761642286662;
        Tue, 28 Oct 2025 02:04:46 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853e5138sm1036189366b.44.2025.10.28.02.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:04:46 -0700 (PDT)
Message-ID: <918fc9d3-2cd5-4442-8bc6-b930596d95c1@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:04:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 Kaanapali and Glymur compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com>
 <20251027212250.3847537-2-anjelique.melendez@oss.qualcomm.com>
 <20251028-private-chirpy-earthworm-6fccfe@kuoka>
 <4cb41e69-fb32-4331-a989-529b5af0081c@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4cb41e69-fb32-4331-a989-529b5af0081c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wJZ1EkofppV9z0S4-Y9YbpZmGAhyQkls
X-Proofpoint-GUID: wJZ1EkofppV9z0S4-Y9YbpZmGAhyQkls
X-Authority-Analysis: v=2.4 cv=QuFTHFyd c=1 sm=1 tr=0 ts=69008730 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PDJlN-RuetHZVnMxc_UA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA3NiBTYWx0ZWRfXz7QlKkeTZHli
 zivKgth2lMkJuUMoP3MNjI92SVirTNCkrm6E4OWcMOxf3DdcU4ffQVz8dQciL9vDucJ3qaqaggZ
 kgiW0z0p4Qgew0OEWEAIA3uElUH+/AowRekOVmPPIscKWHx+vSt4O/E0K5v07itH233QRK23gtT
 Sopkjsw2qAaOoiryAh6CCzQaNS8rq9iZoKFgL3jlAoX+y3cJUqWU/Y7MIJBZZN9NHbiAZItQHe9
 Kt8Fi4hUipiykKTsdS6sg61tkth2d0cDs3xsATxIjEUusm5cvGjFa5R1eO+0L5KvxLaeZ/5aXRh
 0mzsSk1nLhL4h63EgHqZ9rYc/WjTTdwwpVezYtU1K5VlYucxjTGMG+BR9XFXBArEYaO0bICpKmA
 UaHPtFHIrdxY6nNhmju/eRI+KtszbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280076

On 10/28/25 9:36 AM, Krzysztof Kozlowski wrote:
> On 28/10/2025 09:29, Krzysztof Kozlowski wrote:
>> On Mon, Oct 27, 2025 at 02:22:49PM -0700, Anjelique Melendez wrote:
>>> Document the Kaanapali and Glymur compatibles used to describe the PMIC
>>> glink on each platform.
>>> Kaanapali will have the same battery supply properties as sm8550 platforms
>>> so define qcom,sm8550-pmic-glink as fallback for Kaanapali.
>>> Glymur will have the same battery supply properties as x1e80100 platforms
>>> so define qcom,x1e80100-pmic-glink as fallback for Glymur.
>>
>> What does it mean "battery supply properties"? Binding does not define
>> them, so both paragraphs do not help me understanding the logic behind
>> such choice at all.
>>
>> What are you describing in this binding? Battery properties? No, battery
>> properties go to the monitored-battery, right? So maybe you describe SW
>> interface...
> 
> Or maybe you describe the device that it is different? >

Certain versions of the pmic-glink stack expose services (such as battmgr)
which support different features (e.g. 8550 exposes state of health and
charge control, x1e exposes charge control, 8280 exposes neither)

There seems to be a similar situation here

>>>
>>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>>> ---
>>>  .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml      | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>>> index 7085bf88afab..c57022109419 100644
>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>>> @@ -37,12 +37,19 @@ properties:
>>>            - const: qcom,pmic-glink
>>>        - items:
>>>            - enum:
>>> +              - qcom,kaanapali-pmic-glink
>>>                - qcom,milos-pmic-glink
>>>                - qcom,sm8650-pmic-glink
>>>                - qcom,sm8750-pmic-glink
>>
>> Why qcom,kaanapali-pmic-glink is not compatible with
>> qcom,sm8750-pmic-glink? If Glymur is compatible with previous
>> generation, I would expect that here too.
> 
> And again to re-iterate:
> 
> If X1E is compatible with SM8550 AND:
> SM8750 is compatible with SM8550 THEN
> WHY Glymur is compatible with previous generation but Kaanapali is not
> compatible with previous generation?

The announcement date does not directly correlate to 'generation'

Konrad

