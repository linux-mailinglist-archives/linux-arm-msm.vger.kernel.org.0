Return-Path: <linux-arm-msm+bounces-102476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMHjMtKM12mtPggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:26:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3753C9A5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1659D30330A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 11:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3ABE3C13E1;
	Thu,  9 Apr 2026 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfkQhhwZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bKbvUMpD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703003C1415
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 11:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733900; cv=none; b=Gzld3sgQTdGrYtEVtlXUUgDInCL8DiGmYsePSkLNV2qGT+bNPoINPAyxQ1f99rWQYOH4YW6Swh2k4qDcfE9Od7Oy+JAUTHupJ0CIhFkrR25zMY4rBntStCRJSOyhEQctm3F1sH4lvrXCkJk8DF/ZUmG3ZmYC6Wsi47E1U5rMF1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733900; c=relaxed/simple;
	bh=3rDmcV5qWUl4JdAmVWIS+O1C9Ql3Eqq0UjmbcUVTUgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJUS+Nv/2ce6H+Tsolmsr80LrTkiJ6o+Q11wtRDqRCfk11ipkDwTNaAdOF0vyPUqrUGLQtLs2pDxyVABhyPjPhE7hc8xPmarSWP4Ce2p3CtXXbM4ZNghW3SUPnPYMLjcxtbv4ytW+QZ67mp6ygcAiCJ1BUQxOv4IIn/M4WpvhTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfkQhhwZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bKbvUMpD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639ASH2K1727093
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 11:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VbvWrv1pixLKT8Wb+LkDIBnjzAe2JAAbuWntcvWjIk4=; b=HfkQhhwZv4drRbXO
	tB0RRCskseE7C4k1bH8OQQWZYEkdy4xwgRER4T2RLXJhZSYgF3yX9T9QYDsgmcaz
	IYTUy2RU+0Ap7fcLHePtWDDgfM6NQk9gZ7aRgkZNp2BS6pUoHlTUennTG0MkMEpB
	rZbY3ZOjkerf3C8IiiLEnjBc/sw6IBt6YAoqeYdeX0/3oo+BpsYIHUvwwwD74EjH
	w43GcItoQ6W6PbH0P6O3QRPGd1S1u9UQKFNvWQ73rabDHpkTKmj0j7TX56LJpJsB
	+cfBCMv5b2iyof6l/ISjH37ej0E9UTT9KQgQ2kBPoxIdqr3hLAwqQRM/HQssrMyb
	JtPPWw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddwcrtxut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 11:24:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4bd8e77dso1595531cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 04:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775733898; x=1776338698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VbvWrv1pixLKT8Wb+LkDIBnjzAe2JAAbuWntcvWjIk4=;
        b=bKbvUMpDTDw7DQq1VEWY00Cd0aTd9DC0Eh/EAwFfoPCxdCit6MPEMgFbw7QooNzfpX
         Yg3/5u3Cc8WnN35WPPl3eeDiYpGj90yTpoRUypSwi2fRKPQrHV3IV+MWQBKxmT3OF9hQ
         1GV1GHB2jYDL4NnF79KaTs9PQtJyZDNt9Vwa+zel07gn6t7s8LU2NKArAydVFLj55I8g
         olEvBWtvJaLRPY+AWRCXvA7U2Ggvy/leQu14pGwHaC4JQo4MIoq5SRYIvcXHXH+5UQIU
         goz4Z6TG7O2YqAfmk93an/8yjOzMdvwJac96Cmfw+Uv2bdXiD35YLZojWWiDQwtEcLzN
         nE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775733898; x=1776338698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VbvWrv1pixLKT8Wb+LkDIBnjzAe2JAAbuWntcvWjIk4=;
        b=lP0+ulhJjvTaiRaOIH/eanJqERUbZdzTkppENma2Ayh0zCymvua7LFkX9+kBU1eh7C
         py3wOZQ0Lo+pqXs3FJ9p7z3lj3r2peoaCId5aH1tt6xnbZINLoNdpnEJrajFjUn35/Y3
         iCkb5Pgk3gCBc2CZJOxS5AMxd/BUBfsT7EAROdOauJHELk+NH7TUMoNQe+6HBP2APgfd
         KtoPvrbG8l/eCjfp49jverGNqJR5NIQlpIYKFhhCrZT4v7nCqjwR/lRS2FSHcuIB9qZg
         TOTgpOASCj2X8BIVYfHLvF89eZ6WTE8aCCK96tg7fpUVx3wYS6H1yaZTw1Y956CXYdCR
         tlpg==
X-Forwarded-Encrypted: i=1; AJvYcCXi+0UoH2e07+ukFtRFiqldAKQacZiq7EIftWWOP6M/GL54H1LWrvc1hmWSApVpbXARRc/5qTkXxWq969fM@vger.kernel.org
X-Gm-Message-State: AOJu0YyPuNvf1H9ZrARJmst9j7Nqh3sHxqmdcxZxzZtKVaYme3Kw1xqe
	rg+yv8mb5zigfdcegrzxSJ+3IjwulYozEQBTVTWNBlpZvy2QOYFgXR/uFwZ6REWJ8I7Y2k4ZNRp
	gr+tizU5K/3+Gdge4R3CE/YyFRs5rp34FzvFyiziRN2amGc4QyR+8L6OVK2rYJToigIpS
X-Gm-Gg: AeBDievP8fH4shD41CpzNhpvHl/Phz/tu9kfwPZ8LvxHkrKkOBZIYOgKJCDBMOUxQRY
	e4/v2zM0FHaR1995A1OlCxm0gLA30cmy9wOzpMKrFYyyeSK0EcyqzOCW+2T2KYacV+oezcSTuYo
	QV9uDpSQtG7EcRK+ehThzhbDMWO4+eHfInUFyY8bAaOW5QmPmsidtyv0y1EvzEZwILnNY1kgEf/
	PXpnzL2KHRzMXRvo7puXY1AA//UvdZCsG9Td3ACOIbgkoL9NzAfl/bD0b5cH1ZhI3I0JujLs1PH
	4H75unkfaCl4lVZpw+XxPTgUv48vSFBYE1jM6kq8OTabwu0Qpx4OcMJ8g+Tq2Og1Hku91vP9STN
	c+OrkX2GUfYKXoWgbxfe+C28WfzYk1P2vgED0i5fXGEj/4hczXKnMArvlL7vbveFRc3CMvL8LSy
	UgVQU=
X-Received: by 2002:a05:622a:60c:b0:509:d76:fe73 with SMTP id d75a77b69052e-50d62c8442bmr243322331cf.3.1775733897833;
        Thu, 09 Apr 2026 04:24:57 -0700 (PDT)
X-Received: by 2002:a05:622a:60c:b0:509:d76:fe73 with SMTP id d75a77b69052e-50d62c8442bmr243322061cf.3.1775733897321;
        Thu, 09 Apr 2026 04:24:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c3csm745695766b.29.2026.04.09.04.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 04:24:55 -0700 (PDT)
Message-ID: <e69a2478-fa18-4322-b3f3-a6e2b5a54e1f@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 13:24:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2
 board support
To: Joe Sandom <jsandom@axon.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
 <20260407-rb5gen2-dts-v2-5-d0c7f447ee73@axon.com>
 <4359bb07-d848-4b77-b1a9-f1c6f53caa10@oss.qualcomm.com>
 <20260409112309.vaibvwsmfdjardvy@linaro>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409112309.vaibvwsmfdjardvy@linaro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEwMiBTYWx0ZWRfX5k/Bn+dfSDnC
 0Sxh4qjzO5ZeiZUposspBAcbob8w6WBGTaby80/rCbdsET5s/tJaUJGsbAool/y3GwdwenTCM1H
 iLBDICaYQaZ2maV4jJaAetTBPjsAe3B5d9rqCnV2dhz4Yly3paPvdB4gVMr6znyt09C2KbM/ctA
 qbHJU61k/9OqwEmQvuPuHWLG6/nwd9wfMbcCCH+t1STSEjsgSBiaIBsAMfUxsOhIzwKdisssxiq
 amOvdAIEbcawSIlRinroiLiUlLGqbR3rLAhlD97Yuon25pnJ4mX03iJB5Nq2AjQAygu6GlWVQlw
 IbfcOUEH6N7urAk1VBfUMm3nFNyx6UDR+jNb9U9+9xNtT1LHFLCx/qJQ257UPwOYzbVgRfyuzmi
 uLH8jGA/CSWl4KJqzgkXt4VFJ+ZTEBGHGZPTSOY+pM6hMtw02361GBgalQpY0tx4GMN/YQ/9T4v
 fdz4uRDcZZ3cM/J6OEA==
X-Authority-Analysis: v=2.4 cv=SsWgLvO0 c=1 sm=1 tr=0 ts=69d78c8a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h77gEMGJAAAA:8 a=fZ3KsY-qWbNI7JLrVigA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-GUID: yCBaEsPq_yEHOgLSIN-hJCifu4p7z7A1
X-Proofpoint-ORIG-GUID: yCBaEsPq_yEHOgLSIN-hJCifu4p7z7A1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090102
X-Spamd-Result: default: False [4.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_URL_IN_SUSPICIOUS_MESSAGE(1.00)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,axon.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,urldefense.com:url,0.0.0.0:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102476-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	NEURAL_SPAM(0.00)[0.643];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	REDIRECTOR_URL(0.00)[urldefense.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2F3753C9A5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 1:23 PM, Joe Sandom wrote:
> On Wed, Apr 08, 2026 at 11:57:18AM +0200, Konrad Dybcio wrote:
>> On 4/7/26 5:46 PM, Joe Sandom via B4 Relay wrote:
>>> From: Joe Sandom <jsandom@axon.com>

[...]

>>> +	can@0 {
>>> +		compatible = "microchip,mcp2518fd";
>>> +		reg = <0>;
>>> +		interrupts-extended = <&tlmm 55 IRQ_TYPE_LEVEL_LOW>;
>>> +		clocks = <&clk40m>;
>>> +		spi-max-frequency = <10000000>;
>>> +		vdd-supply = <&vreg_l14b_3p2>;
>>> +		xceiver-supply = <&vreg_l14b_3p2>;
>>
>> It may be that for this chip to actually be able to communiate with devices
>> on the bus, you need to set the new 'microchip,xstbyen' property
>>
>> see:
>>
>> https://urldefense.com/v3/__https://lore.kernel.org/linux-arm-msm/20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com/__;!!K76kBA!3JvIWVouSl6ZkbxojAFYUus-8UPRvjrHx0qENKOyIIBpZ9knecOfH0NCBAr8ESxNXg2H6982UXqs_8QyR_k9NuKnmA$ 
>>
> Good to know. Confirmed that it will be needed.
> Happy to provide a follow-up patch once the above series lands if that
> works for you?

Sure thing, thanks for confirming!

Konrad

