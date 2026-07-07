Return-Path: <linux-arm-msm+bounces-117352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WqVsKTkaTWqMvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 17:24:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0338571D3A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 17:24:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="A/TwjlHq";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hcKUjerc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117352-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117352-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 000673245826
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 15:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EB02E7379;
	Tue,  7 Jul 2026 15:01:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F6B36C5A9
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 15:01:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436472; cv=none; b=PWhye8u+IWsJEigGnMlAcFnDwVrZivdzUINC7vzGjksHOL8h0ccjyF7o+Bn5+LULyWUX7OCkX2m5AalFEvdD3K9ibfzHu8d1FXr+ZY/vO75f3B4xXD6uUZSanH7pNxyz0l2wKjnhrhIMOGY7mYoN49wIIeU+8d6Q53mZJULR1iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436472; c=relaxed/simple;
	bh=+D/GGUvcOsimqDxyfbKlcMTFoXoX4b6/62l9AGfFEj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAwq8YjIbCAjiYIzSGdRN04VV8IdaTxGgo9T+lqV/H+KfC7fLf37q+8ogu2LYtoUu0QHS2oA4My3fiviXemABmuvHhuvFAofrq4HCgvnfQgHQY5cMQazyM67Hju55elQymt3QwYGk4D0Nb8ANn2xWPulIQZXq7uIcYE2kaZAR30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/TwjlHq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcKUjerc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8h4K3783568
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 15:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROX+UpJqvFR7fE/ZOEkvXIlyQXppUvkxvyHyF/TuUNk=; b=A/TwjlHq75KU/ZfW
	CEJVy/6uAXqhErvWZQH3r7SMvWy/EOLUEFWmmM/iNaNS9FsGg9UMPWtI442kAMJ2
	coSYWWVmTC4sdigS9xM4kr9hNfQjo8rkNJnja5XeIw5haUZc9pUI/HkBICOUW8mj
	5gZt4m/yLpTgZLgEh8BL4FOe9P33CUuZwPHv+xJMkAd5e7niKHo/oXm71RiqMqXb
	sMJbq0c37+cOidroAvWFNDmmAYbteU4b6E5b08bgVK7rkehwTHNzc9ov2Kuq1WL4
	viesWAegCBvxaSSrpU4AS8X5ZI+N1TA0VspkJRvvs5x8oObkzcyujjjlO3rRpGMx
	Q1AvIg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11stf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 15:01:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8478d2bea7cso904827b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783436470; x=1784041270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ROX+UpJqvFR7fE/ZOEkvXIlyQXppUvkxvyHyF/TuUNk=;
        b=hcKUjerchCBhwZZK/MboygP9MVi7bAJyw42VPt+JJo2cPzzVKRKPaBRLZKZAAzUqsy
         l9MxRnfSW7CXUPoVgfK3+AfFdkbx4Rlm2cZnqt2ol4eeH8yjMXDg6fRFi6/ZqtuEfGW0
         7GIGkwH4bHKW/ZfhK2h00222bkdYB2t/UEa1RBO5cuw5JYSdWMwCcHIXsb9Lr/ask+nt
         h+EWFWqfWDtjKsFIJB4XYdAkCj2lT0+MdFkt1F/ldngZgtKluN+geFY8RDR5dikApKIu
         1U6i+oLAGvUDw5U5Q1c9k63dWdcXKyVgwz5ywUA88w1RUlZ/5Wsg5h6w8WrQ1Ws6nh9C
         CJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436470; x=1784041270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROX+UpJqvFR7fE/ZOEkvXIlyQXppUvkxvyHyF/TuUNk=;
        b=QYI2ycNy6Ay1/873LWicu0BnDWpLqQ10gdESDj6cGme+Vfxr5DjduNAB3p7/PiHxJy
         QIWDmWL0hYfuWzeyE7/aYBg8otmlU/sHi2oRkEDlKIfsJUJFhpkBdiuKlvu9AsP+uC4f
         IDx+Wzg83Sx7S4pX/aACPGbBL3zjCEmKy/vGGC2LXnZaTRmCdj+dF3tx8F95JQoLXC2W
         SuHDWy4bePCYDfh2+phls7CzzJrEXV63TFZXiqXdmJC6iy2g+hUID1QInuGOnLLvmFLw
         4Rf0/5rAa+10U+OZwgF+I2+xAtoA2P3hUgyBBfhkpA8Ti7bpulm7q4/MYMwvDgnFH+lV
         Kypw==
X-Forwarded-Encrypted: i=1; AHgh+RouKPNOpdM13jUuqPDYID91MNF8K29nR6kzWDRLLLmfr5gWSvOo8YzKG8qRlz8ipE2+Bf1CidzWQo9/LnO0@vger.kernel.org
X-Gm-Message-State: AOJu0YzxkwhJbG/aS0Gw8YvzUV5wIe6M23BylNZhzGMwUA/wu8I4ceh1
	PDi04Z5Y+BhLUma4etakMYG8JeH6opgICsDm23CAWvS7S+JCXpaYCwBV7vRadcAjcIPkLzDQYuM
	EL23bstDERulGqLkVnY0xURTHTc5AE7QslyMUh4iY3QfSw4APJkn5pmzVlmTfZ/KERwiW
X-Gm-Gg: AfdE7cl1hTuMqIkpy9347LB/LM7M/rsRG/afVQRWfkxF0OE2n8YROb+K+HuF0oTNOEB
	RYwEn1IVxgeRVsCuwYY9SzNMcR+D0cnwDE15QJgNuKtHEkyWXl7O39KmoCqoPqXjB0C8N27VV8D
	D28lAJz87fxRTdJjIzirOJkHSXdW5uIVxiM1cRLE1nQfp/jaxkOp0eGmLRsNHMw6YhSHWNwhcvJ
	DgOp+fhQNI7HauXrTPRIC5BOpC3xNeokbdc04YKWOwrROgfaVUU1xDQVQlgmOfJBX1LDFpsoHuN
	kaKRhzFoYMh8L4pcTQ4RxK83RYWCS0o2fXNZYE3QlHELSVXMrUPgjJaFe3EdDX4y6AdLm1I+065
	IpOqILBFmfUxWNW/YuuISkWZpuaCXieuoEp3bFXU6+Uzp
X-Received: by 2002:a05:6a20:6a0b:b0:3bf:a8fa:a7b1 with SMTP id adf61e73a8af0-3c09b48c10cmr3970602637.37.1783436469180;
        Tue, 07 Jul 2026 08:01:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0b:b0:3bf:a8fa:a7b1 with SMTP id adf61e73a8af0-3c09b48c10cmr3970553637.37.1783436468698;
        Tue, 07 Jul 2026 08:01:08 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c9a1sm10749401c88.2.2026.07.07.08.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 08:01:07 -0700 (PDT)
Message-ID: <ccc65b99-9045-438c-a4b3-2d3577f281b5@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 20:30:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/16] media: iris: Introduce buffer size calculations
 for AR50LT
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue
 <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-13-583b42770b6a@oss.qualcomm.com>
 <09f6f0bd-6bde-4dbf-9be7-623c17232b16@oss.qualcomm.com>
 <jzqblo74y775tml2zwj6lfwcij635wkjivegfccx7peg4m6gne@cgu2leollht3>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <jzqblo74y775tml2zwj6lfwcij635wkjivegfccx7peg4m6gne@cgu2leollht3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4d14b6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FtO3_dRub200-A8TgkkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: RQSlh-5_Ufb5sBD10Zn7sxQOSG1j8sPp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE0NyBTYWx0ZWRfX7E5dVG63a8Yg
 R0z5mTBmZk9bYGZjx74E62dOzJ7114q2v1CraNu9pKEqK8ju1NnFFCptbAMmvCwqCFq/6fTapC7
 QHWdXb88jriuv4ik3uhs4oVYO0f4Avo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE0NyBTYWx0ZWRfXxNeItUzAfmzh
 cmd0eSrry7DHBzy3UznR4YJiYjnqSlaRtbYL7MfmN6vW8CJNV9AySt9jqP4xif0tchTW+GEzR7D
 TkQDXT1jjmFSPOgTqlPigCoFQViIvPCztgTvcT+KqxKspldmFYbGE53dgCEcW/fEMJ5rVJQ/noP
 xeZWamKp4bNgeH1XM+UHo0oVCDIZla0Z0u9mq1MEWZDTGP91WoOfJekB3bioX+c2t32It3kmbgn
 zaHy7GGwi5slhP3OVJ2HbUlWf7wJKN8AP4IJRo886qtzlrbLoRwhzI+pyF3m/qyc4iOgIX3K/9K
 YNJop0LB4xISFd+2t6aXgzo6lRFstWV1Wj1/NZ0hqQhCBJrkEB4FIzUryg96nACklvSPiFKea0f
 02xJfhfWVRAjYV5JA5FqGWnLFnyqQGU2jB84FDz92BghC3NVnGnM3zi0PgMiQoj+t0Tx5zjnGoq
 Qf7QzSYmOZOzBrDl78g==
X-Proofpoint-ORIG-GUID: RQSlh-5_Ufb5sBD10Zn7sxQOSG1j8sPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117352-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0338571D3A7



On 7/1/2026 7:19 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 24, 2026 at 08:40:02PM +0530, Vikash Garodia wrote:
>>
>>
>> On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
>>> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>
>>> Introduces AR50LT  buffer size calculation for both encoder and
>>> decoder. Reuse the buffer size calculation which are common, while
>>> adding the AR50LT specific ones separately.
>>>
>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 401 +++++++++++++++++++++
>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  37 ++
>>>    2 files changed, 438 insertions(+)
>>>
>>> @@ -507,6 +734,13 @@ u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_mi
>>>    	return _lb_size + vpss_lb_size + 4096;
>>>    }
>>> +static inline
>>> +u32 hfi_buffer_line_vp9d_ar50lt(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min,
>>> +				bool is_opb, u32 num_vpp_pipes)
>>> +{
>>> +	return hfi_ar50lt_vp9d_lb_size(frame_width, frame_height, num_vpp_pipes);
>>
>> pls keep same name across like "hfi_buffer_line_vp9d_ar50lt" and
>> "hfi_ar50lt_vp9d_lb_size" or combine these 2 apis, as the one just calls the
>> other.
> 
> I think, Sashiko pointout a different issue here. Should I be calling
> size_vpss_lb() to take is_opb into account?

The comment is generalizing the ar50 with other iris variants, we dont 
need that for AR50LT variants.

> 
>>
>>> +}
>>> +
>>>    static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
>>>    				 bool is_opb, u32 num_vpp_pipes)
>>>    {
> 

Regards,
Vikash

