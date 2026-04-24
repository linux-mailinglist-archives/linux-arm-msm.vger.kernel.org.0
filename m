Return-Path: <linux-arm-msm+bounces-104469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCV3DNxp62kcMwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 15:02:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8AF45ECBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 15:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC8EC3004C14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC7722FE0E;
	Fri, 24 Apr 2026 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKPf/YY5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKVFjsNC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8123B3D34AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035675; cv=none; b=P5S8FO6S/9DKp8vTF7Sw3XDnCB9IoSqhPWKT2tfibSDoCiyM0v53ovJY6b7I19vnPH6Kf5sauRPjBdHLpTH2HPfWEZZEt3DwyX8Vq/JJaYcj6Uv1x56zecX7Oaw5yjBLqhnuJQU+8OWrRHjnRzNDYYKMe8oZIDdmC3iFMJdC+zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035675; c=relaxed/simple;
	bh=I2R8ytEugiAGPrNt7U62aL8z9WdGGmhQf4Or51QTpvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+lJubNYOlzVqGrMj7EKVMfDo07AWCn9xJGZrMxtcSE8VtTWAV/6ZzvQk5B7m7AH6negsHWE9fQMtk3Dy9QY08sHWtTXNI7ROxSy7Fn9R1t18eKpLVQTLFq94ehDoBwz67FjC0xBJMZGZro6n7HV2Q0swfe2OAgnL/Ltj1C1APc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKPf/YY5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKVFjsNC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9G7AU518552
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 13:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sVxua6OhniN2pNp7NNf6eMLPe0Dqnx/jPe7KCBX+eEU=; b=GKPf/YY54uCJOcEH
	UK7MVwl8orxzMcn99ix8lwLcX6ttfFjUgJKdRImNh3y72eDRKc3COWNT4FmfSedS
	1g6KMZbNd1VLvvRSlnoepxv8/yAEM2Tm6MjuAfSFKyBNy/P6kXUezwbJw4dd2GJ4
	GwgAxC9Nd5WdBmzqiskal6jrelMht+StXQoV6leBuabi7JJsJVzsCg8srfpeaJlt
	gEZIsZIzBxXYC4XEr6XxlTN9N26ei8BIvRYlfM4XTo4vv1wPHL6g3LHPBGfwd/Om
	TYZ50I0JoOugjsPKHMy4AusLVVP5wo7z9gGOLFiJg3Jo2gD6mpzQP5ucmscCU9oV
	Vr08kQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr0fnjam1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 13:01:08 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-42fb973b2a2so2886410fac.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 06:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777035667; x=1777640467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sVxua6OhniN2pNp7NNf6eMLPe0Dqnx/jPe7KCBX+eEU=;
        b=XKVFjsNCLb8SfvzPSrOTfedFf9tufnZCbjLfsurrY+qHN9lIEHGvMVUMQlu2y+ftJ8
         hnOYs2LyJ0mRaZUqNZxFFRe6ETjkPBYk/9+vRSREQ7NiCSOzU0UCI3Wxzx5q+dA7Rjvs
         GMoCKjAEr3uDPoDN/uDBVbGuNea2lxpjJgZAAEZdI0HnP7ZGI4NlyGdSFdiexPSUczGp
         M1xp7lXmKr4XTh/Il9cIhcgHdX7+diqH1uqyB7bQdfK0lrm+lGP8X0fQToleCC9OOL7J
         Jn7O2KUeylH5PZUd4NRfXYYDWR9FPfHT13TNnJXYSk2bkCnUW4AmSqZ11TQjyCA0TSVb
         rL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035667; x=1777640467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVxua6OhniN2pNp7NNf6eMLPe0Dqnx/jPe7KCBX+eEU=;
        b=ZxkEM5VnqixB9ZN53OMI4xqMajCemIck8zaMx8OM8bZCshDPIqExVjcc+/Gb9vpiP5
         KKSOKUTem81FKQNIHW8OqX6q1fDgEswniL5B47Ffj69N5CYr31/O9LW70twE5U2XbqSQ
         LnNI2qDm4+2rzAuKLj6960DHPfTd9CJpmzk8E3QI7H+W19HeUyijcNJOkUgd7Vz0excQ
         w/Z49g/r+6tFnzgatDZ32F9GTdoGygPTdkbw/ST/IYkZwtFvGk60Tk0ylsTbFWmSYqTT
         XInA2z05uSodQiV1meW3OBUMs6VL5sI3YLB+b0K16v1os1TLFt4wTlXZ6bMF7MQIQ4Z8
         +m7w==
X-Forwarded-Encrypted: i=1; AFNElJ8nsEWLt3Q77qnK6LFHtm7wpE7lwgcg2chKF+iFBkd3Xmln/Q8ratjZFQ0d2SUmqz0yPpkcLo4J3EvPyHDg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe6WD1OnBUphxjTd6jLFhtGN5IrRqSBISVWDktzRbr7ewejIVn
	n0YP2SONSZ2sN9vaAiNuyf4PrkBkjgM3B6kmQt6qn9bDP8uXHDA0sHMGRBkyfKapidTWrkRj3U5
	KcTXmAK0OsJm208KfTMKURZf3blg9rHGGcCAugUnMaSYZYBa0elVb3bEbx0DSoljNxWLN
X-Gm-Gg: AeBDietsFGqMGsJ7RPFEYVUOQoFkIiYo8fWAc8K2kqGl95RFJq/sueSltxL+h0u294F
	ivPFsHrrrnoCEgOfXBb9/xgHI+b5lUzk4F2ds5NXbwsmwRqQr48vhIGJ9Rlt3VtaPE1mipuuU3P
	wDJq+U3nDT+PjnqLmq8EXkQ/SfHGipvxobEKvrZwsZq2VY3inWrbnJ/PALQ6oYs7bL3J4JZjp5v
	YBXF+yWrGDQBOjg75UxSQbgUQYJad8ddiSQ57c3sBNXMdupBRZtMdQbVrCCJ14MsyoM8GQhgniJ
	1Gavk/lcGJAdJjmoQiGQBAp0k1k5VN8DaiLAYvheZGy/JfMrM3L9IbBe3473Hsxz0ZWrfusudWH
	3YpA/qm9lVRISAMUsBoQZcrfgxE/ZG44/9xMGJb0jydSYDOyMST2311mSArCecWxOuWkBHutJ5l
	8ZEe7u+ycGnql5ZKnw60k=
X-Received: by 2002:a05:6820:81cb:b0:695:818c:e552 with SMTP id 006d021491bc7-695818ce65bmr6590843eaf.55.1777035667255;
        Fri, 24 Apr 2026 06:01:07 -0700 (PDT)
X-Received: by 2002:a05:6820:81cb:b0:695:818c:e552 with SMTP id 006d021491bc7-695818ce65bmr6590794eaf.55.1777035666580;
        Fri, 24 Apr 2026 06:01:06 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:1ab3:98b0:9e96:47bd? ([2a05:6e02:1041:c10:1ab3:98b0:9e96:47bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm57154801f8f.31.2026.04.24.06.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:01:05 -0700 (PDT)
Message-ID: <91219d5a-793c-4145-854d-5a1f8db45daa@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 15:01:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Document Nord
 Temperature Sensor
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420065409.1249030-1-shengchao.guo@oss.qualcomm.com>
 <a4f6b7f5-6566-4c73-9c4f-e43c3cafa75a@oss.qualcomm.com>
 <68723e33-53ca-4a66-8777-945cdcfce6fa@oss.qualcomm.com>
 <aetoLNvH5jeK3Cmo@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <aetoLNvH5jeK3Cmo@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LfYMLDfi c=1 sm=1 tr=0 ts=69eb6994 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=SgGMxA1ftVfEYTiVe-wA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEyNSBTYWx0ZWRfXxlMGMEv/IwG7
 9hFYur1sxU5KLZHpTK1rUMS7m/7Rem67TRv4gPN1LYnky0ruc9koYYnfV7k8vMK44HvvH3GodAB
 INOj6AV+BetKEUecvsyM7E7JuquGYirekoSbwCiZ2acGKk+ONM3XX+4JSklpcS+SK23IvjzAYeO
 ceqXGV/9NaHmIVaKQj72VL+guEhP8L0PAMR3C4YbkCiWrwE0whMOQOIw7e8cQVjRs5pRK1feO89
 ZHoPlCBMupOIcCR0hLwNcfcLEcNDDciIWRx1r7gzYvUgTzrfINCZhXksUpmgS28lTCUj1dPSelP
 VL0H60b4F0+/Tl8oJgqFNLzrAHM6Eu8u5ggLL9SfiFNdsmTqoyoo9vtd4AqSoQTo7xRnLI5KvA4
 /RkLPp+GmTv9XqZGhnHau5x9bhO44wBIgsyrDM7um2pAdPXq8yj+P3O2zWai3fnu8gG3VJo8FHD
 pHp1/3xU4i2OfrUk7uQ==
X-Proofpoint-ORIG-GUID: g00gFTSSXm0EFsRdF8JJFyAiQ7dfpu-H
X-Proofpoint-GUID: g00gFTSSXm0EFsRdF8JJFyAiQ7dfpu-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240125
X-Rspamd-Queue-Id: 6B8AF45ECBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104469-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/24/26 14:55, Shawn Guo wrote:
> On Fri, Apr 24, 2026 at 02:12:44PM +0200, Daniel Lezcano wrote:
>> On 4/20/26 11:19, Pankaj Patil wrote:
>>> On 4/20/2026 12:24 PM, Shawn Guo wrote:
>>>> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>>>>
>>>> Add compatible for Temperature Sensor (TSENS) of Nord SoC with
>>>> a fallback on qcom,tsens-v2.
>>>>
>>>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>>>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>>
>>> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>>
>>>> ---
>>
>> Krzystof,
>>
>> are you ok with this change ?
> 
> Hi Daniel,
> 
> I plan to improve the commit log per Krzystof's comment on another Nord
> binding patch.  Hopefully he will ack the new version.

Ok, thanks

