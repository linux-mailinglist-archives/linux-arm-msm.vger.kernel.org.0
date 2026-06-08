Return-Path: <linux-arm-msm+bounces-111687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R8rvNUphJmqdVgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:29:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C62653205
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:29:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YyMHghlU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=P2RXpq36;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111687-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111687-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1642D300D6A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA8A38A72C;
	Mon,  8 Jun 2026 06:29:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D7131E842
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:29:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900165; cv=none; b=es5MPR4EfCUiv0uaZxiqWdVV8Cb+CnxO6Fm1Z5/yoVoSV3cB6gS3Cl8ZMsaw/9r5Zv+dSnUtswIH4ZkEH9/w523nFDOro7iE5P7ZEm/iCoTdD8CSjv6E89ekAYpH9IYz2MYONhWB0ZdVM8OHtIZz5vu/sw14UhdEpI12gUUi2m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900165; c=relaxed/simple;
	bh=VFtyKhjmbMF2L0eaDBDT+Ol3C58smT6ZZY0Q36qit6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=Cl4LGItH5ziDGpXcsTDCwaMqdAx8chG3ruvVscqHGPSExNi7oKwUFb6MY4mbtLoZz1lLaVIBpen4tT9439Zbzd2fnac3VMGqgsd9RkVqct+u5qyrakeg29Lub5skCJ3XccgpbRWzvtyRRdam0Fqt37tapOi8MMgNS9F6Qky+lnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyMHghlU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P2RXpq36; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OlBY2801823
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	esF80riE2NJ0vmPT5A+P8qHkNdHWZ6xrNpQUTG/GXy8=; b=YyMHghlUQB6i4X3I
	t2CdX9EqHomm1RojV74wx7KJVpRMi0IdJFIRis8T5jGaoDgfZ5V13tQTCeDocDFf
	Bx18eRat3LK2Tg1bE69t56Ze+hPivF/DU7Az3ibicAG1tPO+btBLtXWMzFsTuPQZ
	9Ty5tec2uT5DWrfprsj/FS4vx+dUvLaA8Fr5QhejKVN+9tk0KbwPrbkM0xVLIcMU
	4syqDRA0+EHO4hXKAjhPQRyUuqzblypBYnOi0t9h4xB2U8SO2U+9O/XalNvK4ohC
	qZWrLB34aE3jLbVlYnk/z86kxyP2BSN+chiQI8dMZDNSB5g7/9OahZus69KYxUkB
	dgedbg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3pnew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:29:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c331eda3so42704795ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780900160; x=1781504960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=esF80riE2NJ0vmPT5A+P8qHkNdHWZ6xrNpQUTG/GXy8=;
        b=P2RXpq36TpLOaOf6mOyuv4pOtp5HZhjKm613aRYvr7auseNUB4CnWyfjfeA5n3FMtS
         ag6GtOe7J1Qpug+KBiCOtrXemfaRs/3QEVUWQO7SCL18zkFn4qvvroGzXzyuwWkJiJ9y
         qUpbngVe9vA2rMq/50Q8/Tpop67tWHmc0IZjqV0cI7TJxRDJkwRIIWzfJmT63zLi4ZV7
         HbkuIhR1brHY8VunDz7TfG9HxUoRoYQuToSMDYFrYMyQd2DxlHzPA7QncyAHn5MLjGnp
         9t/qiePQLEsJ6wOK5HRF6C7gj0E+ZreEJWm13su8AEe6Asq93Qzpp3glI3gOvXcHXw9E
         rJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780900160; x=1781504960;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esF80riE2NJ0vmPT5A+P8qHkNdHWZ6xrNpQUTG/GXy8=;
        b=UGxlUMs/qN2eso6pNm29hhnAAhrU6KH0zKlBZkgMeUJFu7P1VAz7CukSEzvasYAr4B
         3M0gP6/1r/XAzfkRylhmxKmBkAemWDlu3sPl76mEhEDrNeYBpehUvqwdMoX+GDnNJyOV
         wMVBB9Ffd0PQRxsZeVliR8xIA4mhjhlhwp6vKTIt3+X+0idj7MIZZXNmhfnB+queI4nv
         VTCgAYI+4YWCVlwezSBcI/HxLVIszRkwdMJPNKRCRG77Utw4jd7NXvRD1OVFJ4cEYn+M
         Qv1hwAmdIXgmDl8gnb3wp9+2ufxqImylkQpifDj1NSrRB6necEFFKUTFD4H3+ZFjFdpq
         8Gyg==
X-Forwarded-Encrypted: i=1; AFNElJ8GgroXHdpL7I0Q2fpZl5uYKquYQ03Tlh+w66o1EEB6g/woHFD30PWfWyl1huENUHozR2vc6D4hUtmF+IQa@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk78dKFCl0Enl/AwzTxUXiWWJkpLZ9wyaMlF8bnuMVvtGPXlEc
	fh5QAECEy1GshzGERNjLT7Idvp2OXkAfwrJsRSp4g+XFtRRhkJwys4TdwlgCbXpBrZZUgMgBgIn
	rS8yF0wlCDt4UwTpBD3RWdN8qqHuDr0OIrC096rCe7p6DcPRc/CCLeYUV9pHQ45oD4Gq2
X-Gm-Gg: Acq92OHAJtVgnGzWBp/uyNjTJ5IF3MGWnoo8UuZQZd++mfLb8USmyAw5am3y3kqdonr
	aIyKt2RLf5kD9Mt0yflaXeF4CPRDVBY3JfC8cQ2i+FR4jF88Y0NIbjEODGJ8e7d6U8XzuzpCgM0
	nXH5KJ8zwamgIqZyjJ/sjat3WNRgxE6gZ47ezAmLMbD7NrcRnnoP6qPMgeU1CPoU/9sMw8WDhQs
	fLiRIsmUVwhRYtHVqkICbvsJjXSaJnURPczbTC2E/aJG83IcMGI1IdiGyAi3zHJz5m0PqBIF3b7
	3Te8pNZReM1zHCVB6EaPbLbdxXJLSfm55dkBgQPvv5nV94M13sGafgyJNEN3Lf6NzNJCvW5kGsu
	TKi4dFbxG6hbpSamTj/DdqAVwLOMRinOubRwIDGGF1S4m5B8Go9gwVLjctoo+3RHDsMYevpO8kA
	E6ca5zjDG18c4WU3i3sZaBUmPghGk=
X-Received: by 2002:a17:903:4b50:b0:2bc:b80f:6782 with SMTP id d9443c01a7336-2c1e821dd0bmr141753675ad.11.1780900160067;
        Sun, 07 Jun 2026 23:29:20 -0700 (PDT)
X-Received: by 2002:a17:903:4b50:b0:2bc:b80f:6782 with SMTP id d9443c01a7336-2c1e821dd0bmr141753315ad.11.1780900159601;
        Sun, 07 Jun 2026 23:29:19 -0700 (PDT)
Received: from [10.133.33.209] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6dc92sm157118725ad.13.2026.06.07.23.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 23:29:19 -0700 (PDT)
Message-ID: <ddeff296-abc0-4e1b-a721-761e2cbd331d@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 14:29:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] misc: fastrpc: Fail Audio PD init when reserved
 memory is missing
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
 <20260602071750.526-4-jianping.li@oss.qualcomm.com>
 <bcm2eufawifaq65i5qlqmbam4wtv2du5re6c54tiamdbynmras@lbfd44kjb6da>
Content-Language: en-US
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        Greg KH <gregkh@linuxfoundation.org>, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, quic_chennak@quicinc.com,
        stable@kernel.org
From: Jianping Li <jianping.li@oss.qualcomm.com>
In-Reply-To: <bcm2eufawifaq65i5qlqmbam4wtv2du5re6c54tiamdbynmras@lbfd44kjb6da>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1NiBTYWx0ZWRfX30HHEKGm+ZZ3
 9vaT/2h31/rMxHob6gh3bgFX+T2QcJ2kNErwdphIYKvDk00C+dGyxPQh43+hPTm+DM6+jHwuFpL
 CJJryE53Z9/WbjLdO8sNuvOozEegCxTlfWltcUsG4BIyAk2ol5S9JsXmJygCgQRjXJr5NF2QzwY
 GA7efDzAxL9Wu6BVdFF8PSwtw0exhoVGTj+8VzFcMQfuywxLTDd7s6Wb6uBJPrN3qY2b0IsDyug
 7fNT8UT0Njtr1dDyDYPmDRwyOpmOksc+3WU4tVosA2sO4XZKTFOaTwds4807yPX7FyfluKclG7g
 5XODFmBTPnhC02Bee9zfr4WGTANrKUH0XnVzRSxFzQEkfu56G3vO5BM4AZVLfXqwbzMPLmTk964
 5Flw796r5pjO1445i2jUwEOf6qAXdEWymcXdAw0pKUvnzLjenq2aPEwKQl9pk6Ru9cZRr1zWTHy
 bExxRl5aU0fwWvfy8ig==
X-Proofpoint-ORIG-GUID: 4MVA0cVTiRXL4wAlRI-QcFjY11HzPP0v
X-Proofpoint-GUID: 4MVA0cVTiRXL4wAlRI-QcFjY11HzPP0v
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a266141 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=np7A-RzQJBVldtc5gtwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111687-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35C62653205


On 6/8/2026 2:11 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 02, 2026 at 03:17:48PM +0800, Jianping Li wrote:
>> Audio PD static process creation assumes that a reserved-memory
>> region is defined in DT and exposed via cctx->remote_heap.
>>
>> If reserved-memory is missing or incomplete, the driver may pass
>> invalid address/size information to the DSP, leading to undefined
>> behavior or crashes.
>>
>> Add explicit validation for remote_heap presence and size before
>> sending the memory to DSP, and fail early if the configuration is
>> invalid.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index a8a58f889d07..f46a8f53970d 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1354,6 +1354,13 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	} inbuf;
>>   	u32 sc;
>>   
>> +	if (!fl->cctx->remote_heap ||
>> +	    !fl->cctx->remote_heap->dma_addr ||
>> +	    !fl->cctx->remote_heap->size) {
>> +		err = -ENOMEM;
>> +		dev_dbg(fl->sctx->dev, "remote heap memory region is not added\n");
>> +		return err;
>> +	}
> Won't this check without the next commit break the kernel? I don't see
> where else the remote heap is being allocated.

Yes, this check depends on remote_heap being populated during rpmsg
probe from the reserved-memory region, introduced in a subsequent
patch in this series.

If there is no dependency on the next series, the remote_heap allocation here after the if check.
The logic will be wrong.

>
>>   	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>>   	if (!args)
>>   		return -ENOMEM;
>> -- 
>> 2.43.0
>>

