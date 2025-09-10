Return-Path: <linux-arm-msm+bounces-72926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CD0B5117D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 10:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C842E561D5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 08:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2F231064B;
	Wed, 10 Sep 2025 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7kf9Hgn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4296F310627
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757493317; cv=none; b=Hl9J8MoB3ihu6FfiAGbC6rDvQHw2X8bqlxKRACRhO5nj370DQOLrUJM7ES6EvyCmJCh/di+XHnviffDlZ0ZWHiU3azI0Z8a98vIS2JNdkWHCrJBKp4Kwj5X5F73qVHJA5GnN5AeD+6EALc5XRVeWIWyQgnjUgNz3GptXafj2tW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757493317; c=relaxed/simple;
	bh=6pBqardOFH33jygFUEKtPxkKJseqnqQZsdOrvgwU+5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7eZ0iv2VsL3u2s4US1vCSQA4eUkq/utOwAwm30OLO4lnhC36STkTG2WnxxNZ8drm5OLQeyk61eFY+q75KhRdD1QWGHo3ZHbyAfeIwe7zOc/a8PIyK1jzo4Fo8vFr02veBUkqmheQv+V/gwGLRjcrtTdoaxkLi00Wna6dH0iyrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7kf9Hgn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A7civa017964
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mdZlGbXkoykBItIhC2uuPRcWMxj3GO69cBZWAldVw3M=; b=m7kf9HgnKQ/9rzas
	V97f3QsliMHcaYhWLmqyotcd0N5a2Nc+TwfOuH5XZv5YwYmEy8Xjh934QM8uAD3o
	TIvq0cALJVZadIZEnlNdEWVONaZpEtMPGqoFEMXlHYxWHLfz5EE63RDMhjRTM74v
	7GCvYtr+wgpdagFTCDTSYzPwflzD5eSPRkUY7Di0CtSKvdP1K7zXFGan3lAbly1i
	lB7QtZZe+uFapwsmom7T2nrCRMMOzPgGpg0fD7KyO/OEzrvQ10yGnDzhTs55ZYJo
	81l4sA8n4cDZ6ECkANElJncW6OUleHppTwnX3GTz6qbg3t+mSoDT9CuX4urb9Xrw
	F678AQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9jb9kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:35:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5f92a6936so15725461cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 01:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493314; x=1758098114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mdZlGbXkoykBItIhC2uuPRcWMxj3GO69cBZWAldVw3M=;
        b=JWgBmOeC8pjH0JkFciIs1tI55QhtJG10b5gNfrcsLe/4ab35baaGPQCapDz+2nVT4I
         cRJezkH4QhBu0zpHmqnDhxXOQCurRbBNJiNikMxPWdTsDfQ1cD+/GZ5NkLQTGDnyiaRa
         eJGUKtucuQ0Qr4pl37ymvYYNudXFGqtw0kGEYQxVQqV3S++uyioSv/VWm6v1tAWSk5oA
         B5I7ymKoZt8B+CJ3MKxAuKwxTgEBkETRrf7hKueEM8IzkGVWqz5aULeo+3RvlJtRtrCF
         3qBJjQMicljGB0ID+093KvKRT/DkxthUu75r3AtbcWqzd11CURmHZlWLNdPRlxbTyFty
         SjOg==
X-Forwarded-Encrypted: i=1; AJvYcCXxk5l8hf2rKynGY1yI/FgHiTombi0GmoYnH0wAQyTBIskdfxH9LERDkUPG8tIQPyisU3fFeyDRTt4qOgCw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3T79FIk+VR5Y99vSySaBx8rN/wUccrq+Im8+JPtGEdcJFJ0UA
	iia3pn1JzFFn4TbdB/IXM/uth0fSmqHghInCQYjgQDZiEcp4XpTd4VepkhYJxaenc33/0Er3epo
	l8GVzPVbc0ZsNPBOVa6tgSm3opd/lWeAioj1eKwSwBF0yT7GHKpqfoNlckRyZZf9PH5mG
X-Gm-Gg: ASbGnculxNTKau4XP32dkmSAHK53ttA/oznKPxtuHuk3kvlnip2dD2cDh1Mkl1Xj9mK
	npcnrSfORUsFnr9jroySVwRyAYqSc6rj3hRpS38uctdl8vQQb+QcUFCX4YQVicrZNW5NaOxKbT6
	NX149soOlN7FcbUiNBlnRYYAAzzmVSBLK9a+UtaSMg2ETcj3D/GTOfl4XZ49Vr0hvUhzfugKWZi
	QfNv+k7Kat2kle3JIzkNdX5X4BjSeuvT1cp+7N06AuzbqAmeOXSXAM8alq2lZd3DGjM39nugHAa
	cTMrWTd7wa6Rm/mgbvwKt3GhWRTcw6mpTPE1N6pGdTuxOrEP3tFOkuLRjdiAdrz9bQEKcd8xJJE
	pFhx91CKkxSkP1jTNuGLtcA==
X-Received: by 2002:a05:622a:f:b0:4b3:d2c:f2a0 with SMTP id d75a77b69052e-4b5f84608a1mr93692811cf.11.1757493313990;
        Wed, 10 Sep 2025 01:35:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC/PjlyjlapeA2UUFv3VPSLLeX8X1TPLj4/Upo+NAPNfgy876iYhaAOrUk5Om4jVsYgaP3RA==
X-Received: by 2002:a05:622a:f:b0:4b3:d2c:f2a0 with SMTP id d75a77b69052e-4b5f84608a1mr93692431cf.11.1757493313260;
        Wed, 10 Sep 2025 01:35:13 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078340e5bdsm127895366b.97.2025.09.10.01.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:35:12 -0700 (PDT)
Message-ID: <108895ac-0c4d-4aee-86b1-96461e00def3@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 10:35:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: add generic LED consumer
 documentation
To: Hans de Goede <hansg@kernel.org>,
        Aleksandrs Vinarskis <alex@vinarskis.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus
 <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-1-5944dc400668@vinarskis.com>
 <MOj2NUVAdyu9bvVkEON8rhAlGJ9FRRh9gJABkrOR_6gKhE8rmeZ5Isbj9noA1bDZ12gY4dlDpEtmEjxlRTucCssKwTo4f5nCowMOin85IKk=@vinarskis.com>
 <d957d16f-d206-4f7d-b52e-a2cad9e4abfc@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d957d16f-d206-4f7d-b52e-a2cad9e4abfc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfXx1mKDTgLoE5r
 x58HanVdYpGkrKPvKwid4x80lDExBqnFuPqbi7AGlxHNSFhABJuISzt3AgsFGrUahXPzFRW214o
 cRg0Y76TcV8KuGrrk3+GBOZCQc9AkVZxLSCi6yAmt+MtU10d9JBzS8E8q0OOgZ4pFxf06IWmsyW
 Eiqd4NtRa1vTyRbL+wAOqH3+h+HJF+uG2I/SnBVxVMM+SbspDCdt6ZTaS3KbngIDW8Xm6eSI/RZ
 wP0Z3lqUPhRhTAI2mWUHQsnmwZSns0NmUwMB0Rrmo1cKWt5BkLc6lWUhcDqrpqWZF65Q34+dFua
 s6IXoEfQ1Fx5SslnRj5bPwAZOOVlDR+exvfdM2JX5kIq/EioMXPiBPvZKrUzYgCDKSD+58THPNh
 tlJdav2H
X-Proofpoint-ORIG-GUID: svTUA2o66XglqxaAuWHP9DLOUfqGF854
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c13842 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=I76Qk8w-AAAA:8
 a=bzamcEsfLQq8zZigF6MA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: svTUA2o66XglqxaAuWHP9DLOUfqGF854
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

On 9/9/25 10:39 PM, Hans de Goede wrote:
> Hi,
> 
> On 9-Sep-25 6:57 PM, Aleksandrs Vinarskis wrote:
>>
>>
>>
>>
>>
>> On Monday, September 8th, 2025 at 01:18, Aleksandrs Vinarskis <alex@vinarskis.com> wrote:
>>
>>>
>>>
>>> Introduce common generic led consumer binding, where consumer defines
>>> led(s) by phandle, as opposed to trigger-source binding where the
>>> trigger source is defined in led itself.
>>>
>>> Add already used in some schemas 'leds' parameter which expects
>>> phandle-array. Additionally, introduce 'led-names' which could be used
>>> by consumers to map LED devices to their respective functions.
>>>
>>> Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
>>>
>>> ---
>>> .../devicetree/bindings/leds/leds-consumer.yaml | 89 ++++++++++++++++++++++
>>> 1 file changed, 89 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..d50a3850f6336e9e3a52eb1374e36ea50de27f47
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
>>> @@ -0,0 +1,89 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Common leds consumer
>>> +
>>> +maintainers:
>>> + - Aleksandrs Vinarskis alex@vinarskis.com
>>>
>>> +
>>> +description:
>>> + Some LED defined in DT are required by other DT consumers, for example
>>> + v4l2 subnode may require privacy or flash LED. Unlike trigger-source
>>> + approach which is typically used as 'soft' binding, referencing LED
>>> + devices by phandle makes things simpler when 'hard' binding is desired.
>>> +
>>> + Document LED properties that its consumers may define.
>>> +
>>> +select: true
>>> +
>>> +properties:
>>> + leds:
>>> + oneOf:
>>> + - type: object
>>> + - $ref: /schemas/types.yaml#/definitions/phandle-array
>>> + description:
>>> + A list of LED device(s) required by a particular consumer.
>>> + items:
>>> + maxItems: 1
>>> +
>>> + led-names:
>>
>> While going over the feedback I realized `leds` and `led-names` do
>> not follow `property`, `property-names` convention. Any objections
>> if I rename `led-names` to `leds-names` for consistency?
> 
> No objections from me, `leds-names` indeed is better.

FWIW we have "clocks"/"clock-names", "resets"/"reset-names" etc.

I sometimes refer to "property"/"property-names" during review to
bring attention to the preferred style (ordering of such entries),
which is maybe what confused you

Konrad

