Return-Path: <linux-arm-msm+bounces-102909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKKxKGez3GkDVgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:12:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C283E9A55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1225308990B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164293AE6E4;
	Mon, 13 Apr 2026 09:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CITUBAp0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KzMxCi6k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DE83ACA73
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071036; cv=none; b=SND0f/ghx2Rrf2pslbS2FO/EVFwdmnyJEd6z9ZoINQvCLxtfs0WFNzZL7a4gD9vMAHdHOJyU6sP25swNY48KqFpBN4dpo/xi1QKoiL0JIZW6Ty7O3Vjep55Cixzb1EcqMqu7GN+E5ztWxIpKEqP2riN0n6t6IwH+6F13c2cjBVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071036; c=relaxed/simple;
	bh=pu0zxYCD9c6IOKjGd9j3cvN6srX6Z/ndXxXt6zTBxM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTAUDX/3+gLtp10nOVtNDq8Ti9hQOYls6KNmVlF6Ub0bDUCOTzREpCA/ZZ0RdYXoTK1jOIyKYY+2mCgFcXKgHjszUCkg9RgKhG83lHkpnUD9rTC26mFTOERc02WLrwaM1U5NHE6j0ifTrgFZjHMFx+GSqByoiwMKE5IT7qtRKGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CITUBAp0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KzMxCi6k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7GhSW458656
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AYk10NAAdnCzljkbvIxpKLk40WOmplCWnYXCUOb45Dw=; b=CITUBAp09eWPDKy/
	FersKbI5gUwI4631ASffKdJlmjf0hn1b9wlx36aLpYzLbMkyDjHga4IS+3thwzj1
	xHx4e0UziD6fZWrGlmf5Unn7O7vWoIH4auZ5Wikikf2W/e+hjkDAQh34WwgfHffT
	grsmhwCUnYE7Eh6gpdYc36AHyEQdARnc2w6FSpn/e1RJV64GBNCjiLtJv0g6Gqqu
	dlJ5gWUxdl8UwY2Tj3d8xNQ4KxA8HDl9tAg8MTHD6IBEJmnblLPoqEhAbS3IinYX
	H6J2aYFFLP8MPay84OnD7D1JywKhL9o7pV8TuwPhFW62RTBNl4MB0uewoN+iopLF
	+6t2fQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew04k6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:03:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24a00d12cso42450755ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 02:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071033; x=1776675833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYk10NAAdnCzljkbvIxpKLk40WOmplCWnYXCUOb45Dw=;
        b=KzMxCi6kXR1gr6qyOMaFwEQG19i7CBJJzLEVqFAgEuv2ejOBbbrV4Q54f72UUWuXV3
         Ih3vsgo2UcCT3hdc72E0vupSpYc0pcJWc+9Cn+LMKKfKF5h/ufcMb1SHTrSwwC27WUhN
         KUxwaRTrNpBvk91sBqHvbGB/JH5+Rp8uP+xcjMr+OqjbsCzbTo+8clErYEu9j5jJ5Aai
         0NxH2BNVwzEWnqmUtt+vMpN6qd5dk88lFuqmH+IuYuDn+rdabzTqS6+vf5jkj9evYedW
         ZJU3DhG3359EF3VtDII2ToBH1vYJ2EB37dod1EOt/pN5T0knSZyu7PI1kQdeXCME0+gn
         0VJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071033; x=1776675833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYk10NAAdnCzljkbvIxpKLk40WOmplCWnYXCUOb45Dw=;
        b=cuC/Een+xstkXL4jDffmtGyCuF9EP+NXIxRiYUntGVh7ITAPT91/xUstl1+Z+MOEZv
         5b/+MBYtO+EqkhrXvO8y++/e4iQHKC2cHtrVNz4tHg5p6C9B2CKkzCAzEJsokg83wqi8
         ondfoZbk8HM1b/8mUYnUYsa2YgquT9ftNziuCvC9L8GfoiyyddiCvfzGCWVTI8WYDvk4
         /TXCfnK0PPbIheDaEk2n+fX1ZFMznOuD4ZjGuHn1a+j8SmYYVHT7o2cTXVKFV5rOhb2u
         NQIBVeFijaaDUpdafLH4/e30qLLz6tIXREfuWJ3qXTPmP24uCIJWMx/BRZRNgqP54s2u
         hDXA==
X-Forwarded-Encrypted: i=1; AFNElJ9Fv6opHWbjRGAElllurv/DRkcNNPoUepqXuq+JhElxH5pnTdRrS9nA2AG6fjWoQBEkzLX1X68e9KeJhmMv@vger.kernel.org
X-Gm-Message-State: AOJu0YySt4r2c39NKs1tSE6HMDXB5KO718zS045dFpKdSPb7vKdERcO7
	56ABjL3pXH7ltSUdA6hJNPRISnAQDqPasuiRd+4ZgTqVvcnch2qVsR7u+CMxwWq5pQaNJB/CmVf
	UBn4TyChufkkr0pCJFwPDPXJJfepD86RzpBz5Ici8j9OKQrUNqBjb019Gs+veTICIRKxy
X-Gm-Gg: AeBDiesTKFIfIas4CIbtDN/MxJ0tZJqjKrsNitqLEGxoZkn2MOPHnMdMxW4QSrqKl/2
	YnDb0lN94LM81815teouQxyGngGOxGOtaT1BIJaxPzVeqhfoLK9BukVdMLoOE/WGRZMXYDp/AsB
	frCUxS+T8HUsrUqq6gkfkVIZpRlk6KDgABBQR/L65AMlV2gwpo0Txir5AARJAYYqEgwAqfxlJqD
	L2N0mcEsh3GdSfIajy9NNkJxy79fD6d2sqismhBx867FNLtZKl+yVYuDI8MZT0f5x8KqHTq5nI3
	acgtCx5JtDZ/m6YhwDgtLcz1/x08zEvPt/4Lxe0A53bvjKfhbg+1MOjbE2zITOq8Nn93q/v5DOQ
	QMhue3499AUPi99k/l2s/tHYX9J+W4dk+ACZZvYjJeceqeO0HBW5SWtw=
X-Received: by 2002:a17:903:1b66:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2b2d5a18e13mr122849075ad.22.1776071032707;
        Mon, 13 Apr 2026 02:03:52 -0700 (PDT)
X-Received: by 2002:a17:903:1b66:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2b2d5a18e13mr122848585ad.22.1776071032011;
        Mon, 13 Apr 2026 02:03:52 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm109169895ad.3.2026.04.13.02.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:03:51 -0700 (PDT)
Message-ID: <31afe536-a963-4dc8-b2ab-96ed7ebb1531@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:33:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-3-47ad79308762@oss.qualcomm.com>
 <7aeeed43-b458-4c68-98b0-e857f1ed791d@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <7aeeed43-b458-4c68-98b0-e857f1ed791d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX7sedcXY8fSiM
 2XqB5XjWpJtPPb3R4yWgI4qDi/0SJlrWBiZLUyt5mLslruPZiCjvxWNuIL2twx4vf/cG+KSPfzH
 jMS2DCg9VdJMWMzjQFXm6rxH8l9L1t8e0EuSQhjsEq8UHF9u+gUkZSqxawFm92ozFataTf4iJLC
 uZmMo8DrrAAwF8GvHV31sIDHick/groNzYpSwNIIVZ/qNNBPnxvMsMFKpIn+U44mhoRxLp4RoO8
 987DPXZwMBp2RAxJQmO5b+nNZPdmkpntcFVu9JQaE+Bt4y+372gZCpiBGZOb3guJ1X4aFTfWLbp
 9o2ur+byeI34WZ3KVLE5ka/9Z0/Ffob3MNY0hNyMjmXN/8NcA/vF6BMjxhDVxhTVrQfEPBx5mJV
 AaTeeetdt8V5+PKEfGv9tFrRUuZbJNAXTsYKyAeaHwT5G+PeMYTMkJiKvR6Z14mmY8kBjVsFslz
 mVoK5dljPjt8nxo3kpw==
X-Proofpoint-GUID: Zx4MxPIWHE7fuNDf466mCH6Q8ax7clvd
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69dcb179 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nb3vwdu8Oqwsy-ELd6cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Zx4MxPIWHE7fuNDf466mCH6Q8ax7clvd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102909-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01C283E9A55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/10/2026 1:53 AM, Jeff Hugo wrote:
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> Some Qualcomm devices expose the Sahara protocol on a generic SAHARA MHI
>> channel rather than a QAIC specific channel name. As a result, the 
>> sahara
>
> "Sahara"

ACK. I will correct in next version.
>
>> driver does not currently bind to such devices and never probes.
>>
>> Extend the MHI device ID match table to also match the SAHARA channel
>> name. This allows the Sahara protocol driver to bind to devices that
>> expose the protocol directly on a standard sahara MHI channel.
>
> "Sahara"

ACK. I will correct in next version.
>
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c 
>> b/drivers/bus/mhi/sahara/sahara.c
>> index 
>> 8ff7b6425ac5423ef8f32117151dca10397686a8..e3499977e7c6b53bc624a8eb00d0636f2ea63307 
>> 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -911,8 +911,10 @@ static void sahara_mhi_dl_xfer_cb(struct 
>> mhi_device *mhi_dev, struct mhi_result
>>     static const struct mhi_device_id sahara_mhi_match_table[] = {
>>       { .chan = "QAIC_SAHARA", },
>> +    { .chan = "SAHARA"},
>
> This doesn't work and breaks bisect. At this point Sahara will bind to 
> QDU100, ath12k, or something else but not know how to drive one of 
> those devices.
>
> Just add this when you add QDU100 support, which looks to be patch 5.

ACK. I will add this in patch 5.
>
>>       {},
>>   };
>> +MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
>>     static struct mhi_driver sahara_mhi_driver = {
>>       .id_table = sahara_mhi_match_table,
>>
>

