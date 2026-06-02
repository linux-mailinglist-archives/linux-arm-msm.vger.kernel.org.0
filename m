Return-Path: <linux-arm-msm+bounces-110794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIDULIilHmq3IwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:42:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E0C62BC06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8538F30B4472
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3FF3624BC;
	Tue,  2 Jun 2026 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tg7X755a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QJIJlAbD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99E12248A8
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392361; cv=none; b=MI6cSB2ClCpinI4EbXfh7p36//WoxZkn8nTN++W6s0EjPIntC9lvMqEAYuJP0KKfNuJDWgNxeGWZZ/mgOfUqa3dTiasDfLsELcCnHJoi5Kp4BnN+fIS6jxpwMD9SMS2w4BNeHSMh/UiTWFJCE4/qs2nBZV2xNme/fo61m09JSlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392361; c=relaxed/simple;
	bh=qDW99IRpbYsSvH/nyeCYi9fxRt4ee++rjqOaFEH7YnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U60fN/wPuaGF4oMTXcROs1Vz4+dvAdiyGoqwnpRBBShbsbix5LIPYUJ/Nkf0i79ujyOL7h6FKICZLRqYMjJQdKF3WLUr68Y+FOaQoSNIH4O/ibZp3zKneMHlBtYci+Ck6M0hgIgq/nvmZoNvAPLQfBQiS8Z1nhgQpwU6ZKbaPDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tg7X755a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QJIJlAbD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6527qPHn3132955
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a8oJhdM++qj84ExHpZEpnmVT1OSBcuhJ/dmbIOPi8AQ=; b=Tg7X755a+MFhnxIj
	ycrbD1uopXjdg1XWGUp0ARgDcMf3AGQ3DlgNZTI5jqISdvvfzHrYjiZNz3rRYavz
	E+MisLZkI4tzsG7Cey74sI+cPRs04maFEPx+90S6qvLKm5XWXtx7mDvDc09NPKQR
	eSQOsmD+GbPvWk9pzuB1uSXNRTao4u69wJ4Tquo+1zChc3dWCn4gU5OyiA7jqwSS
	z+1PEBPoTl0ZuQZ7EvXJwxdFPGjOsHscTSzAkfY3zJknDG7EBKNCs9RHT4CLWtFf
	bWSIW7LaiJWcr5IfX+ZKjC/K1nxQVET/kGMQajHsCiMr2Is+EjE/LXaVug/+PuNk
	mhAd9g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu5wrd3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:25:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d979441eeso2187299a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780392358; x=1780997158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a8oJhdM++qj84ExHpZEpnmVT1OSBcuhJ/dmbIOPi8AQ=;
        b=QJIJlAbDEyDrtQJrWHe3TFLTRpgqHxVPYa5gcTAvmwQ7rmpARaWFSHdcP2qSuaYB3z
         U/lQVTt8m0dJPTW9qsHObekcRQF9dScJsg1+Loh02gP9zefTZIcu6Z9RwxQa6oA0nMVY
         5jc2ZTVdAI3+xuNN+EvbhyV6kOkVW0aAJehkcldTTk8xJEZKnOXkZ8sxrONAPm65yt+D
         q17zPbaA9827u8qBuSDFH0blFSZetXyHcuqzXrBNETwWLDuSOU8iePTn8dXXt9drce/j
         EiW7xjHSWI7bdpXPW/Z2SlLdJKdzlcB5bwkEDiKq1pa+q6UfZjncl6/5LiMLnA8hJNqO
         pOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392358; x=1780997158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8oJhdM++qj84ExHpZEpnmVT1OSBcuhJ/dmbIOPi8AQ=;
        b=PJzHGOUyOK68j0h4YciIeGfuxR9wZMBidU8+Kg1KeP0AnkuxqC/bVie6jj8blWg1t6
         5C+StO54HoLWwRBI93whuzR2v/eMPeoYom82rdDwU8eGd0ixsq2XYaFi7NA2Apet6ncx
         BlZGXCnbgfBB9ZwrTA4EYhK0HIQWnkKZV2CGbCJHHhfsQ/wF19o9fJe53dli9ePMX7TX
         UpzVtwWxF7byzbVzGY1ElIOEkzYojqlU0AHOUnYfVKb6zFO/4AGYXaJQQjm43Zm3wrwm
         RpjSxb8XwzWBvEQoKfnA8zJqQUuS5RxTcV4XT9jT5oe8OET+/Vlp54Mf7KDRvBBz7Kig
         YTwA==
X-Gm-Message-State: AOJu0YwlVhtAIw20PrLSwnhQQ95vSONjbyF2CWMCSpXirvy1Pfm9IISv
	KpKTfC3pDS1P7+wXJbphLtCs56EoYCwpPD50TQH7/1Wocy4/vsgC2xHHUbXbr613HOV433dA8ax
	yOkGejOC9u3iqU6fiihK7d+u6MOhD6/pSqefgbLEdyZExsjSeZ73ATrCfR7H9PvnprXbn
X-Gm-Gg: Acq92OFe22fNQR6+5Ocx/WTF6Nxx03Jf3uCLssw4FJXSsZjRR4cyFrU+128T9pRDXXA
	W8KvXoI5By/uBqHf+5NTLq8ZbpknkqAdwUUG9SitLMYV1U/2RCdXpd03iAyA8Ree/3kzKDduTfk
	FvcJuc8BS0AhvGNSrd8OFdRazw0/p12as0cWTBePD+LQ8tF4YhyWGLv4z9cijmXnDM3ho/jijED
	WHNUZaUEsp1vqCzoDoHUi14pbA0tFwltfS6lBNREnFOGCU9GRGMggBP+nhHxmoY/G8x4grugy10
	PPhhSM8S1+uCM+7Y5dHD8puxfjx802QrGjrvfj7N7ZkuXeBZ1PkFIhinpDCNHE6zHkhCDvM5mFO
	W7st322GjfFZjNue5+2Je4qyMtzK1IpxpUJjrzVpY5le2i1VW7EAn
X-Received: by 2002:a17:90b:2889:b0:36d:bbe0:de7c with SMTP id 98e67ed59e1d1-36dbbe0e324mr6879175a91.12.1780392357843;
        Tue, 02 Jun 2026 02:25:57 -0700 (PDT)
X-Received: by 2002:a17:90b:2889:b0:36d:bbe0:de7c with SMTP id 98e67ed59e1d1-36dbbe0e324mr6879145a91.12.1780392357348;
        Tue, 02 Jun 2026 02:25:57 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91f1affsm2165015a91.11.2026.06.02.02.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 02:25:56 -0700 (PDT)
Message-ID: <7e5299fd-85f9-4f74-9e69-5192aca81f05@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 17:25:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] misc: fastrpc: Fail Audio PD init when reserved
 memory is missing
To: Jianping Li <jianping.li@oss.qualcomm.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
        abelvesa@kernel.org, jorge.ramirez@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com, stable@kernel.org
References: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
 <20260602071750.526-4-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260602071750.526-4-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WwUllffpbDXFCa8Ggegj6rsQArW1HASu
X-Proofpoint-ORIG-GUID: WwUllffpbDXFCa8Ggegj6rsQArW1HASu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NyBTYWx0ZWRfX6a4+5UGah6DF
 fbcXROpf7MOzZBAzVVI3xNRFu7Udn3GotboVDTBu7U3pYA3SZu/A6ZGIkotJKPhSUqTwoh3FGTr
 9+LWlKvF3c8SggNORnAE1lVBZkyGdpQAmLiw/ZUmxO9xhb8qBoDwjs85ZzAu9Lg9VXMiG+t49sO
 qHnli3uv9ARMDJj18kiazxeEb46gLON/dGlhy7J1R6nYvFkGs1Af/6gHStJJ/GAY9rLuQx/+2cN
 ii1Jjn4iZ0nS2W2Raq86xkL+SWNqGMdxrplyadV8zgUgi7g7SR93SQb3WWjCJHLBeJ/Y3h3Jgjj
 vdfFbqqOTIIM2YNipIo21If8Q1TEeO7jzgaEEPoHgrmf01CPSJ2BLfaTTdp1Gw18tNCwVUT0kwv
 X1nfiFaxakNu8/TtMXzUzEYkhsGfg2aF4MluLuPsWxObNs8ILVxIfx6UzBziua8FFlLUJb3B3u8
 QPYFfle1i3OpXpZDLAQ==
X-Authority-Analysis: v=2.4 cv=M/R97Sws c=1 sm=1 tr=0 ts=6a1ea1a6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NWGsHJKA5YHOe65YnXUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020087
X-Rspamd-Queue-Id: 17E0C62BC06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110794-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 6/2/2026 3:17 PM, Jianping Li wrote:
> Audio PD static process creation assumes that a reserved-memory
> region is defined in DT and exposed via cctx->remote_heap.
> 
> If reserved-memory is missing or incomplete, the driver may pass
> invalid address/size information to the DSP, leading to undefined
> behavior or crashes.
> 
> Add explicit validation for remote_heap presence and size before
> sending the memory to DSP, and fail early if the configuration is
> invalid.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>   drivers/misc/fastrpc.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a8a58f889d07..f46a8f53970d 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1354,6 +1354,13 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>   	} inbuf;
>   	u32 sc;
>   
> +	if (!fl->cctx->remote_heap ||
> +	    !fl->cctx->remote_heap->dma_addr ||
> +	    !fl->cctx->remote_heap->size) {
> +		err = -ENOMEM;
> +		dev_dbg(fl->sctx->dev, "remote heap memory region is not added\n");

should be an error instead of dbg info.

Thanks,
Jie

> +		return err;
> +	}
>   	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>   	if (!args)
>   		return -ENOMEM;


