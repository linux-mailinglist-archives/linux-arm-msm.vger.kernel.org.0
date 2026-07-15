Return-Path: <linux-arm-msm+bounces-119237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V7J0DCF8V2phPAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:25:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FC675E0F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:25:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pHvrERru;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FBAFhXwl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119237-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119237-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A37733058AD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBF1431482;
	Wed, 15 Jul 2026 12:21:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26083446853
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:21:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118074; cv=none; b=BriVdFvKyFXOL1HlB8KPF//qDQFoPJ1UYfGRkhrN073xLQlsqnXoDKHHo5kKySeGNguat2QeInl9s4mkVPIRDqk0Au0kY9zIjU1xmJN+EysrwysgjHCX3rQ7e5Th6i8zPl673tpWog9gLxcgft51ftFDfAHEZVHcyCtRqW1QwMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118074; c=relaxed/simple;
	bh=UsJJVZgPYhuKiJKxmeEoL93b7KKYjSsAtMl1VKGYLh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CC7EUzOcJYHDJYzGpotMS7nQsbQgUWlXDM7HnDpcp00ufyyemOup2MTSa/0EVZjA34jtgjioSvVZrNdLu5PMZHJkVCpu/Cq7W5SLlvX0IZbW2+35hjrw4bYgwwDcwXyVsxJFeokOXUDTFTAx6RDAlBH9OpUTJC9IWJ/mGh55348=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pHvrERru; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBAFhXwl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcinK3480176
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Is9fHEtyP37b12SZvzIktO5He1n87/RqMhH8YqHC190=; b=pHvrERrut2Gz5hek
	1IV6OkrK5jZId6+Ke9AqSHdoWv9/RXB14dWpyzis1ZIAsxF7gTIXjfMEClEYr7yK
	pV5Edhzv6NRcsLT/T5hwNZ5hXhBbLwp2aYmFj+bJMw+LkxrDyLKafAVPJ84pVgXb
	ZwfL+dO88+sPB2+9mR53KWsn9/K1jdEu03hAjDIQEoeu9+JL9FM2ykQwOYO16mmK
	RmUSILEISflLCCNKOA29zBUeMwI2p4MlA+cDJkeFGebsq0phTP2gzDjYP5WVTPvx
	cffaOmNA+nbCYhr37s5pEyFd7Jlv3kflxylvS3FmOwJxO+kCVAogd/cyQLWwZRrA
	/eiuow==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h99r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:21:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so2324551a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784118072; x=1784722872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Is9fHEtyP37b12SZvzIktO5He1n87/RqMhH8YqHC190=;
        b=FBAFhXwlumbkrILlGJwZpTQZV/OJYwRTStN/k8Sot/y70DLr8JlLwLPZQ+fwALkK0u
         aEQ6uKNtSr17wYF+ScRonhjPIIsZfXOZKCMTrtrWJdw/stWjU+aL9CL8iEPh5DA1jEx7
         lUPRQgK76gEkgoQxLrGHr9BO33kn2GxPh2KoOkV9aqcU1rS2TOk4LkY+N/nSoV98ipCs
         1z6KUutQl+F7rMDUw9yWBQvl9Xz1vTmFWozs2VkHNz0OLTxIfZxQB4wCe9gjCgdDaDFA
         pf0Y1sgZ8/OdC6lVCetWJ1pBTg7tzLTLY3Yp1sZFFElid/dwXF3x1rICkE+BzSDnA2r/
         6vwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118072; x=1784722872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Is9fHEtyP37b12SZvzIktO5He1n87/RqMhH8YqHC190=;
        b=oAmnbvwIXfxTkfUGvM6efboORcW9XTNGh4/GtlQFlYvhkdeCxGDxudJl70V8v1mltv
         nPOpJz068xUmQmFie730jhlqaIYM0FZ85pszjHCxNqsQ1Fw77b+MKwbU0u8dy1rRIu1M
         frx6orulh6qy5YnGxUoRuAPGtJ6jOEPwGH5hht5P43zXdcHFRDdj4Kp6a9ClIJZ/IC5X
         RW5s0YafIVdH9QioY0xL8C6V19X2hFc23VOpTyvogLGw2UmC/93u89uNOjbrb0t51jsq
         GXxhs7W/ZtpRbtsYXAGuJboDVa3AMj0WP3Lmi8hXw48Ho9kgEemMhViknKi2wIeI5gzM
         TIYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9j35lOcntjoPMWSifIAzOrwjX+DeDvEycxOM9HV1YaYtJplTmKShP180wIlmAQszhcVLtWjTA40c4nv28@vger.kernel.org
X-Gm-Message-State: AOJu0YxCDYciZbreset3BwnYDxNFwFYnmAgrODsti8o4Uccn8AgGsPA7
	HkqSyFwK7fPh0EkQWiJx0i2E/V8O8C0mgVyI19w1TbQOuA4BQkCXxhsJX+hxeOujEBVRxbxr65B
	ZbDP+YjnBAIsWu0/12B2Y8TIRgF98ZHsoqW2GrLqtzD/7TSCxZvFt3eOl09I0A1wlKDGxc6xny9
	RQ
X-Gm-Gg: AfdE7cn1lTeXfLdoGPbjtQV82ESmKLnsrXGh/9s0YfLQAb/r+3EypGmQxHJs26IV0JB
	uOFPROwIfSDhlRnGY0V2TJV3lSejZRLCD8WfPv6Ufpg3UwwWxk/nRohR9HyIcTnWA72JzjksO36
	wOaa4hwmPWkzlX46lFm59Qkd21IcHrs7ZNQZOhfJZGV+twds+iHP/ebGL9W6r0X7zD0BcvN1lr4
	zPMjGj2+Aqw9q0nxOrtd7vXp/rzsjJ08Vn6I+JPJI0HFDXM3v9f2rzI7Pz0ZUxe1YOzNYFe+mzb
	HgsVsfXlesjbO5E0mIr2XCxyhcGRs2sD3sPXNE1ulROhyyUBc06wqqiRQBsY7G6+1WhejDcZQzY
	Q7F3bpfcZZqnCkCYoelG8LOyjESljqse399kHrQc=
X-Received: by 2002:a17:90b:2248:b0:37f:fd70:6790 with SMTP id 98e67ed59e1d1-38dc81c1b09mr12439681a91.9.1784118071639;
        Wed, 15 Jul 2026 05:21:11 -0700 (PDT)
X-Received: by 2002:a17:90b:2248:b0:37f:fd70:6790 with SMTP id 98e67ed59e1d1-38dc81c1b09mr12439649a91.9.1784118071023;
        Wed, 15 Jul 2026 05:21:11 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a714csm1089114eec.14.2026.07.15.05.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:21:10 -0700 (PDT)
Message-ID: <7b8bdb1d-d626-43f3-b02e-a92132095225@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 17:51:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-wsa-macro: check clk_set_rate()
 return value
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
 <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-1-f0c713ff0b4e@oss.qualcomm.com>
 <2bd4fe2c-a42a-4fac-b82e-0c683da5c9a0@intel.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <2bd4fe2c-a42a-4fac-b82e-0c683da5c9a0@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyMiBTYWx0ZWRfX2b+6DdTgFt8h
 9T1jKv490+zs8MSYflVDtH89yeeg9WrnZ7Ay9ZfBJa8mfKeloQWNQ9Jjk07VpkVpchdIa3JIeDZ
 FQhg3kh9kSEWGSSnX4+XoDFYl1KzOco=
X-Proofpoint-ORIG-GUID: ppSuuPuduqmKJ64lCGTFHXjra4E1Af-Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyMiBTYWx0ZWRfX8R9bhJXUfx52
 M4OcA7cMO4tAlLUtQ/+ygkW+kZivvyKbwijDEraWayXZPtR9PwqtlHWOLfQXP34Uefry9pxDKc7
 aPUkjSwg+gC611BVFt68qDMVnSIffuX7fANQxKDZaPMCtMp11rHrNLGyVNGy9FnFaNkr+/DxYSg
 N97gXd3c9ffbnwOLQRatrJn/6nsIlGsdFpXsrG3nz1frMf/4+B6R4l4/RHydaPDDSgzkzSmIpCJ
 GqAMqP9ryIDjKk7AnZNkULkj/KssyNuBreG3QRsKGLJV5MPc20spUL5ANFpnSb3vjPWdlljbPro
 XWq4la/BYplPwrnR6wVQ94qNgGAazdGLs5pu40aNfePHoDP3JOU5ZuexY3M7bhriJtnWHaKolKj
 j/dj857A1GLNrFIEOR/mjRy01cRJc3P5IP3JQJiYFFdQa9z6uTKI9aIX6viu/dWqbjNcIbaCaog
 XwNmnF90gBbovZ1RLZA==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a577b38 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=M4EMIQaL5TwLBXTeg4IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ppSuuPuduqmKJ64lCGTFHXjra4E1Af-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,perex.cz,suse.com];
	TAGGED_FROM(0.00)[bounces-119237-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:cezary.rojewski@intel.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70FC675E0F3



On 7/15/2026 3:03 PM, Cezary Rojewski wrote:
> On 7/15/2026 10:29 AM, Ajay Kumar Nandam wrote:
>> clk_set_rate() returns 0 on success or a negative errno on failure but
>> the WSA macro probe function was ignoring it. Check the return value and
> 
> _is_ ignoring it. s/was/is/.
> 
> A patch is a proposal, there is no "was" until it is merged.
> 
>> bail out of probe on failure.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   sound/soc/codecs/lpass-wsa-macro.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/ 
>> lpass-wsa-macro.c
>> index f511816aa4a0..fc9e0a37c042 100644
>> --- a/sound/soc/codecs/lpass-wsa-macro.c
>> +++ b/sound/soc/codecs/lpass-wsa-macro.c
>> @@ -2773,8 +2773,13 @@ static int wsa_macro_probe(struct 
>> platform_device *pdev)
>>       wsa->dev = dev;
>>       /* set MCLK and NPL rates */
>> -    clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
>> -    clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
>> +    ret = clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
>> +    if (ret)
>> +        return ret;
>>       ret = devm_pm_clk_create(dev);
>>       if (ret)
>>
> 
> Apart from a nitpick in the commit message, code looks good.

ACK, updated in V2 version


