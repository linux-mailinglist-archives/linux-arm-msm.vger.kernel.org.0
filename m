Return-Path: <linux-arm-msm+bounces-92906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LN5EyvekmlvzQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:06:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2DD141D70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF5B5300514B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B3927FB3E;
	Mon, 16 Feb 2026 09:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+xWgW9Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jVIULnVT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8B2273D6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232809; cv=none; b=E6TzHmzjg5Bx6ENUeuAkISqV41RXvja+SipyhTWUdlLUBZtlBtpb1BxaVqwAAkFRy5pc2gTVjJhezb4RmM11Xu6G9kZEXHgSaFTDhC9zyw4rQ/zlx4O5MbfGoXKB4aj1NkmW0pCg0BIBHh7jzG2e49CEEe3+sSIDv47GTB6vUzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232809; c=relaxed/simple;
	bh=hxG/9kxltup/dUg4tmKTgGbP4BdV/OyuLat/GkKPBb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GDGIZ8LzC+qTpTuk1a72oo7ChpSOGhUJNiwQ/7zUhKeaUJiaIPzqcovmv+hYHakpxU4bkL86KHrJhKoGP+19DUL8HEZW9atEvZ3IXfiXY1WOpDy86imDZ7ZmAMMDQHI03xMc9tmvb4yX8nZthsPm2M/x5fl0ixeKyG0P4Zj/VAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+xWgW9Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jVIULnVT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G0f8i13123820
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ncOEr4LjIDnkgJnPdSH1BdY8t7MmWAuf4FRK/4l1GVU=; b=o+xWgW9Ye0gPmquC
	gTnZVt5EfKkiTXq9Y6KEzLVtMAoYEO9TtoccDq3JJ+GCDapZ/hquTU9YgYcEjiq/
	BrnNnzYxOzgib2A9wPugr7Crrz+63YyJUZ4GIVLocbpnTZYDOlwJc8KMXZMBIcHi
	SnUEm/+EeqxIfJY8ORqWHgQysFPUVrC0VFzO3NElFEcLLYwXABTV6+xIVRantZ6M
	AHawBbl0wPKqeADj8uwTOxUnd8FngL8krjOodg9JoaNL7LNzIP31BM172h/aPsiu
	qGSJxdUQIwbyWmIup9aRyN4wu+X331dc1iSKV6KHcWZv3gsmPBLrlJ9chEmC/coC
	pG8IDQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahtckvhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:06:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35626b11c51so2347145a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 01:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771232806; x=1771837606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ncOEr4LjIDnkgJnPdSH1BdY8t7MmWAuf4FRK/4l1GVU=;
        b=jVIULnVTuUtbddS6ulsDUnw9yMYCLDKF2fdwGRpWGJmVIXS3qFsGq/bEt1Yz7W8EbK
         qpaqFuOvwZPs+9NmM/Ty1v456Do1GCtld17zIuWW88ZZsyuZQU5UHRJlcVuX1H7+7eR4
         mxJ055Cl9d4oddtJahRjwtRfnEcHjlMgNvrflATq2nXmSnxNYrNjOeQvbKwnDbS/HAnq
         X6pm6kmZOHbm0rcZGTA7AmEhSZ93qITo3xNGAYxrfPlTE2lAhDSfEeX01wDuQU7yeQsv
         U9/5udc7E7A4f8p4xv5ODsYZPwEe+zBeOMdPSP+IX17Xw/47XK9gek7XFCDoLvjKFZ7q
         InmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232806; x=1771837606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ncOEr4LjIDnkgJnPdSH1BdY8t7MmWAuf4FRK/4l1GVU=;
        b=CRTO9G+Lltuv5IjhTPZBS1C0hMS/MGM8pTdG+mmHyx0B48B3vFTptSO0wUrGzc6QOZ
         QM95H7jGnYBvAXgkuG/jxydG07N+/l9I7k9GjNf2hVQq+++2LOtZHClqcOtrZdRGvEEB
         HQfNIOwAhmpmcWkZ7nMiw6JOroqEG1H2NMpURbad2vm5K/GUtWCIDUvD6jGL9eoOom6F
         EwQZpg/YarnVTe87HAhHfdPt0uwZ4A+2ku2cyAVhpDBJskoaebGiQq9ajA54qVit+AGJ
         qNFYxibs4ZGBouZR8rjtZeVTtodUiGRoFHvQN/7Ygu8oSSHvGNLKXEqyXjgzd2joIN0C
         /53w==
X-Forwarded-Encrypted: i=1; AJvYcCVFDcoYrrylscHxoSvaST4sFLN8oO5GyQm8eNsC27JzETvEQDwYYlTNC9xV139Rsglj25trfi/HfRUACzAZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwEfvMKSWSiOONHrTRvW8uFxxirtXuHZgTPsMR3nvvK+PkrZzoq
	n40YAYAkIoEE7RDOcqxM/bpRhJaK3bChrbM6gK1JX3kyi7c+rkn8iZIn8pA1LJ+W/lWegquHzqb
	C8z5rdnUA/qKwaJlD+t1fMiR/95VHsCgXkl6hODvPyrpFCx0DROhseWLWZrUi6glGsb82
X-Gm-Gg: AZuq6aLcXFYJsBtmMvl7fgFAfn6VKehtEMCBMa9UjgEa9shv+5g/Ta8T9YHI+PKf8X0
	qkRDBCHmPfmkYcUYP2Tgc80HI6zJ6f9TMKPawihEwkdqJJC/zazeUxMZEBZRGWcBHyFclnSOdt+
	qw7JHZTQ//412ncG/mX4iVu+nOLzrRgisD8IkgCwuUjbeFKNkGQyMirr+eZHFOcmkQqEpuCSQB+
	l7wkD25vUOExiXD9B3mzDCUDM2eQ0ZP6NwCOgx6BXNtnQontejv/1wDSeaivjP1CtkDryKUMPmY
	+mKEQ9MAxUTOphA4fY94AcKt2+6Zlxe/0rqclCyAEOsQKXnOhFHRAPxhuLT8yd1KImVAjcFnJXF
	6Xg2YU2K9YY/WdYXxwGvLsjMnULjXwoRS7Fj24idK3b28K9Ly5Q==
X-Received: by 2002:a05:6a21:7318:b0:37e:8eab:c05f with SMTP id adf61e73a8af0-3946c957d3fmr9105121637.59.1771232805982;
        Mon, 16 Feb 2026 01:06:45 -0800 (PST)
X-Received: by 2002:a05:6a21:7318:b0:37e:8eab:c05f with SMTP id adf61e73a8af0-3946c957d3fmr9105092637.59.1771232805343;
        Mon, 16 Feb 2026 01:06:45 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fe2e75sm6302513a12.10.2026.02.16.01.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 01:06:44 -0800 (PST)
Message-ID: <1707a83d-d717-43b7-b450-90f8400a65fb@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 14:36:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Bjorn Andersson <andersson@kernel.org>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
 <20260215182136.3995111-5-ekansh.gupta@oss.qualcomm.com>
 <wipphezpxtuuxtwhpwamsmvhwgwuesexmy5ev5pcqb65vov5kz@vuzzyyqnu7ci>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <wipphezpxtuuxtwhpwamsmvhwgwuesexmy5ev5pcqb65vov5kz@vuzzyyqnu7ci>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NiBTYWx0ZWRfXwR7L8TdMAKFj
 A0B4PpuP9qU3YDD9eOubgKhvw5GcXDMjP6hcRVGRAZBmIiUuNSvO9V+KoqjTQQAGSHbprh+1qXH
 ZtwMP5zkTLsRRcLKkpUhtrs+pdoGce7jKzIMFiKHz8MSZ2ByGGaHrkwpjpWkgW08A+8LufuEVlm
 xBxhf9VxMM+7HHrgNriXwr9VP9CU29WyK8q1H5NviOFCoL9ISju2iU7Utese75YE2PMM9VzlkB1
 FE0HdyObhovJ+oQdKYtQdPZmJdnYN1lnkC62MDv5ZBr8/5f6hShjJQwczeD4NajLtVhuaPIW8Kf
 8746ALTElvuZSJWqx9qEr9619cyYRa0O52FOaqkOoSo8ZO345Lw9MSMfv9Ycqp6BP5jzMYCpdWs
 JFGhlw49TzSa5o9tY+ayKlMp3s8cALxhAyxryU6symFM+X3IuaB5tuCvhG6H7kJqXUcoLmcac9W
 o3hZjAQZcUR9rOSXQug==
X-Proofpoint-ORIG-GUID: l0krX681KwHZNYfa4fsVO_r8IfAS5092
X-Authority-Analysis: v=2.4 cv=DJOCIiNb c=1 sm=1 tr=0 ts=6992de26 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=asaYmUnhe-R4xDKe0jQA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: l0krX681KwHZNYfa4fsVO_r8IfAS5092
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92906-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB2DD141D70
X-Rspamd-Action: no action



On 2/16/2026 8:51 AM, Bjorn Andersson wrote:
> On Sun, Feb 15, 2026 at 11:51:35PM +0530, Ekansh Gupta wrote:
>> For any remote call to DSP, after sending an invocation message,
>> fastRPC driver waits for glink response and during this time the
>> CPU can go into low power modes. This adds latency to overall fastrpc
>> call as CPU wakeup and scheduling latencies are included. Add polling
>> mode support with which fastRPC driver will poll continuously on a
>> memory after sending a message to remote subsystem which will eliminate
>> CPU wakeup and scheduling latencies and reduce fastRPC overhead. Poll
>> mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
>> request with FASTRPC_POLL_MODE request id.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c      | 142 ++++++++++++++++++++++++++++++++++--
>>  include/uapi/misc/fastrpc.h |  10 +++
>>  2 files changed, 145 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index e935ae3776b4..c1e67dbacf2c 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -23,6 +23,8 @@
>>  #include <uapi/misc/fastrpc.h>
>>  #include <linux/of_reserved_mem.h>
>>  #include <linux/bits.h>
>> +#include <linux/compiler.h>
>> +#include <linux/iopoll.h>
>>  
>>  #define ADSP_DOMAIN_ID (0)
>>  #define MDSP_DOMAIN_ID (1)
>> @@ -37,6 +39,7 @@
>>  #define FASTRPC_CTX_MAX (256)
>>  #define FASTRPC_INIT_HANDLE	1
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>> +#define FASTRPC_MAX_STATIC_HANDLE (20)
>>  #define FASTRPC_CTXID_MASK GENMASK(15, 8)
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>>  #define INIT_FILE_NAMELEN_MAX (128)
>> @@ -105,6 +108,12 @@
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
>> @@ -235,8 +244,14 @@ struct fastrpc_invoke_ctx {
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
>>  	struct kref refcount;
>>  	struct list_head node; /* list of ctxs */
>>  	struct completion work;
>> @@ -307,6 +322,8 @@ struct fastrpc_user {
>>  	int client_id;
>>  	int pd;
>>  	bool is_secure_dev;
>> +	/* Flags poll mode state */
>> +	bool poll_mode;
>>  	/* Lock for lists */
>>  	spinlock_t lock;
>>  	/* lock for allocations */
>> @@ -924,7 +941,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
>>  		sizeof(struct fastrpc_invoke_buf) +
>>  		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
>>  		sizeof(u64) * FASTRPC_MAX_FDLIST +
>> -		sizeof(u32) * FASTRPC_MAX_CRCLIST;
>> +		sizeof(u32) * FASTRPC_MAX_CRCLIST +
>> +		sizeof(u32);
>>  
>>  	return size;
>>  }
>> @@ -1020,6 +1038,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>>  	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
>> +	ctx->poll = (u32 *)((uintptr_t)ctx->fdlist + sizeof(u64) * FASTRPC_MAX_FDLIST +
>> +			     sizeof(u32) * FASTRPC_MAX_CRCLIST);
>> +
>>  	args = (uintptr_t)ctx->buf->virt + metalen;
>>  	rlen = pkt_size - metalen;
>>  	ctx->rpra = rpra;
>> @@ -1188,6 +1209,75 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
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
>> +				       (val == FASTRPC_POLL_RESPONSE) ||
>> +				       ctx->is_work_done, 1,
> Weird line wrap of the conditional, please put the val == and the
> ctx->is_work_done on the same line - it's just 90 characters.
Ack.
>
>> +				       FASTRPC_POLL_MAX_TIMEOUT_US, false, ctx);
>> +
>> +	if (!ret && val == FASTRPC_POLL_RESPONSE) {
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
> I had already written to question the lack of fallback to non-polling
> mode and how this would prohibit me from mixing expected long and short
> calls...
>
> Would certainly be nice to clarify this behavior in the commit
> message...
I'll add more details for this.
>
>> +			if (err)
>> +				ctx->is_polled = false;
>> +		} else {
>> +			err = fastrpc_wait_for_response(ctx, kernel);
>> +			if (err)
>> +				return err;
>> +		}
>> +	} while (!ctx->is_work_done);
>> +
>> +	return err;
> Isn't 0 the only value of err you can get here with?
yes, it's always going to be return 0; I'll update this.
>
>> +}
>> +
>>  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  				   u32 handle, u32 sc,
>>  				   struct fastrpc_invoke_args *args)
>> @@ -1223,16 +1313,26 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
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
>> +	if (handle > FASTRPC_MAX_STATIC_HANDLE && fl->pd == USER_PD &&
>> +	    fl->poll_mode)
> The line is 85 characters if you don't break it. You're allowed to use
> up to 100 characters if it makes the code easier to read - and it does.
Ack.
>
>> +		ctx->is_polled = true;
>> +
>> +	err = fastrpc_wait_for_completion(ctx, kernel);
>>  
> Ugly blank line between the assignment and error check...
I'll remove this.
>
>>  	if (err)
>>  		goto bail;
>>  
>> +	if (!ctx->is_work_done) {
> "err" is the return value of the wait, and this checks the outcome of
> the wait... Returning "success" and pass "failure" through a sideband
> channel is confusing.
>
> That said, as far as I can see, there are three ways
> fastrpc_wait_for_completion() can exit:
>
> 1) err = 0 && ctx->is_work_done = true after polling
> 2) err = 0 && ctx->is_work_done = true after wait
> 3) err != 0 && ctx->is_work_done is undefined after wait
>
> For #1 and #2 we won't hit either if statement here.
> For #3 we already hit above condition and went to bail.
>
> So do we ever enter here?
You're right, the check is not getting encountered due to the following reasons:
1) Poll success -> err = 0, is_work_done =true.
2) Wait success -> err = 0, is_work_done =true.
3) Poll failed -> fallback to wait.
4) Wait failed -> err check before this if condition.

I'll remove this check.
>
>> +		err = -ETIMEDOUT;
>> +		dev_dbg(fl->sctx->dev, "Invalid workdone state for handle 0x%x, sc 0x%x\n",
>> +			handle, sc);
> jfyi, you can use %#x to format 0x%x
Ack.
>
>> +		goto bail;
>> +	}
>> +
>>  	/* make sure that all memory writes by DSP are seen by CPU */
>>  	dma_rmb();
>>  	/* populate all the output buffers with results */
>> @@ -1812,6 +1912,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
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
> Would it make sense to allow the caller to affect the poll timeout using
> the other 31 bits of this value?
I was planning to bring that control[1], but it's might be difficult for the caller

[1] https://lore.kernel.org/all/20250127044239.578540-5-quic_ekangupt@quicinc.com/

//Ekansh
>
> Regards,
> Bjorn
>
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
>> @@ -2167,6 +2291,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>>  	case FASTRPC_IOCTL_MEM_UNMAP:
>>  		err = fastrpc_req_mem_unmap(fl, argp);
>>  		break;
>> +	case FASTRPC_IOCTL_SET_OPTION:
>> +		err = fastrpc_set_option(fl, argp);
>> +		break;
>>  	case FASTRPC_IOCTL_GET_DSP_INFO:
>>  		err = fastrpc_get_dsp_info(fl, argp);
>>  		break;
>> @@ -2518,6 +2645,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
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
>> +/* Set option request ID to enable poll mode */
>> +#define FASTRPC_POLL_MODE	(1)
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
>> +	__u32 value;	/* value */
>> +	__s32 reserved[6];
>> +};
>> +
>>  struct fastrpc_ioctl_capability {
>>  	__u32 unused; /* deprecated, ignored by the kernel */
>>  	__u32 attribute_id;
>> -- 
>> 2.34.1
>>
>>


