Return-Path: <linux-arm-msm+bounces-114360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id voaOEsLoO2rYfAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:25:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D51C56BF157
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:25:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S7do+JOE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GhhXnoDs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114360-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114360-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5AF4B304F18D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C53F274B3B;
	Wed, 24 Jun 2026 14:24:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A43C13F5
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:24:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311063; cv=none; b=ehS4U8FA+MLjNh6aOeyGfBv0iCroLABZ8j9oiFiLo9vfaLpexqgIZiojryHkj0KdIlaAMkAKxJG754RXdO7/1g0Q+xCbqvfOD+bDJauWpJMQqSWoSBsQkqDj1WbK1kSJn9+OaCj+RTTprFTloqWU1kj4ja0Yk76JSAj8fTSZVgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311063; c=relaxed/simple;
	bh=sUH4mhOJLeZVGxgqP/fn1DEaZud1uq+TQEi69PSdzQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ie9o3TprK3tLK87UUvkQEGLQ1C5qbwTUKWf8SzfQPuvcYOp46DMkgtM470wzbQJNPmQG2MPl+itB3sFJoZF2bW7WvgOpCgQICSv5h5lGhpt9moFa5Q7HNaV2+vfuJlMMki94A7X+8ZXz9eRpp7Ih4PX2uTffb/bRq0A9hmR/y8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7do+JOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhhXnoDs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANT7G3069766
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lhyvRm9Lp1QnYYnxI2wzA4jksOyMuuNxgM0BM8s+1VA=; b=S7do+JOEZtLF251v
	kZ8G7PLpc/Jl0VwEErglZbMtl83QtidpQZ3YkR63hScXqeAsGCcVZZOYN7j8UiJP
	Xyf3Hi628woSSAnLCc1aFfpAfSiKTBGWsN+3s8AZ2zG6RF64j0KGa/nDM+f6s9eE
	6NYWD4jHtoK98HFwUA/stx7gEK96fLh9biXI/I8zgstSQ+WwwxyqJIXOe0zRoaJu
	zCXAWshwu0OjpjjZrBK+ICJ7GQp9xl6+GL8rf5stDGKVygwhoWt8Q7lEX9wfmtQe
	TNMFyCtqDMN/cvIXAL+Mxg0HTX7cvJG13tW7m+b47pf4KvMran3+EvgC/Qko8k/8
	8ijxog==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g0ys5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:24:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso1459821b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782311058; x=1782915858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhyvRm9Lp1QnYYnxI2wzA4jksOyMuuNxgM0BM8s+1VA=;
        b=GhhXnoDs61wWbUkdBEEJ6PwavlRDebFms1KetHckHbGrGrDnKsyK+EqD0VSSilxjmz
         BB1we9SJOCVw2Sya4okuTkx4BU6lFrjGoqoYhHLUHcoIh4T6bzlcx3hmpUEh51JH0SLs
         Qk9d3zgYG+MQO66d5tA55zRhBJTGSlfE9d8KRAoTCIfTSRyD0ClkuG5L/S9e9/V7O5ll
         67werX9yckKfNIFq0+FYDnO16gEo8NoJAoyWbBam//DeYCAQXSLX82Fx5jsU0JMhd9Ta
         XoDJWN6tmxRSxyfevKnN+fmKkTmcEHx7p1nBOCJ6NafLp7PBKcXCA0R76m1FDK7cHF84
         29OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311058; x=1782915858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhyvRm9Lp1QnYYnxI2wzA4jksOyMuuNxgM0BM8s+1VA=;
        b=ktwaIYfoKrf7FMvLeklGUFo+PRx3G+8VfPxJW1RVLJwBGnvbbSra7IasQzkSvt4kmU
         3s42wOzqE3y8QHzGr9ZxKfjwBumTNB0R5BHyOKiChAbyN9ITxYv6mDJUnGMmcqBWZQFp
         uCk6uICvgiycNKxDCCev97HvC9UM/enSufa3VI/VuMk9cOK9mZrtePD+iDo+LjMAN9mv
         nL7vrtRZEBDH3kpYfva4X8eSCs9EftLkjySSIMZv3y8lo5hJx2ebG1gIf5x/u7EymV31
         Ixhh7seFRyvdk4+dabwN3isNcOrxlU4ckNpUAS96gNf4nAjxpImCDA3G2UlyaJ1aduG7
         wBIw==
X-Forwarded-Encrypted: i=1; AFNElJ+Lfh0Vu8lf87w9Ks/0jSfiYMVrs5hsY4eZU694UNlkI7ccylxCZbKZ1gzzf2ITGpAK7dvlp63yTmXwMKVj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8AaZ+MMuBCpJuhpxS3bWrzm+vuvnMgVYAE9rTPAduv0uhBWfk
	APNsFTZ+D2Hw/kzuFU3/g+j7ZwnqQDrW+dQDXZcfRbFaAJuZVlYlL3ommvFGwHTJcsvyEWllq//
	ewHqli9aY5HGKXv1PjO6is3Fo9/aPG2Ub6xSymZM5uypyu1+HmrR90euHmLUPlLx/AE7O
X-Gm-Gg: AfdE7cm7qscv6fM4FGQEBiaD8Ty/nmsANIAzdAUkUm7o5DJbkWW9AfJkt1ylHamtwjL
	L+JtrUAJy4UMtXf0phscNkSzdzoWeMMCDoPceWYhUzwNkJeA0iUiWwmylUuaBCnxUSn5IFvpmA2
	Y9NSkZD6NecJebcO4Gwa8rMdBI3HiQ27fvCh+DffTgLXhSxCQdOy5k0B3dD8F2CGHjQZJrXIPya
	ta9me9lw2/xPXOa0hj75iJXwe53m8uFOc/6WwNSWajbXcm5IUcQOgmUCqU2ufxm91p/5YaWAfks
	i12FtcuZHZPPiCERysCyp+zbAKDt9CcBoJjwdqs1lQjeu1kBoHV2iPO8MOoBccMXpGVcOhrfXwJ
	nzhNzyrQ7nidJ06SG2NqnpC/bxW6tF4h7zMZS04HMUzKX
X-Received: by 2002:a05:6a00:12e0:b0:845:3c47:9159 with SMTP id d2e1a72fcca58-845a2cca4a9mr4360607b3a.45.1782311057764;
        Wed, 24 Jun 2026 07:24:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:12e0:b0:845:3c47:9159 with SMTP id d2e1a72fcca58-845a2cca4a9mr4360575b3a.45.1782311057370;
        Wed, 24 Jun 2026 07:24:17 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23d7sm2464066b3a.30.2026.06.24.07.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 07:24:16 -0700 (PDT)
Message-ID: <bf048b4e-e6a2-407d-82d7-05fd360f8276@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 19:54:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/16] media: venus: skip QCM2290 if Iris driver is
 enabled
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-15-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-15-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3be892 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jQEFaFJIMzOOsnW5sskA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: w_YxCL6qfF_7bWQgiAHwojrwNBincfEP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfX7E23t+BkynaM
 w1eSGswenF/GV2/IxdUxw84yQsgdiiveOJbu0hz0hsdwDrTz9ymjL90ibi6AKG7O1TCzRCqksuz
 5D7GGDNNceCGiHoEPXvaAK6soIseUg8MLU5blHZDZjjfnH9X9ulI5KG3sNdjBnWyYTPW8zQqd6W
 /9t/hmUvSxr2CLDpohGMxBpu839WMTfzDdc9sU9LhVvS9rsUAPQGFqbb+poe1Mp21Ll6qbBZLBr
 C0sWVXtioaTGEz3Y41KOlNKA7IRDJxNNXHpw3PaoTlc/SXllRmMFAAA7oX14rBhMDSKxNQJ1Sxo
 WkNSDU59ggQrSk5MmD9pDJwmkNsTv+hQK9qfOOXgGV994W18LWUVZJTHROL2H22Xb/y3KITw2M5
 wtkh9IbnH9sPB4P2oWuC6lbxLHhs8g==
X-Proofpoint-GUID: w_YxCL6qfF_7bWQgiAHwojrwNBincfEP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfX4miDD12jBre0
 7WXylqsv/snZ1VWWII+CPEaA1ROZk0lIlsdDX/nV+y6cGaGFGWxneHRw1MCZ3HzUbKYOit8Ju2d
 QFWslgarlgJNyUHDNoj90h6s+CrJ6k4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114360-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D51C56BF157


On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> As the Iris driver now supports the QCM2290 hardware too, there is a
> race between Venus and Iris drivers on binding to the corresponding
> device. Follow the approach used by other platforms and skip QCM2290 in
> the Venus driver if Iris is enabled.
> 
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

