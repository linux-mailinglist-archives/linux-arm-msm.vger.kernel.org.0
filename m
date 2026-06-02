Return-Path: <linux-arm-msm+bounces-110730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO/3GeKDHmrQkQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:18:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AEA6297DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 026A43082E65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCA53AC0F5;
	Tue,  2 Jun 2026 07:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="POZ9TU+b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jR4r1p8d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E602EBB86
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384488; cv=none; b=CLUnTmGdvS0l/Hfct9xg9aBcF5vqVzSsM+mb9CKrsBlMhEwujSl0TA0sLgYu7wLEBjacfJrWnqApWjKVHB1vX/Uxr6l1DJZxpL32V0jJ1rMbN3PndwuOlg97/vQfmYyAYAqMcMlm0LD49gCVLd1EvXHKWDIEc8dg767u+sOnPNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384488; c=relaxed/simple;
	bh=/j3tUE96SWNcssK1W0+tgZ3yAQFjlQnsP+UqszEXnBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+1tV/CwihPxsTusCGfCBrRPLXGOA69tjPldOogbTrs/tmoWekJjTADltQzDKRakbgnfN6zFJty824M9fpbNNVYckFI/m0IDH7oCCDJGnjZHdO3AdNV6vDGPIW+WqvvVr//aUfdPcmiSSAqBk4m5Ef6SwpmQIGx3aloUctDdH90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=POZ9TU+b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jR4r1p8d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65218wsN3430710
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 07:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qvCpwazJQ2nTUZ1sqyJxYIEvDZyEIgujJHDTUjeRRd4=; b=POZ9TU+bSG7DH6qN
	Bx/hryOXvWFFiU4vS7/jC7v3mAYKIl6csb3Vu4MOTmosABCXLuEtcYgZWKWejJpG
	4ygErMorQiLbXmtd7Z7oU+TnfJBn5bochf2RJLp7KMj6Pu0VN9S9TdP5yjQPI5/g
	dNbfobI9I+BdMFNiW7YMN1UfEQzm9mta1nb9sCpjKOeCVPeTW3OLFXomDD/DTwm0
	PnZFA+7ryGl8FFbD8oEjSIazHMn73+FSwqK71vL+5OQeWHzbwGLvQZo5Og/XANrU
	TCW47cuE0EdnnrfDDK8ZOyNPnAcZsbDK5/Z1obRiu5437DpOc9Xqn5gmhU4P4c6L
	VzEhYg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehn8mh6t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 07:14:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso1978283a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780384483; x=1780989283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qvCpwazJQ2nTUZ1sqyJxYIEvDZyEIgujJHDTUjeRRd4=;
        b=jR4r1p8dHqvrRXARvCya/U1QwKkJEcAcPoCQ3/RdosKO6+I97SIUEsC2w84RgP5+bq
         A617gqDi7uwmXq8AUDsMCtoDwxChgzH8KFhhls03xHfDb8ZGikSQ2pHn5FbVoh4War0i
         9UwDEbVl/UDCp06mgrggPOIrD7k4l618ojPOBsZjlft95WfDCP7FQ8R9icRZ/wvkee9O
         vCL/yhHNFnyZucOa8uwevctCUmvZO8W+PHNbbvjRGC8x4IP40fLDUu0Y/cw5nF/xvlWs
         tswnMVMCEQS/I0R1HpiAmiTRCeSFu2iPtVD1Sq9TGaVvgwLB4gkh7nOzLJmBp/zlkwpr
         ciXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384483; x=1780989283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qvCpwazJQ2nTUZ1sqyJxYIEvDZyEIgujJHDTUjeRRd4=;
        b=hkrBsulMiOwLSd4O4qy5oujv/Bo7D8vuu9kc48GM/ov9rAXdg7MrS8HQ2TdtRdpGc3
         kyYSlG0ZkXpBBlxYduEoHbhOw6wxMVpZ7LjNbWwMFH3SXj+UEfAlfV6SJkgiuwcGT0M3
         DDW0fxIxcUOaZX048s5FI66K2w0xoSRx0HVUtKqOc1bgN2aIt1qD1KjvwNPRh6JrEmsp
         NL/PNmoFI/1WT/ZmBQ0AdnpQR/E0TZiEdMIUwyMDuIhrz8pYx1iLUdqXM0lAHDSMLwU8
         X+7Cz0PL+evN1BYzjvKz9evehnFF+LGmu3foSfDwAFi2WG4gAIXZfDnk2mTNd2zUDKvR
         oaUw==
X-Gm-Message-State: AOJu0YwhBt4OmMPBL7kQ5QJkQ3Q2chc0w3qlwO4ES2YwdhbhaFZuk5zY
	/F/PXiJJ5WvVnq1kJR1u2Winf35aAcRnVniFWPLwH5KJSJpVCDdmeRt3ZFfLhqq1bmvZedQNk+v
	xI9tJfXf5O7FIjEFKN4v2ZtEvg7U7dHNy/F7HITE/lJWMwJSVTCsH0dNDyWjarDV1tmha
X-Gm-Gg: Acq92OHgmOoL5tT+Ppw7ScKvoklHZU3GzjtsBSm798l/9bBCOGNb/PyqbbsEnMdUMgW
	ceMd4A5kzbTWaPbZjAGNtTwvyckU5b4WLMcyhWcRWUm+WRaTiHAox0X4XMowaOUFn+FY0QZEzgo
	x62CiTyPVwZMP3t626oqONGuR/JFOLoCSEMEqLaVpH0ZQ7Nr5kd3W/Y6xgFfSeFotU0LrBpAl8r
	t8j7xesrY6MjNKQBdfzsCn1ne/ki0PQ71CEfDlTcfysWAm8mUu6FLudyppTBU7+rnG1V7jEdWd4
	PkaAwyXutZ+dwpAFDifLpEwcm2BDJeykNRqxUpzZuOlF8GBvdxK9SHpACPaN2ynP5LW4IUitCyn
	uG3uJycI3NWs3whq0M/vcry8NqeWCNC3wXpLt28IOWdB1AS1s1acnDz4jGg==
X-Received: by 2002:a17:90b:5286:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-36c59abd658mr14694347a91.19.1780384482781;
        Tue, 02 Jun 2026 00:14:42 -0700 (PDT)
X-Received: by 2002:a17:90b:5286:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-36c59abd658mr14694298a91.19.1780384482243;
        Tue, 02 Jun 2026 00:14:42 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm1892437a91.1.2026.06.02.00.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 00:14:41 -0700 (PDT)
Message-ID: <1972e522-018b-4a14-ad7f-53c5dfdc860a@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 15:14:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 level-shifter function
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-2-3a6a025392bf@oss.qualcomm.com>
 <20260530-thankful-maroon-boar-be86f8@quoll>
 <158920bf-3b52-4772-9305-18afcd5807e3@oss.qualcomm.com>
 <d764694f-0cb6-4488-8ee8-ec4ce658ebd4@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <d764694f-0cb6-4488-8ee8-ec4ce658ebd4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2NSBTYWx0ZWRfXz0velmFelhfB
 LrF6FtDyoJ8aI/Fhzzfqy7B6/ehCPasHO9F8KTPkJ55ZfxntFsvyDK7a8271JKncsE2HT4fjAIY
 464MezQF0awvLPMxT/lU7DvdDcDyV6A4GaFECgvtEli2cqvCojUdAIMWgk++3ZKAYDTC9Uu2oIR
 lcoAd7MpVd6XR/ouSavYZ8yDtILjbx4QCZiyKm4lhsgMtP1n2wjlTO22dZDXxxwIcRBwswhJvmS
 WU1+OkuFY/tA8+B0G/ppIWS+cPJe038THGhmCz7yMjWNCZj4xCYExOKgnN1QTnjhHagYFVL63+3
 pZYmuJgpiGAVd26g2DaJWJz+62hUxpFCIh0jeTlkQrJVAvRgjQ8PLx4EPFMrbbv/MtNQ73OL3tu
 wcowqTdkWfbwiolJTde+cAEwZXqcgvU1EuoaFqDpJqndTYGQE06ApQlcABC/w5BJVWDEBZ+hkx4
 iOow3997NpOvAu8uLPQ==
X-Authority-Analysis: v=2.4 cv=d5nFDxjE c=1 sm=1 tr=0 ts=6a1e82e3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w2ocTiTeffrdLUDDFYsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: b-5r1P-xEdTh6aNce5K7kO8kyPJItDRl
X-Proofpoint-GUID: b-5r1P-xEdTh6aNce5K7kO8kyPJItDRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020065
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-110730-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0AEA6297DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 6/1/2026 7:30 PM, Krzysztof Kozlowski wrote:
> On 01/06/2026 07:00, Fenglin Wu wrote:
>> On 5/30/2026 6:29 PM, Krzysztof Kozlowski wrote:
>>> On Thu, May 28, 2026 at 06:05:36PM -0700, Fenglin Wu wrote:
>>>> Add the "level-shifter" function and add the required DT properties to
>>>> allow RPMh firmware to control the level-shifter. Introduce a custom
>>>> pinconf parameter "qcom,1p2v-1p8v-ls-en" for enabling or disabling the
>>>> level-shifter function.
>>> I don't get how PMIC, which is not a child of RPMh at all or not
>>> talking with RPMh RSC, needs to configure its pin via RPMh. It feels it
>>> is misrepresented.
>> The control for enabling or disabling the bi-directional level shifter
>> has been centralized in AOP, similar to how regulator resources are
>> managed. This allows it to be used on a serial bus shared by multiple
>> clients from different subsystems. Each subsystem can vote for its
>> enable state through RPMh commands, and AOP determines the final status
>> to turn the BIDIR_LVL_SHIFTER PMIC modules on or off. Additionally, each
>> bi-directional level shifter shares its physical pins with a pair of
>> PMIC GPIO modules and is mutually exclusive with other PMIC GPIO
>> functions, which means those PMIC GPIO functions must be disabled.
> So two completely independent hardware devices - PMIC and RPMh -
> configure the same hardware - level shifter and pin function?

Yes if we consider level shifter as a mux function of the GPIO pairs.

>
>> For these reasons, adding bi-directional level shifter software support
>> to the pinctrl-spmi-gpio driver is considered the best approach. Let me
>> know if you have a better suggestion.
>>
>>>> Additionally, add the "groups" property with the allowed group names
>>>> that can be used to control the level-shifter function on pmh0101.
>>>>
>>>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 66 +++++++++++++++++++++-
>>>>    include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  1 +
>>>>    2 files changed, 64 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>>> index b8109e6c2a10..19dc61ddff2d 100644
>>>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>>> @@ -119,6 +119,21 @@ properties:
>>>>          The first cell will be used to define gpio number and the
>>>>          second denotes the flags for this gpio
>>>>    
>>>> +  qcom,rpmh:
>>>> +    description:
>>>> +      Phandle to the RPMh controller device. Required for PMICs when the
>>>> +      bidirectional level shifters is used (e.g., pmh0101), to enable
>>>> +      communication with RPMh firmware for level shifter control.
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +
>>>> +  qcom,pmic-id:
>>>> +    description:
>>>> +      The ID of the PMIC which supports bidirectional level shifter function.
>>>> +      It is used as the RPMh resource name suffix to request control of the
>>>> +      level shifter to the RPMh firmware.
>>>> +    $ref: /schemas/types.yaml#/definitions/string
>>>> +    pattern: "^[A-N]_E[0-3]+$"
>>> You do not get instance IDs (it's explcitly documented in docs).
>> Okay. This is primarily for creating the resource names used to obtain
>> the rpmh addresses from the cmd-db for the level-shifter.
>>
>> I can change it to a different name if you still agree to add the
>> support in the pinctrl driver.
> ID or name, same thing. Still not allowed.

Okay. Then I don't know how could the driver be able to get the rpmh 
address from the cmd-db.

Maybe just like what Dmitry suggested, register a separate, RPMh-based 
GPIO driver for those GPIOs associated with the level shifter function, 
would be a better approach?

Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue 
write commands - Dmitry Baryshkov 
<https://lore.kernel.org/linux-arm-msm/4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt/>

>
>>>> +
>>>>    additionalProperties: false
>>>>    
>>>>    required:
>>>> @@ -330,6 +345,22 @@ allOf:
>>>>              contains:
>>>>                enum:
>>>>                  - qcom,pmh0101-gpio
>>>> +    then:
>>>> +      properties:
>>>> +        gpio-line-names:
>>>> +          minItems: 18
>>>> +          maxItems: 18
>>>> +        gpio-reserved-ranges:
>>>> +          minItems: 1
>>>> +          maxItems: 9
>>>> +        qcom,rpmh: true
>>>> +        qcom,pmic-id: true
>>>> +
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>>                  - qcom,pmih0108-gpio
>>>>        then:
>>>>          properties:
>>>> @@ -523,6 +554,19 @@ $defs:
>>>>            items:
>>>>              pattern: '^gpio([0-9]+)$'
>>>>    
>>>> +      groups:
>>>> +        $ref: /schemas/types.yaml#/definitions/string-array
>>>> +        description:
>>>> +          List of GPIO groups to apply properties to. Only valid for
>>>> +          function "level-shifter" on pmh0101. Valid groups are
>>>> +          gpio11, gpio12; gpio13, gpio14; gpio15, gpio16; gpio17, gpio18.
>>>> +        items:
>>>> +          enum:
>>>> +            - gpio11, gpio12
>>>> +            - gpio13, gpio14
>>>> +            - gpio15, gpio16
>>>> +            - gpio17, gpio18
>>>> +
>>>>          function:
>>>>            items:
>>>>              - enum:
>>>> @@ -536,6 +580,7 @@ $defs:
>>>>                  - dtest4
>>>>                  - func3  # supported by LV/MV GPIO subtypes
>>>>                  - func4  # supported by LV/MV GPIO subtypes
>>>> +              - level-shifter  # supported only by pmh0101
>>>>    
>>>>          bias-disable: true
>>>>          bias-pull-down: true
>>>> @@ -592,9 +637,24 @@ $defs:
>>>>              configured as digital input.
>>>>            enum: [1, 2, 3, 4]
>>>>    
>>>> -    required:
>>>> -      - pins
>>>> -      - function
>>>> +      qcom,1p2v-1p8v-ls-en:
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>> +        description:
>>>> +          Enable or disable the bidirectional 1.2V/1.8V level shifter
>>>> +          associated with the specified GPIO group. When set to 1, an RPMh
>>>> +          vote is sent to AOP to enable the level shifter. When set to 0,
>>>> +          the vote is withdrawn. Only valid when function is "level-shifter"
>>>> +          and groups is a level-shifter GPIO pair (e.g., "gpio11, gpio12"
>>>> +          on pmh0101).
>>> And there are no generic pinconf properties defining the voltage?
>> The 1.2V and 1.8V voltages on each side of the bidirectional level
>> shifter are not configurable. They are fixed in the hardware with
>> built-in reference voltages at each side of the pins. I am adding this
>> custom pinconf parameter mainly to control its enabling status. Also, I
>> am adding "1p2v-1p8v" in the parameter name to provide additional
>> clarity for users about the "level-shifter" function.
> So there are or there are not?

There is not such generic pinconf parameter based what I saw here:

https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/tree/drivers/pinctrl/pinconf-generic.c#n173

>
> Best regards,
> Krzysztof

