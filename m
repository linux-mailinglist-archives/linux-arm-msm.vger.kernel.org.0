Return-Path: <linux-arm-msm+bounces-112373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id opoXHzkrKWqeRwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:15:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6634667B93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:15:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="GDET/AbE";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KxxJwztx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112373-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112373-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F45931867D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6933B42C2;
	Wed, 10 Jun 2026 08:57:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B923AFAFA
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:57:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081873; cv=none; b=bZk0a+E6dLiTvLr5SQl1sroO9IhXusPAcmgQSnFioLVVISJtCN3g6/sFqtWxq4UUo7VuWkbnItXP99poFyssPSeKaAkUOKXGIdzPMUSTmBiiJIg+UIijsHi3xeviI7VD5573p9R+HcEnuNjRur2K+xcgqBxeNDSM3a9L9ci2rck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081873; c=relaxed/simple;
	bh=P1tuX+TCQiojtRE1Vy3rLWC5CCz0sd5BKC2Ld8Q2CUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hx5Z4HTUXDW9rhxk+u3bHWGVwH3jLeWg2wy8ILnUKB6QigDj/P18FtJbL4BBNUNXa8b2ku/y4PzQ7ad2JT6nehqjwCh4Of9B9PrKSkU3EvQ/1PD9Opz/Vt2ralRvrWJ4NGUoXGWI3gyg8xpvwPeR2zon8h007LBFBPC9f88U3/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDET/AbE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KxxJwztx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iZLP989190
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x9mL1Zr611lQe1BlZ6Wwrsk25RwLSKrOaDlttTZhghQ=; b=GDET/AbEBmlVaK9q
	311uxnF+IKgzA8I2bOtPnFCHV30+ONJJoKJSgYQsKVP/VqcnDOkkzYf3k51ge1Z+
	urFWZx2b0MOSxvF7J4oUNaSorm5Aan34FQglCPEViZ5wspLJkjVxFiOJCjR/bLQn
	Pp73bOOFJ4izILo57p7qTIhaZx1eEFblXdWE/DQo4bNByXb+sA9b/nrrWm17nCnA
	I/6ekHMHfhT4CG/DzIU1+Y4VxaVUWQPQIOvlhifPw4LVQj7fmyyLZwAG0zJV1r/O
	cwlDRtWb2uYrMfM40wfwAH2VHlSOi3P9YkG4Km8esSnXNjVTHkTYHIB2TG8a4Jnp
	o2qzig==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2seghcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:57:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b9106b0fbso5213563a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081869; x=1781686669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9mL1Zr611lQe1BlZ6Wwrsk25RwLSKrOaDlttTZhghQ=;
        b=KxxJwztxdMmixEcasNGNaVOurzuGa/Ml6rZwy90pkK8aeXn6n1myd8N9MFvjGXDQic
         52d63FJRjrU5/dHWGoTByBdrLgFbLDmCUTDiYrrFJxPYtfKA+djOFVdBv23q0btfxzb3
         IuJwtegwcFp9RlYGaqBCX3+GswOrNnSj5zTEutFUe/JF9wUhHMhdWFoWMRAie/lRw8jA
         VB0JXzEr9CixcNe/8NGfEzrLXR2xkTuVEkSmx37OL4PIvayaFi1cj5FjLBfXdBXJTqCA
         FGa8ZQ64tj/U3dSSNj9VHjbsOYEPj45+GKFhL/MpiEH1ESyMBrVzYgpJCH51pJP58aeq
         J6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081869; x=1781686669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9mL1Zr611lQe1BlZ6Wwrsk25RwLSKrOaDlttTZhghQ=;
        b=YZuKeOqfWQr7mkpyehHwr4ndNln3aNMzCQWe0CLTzDSb+kOIBKP4u5NikJmXC96Tz8
         i+ao8vgvrzbLrSZ20Pc8d4oYxTObFYAnCsdloigHToluozQ9e8akPwIUGAn0j9vUmPiq
         9++mN3h4noX9C0piKOF2LNgEZOzXDZhTkQ2yQB1EAJ2c3qMHHw2VHECTzNPTPVY6Tv6S
         cXVutUHJ1iJSUzP+vhvoH+cPRU/xy0h5CvMRSnOO1LMzKUzMmlLmKbyczWiwd8dhsjj6
         gGlkJbdHlEqHuN9oB698sh2fzkyr4Q9VviA8DSloU0A2trp6CzHWYHHBsi/EQBQKslMF
         du/g==
X-Gm-Message-State: AOJu0YzTQrB8syKuGY+CPs++Go7hyOXZ6D5hw6W5TxX1jStfRXPi/+FV
	56d1jg5Whk4eshAiDpMZE1Vx/jtgWtV4tGsvqCBeGToGRD+sT5Jg7zap2iEcL5DjXSndz61ZNIF
	NtNrP9zUlWriGxS4EAqZsPjbRnDCZdffAB5sAiGTRAC6FZWr/sJQYWxpoKtvvPc/bmeFj
X-Gm-Gg: Acq92OFYZU6Rje6pJGkMQlXoi/6ql0QtykwS4EU2JTHHO0aZl7D2jc8FRDQLkQcfeuS
	qIEU5feIarmDKuTYDZSQi19ZrwJYyH6yrgq/NX5p3MHwuplaVnaGOOb4DvYLqLwFU9AHRXnvytB
	Txu9QPQqsgjAt8VahvVioVIzXlai3Csf/Ngu3Ccm1QrGPSMobtLgsvwxyYajBpQWZRwxQB+nLi9
	UN/I3CAVvi65ZuQdmOwuqeC67PwxsogkolXSSN/zwWzovxCbUAhHFeApBFBqUt0lXwmDrMYeX47
	NMOFPuJYBQiXyB0e4JWYxUXuYVEeAOA8J4g5ISp/ylYorqmNzJSsmODWpwHM7bO3ZX0W0AZpyjW
	VjKSykXN1a9nxNIax5KpmD2eg5KO2VhlNDr6hAH/JPGVtMKF8pdVCcwOg3FLN
X-Received: by 2002:a17:903:4b2d:b0:2c1:e9f8:7587 with SMTP id d9443c01a7336-2c1ec92d8aamr208414915ad.29.1781081869459;
        Wed, 10 Jun 2026 01:57:49 -0700 (PDT)
X-Received: by 2002:a17:903:4b2d:b0:2c1:e9f8:7587 with SMTP id d9443c01a7336-2c1ec92d8aamr208414765ad.29.1781081868993;
        Wed, 10 Jun 2026 01:57:48 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f85de1sm239180905ad.20.2026.06.10.01.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:57:48 -0700 (PDT)
Message-ID: <0fc4d9d4-2943-4ed8-a8ea-014e83c74e5c@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:27:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] pinctrl: qcom: lpass-lpi: drop unused runtime-PM write
 helper
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610080809.2588640-1-ajay.nandam@oss.qualcomm.com>
 <f03850f6-186d-4988-a450-e6e95f24a551@kernel.org>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <f03850f6-186d-4988-a450-e6e95f24a551@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yQzbi8CIObjaGlrJgj3euz-kbSk9tFuZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX33rvWNnofq7r
 0ZHog4bDh1aAdlK1zHsVDfINx/BB0LPjpoMi45enkD11NbHAEhi18W/FW3xkkcXbDLVWFfZwDWH
 UxlNOYlaKwqm/zaF+aR9pbSN9FeoyiEr4IEjYkCYlkspaam99OP0VQaHcA7Ijxh65iTadNvdtzh
 9Ur+vTC99nabkqgyUrraB8Oe7yFOYSSRUNTtIdSSJ8O3bry8xUFH61ddRguE9yHAob77S1z+mxi
 Z/LutRhsXqU0O7EfgQFtXR9Vlt1OwRYcvS4AOh/uctU2J5b2Uq21qfanFKZ9HhGfSLU38BFpbnY
 Pt9eBrqc5bRQixBgLWDqybUG+LZJuW8tjxj1AcUpB82b1nrvqBFqx+8octI6/O6KCamJRqEfodI
 8cFUDGqWaBPbnFZXxqdF7YH2LXDvLq5oKSpOaSyOTnGPqXYiaazTcLc+WxCFzn9GornJbwUnylw
 VQM1De76CjYvpYIYyhQ==
X-Proofpoint-ORIG-GUID: yQzbi8CIObjaGlrJgj3euz-kbSk9tFuZ
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a29270e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=u__0wiaksbrxrX_IWOoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112373-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6634667B93



On 6/10/2026 1:55 PM, Krzysztof Kozlowski wrote:
> On 10/06/2026 10:08, Ajay Kumar Nandam wrote:
>> lpi_gpio_write() became unused after the PM clock runtime conversion
>> switched write paths to __lpi_gpio_write() inside callers that already
>> hold an active runtime-PM reference.
>>
>> With -Werror this triggers:
>>    error: 'lpi_gpio_write' defined but not used [-Wunused-function]
>>
>> Remove the dead wrapper.
>>
>> Fixes: b719ede389d8 ("pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM")
> 
> Please add Reported-by credits, at least Nathan as he bisected it.
> 
> 
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 14 --------------
>>   1 file changed, 14 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 4d758fd117c4..fe7ec0176081 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -79,20 +79,6 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>>   	return pm_runtime_put_autosuspend(state->dev);
>>   }
>>   
>> -static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
>> -			  unsigned int addr, unsigned int val)
> 
> So why do we need __lpi_gpio_write()?

Hi Krzysztof,

Thanks, good point.

I will respin with:
Reported-by: Nathan Chancellor <nathan@kernel.org>

About __lpi_gpio_write(): it is still needed for the in-callers path 
where runtime PM is already held and we only need the raw MMIO helper. 
The unused wrapper is lpi_gpio_write(), so this fix removes only that 
dead function.

Thanks,
Ajay


> 
> Best regards,
> Krzysztof


