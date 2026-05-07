Return-Path: <linux-arm-msm+bounces-106233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COykEXQQ/GlYKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 06:09:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FEE4E2CAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 06:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE5F9300D333
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 04:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F6331E107;
	Thu,  7 May 2026 04:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NKiR+Hwz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NS+xtHTt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F93F31E84B
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 04:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778126955; cv=none; b=jS2XFoW20usSVvMMJxwGqaDlpDiSNidvoIK8FOvk9o1MhElaQvrrEuZC8Hudu4kDdcKvDKNz2qIFOIf8oMV/UMRYdJnjMpBrlVeRtHUztqJvwwLCHX5VHjNQx+Z46aJZibgCsi1NmMQGcMHFOL5BcuIwlX3crqnMkJYFriIkEGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778126955; c=relaxed/simple;
	bh=WtUC1agCPDh8q1OptnVFSZ0gqakui8D6ahrqHsh7bgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjWwCZEfi0Y3GTgryTTqGslYsnfO/AMShhvG1RQ5mQGX+gSFrY/GalpMRtqreE7vuJYD5V8c7GHJwhVyZsS/cTDOK+PS/gLD5yGHQJRRNRwyHfD8/Eufoo4Qjpviy0L/JoxTlLZBSQx/L24/Llz0yAlk3rXML07AW7h0o8pCwI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NKiR+Hwz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NS+xtHTt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647464MT880238
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 04:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WtUC1agCPDh8q1OptnVFSZ0gqakui8D6ahrqHsh7bgE=; b=NKiR+Hwz8aKEPHp7
	AptYX0puDPEhB3byWywfEZausfD2zBMbOP3JHCweT9/MPM34srzc9W8Pn/+8OGvS
	Z1QL8Ol+jT/Y/6QUvbOjqEYI2+I+ZHMEzB7UrTE5soHOiCVyDDCBAXGny1hHkySh
	zrfM8xy855ZktFYZHArnofd7o5nnXQLyJJYQnT46wQwnPXeHMgIUSSiDH2tgyr3T
	E7Eguvxq2LbdOzoNxnImvFd+xKb0w7Fwtr9KVPpB9tSkGfjtGBMVJtohDblmKEoZ
	z02Qk8j2o3kpvd/4dzMxUOvwXwRn2aFdpalvqn5vR26DTmJUWyEeBR2Qey3LHROR
	5DfjFg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq007y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 04:09:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c44bf176so517758a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 21:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778126951; x=1778731751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WtUC1agCPDh8q1OptnVFSZ0gqakui8D6ahrqHsh7bgE=;
        b=NS+xtHTtvJun8P4dsXgrkEH61E9LKPSIQmlp+4aBMjfn+WG+q9jVoIp3ylibUQlD+4
         yQ495Zo+hbNZ+glFI6z1+tsc0m13hiNfixiYBCYZcM5P6n/LpWZtFiQA3kF5V4wF21/X
         N31W7AZSaX9JQZt8gyJrpWfuCARPUX6ZoZvK4V99bUvZbsDPMkjE2JQ/LQAs6LgwXjhb
         VFu4D/6I4BpHuNUtn7eAfy+jCzBpHxTFtt7zIEWRvkjNLH1ehzM7Oo10xqTjW5daDUHR
         nLVXnK6ZNXbhp+TnYZnmvV8iLBO5ek7XyP1dW+OBAPcW+DQl/bWAs0HyqhlDKj0NxqwB
         cxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778126951; x=1778731751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtUC1agCPDh8q1OptnVFSZ0gqakui8D6ahrqHsh7bgE=;
        b=ad/LfngXhE7/F75dGAkUA+XOIOduAnqnO2IVLMQFbvmK4sK5G5AmAU9qRBzYf7P+ih
         +lRGeBHpGPFZNAwLjjKYzmEto5ZGEK6yv/K6r+tSEu/T7AM8TgJx5s1Ox3ZezxnhuWx6
         5lDKDx+OgsLuyzQUH0VCNiBS86tOQM6v+JP3QfENIEer+aP6Et18Ct+Un0XNPIYldXxs
         P1idOqcAdVlnZOXnCFfCmseOSpF6fDbvvEkYblmrtmHe2vMKTjFHenroM7hzXDHVahCP
         TOTNt5IExIwZ7o3fkHImM2+oQStsGH46gEp9jWNOvp8wX70L7rWKjcKTYaa/Ey5YnYhc
         9asQ==
X-Forwarded-Encrypted: i=1; AFNElJ88qyyTfgGUWZfpjQTkJoWR7fZy8gi7bIf5bEQcHLI1nAF53lij8945uY4blwiT1ByzWoo2msKgdtWdnRBc@vger.kernel.org
X-Gm-Message-State: AOJu0YzEHc0PUdID2J/ZyiCMy15UaUxEWYHWYqML9jBJ6Xx4UOyxTcVM
	rubLkeNfix6VieNeRPMExqWecPlX/brMj/Otn964o1iHz2r5COPZa4GvTwlBseeKHf0LzlXvV9R
	d9gsjp9IAbeGS9OhrrjjH4GaOU2Ewl8jxSB6OGI9ImJ99WS5JyqwlRKJU4XJW/CeL5ook
X-Gm-Gg: AeBDietZp12SIEdjMpQ/ioScNdjR0GWqMpQUcGSccYF2H3ZdkXtqiAcnAOpScugpDk1
	OZkL37q6JldSNfR63zPrpNKvvKxHteunfw6r5+bOTsHTyxxjujydsLIaatAGuFKfL1sfryL+Mex
	MEQ+sUIwF4/tDydWz2BEWUcQ5pGrQu+iVRuzoUiUlHuRPLrJceDGL69OFUqMTQAIS28eVzbGyjl
	kqN5KcC6/0GeCE59RxAXSjK8zEWzSXFFx89ESRJsh9f/H1FP8mJe40nOy3KFsI1VdpWqK/PMx0q
	UR54+018cRvGsP580RuvHjrDRMYDEnnXPgJnTVcsVOnQY/PEPWU3sZjft8B/VxFIB3gWXcVf7eG
	i8rBl8OT5dWojDh59hTq+Ij2xTBOLrZ+X2GiT4MaK5XHzjbv0xkrFee83Xi00
X-Received: by 2002:a17:90b:134d:b0:33b:b078:d6d3 with SMTP id 98e67ed59e1d1-365ac7757cemr6881541a91.23.1778126950763;
        Wed, 06 May 2026 21:09:10 -0700 (PDT)
X-Received: by 2002:a17:90b:134d:b0:33b:b078:d6d3 with SMTP id 98e67ed59e1d1-365ac7757cemr6881514a91.23.1778126950094;
        Wed, 06 May 2026 21:09:10 -0700 (PDT)
Received: from [10.218.34.110] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babadef249sm8030845ad.59.2026.05.06.21.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 21:09:09 -0700 (PDT)
Message-ID: <4809a7f7-8ec1-4f72-9154-8ca01111f4a5@oss.qualcomm.com>
Date: Thu, 7 May 2026 09:39:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Unconditionally mark gpio as wakeup enable
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260430-enable_wakeup_capable_gpios-v1-1-5de39bf06094@oss.qualcomm.com>
 <CAD++jLnX5J+GncH1U6zE40eErQ1LeNiPmQqZe5UewR3S4VhBOw@mail.gmail.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <CAD++jLnX5J+GncH1U6zE40eErQ1LeNiPmQqZe5UewR3S4VhBOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc1067 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_3-bX4vkxkCJ1edF7K4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: V_LVOimFndENb2b2XWYPccesa7q3PbDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAzNyBTYWx0ZWRfXyhoLsnXHTM5x
 lah5m7XfVCq3H361m6txvHfLRY1CkWWZT1DMHWcnh6e7iOm4dMi9jnndFGqSvPiI/nsR+AWLbla
 WDrxaOmFa5ZMqeHP+dO3CYy4bYHPFySrI8YZL6oWbjBmrgf4QeWA2W8ITmUu7BIj0U5kTO4cWNf
 WvPQqqO9n/BOzdxABC8LgBgt4VE06Km4iXFWKCGaLnGD3mfNhFMxTAJ+reUI1n5kZAa8MVSs28o
 N+AdxLR0KMLGPQZs1jaGIQx+iUfwmVKFNQDsYC2xQuAyY4t3wxo/ZGQphpUh5neo15IiM0VtB2i
 1ORDLV7u0xZ3Urx7p1FHgWChB/lKBavNiWvpiOIR02p559cEGWLGMuS8vfqQhGisiLUCUO5qUIq
 f940aj9QDY4HG3Q5Q9buxkRLeYu949DjJeXTjx7by1LE2vJgTwZbsqpEnWunqOcuj4+TgZUOiNJ
 +LQycN/MIOh+yGtu31g==
X-Proofpoint-GUID: V_LVOimFndENb2b2XWYPccesa7q3PbDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070037
X-Rspamd-Queue-Id: E5FEE4E2CAB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106233-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 05-May-26 3:58 PM, Linus Walleij wrote:

> On Thu, Apr 30, 2026 at 7:54 AM Sneh Mankad
> <sneh.mankad@oss.qualcomm.com> wrote:
>
>> The wakeup enable bit needs to be set irrespective of the SoC using PDC or
>> MPM as wakeup capable irqchip to allow the GPIO interrupts to be forwarded
>> to parent irqchip.
>>
>> This is set only for PDC irqchip using additional check skip_wake_irqs
>> making it impossible for MPM irqchip to detect the GPIO interrupt during
>> SoC low power mode since for MPM irqchip the skip_wake_irqs is always
>> false.
>>
>> Remove skip_wake_irqs condition when setting wakeup enable bit to allow
>> forwarding GPIO interrupts for SoCs using MPM irqchip too.
>>
>> Fixes: 76b446f5b86e ("pinctrl: qcom: handle intr_target_reg wakeup_present/enable bits")
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Good work here, also super-dangerous so if some more Qualcomm
> engineers could pitch in on this patch it'd be great.
>
> Is this an urgent (-rc) or nonurgent (next) fix?
>
> Yours,
> Linus Walleij

Its fine if it gets picked in the next release.

Thanks

Sneh


