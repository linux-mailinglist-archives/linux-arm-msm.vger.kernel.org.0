Return-Path: <linux-arm-msm+bounces-59511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 642B1AC4C8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 12:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E7DB1789EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 10:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180422571C9;
	Tue, 27 May 2025 10:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTRsl6f+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5BC253947
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748343568; cv=none; b=sTYZe4vqbEsH5rjgtAnzuJ8+cfuKl7OtZpDHN0adOjk2pJKHSiwEhtI2HEssXL4J+eT7mc7jaXkSfJ9TQmzAsSQoaZp0t/Rc6s8J3NkCxgsqgqPqg7NXHpBQt5ZTiqK+/v03gwhyhC3H4wIh7Ar75cKTl5rIkL1qVTbnfFcoQjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748343568; c=relaxed/simple;
	bh=nAhhNH6vu5VSXZoeXbMVn7GYF7eDAXmR/I2kCc4UShE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=poyEAInqXWEsyAfeEdwSLx/nJKXxMkGG7iCLO8ffrG61k9S7QvYWbfOt020UFXtiQB+CeqNnJurv6LMVCqKTtwZQ/xC4Lq8WgVFzDre8LXTFqzISnGG3q0L0vfFg11HGtiDlw8U0ZG9CqGojDWIq+0zS0SLaEnFE2gVF/pcvfN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTRsl6f+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R4P3Lg001212
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVRH8mgws61DCnh4JmBYd/UFPtwOI3PX+7lhuMe5vMw=; b=RTRsl6f+rxZwqFg2
	crtUAHbU2YP3TKS1eFoMYKeeqPfoel5yumU3H/6lRRMbAFGPBH8jZDB6BK3bTnGL
	6gjWDHUip6UHUgS761v5RtuACJLjmJxtMm5czUfz04/bY0uPyWcbPYsjc6Hd/11s
	AJ/7DgWU2Z6JevyKjGl8oTiFUFrzmAZHF78UBh9BDA+CdaEyVOvQNQxXIIIjFkhw
	4fR8heZWPboq5piWRgmLUv3Ps54u0yXI5Y1QuEpsk/2Xyc7cPmM/NcZZM3nI/fOJ
	4R/SPrRkyicqsAuCVSIFCKCxMxoGZLew2ebZ1pIYyLUr2ClEMsa93HUI0hsu2iuj
	YsPcTw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq6rak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:59:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fab2c3c664so706236d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 03:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748343564; x=1748948364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVRH8mgws61DCnh4JmBYd/UFPtwOI3PX+7lhuMe5vMw=;
        b=S0//+WpeHLfNMzK4s8rtatvvhJQ0XSFlk8gsdXRrWfvhYApQzpA0FPu1Pok4mI7Njg
         aJ1fGc6hlmXXmSVJl9VPG35h70QTwoJF8fn3H5IUv2uNn2UftyfPwuKfn4xwMKRJydt7
         oYL/cymuRPIC7x4Zy56qKCs3cSVIbb/0JbGMXBl9SPvdOz9VvV/Iv9MDa8W6kaM7sBy3
         8g8t3/zFc6apnEiu3TpW1WzSUd9yqmPTa3IlRPQ8FmcXZVQNLELpvlKeBTtXW2e+PfCU
         maop40YP27iHnKeUm2kenTelPrRaujIQl/CfnkdjXsykUcqGG3HMyffFqJSofup/d8Wf
         OJ0w==
X-Forwarded-Encrypted: i=1; AJvYcCUqCAh4ymJXm4qPxeQXcvZgdF3aysPEuKqbOyNAC8w1ftfTbMp7YjHpK4ZYbQYqAmWm1QW2vx2IwVR5pPZo@vger.kernel.org
X-Gm-Message-State: AOJu0YxTPdho9FoTIsXJB+RJxGdrliJx3ZNlS9B0qVF8olmfQ6N1+Z2W
	9P+FEV8lUXHAOg2EZrElIB68oHXo3cOLQGrD0ZBxztM1W7OnDKC8dsO3VMmoNthCVkWgV974kbV
	ppE0UgZRfd2XQ4WmaGrFBmUjjjMsippCFwJeeCssTjTAwHZ2onXvyK112aOCTO6o9TeW6
X-Gm-Gg: ASbGnctZvvmxzodHSOQMhOfJenM9Y1hq3q7szYID977k8RODJUaIqfBa+hsFwytQ1vo
	79QD9xYNaluXiRg/h4BdeZEcQJ6klQioPEal9EEsuZ6RvHgD6zzypijuNg6tlZALPnhrdtjGWur
	FhGCMoKF0enljF3hI/RIei6M0wT2QkStMZOYmP6yJanBIebuucLY7z0owTObGaJESlfvJhzGtSC
	dLIi/I7E7Gyj3izEbVXGe6+p0b6OH0PWsS0JOtZ4F5aBQMry1VKJKsFRqkxM1sLMbqK4An/6u8U
	zl56OlIW3CdIjMlpfpCt3ISRXD79eaHs8ncDUVTKlBXLj7kd1LubQsPCODvexIZmpw==
X-Received: by 2002:a05:622a:148a:b0:494:b829:665 with SMTP id d75a77b69052e-49f4703eb42mr68702281cf.9.1748343564560;
        Tue, 27 May 2025 03:59:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbqhUM+kngM9h8FOZPZbOSvqul+W4jdRKAgtAArw3nUiRXyCMh/+aUX7lcOuXcL6YHsU61/A==
X-Received: by 2002:a05:622a:148a:b0:494:b829:665 with SMTP id d75a77b69052e-49f4703eb42mr68702021cf.9.1748343564099;
        Tue, 27 May 2025 03:59:24 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d44205asm1845574266b.100.2025.05.27.03.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:59:23 -0700 (PDT)
Message-ID: <df414979-bdd2-41dc-b78b-b76395d5aa35@oss.qualcomm.com>
Date: Tue, 27 May 2025 12:59:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE
 PHY support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        George Moussalem <george.moussalem@outlook.com>,
        Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
 <aa3b2d08-f2aa-4349-9d22-905bbe12f673@kernel.org>
 <DS7PR19MB888328937A1954DF856C150B9D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <9e00f85e-c000-40c8-b1b3-4ac085e5b9d1@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9e00f85e-c000-40c8-b1b3-4ac085e5b9d1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 90AOaA7u8xnw-VrWPFNvzQFw6TnwJ6UK
X-Proofpoint-ORIG-GUID: 90AOaA7u8xnw-VrWPFNvzQFw6TnwJ6UK
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=68359b0d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=_VzbdjocUJMGqeFO5uwA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MCBTYWx0ZWRfX8iwoNLyCBs0b
 mqtYOK5t2knmsXL9krWteLYNuetmX16BD7xZnYXknbi6AaR2O4nTT155rc4I8IsiNYsP+xQY2qq
 baJZpgU0PNBbUlxYzAZ75MqzjlAC4e1XCzFbZ6jNyIdcJwl6PowKDq9YgkeNLEAJzwjuH1nPNbU
 YlDWXbk7vFMv1No7DgWZCxWlV8VyS3hYaLSi4dVVlyu2b+5DHL73FAAK8JV3/6KqES+TpKTHS78
 PMEm1uMRPeqoR4Ku0h/wPx9bODkONpxLa0kUjUpOe7+q6LfqUcN5ug4rBbOVS1RbHPZIblZ4sMY
 w9NDPdHFCpG9TOgIgw9dMHsOQ95pb642lwjtzOoQ0szM1ABSEu26rTNJ5v1jgAWow6TOl8KGEnn
 rowklO/DKHg9zlzsoJZBTb5KFerYrHZcs4gBqJF7AFzC5geb2yGb6JDmEuMxq5wdcr6o0bBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270090

On 5/26/25 2:55 PM, Krzysztof Kozlowski wrote:
> On 26/05/2025 08:43, George Moussalem wrote:
>>>> +  qca,dac:
>>>> +    description:
>>>> +      Values for MDAC and EDAC to adjust amplitude, bias current settings,
>>>> +      and error detection and correction algorithm. Only set in a PHY to PHY
>>>> +      link architecture to accommodate for short cable length.
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    items:
>>>> +      - items:
>>>> +          - description: value for MDAC. Expected 0x10, if set
>>>> +          - description: value for EDAC. Expected 0x10, if set
>>>
>>> If this is fixed to 0x10, then this is fully deducible from compatible.
>>> Drop entire property.
>>
>> as mentioned to Andrew, I can move the required values to the driver 
>> itself, but a property would still be required to indicate that this PHY 
>> is connected to an external PHY (ex. qca8337 switch). In that case, the 
>> values need to be set. Otherwise, not..
>>
>> Would qcom,phy-to-phy-dac (boolean) do?
> 
> Seems fine to me.

Can the driver instead check for a phy reference?

Konrad

