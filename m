Return-Path: <linux-arm-msm+bounces-103228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK+YOn8l32lcPQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 07:43:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE164008A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 07:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C9D9306021F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 05:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9FA37E2F9;
	Wed, 15 Apr 2026 05:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQTpZRvR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCzwJbee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F5834EF0C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 05:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776231803; cv=none; b=mn4yQF0Ve5CKtwwKiKP3V+SkqWqBR3j+NlSaXekYyK8BeY9zHtjeVvoiz9R3LlrcTkEOugFLEDBBvmRqQ3FjblYTywsspAVF+Xft3xb7zejlnTCrZIJEhYolg+lfL+9wSZQoypu0iCgKLw8Wtqa2QyFy4cA9KbOBxobWBuCfbd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776231803; c=relaxed/simple;
	bh=C6JI4BtuXS6Nc291JLVD7PKFdQwObPSWlmJKoDYWtQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a0Plnl/vZXHS3PDvqB0YrIKIn59MlCwH0ScSNSQgLvXxarlvG9re6f7cMIHAbM2nx5jWuzahYBjlUMUnAGnbxA1FuueWo5EUtwzPMnbASY3B2CeH3EbTtMrHffWNA02QL/GwcgYPNmcNe/2WAweh3sByzKV7+GQPqZTsDAW4ZVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQTpZRvR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCzwJbee; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F2YE6r1778920
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 05:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rI/VDmFKtZChyz+72XqrS31+1Ai9jjzqnhk2Yjgr/4o=; b=PQTpZRvRseAAFNOQ
	3J1Bixsbz+BBc11k5tOGql4a6BHu/OPxBgcIu4Hi3NQWjcZrES5Ban3tSSUxXQru
	tduqIhUwMBc6NiqryC9k6IlDiGISNbLaeyJI8enmL3zVUgSGiPgevngRJn/Vd1nd
	KmhhFlkgG1VVbj4zNiCI8df4aRaEIgr4HwJQWssKVkSRGxp4tCUnJYgRbxgaZRn0
	3PtT2XC/39WVhxHJrWPJ7B3lKibNILnIkkJuKQUntWaqKUktVhmA+YqU7mrLD3d0
	K5ZLnhL/cjjzviKqvePTuYWlM8yB2jw3DOakz9jDmbpSKg1W77gReGsl1WCJbtI4
	WvTuPg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw025kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 05:43:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b461b36990so30103715ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 22:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776231800; x=1776836600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rI/VDmFKtZChyz+72XqrS31+1Ai9jjzqnhk2Yjgr/4o=;
        b=NCzwJbeeyIoenfu/SXhNbHAJGIc6mvXcTt2YzA9iacKdeEsfTnI/VNyFpWYCSZ1Kjc
         DaxWP040czaZKLzG7j6QEiD28ZB/N3cpdKFXMq18MCSFjGkIs+2Tmpccb/GEIcOjHrbi
         dsyEqazCrNOx8wTfaItk1lMn91X6o3JMvlLBlJ3ZAqajpKW3eft47KFXl2qIB0J0sAi1
         MWkRbN2lZbD8J3T3GpKiJ+7bndgndOhzfCpqBwB5kxxYhvzFTy/Dn2kRtZ9/T+dNdYnd
         Go/XMjY+IIGQ/T5uotTgEoJ9w/f63qn186DZ+yAj0N074K3QEcLuCIPgH3zDR01DY4d1
         vixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776231800; x=1776836600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rI/VDmFKtZChyz+72XqrS31+1Ai9jjzqnhk2Yjgr/4o=;
        b=WXW2ZNp9vr3z4jmdX1HxqC3pRvh5/SyuRfoFmCVys+agIlGABG/9E9LElNdqYXAIlZ
         daucTmBlyrn9K/Dcq6HZvYyNbIQIH+ZG/QK3ZOxHj6L5gGQld4TQ4dN2O3wU8x3BvSfS
         vKC4H30KNSKTt/oqHxQJXGTnKbKEQWZIxpb1v9Mg90UDIiRIxFgCkYUGX2BbKCCwGfDr
         Ai1G5Oo08dmpkzrJcVTsdOfbFLDivHAqyZk+zlM8CAkShdQX1kapm4AF0u3Hgg10yIfz
         wnenHFMM/EPmdPdc/CF+Ql/YB5JwV3Eb/EKhlTZhWMXkhBpr+ShzWp5kZEYu2nJILeRu
         T67g==
X-Forwarded-Encrypted: i=1; AFNElJ8rc2EHjf1XX9FCiSwMlFgU9bZhR4RZx31JUxW3N3AREyjcR9sjRsTYud1ttji7Eo+J0thWZHivaBi9P4Kq@vger.kernel.org
X-Gm-Message-State: AOJu0YzsZiwJQw99zIKraxicSZpftAJ3nrQrvn5LYaE7WNnLAT15U4fY
	yiKmrtPJed2QsGoZxIhN5UA+5HvozYKnQjH0BCN3iYbx4pHrpxBs1eg/LC2qxO2GwZcQz+3pL5p
	cevrgA3GYnbc8lhvSR0TYQ77kYQPCZaBofpIDdhw7235ciDt/ms+YxeAZHlXmpiek23XX+ExYmt
	iH
X-Gm-Gg: AeBDievy9TdqJsau0GGf60z1me66ECkqcVm4YHk5pezQBEVivKdKzbUODmlb9IYgveX
	z0lsnXblciQOWWzeylg/4g33gRGpudgt2P5Ui4ZM2HzNyE77GHaP0pKLugHYKDOLB+9ihIciLfr
	3VhQvCmfb1e8djb1vOP6P0bNbgTV80bowg/EPNW+9xWjVRUzNZwlxDWlhXYFRDnH3xvhi+qMWX+
	uIRaijmcijWkvZy9eu1e5lwUdX2yVGrG5cnu3qdidUAViwqOxeestCMP6fHNv0fI4Qhw5d0p7Wp
	16ZVSc0dMC8wYAdj3OY/JuwWbJcJQW+UvpmrbxX+6rQ32pjdvtSj7q0Juh05WIxv74yWjxz5qlh
	jA9KXV04yI3R2avo9S5qOjRIhUM5DSTlaEw85UrOLb6LH4wlLxMQ7P/3jn76yfg==
X-Received: by 2002:a05:6a20:a122:b0:39c:787:f17a with SMTP id adf61e73a8af0-39fe3fae289mr22107228637.41.1776231799742;
        Tue, 14 Apr 2026 22:43:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:a122:b0:39c:787:f17a with SMTP id adf61e73a8af0-39fe3fae289mr22107185637.41.1776231799167;
        Tue, 14 Apr 2026 22:43:19 -0700 (PDT)
Received: from [10.204.78.192] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79581a2fc2sm630150a12.21.2026.04.14.22.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 22:43:18 -0700 (PDT)
Message-ID: <9b69ad77-9aba-4df0-95ac-d8832f7e9f9d@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:13:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konrad.dybcio@oss.qualcomm.com
References: <20260402054923.3061925-1-ekansh.gupta@oss.qualcomm.com>
 <20260402054923.3061925-5-ekansh.gupta@oss.qualcomm.com>
 <86853aa3-4af2-4670-a58e-342877e81ef9@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <86853aa3-4af2-4670-a58e-342877e81ef9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1MUODYy1sQdwig_kBClEp4Px14ES1-Kz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA1MCBTYWx0ZWRfXy6sHnjWYbEhw
 xkUDCnZCNB5gWP+yEkoUlaPsxOm3esUSdlJnkenQ2tsPgfVhO8IwkYiPuW1rzmETdUJzhDGKInn
 usVjVGwI3Tjgh5yzKRuu28bc+YP+pbYzwOAqMiiQxEDe717j4GppjJFQYXriXJuTwKAGX2vy5f4
 4o2QOhcG1h1gP1UM24ELJVS8yOmi9/T0T8+3NjWFFAOdumoLTyRk78p1NgVvtSswh7eEotestSB
 ZHKc8A9rjnHzkDJU14y0co+MeKJhIOBwdWIQ4EgnUMtKikoRAB677Xwst1Gqg8n7xhSu/aD0OnB
 fOhMeggXHz70Fl1MUEhxOPXFKrZBvgFyXVaRAt/LGwfDscNCUtswUXrx6Q44bUOtFmlIXZWy5RD
 7T0AGsm8F7x+8HDhIhikxLBQLiv72CTfgKCPhOsZSbZOIklnIsz1iLkmTFMs13mgvCWjq4kNPsU
 n5ASMX/E0xSfGVDWXUA==
X-Proofpoint-ORIG-GUID: 1MUODYy1sQdwig_kBClEp4Px14ES1-Kz
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df2578 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5DFYxTXXmBTTg87Ck3YA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150050
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103228-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5BE164008A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13-04-2026 20:20, Srinivas Kandagatla wrote:
> 
> 
> On 4/2/26 5:49 AM, Ekansh Gupta wrote:
>> For any remote call to DSP, after sending an invocation message,
>> fastRPC driver waits for glink response and during this time the
>> CPU can go into low power modes. This adds latency to overall fastrpc
>> call as CPU wakeup and scheduling latencies are included. Add polling
>> mode support with which fastRPC driver will poll continuously on a
>> memory after sending a message to remote subsystem which will eliminate
>> CPU wakeup and scheduling latencies and reduce fastRPC overhead. In case
>> poll timeout happens, the call will fallback to normal RPC mode.  Poll
>> mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
>> request with FASTRPC_POLL_MODE request id.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c      | 132 ++++++++++++++++++++++++++++++++++--
>>  include/uapi/misc/fastrpc.h |  10 +++
>>  2 files changed, 135 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 4363e0cc296b..25f385f4704d 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -24,6 +24,8 @@
>>  #include <linux/of_reserved_mem.h>
>>  #include <linux/bits.h>
>>  #include <linux/bitops.h>
>> +#include <linux/compiler.h>
>> +#include <linux/iopoll.h>
>>  
>>  #define ADSP_DOMAIN_ID (0)
>>  #define MDSP_DOMAIN_ID (1)
>> @@ -38,6 +40,7 @@
>>  #define FASTRPC_CTX_MAX (256)
>>  #define FASTRPC_INIT_HANDLE	1
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>> +#define FASTRPC_MAX_STATIC_HANDLE (20)
> Document please.
ack
> 
>>  #define FASTRPC_CTXID_MASK GENMASK(15, 8)
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>>  #define INIT_FILE_NAMELEN_MAX (128)
>> @@ -106,6 +109,12 @@
>>  
>>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>  
>> +/* Poll response number from remote processor for call completion */
>> +#define FASTRPC_POLL_RESPONSE (0xdecaf)
>> +
>> +/* Polling mode timeout limit */
>> +#define FASTRPC_POLL_MAX_TIMEOUT_US (10000)
>> +
>>  struct fastrpc_phy_page {
>>  	dma_addr_t addr;	/* dma address */
>>  	u64 size;		/* size of contiguous region */
>> @@ -236,8 +245,14 @@ struct fastrpc_invoke_ctx {
>>  	u32 sc;
>>  	u64 *fdlist;
>>  	u32 *crc;
>> +	/* Poll memory that DSP updates */
>> +	u32 *poll;
>>  	u64 ctxid;
>>  	u64 msg_sz;
>> +	/* work done status flag */
>> +	bool is_work_done;
>> +	/* process updates poll memory instead of glink response */
>> +	bool is_polled;
> This looks redundant as the user context already has this info.
this is context specific flag. Not all context for a particular process
will go in polling path, so need to identify the same after sending
message to DSP.
> 
>>  	struct kref refcount;
>>  	struct list_head node; /* list of ctxs */
>>  	struct completion work;
>> @@ -308,6 +323,8 @@ struct fastrpc_user {
>>  	int client_id;
>>  	int pd;
>>  	bool is_secure_dev;
>> +	/* Flags poll mode state */
>> +	bool poll_mode;
>>  	/* Lock for lists */
>>  	spinlock_t lock;
>>  	/* lock for allocations */
>> @@ -923,7 +940,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
>>  		sizeof(struct fastrpc_invoke_buf) +
>>  		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
>>  		sizeof(u64) * FASTRPC_MAX_FDLIST +
>> -		sizeof(u32) * FASTRPC_MAX_CRCLIST;
>> +		sizeof(u32) * FASTRPC_MAX_CRCLIST +
>> +		sizeof(u32);
>>  
>>  	return size;
>>  }
>> @@ -1019,6 +1037,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>>  	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
>> +	ctx->poll = (u32 *)((uintptr_t)ctx->fdlist + sizeof(u64) * FASTRPC_MAX_FDLIST +
>> +			     sizeof(u32) * FASTRPC_MAX_CRCLIST);
>> +
>>  	args = (uintptr_t)ctx->buf->virt + metalen;
>>  	rlen = pkt_size - metalen;
>>  	ctx->rpra = rpra;
>> @@ -1188,6 +1209,74 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>>  
>>  }
>>  
>> +static inline u32 fastrpc_poll_op(void *p)
>> +{
>> +	struct fastrpc_invoke_ctx *ctx = p;
>> +
>> +	dma_rmb();
>> +	return READ_ONCE(*ctx->poll);
>> +}
>> +
>> +static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx)
>> +{
>> +	u32 val;
>> +	int ret;
>> +
>> +	/*
>> +	 * Poll until DSP writes FASTRPC_POLL_RESPONSE into *ctx->poll
>> +	 * or until another path marks the work done.
>> +	 */
>> +	ret = read_poll_timeout_atomic(fastrpc_poll_op, val,
>> +				       (val == FASTRPC_POLL_RESPONSE) || ctx->is_work_done, 1,
>> +				       FASTRPC_POLL_MAX_TIMEOUT_US, false, ctx);
> 
> What happens if the dsp sends normal response with rpcmsg callback while
> the loop is still going on?
the condition check also carries ctx->work_done which will get set in
case DSP sends normal response, hence the polling will stop in that case.
> 
>> +
>> +	if (!ret && val == FASTRPC_POLL_RESPONSE) {
> check redundant?
could be needed in normal response case, or in case polling fails.
> 
>> +		ctx->is_work_done = true;
>> +		ctx->retval = 0;
>> +	}
>> +
>> +	if (ret == -ETIMEDOUT)
>> +		ret = -EIO;
>> +
>> +	return ret;
>> +}
>> +
>> +static inline int fastrpc_wait_for_response(struct fastrpc_invoke_ctx *ctx,
>> +					    u32 kernel)
>> +{
>> +	int err = 0;
>> +
>> +	if (kernel) {
>> +		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
>> +			err = -ETIMEDOUT;
>> +	} else {
>> +		err = wait_for_completion_interruptible(&ctx->work);
>> +	}
>> +
>> +	return err;
>> +}
>> +
>> +static int fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,
>> +				       u32 kernel)
>> +{
>> +	int err;
>> +
>> +	do {
>> +		if (ctx->is_polled) {
>> +			err = poll_for_remote_response(ctx);
>> +			/* If polling timed out, move to normal response mode */
>> +			if (err)
>> +				ctx->is_polled = false;
>> +		} else {
>> +			err = fastrpc_wait_for_response(ctx, kernel);
>> +			if (err)
>> +				return err;
>> +		}
>> +	} while (!ctx->is_work_done);
>> +
>> +	return 0;
>> +}
>> +
>>  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  				   u32 handle, u32 sc,
>>  				   struct fastrpc_invoke_args *args)
>> @@ -1223,13 +1312,14 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  	if (err)
>>  		goto bail;
>>  
>> -	if (kernel) {
>> -		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
>> -			err = -ETIMEDOUT;
>> -	} else {
>> -		err = wait_for_completion_interruptible(&ctx->work);
>> -	}
>> +	/*
>> +	 * Set message context as polled if the call is for a user PD
>> +	 * dynamic module and user has enabled poll mode.
>> +	 */
>> +	if (handle > FASTRPC_MAX_STATIC_HANDLE && fl->pd == USER_PD && fl->poll_mode)
>> +		ctx->is_polled = true;
> 
> There seems to be some level of validation here, which is not clearly
> documented anywhere, can we add this into uapi header please.
Ack. I'll add this detail when defining FASTRPC_POLL_MODE in uapi.
> 
>>  
>> +	err = fastrpc_wait_for_completion(ctx, kernel);
>>  	if (err)
>>  		goto bail;
>>  
>> @@ -1812,6 +1902,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>>  	return 0;
>>  }
>>  
>> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
>> +{
>> +	struct fastrpc_ioctl_set_option opt = {0};
>> +	int i;
>> +
>> +	if (copy_from_user(&opt, argp, sizeof(opt)))
>> +		return -EFAULT;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
>> +		if (opt.reserved[i] != 0)
>> +			return -EINVAL;
>> +	}
>> +
>> +	if (opt.req != FASTRPC_POLL_MODE)
>> +		return -EINVAL;
>> +
>> +	if (opt.value)
>> +		fl->poll_mode = true;
>> +	else
>> +		fl->poll_mode = false;
>> +
>> +	return 0;
>> +}
>> +
>>  static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>>  {
>>  	struct fastrpc_ioctl_capability cap = {0};
>> @@ -2167,6 +2281,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>>  	case FASTRPC_IOCTL_MEM_UNMAP:
>>  		err = fastrpc_req_mem_unmap(fl, argp);
>>  		break;
>> +	case FASTRPC_IOCTL_SET_OPTION:
>> +		err = fastrpc_set_option(fl, argp);
>> +		break;
>>  	case FASTRPC_IOCTL_GET_DSP_INFO:
>>  		err = fastrpc_get_dsp_info(fl, argp);
>>  		break;
>> @@ -2518,6 +2635,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>>  	}
>>  
>>  	ctx->retval = rsp->retval;
>> +	ctx->is_work_done = true;
>>  	complete(&ctx->work);
>>  
>>  	/*
>> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
>> index c6e2925f47e6..c37e24a764ae 100644
>> --- a/include/uapi/misc/fastrpc.h
>> +++ b/include/uapi/misc/fastrpc.h
>> @@ -16,6 +16,7 @@
>>  #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
>>  #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
>>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
>> +#define FASTRPC_IOCTL_SET_OPTION	_IOWR('R', 12, struct fastrpc_ioctl_set_option)
>>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
>>  
>>  /**
>> @@ -67,6 +68,9 @@ enum fastrpc_proc_attr {
>>  /* Fastrpc attribute for memory protection of buffers */
>>  #define FASTRPC_ATTR_SECUREMAP	(1)
>>  
> 
>> +/* Set option request ID to enable poll mode */
> 
> Some documentation please on this feature and which PD's can use this.
ack
> 
>> +#define FASTRPC_POLL_MODE	(1)
> 
> Can we also document the values for this request?
ack
>> +
>>  struct fastrpc_invoke_args {
>>  	__u64 ptr;
>>  	__u64 length;
>> @@ -133,6 +137,12 @@ struct fastrpc_mem_unmap {
>>  	__s32 reserved[5];
>>  };
>>  
>> +struct fastrpc_ioctl_set_option {
>> +	__u32 req;	/* request id */
> Can we expand this to proper name, request_id or something?
I'll change it to request_id.

Thanks,
Ekansh
>> +	__u32 value;	/* value */
>> +	__s32 reserved[6];
>> +};
>> +
>>  struct fastrpc_ioctl_capability {
>>  	__u32 unused; /* deprecated, ignored by the kernel */
>>  	__u32 attribute_id;
> 


