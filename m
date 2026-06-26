Return-Path: <linux-arm-msm+bounces-114619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mYW3KL1YPmoJEQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 12:47:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F035D6CC2A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 12:47:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iD7nxymC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V7Dza1B1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114619-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114619-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB0F73008233
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 10:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7583B71BB;
	Fri, 26 Jun 2026 10:47:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA3A37C935
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 10:47:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782470842; cv=none; b=Ua+6j2KZsQ/lGLtdcpVSn/Z7EWRiAPY6V7MDLEFVHszcOrhaaRfEdZMOg8pcLlirT6I/ksi/KPZBJSIId+15oJ9lJ+BYhby2xiWA2q+8Y6Lqn3ioK5/1R8zAxD7r+4ULrFUpGToYdX+w22F3wkkU+cquGAhXUKVHbw6wVRcQ//g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782470842; c=relaxed/simple;
	bh=SIf4Wby4OinN2UZ1ibS707vwvEHsMXIll5sjBwiWY4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HyPyX0Ug7Ndwt4WfGzvjMsnvT6a1r5G6Oysfit2QT3nFtkUht3vjmKlxL/2G5WLGeZUs7FxUD4XtCZGRziR1Ndvx2GYKIR6GBdgBUzOhr6FHCRqdvhX4BKBFkzgKH6vzVqnbTMr97cif0GjDGCDGabtBs62VyBU/ULHwadZy0Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iD7nxymC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7Dza1B1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcoB63384269
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 10:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PChBsdJTdy39hlcQc2xrVoLyCX7474bgwLOt0FMf6Ls=; b=iD7nxymCDFJjKejM
	yeACrs8LlvKBV3jswNLTh9psxaiW925eHUDLfBLMJfzSiROAU3dbupadpJwMvfLa
	h2JHcUBRcIL8wvD9gun5NNueROnQ/3zkjJ6g1y8vo/nseg2QDL+0GXjQ97XyRfMP
	bsZrUWOeb6z+nZ0oiTuF6juHHQOHsjTBD5GERvNKQac86Lojqjd0fFuZdM7HUn7M
	fv9N0L1X39Y6EgYGYMvanQeNvLQlTURU5+7TezrCFUYYyDs0UBJ8xA+A1w6UdTNm
	WcvliyHGhaxwusIwekR63QIMEPE/otIMFHKdN9UN7hr8tcP6TL6bWCJee12h+wrV
	YZX6bQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f19m3ub71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 10:47:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c95b0e22aso2330689eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 03:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782470840; x=1783075640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PChBsdJTdy39hlcQc2xrVoLyCX7474bgwLOt0FMf6Ls=;
        b=V7Dza1B1J0iNLME01bocYO6FAT9fVNw8FI7GaTS2YvGe1Xre3N3Lh+NyOj7YGl6M+4
         S2YNOZ2azpME6EEJVDfYPhWmNKAw05larcRzV4kjIh8WJTG6gAF8aMt/+WWvj+NiHe3U
         7DP2yjCp1DnLqCbfkyvwzfvBHXpRKruY7qiPNVUl98Tr4kc6dDeqEgeVttXb7HbavKT2
         e78yHpCvqESt+TXQAUIsdwJj6NC9k0lcNEvStKx0/rw1ShKfqJ13J7WPYxDJbSlTRbOj
         uI0NjbpO4H4hSOl4xYVel0nfcP+Qj67BTqV1duWmjx2Qbo1Qemi0A/x7jmUop+CzCtKG
         IBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782470840; x=1783075640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PChBsdJTdy39hlcQc2xrVoLyCX7474bgwLOt0FMf6Ls=;
        b=kFjtJEII+3b3jdzzhR9wjwmMCcSMz6rcUmnJE2OxqtGakDCgQI6V1G6i35vXheckOE
         7isD2jObIRYXdqQwV4OqyGX7QW0+CyA/23YyvvQrdypSFvTnOYz0EL+EJ1jx4I5l6WRO
         IGVOnoRsVKRXg0ivFxk81xCLR1moi/BdZtyjKjhaMAYeH38x+Kic8I9L3BeCg9pRpnre
         l4UFowMVl9u0xIP9We9J+LHn7N9cE/yQGFWnK6wR60r27WTHld1iiGfKciGJx/WxRgK2
         Avq98GaRaal+bARqtJXih34Fs2M8D/WnwlisNKC4azMLMzXRNKGtnPe5JWhmf8Z2csgd
         IIYA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2xGEYR/dDbwc7JD3jhOeDInIBoTp5NIPV08T05BI2N35vuwsNub9Acem2K/+nC7tVdn+iuMeGrSAfh4lS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxle9xPyl3eckpnSCPNiOF9oUrqAuupGGAnOhYl3VFCeAM68hcc
	4kpTn2dhWZ6Tb8aoVbs6HFsYkIo4uK3tyDflnpu+7i6KxkqR0lGAf0HKCIOLYor0fCBPgajwXp1
	o+v73WaLHy3fgY+vQgVFTXEXKwoSueD3jZvzeEBfu5jFmgSUn78PKuuhx6lYcefwE57ac
X-Gm-Gg: AfdE7clMrAmr80AXMN1icv50Q782S2rq+VICCRGNFW3dKgYGgGjivQEZbULHNOob53C
	rEb+GCoIgKeAoifsN8GjdEyw5y8Ej4+G3Fk6tBaSWwmnJ0A+5sMTz4aHoER51eCDw2cyS+2UrmT
	17Q/bAYtCjaYRwple2yJ25otAV2uZSu0BlpmBI6V5rb2Q04favO6AWT1JDkx1p4rnhoYbvGvcH+
	RwrhsVAJNIWScwFoYxtnZ8zOtLco7DX76EC+xJumq81haVHePPiiYP/yRPF6NEwjPSsogjPklgY
	c1ydSHXjwjz3Kgu7tnL2TCjmmZhybxiUtW1302L3tc8aY2o7e/FEHnEHl1jrB/+dWn9X5sJGZ2k
	rv1N9pKlxHNLmU+LRx7GbgzAHsi4cE7f4Ryzmo9Y8
X-Received: by 2002:a05:7301:37c4:b0:304:ab8:f899 with SMTP id 5a478bee46e88-30c84bcdac4mr6511047eec.8.1782470839599;
        Fri, 26 Jun 2026 03:47:19 -0700 (PDT)
X-Received: by 2002:a05:7301:37c4:b0:304:ab8:f899 with SMTP id 5a478bee46e88-30c84bcdac4mr6510992eec.8.1782470838306;
        Fri, 26 Jun 2026 03:47:18 -0700 (PDT)
Received: from [10.218.25.225] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm17658216eec.4.2026.06.26.03.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 03:47:17 -0700 (PDT)
Message-ID: <e65e6153-10b4-403e-ac40-10687ea5cb68@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 16:17:08 +0530
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
 <ajGQ_WPT3Ra2kPCQ@casper.infradead.org> <ajPDDkV7yqWlhPIh@pc636>
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
In-Reply-To: <ajPDDkV7yqWlhPIh@pc636>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA4NyBTYWx0ZWRfX9HLhO4Bp+z0s
 ESKhMQ5a4A+6DmL1YffbFA/z7KjxHyYCXhg5QJF+MDnLYiXHbKEg5MZXbrec0uma5c8VeG52mVM
 0TZnuzBBH1t3i9TvdYl+bJhQi/tVyZg=
X-Proofpoint-GUID: Htr_u1vZNy0EQPniMrVxx2GJ2FV0gy3A
X-Proofpoint-ORIG-GUID: Htr_u1vZNy0EQPniMrVxx2GJ2FV0gy3A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA4NyBTYWx0ZWRfX8Z1/x6Y4mJfV
 xKfUEpuqgPuvBNrhqaOYkQeiRc6h0JMUp2xyLqOnbOK+qM/kL6TyFOdibLECp4ISDO7/al1KE+C
 pb/HEkNoq0eBKIlSdQHESrlqAH3z0YJgcMYmESrBCdEIrs3itDIL7LfDuUTTHEnuy0+UVxc9q+B
 uTyzOFG86+1XXpBoJ2XkI/HAjxJq1XzJNgnveeOKgAkK9eb7AAImuemmjpW8jTOEKnJ8yvZEdWX
 V9XgEDWhJRP/F95/eFJcydYHug397yIPBj+MSyKGdJhv2zFG0rgZuJVoZvLY6T/faf7oj9lJgBA
 OdeC1O4Fz4dSalClMhQwZLH4DRgSPEtPGhS+2ea6uafXwJC5cR8oNZ95xp1qtzKNL7uXUoYhi2r
 9eNUkQngiKOqSkTk9yq+U4JEOmm0D0CBTBDtM7leQe8wqyw9GlOgISM6SJRCVKY03mFcyrWpN1z
 grRCA3PYw158w6HajpQ==
X-Authority-Analysis: v=2.4 cv=Vv0Txe2n c=1 sm=1 tr=0 ts=6a3e58b8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=O-PE4fd2i0mDks678lIA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-114619-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,infradead.org];
	FORGED_RECIPIENTS(0.00)[m:urezki@gmail.com,m:willy@infradead.org,m:akpm@linux-foundation.org,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,google.com,gmail.com,vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,arm.com,linaro.org,nvidia.com,amd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: F035D6CC2A3



On 6/18/2026 3:36 PM, Uladzislau Rezki wrote:
> On Tue, Jun 16, 2026 at 07:07:57PM +0100, Matthew Wilcox wrote:
>> On Mon, Jun 15, 2026 at 11:52:22AM +0200, Uladzislau Rezki wrote:
>>> On Sun, Jun 14, 2026 at 12:15:28AM +0100, Matthew Wilcox wrote:
>>>> What I don't understand is why you maintain a separate "free" tree.
>>>> It should not be necessary any more, but maybe you tried removing it
>>>> already and found a performance problem?
>>>
>>> We maintain it in order to split several entities. That prevents
>>> interfering between allocated data and vmap-free-space manager.
>>> So in that case one context can easily access allocated data, for
>>> example vread iterator, etc., whereas another can do an allocation.
>>>
>>> So by splitting parts i minimize lock-contention.
>>
>> Sure, but there are many ways to reduce lock contention.  One is to not
>> take locks at all; the maple tree is RCU-safe, so you can read the tree
>> holding only the RCU read lock, as long as you obey the RCU rules.
>>
>> Specifically:
>>  - Write side has to RCU-free the objects that are stored in the tree
>>  - Read side has to trylock the objects it finds (and retry the walk
>>    if the trylock fails)
>>  - Read side can see a mixture of objects if the tree is changed while
>>    it is reading, but for any given index in the tree it is guaranteed
>>    to see one of the objects which has been referred to by that index.
>>    That is, if the write side overwrites an index that referred to
>>    object A with object B, the reader will see either object A or B.
>>    It will not see NULL and it will not see any other object.
>>  - If the write side stores both object C and object D in the tree,
>>    the read side may see neither, both, only C or only D.
>>
> Some thoughts about it.
> 
> Having the tree which is RCU safe is good for sure. We can benefit from
> at least in the: vmallocinfo scanning/dumping, possibly in the vread_iter()
> when access to /proc/kcore and other places(which i need to check carefully).
> But this is for read-only traversal.
> 

I agree. The RCU safe busy tree is a foundation that enables lockless
read only traversal. Will implement it in next patchset.

> Switching to gap-based approach requires quite a bit of refactoring and it
> should be a full switch without any hybrid schemes or mixes. I expect that
> we remove more code then adding because of some parts will become hidden
> like lookups/reserving range/erase, etc which is good.
> 
> - replacing free_vmap_area to maple-tree gap based approach;
> - rewriting pcpu-allocator which lives in the end of vmalloc space;
> - refactoring per-cpu allocator which is also part of vmalloc space;
> - vread iterator;
> - vmalloc dump path;
> - vmap_node logic(use gap-reserve to minimize contention);
> - and more...
> 
> To me such rewrite makes sense if we end up in something structural not
> just because maple tree exists. The criteria i would go with are: at least
> same performance level, remove more then add, the design stays at least in
> same good shape.
> 
> There are some drawback i am thinking of. One of them is maple insert path,
> mas_store_gfp()? First we need to find an empty area, then set-range and do
> mas_store_gfp() that uses gfp flag for its internal allocation. If we are
> under spin-lock sleeping is not possible, using NOWAIT or ATOMIC is not a
> case thus we should somehow pre-allocate outside the lock and store the range
> without any allocation.
> 

I am planning to have following approach on this:

  1. mas_preallocate(GFP_NOWAIT | __GFP_NOWARN) + mas_store_prealloc
     will be fast path. The preallocate attempt will be non sleeping and,
     if it succeeds, the subsequent store won't require allocation.

  2. mas_store_gfp(GFP_ATOMIC | __GFP_NOWARN) fallback: if
     preallocate fails (rare but possible under memory pressure),
     GFP_ATOMIC will make a non sleeping allocation attempt inline.

  3. vmap_retry_list recovery queue: if both above fail, the VA will be
     added to a non indexed retry list.  The allocator will scan the list
     on subsequent calls, and purge workers will drain it. This will avoid
     any leak or panic under sustained slab pressure.

Neither GFP_NOWAIT nor GFP_ATOMIC can sleep under a spinlock. The retry
will queue provide the correctness backstop to avoid GFP_KERNEL
blocking inside the lock.

> The allocator operation:
>  - finds an empty range;
>  - publishes VA that blocks that range.
> 
> those two have to be serialized among other writes. Otherwise two CPUs can use
> same empty range and both try to reserve them. If preallocate outside the lock,
> the "alloc" side has to validate that a selected range is still empty and only
> then store VA to block the range.
> 

Sure. Both will be called under a lock. Holding both under the same lock
is the better serialization approach. No two concurrent allocators will
observe the same gap and both succeed. In the next patchset, I'll
explicitly add a comment on the lock declaration describing this approach
in commit message.

> I think it is worth to prototype something to see how it would go. I may be
> missing something for sure.
> 
> Thank you for your input!
> 
> --
> Uladzislau Rezki

Thank you for the detailed design questions. This will make upcoming
patchset substantially cleaner than the RFC.

BR,
Pranjal

