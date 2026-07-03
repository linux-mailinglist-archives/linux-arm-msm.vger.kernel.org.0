Return-Path: <linux-arm-msm+bounces-116176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2+TwKpdWR2rfWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 08:28:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B101D6FF146
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 08:28:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U9Nv5EcC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jilDnSic;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116176-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116176-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9A5830060A3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 06:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC793803E9;
	Fri,  3 Jul 2026 06:28:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAD937D10C
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 06:28:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783060114; cv=none; b=Lc3EERdi8QfVctzuux1Fka2PtfRBnOfSj/WNLOHiHjb8+kBfis6b3t4QLtgkMXhb82sGevx5kAaKwIyqBzo5p5WIZN+CaOWd/BykAgs/dkDur7xtfhFy/zRkr756oMIWDdKGxno3jccdeEA17XBj166Dx9RMvTEw5JEC14JlCq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783060114; c=relaxed/simple;
	bh=F+0F4H3vY/LaE7NZ65CzhaqwQqmsI4EWEocRmfjYnkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=f2k+vkbM+ZG5O0uO7q1czeZE6cIznWtiN6lvT9r70CEwKYfGR/vh+v8EQPHkvKsDIMeuwdvc0eiKcPW/fv5yGt/uAAP8jVC0cwvwD/iEhtwBJUs/quqaHNAzjm+ZwcOdrWIVwz8QNx9NexelqGok4Nsj+QY3dOWKaddOlcEaSVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9Nv5EcC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jilDnSic; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66368IuK3054318
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 06:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9DM8Go2RjnzqwoByfIyzL3ou20U9NAg7EwEKzgleYs=; b=U9Nv5EcChCcpZbE1
	lg+uK36ii2OVRC65b8XbcHe3hj7aN/Qh8/SR+ojhdmY/E0AjQuP+B9jgrYKg0MSN
	J2wOfwdjOIBZ5yDhhOdlpNqdiE+bM+cRD8H+3zqYIbcmjCdzVICKMb4nQpqVb/Ig
	dQdJnk4tDeRAj8ZmUySBJefO8tjJ6RRDiQdRJRDaDXBDTUYl1ixVGPdfT5ROIG4m
	j2Q2yQButRpPXMehYwVdmPrlPn7wd++hBBrKxDgKVpEBW/pD6TJ2/LmVFsD+d+C+
	nyqT1M126wgHKsJJDjcoBWh+e/c2Ycu5Y294erft1YpnnMck9pgAEN4F3kTljWMq
	ZUbfcg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j002hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 06:28:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7f385887bso4340115ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 23:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783060112; x=1783664912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9DM8Go2RjnzqwoByfIyzL3ou20U9NAg7EwEKzgleYs=;
        b=jilDnSiclwUpjkPPhenunThevyzk4PvLb/bH/wiqxL1jNzXpMvAu1Ww3YBjHoMGXH5
         79a784w0kTubSQkOLEz3ztUvOUVPxUM6ybdIWO34bsjNYdBKhsfraXIW1C4giBt/qWk9
         gTNKhGZA5pnZHCijLuHZFYZkNYX9lo4yP/huraMWAwLRt4J9NhA2FpQCjLyhDaT/QdYC
         c70To/bP3Ol4yfhQRmaGGDx1pHxJ3s4tzj3BoaK2wyq5JbaWIEqPyxm0ez6IO2BMKOgI
         EbPyazC7BXKYLf9wmS87s9bIrTp1WSWQVhTR5uUFaIPSAw0uiqjCQWH51lhLWWA/owq5
         8s3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783060112; x=1783664912;
        h=content-transfer-encoding:content-type:in-reply-to:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9DM8Go2RjnzqwoByfIyzL3ou20U9NAg7EwEKzgleYs=;
        b=BXd2TzD8bfvDOBRUlXNNfhkgJblvD3rRPUhZ99NcagU0ty1hw3lHTD6Jb2cUFZzu3Z
         Fj6aoDz4QPvvWCAgxa6+qFC7wVOhqdTrfSU03gxkTFKVC2eW1XYS377jmYxxsr88Ep65
         DQoVrqrPSzZO+G/ITU/by9kXNuJi9kzGUfFV58bRLm3TqXEEgXz9ldmTo8O8DaZOlJUV
         Mbp6M7MSmlMNtdlbm3NXZhIh83EbDbCF7uYs5kkmAQp696SaRNksJ/nGzk1HKFvmQ4KG
         za+NdOZOPSw/CTslrCWBAsSz8UMcPhmJGu/W7ekWTy+gAu/1AMhElCGokY/f0LAlaLt8
         LWNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5U/N1YZN/eGNd1ZfhVMMEKyWBx61uo2UNKpDcOQS+fRKcbAgudPShZrYK8VDWJpt5EZnVOqBjd3z+f/p6@vger.kernel.org
X-Gm-Message-State: AOJu0YzGmjzwgNeTWh1h7jjf6pCGHHDI5U62tKt1Dv8UPtSTWwL0mra8
	odW4YL+HUbYcyeOCA/PvUBqf37EEjjf8QxfffmtF4ENjbCcLB+FW3ssfg1TvVIpUCjnXd/HA2lT
	5WbmmYW8VTCAw6X998LDMy3NfL3XMnShheGD84/ijfLAo3jBZNg9r+vj/V06HlxkEo9sCojaYMG
	sc
X-Gm-Gg: AfdE7cna3CSCTXHx9OxWd+PRnKgfyVtjiE7EzAJP9UC/pnWcHpRgVIHAciEyRZMKVQC
	POYyPpmbU3JoTxeHm5T4a0c517Eekt5w/v+sTeGyx5GufdQLWo4SzNoR1YIqWlG4KBYrsXo0kTK
	SSbbWB1EzbU+DEPY+gFxDLl9qsL9ne+jYWQDcpTnCfr6baO8EXxCnWka3ooPJqIepqw27dqW0q3
	BwYnhkKs05Hi674vnjDTsLm7PvK8VZPlfUfv2wRckDJtRSgi0k9obJhZ/Ju7hVJ0VChvLFwQOik
	KHo9bBXIgbLxqaRM7ohfStsJZreZSsI9XrIv5qlk/YSyclGBRUV9kFU88x3MkPvacsNxoWxsc7/
	iIpF4ba4ReqHmhhCPJlWlhrdZ4JkmTMm7GwGgB7R1c6QSyvL0xFFfCW5+53/q9VCELsyclXP79y
	QozLR+pQ==
X-Received: by 2002:a17:902:d2ce:b0:2ca:ce91:f027 with SMTP id d9443c01a7336-2cace91f1eamr28805965ad.36.1783060112160;
        Thu, 02 Jul 2026 23:28:32 -0700 (PDT)
X-Received: by 2002:a17:902:d2ce:b0:2ca:ce91:f027 with SMTP id d9443c01a7336-2cace91f1eamr28805545ad.36.1783060111658;
        Thu, 02 Jul 2026 23:28:31 -0700 (PDT)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260c7sm4483705ad.12.2026.07.02.23.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 23:28:31 -0700 (PDT)
Message-ID: <630c7fe6-bcc6-475e-9738-2d90d63eb050@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:28:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: avoid duplicate DMA mappings in
 fastrpc_create_maps()
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, amahesh@qti.qualcomm.com
References: <20260625080832.17477-1-jianping.li@oss.qualcomm.com>
 <b907b6bd-ea6e-46fa-9546-b8b62e12bded@oss.qualcomm.com>
Content-Language: en-US
From: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: arnd@arndb.de, Greg KH <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        quic_lxu5@quicinc.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <b907b6bd-ea6e-46fa-9546-b8b62e12bded@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0svuUjjfbPCA_v-YEUF84z5umbZctB0s
X-Proofpoint-ORIG-GUID: 0svuUjjfbPCA_v-YEUF84z5umbZctB0s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA1OCBTYWx0ZWRfX0gbuPWl6WXMz
 RfQ7c1LiiY6t9N+/whv+F1b3fpuhu/M22V4cOMr1Ga5uDhCdsdlIUyzFKx57eCLsMttnl64sfpG
 3b7zuV6ES6Iq8TEnKsA+qJyQVxY/ioQ=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a475690 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_y4YfpV96PzIBbQw7ZEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA1OCBTYWx0ZWRfX5wdyX0eG/hnk
 OKn1bmuWY2HeUm1kKov86cpO14j94lm26MClAnHTvYy1Qu/DCLQP/BIlz5jMZd9bP2I9z6gpdEK
 o0x+AvBIPN2VUupxgGmxMG3sghuBGOAIKb5GdTYpNhjPUafK3xdchjgKFlOdcmAKLYe8sJ1kD02
 pWdGVdg5ya98M0R/bCXG5iscqz/2g6nbOlH+KMMKmYT2AcrLbmKW6Hfgpn1CMBfofegw84MJpXb
 W3xCDnZGvt3HCwAKfXS76chg78PRQfz3AFdPxue3EG8wiAuRcdOXEDepQl67/ktUD0FPfZDTyW9
 OnFt3OqdmtzHah4SBYXcM/YZhGS7PobARwoLjZhlblKVZfpvCCbTe8W/tlcZdECZpRTf/BBKz2p
 JDmrvdAbqZ4V+8gD9iea2UntfMvTd7RrCDifpk/0AhV2zgkn01ddoRcJcb62SR5I7iBWyMoFRBE
 1BwpfHNY+oUogkkgRtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-116176-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_lxu5@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B101D6FF146


On 7/3/2026 1:16 PM, Ekansh Gupta wrote:
> On 25-06-2026 13:38, Jianping Li wrote:
>> fastrpc_create_maps() performs map lookup only for buffer
>> arguments (i < ctx->nbufs) via fastrpc_map_create(). For
>> arguments beyond this range, no lookup is performed, which
>> can result in duplicate DMA mappings for the same file
>> descriptor.
>>
>> Additionally, if the same file descriptor is passed multiple
>> times within a single invocation, performing lookups with
>> reference counting would increment the reference multiple
>> times, while fastrpc_put_args() would release it only once,
>> leading to an imbalanced reference count.
>>
>> Fix this by allowing fastrpc_map_create() to control whether
>> the lookup should take a reference. For arguments beyond
>> ctx->nbufs, the lookup is performed without taking a
>> reference, ensuring that existing mappings are reused
>> without introducing duplicate DMA mappings or reference
>> count imbalance.
>>
>> Fixes: 10df039834f84 ("misc: fastrpc: Skip reference for DMA handles")
>> Cc: stable@kernel.org
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 22 +++++++++++-----------
>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index a9b2ae44c06f..2622a1360a65 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -924,9 +924,9 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>>   }
>>   
>>   static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>> -			      u64 len, u32 attr, struct fastrpc_map **ppmap)
>> +			      u64 len, u32 attr, struct fastrpc_map **ppmap, bool take_ref)
>>   {
>> -	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
>> +	if (!fastrpc_map_lookup(fl, fd, ppmap, take_ref))
>>   		return 0;
>>   
>>   	return fastrpc_map_attach(fl, fd, len, attr, ppmap);
>> @@ -999,23 +999,23 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
>>   	int i, err;
>>   
>>   	for (i = 0; i < ctx->nscalars; ++i) {
>> +		bool take_ref = true;
> bool take_ref = i < ctx->nbufs, also add a comment stating why reference
> should be skipped for DMA handles.>

Thanks for the review.

That's a good point. I'll initialize the variable as:

     bool take_ref = i < ctx->nbufs;

and add a comment explaining that DMA handle arguments can reuse an
existing mapping and should not take an additional reference, otherwise
multiple references may be acquired for the same fd while only a single
release is performed during cleanup.

>>   		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
>>   		    ctx->args[i].length == 0)
>>   			continue;
>>   
>> -		if (i < ctx->nbufs)
>> -			err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
>> -				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
>> -		else
>> -			err = fastrpc_map_attach(ctx->fl, ctx->args[i].fd,
>> -				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
>> +		if (i >= ctx->nbufs)
>> +			take_ref = false;
>> +
>> +		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd, ctx->args[i].length,
>> +			 ctx->args[i].attr, &ctx->maps[i], take_ref);
>>   		if (err) {
>>   			dev_err(dev, "Error Creating map %d\n", err);
>>   			return -EINVAL;
>>   		}
>> -
>>   	}
>> +
>>   	return 0;
>>   }
>>   
>> @@ -1508,7 +1508,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>   	fl->pd = USER_PD;
>>   
>>   	if (init.filelen && init.filefd) {
>> -		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map);
>> +		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map, true);
>>   		if (err)
>>   			goto err;
>>   	}
>> @@ -2100,7 +2100,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>>   		return -EFAULT;
>>   
>>   	/* create SMMU mapping */
>> -	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map);
>> +	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map, true);
>>   	if (err) {
>>   		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>>   		return err;

