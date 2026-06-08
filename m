Return-Path: <linux-arm-msm+bounces-111695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vtB1DBllJmpRVwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:45:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2195653381
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:45:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FY1glRxY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CEhQSBri;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111695-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111695-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 187883004D1E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D8F2EBBA1;
	Mon,  8 Jun 2026 06:45:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BB73890F3
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:45:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901143; cv=none; b=fTroyvZ//vqpHzTArgZ9lcfurNGp0Mw2G9Y3UFm3o17NK4OHYeNpaMU6BcpQTmzjntBChsbs/gW/piTrdOZ4bKnBj56JQuYj/cZiBSegPesfEVE+rRmStypIsDy1pdwVkirrrG0/lR799QlGFRm8Rf9rS9WovwHLphKBrZXmXao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901143; c=relaxed/simple;
	bh=diTmMO9O3QyhwzTBPeaqe2zx1/Emk7lFPPi+nRkijjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=LWsK2FNS8vGTp2WUQclXCTKoEc5NyLxWP/pxCcNPlkG8xX+s8Xbt2L7WG75/m7ZqpU883zospbcj+o8EwlohEvDTBFu0Ob7loh0qw03rS92m1EXnZv0rCZSCA5f2RwnTWjDdwA+MWmqUk/ZyYY7qLRpb6zcLRdx0nwMc+5ruwf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FY1glRxY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CEhQSBri; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Oxs02347389
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSL8eMVgQmCH7+wdnIkRquHtCibP6jzfmw6XCEBAK3U=; b=FY1glRxYMMop3k1K
	ogZhmECBSOUHc1vA3nB8tVX1ql4aXZ1UHJYLXfcwbuISwZvi95nnNREhrjBBn2GU
	PP4iUa4D74iduphnKFj+Ux+lanriVOx44DeL1Mq8TfQFplUjPnBQCT4nkayyzs9g
	MA2tMT3BsRMBd7ByxR0jQlVaLl+UIfRus6U6n4cUdFOdiKTGiYJ1cDGGFFoqCEoy
	nznxZl2zlscf0Z7NGeBnCZBP4sB+WWLHiQpnGu9DqGHumeSJhY95LcCjWgZdeknz
	BYAYsGCgKJtzT1lV3YfpXVMOm7qj2UnO8whEqJcN6oKs1OLYDH/49N3WGODTSfkX
	g4jG1g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagremd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:45:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bc380fbf9so3878554a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901140; x=1781505940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MSL8eMVgQmCH7+wdnIkRquHtCibP6jzfmw6XCEBAK3U=;
        b=CEhQSBricuDzu/Oeg/Cfvn04UWQwXTiRkeCbgLowRVoDH3KuP9DwgoM8/odbMOfP06
         dmQ9TmByqzwcWVMmOMzFEXSzR1alCXcYicIkEF912ds4jX2Cx2vcWiQI7wSiq3pPSUc6
         6SGyN6dtLMItvcPM0WyhuZPZjxm91fNnVzQReovmwWRKVZdu5GcPKpuC7E2+0TgzL0JR
         AQxU6lmRr9IGvjjOhxHysITD71iXEoFK9C8/7V4QbRHty6yt+ROol6kGd5IecRsIbaf9
         lgyKyAde93vkpyRkRlEqrYLU/wJWL1f+n9o9J4m8gUIf7/GDJ2vJrsX5IIn3GNtTRbK0
         rZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901140; x=1781505940;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSL8eMVgQmCH7+wdnIkRquHtCibP6jzfmw6XCEBAK3U=;
        b=rNTFLrZnAxSsUHY8X16aMlCDN/mPtrCB/hyGytkmNfEBjgmO5Tw8Dk7vO4dGanADl7
         rmzmtUY8a0PTdUoVfwS2xnipLe3G+PmxATioO/aIr61reO2Bv+bsPkszaduCbayrBRhy
         kq1Bivh6tUqXyUCFXE5pFuHmSGY1VDx8wXVKdOfUdRRdbSkMNWi4qy7mCqrrTFaFT7Qv
         JlhzgVGumk4eli0Fr6MGRnA3cCzK8bKZgyqSIfrPK7UQWFQlXqkLUaK3yhx5jMHjdXjX
         uTJQGs97QFcWFWeZ1f9XWRsA6oGn3ul3h6bjxDHfokS3BOKJzyAb56JF6OBm+RjEZO/B
         9K+g==
X-Forwarded-Encrypted: i=1; AFNElJ+gI7qEpZtbZDJH6loIY7zxiRTHkADbUnWJZMBTbzfaAigjDZoNM1njLbDh2/FBpoyttDJObysRrQbhaxf/@vger.kernel.org
X-Gm-Message-State: AOJu0YxtWXe0zdFq+1j6WdDDrJ2a3qGgcFn3iqVdgAio/Xri5XTdCDje
	IXfleNfXzTUmds/Vrvue0I/J8uVoVrOu/BDtw8kK/8lNFIsiHfjjvMNa7QilStAW0gNnYNoTdJg
	J3dlH0koR1KESU3dy4MsK0UPtgW0mnveaw8nDAFpq3zgBJjX85Itfk7GiWqfdmn2+PgE/
X-Gm-Gg: Acq92OHTm2yI4f0cz3E/dxBOO/bqW2klEy0LVmuK83HpmF2WSP6i5Zd/2huV6VCo48z
	YrrOHhhUVohy1rfcudlWM7oDngHnj6ZivIi4SNzmQasdoICrtBTzIEjFUDlqkl9JWKtrWIK3s5W
	r6XHCUF/9Fwzn2uKBVqQejiqz3tn0iL7rfwJw8kEHoX+xV1CPvsnXI1k6qLr8OtypV3UiiEeMHF
	wY433sDXj7k4TyhfP1L3F8VfVW4pxAKa6VBprencAX4rzt1lMHzpliqAVADKYkjsVXowGdsNCV/
	eqYUkQPviaMLrSMfdXZ/P8mMzxJdiGWHDWVsQQg2BX+ai8/uW/QbMtBMOPdRj+rmOPIiTfRrfaN
	oXi+6gHOENdAuNIxSB6C7Fa/tTwEpdIyDapxBRmgPPHTzKndMQ/q4hk7TKZpOOziBxJcTFQT4br
	g4en4IfpY6QwlWvtCheNsz3Z7x4cY=
X-Received: by 2002:a17:90b:48ce:b0:367:b819:2214 with SMTP id 98e67ed59e1d1-370f076d7e4mr16889775a91.13.1780901140473;
        Sun, 07 Jun 2026 23:45:40 -0700 (PDT)
X-Received: by 2002:a17:90b:48ce:b0:367:b819:2214 with SMTP id 98e67ed59e1d1-370f076d7e4mr16889748a91.13.1780901140012;
        Sun, 07 Jun 2026 23:45:40 -0700 (PDT)
Received: from [10.133.33.209] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6dba8573sm18435796a91.14.2026.06.07.23.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 23:45:39 -0700 (PDT)
Message-ID: <671f75e3-888c-40ee-9365-1c41f72e008f@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 14:45:33 +0800
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
 <ddeff296-abc0-4e1b-a721-761e2cbd331d@oss.qualcomm.com>
 <mdmtc4sfeoishc64essdbrzcasd5kotbwtulk4pajjzvcy56fa@2dcpz23uuxkw>
Content-Language: en-US
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        Greg KH <gregkh@linuxfoundation.org>, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, quic_chennak@quicinc.com,
        stable@kernel.org
From: Jianping Li <jianping.li@oss.qualcomm.com>
In-Reply-To: <mdmtc4sfeoishc64essdbrzcasd5kotbwtulk4pajjzvcy56fa@2dcpz23uuxkw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MCBTYWx0ZWRfX16WtTAC9Qql+
 owXWUgxCdY0DRNLcqgK+kC5SpWwzDEiq7owAe+Ya1azXb9pxuA3Ib9qZMwdLl1w06tfLx/XXm3q
 fd5VDez6AWbzAsE5tkgyiz6jiqLp6ssMEYcRSZF6QyLugHBs936p982kM47iQXlUnPxgtSpEAlN
 xoH75CDSfYfqr6V8EcTM5jgo6IsruHYgGeZr1cDIWdVTnTczILGXvsLBGTq8cEwJUr2UGR1dgAV
 mcuu+e6+J0dIJLmXkBqszyB8wRC/oY6UmM5D+pnho60UL2f81Ujp5bz0HK7sSWXAk2BPOo8S1d/
 97FcY4MDzSfWHusUVNREK0hElaTRcNByl99Yq21Bd4072vJVrq+6U5+irXeykMENX1BlQtg8rU+
 yZ4DPlndntjMUkTeqIrnanTZ3obZIF1P+HP0uesJ1LHJVYgT7nNsCwPFQCt+uKhDqpfirjbgDr4
 3RXq7S25UIU+1W8d7uA==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a266515 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZwHI9cLKf8hZ7ncMh4sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 2wUTYnlM6WvgBzhC5UQf9WyQhfmSVM__
X-Proofpoint-GUID: 2wUTYnlM6WvgBzhC5UQf9WyQhfmSVM__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111695-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2195653381


On 6/8/2026 2:37 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 02:29:13PM +0800, Jianping Li wrote:
>> On 6/8/2026 2:11 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jun 02, 2026 at 03:17:48PM +0800, Jianping Li wrote:
>>>> Audio PD static process creation assumes that a reserved-memory
>>>> region is defined in DT and exposed via cctx->remote_heap.
>>>>
>>>> If reserved-memory is missing or incomplete, the driver may pass
>>>> invalid address/size information to the DSP, leading to undefined
>>>> behavior or crashes.
>>>>
>>>> Add explicit validation for remote_heap presence and size before
>>>> sending the memory to DSP, and fail early if the configuration is
>>>> invalid.
>>>>
>>>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>>>> Cc: stable@kernel.org
>>>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>>>> ---
>>>>    drivers/misc/fastrpc.c | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index a8a58f889d07..f46a8f53970d 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -1354,6 +1354,13 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>>>    	} inbuf;
>>>>    	u32 sc;
>>>> +	if (!fl->cctx->remote_heap ||
>>>> +	    !fl->cctx->remote_heap->dma_addr ||
>>>> +	    !fl->cctx->remote_heap->size) {
>>>> +		err = -ENOMEM;
>>>> +		dev_dbg(fl->sctx->dev, "remote heap memory region is not added\n");
>>>> +		return err;
>>>> +	}
>>> Won't this check without the next commit break the kernel? I don't see
>>> where else the remote heap is being allocated.
>> Yes, this check depends on remote_heap being populated during rpmsg
>> probe from the reserved-memory region, introduced in a subsequent
>> patch in this series.
>>
>> If there is no dependency on the next series, the remote_heap allocation here after the if check.
>> The logic will be wrong.
> So, at least you need to squash those two together.

ACK.
I'll squash those two patches together in the next revision.

>
>>>>    	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>>>>    	if (!args)
>>>>    		return -ENOMEM;
>>>> -- 
>>>> 2.43.0
>>>>

