Return-Path: <linux-arm-msm+bounces-93996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFZ+AgipnWmgQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:35:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9DE187C51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12C153029C36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1383F220F38;
	Tue, 24 Feb 2026 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BXLbNvcl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AL3qXLqU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D15237F723
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940087; cv=none; b=id1VEM6llnDHrCBEFYIb5Kr4RzCu0k8L3icaI6i6/o2Ls5R210qpajTRkGWAr9Rzabf1k/TGnK717/9PWIi5p2DXi0FSWTKPzOU4neMAO0gXEFwiSLqGC1/rJ0hdF1WPqQUUzN9yzT5Z1YDVldsdPBmszV+ZC45Cdu5CP9d3mOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940087; c=relaxed/simple;
	bh=AoKNz6ZMF4uqd8jH65LmJoW0Cct5iI9B729m/0BS4KI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CuPbKfvnV5GC+OSykSbD5mSD5J3BI7YhTo6JGrwnIj5ugcJUiyMuONDNffQBJ9fBgrBmxV1V7yp/kbgJHT/FFa54uBiECE4IE396gsr4ZZ5y/T5BZhTq/1gOYpJCOGnmFrVNBf4s1+jPgOdL8hpB5W5l1Gck3lK+649YlH3xpCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BXLbNvcl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AL3qXLqU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFVhN2560561
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIYFAK1vBrOWs+P/Ex9WJyjscDsM+5gNK2j9yi2D2vQ=; b=BXLbNvclhuVyOJ6y
	Vsb06lGg9u4cZc1h6wBMiI4zlEszaJxy+phIUKOwpIKK8cYDMzMrZ8RKsOhQst80
	3C8SUc6CMihcmrpECFt/cgLf+qWBO4bOLa0mRy9ZzHPTOjnB5osT3cyaKrLQPxAH
	dWIGdYdgE2yQEvlJ8/GTvaC7mY5skKhouD8KFIAifnAXfE1WwxixUUow39K8isQe
	61AbPAz/k7DTqJubC49qP6JVPvHFT0K7t9XK8P0twgUmdr3CGG4b0ZPC9rq6KV2Z
	8WNWagwIJEDydPrM2OrUSjh8T0Lv9m9TxnK0lMs7AlcIiSHSxPDFm0DB/VQjATXs
	ZhqnxQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e39hqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:34:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb456d53a5so575756385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771940083; x=1772544883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LIYFAK1vBrOWs+P/Ex9WJyjscDsM+5gNK2j9yi2D2vQ=;
        b=AL3qXLqUpLUr5OingwEEIgpJmdxGnp16h1KEiuYIhb15FlXtinyds5BiGWXzMXVlkt
         TALHDzWW4rrXai4MHK5rhgxtCbgLQGk/kBUUUDI/sqAkUqlNLV8Eg8PBHiSYWtZm7kf9
         QlpGpPSkfqIYPX/lsLINic8+d1iB2TLk9WIzYfPDgXO/2m78wkJ83db1MejWO1Bzg31P
         yuECc/k3XEraE7BwIOBT1t8+iEIUUm4nqhvLdE8KcfKaGlMkLn6uoXhm8x2+gLrjgB9x
         gT4sSW2TLnKuS3e7k5PxqpdoptdTOEB4d4ZIY1lTGvX1gHGd+/F7CgYym9FMHiBMccWi
         EfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771940083; x=1772544883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIYFAK1vBrOWs+P/Ex9WJyjscDsM+5gNK2j9yi2D2vQ=;
        b=mEEMHPO6IT0+wApKtQTGaxypcftGGKhIv8R+CEZ8jmaz+U//B0yPmXbENrdDUODyXP
         tOxPHqokH42UPkWvYQ5ify/OLtrPiVma2xJMlxzGZogV2sxfP2dNSmvOcYsXnsueorbl
         r+0ZzptXzRGLaNiVnDqV7tdEWmkoa6GLEE1IHg8dkgDCx0d2lBqIxFlfVDup6MzqfA2r
         9ldNr+e7pJW9/HJQt/7G9osttSky6lXahrudtaTA8bBEDaNN8alcOu061VS1HDymFdFr
         H22h0f1m9U+SqOlEKBI9swHXcoQTujbApyjiQKYbpL/r5xvk0K7z4RHtHvS7bBBIle4M
         Esjg==
X-Gm-Message-State: AOJu0YxKTGsMo6JO1yKSz+lPh6aE3bMcj/FdAgN1Ff8L2heXH4Pm9Eqv
	NTvtlzpElwvcSvhenkEbmZOgWgNr3LlxEjGPYklrttG2mvjBcND0leU9UmZo/78CpeOMBoT5nJi
	LutQXP2HHU/r7Tm7OxeO6nhdDbkFThoyE6ypNVn5tauY1XWiFXvkaRZnEK2yi8Rtiw5WW
X-Gm-Gg: AZuq6aK3HSKKrSprZSV9LBOj6r0Klg9ivoDCXrqEOWFZqP7uc0UFGm4Y1V97/+LhOcx
	Hrb+afJy1CDQ/Yhqjk+moYXdv52xL9LMd6UdAyBcW2oGs5l/4i8h7HT6dNegS9RGooxl9UuN3vr
	gAIr4LOe86YcthNn2jJanrhx4wcxiusCmsQUzPBBKihN49R8a8YFMjPaFoggPBaYP2cYbRXUkAy
	It/SB8iY/VuRnK9W8RCLu5skBfZEguGdH+VVMK1e1qYLaVz8doBQ0hxj4vW5NAkKatLlj93AATc
	NSusMD005jUUlve3OPenHA+xZ9uH+TXhNG6Z0bfZ/KpE+ASzkbBLVrpDVcacNRpeluCWnc3vTM0
	2xcw3ix1p6X9foln4aC0ylpITjtXsyF8iAdA/7R3Ir3ofuULAKiCz0Y4+KUZwGtuWAHF5YUyjV4
	/RQxs=
X-Received: by 2002:a05:620a:2a12:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cb8cae5751mr1131815785a.10.1771940083355;
        Tue, 24 Feb 2026 05:34:43 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cb8cae5751mr1131812985a.10.1771940082920;
        Tue, 24 Feb 2026 05:34:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084f03911sm420951266b.65.2026.02.24.05.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 05:34:41 -0800 (PST)
Message-ID: <796de18d-83a0-4e26-bd9d-38f580ced9d8@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 14:34:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: "Wei Zhang (Stone)" <wei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260122053624.4068718-1-wei.zhang@oss.qualcomm.com>
 <46d0bc58-2c85-4293-a8ee-480282b80161@oss.qualcomm.com>
 <b1fadee7-74b1-4b66-845c-3a525f259a98@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b1fadee7-74b1-4b66-845c-3a525f259a98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UtFu9uwB c=1 sm=1 tr=0 ts=699da8f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7RpJI5Hy-tzw3XJetusA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: H5jzVjycFIHEVxflui3fXY2N4KpEARdu
X-Proofpoint-ORIG-GUID: H5jzVjycFIHEVxflui3fXY2N4KpEARdu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEwOCBTYWx0ZWRfXxngiqaUyrKXH
 tv2XLVIqX+dxtgW0VrAMchFV6kf/WJb+FjT0IK6rFzaUUT6BCAAJHBMSizSb0gnPIVWhybF5eDf
 BA07iYbcDrX3xB4Kho2chT37eDFz/sdnalNTYnus2vCxa2ipxaDVvVk+Fpsk7k7ZpDdgJUDhFim
 7mlMvKaPqeTdf7dNWGM3LvNgsVLK4WVwjH+crdAmI9lB2iYtzw46bQRpThjm/QcGs2c4SuwazvT
 vzS9vtuvaN9XrK2pSNNytI4srGi0UxSWp9i4829x8Q1xXQMBQc4AkQa/1rUAKuXGDvzjJh+9/mD
 MdkxsVoUR2HP+CpUwykyaaj7t+r5LedHrOhyvmr+NeVz8bRqiP0nzadVGrxI0QBQgTofNMmqvRf
 H+zD58BakccmC1t6xC0HVOkrOL7ztoZNzNTWQ8rhA7uI+57iI1fUBGUsii74AiGPSAvy87y7T3T
 CyMZSwazBH0/Nl57rFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240108
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93996-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF9DE187C51
X-Rspamd-Action: no action

On 2/23/26 6:51 AM, Wei Zhang (Stone) wrote:
> 
> On 2/5/2026 5:28 PM, Konrad Dybcio wrote:
>> On 1/22/26 6:36 AM, Wei Zhang wrote:
>>> Enable WLAN on qcs8300-ride by adding a node for the PMU module
>>> of the WCN6855 and assigning its LDO power outputs to the existing
>>> WiFi module.
>>>
>>> On the qcs8300-ride platform, the corresponding firmware and BDF
>>> are QCA6698AQ instead of WCN6855, which have been added in the
>>> 20250211 release.
>>>
>>> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +    wlan_en_state: wlan-en-state {
>>> +        pins = "gpio54";
>>> +        function = "gpio";
>>> +        bias-pull-up;
>>> +    };
>> pull-up sounds odd for an active-high pin
> Good point.
> GPIO54 is the active‑high WLAN_EN for WCN6855. The pull‑up is intentional to
> keep the line stable during early boot and to reduce the risk of a low‑to‑high glitch before the PMU driver takes control.
> WLAN enable/disable is still explicitly handled by the wcn6855‑pmu driver via wlan-enable-gpios.
> I can switch this if a different default is preferred.

Would such a glitch be problematic? This is an *enable* GPIO, not a reset
one

I would expect the WLAN is going to be off before Linux boots (unless that's
not the case here?)

Konrad

