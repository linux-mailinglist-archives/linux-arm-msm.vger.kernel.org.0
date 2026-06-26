Return-Path: <linux-arm-msm+bounces-114618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iJ8pEN5VPmoCEAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 12:35:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D08676CC1F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 12:35:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BROBLdNi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OsK0ulVz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114618-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114618-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48B9A304614E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 10:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3A83B71BB;
	Fri, 26 Jun 2026 10:35:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15983EB0EF
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 10:34:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782470105; cv=none; b=FgUuG3/SC3fvgB6YXtpj9YS50xVLQYACMIDnnVDAGZ1RkvXnghMABKCu4ATxruC6Hh0BJE7mPzCm8OXlaZcGk4anr+N/Xe6oap9czB1ZyNaEBdZCpT2UxjpGHmJAYyKb4+S+hsoWVV6rett0JSOGp5U2WCnsqhjSAQKa+72nPFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782470105; c=relaxed/simple;
	bh=0LAfCFigjk2pkH8reI7J4X9T4M/8EOT9+5bL0XpqUDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxABQxtVCYnq/1aL6tCJ7FAcja9WjJay6on+TPbAJ4EV0QyJGPu8NdiTz3a5i9iIpFey+lKINBS9bcp++KCo81AvAvXHq1c6eLbSAYNpeUJcrjgUCz39HP2L2nWZhNgZHkryKD+LoxQ6CCosuICnkWL/98J7VDPZwpOgznG65Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BROBLdNi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsK0ulVz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q9xY5h410636
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 10:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n28v+zrgL+6691cycJAuIiEzsIce2TWx4xB2oYyWdls=; b=BROBLdNiS4D19cMs
	ZLc9IRdFDh2RxDcd1yPiiAWEB925wrxTZFRO3sOODQbiMvfrzpSrBl1EqgZHwsBa
	YrTWmTW2Dj1280YLKXhJu3v5FiXPyRrfOMm0UNiJCOxotnmdsklDQXNVz02g6xuv
	exX80+deKqNxk2BbqderGhRQerqR4fra8972xZT6n/3r/dIofrJDRpAkz2c/aMs9
	/HIkcaL5/Ph2hw707kIU+DwdgymKSKNbNqoTA4wfVnntJmTq/p76nH4HMOVl0QcP
	oapD3kEtr99gPqyZVC6ZXJTqz/FBh3zLAIhSsC0wHmER2bUr6zbdyqMD4dePNKOs
	9NyqXQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1j1nhgq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 10:34:54 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso288698c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782470094; x=1783074894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n28v+zrgL+6691cycJAuIiEzsIce2TWx4xB2oYyWdls=;
        b=OsK0ulVzak5iURRQcw/K/leqwl0qSncIquPB48gt2S064vM+S25qNGsF3K8huF0zF7
         PDn3u51+jfoCAvE/0RvuFSdp/xk/1AOZYTLent+0z41XiSfyl9jeXHRPxLGR0E44tIg6
         PLiP8KFDpOt99WJmPRs9OcvK6ZCWpqjNiF9kNKJOxQ/jsP+xsF3ktMn/0FuxlFx+yh70
         LtQ0Y+U9/krbmAUaYqEZ9w5iD9iK9jO0Y6VtknKoU9MwqD+Ituo1DcuJxan/wvFHxbP+
         dVrMzUlKq5T9dpBKy8E3ChjBbQgqUEQOYB6FMWycn3JvfPSwQtMsx7VYiqy0O6l4DCd4
         iAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782470094; x=1783074894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n28v+zrgL+6691cycJAuIiEzsIce2TWx4xB2oYyWdls=;
        b=gYBud8ezS4YjUWsZq5KiIlHfxRuQdyJUl5KfypLrkpN8v78sXDfTWqCL8byKqPV1bq
         DcBnyxhtZ7lO+RyaXpkpuUWI21mE3dNBFzlceaov5izgyQylL4A2T8SMatBSHkG7nSmI
         4bk1lhlg0b3wtR2E9DpKOZZn8BQNukJ1bCzwPoDWBhPooNDhs5T6rIKAy7mJLG3DJ8Zt
         2YxbCT4oI62XBQeePQ2VEvwXTJkZ9cUmOYNaRjfuIkLbI+l4JKmwRAUIQgXirRQPjNMB
         u14x2QuGopx8X2KUw/FkiwcDw+OV4xX+iwmcxEsDIsBiiGPcbiFoOLgg0y1f3ah6w+hn
         +ZQQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCNotRvEqwCOFM8Z/FNilrbw0xrc3TB3TsEanuCu+N8Vf7uOH696ihYlUkQCIOihIVekoL5dqNpFbdEDlC@vger.kernel.org
X-Gm-Message-State: AOJu0YzCh+s4NrZ2Hn50ylyuLV95h06fxgyJ0KHQfKvm4o0c2nXvK3bG
	zjvk+/3mhDR3LFubUURVswQK+/O2Hz6amwVS6ebw36CXLa85+B7MmmAYjBbeHEn2UyvpFmJ/98l
	DmcwhVEMBgMwsUgFHzoXGkZxGgFuZW/Bh3CKlParAfr+UkV+igDYB9IDAeKIj9W77k2Xs
X-Gm-Gg: AfdE7clZp0ZUpQENqVennDo6AnwFDlDZqQpPjaDddvFuAxC3/OhO6BfqM+IPKx4fWxX
	YNrf53J1SazmF0O0mvNXoVJ7wfTZKpFt6/RwAGGrnWWaL9mTM2JSWLYkoq8aStPjrOuIw1yWLxk
	4Pk/zzf86ZK4DKIMjc2yqLwbvy/Qo0zsD4iXAOiHbwrFyQBar0+cRDCf//atsrkr+ZQI01j3IyU
	xLz9cd/J4LzRMkfC6eNKvlqYWny9a4OslNuo9qednqSB6gy0fv9fKQ6W8/5rvJOpkpyoDuwfRPu
	dxzncummt12Sc9rG12areUya+q3WCI6aUXvHY4AVOH9Awb0BL1jY0+XHGGs6jDA4NwV5iuuSaIN
	Kqkr9gjTeOh1wMiHqDXHl/W7WV7x9UnbaP8C4HXzN
X-Received: by 2002:a05:7300:2144:b0:304:13f3:e461 with SMTP id 5a478bee46e88-30c84d0ed61mr6718913eec.3.1782470093527;
        Fri, 26 Jun 2026 03:34:53 -0700 (PDT)
X-Received: by 2002:a05:7300:2144:b0:304:13f3:e461 with SMTP id 5a478bee46e88-30c84d0ed61mr6718867eec.3.1782470092953;
        Fri, 26 Jun 2026 03:34:52 -0700 (PDT)
Received: from [10.218.25.225] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c944999adsm9482228eec.24.2026.06.26.03.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 03:34:52 -0700 (PDT)
Message-ID: <4b00ec54-6fbb-485a-af9f-a2bd145ddeb6@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 16:04:41 +0530
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
To: Matthew Wilcox <willy@infradead.org>, Uladzislau Rezki <urezki@gmail.com>
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
 <ajGQ_WPT3Ra2kPCQ@casper.infradead.org>
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
In-Reply-To: <ajGQ_WPT3Ra2kPCQ@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0V_WhNhKZEsXAdCMrqTumU6Hwy4TeqQ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA4NSBTYWx0ZWRfX+cnPM4a+E544
 qSBDwQRyu02o6Gc7GgcB1PBiJJ6yLzS99jsTXzdS/10oMeRwwvmiY22GJ4/DX50mcZV7AZ3wWuj
 VDNcJl2W1WpHC4TT0G8/I8EHs+FQzwv6XGG1QfTd/o4VU2Q/HaRGjXQ66JxsVXqKKrJoN/vg9xL
 ChZd5OH+W3UnTLzZvVNqomPJXUrWaE14KZy7pEybFUEQC7DBHyx1wMCJA+HwpF3xYfNipm+GLl6
 5wPsm4ns0gp2/2mPjgK7DmQZVKCJMMs6nfBPQXzaUuQEa4gS9tCgHsEnNb75vK0LnOGqQTKCNH0
 FhJiYcRonBUekZMY2fg78f9Kx/FTfeq03JNF8G7qWmEmX+smiRFOobfX5fpZ5rAfgX3CHjVLt0a
 cs6k/f5KZlpx6cBqoMTVopnciYdoVNV4BhdSg9cjc7y63Fhl16c7HvSEPkBcqtkGkkLmvS8ImLr
 nM+jash0MJqFdwmNq6g==
X-Authority-Analysis: v=2.4 cv=W+cIkxWk c=1 sm=1 tr=0 ts=6a3e55ce cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qSOC8k_MCT-xwaH91gwA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA4NSBTYWx0ZWRfX1kyxI05JVI5U
 hG/luFMERbmzwj4fAnNrtPl5irwie09HpAocgocQcIsqUl4WTXP8zjJ8lqTle1Ve/FxjmxSsUWw
 /GUpPyxsJoQer0r3Q1RCRHEY+fwYXT0=
X-Proofpoint-ORIG-GUID: 0V_WhNhKZEsXAdCMrqTumU6Hwy4TeqQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260085
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
	TAGGED_FROM(0.00)[bounces-114618-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[infradead.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:urezki@gmail.com,m:akpm@linux-foundation.org,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,google.com,gmail.com,vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,arm.com,linaro.org,nvidia.com,amd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: D08676CC1F9



On 6/16/2026 11:37 PM, Matthew Wilcox wrote:
> On Mon, Jun 15, 2026 at 11:52:22AM +0200, Uladzislau Rezki wrote:
>> On Sun, Jun 14, 2026 at 12:15:28AM +0100, Matthew Wilcox wrote:
>>> What I don't understand is why you maintain a separate "free" tree.
>>> It should not be necessary any more, but maybe you tried removing it
>>> already and found a performance problem?
>>
>> We maintain it in order to split several entities. That prevents
>> interfering between allocated data and vmap-free-space manager.
>> So in that case one context can easily access allocated data, for
>> example vread iterator, etc., whereas another can do an allocation.
>>
>> So by splitting parts i minimize lock-contention.
> 
> Sure, but there are many ways to reduce lock contention.  One is to not
> take locks at all; the maple tree is RCU-safe, so you can read the tree
> holding only the RCU read lock, as long as you obey the RCU rules.
> 
> Specifically:
>  - Write side has to RCU-free the objects that are stored in the tree
>  - Read side has to trylock the objects it finds (and retry the walk
>    if the trylock fails)
>  - Read side can see a mixture of objects if the tree is changed while
>    it is reading, but for any given index in the tree it is guaranteed
>    to see one of the objects which has been referred to by that index.
>    That is, if the write side overwrites an index that referred to
>    object A with object B, the reader will see either object A or B.
>    It will not see NULL and it will not see any other object.
>  - If the write side stores both object C and object D in the tree,
>    the read side may see neither, both, only C or only D.

Acknowledged & I'll implement this approach for find_vmap_area():

Write side:
  Every vmap_area that was previously freed with kmem_cache_free() will
  now be freed via call_rcu(&va->rcu, vmap_area_free_rcu).

Read side:
  find_vmap_area() will walk vn->busy.mt under rcu_read_lock()
  using mas_walk() (RCU safe tree traversal) & will then validate
  the found object using READ_ONCE before returning it.

The maple tree guarantees that for any single index the reader will see
either the old or the new object, not NULL. To ensure this, I'll set
MT_FLAGS_USE_RCU on vn->busy.mt in the mt_init_flags() call.

With these changes, find_vmap_area() which is called on every vfree(),
vmalloc_to_page(), vmalloc_to_pfn() will no longer acquire any
spinlock on the lookup path.

Does it sound like a good plan ?

BR,
Pranjal

