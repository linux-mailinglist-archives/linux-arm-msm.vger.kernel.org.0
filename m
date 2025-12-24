Return-Path: <linux-arm-msm+bounces-86435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC86CDAE11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 01:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D523302DB72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 00:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD681CD15;
	Wed, 24 Dec 2025 00:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RP6Egrwh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1CtW+oE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB0022339
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 00:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766535171; cv=none; b=EAi6GIkgulVoaHqpR5cENUnhLXV8x9osJFHdlxddLq4hI6joRAkfSqAHpCBA9eeeMOXOjBZn8hRMN9TBWwmAVJN73bzw4laRXJ7OohKGZ3fZlZ2bnhra5ZoYlYLg3HmzssudG/SV76SrHC4U4vug5uhwBtT0so+Aq2IpBo07ajw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766535171; c=relaxed/simple;
	bh=EBmZmCdIjhmTwNIGsddrXweg27XCEIU28L5u4v1hj3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggy+E9SiyhGjXlCA9q+16ocssFibFiF3bVZTXVqMulmXKCTNIN5efQeVM2Ma8ED4t1tJ3oTxMgjYjBa806aaPBJNe8sygvgxKK45/Kaz3pEsP94ZGr8dPq6MiM5wAkzUJ6Fwm9QKIZplrRfl7QXKHQmNnLv7YHxHHqysV1GX5tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RP6Egrwh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1CtW+oE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNKXe6p1206442
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 00:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EBmZmCdIjhmTwNIGsddrXweg27XCEIU28L5u4v1hj3Y=; b=RP6EgrwhfQBdzJOz
	euPLu5eCb8Q5riTXdLigsdZ+Tn666b6ymhcdyW1SCFNYIUZ4YE72RPS13lxToprg
	eKA+3v8QGitCkdXayqWXyscuwhHfScmm2PT0LS2KRMuV+NsQHrfCoPn9kXdUW70l
	mUUxnFjOKuQUSMsJOHUz/yeMRcZlWsnTGQeySs+x+IdyzqTciXtLxZv0fFsFJ2M6
	LtYmjMK/x28zblEX+AIqwM2FaD/+RQPoM1yf2RgKRLzjcqTYGWZSQ5Pm57eatcyA
	dt5LUQNhrCP9i4bNEnAiN8bYvF76V5VLuEqt3JKhMnM/VHjhBpPeijty9cB6hxgu
	Xhdg5A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r0drn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 00:12:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7c7957d978aso6499166b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 16:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766535168; x=1767139968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EBmZmCdIjhmTwNIGsddrXweg27XCEIU28L5u4v1hj3Y=;
        b=c1CtW+oE8QJt8l9GDW+EM3xBSdfSbFrJCfZs5ahMYogLqCqTZHTQ2BF7sNN+fmir22
         Su6TSRoK9UqQbjPbkjfAf9B2dDhARDmfoHK3x3HlddJU0kVYOBL0KDP+kv1L1vQi0DyS
         hfrE8WaqlgJm0zIY7qS4xU3H9MQznBt7zPwSyFk5yL4JLoDHVadlkonsg5Ly1yXwKRtq
         jBQdzxxVy4my83w23VLbdPFNgTGJhb3XYRrQVl0mMTVNzX/La62w3Xxfs6bT8PBt49Ia
         VYcvDPKxqEvJAuC0srtNfNTKPMmcKZQfJRWfqipx2TCfdk1LNMJA0egCQItMSNpnL+Kr
         szxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766535168; x=1767139968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBmZmCdIjhmTwNIGsddrXweg27XCEIU28L5u4v1hj3Y=;
        b=gacDaE3EFySmVRh1bE2hQHFNucWZkukenc4T5YALXZPBp6e7wD6gwpDGjul46c3Mir
         e3R4bixGWqe1rLuMzJFnjVSsUCxM+gMdOkIBIKUHGvd0VFIuzQaNYc8FYsxN7lBhmGUY
         PnzO4Z3scVKFeg+5TPSLMSnqxn/KYhT0/QfRn3d1d86tViGC/GKItlyikoibZSwd5096
         u/gfPIY0JuqDiTAKksWT6Iu/eDzM48YsLC01mbHZvlcetIJLyK6L8i7udn0xMnou/kxk
         JKu+EEC9+4xdsfOt8w/h3DHHz46rMoAHU4OFoRixPVQVCzYwoiHAW9gg1iLiG3mbWlPf
         poaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfRnsMYAbuofiSlVx8Rvs5q6Gd8fHeAwfoov12AAXKvWg0VeqhnUv8qxFtdCeKZM0MjpgKMMCEFNOqPXdA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7OWShRDWo6Gr7ch3rbvHS2zgU2k7esCcJHPNFsL3FPNlXV9ot
	8KcgE0vW0LF6NZmDLwseTvyj+C00CugT4AcL0mhG57GaSS1kcLStDrYbjYDtlkLLZFEkyN42pMu
	1XixnnLinPDjnHUo0pq7Nd067XviyPUSzqTamPZQB1oTz78j/fNWKgwYDcSIbX3mMoQnI
X-Gm-Gg: AY/fxX6oFWDiM+YzdU1zQwoZScrU2iddjcoekLXRhNrvE1rz3oZ18jfPGTeun5L24zD
	K9I1THklC6JkCX1ehTr6YPXn5drIRgWh7flnEIvR+3VULiCvrg2XOFHUX+Sb6V0wCDC9cuv87m6
	ZWTHoB9NJ+lEo9cNKldZJKyNDPCDfv4PQr2XqypwX7vkRraamyWg1S9xDEF9A/4jWLNowjB17eg
	C9+fXQg3xy9PMC+mfoD29gYqRv7mFQ1OGNxNqQ82sNHNmdWwOK8XMR8gJ/HdMESyZtzOyMYn40u
	VWOfNuTRJ95E46Pj9qNs2R3x6XEDWnhnpY0pSaGkUn13GhtejWg2fWKdaCNj8dXnbeO2Vivn7iY
	QVgJ92q8shh8koU9q1iMvurlZjZP30CKrmVRQchY0d4xBHne4Wqy9c9w+RP0JzsOGWAOTp2YoKV
	C1yr53tw==
X-Received: by 2002:a05:6a20:748e:b0:366:1a00:2dab with SMTP id adf61e73a8af0-376a77f10bcmr13573289637.3.1766535167528;
        Tue, 23 Dec 2025 16:12:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLEksbODQp1xcBoYDTeUyro4Zzh9VJ6vvaGe6Cc544hEo4hwwF8bceDPDrRRVskRp9kcFHrA==
X-Received: by 2002:a05:6a20:748e:b0:366:1a00:2dab with SMTP id adf61e73a8af0-376a77f10bcmr13573269637.3.1766535167046;
        Tue, 23 Dec 2025 16:12:47 -0800 (PST)
Received: from [10.133.33.219] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e79620bd3sm12752588a12.4.2025.12.23.16.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 16:12:46 -0800 (PST)
Message-ID: <8bcf058f-5bf9-46ce-a188-e94954101f2f@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 08:12:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>,
        YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-3-yijie.yang@oss.qualcomm.com>
 <20251222-fluorescent-turkey-of-gallantry-df0906@quoll>
 <b8f0e8d9-449e-4f32-832e-f1d5597ff496@oss.qualcomm.com>
 <6421f044-2b07-4518-9edc-b9b2ef49f4fb@kernel.org>
Content-Language: en-US
From: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
In-Reply-To: <6421f044-2b07-4518-9edc-b9b2ef49f4fb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mdTAqOeZVGNSkwmzsnImb_HfP2UH56sr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDIwNSBTYWx0ZWRfX5loz6hFDVrKU
 QcEh/xsJpIuhCW8uh3CYOlqqkgKoC681V02xTfBd58gtK5+FM/nIa4IXrbtYX4/+mXR4/uSSme6
 2LFlaW5Bwe2vLK9UNH+9YrfHMcOI4xY7krqwBDHvPdi6pGq41qxCBquZN0FpJZA7jRxiBHaDaX0
 kKmr94IssnLoFn7mZ6MrGElKWf9mLqa7gQzz8GfvA1iqujvzexmoSDe5fIejUD3Vk8WymOt2n/g
 5/5oNemwNGkEDn8xX+h3LM+vKdMuSUqKwmi8bORetGR1EznMMYoeWW7tEOr1C9L3qKQbwF2JZ5W
 MFHaejRIytGJQCMLr3Q0OsQpuDDsIzEthVcxOA+3rWI1NJsvB5YrS0NXueqWdG/QU8Y4b2aWPAm
 JiVVzluSdiVfzu/gbgZInbBC7I8tpRf3Z/wLdNHa4c+8ECPltF5HBFKMgwIPxPq3PPrl/5fL7H4
 lQk/6Lg/+nMyNd2g2Ng==
X-Proofpoint-GUID: mdTAqOeZVGNSkwmzsnImb_HfP2UH56sr
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694b3000 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6y73sl-2QnXYpYKhnwwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230205



On 12/23/2025 9:41 PM, Krzysztof Kozlowski wrote:
> On 23/12/2025 04:38, Tingwei Zhang wrote:
>>
>> On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>
>>>> HAMOA-IOT-EVK and PURWA-IOT-EVK share a similar board design. Extract
>>>> the common components into separate files for better maintainability.
>>> SoMs do not share actual hardware. DTSI does not represent what looks
>>> similar to you, but actually common parts.
>> Purwa SOM board and Hamoa SOM board share same design. They share same PCB.
>> The difference is only on chip. Purwa SOM board has Purwa and Hamoa SOM board
>> has Hamoa on it. 
> I do not speak about boards. Read carefully feedback and respond to the
> actual feedback, not some other arguments.
>
> NAK
In this change, the SoM hardware except SoC is described by iq-x-iot-som.dtsi since it's common between Hamoa and Purwa. Hamoa and Purwa SoC hardware is described in hamoa.dtsi and purwa.dtsi. Hamoa-iot-som.dtsi includes iq-x-iot-som.dtsi and hamoa.dtsi. This change could reduce the duplicate code and review effort on a totally new purwa-iot-som.dtsi. If we found any bug, it can be fixed in one common file instead of two separate files. Same idea is used in x1-crd.dtsi. X1e80100-crd.dts include x1-crd.dtsi and hamoa.dtsi.
> Best regards,
> Krzysztof


