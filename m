Return-Path: <linux-arm-msm+bounces-114614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MPvlCfdRPmogDgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 12:18:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B59916CBFC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 12:18:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="koEB/bCN";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T75dWAEQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114614-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114614-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3146F300B1B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 10:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1D13ECBDD;
	Fri, 26 Jun 2026 10:18:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3E43EC2CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 10:18:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782469108; cv=none; b=FJ6Ako1q5e3v4GDkblNJU5fMTEyhSbG0e2RzSRq8q6Uk5pEtYvjPXOxbC752opEdaiazGLsrs8U9oqbfWnhxONUwZ8bYMv1BPif7JdXESby9rEY/JD+C2Tt2UYkOf87xFYKYzcFXpotCoKuFUbjn15BC5ZAntmGAH0yXbDQxfcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782469108; c=relaxed/simple;
	bh=iV8sbR8qXEcTRdqyTnJTFgH8LTtiTcASYzbXJuopBvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LW8jsobZl0pDJIn51KoS4Zyu0I4VqGSiBNdGaJ8tWZuuQC6cwJI4y7L0y2ntbkJWRekZbagjlgcJvXi/dD0hvwj0FHGsnw7Tns9mCgdU2B7ms+5ZGiiBli40RWcDIpWYqHGK2QVvj1i/qitI/4VYaGhKwd6TEnGLpk7tANTitLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=koEB/bCN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T75dWAEQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QA038E984392
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 10:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIfc2dW5D9lK3/GVNNe/Fcf9TU8SCV3bTMPzuN/zFww=; b=koEB/bCN9dHGYL+f
	0r/RdoyBw0jGZdj0v8eGHDlxiXnSa1v8ga4jGjcP59J5XlmdvP05FvieAcM6Pc7d
	ytZSPRBjm5rls5FAjru0hw11vkvfJdH8B7awrc6klgjm4dHXfeQmhPWtthtmarK9
	eZfmpkzJWzATEcShiaCE9QrLG9Q56O0qZvrr3Xhe+6bLhHFDBvUnf9O24NIOzXJM
	9ii6P4gC8uAscYbPm7M0QolduDZnueodaIRnF9hiVTfXX6pM+HVCSs//LlBgXlk0
	jm6K5UMocRt4B7sgXFrp1j1zQdF8sGh/9yUcsPFjgZKClmAJZa1kx2bpS++lk+n1
	ltQL5w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fct9wm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 10:18:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so3646781eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782469103; x=1783073903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tIfc2dW5D9lK3/GVNNe/Fcf9TU8SCV3bTMPzuN/zFww=;
        b=T75dWAEQz9ILJIQ8Trjffa1PxNqtaFpZRotZdjOjVsttwj4WBpstPuMiV3GIzkIbTs
         A7RkaPjW5V4DpcWOvNTsWkjWJJvpnYAyaLBaVd/mDPazfS7HfkEjej0u/cTo/EtKAszT
         Hk7SWXCC6Pp+Frabiofa1W7VtbMUNJuGLL7z7ifk3kKw4aCspb338zv6XWyHi+gMzdxX
         ky5hzAXvGpouz5frjCwpRpba9TZB15keoRtbyFatIpPuRvRXbSjat9Rz/wo1fsRFRkd6
         O7WbrVCo9+W/s5BcVTG/Coz7SwSKtQXjINA4dL18WdGcTSnKsuKy8HOn9LnBq14tIHgp
         HZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782469103; x=1783073903;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIfc2dW5D9lK3/GVNNe/Fcf9TU8SCV3bTMPzuN/zFww=;
        b=Hynkcp0YNl+ihKqj1A4d8GBzaxz9zyTtTIbhuetEJVJYwgJDfH810Rg9exdSkW6Gf0
         23ZXp/nZ+ey4K9hZM9Q0tLqdfz/mvlvH8ysbsUFHoElXZG4bPyalO3VUyCb3HnZ04puX
         ENdzFe7F3YDJYiQ/xK826hn5y3mYDlXIQR6GA0ZacydBCakMGIbxMUAqAOiaGVT3Jkmh
         KwRYXv0oA2RuTqWp3JOCtSBjML8BjGMEQp52Xyaf5C2/QuiuyosntFmobUdzRQsEYf9S
         yF5dsdCPAVFmwyvXhZajwLngyYSll8RIKbHjSw6MS/zdcx6YwP+UGod81C8WmV7j7UCS
         k2Uw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7G58ohg893PkN/uxFuYphGT2OOg4CsuDXx1fiXGr1A1kRef4UceeCsB4J8YPaV2zO5VHaFxMFTglRXZ24@vger.kernel.org
X-Gm-Message-State: AOJu0YyI92kFiE8lo50JW2L5etGL8TAXdJ5fU/OlNpCC43bEIQN5jS4c
	2+OXUDd9uCwaXeQgqp6ZdXHL/0XTt4OJKc3VKC+E+ZvG8SG0R9Q8x/pKDrG2QEfR6HirxnfmFV+
	fqChEXVMAlOh2rYIeHN64X09cNCO9uzFb4A4gRgsLMLYSf3kJUpxA+o6I4EJrGrQfxF7G
X-Gm-Gg: AfdE7cniMemWG+VHaZ6wcprBx7gISVDLCtTPW0CJA7BWr3mhfxJsA/NR723cg+I43+X
	/u1oYXkwMsGZPs9a9aXUak/W1xu0D8hIbvebYlvzIt9f0bNhPIleyCNum1Y8AZly7PbYHyPX4Eg
	2iZTigFw18CYb3pZA8cYpgGLcF8xCsPrNj5538GujeuK97bGGbQrhx+JWjpggZYR/csAR7oodZm
	dXLny0TtAjUvFuVRbVEM6otSWetyY1GCGJAui72F7+PTe2uHA6AMsVLmSi3SMo+ZXcuhGmakgAB
	+FjPpujeRyaiC1qMufXZNAJk/aLpaDkTeUeLrTFPKaNDRpGPb4040ND6pTSqJvljjSq//gnii6b
	rQyKAOQfhLa5c669vObc7xl0TK5oVePRTVyHufBgR
X-Received: by 2002:a05:7301:9c95:b0:30b:9b64:4a3e with SMTP id 5a478bee46e88-30c84b6c547mr7176407eec.1.1782469103354;
        Fri, 26 Jun 2026 03:18:23 -0700 (PDT)
X-Received: by 2002:a05:7301:9c95:b0:30b:9b64:4a3e with SMTP id 5a478bee46e88-30c84b6c547mr7176368eec.1.1782469102833;
        Fri, 26 Jun 2026 03:18:22 -0700 (PDT)
Received: from [10.218.25.225] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm17372659eec.4.2026.06.26.03.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 03:18:22 -0700 (PDT)
Message-ID: <9eca8338-bfcc-4241-954f-2bf2fd14db1d@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 15:48:12 +0530
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
To: Uladzislau Rezki <urezki@gmail.com>, Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
 <ai3kkIpaR0aT_6q5@casper.infradead.org> <ai_LVreyRWx-RDEd@pc636>
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
In-Reply-To: <ai_LVreyRWx-RDEd@pc636>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uDvofWWtS5JTWHRm-R2hBibQcnSN7SrC
X-Proofpoint-ORIG-GUID: uDvofWWtS5JTWHRm-R2hBibQcnSN7SrC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA4MyBTYWx0ZWRfX9pDn6QqPx02R
 3R/+o0m+1bvhcyr6FGHnQ63HxISJen4Mmtblrj7C828lj7DlheYgmZhNZCRMtyXg1oEek9ft2Dh
 I/7gvnUy/eFL46RqquoLsGUl5oLzcvnf2uVB6PHFEV08MHpZ4gPGmL6n708Qugd6WK4/ycx21sZ
 rzAhkksDuRZVC36IGIIPYjr9DA/PqKFtkdEYXWcWtXuo/EMkvxcJE8J4LKdf8UguDB8aa1DgjT2
 ERFDI1vrECkF4J8yW6B5hkNeiIXVylA42VdZSdKMs4YwxY//HyFMKxcDGKLMJsk+IhcJlljMnkR
 cVSV4IAM8bwfp4KIfpNOlViZMFBZCQIrxWYfk5WJpeyP6aITK7bwW2fk+LlKTmvYtefDjiqZDKm
 dcq5jqFqTJrFFIABwZ+2vsLqjzwBvPp8BC6VHHldyTYdIbhyZaM4WyHCd2kbn7RsGwweyjBW6zB
 rV59gI+zPPyNwGWlMSQ==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e51f0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3FYh5rYaCfyF3NCrosEA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA4MyBTYWx0ZWRfX4Av9Uff57PwN
 4qOpYXL6pFoevrISf8QTa6UWGX1HYWkn/qARj+s9Ancvnf8CIn7y93L246OSUbuywfmq24gyK+b
 SDNeQkbYJIvr0E9Ewg7oyx3HeiHDR+0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-114614-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,infradead.org];
	FORGED_RECIPIENTS(0.00)[m:urezki@gmail.com,m:willy@infradead.org,m:akpm@linux-foundation.org,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,google.com,gmail.com,vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,arm.com,linaro.org,nvidia.com,amd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B59916CBFC6



On 6/15/2026 3:22 PM, Uladzislau Rezki wrote:
> On Sun, Jun 14, 2026 at 12:15:28AM +0100, Matthew Wilcox wrote:
>> On Sat, Jun 13, 2026 at 10:49:42PM +0530, Pranjal Arya wrote:
>>> vmalloc's free/busy/lazy area tracking is one of the last remaining
>>> augmented-rb_tree consumers in the core mm allocators. The rest of
>>> mm/ has been gradually consolidating range-keyed indexing around
>>> maple_tree (notably the per-process VMA tree in mm/mmap.c), and
>>> the underlying reason is a structural mismatch between rb_tree and
>>> range tracking:
>>
>> First, and most importantly, I love this.  The maple tree is undoubtedly
>> the right data structure to use for this purpose.
>>
>> What I don't understand is why you maintain a separate "free" tree.
>> It should not be necessary any more, but maybe you tried removing it
>> already and found a performance problem?
>>
> We maintain it in order to split several entities. That prevents
> interfering between allocated data and vmap-free-space manager.
> So in that case one context can easily access allocated data, for
> example vread iterator, etc., whereas another can do an allocation.
> 
> So by splitting parts i minimize lock-contention.
> 
> --
> Uladzislau Rezki

The lock contention concern makes sense, and in the next patch I will
incorporate the suggested changes.

1. find_vmap_area() will be converted to a fully lockless RCU walk.
   With MT_FLAGS_USE_RCU set on vn->busy.mt and call_rcu-deferred
   vmap_area free, callers such as vread_iter and vmalloc_info_show will
   traverse the occupied tree without taking vn->busy.lock.  This will
   eliminate the contention.

2. The global allocator lock will serialise only the gap find & range publish
   pair on the occupied tree. Per node busy lock will be a separate, finer grained
   lock will only need to be held for the busy tree insert after an address
   gets selected.

3. As Matthew noted in his follow up, the maple tree's own RCU safe node
   retirement will need readers holding only rcu_read_lock() giving a consistent
   view of the tree at every index. So the contention reduction goal will be
   met without a separate free index.

BR,
Pranjal


