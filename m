Return-Path: <linux-arm-msm+bounces-99363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNTjF613wWkQTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:26:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D16E02F9E3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BB553201D59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B9D3C4564;
	Mon, 23 Mar 2026 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NsCcVKwy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyYh9949"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266BF3C3422
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285434; cv=none; b=bcOAIw2Jz2lxPKL3CZmjLQx6TbPUR5legHxYCaSRLSQtMsDr4J53TXuAXgL+I5+6OlLRBzPgrdAoXsMpeAtyJiOMil6andGwogtbzjW19V/fGu0+dECVEVRBiH9RJClsjxMONrPvQmI6iz34qgpmy+FwiAgWXGd6uzpeSzPjCO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285434; c=relaxed/simple;
	bh=0xrjuv/aZKRXvZGO+yOutwUBY5BUWyj9mpB1PgLj3RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pIGQaGndvuwDIiMwWReyZPhDrdniVC8tGgQOqKig/otFVxYkp324E+gX/Rfl0V81C5A++7UXjkJfmczQe8j/LLsApXf4KAK0K6wbs2rwvdBTkG2+RkyHzzZ3ua0QMucp8tKWFNarum8hsQum1fy1gClYlK2+jaS64W48Cp/AkxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NsCcVKwy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyYh9949; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGjq22627427
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H3OKEJ0uFZnrqRzk9n3Br7Kh3ZaDNIX3igpiet86aEM=; b=NsCcVKwy7N26I8ad
	oVtpMkqThJmeivWDSg9VsEERFvzHn8IV7P8zucjmL000AuAcgv7sMmdmfRupvH4t
	FCwWnKNOL8emJVH6bo3pyPwGLxDmFF1tEd8LWHHMP2JHyjadSAGHzkm6eMEn/wQp
	ZDNWdrJCVUMYvicgx8lsfP6Wt7ZqFj8vQc9CRPiqMSU2AHO7IsiHg/0ALJF3n5xD
	Hox5q7u2KjalLimXWYdNLo4NhhTEwciqEeDus6ECUSFRKKay4md1Tuuyo/EXEP0T
	ACIpAZJYw5mIZDJ+zryqq4RE4rWLVKdZxMPMjpMOU07guAcmhr49fw+NBQPgLI9f
	TNLISw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc1ya0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:03:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ab2733686cso29271735ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774285432; x=1774890232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H3OKEJ0uFZnrqRzk9n3Br7Kh3ZaDNIX3igpiet86aEM=;
        b=WyYh9949EFpMYiexBiXsKC2reVFKdNunlC3nhvfA28B4BoIKDcG3xuc5DwtL8dxbPC
         HZ5NbV5FGTbBzIbYjXSuWYCGBuDUWqMhWk/wYr95JaDTrVBrQpp6MuN31MlTk/17ql2d
         dmeGmBCMUfn+Ju6lVjQPmBdfivnY2SnTWEMism/veA4nheORpKYsel7ruUdibzhtnSsb
         RbnOImTNdUoPCPtGouQ1uBCsjQiR+r8VjqKimhWm75S5SVXZKHss9W1SocPbZQD+5m6Y
         Qn80TpGieMO+lcc4YDekLf9M+rrIHnPo/iqlrFNAOUavjnoOgCx/e7ZclK2UFQZsZ0WV
         lWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285432; x=1774890232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3OKEJ0uFZnrqRzk9n3Br7Kh3ZaDNIX3igpiet86aEM=;
        b=s4FcQ+Q5393eokjuV8YRIdVISLASn015wi2ljU30OA6zHGVmCrT2m1+N9/N5ylvMnU
         xsvP5YbHHfahaB0KsHhmz3UljIq6lOnzGLCRq0Ir+B+IilseiBKlPFl8WcW1L9GvpFDN
         n08O0EaULB32tENne1pNthjiuyUmbtuk3btXIccl0A0Wg3etQSYzY4R3LRz6r8hI9ZTh
         c/mfBr9Re575FdeWeidmT5sd4IXybUHaaSNZ7x+asEWqxp5Ly3tpRCccnBajTgYXbWBn
         WJWwjkpJxD0jilSJ5T9BSJNsWxv5+2tIk4bLGwEyx9Il2LE9ukFoaUOLY2KQwqiSQ6WN
         DJ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUiVD5FkLC2cYVEbIWV9pMyXfPzSK0Pfx+sXD038TSQzbdoHtMLPVp7z/ZFjlBMvaHUc++qC7YhfBP4lAP@vger.kernel.org
X-Gm-Message-State: AOJu0YwuOlkIiSUZ5ZImMTC2PED8A8WaJ7HDbTd0K2UGFXTQuOp4fs5t
	kWxZM8xQnyfEQV8w/KiLARG7kXL1IK1APxznidLHYewtiQKg9S6ko0Q9gXY2xgdBQF9KBMfYn9i
	Iznt51Atbuw1VltFFw8XQekSZ36decUA8oWSJuQY5zg4ojXf2DgCvhuZIi5LK44fhxs1IpJucbY
	5G
X-Gm-Gg: ATEYQzxr0fOKFpQHR4E9frZzuy5YC9WwUXpD5/6Z8VxOUM0jE9rHu0HQ85kdlr3ApFK
	nmegkdLfb+A7ZoPagpazUoiCjVsa+k4rwNuTH17w5kZME4lop2ty963T5XG/Z/XsGWW7/hN87lI
	GnZTXt2T86CmqOK8bewtqAYQe+KWCRkTrXhVjNNNaMoGvFCbcJdYV9I4n6lk71A3UwF3ER0U5nM
	b1yuEGCNASvJI7VvPcZlYXU4EfkLXuaL7VKBWEhqtT+lG7b7i7MN+9cz6t0mf/pxzFyIKZwSZJs
	5jbCPNVaFnHYrs6hdnr8lSFZorCEEzJp1hQ2c3yej8Q1sVApb4AYEVXjCyCaXgnN7zy05mf5NZU
	PZ7RCNg383YlzOxVYcTDAz9HLS7183p03ZgA/TQvgHN/E5as=
X-Received: by 2002:a17:902:d4d0:b0:2b0:6f21:8270 with SMTP id d9443c01a7336-2b082774324mr82820005ad.5.1774285431563;
        Mon, 23 Mar 2026 10:03:51 -0700 (PDT)
X-Received: by 2002:a17:902:d4d0:b0:2b0:6f21:8270 with SMTP id d9443c01a7336-2b082774324mr82819685ad.5.1774285430949;
        Mon, 23 Mar 2026 10:03:50 -0700 (PDT)
Received: from [192.168.0.9] ([49.204.25.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083688ca4sm152745085ad.67.2026.03.23.10.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:03:50 -0700 (PDT)
Message-ID: <0a44b9ea-9f2d-496e-8915-45186433dc1e@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 22:33:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add model string
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309121936.1289615-1-umang.chheda@oss.qualcomm.com>
 <rdglzhmncexfcvec5hyenj7jx3m5hsphjlxsaeq2zhi4z4arml@bjeqghbbaoa2>
 <64f43d77-7c09-453e-8d7b-b4e0e5f05598@oss.qualcomm.com>
 <gmeo7kiryfh3qxspzidpwknxgmxqeqr6on2glrjj4tioh6apv5@p6rxe3jw2rkm>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <gmeo7kiryfh3qxspzidpwknxgmxqeqr6on2glrjj4tioh6apv5@p6rxe3jw2rkm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c17278 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=bm6Oh/fWkYYflUit1XJm0A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4yEt4WWgJWksLT0UfGEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: L4i3fdcnc75DzDPVzOJz-c354bxsB7mA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNiBTYWx0ZWRfX+V4U3If5V8M5
 su7HvsCe0aIdfC3PcgZe8REX5Xxqmg5JmP2PkFHzVwNse0MwpGNLap5eXqqzR3Nrh7uCLY2UTaT
 60K0HqfPi6v+2MvhElyrmr2SmUnwooJpE7RiLCGhrAZ8KSvEHIQh1YSl0brNhTPEp1aNUZCZFSt
 E1b8Xes+whGWswwyV5NM2YgdtJlvLURs3o585ceMNssXNUtqDoG3YUl4E4b5jRKcC8GDnPln1Hw
 1qe4Gw7Ht8XlDHn0zoDrGfk5o9nf//btvukwm+Jn8e65Kbzl225yJh3Y5VgqWCMd1wec874m/07
 sDe8KKjgBkLUyxSXfIiJuxOgqZ/UaVZMrVf396kAd2bYDSPhI4+KCUzWDyO43IJw2E0vfMWpSWk
 ZC/XObg2M00sw8zOIJSVqkCHNZUJNgridNM4bU+YVCOhosI8DcuNsxqdGW9BWEZfeL6TwfKcInT
 8xexv5et4E9j+5W29ng==
X-Proofpoint-ORIG-GUID: L4i3fdcnc75DzDPVzOJz-c354bxsB7mA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99363-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D16E02F9E3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Dmitry,

On 3/13/2026 11:23 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 10, 2026 at 02:09:58PM +0530, Umang Chheda wrote:
>> Hello Dmitry,
>>
>> On 3/10/2026 2:07 AM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 09, 2026 at 05:49:35PM +0530, Umang Chheda wrote:
>>>> The RB3 Gen2 Industrial mezzanine DT file lacks a "model" property,
>>>> resulting in the hardware always being reported as the "Robotics RB3gen2".
>>>> This prevents applications and user-space tooling from distinguishing
>>>> the Industrial mezzanine Kit from other RB3Gen2 variants.
>>>>
>>>> To ensure consistent identification across all RB3 Gen2 mezzanines,
>>>> add the appropriate model string.
>>>>
>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>> ---
>>>>  .../boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso   | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>>> index 619a42b5ef48..7d6e425dae89 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>>> @@ -8,6 +8,10 @@
>>>>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>>>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>>>
>>>> +&{/} {
>>>> +	model = "Qualcomm Technologies, Inc. QCS6490 RB3gen2 Industrial Mezzanine";
>>> So, what happens if I combine Industrial and Vision mezzanines?
>> H/W does not support to connect both Industrial and vision mezzanine at same time - only single mezzanine can be
>>
>> connected at a given point in time - hence probably the above scenario would never occur.
> Industrial mezzanine has all LS and HS connectors, so it is possible to
> stack Vision mezz on top of the industrial one.

I re-checked - from f/w side as well multiple DTSO selection is not supported - and at a single point in time only single mezz can be selected
considering above point - is it okay to have this patch ? I believe it would be good to have model string in the DTSO file added.
Kindly share your views

Thanks,
Umang
>

