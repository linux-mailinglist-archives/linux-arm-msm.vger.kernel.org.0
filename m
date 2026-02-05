Return-Path: <linux-arm-msm+bounces-91882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJv8HLdhhGng2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:24:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 992DFF09B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 905DE3056E8B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA87361671;
	Thu,  5 Feb 2026 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHT74PHt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R8O/rtem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE83372B2E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282431; cv=none; b=tOI8yFzPYxHkglpBGABvbtDKu7EY0ccX6+MXigIjqlfECm1Vl38NVqHZLqasWYAyTFH+PZTXCoj0Hx920/1OTp/aou6y3P5tl8OfII1HrLdFKWwNIS6/j2gWtPPr0PrCC73oTxVUwKwxXPUnnlgmy7HjPKQGjB1hx3BnUcxRV1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282431; c=relaxed/simple;
	bh=GYGam5smJv/Krnf9ZKb7zadPP9DaMPRHvjxWIheLJ6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=bGZ7phNuZHFiviZ54fD0c3+WBEZfkHmW/zPJxqmM8OHH3NGPO0X0Pk7uQjlT2yHViFZzR5JaMJYX2LypYI/wrwDxyNWVwGrjD5b2I3p7pTrr+giWO1YJR+xzRXusH2paLgbFdcUY7/Dh/pYpx+amiZmQvItpVKMxQMzbdSpwXUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mHT74PHt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R8O/rtem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6157Mk9Q890430
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 09:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+5xOzbjY5n//2YI4Dvmh3UhyPEnWdJUEu8SsC0/t6bg=; b=mHT74PHtlYZNN/Nw
	3tp1IuaDFlDV2fjzoTN2yrqEvhO3tMdhXl7Z4fv/1q2m2q9gylsXjs1xGM7G68Ax
	dR0geiPoU67gUya+pHe1uULVJs+4Y9/jbDnRcDoMKWXkRnNgH+mVwNJAs89DA10m
	UtRfIidzF4Ck7qSeuKCtTYKfscod92dqmButriRx1K5fFxOhCcKTGeK1Jwd+/G6x
	axudXvmyTVVrL5+7wDMekS377suhIXoCasL43EWusBQFhQ7wr1H92WV+HEDTK/iG
	wbst1nOcGHnOucXWxt+T5Dig2XsacO/n1nKdZ6XJYde/xtxvdSGm/08i5EZ0+9S0
	fGjd0w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4prx8agb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:07:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81f5381d17dso754746b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 01:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770282430; x=1770887230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+5xOzbjY5n//2YI4Dvmh3UhyPEnWdJUEu8SsC0/t6bg=;
        b=R8O/rtemwpv5K6LlzApHVqsXObzE7E6dZmAaOYDwOfcRRt/7wgpbLB4NJxaoIMeNPO
         a93qfm8P+Swbc52NaopcYUNj0XQVgkxmcu7EITx4w6MHNTCnc/s6KoMlEHVww0Amrl68
         s+5cMvv51EOa02ldtkbUHnh9gXB2BHuKfcFEsrC0bJhleS0R2ggbab2ioKS2wUeyJfa+
         i0L7aeXMb39JvYhUS25zLoVt91Ucg9eMqaKfaaKxB75Gl4RAlMiT8D+xq5+7Hxo5HAui
         ksmPh90vv4wTDLtBWW/mdoM2OrOlNCIFdKvZTHyFC4ePAxx/OGsYXc+iiVWKU8enRD9k
         fl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770282430; x=1770887230;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5xOzbjY5n//2YI4Dvmh3UhyPEnWdJUEu8SsC0/t6bg=;
        b=JTa/GuvToHNiozw2ML0UvB6ILXkHDsTNFXIHUXnZF4WrkHE+tg/nl+UxfcQbsCzyS4
         D4wcTg75K8cPgPcZv+6k+0vjblX7mjSPa8PV09G7m3q+93DNuVx23Pxz3GoePyBi9YrA
         zmRATe6k6VdAzpbSjvYQud86XcMjTp/hIXxMdj9iIG4MHOkdVNzDAm/udcrfNBlsvlzK
         BTfKAKILzeobOZxrxzFGf8sCMe/WykwChfGiu4tWzP/aAX2yqoVQ3DzkTPafHN9BbeNE
         Emn6LW4FK+ORzjsQS1pkd0YwNLi0WtWm3KwCCU0+tmeAUknARCMiYH5zT+PzSahRAQBF
         sfEA==
X-Forwarded-Encrypted: i=1; AJvYcCVI3I06Gllv1jF6mAdAQLMPS6g/y7CXfP9Sxtwiic/g3xHA1bZQp9t1ncGXlqCa92tMTw8XSpumiJB3mUKD@vger.kernel.org
X-Gm-Message-State: AOJu0YyV6tqannpSVwGM0Z3JL7FfKdwbXqLhor+QJWWcJ8l9PWPtPBM/
	H/IGqpPr/RvAO/lyOdBvqW0Z40kSShql0L1XR9etWTfTEo1fR/bzM0dalMx6SxDC2QYfcjULd8f
	T8es/OF+UWZTHYyYuiRXGgRh5gS+Ws1NgiEK7bDDwxjM3uXMHimxfkgQgknCe6Tsf6eCC
X-Gm-Gg: AZuq6aJgAqTLWGbEQG2t3WxuAPsGPt3Hgpav5LZRM6tZf8TMadV3ukl4mCqXjPZKbtO
	XasnlJChg7U9lod4QKhDc8Pnyyfs3WXdPjuREx0TZ6CKkzGbph+o+y9DRp76DLJa6R8NsFnYod/
	S+R1bvJPMJXCcny49VuIIm0dF4Ugx2byo6+QffMpCgTFIU0KIQLsHQyO1DeYgpGrF85fxCV67Uw
	K5KAYLF1Snp/H0rqBjHvy/PV6kAIGspREIF5FtfNqL3eNBzUPBpPDudFuCJXTkjNBZDZdtkz99a
	gpZjgWTQa404G3kYqgtcLOvjpDDp7EJuETQi7XNFC3M5uNaXDq1wIO1mLlnb4HhW+KXtVMIIWM+
	8yCROZYJoIrN+Lcl4uF0Gm7pWaOrfPP/Gy3cWodbAJWzeb+WkEoo9r6vfBRN510Ve52aZpVNUhg
	PXhbpD
X-Received: by 2002:a05:6a00:a907:b0:81f:3c7c:8591 with SMTP id d2e1a72fcca58-8241c645c19mr5011467b3a.50.1770282429908;
        Thu, 05 Feb 2026 01:07:09 -0800 (PST)
X-Received: by 2002:a05:6a00:a907:b0:81f:3c7c:8591 with SMTP id d2e1a72fcca58-8241c645c19mr5011450b3a.50.1770282429436;
        Thu, 05 Feb 2026 01:07:09 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1c08e8sm5361366b3a.22.2026.02.05.01.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 01:07:09 -0800 (PST)
Message-ID: <fac9526e-a184-4c4d-9d29-b37400bf47fe@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 17:07:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Bjorn Andersson <andersson@kernel.org>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
 <2026011621-fang-moneywise-d6b2@gregkh>
 <2255b500-f4fd-4d7a-a5d9-5b4fb55c78b2@oss.qualcomm.com>
 <2026020245-catalog-outburst-f805@gregkh>
 <592129fa-cd8e-44b5-a18c-1fb6c6ed102b@oss.qualcomm.com>
 <gjmq3xbu567ymkj5lc5u44pbehbn5spyshqj3wgi434q2ing75@lztciattj5pv>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srini@kernel.org,
        amahesh@qti.qualcomm.com, arnd@arndb.de, linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <gjmq3xbu567ymkj5lc5u44pbehbn5spyshqj3wgi434q2ing75@lztciattj5pv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cRv1bP9Vms13ToLIlFE7kPhz_hkxfVIL
X-Proofpoint-ORIG-GUID: cRv1bP9Vms13ToLIlFE7kPhz_hkxfVIL
X-Authority-Analysis: v=2.4 cv=eLkeTXp1 c=1 sm=1 tr=0 ts=69845dbe cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uBvRbRIBWN_UjP92ZHQA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NSBTYWx0ZWRfXypGCf3iAfFT7
 I3gNf2mRWNB537QvkHaDAxFs14i9YWxi0t+LOU0XkGC6gw7cH4T43SwLJEPjThgKr//KRwdHXlQ
 57ikX43R4TyOJOJOGB4EjdFE1TM3MydZS2NT64g7oTLuoOhSU3Od1rGUNSEu5DU1TfdcSOwd42S
 flseodEL6ypX0uIka3rEZ6C0c+qPf6t/6IgucLA84tgDMuPewsoKjMk+nOre4UXpomP7z4cCSE/
 CkgUtv/Xek7u697quxRjLrzSrVWF2D58L4mNAtdWYGS4xbhAxm6FCZHyb8VWErf4MIK1tX2Tk8c
 BKTYtImRuCPn3a5iRH8r+MdETkCfHvZCiHcfRZ2KxkzMO0PQf5YHiG14cOw+L6BsG8id17VrE06
 LL1ZFh1Iz3jcRIh/Y+AOPeV5vzFxaqb9tl1C/Bh8B9EtGS0dtYA5o9uiWNmn3bR8d+wvil3freC
 hP8xetnVmilEdtbfuew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91882-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 992DFF09B5
X-Rspamd-Action: no action



On 2/4/2026 5:32 AM, Bjorn Andersson wrote:
> On Tue, Feb 03, 2026 at 08:08:16PM +0800, Jianping wrote:
>>
>>
>> On 2/2/2026 4:41 PM, Greg KH wrote:
>>> On Mon, Feb 02, 2026 at 03:13:10PM +0800, Jianping wrote:
>>>>
>>>>
>>>> On 1/16/2026 10:49 PM, Greg KH wrote:
>>>>> On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
>>>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>>>>
>>>>>> The fastrpc_buf_free function currently does not handle the case where
>>>>>> the input buffer pointer (buf) is NULL. This can lead to a null pointer
>>>>>> dereference, causing a crash or undefined behavior when the function
>>>>>> attempts to access members of the buf structure. Add a NULL check to
>>>>>> ensure safe handling of NULL pointers and prevent potential crashes.
>>>>>
>>>>> What caller passes in NULL here?  I did a quick look, and see where the
>>>>> callers check this properly if it could be NULL, otherwise it all looks
>>>>> sane to me.  What in-kernel user is causing a crash here?  Why not fix
>>>>> the caller up instead?
>>>>>
>>>>> thanks,
>>>>>
>>>>> greg k-h
>>>>
>>>> It's a saftety coding: to eliminate NULL checks on the caller side, as we do
>>>> in a lot of other kernel API.
>>>
>>> But you do not do that for all functions in the kernel, otherwise the
>>> kernel would be full of checks that are never hit at all.
>> To clarify the intention: this change was not triggered by any real crash in
>> current callers. The motivation came from the v1 review discussion [1],
>> where it was suggested that a NULL check in fastrpc_buf_free() would allow
>> simplifying some of the caller paths.
>>
>> [1] https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/
>>>
>>>> And it was pointed out in the v1 patch discussion that this change was
>>>> needed:
>>>> https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/
>>>
>>> Were the checks removed from the caller side like was asked for?
>>
>> Currently, I have placed the check inside the API and removed all the checks
>> outside the API.
>>
>>>
>>> Also, your changelog makes it sound like this is a real bugfix for
>>> something, when it is not at all, which is what I object to the most.
>>> Don't make scary changelogs for things that are not actually happening.
>>
>> You are correct. I will modify the commit text that caused the
>> misunderstanding.
>>
> 
> You should then also drop Cc: stable and Fixes:, as this is no longer a
> bug fix. And make sure you don't put actual bug fixes after this one in
> the series (i.e. it probably shouldn't be patch 1/4).
> 
> Regards,
> Bjorn

Thank Bjorn for the reminder, I will adjust the order of my patch.

> 
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>>


