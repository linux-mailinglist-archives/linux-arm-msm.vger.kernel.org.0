Return-Path: <linux-arm-msm+bounces-113722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D+9GAfzGM2qWGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:22:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 995B769F414
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:22:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y7WCSuax;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PSg0eGZG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113722-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113722-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 018D1300D75B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9279F3EAC80;
	Thu, 18 Jun 2026 10:22:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300A33ED5D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:22:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778166; cv=none; b=KE79VsZMOm5VsdleUNg2XyTmR+/tB6O0BOJNGDJ9PoqAz/rbQpgVU95lMOFJfHtzW4c0e1oj3KbNL3rJbgfrmw2LoxzIrfiQ6AQgMZXD9D4VxxXOTGVaICE8EgyW4EfEHiKpzi56NvEH3v8b67fMY86VQG9N+PbQfXVi8/+o+0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778166; c=relaxed/simple;
	bh=DMLp0zDdJ/9XJpbbHtisG5K265zhnwPmo6k6Z4juAGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhvmxhyKG7seAB1Z/pEf0hsv5M7RupqfqFGjIqq3Su6W8BCWC1XL5ONQ+qdmB1HXmxSfsfFfX5nWKRCiNFt7iSwUqOm0BYwzwOY4clKEkG1QFpxzTnhuXDeC82d4P/gUy4pI29YiF3xbC56O958X46FIPBQunnMGPtBaZrH59zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y7WCSuax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSg0eGZG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8DgWg692882
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AcN2ezsmfuVyLx0id69tXIlCQ7vrpJyBzJwuPr7tn+U=; b=Y7WCSuax9fBD9T5P
	pG05vgRzpQMSCoeZJJtqqcwU3+P7Sfo7+5jsgnAAdbWPDo232ek5XRTHCwtWqCDg
	OlF3eSWOkCw8VNyJIB6tPfMU7upxT+eJGSanzIvJ2YPfJUHewsaPA0uGOE9IPts0
	95Xfz91bY2MfcTo1aaXtefDHg9Bb3QayRpRL6suJ30HYuLU/Nt8OQm95C0Xe3n5H
	4Ah/1o35QaS0YQCS0tHMV5UcSWgPu1Vmc9BMFxbKaAQPz1UNmx0xZ8pzsgtigwmV
	Y1OtAEknyIb1xcTmSfRT8RUkAreNmRHkE+buUGgBzQ707Gf0Z+ntxWOKHN3Jh27m
	sFreJw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2cc33c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:22:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845319bb97bso760260b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 03:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781778157; x=1782382957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcN2ezsmfuVyLx0id69tXIlCQ7vrpJyBzJwuPr7tn+U=;
        b=PSg0eGZGuKGlHER5zvNbAorWtMqxTSr3LGL8iw/kVq2hQOhARRc78igiaho2ZvoB4D
         tR5HrhPt6znxxMQfOf7MesDcSayOYfK12Z8fYdKEX2ecJHPqQBhZ0tEyfgqPiTbnGOUo
         DeTtdGoe/RgOeb6fGidU3d73whMlaLnrdHqmNQiU1Q4Z2aG5H4BrqIdxGo5W3/iAx1Uk
         X1TwRiXxlSn2bBbVm1npWGFh2Ikfy7cRZ5l6YhJkx6SZNlsVcXRihRHzaHcQrzHK9mod
         sB7PdWFytqkiNmIJ5xaqK6nNaoL+7wBLLh1WIgD3yhF4467omacs92hP947Xjh94pYpd
         Sl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781778157; x=1782382957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcN2ezsmfuVyLx0id69tXIlCQ7vrpJyBzJwuPr7tn+U=;
        b=mU6NbzQbon9ai3rFfdfyRjZh5gcVa0pDlNE02ppk9Xb69TrZlJFJAh/ThgPcmPQiw5
         8P7Ilw/5bWAwXxIWdVEPw4Yznb2uaP51HNJfJm4eKn8k+pGMVY3o47FLv64S9Q9h92IV
         2lzkFniEGOVYglZAbF7bnlTxftq5WyL5VfJXUv2F36OfCn5fhwX9F76CRHbVaV33ET3x
         FGNmm++5PwiZd67/VUMGRgI2lFg1IEh91m8ki6DSejBvVsBmbQY9dCPiPJ3K/xA0HiE7
         Vn0mOk71iLxW90MwNSp2gd0QLMtCKkkHPufG4YQMvIaVy9OoV1c86PGbPBoiPn2Owwr0
         /Kuw==
X-Forwarded-Encrypted: i=1; AFNElJ+cpVMIygZgliygnLfiYV5aO8VmKS7ca9IubIuKJSYQkVbHe5Ij91/ien0nafzCyUmmABp44cTjSPw+eRpu@vger.kernel.org
X-Gm-Message-State: AOJu0YxGAxmF42fGrVKD/kFcV4c6IDey+lt4iBNlmH/1F9tnW9TfpyUL
	kWFQ6JgDaRI3d76KfdvSsFQLfunmdVIpsCPFR4BBfaGImh0qb0kQXJJ66dSl//Iuvo80YGExbee
	r8NDbp8Dq+/kPRsJmIckqnfETDiv6RdIsJOyHhLylgd/9ZVY62CjpHFIYDbMg4NVWVJg+
X-Gm-Gg: AfdE7ckZW5JoGvnaAsDjnwQkBFcgPi4KJcJtx8JAKBj3aGd/uoRRt20mT08pDB0bwJV
	lTAjMFM4FqQOO2Xeo/87Q6++pkKyYs24Ea0b0gxQONEQjJT2CGC9vU94YjtdIKWK2wEbR4VMkfs
	/k5H9V5OnR4q2wBVLjR0uFEk4TXMkH9DcYLq3S5ktfm2+QaTcb9UMqvFnqpcrdkMBv5O42enY3i
	wqd3qgCgGY5IhGqmXtxiAIgO7wt9wplLPlwQ+3hGecz3GNn8oorRayAbXt196tSnFHX7AdlJdE3
	gh/dpj+4Fs4jBQ54u0YfjgojT/yrFVyuu+vmd0oHqBZ+7Wa8XWQW219G+VbT1ulizM3deTIVQ6a
	V3x80j4hr5JVTzE2uwRjwsJEm+uFetBCe7/2nlnbd
X-Received: by 2002:a05:6a00:760a:b0:845:286d:4675 with SMTP id d2e1a72fcca58-845286d4993mr6180182b3a.10.1781778157329;
        Thu, 18 Jun 2026 03:22:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:760a:b0:845:286d:4675 with SMTP id d2e1a72fcca58-845286d4993mr6180136b3a.10.1781778156810;
        Thu, 18 Jun 2026 03:22:36 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8453a8c9770sm2293492b3a.40.2026.06.18.03.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:22:36 -0700 (PDT)
Message-ID: <8ea7d911-8522-43af-8a2f-81ea8479f049@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:52:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
 <20260526-gen3_adc_tm-v2-2-702fbac919ac@oss.qualcomm.com>
 <20260527124220.39ac0b64@jic23-huawei>
 <27631a0f-b5ba-4181-94f9-aa7726a4054b@oss.qualcomm.com>
 <20260614200630.2ea04817@jic23-huawei>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260614200630.2ea04817@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5NiBTYWx0ZWRfX5+r33CVOgSqD
 2zGzKNOgu7TGA46k1jIYgAC7joc+Rwk9xLYl1wSsA/JpZ6FBvRUHBlcU3TDxHSaxqm5V/pFzkw7
 ifDGWJ6g4LtQEx74fAqXt3ViKw05EcAT3tI8fQdcdaCjCbkWPqBC19Ly+DSNP2ljqw2guUDfA4q
 6vEcCiUYaQqjx0lUK2xLZod/uNA/GEB9uMFd4rTYVF87MAZQCbkGeCeKDoBM1v7rB6okay6GVAs
 Am3/fv2rLTUPaJ0mJgXCY+RtrvNMbTrqjzvIqp3hJxwrmOG6jWwN1MYKpuTqhTgUIJRq9s2akHd
 65ETDJVktCBnE12va5cUC52qW6iNd2NwkDpq8beuCq9QXzBhmeClNSeILaYj4fb8wA0hYaQU9NZ
 diqfZb6qAkgT5SR5kMsy6+ZmoxuTMIV3bIOWSfhhuipKJMWP5KZvMU1IXgKYDnSKlTQ0lLehFq2
 isM9uLJeEkTovpL4B8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5NiBTYWx0ZWRfX1hrRwPjjGmtR
 o0+oAFkihlo6YjQwjnAp3fVdmLLa+uidH0qxJlN1PTa2N72pZO7hui/wqrVZFmaFc3+BSY5M2Hu
 xu/k/Mq+oQVgSwcuSFJJPPbxUcxI94U=
X-Proofpoint-GUID: n-9yvdgQjuaVleuvUL0PC9VqbbqkbWlI
X-Proofpoint-ORIG-GUID: n-9yvdgQjuaVleuvUL0PC9VqbbqkbWlI
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33c6ee cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=DDJsQkWvfQMYwb-dyrcA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-113722-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 995B769F414

Hi Jonathan,

On 6/15/2026 12:36 AM, Jonathan Cameron wrote:
> 
>>>> +static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
>>>> +{
>>>> +	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
>>>> +	int sdam_index = -1;
>>>> +	u8 tm_status[2] = { };
>>>> +	u8 buf[16] = { };
>>>> +
>>>> +	for (int i = 0; i < adc_tm5->nchannels; i++) {
>>>> +		struct adc_tm5_gen3_channel_props *chan_prop = &adc_tm5->chan_props[i];
>>>> +		int offset = chan_prop->tm_chan_index;
>>>> +		bool upper_set, lower_set;
>>>> +		int ret;
>>>> +
>>>> +		scoped_guard(adc5_gen3, adc_tm5) {
>>>> +			if (chan_prop->sdam_index != sdam_index) {
>>>> +				sdam_index = chan_prop->sdam_index;
>>>> +				ret = adc5_gen3_tm_status_check(adc_tm5, sdam_index,
>>>> +								tm_status, buf);  
>>>
>>> I think the clear of other sdam interrupt status that sashiko was pointing out
>>> is here as somewhat unexpectedly a function called status_check clears as well.
>>>   
>>
>> This is the full comment from Sashiko at this point:
>>
>>> "Does the threaded handler clear statuses across all SDAMs indiscriminately?  
>>
>>> Since this thread loops over all channels and clears the high status on any
>>> SDAM with an active event, could it clear a pending event on a different SDAM
>>> than the one that triggered the IRQ?  
>>
>>> Because each SDAM has its own independent IRQ line, if the thread clears a
>>> pending event on SDAM 1 while servicing SDAM 0, couldn't SDAM 1's subsequent
>>> hardirq read a status of 0 and return IRQ_NONE? Could repeated IRQ_NONE
>>> returns cause the IRQ subsystem to shut down SDAM 1's interrupt line as a
>>> spurious interrupt storm?"  
>>
>> This sequence of events can happen, but it should not be an issue.
>>
>> It is possible that the threaded handler is called for servicing an
>> interrupt on SDAM0, and in the loop there is a violation detected on
>> a TM channel on SDAM1, and the SDAM1 TM status is cleared. But in this
>> case, this violation would also be handled after we notify the thermal
>> framework at the end of the loop, by some threshold update or disablement.
>>
>> Even if the subsequent hardirq fires for SDAM1 and it returns IRQ_NONE
>> as the TM status was cleared, the violation would have been handled
>> by some threshold update, so the interrupt would not keep getting
>> triggered afterwards for the same threshold's violation.
>>
>>
>> I also checked the conditions from note_interrupt() in kernel/irq/spurious.c,
>> for enough repeated IRQ_NONE returns to happen to cause a spurious interrupt
>> disablement. 
>> It looks like there needs to be more than one interrupts returning IRQ_NONE
>> within 0.1 second to increment the irqs_unhandled counter once, but there can be
>> at most one TM interrupt in one second since we set the time period of
>> recurring TM measurement as one second here in the probe:
>>
>> 		adc_tm5->chan_props[i].timer = MEAS_INT_1S;
>>
>> So a spurious interrupt storm is not possible here.
> 
> Whilst sounds valid, it's a convoluted argument given it relies
> on us getting spurious interrupts reported, but not enough to trigger
> the stuff to stop interrupt storms. The rules around that may change
> in future given it's a heuristic to stop us seeing problems on dodgy
> hardware.
> 
> Can we just avoid handling interrupts for SDAMs that weren't the one that
> triggered this particular interrupt?

Thinking more about it, this would be better. I overlooked it before, but
we could get the right SDAM from the IRQ number and simplify the logic to
handle only that SDAM's channels. I'll make this update in the next
patch series.

Thanks,
JIshnu

> 
> Thanks,
> 
> Jonathan
> 
> 


