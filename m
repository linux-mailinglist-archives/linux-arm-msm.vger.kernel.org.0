Return-Path: <linux-arm-msm+bounces-101369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGE3B9E+zWkkbAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 17:50:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7846137D77A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 17:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 614D33019192
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 15:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCD036AB5E;
	Wed,  1 Apr 2026 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX4ZZFYN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9HtK71Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643F92459E5
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 15:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056888; cv=none; b=i0PLY5xBkcfcvJlbDSyvhOoRMcUdlxnUJ8nHcIFJ9rtuc93JZAHwNCtNNS+cmX2yqXlgMRqyaHtn2hEm/6uqmB+PE/vhrXiobi2wQA+0rXGxySAWrErXSKdujAGaG6eIvuv1n4CjOO7nywKf4dOiCB0fCTIAZChTfwtDnxiy7RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056888; c=relaxed/simple;
	bh=6laieGMKvo4gOFbBEOBAqhiW6yg+Q9NNRoJJu4Owx+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IQYfZZAc/ZbxNReK118QKJAgeJXMdmT4Wli5Ip4WNbC5UDwLvav1Hx9VM9r/SZxttfwyGWfClj1o5fvfxXAtugD2PeDFrgtAAXy9lLZybzIimQgbtNvMpw8mmjAatNonTR5v5pk7yiCG2ZGIb9owkiIl4zwXua2uJE9zDhMtxgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX4ZZFYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9HtK71Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631C5pAP4106888
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 15:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AG9FdGiFyQFH+H+XHLnITj+9mA3P4Sk3/IrlWSvObjY=; b=RX4ZZFYN/EgAFOtv
	HGIYG4QnwpnCLl8+wzvShrgMQG+rXiUuI9NsZ7hxbIJz2RZPmUTLrjENI2VRZ6Ab
	0pBrOXtEd1x24ZhAFd8s8ljqYWTns8UPyUS7NC3dkiLjm6rm7K4lEbRRB/Sb97F3
	xb9IPW6M16oCSVMIifglUZAzz0M8Xw+Ouk6/OA3/XaPv7tQgu0Tu825YNjzHQG1Q
	lj5Wmczq964L2YayT/gm5cqziiCepQlGgNTejEzRGFBoBRw8kNzEUgzY+x8BBfAi
	Gn8jIJjE77NSqLeJowXeEEQ6ZElSa2o6ajOqVbDnks/yoQhmXWy3XagajAjhvG/M
	BKNtfw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt9232u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 15:21:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82cf52c8b37so119833b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775056885; x=1775661685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AG9FdGiFyQFH+H+XHLnITj+9mA3P4Sk3/IrlWSvObjY=;
        b=e9HtK71ZGbC4efqUOLekFVor/98Pp7YUHJNSTqPfLhCU740KV0Tl8OTB+4z3HhGfwO
         G/xG/anBpX2rtNQgXO+rYhHqNN+hvMBtaN/xHnpf5YmYr5yKrZH6eP+GrTk3429WD0Da
         XH1Egh138IkSgPYDaG7w7m3YwI5l0LaVKw7+uDCiYgLF17ZNfXeZHrXy2cdJKrTTnaBl
         j+47SrMnfqsWdUZYXHCoI8MXoO+mKtfo/W4U4c586LUaQ6+R86gEyZpp6X0E4EmioG+a
         Xi8RPtntxlTKfV8nGUReieE/Xva2yLJS1HbsqOGsw6CELkCY6X9X/776Exs2zorQn+g+
         5vMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775056885; x=1775661685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AG9FdGiFyQFH+H+XHLnITj+9mA3P4Sk3/IrlWSvObjY=;
        b=XLaaFKZ8JO5veQ1XoU8nuUERm8HO1L8H4+DOYKdLNH7P6HHKNX1MMePL5FutDStHTD
         lCt1y1iS44dn8c2jLUTzISa/2qqyig7jAVA5gZl8aPZwMuVzvpjj+olQ5ibY3NYaZPvw
         U+S4bm9db2VwRyC+Zq+EVRp6B32KZumtNyQImqlvjtFBJWcyby3DkyymhgaOWmoKC6SK
         VbRa90x4K88zL85ojHjoC0MKcMlGIYrzpvnmouXzsnyh+iTXzII8f8PPgzrRQ96P2sgT
         3h9UcCSnj24ky0oRMUdRBiS4xW5euV+2+76N0f1q9X3Vg8b+4X6qCZRGTRGLHoUz45UA
         tjTg==
X-Forwarded-Encrypted: i=1; AJvYcCW+/hZuZaJEjItZKuHrF6IdF9D9Vtk6X/IMWLrubRIBlOlVUGjRMWM+nn9fBQcRxn9ilA8yryfbnYAdMjzB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsq58kIidP5Jzv1o5Ayw74c4d4XOb3xFAW71oLCDSdcvN5vCiJ
	cF8V07hhfAxyFiOzt9gJuMC31CNbwX9xdreXg+rcn5oCbUbOjfaOsADWGaEjh2Ywwu05XYlXgtN
	fu4H9VYRRuUOVMdoKfGh3xB+ROpc9nekyi1AG28uA4WuSqp9Hl3sHB9ArDxFXGysAs7qSJPqs3E
	/S
X-Gm-Gg: ATEYQzwM1jqa4R4d2HYtoEVugOqDf9RIbffGnq3Lq6DoFge5am80wWArwpm67KFHZH/
	Hbw1sUrPf0pACe8zyRsstrU6M6AJPZqmmT4kV8Jl5NgTA0pAFcmHKHngODPfTqrq4oUREFbGrYK
	PccFB3tLEPm9QyJ/geNbPIaHaDNaGwCrw3wnjdaDZ/Ok7S9W14FHReCepAMYeydwltUOr33JTyo
	1kLFgyDzWVV14ObJcW/Ln4gcccox/vwrxYrARz3mmpqDuBlvopqfbWfeVGYgiBuPYuG0ofa6Jca
	NZRUtuNCRB21Pzmt7YTMy1/yeluwXDHHFDZ8yFcAXmUixvrPW8/x7br5YT99Ly4g1tRu3VqHdpQ
	iAr1FdwqYr9mx8sNxAlHjegmO4dlEPpOO+puE6Tqk+t9W56ZandskaC9xkte/MVy1/nmTzJbU9W
	Qw4Zo0n/PC
X-Received: by 2002:a05:6a00:2e1e:b0:824:cb8f:2a06 with SMTP id d2e1a72fcca58-82ce8ae212cmr3006838b3a.3.1775056885439;
        Wed, 01 Apr 2026 08:21:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e1e:b0:824:cb8f:2a06 with SMTP id d2e1a72fcca58-82ce8ae212cmr3006814b3a.3.1775056884957;
        Wed, 01 Apr 2026 08:21:24 -0700 (PDT)
Received: from ?IPV6:2406:b400:b5:dc96:4944:a8fe:d32d:b4b0? ([2406:b400:b5:dc96:4944:a8fe:d32d:b4b0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca1869sm233014b3a.56.2026.04.01.08.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 08:21:24 -0700 (PDT)
Message-ID: <9f1d7aae-42b3-4e0a-8cac-39db2ea84521@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 20:51:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add model string
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309121936.1289615-1-umang.chheda@oss.qualcomm.com>
 <rdglzhmncexfcvec5hyenj7jx3m5hsphjlxsaeq2zhi4z4arml@bjeqghbbaoa2>
 <64f43d77-7c09-453e-8d7b-b4e0e5f05598@oss.qualcomm.com>
 <gmeo7kiryfh3qxspzidpwknxgmxqeqr6on2glrjj4tioh6apv5@p6rxe3jw2rkm>
 <0a44b9ea-9f2d-496e-8915-45186433dc1e@oss.qualcomm.com>
 <srndqldc5c3hr3vozvndl4zt66jb47b3iwyjghiqcjg2uoespg@yxg2hvugjrwe>
 <acSfUEVueSR5Ikq7@baldur>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <acSfUEVueSR5Ikq7@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JuTnMoBSDTSgKuInRVSbM4rnmB22JE1x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE0NCBTYWx0ZWRfXx5VMPVT5rntH
 54w8OxTpwGtL6PO47Wsob4mEY2fgZJFry0WXLGMjqU7WxpWbK5srTlgy42YBDbTVrTNmydF0v9R
 o+6vIziVwXcTRW/MF6rliVgjKuNpKmsOT0Vhdo4f1ln0Z7OeVQY72dfN8XGx7Ees1JScWAptmVr
 TyTlxnh44+4kBy5twT20Xhv2Qht6BRwHDIB7zVSaY+i2zUstoT/8/Tgz8Jwzq4Z5KiIbN+XUQ01
 KG45yuhJbgVxUBiBicuDK1pvhHH6oQeNXwO0FVqucKGRpBYT3avSsIssTr9phfYlDKcG/hf+WSL
 +nlGt+Yovu2PKYBGmUVGRfDbL0o4/EHEtSUIFgX7PeoXn3zTEX6fXjwyA7VCM2q6DujhX38i1hs
 svxJZlUvLi9654jgWN4x5zpO4Dh6qwhlAlQCgXg3QZdD5poMH6OMIeFH1SiXpq7tg+vkFhDkZYE
 8whbJzq78lz1YRXYIGg==
X-Proofpoint-ORIG-GUID: JuTnMoBSDTSgKuInRVSbM4rnmB22JE1x
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69cd37f6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=MelL_d3sNiTB4l5edtYA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101369-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7846137D77A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Bjorn, Dmitry,

On 3/26/2026 8:29 AM, Bjorn Andersson wrote:
> On Mon, Mar 23, 2026 at 09:06:54PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Mar 23, 2026 at 10:33:45PM +0530, Umang Chheda wrote:
>>> Hello Dmitry,
>>>
>>> On 3/13/2026 11:23 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Mar 10, 2026 at 02:09:58PM +0530, Umang Chheda wrote:
>>>>> Hello Dmitry,
>>>>>
>>>>> On 3/10/2026 2:07 AM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Mar 09, 2026 at 05:49:35PM +0530, Umang Chheda wrote:
>>>>>>> The RB3 Gen2 Industrial mezzanine DT file lacks a "model" property,
>>>>>>> resulting in the hardware always being reported as the "Robotics RB3gen2".
>>>>>>> This prevents applications and user-space tooling from distinguishing
>>>>>>> the Industrial mezzanine Kit from other RB3Gen2 variants.
>>>>>>>
>>>>>>> To ensure consistent identification across all RB3 Gen2 mezzanines,
>>>>>>> add the appropriate model string.
>>>>>>>
>>>>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  .../boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso   | 4 ++++
>>>>>>>  1 file changed, 4 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>>>>>> index 619a42b5ef48..7d6e425dae89 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>>>>>> @@ -8,6 +8,10 @@
>>>>>>>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>>>>>>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>>>>>>
>>>>>>> +&{/} {
>>>>>>> +	model = "Qualcomm Technologies, Inc. QCS6490 RB3gen2 Industrial Mezzanine";
>>>>>> So, what happens if I combine Industrial and Vision mezzanines?
>>>>> H/W does not support to connect both Industrial and vision mezzanine at same time - only single mezzanine can be
>>>>>
>>>>> connected at a given point in time - hence probably the above scenario would never occur.
>>>> Industrial mezzanine has all LS and HS connectors, so it is possible to
>>>> stack Vision mezz on top of the industrial one.
>>>
>>> I re-checked - from f/w side as well multiple DTSO selection is not supported - and at a single point in time only single mezz can be selected
>>
>> What does this have to do with the firmware? From the Linux build system
>> point of view we are combining the overlay into a single
>> qcs6490-rb3gen2-industrial-mezzanine.dtb file.
>>
>> Nothing prevents me from writing:
>>
>> qcs6490-rb3gen2-multi-mezzanine-dtbs := qcs6490-rb3gen2.dtb \
>> 		qcs6490-rb3gen2-industrial-mezzanine.dtbo \
>> 		qcs6490-rb3gen2-vision-mezzanine.dtbo
>> dtb-$(CONFIG_ARCH_QCOM)        += qcs6490-rb3gen2-multi-mezzanine.dtb
>>
>>> considering above point - is it okay to have this patch ? I believe it would be good to have model string in the DTSO file added.
>>
>> No. A _mezzanine_ can not be a device model. It is by definition
>> something that you plug into the main device. Maybe creating something
>> new, a new kit.
>>
>> Moreover, the model name is not an ABI, we should not be using it for
>> device identification.
>>
> 
> I do agree.
> 
> That said, as we (others) discussed during LPC, it would be very useful
> for bug reporting purposes to know what overlays has been applied - or
> in general what "version" of the dtb we're running the system from.
> 
> I don't think "model" is what we're looking for there though.

Does adding something like below in the chosen node from the DTSO file
works good instead of a model string to identify the list of overlays
applied ?

&{/chosen} {
	applied-overlays {
		industrial-mezzanine {
			status = "okay";
		};
	};
};

> 
> Regards,
> Bjorn
> 
>>> Kindly share your views
>>
>> -- 
>> With best wishes
>> Dmitry

Thanks,
Umang


