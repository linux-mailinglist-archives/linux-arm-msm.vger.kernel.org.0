Return-Path: <linux-arm-msm+bounces-117537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hYrRDc7+TWp6BQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:39:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B97722B89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:39:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="kRY6/ELA";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hAL58MNT;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117537-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117537-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6692B306A626
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 07:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7FE3F8706;
	Wed,  8 Jul 2026 07:36:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887463E9C05
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 07:35:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496162; cv=none; b=d7FhDRJBC7RukaMOgaGAmGzOJ8w760LkTbp87EyVG29dWGXyuoCOoL7zzA7FHJXKzyh6Hw4KGXLGYyZnR4zS0H4/kBU5xGyxCpygNKDhu/aRceMAGtjsZRgeDa43A50F05g8cf3eMMV6AD6XQ8UXhDmkute0IjTBN+FCZe8qw7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496162; c=relaxed/simple;
	bh=y0Cz+SxrOco+zFU9iy4Vm0qFLXihJyME9v+cI8jh0hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUAcn5JPUXjcLvCR6pDG0Jrb61LMEEgo7ZjfnO1HX3mq4LKpxTVFZRAIwKV5xNseOiv0+L7qbNIEeN/OX4DisG1mAc09Gm/9kNOof00+1uPq0XZfUcPQIn6qtSek2mpz5qZfZEP0gDDSsDzV8Gf1ae4ngD4Okm32oun6BWPFzt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kRY6/ELA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hAL58MNT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6686qbZG2026522
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 07:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qwiky552pR9eMSaRRVwfUr/gVpyg1XLXJ6fZAH0mOHM=; b=kRY6/ELA1dLyHeYa
	UrdOVrMPpKwcl7qbnrpjad0f0ZYnlS6l2lR3VL9G6c9pd5g8RF2yrTTUdX4551v6
	bT9rXGBas6vB8mFnjO07ROegRrOrVxhYalFZPEq2BbSCHMgIvvIuRRO8NBLPTAEH
	TODzreIcCXJupZo+DdOMpXy2+MKgUUpK8kcWevQN6CpXuZ6ZQxxHzg85x9BynmKz
	4SlAyQAHZUdldheC4StgJbjPcaICZdRXhOH/2eGo4rHYFxOrdTXyt2Nie+JgwCL6
	Rml++x1khp5CAKWL9XzUH4sezLrIupvn3KNqX+y/UuRRabk21pCjBaaGtVK5QYsn
	JufrPA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv05qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:35:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-846f50381a6so435856b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 00:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783496146; x=1784100946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qwiky552pR9eMSaRRVwfUr/gVpyg1XLXJ6fZAH0mOHM=;
        b=hAL58MNT8vJSb+kwgmDmh/QrJNPbYxr0sKSQQlB7ZS6GpUOl7ERQxCoWQVwTepNor7
         0+epfpS/VJoiCoTpS2VhVlNoAcGrwvciciN/oHpm7oV/loSLhVNBIjuz9XjfbgSA3lW3
         VgvaeQD/ZJmVUG4SW+DER59KIPZa3u4XWNPXzchSc4BjrvnTKoyGx7eTPthap4shC0Np
         Vx5oEthqJw/ePPjnaiP4xAdsVsk48KspUC5mVTpXuQ7nyeI2U5RfnfnPGaaZgfrUeGHD
         SRcWr5ceENB2o8Kt4/CeDulkMahc10zAECTT2FMex4Kw7BJyIoj6gltbRVT4i8sJjxsE
         TGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783496146; x=1784100946;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qwiky552pR9eMSaRRVwfUr/gVpyg1XLXJ6fZAH0mOHM=;
        b=g393jS/2AiGJUwvp6bSTYpOTsG2GrRljmELOSFPOZIaX0LwDFszdxGbpZ3KatiDqv6
         EfHWA8U88PVTzsN9/LD7huexZtq2OukfQgscT8Y5abbK0hxiTrXZsxm/wqGdMQXG4ctm
         6O0KoxrnVCCOp14TsJKd9A1+VMAHNqPvHQMtpstWgJ2Pj6Ay9+FR/fPoGK5F0Uz0yhGB
         s1Bv8B0y83fXqahoVrUXS6zHHVRMK3DUt4yhW76zhgnMstYkC3rWWjT7OP4SzB9Vz5hg
         8TQDLJbTzTIU61cmewdqoK3+ownkQEOH1oR376zvEj1Q2swy1frbfSGAo7p5osXmkC2S
         nK/A==
X-Gm-Message-State: AOJu0YzhVQuPPeRMlZpYAtIzyuKXv9XNH/r2n2IYeR4vGNexnC6ZbX1y
	9jmNPlE/Xv9S+r0YLZa/LTDxBB5dKjpizRbMfcCyEHLNm2Q5UFy2c4DCGxqYSU1EIY6kp0uhm1g
	HlK/zwpyOslhhRDxn9nRa2/omvHhoGITV4GhavrqpH6CDuCWkhTdKe8MCZsDsz2qXd/TG
X-Gm-Gg: AfdE7ckceT/5ngNpJhKXmrAiuENFCEwX/BTqTjhOGq6EBVacTnIxfLUYTGWUUs5LfeG
	Vz/NTiVkNjhDcNeGhqlPkiYhgqaM26uH7ZFk+4EdkYjXrnrTxBFSPwO77w3cPzSNfrvaRLBC7wV
	DXkJiMF91aHuY3MeRI8xC3ZcPk8r/jQOUltXiXMXbQ028hR2XRp1v/PyfocQ4ol4uLKH3dt93fP
	ImzRLCCcrIhyzckSKV8QxuJOBCXXx7dVNm35YmjZBJbVDV7pZ1+O9h9/klXuH5LDZk/J1k3lmh/
	Tu5JG5HAZ8vuSsDZkYmCe8SLvJzZPpDjcABOtQwweAIY+IDfbhraLPSOhBW/j2i77dyr7eEPxE5
	BrYFTRW2rdnr9ggWw1QiFr0BlLa5vn/1XDO/OGE7XnprN
X-Received: by 2002:a05:6a00:4405:b0:847:7f7a:dd18 with SMTP id d2e1a72fcca58-84842fe8cf0mr1626493b3a.3.1783496145887;
        Wed, 08 Jul 2026 00:35:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4405:b0:847:7f7a:dd18 with SMTP id d2e1a72fcca58-84842fe8cf0mr1626467b3a.3.1783496145378;
        Wed, 08 Jul 2026 00:35:45 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bcf03bsm6588179b3a.26.2026.07.08.00.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:35:44 -0700 (PDT)
Message-ID: <6167cdea-50d0-4319-9f4d-1f1b349600df@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 13:05:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] i2c: qcom-geni: use dedicated completions for abort
 and reset events
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
References: <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-0-dd8f841f36a2@oss.qualcomm.com>
 <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-2-dd8f841f36a2@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-2-dd8f841f36a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4dfdd2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=f0852AcSgLQ1KUP9AosA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA3MSBTYWx0ZWRfX9/JRacdp96dO
 VGcQ1yK5rlzSUI8g9FuLuAlpPEDmlXAYXFnOibR3RCQlK6weQyXPQg2jfE2l8kYCPgN1xeMtapj
 U7OCbIUUjn6XySwdyiOtgFX5mQ92Jbg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA3MSBTYWx0ZWRfX/icz435LAoL8
 t7TFzN06IYRGA5G9oL4oqE6SQ96KZ89s7o/mFOiJy6rNVuE3dXlopxCmqf5IXHSqs43+hxHE2JC
 xxjcaKno3PBOH8cGMKCaK1FO18I+rxbZG0swg/unKpO5vtws2mchmp+R/qq+ZbfJ6hvwxgnVXGR
 4cbwjI9ghmWgoo/qhv98EJnWProTsBm3CeT2egATphgFeXqjiJqilLOsGinmLl6OYe/j1Y3tR1v
 MxBPR5GdzCN0ck3OU+7bWm6Nk/SLCsb+2Bj3590kUoEbEy3DEfYqzyJRyCaai1nDYPASLBPTSje
 CydFVUhHgp7BJJ6Y37P6w0H/PFHm5+NjgR3f/nTp1kY4OhskOGNCCDHLKIxV1Ks8HbFLBMURzB1
 DBLj++V9x/pqJe6NLneNPL54IIOVGSjmEMU9zeS2IiT6DxWUnifiNXTJg/+yBwttvMznO9CHukO
 JcCXnUyuy74GTjaOxQA==
X-Proofpoint-ORIG-GUID: Zvr5t6sj7VvwmQmyffu35j0U3nLGJKp7
X-Proofpoint-GUID: Zvr5t6sj7VvwmQmyffu35j0U3nLGJKp7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117537-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97B97722B89



On 7/8/2026 11:45 AM, Praveen Talari wrote:
> The driver uses the shared gi2c->done completion for transfer, abort,
shared => common completion event for transfer, abort and DMA reset
> and DMA reset operations. This allows unrelated completion events to
> prematurely wake abort and reset waiters, leading to incorrect
> synchronization.
Aren't they in sequence i.e. one after another ?
> 
> Introduce dedicated completions for abort, TX reset, and RX reset
> operations, and signal them only from their respective interrupt
> events. This removes the dependency on shared completion state and
> eliminates the abort_done flag-based synchronization.
> 
> Co-developed-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 54 +++++++++++++++++++-------------------
>   1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 15403edb355a..9490aee4928c 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -113,7 +113,10 @@ struct geni_i2c_dev {
>   	int err;
>   	struct i2c_adapter adap;
>   	struct completion done;
> +	struct completion abort_done;
>   	struct completion cancel_done;
> +	struct completion tx_reset_done;
> +	struct completion rx_reset_done;
tx or rx, any one would be running. Not both right ?
if so, i suggest to keep common dma_reset_done.
>   	struct i2c_msg *cur;
>   	int cur_wr;
>   	int cur_rd;
> @@ -127,7 +130,6 @@ struct geni_i2c_dev {
[..]


