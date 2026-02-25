Return-Path: <linux-arm-msm+bounces-94098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LuCAc7hnmmCXgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:49:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF36196DED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8027301484A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53F73AA1A1;
	Wed, 25 Feb 2026 11:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTomlRX1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/pdRn3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7438E3AA19D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772020075; cv=none; b=imQRHgwl0tYZ9wHGuGWL2n2VY++lH7NgjEYoDpBjr26XJyaAWhmKBGq5S05SNJS23sbnUFrrCskXdXYm3tvQtnCKo+XSVX3KTmALIujUcnzgtH1HQA3d/NhrKjzq4jEOoHWeRdqxq2KK3N2fBCt/wQ1wAjNfkRpqenJsdD36+Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772020075; c=relaxed/simple;
	bh=Pk73OIPdiMTezSidqgT/3Y+vHmMsprwcdHK/ge+sk+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8jEa+AfqTBzlVbanD682hkU4jIFYq7p0XxI73DTfv8tE98T/3GD5A3vNb/7F3zKnzagGUB8Q4faiyLgewj0YMFF+zTXYfxzONI3/4HzoCZV7S0R5NxBa9hNl0y5QqECXtEm1NCQwQf9z0Oj9JXyMKGQE8QJYFfCf2uYGR4Gs8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTomlRX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/pdRn3E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PB3EDH789059
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lkD15yZ9jHj5uXSPvJd6NEVT6IBzh30wdXxfpfM53eM=; b=JTomlRX18bHxHi+J
	mjs+YskRpdJ/nw9tW+LDNlItQ5F90bMqfBUd15wh+hhLdJzhn1FvAfpJcG+YT/C5
	qHsqXnAIZgQdiJI32zq7hzS+TGNpoODSk8Pry6tKsFuHr4PYHKx6qggeSQ/1AbeU
	9g3CwO9lSJRaCtRLJdJmyr1cW/iz6bt080mOuDs5gfekXG9Po0t78LjKozbMFNaV
	pzCuxe10padylKc8rmNKRm1s/daOjpaw15YsAAFUduNCiTA+pB9HlWbokwytSfpI
	B9OrfoAVupw9LS893AVGuadJjE3cJGQKKvMDtNgZ2aFxnhEqcmi9FMwjRckkIkDI
	Tfy72g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyv9g3ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:47:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb38346fdbso605968285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 03:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772020072; x=1772624872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lkD15yZ9jHj5uXSPvJd6NEVT6IBzh30wdXxfpfM53eM=;
        b=J/pdRn3EtOQm6Aw7hNOfjMa8LiyqNIKIE1bFxDpys1edWaLV5ckefkbzEgPD7umk9J
         OD3hpsNSvEZG2NSN1TbSRCFiEmJXMIAnKEDshTllj/S+/QPUwzZGhr/TSTUza/tiFDgB
         46OVWy3hULc1okTh/B00P05iOw2vOPSGvJ6ucHYNXxGNIq8m2x/yf4fL+/4dzssSOPmU
         JFwoAzNok45ZqfhTUkqWo8gkXXVp+ODSn/1YdAO6TbxIwXZh7BLMIzQbSCtGEUe+u1cZ
         NoD4v5FyaC+GYBRSyRH7yoRkJeBHTyfirlmUba9lW1Jkg7ouFxSMz0vXePFsSSgSFEcX
         uJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772020072; x=1772624872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkD15yZ9jHj5uXSPvJd6NEVT6IBzh30wdXxfpfM53eM=;
        b=SGZoUGIRT2+TOz5CyNLsdemlW7OsOVu0OgDELfpc9MO6isyRjxrF3em/rvE/GBtbZ/
         U1MgTIeQXzg+3Jecef+X/B7SZQqJ+MZVcjQYVndbojHNBqj1NGPNaH6g4yMPee8YgOfo
         qQk2biEYGnyuWmmJAs8sb096BzTR1c+tUB/VuzrAJGDJMzzxjEUx8HIrEEGFIW8IgVtH
         QiaWzgoMtxOHCxUh/pSQpE7Gt0FzVYKCADFaYfb8xeTT3Zde9wM6bSUK52X/OfdffswU
         +0zkaTFcYln0R5rinJ8waTiUfYqQQqouIRZBhpG80pIDkKz2B5LbXtzHH+bP05t6TId5
         O+EA==
X-Forwarded-Encrypted: i=1; AJvYcCXYim9y54B32AQiRZDaCS3XDbj7Gr/VEK+YTqxcOxp9KmVNXFjdSwvuRsuYxYih+j08ZMB1YJazlx+nn2bZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0002jdZNAnP+DE88WFRmBJkUZxFwIRaRwW70qQpANM2V5ueJU
	NRfoDDVfShvcdu+cjVJUleCz7a7Hgetx2MlaDtPIVrnq+qtdMXX5UJd0RxCYY81WfaGqbhKjmOI
	Sj+oR98r8XBhmFG78cjQdmUPjNka47rc9FBbLZ+RZF1NGkyVmoqLDitbtQUkvtH3AhnDC+ZAsHW
	yE
X-Gm-Gg: ATEYQzyMgMthVX0QIw8iHlDNgcoEwa3Wbi5kxwykRNn73TMfXWZ8MTMBufyV7ezGnru
	jVXmHRm6B+zfuueZ03jFT1dZflWhEWiZJtijdtX3twLYrCzgFuTXAK1JCA6QzZQNE28m3aEzhRZ
	SAnDAHSOoawLbUEFvzzoiT01cOZadkqiTl3BHJPT+MqpRC3HzHNGOjNuCPhBFewm5QYNCVqxVvU
	RbFrstaZ/O0iutoFRphx0bVqi5qUwFVeJxsNjeL7x8EHJ3HbxwVNNrduR75XYW6lfeuiD1eDShO
	JYPbkpteqyAba3o6a8ngFxKm0IboGrrozu08Ju2G52YXMmcrsYegEZPhJRrTQlpmF81LyUD4t7t
	jB4jENDGsYxhHF2JSxIsfyJkNK9jogR0j6rzmLFb8MV2EwA9ZCxCoMWx44AYWcFxo23CoK2HIPh
	qBQY8=
X-Received: by 2002:a05:620a:4104:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cb8cab0685mr1584818285a.6.1772020072490;
        Wed, 25 Feb 2026 03:47:52 -0800 (PST)
X-Received: by 2002:a05:620a:4104:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cb8cab0685mr1584816685a.6.1772020071940;
        Wed, 25 Feb 2026 03:47:51 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e9fd46sm511111466b.53.2026.02.25.03.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 03:47:50 -0800 (PST)
Message-ID: <5da495ce-9114-49da-82a2-0d9082a3e506@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:47:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
 <98ad13d8-82d0-4def-917d-b99cf455c5f1@oss.qualcomm.com>
 <fa6ce650-42b8-4090-9c80-7f4e4c85a96e@oss.qualcomm.com>
 <91425550-35f6-4941-917c-f639dfadb42d@oss.qualcomm.com>
 <f62c0595-16ce-4af3-b0e1-0ebb84dc4236@oss.qualcomm.com>
 <81d31750-f301-4332-84fa-a5c1aa401507@oss.qualcomm.com>
 <cbfd429a-459a-481a-93b5-fc9204d9ca8c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cbfd429a-459a-481a-93b5-fc9204d9ca8c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TJqoy1m48uCnq3N1OP-KWdWFUIk09-FU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDExNSBTYWx0ZWRfX38ksywMZRTK3
 Fpw+fDkVvt/rxS0Juo4PqpOUZZhumyHzIyzG5cLPMBBH0pYa7RtdZ2oli/zLFxdR4YCWDyvxOWl
 kIFubj4fgViPol7UllQZc7o5HPMsECcTF1SkemBXIOwIwHJw6OWYfiH9chJrLs6ezW5j0lIOfGJ
 R6EpuDXI6gQIKpSpMHvWdoXZX4aVpLEWzTRwTsKw+z90LkPYsC6KDDyZgTNLQ5gu12vTRpAtnAx
 dSNHdPDIzr1HY9mvZpQJBWV6V7kRSwKc72IKSd4KjxdvpWQjtgo5IoYb2yfka++hjYBjTdFGgq+
 nQZ6e6ia+miKsZHrA84RKtu2VJlF+ZRlPWvBU6El5yn/RZ6yPnJzpUrq2gvA9YuDd1DbOKrEAki
 R6F2ViGPcHhA34GEPp93H+ADbeu/0FlvyVwysTKMfyzGAT8xmcAKNWxrVD4R7dF88O7qygujcEy
 xzOUJTJ0qex/ifx9xZw==
X-Authority-Analysis: v=2.4 cv=GZwaXAXL c=1 sm=1 tr=0 ts=699ee169 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=lfvPHyuYFvH2aD9VkFsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: TJqoy1m48uCnq3N1OP-KWdWFUIk09-FU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94098-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,1d00:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BF36196DED
X-Rspamd-Action: no action

On 2/24/26 7:35 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> On 2/19/2026 6:34 PM, Konrad Dybcio wrote:
>> On 2/19/26 12:34 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>> Hi Konrad,
>>>
>>> On 2/16/2026 5:18 PM, Konrad Dybcio wrote:
>>>> On 2/13/26 12:55 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>>>> Hi Konrad,
>>>>>
>>>>> On 2/6/2026 2:41 PM, Konrad Dybcio wrote:
>>>>>> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>>>>>> Enable Qualcomm BCL hardware devicetree binding configuration
>>>>>>> for pm7250b.
>>>>>>>
>>>>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>     arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>>>>>>>     1 file changed, 10 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>>>>>> index 0761e6b5fd8d..69ad76831cde 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>>>>>> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>>>>>>>                 interrupt-controller;
>>>>>>>                 #interrupt-cells = <2>;
>>>>>>>             };
>>>>>>> +
>>>>>>> +        bcl@1d00 {
>>>>>>> +            compatible = "qcom,pm7250b-bcl", "qcom,bcl-v1";
>>>>>>> +            reg = <0x1d00>;
>>>>>>> +            interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
>>>>>>> +                     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
>>>>>>> +            interrupt-names = "bcl-max-min",
>>>>>>> +                      "bcl-critical";
>>>>>> We should strip the "bcl-" prefix, since these interrupts happen
>>>>>> to be under the bcl device
>>>>> Ack
>>>>>>
>>>>>>> +            overcurrent-thresholds-milliamp = <5500 6000>;
>>>>>> Is that something that we expect to change between boards, or is
>>>>>> that an electrical characteristic of the PM7250B?
>>>>> Yes,  It can change based on battery used for that board as these thresholds will be close below battery OCP spec.
>>>>> It is not based on pmic spec. Max current threshold support for specific pmic bcl is taken care in driver pmic data.
>>>>
>>>> Okay, so this property must not live in the common PMIC DTSI then..
>>>
>>> Ack, I will move it into board file wherever it is required in next revision
>>>
>>>>
>>>> I think ideally this could be communicated over battmgr, since it already
>>>> has a lot of information about the battery that's currently connected to
>>>> the device. Do you think that would be reasonable? Would you know who we
>>>> could talk to internally?
>>>
>>> We are not adding any battery information here. This configuration is specifically for the BCL peripheral to monitor current and trigger an over‑current alarm. While the BCL settings are derived from battery specifications, they are not the same as the battery’s own limits,the BCL thresholds will always be set below the battery’s OCP specification.
>>> The intent of the BCL is to provide early detection of over‑current or under‑voltage conditions, notify the SoC/peripherals, and allow corrective action before the system ever reaches the battery’s actual protection limits.
>>
>> Right, but as you say they are derived from the battery spec, I would
>> guesstimate it's something like "90% max current", so swapping out different
>> batteries for the same device could potentially affect this value. Since we
> 
> No, there is no predefined equation to derive these values directly from the battery specifications. The actual limits depend on multiple factors, including the underlying mitigation support available on the board for different components (fast path/slow path), the peak‑current use cases defined for that board, the battery characteristics etc. Simply swapping the battery will not automatically make it work. These parameters must be carefully tuned and configured.

What I had in mind is that if a battery is dual- (or more-) sourced for a
given device by a given vendor, they could perform all that tuning and then
store the data alongside other battery configuration that they presumably
already are required to include in battmgr for all of the specific battery
types they intend to support

> I discussed this with the internal battery manager driver team, and they mentioned that the power‑supply framework does not expose any discharging current spec details. Typically, only charging‑current–related information is provided.

Right, but the power-supply framework happens to be open-source, so if that
would be worth implementing, I think the maintainers would certainly be open
to having that discussion (+Sebastian)


> For some modern battery use cases, these configurations must also be adjusted dynamically based on factors such as ambient temperature and battery state of charge. The driver already supports this through the hwmon sysfs interface, allowing these values to be overridden at runtime.

One could assume that depends on (presumably) proprietary userspace and I
would imagine it'd be generally preferred to keep as much charging infra as
possible inside the kernel (or even better, in some battle-tested FW).

Konrad

