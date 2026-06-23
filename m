Return-Path: <linux-arm-msm+bounces-114256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S1uMIv3DOmoJGQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 19:35:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 070106B91B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 19:35:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bIUQxLad;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bupRXK4P;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114256-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114256-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D209A30E3591
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 17:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDFC38BF89;
	Tue, 23 Jun 2026 17:33:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714F838D68F
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 17:33:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782236009; cv=none; b=UQIEFWrVfg4IykEtbKTJirGawYS0Hi8jdvghXIH45f0BySCJfU+zlbg87HZNleLw4i7j4j94/dG+RVpmYx07enlzirt/3kn5VA3N+AJLp4cDaF29d7Vgv2HUuIHPdXPdkhhB8HBPVZF0KhZ5dHm/lliwM0GEKGUEmpAjfUouFAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782236009; c=relaxed/simple;
	bh=M/ZdaV3bWpITbQ9P7dBtvgv3HsaKtewABZW37rVuqv8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PLwiLdSFWNYBxmar6QQtletZ5kuYLxHEIKx/reroO6+CK8QGwMtJrtJ5RMh3wO2HwQkNnLxrp/PUiGtXTOl6zAZp1KWFcmGlIhr/SA6yOVST5CA1IXHqMTe16Ni5ptTeIDAPaDWHyMWjP+fJNVQywn3ax452AK0BqxnMioti4OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIUQxLad; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bupRXK4P; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZFSe031289
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 17:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcBFDibJQ6H+O2JOqKjSG5XqxwtgZkRz215FbvC3s1k=; b=bIUQxLadfQ0HfT4v
	4xCMlZD7wIZEAPk5oL+4TGH7yqsnsoMUB7SGgwvJLO+rbSC/lAd3XoRMv1c+bDwA
	c8AiUB9GYiMXtWeB2XKnFSYaZx89QrCWa4Y3aHIOcejnDrKm00aQTcD8e/alVl18
	zh7hRrIHD1xU2DkAvxlFW5bZmQ0MlSwdpuPSi6FqshE0Z7n9MDfA9ID9TPRO0vL9
	9IHIkgNtyilUcviFpEj2x1INSH6yQ5iAc3pBGkBEjV2XbHMETQB0ByCOP1yq/8Qh
	9cQQgVuERquE8blsx8bOo9UeabgG0bQrGjeYjxe5E/hwrmBPBHvJbTdGxolD5clj
	/F98vQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe6a33b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 17:33:27 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-966df3665efso49291241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782236007; x=1782840807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fcBFDibJQ6H+O2JOqKjSG5XqxwtgZkRz215FbvC3s1k=;
        b=bupRXK4PuGUP8TtuBF1Nm1IdkkblIu+YbSsozHhXUQ81wSOZFA+px533fCPvxB340v
         0BtnR4Q1GOVStyy2vo3jM/a7fEhl7c+G+DYD0JWVc/fl6wvWwE2dDuh5res0sJ2xPKjs
         /rRKxnqOljIvguK2p2h4B3he/YHq1S8eAgmt79Lpx2+PUy+jUdacDEo/aCasUhqJz2od
         Lty4t4vsudldOYF5qtpOMRltmJjItcZpEjosYqiLCkUSVaqD+5/0ND14CKq3p5WoUCwI
         gNhRIPFQOFidurpqMGShKnGhm0an/3WyHbaxBsloh1894da/Bh+y1LChODWRCk3pzYPC
         tK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782236007; x=1782840807;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcBFDibJQ6H+O2JOqKjSG5XqxwtgZkRz215FbvC3s1k=;
        b=eKMVyQSFEwL3aWZYB6vS2+krX659t7ZEQ/H5zHdqXRyF5VeKgm3u3RO4ZagGtjX/hx
         Ab79bijad1lWx1e5HWPVoOOfKD29v5FLn4ijEf0dAkCtdl0/fC6VIgNvByqnjGFcOjne
         7T1qFgJUy/yguMIrJyKVQ5qpXb5H4e5SX6IAQDicluH2RhRTTYvykVfD8uTgK2n1U5vK
         4QQUTR9ZiQARZaa6IfXPJYYNRNKJjcGgYhfz9pO35OaWJZMM8Qz0HuYl9yoRX1Mja952
         NzcbSHvMtH1GPAAnr8wM37cMmppBhAhgG7WUWvjwSTf5NQxM5FI441Z3BomFrjzUy59P
         DecQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qGyxg/hIlZAT3kjqfSgVjIL/4XIxyepmzB0Qlu7Wxfmr0+d1q4xc5Ir/NXv3bN2KmLTEipMvQwRTHfzFE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxben4yELazWq67JDrOCKdEBZZ9yg6kJ19C6p8QEoBUa0snT6VE
	OGQjTD33jrhRrWm1RdcUzWsZ9P7ZDDIZhtloRKR+p0JXkxeP7188fM32u4dH+4x3hJsBIx3Gok4
	htift/qmqiwJzXTZeB+g4UMVRi+oJ3h61WNIKkCYCA0OBXXkIkb/H0us+5AX+KfZ3qdqx
X-Gm-Gg: AfdE7clmVPQZCHRQjuxPEAQaddUMD8USziFvZOXnURpF5KayeuQU4NxCuY+KXUwBdY5
	jG+xUaA4mqp+/aJp8O+ccpkejZS4gkTRYNbRxvZ8GQ5a+1xc9zmTEk8Dc9+u+da+XV7Kzo+ZsHz
	ZTyghJt0AI5sZ1nKqSMe8ZEj9YarHWYrafkGy8JLDDbpvtt2q2XCfSEjmAqLPoAC0HWreWvmgrX
	IpK+Y1AaUoz4Zjn8kD3iim7WUEXMAezTChLP0oWNEmnOlj6bubxzor7wmZub6/TTIF1tUvZjn1f
	+wq+0ZPlHiJPz2aCKwKBpnoTXRp913CV0QW1rRTE4cVwl2L5CLLQachENQUweM5ef9jlVb0B7hW
	OB4CZyI+Mm6cWDWd8IZh0meJaqvIvXOvQIrd7nE7ArrnGAYirlSnQcwLS3OT4eCFIcYVKX2JvIr
	iH90qoYY20jt29HyHJy+55INUWQjgGq7olRilxHRejnYYG30Ozh4972F2zlP+prnrwc7ETDcJJi
	Q1Eig==
X-Received: by 2002:a05:6102:1614:b0:728:68cf:c76 with SMTP id ada2fe7eead31-72fd7c54a4amr2443949137.23.1782236006557;
        Tue, 23 Jun 2026 10:33:26 -0700 (PDT)
X-Received: by 2002:a05:6102:1614:b0:728:68cf:c76 with SMTP id ada2fe7eead31-72fd7c54a4amr2443916137.23.1782236006023;
        Tue, 23 Jun 2026 10:33:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697cf760eeesm1901486a12.15.2026.06.23.10.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 10:33:24 -0700 (PDT)
Message-ID: <97223cb0-59c8-4ca9-a65d-bfdbb3384224@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 19:33:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: Drop unnecessary bitmap_fill() call
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
 <20260623160457.j66dlzxfkvn3jxuj@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260623160457.j66dlzxfkvn3jxuj@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oqfnJ-JWmbWbE8tFPRlMJIQoG9EBo1f8
X-Proofpoint-ORIG-GUID: oqfnJ-JWmbWbE8tFPRlMJIQoG9EBo1f8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE0NSBTYWx0ZWRfX7ZcdRpQxu6yP
 pI2JFySftnClXDmH0GQ69ezEYd3ZYBKe1+sbedZftzhHhZBmxLzArC8kzPKu4dtCyH/jPEpZvu4
 2mOgj8R2zPjqwIPnKRkCa4gZ7YIpPJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE0NSBTYWx0ZWRfX3AvERp01pVQA
 3z5ZmisOCmKFMRj5521ulqePAM9sbr++43Dz1Lm2xSaQPIHkoxH4/9ddJoPE5c199hiWuNMgsyC
 h7FqR+qBozaz5Lxd51HggvL7qV/Z9x0w8PUFaZeJxyyVZLg01ufUoRPU8oZRo+F5vB0bJTblOS1
 7qy182hMov3/q+bRtkIcDE6PBzGnDCT9wyoA4UYo9GpLubvuXCx9v7gLQcVwq7l6KOfwhOocvvN
 RLxMu4vGOdVcitjaeaT4J89++TrIAlIO6B11RemsFSwIGRN0zVQpTl/QLA3479iPM7RkxToUYWO
 n7LGfbE8s4GV6yYRLAjyH0sKSdPza5Q7KCM//OMUSNn0KNym9X0ZNA4jBvrtLnXfmSf6eEOUQTI
 GRxzRks5T8dh6KLiR8n63te2QoqL3XU1Ba5Gt7ZKKspSChxG2fLUv9Zj+g/wSFNeRX3zNG0TIoO
 +zFT5q8GgEeBOHXEvLQ==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3ac367 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=sg1wl6nj3Ose853SHysA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114256-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 070106B91B6

Hi,

Thank you for the reviews.

On 23-Jun-26 18:04, Mukesh Ojha wrote:
> On Tue, Jun 23, 2026 at 02:27:31PM +0200, Hans de Goede wrote:
>> Drop an unnecessary bitmap_fill() call from msm_gpio_irq_init_valid_mask(),
>> this is unnecessary because gpiochip_allocate_mask() already does this.
>>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
>>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index c2938494c6bb..419342ab45e1 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -1047,8 +1047,6 @@ static void msm_gpio_irq_init_valid_mask(struct gpio_chip *gc,
>>  	const struct msm_pingroup *g;
>>  	int i;
>>  
>> -	bitmap_fill(valid_mask, ngpios);
>> -
>>  	for (i = 0; i < ngpios; i++) {
>>  		g = &pctrl->soc->groups[i];
>>  
>> -- 
>> 2.54.0
>>
> 
> Looks like you missed to add kernel mailing list to the series.

You mean lkml ? Generally speaking I don't add that to series which
are subsytem specific and not really interesting for a wider audience.

Regards,

Hans




