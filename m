Return-Path: <linux-arm-msm+bounces-114576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jne7DnudPWpd4wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 23:28:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 383B36C8C01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 23:28:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bhsprzAC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=imIaCD8g;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114576-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114576-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 676103015C9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 21:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D265372049;
	Thu, 25 Jun 2026 21:28:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C327636F8F5
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 21:28:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782422901; cv=none; b=BXWMGXxGSg2F/ab7g0LmOfM84ln1fQoFExXq165Xsz9VzTrmEnF7Za7F0Qg4sAGdtYqWSnm6ukvuPiqSrZ/xruVI2kEP+MRU3cs7+4N33MBxTy3fraNa0NhQqgmVYluhwDVdyDy5dn1y5lOHYvImjEElRiFQYWp+418Yjb8cYWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782422901; c=relaxed/simple;
	bh=GQsO8VeAgC/KNNaZnoHfmtwfirlK1mVAUqOScNygEgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBO725XQEdcOqIMv+ts/TjkLn2lbe5To5fw+WCgN9YG3Rd0hFEQwr8EkUDW04MmHzpLJGk5zV8Q6CqoRnPyEGYGAxbl4mxfbv8Vm7F5dGQED2NRVwHKud4StEP3F74gUOGHEPL+FYC9wDDzkfsauEz9SWRkLiRjsSCi/5L5dqcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bhsprzAC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imIaCD8g; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFenjR2544307
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 21:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QS7UHeLZQ8FUPa0FNvzQZRUxB4HFWhnIDFIBp7tIS6w=; b=bhsprzACOGqjhen2
	Nt0Y5lU8ib3eUGl3WmeWVM07S3w1G8hoBh7Y8fPitS0YnTc0muQRKdkKq1BXYeDN
	ZmFG8f4rtiZ7RuSDvVBMw8iIlbF1S37lqzaUCrcwYPdKAHq5W7j1KhgiQ00wERwM
	tDlGXG91vHqjZk5bsDPLOgCEROI7TLmCpZE+ujqzl8tgHzvTv5o6R8pbvc95Gl6j
	czOU/9bOCDde4vuD/yxKzWVT87G/ML0UcBgGzvvN2i4Suad8HOj786YyuDcmNthZ
	cKYisTflEGgBPVROWcQmWVnqWnWUY+76GkPUb63dfqinaESZoUrUP/qtxHn5J4pW
	T/Zkuw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0w0q3xy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 21:28:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c13bb8ca9so515709eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 14:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782422898; x=1783027698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QS7UHeLZQ8FUPa0FNvzQZRUxB4HFWhnIDFIBp7tIS6w=;
        b=imIaCD8gD2FrVrjLGiDFefr0poKSQH3AyPfQjjEZA0aYP/De8IE2SrKlXjhUQAw+uf
         KxooAGU8PZtepzPzEnmeaRC/ALNvF5E9NeFHsQNSCNY6Q6n61WspIXAYcC9/i0Nk2lce
         9UWPTmq74OwXRzSIkoh0irCaS941MsyI2XOeZoKTAvF7P2F3b+D9vlDQXN3N4AedqxJj
         eBHsElmenc09n4LQxFFRplQVd79AcbTHWLWnh816fK3MsTZqvoFCrqcLhtP9vJgF7AtH
         OIh4wYIw66aCjzlLn6cUsYnYAzeYvLQH7TfWMGs78vSARnobSZCZU4F7snTx5peHaVOF
         xNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782422898; x=1783027698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QS7UHeLZQ8FUPa0FNvzQZRUxB4HFWhnIDFIBp7tIS6w=;
        b=N+/kITTG/Wqdipzs9UWSKSDW2v2aSykCSZ11nHQlN6mZ6RDdgtWXpEp4Qhl6tHiwpG
         cVsLmW3TJr0X1y2+cWcBngKIEEcCTBV1wBgpsdVQt2SLjfFdAdFEJ4lrdKCmhT8yJ2Qx
         Kj4crXG7LEKvAPG0ro30sWiX/bC7kLhVPGqXmt1VYiXkYNm6oCmR7MLtHIAl35nQaA2c
         YB2ByH/aGU6HGDg6YKHSvsloc0F4gTTCX5X4vDy1VInirT5/hKOwgMSgKtcmbuLN8HaF
         joH99THAsqGYIgv3cGdvxCbVMwyU1Xi4ior8znF+C3q9Kvr8dAe6djG+3RE57VtWJ5+x
         JfkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrcp511wkqtwFp5lQR3gKgjG8TpDBJj8DiTDKcuRYvbTtO7hovlS3wpATLrR2mqrBkfyIQl6MOsd5lCzVfw@vger.kernel.org
X-Gm-Message-State: AOJu0YzS3w8DVeGQxYByIVFyCxeluN/+/cUptK5yIa58Nt0llhPvRO9g
	f/y+ezVTwZ5AIWMPraxZNSg+TzR/5LPIw82D0M5NOw9fsq9gzT9KB2nx2/K6MmmFaWt7fptcann
	HEFDLWr1L3Si5l04jobm2n1paFKKrW5bmK/n+RrJFnkxKZfNVS0+xGcJQINKiW7/ipxK3
X-Gm-Gg: AfdE7clIU4+OKrj5fZoq/Bsh3ITtREdRSae9YeCnt4BBNU7bTBgSzsoomFpzUHzqBhT
	w0Ty7smS8d2LpxMHS1OjSP9Dx8TjzaE0yxTp+pgiGbyiLQsJw1VjYRXTbqEWwfIucw/u5JYwM/T
	OVvfxeY5Lr7dB3c2dV7Qcq7rcMV4sav0HoNsncfZ8hNFjqphiYTkKSRK+sVzkRoATVum2Ta5ZBq
	W/1O9BF2gGofBd6+2PL/6Mk4Ax4pAWEBfBaGF8jS002Xp1Ne5k1UueZYu4MTgJyHRXFloKR7iVX
	j9PzE1XeIqINYdJEmQpOIy5UAZ9GmvbO7QDACWFWpL07Xv/kYyMEBXeHE0lQA9QVmg6YA/Bd4mi
	z8CS7CLXwvaJIx/qok47is5aCoBX0xdoPMX7n7JXc
X-Received: by 2002:a05:7300:d021:b0:30c:536e:3a8a with SMTP id 5a478bee46e88-30c84b7208amr3993360eec.6.1782422897595;
        Thu, 25 Jun 2026 14:28:17 -0700 (PDT)
X-Received: by 2002:a05:7300:d021:b0:30c:536e:3a8a with SMTP id 5a478bee46e88-30c84b7208amr3993332eec.6.1782422897093;
        Thu, 25 Jun 2026 14:28:17 -0700 (PDT)
Received: from [192.168.1.4] ([122.177.247.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca21fsm12718751eec.6.2026.06.25.14.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 14:28:16 -0700 (PDT)
Message-ID: <5285b561-d610-43d7-af76-ba5da19e70ff@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 02:58:06 +0530
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U9iJ-zlapncmyTfNqKOhRF5Lyk2JgL8v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE4NiBTYWx0ZWRfX82D8PqflyiGy
 ADGHQYsqYxkiULYK93eRnlLAh4qedii2KVxHrGqh8NmpgefqQ2rpspYqTd2Kzlnszc0hWqs5OkF
 IH4AAeuTjkLucqmtIpft6+8m0CFdrhM=
X-Proofpoint-GUID: U9iJ-zlapncmyTfNqKOhRF5Lyk2JgL8v
X-Authority-Analysis: v=2.4 cv=R6Ez39RX c=1 sm=1 tr=0 ts=6a3d9d72 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=/mmxY0Z96yNuczEkiZ583g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=QrJ9IbtdTVaOtOl6jMIA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE4NiBTYWx0ZWRfX2AxxSCj1QLKG
 SwaCTN47wAa6Iwy5oVd4DwrS9ZN1sVUOA4HPxgcnpOCd+UdNbymrxL0cGJF0eSiy7wiclxRXFmz
 vJBJ9ycQn2E4SX4fV0nncpqDE/8ifELfr5oVkksqb1vZ2/dsXFkEltLmQuSRBBmCd6vX13G5USg
 eNQePvcLaRAvznqel+U7dmqLr26LmNAzrBB93GBCMSItiiypcU+JvGQLmDbPpEA6fO0RwSfcJEa
 51+7tXbvZfJQHvC5IGh4hg4vDOIwIgm4gfLGcXzcNZZKtLdrzNB0FrvQkJOnAxqw0HKY/e96cXv
 nn8RuBjDp62ZnFOA3tIZQHTw42TYGwVLmNsUx8nJKAV64e6cQi3cRPWeLwQIauDb6G65vS4+wWi
 bd7uSQv+FvN3jlIrTs09r9bytma1GPBSYS0sTz9YBBDib8XndE5yN9WkF0uPRQMeVhED79/7OHk
 3c5GECw5TNp55C+vhmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114576-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com,vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,arm.com,linaro.org,nvidia.com,amd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 383B36C8C01



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

Thank you Matthew, that is very encouraging to hear :).  The maple 
tree's native range primitives and built in RCU support do make it a 
much cleaner fit for vmalloc than the augmented rb tree was.

You are right, and I'm going to remove free tree next patch. Allocation 
will use occupied maple tree which will walk the gap space of the
occupied index directly.

The concern that motivated keeping the separate index in the RFC was
lock contention separation. Uladzislau had originally structured things 
so that the alloc path could touch the free tree while unrelated readers 
could access the occupied tree without blocking each other. Your follow 
up explanation of how the maple tree's RCU contract makes a separate 
free index unnecessary is the key insight with MT_FLAGS_USE_RCU set on 
the occupied tree and call rcu deferred vmap_area free, the same 
contention reduction is achievable without maintaining a second index.

