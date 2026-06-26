Return-Path: <linux-arm-msm+bounces-114612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lrrDM/dJPmrQCgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 11:44:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8586CBCB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 11:44:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AJVYM1sO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AQCdIxH1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114612-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114612-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40AE9302164E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 09:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE163E6DFA;
	Fri, 26 Jun 2026 09:43:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDD03E00B6
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:43:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467033; cv=none; b=P2aF91UXONHuVZaCjcytRL7vZ3ojOOjThnLuudE6OX1weRM+RAPFDotAecNQPj/u5Nzz3OMQL4ltDEN0Wi+4WD74gOeWSK3+HJybYO4p2tchpkB90c2I2vNDdP17d39GWZCVukO0aC4KtLrkjwLAUU46Q0EvVBmmxGTPEiWEdUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467033; c=relaxed/simple;
	bh=Fl+FGgsJdZgdbefiY6HOupOALouXoshrGXiJQrVWStU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dAfJdv3QyfI9zTG7gjX3RVQdEQHX4MkDRLjNoYKzQ7YkdUS/2cEqSzDxNToKSE9lBexL2dV/Iyy1Xa4GDFMXGt5SUrfoETKwK3uBjnR/x6UrO8BMbcHWQWTYUdnlEURLcZeOPpICASRy7VnbUKRkY9eNGzcT9Zh1+0l6bIP4Dk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJVYM1sO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQCdIxH1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VwJW511709
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DJR0sgePn08C5LSYaXjJKVn++m0V1zKkluMfeBu+TGw=; b=AJVYM1sOs7RyYHBz
	RCmf50nu5Av0PyOCRuE3+YF1ALmXhNJpKOHhk3GrnZl8rtk+HUPukr00+bZcaWJp
	r58fhRFeLRxl5n1H0LNu7MBjZxlAvZI1Uq0uv+VRGfxct1fkX8fH64cvDYDV2BmR
	6Eu57I2ufQo6rUOikWj9q/pJCaPrXICsXGhf4yZc/VOoFNkKZwnsh5zZMNt8Qju5
	SCIbPA/ucYdMWJ9fcqOWPPCsT8M7sAEKp7H1EsyikkVyf5xHq3sSJpotN6sI9rif
	G3F2Ur6YqUqP/tVjYYXK57JlPNIT28bk1beZxc1cu0WkOtuW1C9l8gRGQt0aEtpp
	fkj1eg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fct9t61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:43:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84240683a82so561218b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 02:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782467030; x=1783071830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DJR0sgePn08C5LSYaXjJKVn++m0V1zKkluMfeBu+TGw=;
        b=AQCdIxH1h+wCMeOPaOy02fF9EMIpTyeISVY+M7OEM+n3fJrDKnUCnnGQWSLSF7q6Td
         pOHH0VnB4re8361H/gb3kX+aOOWYqerwAQGHBsHTpbtIgnxPjAi385yKtxZdy9RD1EAy
         3qREP9WgSPzSNGK0hdz4I4yHP1RdteHjuFZejeXUDGRcIfLaUkCTYw5E+q3UWBAFf4xG
         nRG4OxrOkRuUflw4uanKlU0LtU0YZiVX5S/fZnB2qGyDIDt2sQQEpckKE9iji5OJIJ+s
         tjjlNFl1mzwbrfqomAq9Bxk6CcxTKmj+vW2rjJ52aCpVxrPVH2wr6RvkovSeR9G5ihBl
         Z48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782467030; x=1783071830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJR0sgePn08C5LSYaXjJKVn++m0V1zKkluMfeBu+TGw=;
        b=O9DmQD2OcSETGQ6redrSuwF3O1FlEPPLIEGgCybWHKi+yJ3qo7Z0B8fyRUbwqal6Yk
         Kbr5cx3ZF6w/TUoTHRJElSrrSBKqMZdo72corNHU5f6n+0d2gLhOjScBy8V223Z8/eoF
         FNaAEgeSnqLreLxPAf0RVGa2d9iqV6Q56QuUgeUX0MgJh9+tYQY2P4a0Qfwf2XaMAP69
         +HXYCk8TmbAaaXJtbNX7/oQAD2JAw/P8QpYCtgxUbZ3JGChm4XgxS8AToX//Pz+yYfG4
         awPCuR555RCz0fyzB1BzTvgVDU4rPF1+/jrrF6wrisIyg1taVR3TvCYTCFCzfFd6NEzH
         e2Dw==
X-Forwarded-Encrypted: i=1; AHgh+RoaJXLZhzrbfV+SI97KdmCCSfHnYO/iXBGorlK8h1um7UZ5oiQXTWrQVV+liwSSgrDaX4HeTvWCHM0kIpwi@vger.kernel.org
X-Gm-Message-State: AOJu0YzcLZFnLEyUrrqdTElN3ly8/PxxZei/CVYghUO/hv8T6tAsmnIc
	qWuALjxgF92p9GRfpiJhOH9F0WZs4txBNDvuZkEv0EXubO9ubMQZnxbMONcxGKtB8n6XOYS9L/Z
	sYFsFT//OHlKWYIjs0SepyjB72bxVx84jL09T/L1Q+TDaaFttqG0gqf4Y9mAspQHe9t4F
X-Gm-Gg: AfdE7ckyvYghUdDcQRz+D3VBLGDkIK2oqXYs68zreYPY18EMOMzeijbrVMI36Tn+8Rf
	RuRp8rmHu57AUxma/scM97JnjA56Inm/6lvjzQfojNA8jKHyS6clA4wWsghLqDoKaqT8v5tSAcE
	WntHAmaeFjmdnnajg8fY9jYecuIq4NZEnaaEI/8QNLPaTsDYidx7m2WXdntqWBySc+qH0vequYx
	FjSGg//YabafCwV/hL4sRHsZbTUdcvXIzD9xPVY8LEXJa95Ao6EZGLcxB42bfsofQ8eAXVJBdYC
	eWLD7VPjkqnygm6e9ayLUvN9JkfcnPT+jHXP72aEvQ848in+cz4UNBJPYGWdjZtYe9M/s1XLWOX
	yg5orIcUspyFcmM4pezAoXH6etuoik0i3Fo9tYVK+
X-Received: by 2002:a05:6a00:181e:b0:845:c6c3:5e7c with SMTP id d2e1a72fcca58-845c6c36675mr2099912b3a.6.1782467030106;
        Fri, 26 Jun 2026 02:43:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:181e:b0:845:c6c3:5e7c with SMTP id d2e1a72fcca58-845c6c36675mr2099876b3a.6.1782467029665;
        Fri, 26 Jun 2026 02:43:49 -0700 (PDT)
Received: from [10.218.25.225] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845c5d248b4sm1123098b3a.37.2026.06.26.02.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 02:43:49 -0700 (PDT)
Message-ID: <f3f3ab12-d473-4c49-9339-cea53e1ff770@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 15:13:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/12] mm/vmalloc: migrate vmap_area indexing from
 rb-tree to maple-tree
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Uladzislau Rezki <urezki@gmail.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Alice Ryhl <aliceryhl@google.com>,
        Andrew Ballance <andrewjballance@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
        Lorenzo Stoakes <ljs@kernel.org>,
        Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>,
        Suzuki K Poulose <Suzuki.Poulose@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mostafa Saleh <smostafa@google.com>, Balbir Singh <balbirs@nvidia.com>,
        Suren Baghdasaryan <surenb@google.com>, Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>, Shuah Khan <shuah@kernel.org>,
        Dev Jain <dev.jain@arm.com>, Brendan Jackman <jackmanb@google.com>,
        Puranjay Mohan <puranjay@kernel.org>,
        Santosh Shukla <santosh.shukla@amd.com>, Wyes Karny <wkarny@gmail.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
 <ai3kkIpaR0aT_6q5@casper.infradead.org>
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
In-Reply-To: <ai3kkIpaR0aT_6q5@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dJ4yOklKksM-Fjlxlm5IoSQQUJxCVPoO
X-Proofpoint-ORIG-GUID: dJ4yOklKksM-Fjlxlm5IoSQQUJxCVPoO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3OCBTYWx0ZWRfX82pJ5RjzxDcy
 Jnvj0TR/8vj3kh3PVuyxZ6WB1cCpW+3ajQtHnDdvls3dadu+DGuH23jXQ2fke+HDoEH7MqR9xso
 +ZiTciOwtORQ6Ete4SCPcVHu0ztEu8c+gKRCGVad9ayyTajJYFv8gs0hEIfZHU20FG7PnZOUUVS
 oDMLSzmD/7/iBl41eYZSSrP2rJraWEHO4Id7F2F2eHZX05R87TwWQuYE1tyjBPlgXu3CGp6tnHY
 E9+eZwGrKYIFTnHY1rQd9TbTXioKyIV83ZbiwYK4XXSz56C08Hqs55CPGKcR9aqZ/mfyjggxjJH
 omV7rKCZRDJXFLBT8KRtnqnk1QCPtexl9TkDW6gmTKc+sHPuzTBB/f6YcpSf5xa1jE8X25PIqUj
 FGAG4zVzKisfUZf4OSKLRRYatNc1Q7W4IxzaQNiT1SA6mkzDl3371HVqUDmdpUp3chQcqWwZdFU
 klcGAYAa8Nc1O5JFg3A==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e49d7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=QrJ9IbtdTVaOtOl6jMIA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3OCBTYWx0ZWRfX1v7VOSiqrmG1
 GpmPDM/x4np32PtfQEE6/CJDsD6THHDuWMNKMjK45CauaWp4EttWlLlA0f7GddA8oEpvqp6iofE
 H3bao217hEZZyOG27Fx2fJym0tHq3VM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114612-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com,vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,arm.com,linaro.org,nvidia.com,amd.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A8586CBCB6



On 6/14/2026 4:45 AM, Matthew Wilcox wrote:
> On Sat, Jun 13, 2026 at 10:49:42PM +0530, Pranjal Arya wrote:
>> vmalloc's free/busy/lazy area tracking is one of the last remaining
>> augmented-rb_tree consumers in the core mm allocators. The rest of
>> mm/ has been gradually consolidating range-keyed indexing around
>> maple_tree (notably the per-process VMA tree in mm/mmap.c), and
>> the underlying reason is a structural mismatch between rb_tree and
>> range tracking:
> 
> First, and most importantly, I love this.  The maple tree is undoubtedly
> the right data structure to use for this purpose.
> 
> What I don't understand is why you maintain a separate "free" tree.
> It should not be necessary any more, but maybe you tried removing it
> already and found a performance problem?

Thank you Matthew, that is very encouraging to hear :).  The maple tree's
native range primitives and built in RCU support do make it a much
cleaner fit for vmalloc than the augmented rb tree was.

You are right, and I'm going to remove free tree next patch. Allocation will
use occupied maple tree which will walk the gap space of the
occupied index directly.

The concern that motivated keeping the separate index in the RFC was
lock contention separation. Uladzislau had originally structured things so
that the alloc path could touch the free tree while unrelated readers could
access the occupied tree without blocking each other. Your follow up explanation
of how the maple tree's RCU contract makes a separate free index unnecessary
is the key insight with MT_FLAGS_USE_RCU set on the occupied tree and
call rcu deferred vmap_area free, the same contention reduction is achievable
without maintaining a second index.

BR,
Pranjal

