Return-Path: <linux-arm-msm+bounces-110962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MdvmLcAhIGpRwgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:44:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1315D637A7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:44:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DW5sLziQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="U1x/y+9u";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110962-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110962-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B9E03234D97
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 12:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB7F3D413B;
	Wed,  3 Jun 2026 12:27:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC7D3C4577
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 12:27:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489633; cv=none; b=LKy6+uZ3aryUOHmC/snQjiR+V9I2tJpLp8DV35IrTSvy6iY5NZO82RtIrseP98okP48oJANvmeWLrexl0PKY8OD/wlodMhnxbdhtYnWbIfrnuu1MklilrbnnClEJwqNglmSZLSHtmHYqmLl67C7bpYM51zfpwSg4uISqujGPYIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489633; c=relaxed/simple;
	bh=PwdVwfODst2J6Ojes5eX5TX3aui0RUEHU3DCApNhFc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOLTaRv7o4X4vSNodg0MGLet2Zs0v71Sisdw0vVSyTkEWNq9EtpLvHFv7oPIGhcbqRnTRuhamvyFf+clP2k9VRV5fprOHsN65Nv5CFu6hSTL43/FuijcSz5l7E0Izt7mI8k/rwzoDeksJeQ0wIxmewtXfCvvbMwqIhVq5FBI8T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DW5sLziQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U1x/y+9u; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6539vYQ52368138
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 12:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KcuXtxQFh6cdRyeppemdTbbMWyjT7mPwjFoMIefvZI4=; b=DW5sLziQMnoj/9J1
	6nlxUr0hq6/qPXgMpB9Y0eqJw2O0IIfkfx4Thx2Lqaz9qlMbaCSfaNe1VUz9gvlA
	DskDvCmylykuOs1bvVbCEgRil9tDGUZlMVqXhL/QWstTX/7s1YVfhvEaPZC4VvlK
	hwKdgEH4GDjqao2rlytzwKvJcU9ur2FV/4KUol4icTLKLDeyYcgMrRe+xL/rUfd6
	jTcIzAj8VRmTpqxt88yCubAZr7MFn6fHcR7k4bzM+L7N4kk7hrj52P8m5vdIX3F5
	OPrS4fv8L9Iv1QE1Qppc2eTMDvUS073BLbn/JWOQfSN35nKUcvibOfUKdbEx+1Pj
	PZpBkQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3ggj3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 12:27:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51749fb465fso83188911cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780489630; x=1781094430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KcuXtxQFh6cdRyeppemdTbbMWyjT7mPwjFoMIefvZI4=;
        b=U1x/y+9uTi+RcXc0X+/Iamcu3E0Dt2eOoxPr74pfj5qzPCyIeswv0DWF5ev0hiRpso
         2/L7bK/3I1Gs7Lc2SIOf73LX7RMJIc76HJklC44dnAggZQVbvq7pttXfSuFcmmxnLMw1
         A3R8gkY1tkPTOT7owsjGQB+a8PEZJNXXHFm36k2ENKoE02cM1Tms2NkvFm4GtvWvLUaf
         uqI0oqeBIWUngCeAADJvXnL0dl9tDEGagls00lgsrL+aTK5jzBLtc8ljHlA3qY4w8XWX
         veRaAFzjCzJYIcR9ChbxRfSdrDIJ74VxmNIpmGu4qVvwtqMfSjFGkuGxSlN2Q5+/bLjz
         GpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489630; x=1781094430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcuXtxQFh6cdRyeppemdTbbMWyjT7mPwjFoMIefvZI4=;
        b=HKMLyK6H4xy4lTWF0+fL+4JejbNUkYvFylibbynzWzrIfSNIpB6T1DFY1KSl44MEU+
         Q1Q9EYoCcCa08wZXC6el+BbJJU6PONDZfBplVSEFu40pUvcaktrsRHUtCqvE3yh9qydB
         HMjr+Pod4kBfERhrLXar/2PxerSsaCA5054xppcoSFVU7Qa45jZoYpyXrB6pgRskFN2Z
         +S68i+mute4IXNvTZ0c5jq2GVjVV1ZMd3+s5rLpVOmKWD6tUhXzX9/nqqWgCTeipUsx6
         3CGquMg625F/YNRy+2RvxeePJQCjTbRVmOWDEK6WMxYaEuXO3861/saJDCjOjJIbvfFg
         q1kQ==
X-Gm-Message-State: AOJu0YxtYBtiTr89dl/9Z+2Lg4nkypDAqjEdYjkiECef5p+fG5aPJQ2l
	BtsnmIHf5oD1od1QMXVQlFJvi0J2VAu3F14qAs7ri9OGDnBNSyBIOtm0Iobf80HtyXLhKL0g+AO
	xSVjt4xmX8rkw7ZWJLA1u1ucY8PFm21dPS5656b5UxrUfyib7RTN+19UHgq+CxJaV8c09
X-Gm-Gg: Acq92OE6aLMIOSuj73uZ+8qzqT2n1SBeZH5qKwjxxUzJET8Y8ru3gCZuH2Ii/sh8xD5
	GeG2xsZkAusfQeDV2GO7EGejKgNV2sIyyJTNkK6EM6j7aIHrBdvAciq/PVyYKny9CbuEHyfeBp1
	qHVqVst/LFc3LqUsfBE4Fkk26KfVU9JmdfCcNeCaHKmTPe+FdJa++yA+MfZjpzgDWWHxbpfRb9n
	7zfaDEgaGr9ptb+NPCCoI/zX6Bf7dHk9aUfd/RENjmlYlDw1capFZjJt7Y2+fmQq2Dov1WP25Lh
	uj9fKEzFe6eQ88DU3wCM0TSYa0V9B1GrhzHYe9Lp9tDLbLUuW6cTacophFRZZJ8r3JAJTUu7ym9
	4I0vEdILgN/R+Xm8ZaFEyYyPkTIs5ca3VvPsW5heox675izzQO/5tbw6tl9/ekDMVBc9gAhDEyb
	Sg
X-Received: by 2002:a05:622a:a94b:b0:509:23ee:b9a5 with SMTP id d75a77b69052e-517785ec91fmr36208501cf.5.1780489630442;
        Wed, 03 Jun 2026 05:27:10 -0700 (PDT)
X-Received: by 2002:a05:622a:a94b:b0:509:23ee:b9a5 with SMTP id d75a77b69052e-517785ec91fmr36208011cf.5.1780489629944;
        Wed, 03 Jun 2026 05:27:09 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b725fb1bsm51092655e9.8.2026.06.03.05.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:27:08 -0700 (PDT)
Message-ID: <5b990bd7-e234-49eb-b5ae-5ec117fdf2d5@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 14:27:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] thermal: qcom: tsens: Disable wakeup interrupt
 setup on automotive targets
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260601-tsens_interrupt_wake_control-v2-0-ce9570946abd@oss.qualcomm.com>
 <20260601-tsens_interrupt_wake_control-v2-2-ce9570946abd@oss.qualcomm.com>
 <80333371-48b3-4cdc-85b4-5625af6517ff@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <80333371-48b3-4cdc-85b4-5625af6517ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExOSBTYWx0ZWRfX1JvmbPEOY0wI
 HS0na/iG2z/kxwdv9txuy9zEfjN7V9nvGzluDiPyiDrGcjlWWZ9/5++YkGGSinZSs2qhp5x5cGd
 eHwJQ1oFzl61+uFhT6Ueor/MlXmrczI6poRnP5JZRs41HIkwrQx27UGB4I7nBZqvh+SQHx6ZYow
 eXq3w7zJOysp7ppo7Noqo7UQH+JSg55TKREoi+hrd9Fjhi9piCn+Qrd6Gcav63VJFeVGe1HRX62
 ngeyNF4LYMBbrtXEicqSIAvGtgqkuMiMbRkGqyBzoX2qqpYZDe9NMnSEMYJDwdHuDiGdpsuGcIt
 +Po7SewZSdM1plD2aCb5qgzdJM5xdNG8llxQYVDHyu20jKxCciepY5dsBMaLRdFqHcP7Z9o2UI/
 lpoJIUI6TIE6WC4XmQnCcStgAO7jSG7Sk1uhw2ey4Yvsi9bhWRjg6eDEc2VFdSEMMB3MFvqpu4W
 OziML/hF3bGtR3NajhQ==
X-Proofpoint-GUID: 2ZqmND7S4FGA6q0dNeNGfwsKiHu3eIN-
X-Proofpoint-ORIG-GUID: 2ZqmND7S4FGA6q0dNeNGfwsKiHu3eIN-
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a201d9f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=dGskjvTNRG8KmToDP88A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110962-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1315D637A7C

On 6/3/26 14:25, Konrad Dybcio wrote:
> 
> 
> On 01-Jun-26 08:37, Priyansh Jain wrote:
>> Add a no_irq_wake flag to struct tsens_plat_data to allow platforms
>> to control whether TSENS interrupts should be configured as wakeup
>> sources.
>>
>> Create a new data_automotive structure and add compatible strings for
>> automotive TSENS variants (SA8775P, SA8255P) with wakeup interrupts
>> disabled.
>>
>> Automotive platforms can enter a low-power parking suspend state where the
>> application processors and thermal mitigation paths are not active. In this
>> state, waking the system due to TSENS threshold interrupts does not enable
>> useful thermal action, but it does repeatedly break suspend residency and
>> increase battery drain.
>>
>> Allow these automotive variants to keep TSENS monitoring enabled during
>> normal runtime while opting out of TSENS wakeup interrupts during suspend,
>> so the system can remain in low power until ignition/resume.
> 
> Can you not just disable the wakeup source via sysfs for
> your needs?

AFAIU, the system will crash for this version, so it has to be disabled

