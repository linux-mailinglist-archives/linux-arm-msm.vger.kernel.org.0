Return-Path: <linux-arm-msm+bounces-113003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9DUUNNORLWp3hgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:22:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CAC67F28C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:22:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MZlaAldJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="L/OTmlLL";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113003-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113003-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 812473037BCE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4C032B10D;
	Sat, 13 Jun 2026 17:21:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDEE31F98D
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781371271; cv=none; b=k4x3C1U4Nsq8ObOtlC3md7xIebrg21bq5m2SucsbGRygKJ7/2C5h+E6hWQEnCsmldQ7rlgI9chsmu+gdKsTiWfcqW+jZW/56fAELVtETcB7z/H6yZvd99soe1pECfJKJbHWpxQYvx66ZWM7Vk2A0D+PltT1PC//XUO5fd5ZLhrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781371271; c=relaxed/simple;
	bh=93nd/fp0WT0lOBo8bTdnf+a1qmT1fxj8wsunRs1e6EU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tkaI1cDu4qzAd/CEe9GePeL8qQNcgCvV6X4lqJls4GdCTzGNjNM5hNJvxPvyK+h4Xo01FBag6+7U3Wy1DCuPfHiZ3+bO7jCDrSho1UGgo5jXkyobxC0lSmi/5RAdfIJQdUVwFCmJ0NKZJBDxOTDJ2SFvJ+3cY8EYJBD232DdzAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZlaAldJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/OTmlLL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DFB5Sw3258651
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yByRTqcgr+Wmflbfnv6FJYfUST+aqgHU9xDBqMKtVHU=; b=MZlaAldJLzVAYK1l
	p0tS7zIIn+KuuOOBF24rcUDf3A/f+vnzj5jLpjqiS2X9Qr4zcEe3wmQDqzuicrSR
	w+/7ceBEXQ9NySVojXFWjQFlFgN/WMVujKUQAcwmQT7Azeg36FTPVHU8+0rImlSX
	7nUYkEL6vx59+qkd/D47M8CdBEsu1OUlVmLh2hf0yI9zd3IZOk+emYHZ2gKaEGlH
	ND2+LcthBI/R2ikjP6Tkh4TZhnuiBsaTZd92V0jn9jy02ZCGPxxts1zTiekvv4qg
	0bpUUcZtNMRdXV1CPb453q5PzyDOXPLVsBAQ48qNJPakvXcCDrWFMsdwrxxVZty6
	Q5KIng==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gsngt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84235f9b91fso1515391b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781371267; x=1781976067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yByRTqcgr+Wmflbfnv6FJYfUST+aqgHU9xDBqMKtVHU=;
        b=L/OTmlLLrB3G+/kOf4gt5JxfjsMI9gxBwCjqusPFzqvD7GH4Z18FrIXuWi1foVC/Er
         ekvDGZ4o66C4BOODOZB5HKTi5sCnldwXhY5CI6sEzyKrLdKjvL5kt7nZEwo3zXPV1XkH
         MWqUCRkhfybvmtrgbI4KB9AWQO/L3MdUuZr5FBBunOt1bJMXSSbFxr31BKi6aBEqnkkF
         1WetkJ5xRJsqY2c43fAgZ8NBrtUcMS3gzCgfzBlPHskTaTEiW+12Yf+ol+wOl51q6vqy
         biXteeUh9TuzInUvTJa8nT9Z1P+PoetC2IPjhlGQ+P7HqNARXDH+4fE5/WM1tlojY0xV
         JOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781371267; x=1781976067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yByRTqcgr+Wmflbfnv6FJYfUST+aqgHU9xDBqMKtVHU=;
        b=b/ny3KGAf6PjFX9nbo0iCmKXEutTt/9xECbD4T0815kMuYCR429K9IRLyraAYXE6KC
         MR+3qLRuG6yjE3byM43roEkO6dr3F5L+1V9ATvmkX5ggK8ZEXsfW/k4VjTsoaCdgwPOi
         OqtOSWUGIopAr6Bd3xsXCDD7DYf9nBu2hVGW3EC5D0oQgf7g4OU0XR6MW8BAmaF6ClCW
         CCIM5fO0l5aLbscaHIkisFDJEjtoRUzjeJUES52DurSF0mNBFJIAymvhbI4fZZcQiqQ5
         eRDZrn+EBcYBV+JtvcBMbw2JNuxaHRLTiuoxAOnd2Mcsl/4JLC6CVVbcj3H/QVOZZss6
         nl3Q==
X-Gm-Message-State: AOJu0YxHNV+MggfkWwR36PjSeBw4gg/Ut2vF/Cm4RzLOVdnydV2BleFT
	Meu7nK2Wdv0hmmohMW6DSEN5YhT9eqrPVBbYk/qq4FCbQ6fVi7oEXPYj49mR67ND7aiU2JikLRw
	VTEicSlBGADWHR5SwbTH0uzY9KaeBoSHk608Mh50YKhXmjod7VxTUJvlBJ0ti10iLm7Th
X-Gm-Gg: Acq92OGzFjzuD9mW29x6NR58Vfregn2RrXb2/HgZ0Rvg+1z36cAdcZUOTbPJhf/apJ2
	fPtlD3YG2VsFFjkZB4fwYrj7arte7FQ2z6ZWDP7hHiLn1RX0ipHj7XHz5Fq8Q4iCsuIQ8JVJwch
	66nf4m342aG6XI/rGcjgVggv6UaLbWTzsKiGNZJNsq/VGhCRk4fr732bZAKuxx38hPcyXBIajyE
	3JCydVRvhlOcg+iRXRpKwQv0+w5KQNsYZoSS6MRTpjkpncDt5bwlbO4v8LGbBXDvV/C+en9A2c5
	wUfbcCvX8zNMtfJGCxCD2MXQ7icrizfCuTckJFCOBTKlinEv1eRdpQmAA/KVhkEj5EmckgCXEm6
	VD9Ltkmp1u/x7zBUesrCWkmCtMnmu5wJosWuANQiamNhOLA0Gg+KVbA==
X-Received: by 2002:a05:6a00:950d:b0:842:2f3d:dff2 with SMTP id d2e1a72fcca58-8434ce81341mr7553841b3a.34.1781371266342;
        Sat, 13 Jun 2026 10:21:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:950d:b0:842:2f3d:dff2 with SMTP id d2e1a72fcca58-8434ce81341mr7553803b3a.34.1781371265702;
        Sat, 13 Jun 2026 10:21:05 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbec5sm5390913b3a.16.2026.06.13.10.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:21:05 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 22:49:47 +0530
Subject: [PATCH RFC 05/12] mm/vmalloc: tighten failure handling under
 memory pressure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-vmalloc_maple-v1-5-0aa740bb944b@oss.qualcomm.com>
References: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
In-Reply-To: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Uladzislau Rezki <urezki@gmail.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Alice Ryhl <aliceryhl@google.com>,
        Andrew Ballance <andrewjballance@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
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
        Pranjal Arya <pranjal.arya@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781371215; l=27712;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=93nd/fp0WT0lOBo8bTdnf+a1qmT1fxj8wsunRs1e6EU=;
 b=u5NeW4Ud9Q3H5+3jTYofL7oc8m5kRtaEgxllCWom5Z0j0JW8ZN6Ht4QAizUAGKSg0IlzZP5gc
 14TKEq5dlwXDvGo3hbqVIVJiZ2SroiXTIFhM+jxPuhZStMZf5j4gbD4
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX1MRaPgo+mQ7C
 4pxlhnuY9TGgSmd+iHSomQsE6/n+3AEf0Ma+XvWqhsPkOwMoaJkkq+uzsfUhZMt9L+tWoT5k6LH
 xj3UV4U1xSa+ECE5z6Lak9RQcllS/nw=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2d9183 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=o4zA9CgbANw9Vykgm7UA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX3w/oH5Rrm51l
 BjmGltioL1m7BAXvVmctbvft+w6+w7jXJZOhwNfqUDx/IDxUL3h7gNlEPV7s4nu4eyc5uWbSccz
 pgwrxp7hchRb/GtgZJDpqE6KVmygOlJDsCMP4QhSxNiaglSCm8rxoAWa3FTffZ/9XF04jk1lZ7+
 U4vDQ908OanRQihNb3ez7KAHWe8CksC+Ae7w5PgJWDwlJydLbmcBM16z9KfvKQthAVJJw/Pwp+A
 u/aKAZMjkfQw1B9L2T1O83TLPu9mlTDjyW6qxS9yB/WzNmmZXR9FQux+q8ZM/ixYo98bhYHdnb5
 iu41kXoXP3L8Yk1S27zrqTzJq33nKSWn+hizltQTGM+WDb9xb8bDyx67jmhtzrSaeLPC7b4LXRR
 VIjcMPA8/zwEeEO+vzTMVN1AzGTTqxD8hHd46IFySPuquZtOW8dozudFC6pUhQ+76vpXsW8rJ+B
 BJAOCYrYIOVss3T02PQ==
X-Proofpoint-GUID: Q9IsKFHIa5gBCGdYF654pNyao0tY0iO1
X-Proofpoint-ORIG-GUID: Q9IsKFHIa5gBCGdYF654pNyao0tY0iO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-113003-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:pranjal.arya@oss.qualcomm.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,google.com,arm.com,linaro.org,nvidia.com,amd.com,gmail.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 63CAC67F28C

Tighten failure handling on the two paths that publish into the
maple_tree under a spinlock and have no caller-friendly way to return
-ENOMEM:

  - free_vmap_area_noflush() falls back to vmap_retry_list when
    publish_vmap_area_lazy() can't allocate maple slabs under
    GFP_NOWAIT, and reschedules drain_vmap_work to retry.

  - the alloc path rolls the busy insert back onto the retry queue
    if insert_vmap_area_busy_locked() fails, rather than leaking the
    vmap_area or panicking.

Add vmap_retry_list as a non-indexed retry queue scanned by the
allocator as an exclusion set and drained from the purge worker,
and wire the two publish-failure paths above through it.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 mm/vmalloc.c | 566 +++++++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 474 insertions(+), 92 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index c908c1a0fcd4..7feb1b182cfa 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -869,6 +869,12 @@ EXPORT_SYMBOL(vmalloc_to_pfn);
 
 static DEFINE_SPINLOCK(free_vmap_area_lock);
 static bool vmap_initialized __read_mostly;
+/*
+ * Non-index retry queue for ranges that could not be transitioned to their
+ * target maple index state in constrained paths. This queue is scanned by the
+ * allocator as an exclusion set and drained by purge workers.
+ */
+static LIST_HEAD(vmap_retry_list);
 
 /*
  * This kmem_cache is used for vmap_area objects. Instead of
@@ -1113,6 +1119,47 @@ free_mt_update_va_locked(struct vmap_area *va, unsigned long old_start,
 	return true;
 }
 
+static __always_inline void
+retry_queue_add_va_locked(struct vmap_area *va)
+{
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	/*
+	 * Keep a VA on one list at a time. Retry entries are detached from
+	 * all indexed containers before they are queued here.
+	 */
+	if (unlikely(!READ_ONCE(va->list.next) && !READ_ONCE(va->list.prev)))
+		INIT_LIST_HEAD(&va->list);
+	if (WARN_ON_ONCE(!list_empty(&va->list)))
+		return;
+	list_add_tail(&va->list, &vmap_retry_list);
+}
+
+static __always_inline bool
+retry_queue_overlap_locked(unsigned long start, unsigned long end,
+			   unsigned long *blocked_end)
+{
+	struct vmap_area *va;
+	bool overlap = false;
+
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	if (list_empty(&vmap_retry_list))
+		return false;
+
+	list_for_each_entry(va, &vmap_retry_list, list) {
+		unsigned long va_end = va->va_end - 1;
+
+		if (va->va_start > end || va_end < start)
+			continue;
+
+		overlap = true;
+		*blocked_end = max(*blocked_end, va_end);
+	}
+
+	return overlap;
+}
+
 static __always_inline void try_init_free_mt_locked(void)
 {
 	lockdep_assert_held(&free_vmap_area_lock);
@@ -1169,6 +1216,14 @@ occupied_mt_store_range_locked(unsigned long start, unsigned long end)
 	return !WARN_ON_ONCE(err);
 }
 
+static __always_inline bool
+occupied_mt_store_va_locked(struct vmap_area *va)
+{
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	return occupied_mt_store_range_locked(va->va_start, va->va_end);
+}
+
 static __always_inline bool
 occupied_mt_erase_range_locked(unsigned long start, unsigned long end)
 {
@@ -1339,7 +1394,7 @@ find_vmap_area_exceed_addr_lock(unsigned long addr, struct vmap_area **va)
 	return NULL;
 }
 
-static __always_inline void
+static __always_inline bool
 insert_vmap_area_busy_locked(struct vmap_area *va, struct vmap_node *vn)
 {
 	int err;
@@ -1349,12 +1404,12 @@ insert_vmap_area_busy_locked(struct vmap_area *va, struct vmap_node *vn)
 	try_init_busy_mt_locked(vn);
 
 	if (WARN_ON_ONCE(!vn->busy.mt_enabled))
-		return;
+		return false;
 
 	if (!validate_vmap_area_range_insert_mt_locked(&vn->busy.mt,
 						       va->va_start,
 						       va->va_end))
-		return;
+		return false;
 
 	INIT_LIST_HEAD(&va->list);
 
@@ -1364,11 +1419,11 @@ insert_vmap_area_busy_locked(struct vmap_area *va, struct vmap_node *vn)
 	if (!err) {
 		mas_store_prealloc(&mas, va);
 		mas_destroy(&mas);
-		return;
+		return true;
 	}
 
 	err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
-	WARN_ON_ONCE(err);
+	return !WARN_ON_ONCE(err);
 }
 
 static __always_inline void
@@ -1391,7 +1446,7 @@ unlink_vmap_area_busy_locked(struct vmap_area *va, struct vmap_node *vn)
 	INIT_LIST_HEAD(&va->list);
 }
 
-static __always_inline void
+static __always_inline bool
 insert_vmap_area_lazy_locked(struct vmap_area *va, struct vmap_node *vn)
 {
 	int err;
@@ -1400,12 +1455,12 @@ insert_vmap_area_lazy_locked(struct vmap_area *va, struct vmap_node *vn)
 
 	try_init_lazy_mt_locked(vn);
 	if (WARN_ON_ONCE(!vn->lazy.mt_enabled))
-		return;
+		return false;
 
 	if (!validate_vmap_area_range_insert_mt_locked(&vn->lazy.mt,
 						       va->va_start,
 						       va->va_end))
-		return;
+		return false;
 
 	INIT_LIST_HEAD(&va->list);
 
@@ -1415,11 +1470,72 @@ insert_vmap_area_lazy_locked(struct vmap_area *va, struct vmap_node *vn)
 	if (!err) {
 		mas_store_prealloc(&mas, va);
 		mas_destroy(&mas);
-		return;
+		return true;
 	}
 
 	err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
-	WARN_ON_ONCE(err);
+	return !WARN_ON_ONCE(err);
+}
+
+static __always_inline bool
+unlink_vmap_area_lazy_locked(struct vmap_area *va, struct vmap_node *vn)
+{
+	int err;
+
+	lockdep_assert_held(&vn->lazy.lock);
+
+	try_init_lazy_mt_locked(vn);
+	if (WARN_ON_ONCE(!vn->lazy.mt_enabled))
+		return false;
+
+	MA_STATE(mas, &vn->lazy.mt, va->va_start, va->va_end - 1);
+
+	err = mas_store_gfp(&mas, NULL, GFP_ATOMIC | __GFP_NOWARN);
+	if (WARN_ON_ONCE(err))
+		return false;
+
+	INIT_LIST_HEAD(&va->list);
+	return true;
+}
+
+/*
+ * Transition a VA into the lazy index and drop occupied tracking. On occupied
+ * erase failure, attempt to roll back the lazy insertion; if rollback fails we
+ * keep the lazy entry and let purge-side erase_occupied handling repair stale
+ * occupied state.
+ *
+ * Returns true when the VA remains lazy-indexed; false when it should be
+ * retried via non-index queue.
+ */
+static __always_inline bool
+publish_vmap_area_lazy(struct vmap_area *va, struct vmap_node *vn)
+{
+	bool lazy_kept = false;
+
+	spin_lock(&vn->lazy.lock);
+	if (unlikely(!insert_vmap_area_lazy_locked(va, vn))) {
+		spin_unlock(&vn->lazy.lock);
+		return false;
+	}
+
+	/*
+	 * Keep lazy.lock held while dropping occupied tracking so purge-side
+	 * lazy extraction cannot move @va to purge_list during rollback.
+	 */
+	spin_lock(&free_vmap_area_lock);
+	try_init_occupied_mt_locked();
+	if (likely(occupied_mt_erase_va_locked(va))) {
+		spin_unlock(&free_vmap_area_lock);
+		spin_unlock(&vn->lazy.lock);
+		return true;
+	}
+	spin_unlock(&free_vmap_area_lock);
+
+	if (unlikely(!unlink_vmap_area_lazy_locked(va, vn)))
+		lazy_kept = true;
+	spin_unlock(&vn->lazy.lock);
+
+	return lazy_kept;
 }
 
 static __always_inline bool
@@ -1437,7 +1553,9 @@ lazy_vmap_areas_empty_locked(struct vmap_node *vn)
 static __always_inline void
 move_lazy_vmap_areas_to_purge_locked(struct vmap_node *vn)
 {
-	struct vmap_area *va;
+	LIST_HEAD(move_list);
+	struct vmap_area *va, *n_va;
+	int err;
 
 	lockdep_assert_held(&vn->lazy.lock);
 
@@ -1448,12 +1566,25 @@ move_lazy_vmap_areas_to_purge_locked(struct vmap_node *vn)
 	MA_STATE(mas, &vn->lazy.mt, 0, 0);
 
 	mas_for_each(&mas, va, ULONG_MAX)
-		list_add_tail(&va->list, &vn->purge_list);
+		list_add_tail(&va->list, &move_list);
+
+	/*
+	 * Erase ranges one-by-one and move only successfully erased entries to
+	 * purge_list. This avoids destroy/reinit churn and keeps lazy index
+	 * coherence if an erase operation fails under pressure.
+	 */
+	list_for_each_entry_safe(va, n_va, &move_list, list) {
+		MA_STATE(mas_erase, &vn->lazy.mt, va->va_start, va->va_end - 1);
+
+		err = mas_store_gfp(&mas_erase, NULL, GFP_ATOMIC | __GFP_NOWARN);
+		if (unlikely(err)) {
+			WARN_ON_ONCE(err);
+			list_del_init(&va->list);
+			continue;
+		}
 
-	__mt_destroy(&vn->lazy.mt);
-	mt_init_flags(&vn->lazy.mt, MT_FLAGS_LOCK_EXTERN);
-	mt_set_external_lock(&vn->lazy.mt, &vn->lazy.lock);
-	vn->lazy.mt_enabled = true;
+		list_move_tail(&va->list, &vn->purge_list);
+	}
 }
 
 static __always_inline bool
@@ -1463,11 +1594,6 @@ insert_vmap_area_free_locked(struct vmap_area *va)
 
 	lockdep_assert_held(&free_vmap_area_lock);
 
-	try_init_free_mt_locked();
-
-	if (unlikely(!free_mt_supported()))
-		return false;
-
 	prev = __find_vmap_area_enclose_addr_mt(va->va_start, &free_vmap_area_mt);
 	if (prev && WARN_ON_ONCE(prev->va_end > va->va_start))
 		return false;
@@ -1512,16 +1638,16 @@ merge_or_add_vmap_area_free_locked(struct vmap_area *va)
 	if (left && WARN_ON_ONCE(left->va_end > new_start))
 		return NULL;
 
+	right = __find_vmap_area_exceed_addr_mt(new_start, &free_vmap_area_mt);
+	if (right && WARN_ON_ONCE(right->va_start < new_end))
+		return NULL;
+
 	if (left && left->va_end == new_start) {
 		new_start = left->va_start;
 		unlink_vmap_area_free_locked(left);
 		kmem_cache_free(vmap_area_cachep, left);
 	}
 
-	right = __find_vmap_area_exceed_addr_mt(new_start, &free_vmap_area_mt);
-	if (right && WARN_ON_ONCE(right->va_start < new_end))
-		return NULL;
-
 	if (right && right->va_start == new_end) {
 		new_end = right->va_end;
 		unlink_vmap_area_free_locked(right);
@@ -1580,9 +1706,28 @@ occupied_mt_find_hole_window_locked(unsigned long min, unsigned long max,
 		if (check_add_overflow(candidate, size - 1, &candidate_end))
 			return false;
 
-		if (candidate >= search && candidate_end <= hole_end) {
-			*addr = candidate;
-			return true;
+		while (candidate >= search && candidate_end <= hole_end) {
+			unsigned long blocked_end = 0;
+
+			if (!retry_queue_overlap_locked(candidate, candidate_end,
+							&blocked_end)) {
+				*addr = candidate;
+				return true;
+			}
+
+			if (blocked_end >= hole_end)
+				break;
+
+			blocked_end++;
+			if (!blocked_end)
+				return false;
+
+			candidate = ALIGN(blocked_end, align);
+			if (candidate < blocked_end)
+				return false;
+
+			if (check_add_overflow(candidate, size - 1, &candidate_end))
+				return false;
 		}
 
 		if (hole_end == ULONG_MAX)
@@ -1828,6 +1973,70 @@ restore_allocated_vmap_range_free_locked(unsigned long start, unsigned long end)
 	return true;
 }
 
+/*
+ * Roll back an allocated range when busy insertion fails. Prefer returning
+ * it to the free tree; if that is not possible, keep occupied tracking so
+ * the range stays reserved and allocator state remains coherent.
+ *
+ * Returns true when @va remains referenced by the free tree and must not be
+ * freed by the caller. Returns false when the caller owns @va.
+ */
+static __always_inline bool
+rollback_busy_insert_failed_alloc_locked(struct vmap_area *va)
+{
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	if (!insert_vmap_area_free_locked(va)) {
+		retry_queue_add_va_locked(va);
+		return true;
+	}
+
+	if (occupied_mt_erase_va_locked(va))
+		return true;
+
+	if (free_mt_erase_va_locked(va)) {
+		retry_queue_add_va_locked(va);
+		return true;
+	}
+
+	/*
+	 * Occupied erase failed and we could not remove the temporary free
+	 * insertion. Keep @va alive: both trees still reference this range.
+	 */
+	return true;
+}
+
+/*
+ * Reinsert @va into the free index after occupied erase. On failure, place the
+ * range on the non-index retry queue and best-effort restore occupied tracking.
+ *
+ * Return: free-tracked @va on success, NULL when queued for retry.
+ */
+static __always_inline struct vmap_area *
+reinsert_or_queue_vmap_area_locked(struct vmap_area *va)
+{
+	struct vmap_area *tracked;
+
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	tracked = merge_or_add_vmap_area_free_locked(va);
+	if (tracked)
+		return tracked;
+
+	if (insert_vmap_area_free_locked(va))
+		return va;
+
+	/*
+	 * Retry queue acts as allocation exclusion even if occupied restore
+	 * fails under pressure.
+	 */
+	if (WARN_ON_ONCE(!occupied_mt_store_va_locked(va)))
+		INIT_LIST_HEAD(&va->list);
+
+	retry_queue_add_va_locked(va);
+	return NULL;
+}
+
 /*
  * Returns a start address of the newly allocated area, if success.
  * Otherwise an error value is returned that indicates failure.
@@ -1840,22 +2049,42 @@ __alloc_vmap_area(unsigned long size, unsigned long align,
 	unsigned long nva_start_addr;
 	unsigned long nva_end_addr;
 	struct vmap_area *va;
+	MA_STATE(mas, &free_vmap_area_mt, 0, 0);
 
 	lockdep_assert_held(&free_vmap_area_lock);
 
 	try_init_occupied_mt_locked();
 
-	if (WARN_ON_ONCE(!occupied_mt_supported()))
+	if (WARN_ON_ONCE(!size || !align || vstart >= vend))
+		return -EINVAL;
+	if (size > vend - vstart)
 		return -ENOENT;
 
-	nva_start_addr = occupied_mt_find_hole_lowest_locked(size, align,
-							     vstart, vend);
-	if (IS_ERR_VALUE(nva_start_addr))
-		return nva_start_addr;
-	nva_end_addr = nva_start_addr + size;
+	/*
+	 * Free maple index is authoritative for allocatable ranges; lazy and
+	 * retry entries are intentionally excluded from it.
+	 */
+	mas_set(&mas, vstart);
+	va = mas_find(&mas, vend - 1);
+	while (va) {
+		unsigned long search_start = max(va->va_start, vstart);
+		unsigned long candidate_end;
+
+		nva_start_addr = ALIGN(search_start, align);
+		if (nva_start_addr < search_start)
+			return -ERANGE;
 
-	va = __find_vmap_area_mt(nva_start_addr, &free_vmap_area_mt);
-	if (WARN_ON_ONCE(!va))
+		if (check_add_overflow(nva_start_addr, size - 1, &candidate_end))
+			return -ERANGE;
+
+		if (candidate_end < vend && candidate_end < va->va_end) {
+			nva_end_addr = candidate_end + 1;
+			break;
+		}
+
+		va = mas_next(&mas, vend - 1);
+	}
+	if (!va)
 		return -ENOENT;
 
 	ret = va_clip(va, nva_start_addr, size);
@@ -1883,6 +2112,7 @@ __alloc_vmap_area(unsigned long size, unsigned long align,
 static void free_vmap_area(struct vmap_area *va)
 {
 	struct vmap_node *vn = addr_to_node(va->va_start);
+	bool queued_retry = false;
 
 	/*
 	 * Remove from the busy tree/list.
@@ -1895,9 +2125,19 @@ static void free_vmap_area(struct vmap_area *va)
 	 * Insert/Merge it back to the free tree/list.
 	 */
 	spin_lock(&free_vmap_area_lock);
-	WARN_ON_ONCE(!occupied_mt_erase_va_locked(va));
-	WARN_ON_ONCE(!merge_or_add_vmap_area_free_locked(va));
+	if (unlikely(!occupied_mt_erase_va_locked(va))) {
+		retry_queue_add_va_locked(va);
+		queued_retry = true;
+		spin_unlock(&free_vmap_area_lock);
+		goto out_schedule_retry;
+	}
+	if (!reinsert_or_queue_vmap_area_locked(va))
+		queued_retry = true;
 	spin_unlock(&free_vmap_area_lock);
+
+out_schedule_retry:
+	if (queued_retry)
+		schedule_work(&drain_vmap_work);
 }
 
 static inline void
@@ -2119,6 +2359,7 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 	va->va_end = addr + size;
 	va->vm = NULL;
 	va->flags = (va_flags | vn_id);
+	INIT_LIST_HEAD(&va->list);
 
 	if (vm) {
 		vm->addr = (void *)va->va_start;
@@ -2129,8 +2370,29 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 	vn = addr_to_node(va->va_start);
 
 	spin_lock(&vn->busy.lock);
-	insert_vmap_area_busy_locked(va, vn);
+	ret = insert_vmap_area_busy_locked(va, vn) ? 0 : -ENOMEM;
 	spin_unlock(&vn->busy.lock);
+	if (ret) {
+		bool keep_va = false;
+
+		va->vm = NULL;
+		spin_lock(&free_vmap_area_lock);
+		keep_va = rollback_busy_insert_failed_alloc_locked(va);
+		spin_unlock(&free_vmap_area_lock);
+
+		if (!keep_va)
+			kmem_cache_free(vmap_area_cachep, va);
+		else
+			schedule_work(&drain_vmap_work);
+
+		if (vm) {
+			vm->addr = NULL;
+			vm->size = 0;
+			vm->requested_size = 0;
+		}
+
+		return ERR_PTR(ret);
+	}
 
 	BUG_ON(!IS_ALIGNED(va->va_start, align));
 	BUG_ON(va->va_start < vstart);
@@ -2221,21 +2483,40 @@ reclaim_list_global(struct list_head *head, bool erase_occupied,
 {
 	struct vmap_area *va, *n;
 	bool ok = true;
+	bool queue_retry_work = false;
 
 	if (list_empty(head))
 		return true;
 
 	spin_lock(&free_vmap_area_lock);
 	list_for_each_entry_safe(va, n, head, list) {
+		bool occupied_erased = false;
+
 		list_del_init(&va->list);
-		if (erase_occupied)
-			WARN_ON_ONCE(!occupied_mt_erase_va_locked(va));
-		if (WARN_ON_ONCE(!merge_or_add_vmap_area_free_locked(va))) {
-			list_add_tail(&va->list, failed);
-			ok = false;
+		if (erase_occupied) {
+			if (WARN_ON_ONCE(!occupied_mt_erase_va_locked(va))) {
+				list_add_tail(&va->list, failed);
+				ok = false;
+				continue;
+			}
+
+			occupied_erased = true;
+		}
+			if (WARN_ON_ONCE(!merge_or_add_vmap_area_free_locked(va))) {
+				if (occupied_erased &&
+				    WARN_ON_ONCE(!occupied_mt_store_va_locked(va))) {
+					retry_queue_add_va_locked(va);
+					queue_retry_work = true;
+					ok = false;
+					continue;
+				}
+				list_add_tail(&va->list, failed);
+				ok = false;
 		}
 	}
 	spin_unlock(&free_vmap_area_lock);
+	if (queue_retry_work)
+		schedule_work(&drain_vmap_work);
 
 	return ok;
 }
@@ -2330,6 +2611,7 @@ static void purge_vmap_node(struct work_struct *work)
 		struct vmap_node, purge_work);
 	unsigned long nr_purged_pages = 0;
 	unsigned long nr_failed_pages = 0;
+	bool queued_retry = false;
 	struct vmap_area *va, *n_va;
 	LIST_HEAD(local_list);
 	LIST_HEAD(local_failed);
@@ -2358,7 +2640,7 @@ static void purge_vmap_node(struct work_struct *work)
 
 	atomic_long_sub(nr_purged_pages, &vmap_lazy_nr);
 
-	WARN_ON_ONCE(!reclaim_list_global(&local_list, false, &local_failed));
+	WARN_ON_ONCE(!reclaim_list_global(&local_list, true, &local_failed));
 	list_for_each_entry_safe(va, n_va, &local_failed, list) {
 		unsigned int vn_id = decode_vn_id(va->flags);
 		struct vmap_node *dst;
@@ -2367,14 +2649,60 @@ static void purge_vmap_node(struct work_struct *work)
 		dst = is_vn_id_valid(vn_id) ?
 			id_to_node(vn_id) : addr_to_node(va->va_start);
 
-		spin_lock(&dst->lazy.lock);
-		insert_vmap_area_lazy_locked(va, dst);
-		spin_unlock(&dst->lazy.lock);
-		nr_failed_pages += va_size(va) >> PAGE_SHIFT;
+		if (publish_vmap_area_lazy(va, dst)) {
+			nr_failed_pages += va_size(va) >> PAGE_SHIFT;
+			continue;
+		}
+
+		spin_lock(&free_vmap_area_lock);
+		retry_queue_add_va_locked(va);
+		spin_unlock(&free_vmap_area_lock);
+		queued_retry = true;
 	}
 
 	if (nr_failed_pages)
 		atomic_long_add(nr_failed_pages, &vmap_lazy_nr);
+
+	if (queued_retry)
+		schedule_work(&drain_vmap_work);
+}
+
+static void drain_vmap_retry_queue(void)
+{
+	struct vmap_area *va, *n_va;
+	bool queued_retry = false;
+	LIST_HEAD(local_retry);
+
+	spin_lock(&free_vmap_area_lock);
+	if (list_empty(&vmap_retry_list)) {
+		spin_unlock(&free_vmap_area_lock);
+		return;
+	}
+
+	list_splice_init(&vmap_retry_list, &local_retry);
+	spin_unlock(&free_vmap_area_lock);
+
+	list_for_each_entry_safe(va, n_va, &local_retry, list) {
+		struct vmap_node *vn = addr_to_node(va->va_start);
+
+		list_del_init(&va->list);
+		if (publish_vmap_area_lazy(va, vn)) {
+			atomic_long_add(va_size(va) >> PAGE_SHIFT, &vmap_lazy_nr);
+			continue;
+		}
+
+		spin_lock(&free_vmap_area_lock);
+		retry_queue_add_va_locked(va);
+		spin_unlock(&free_vmap_area_lock);
+		queued_retry = true;
+	}
+
+	/*
+	 * Ensure retry-only backlog keeps making progress even if no new free
+	 * events arrive to trigger another purge pass.
+	 */
+	if (queued_retry)
+		schedule_work(&drain_vmap_work);
 }
 
 /*
@@ -2392,6 +2720,9 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
 
 	lockdep_assert_held(&vmap_purge_lock);
 
+	/* Retry queued transitions first, so they can join this purge cycle. */
+	drain_vmap_retry_queue();
+
 	/*
 	 * Use cpumask to mark which node has to be processed.
 	 */
@@ -2489,6 +2820,7 @@ static void free_vmap_area_noflush(struct vmap_area *va)
 {
 	unsigned long nr_lazy_max = lazy_max_pages();
 	unsigned long va_start = va->va_start;
+	unsigned long nr_pages = va_size(va) >> PAGE_SHIFT;
 	unsigned int vn_id = decode_vn_id(va->flags);
 	struct vmap_node *vn;
 	unsigned long nr_lazy;
@@ -2496,9 +2828,6 @@ static void free_vmap_area_noflush(struct vmap_area *va)
 	if (WARN_ON_ONCE(!list_empty(&va->list)))
 		return;
 
-	nr_lazy = atomic_long_add_return_relaxed(va_size(va) >> PAGE_SHIFT,
-					 &vmap_lazy_nr);
-
 	/*
 	 * If it was request by a certain node we would like to
 	 * return it to that node, i.e. its pool for later reuse.
@@ -2506,18 +2835,20 @@ static void free_vmap_area_noflush(struct vmap_area *va)
 	vn = is_vn_id_valid(vn_id) ?
 		id_to_node(vn_id):addr_to_node(va->va_start);
 
-	/*
-	 * Drop occupied-range visibility as soon as the area is freed, even
-	 * though coalescing/reinsertion into the free index remains deferred.
-	 */
-	spin_lock(&free_vmap_area_lock);
-	try_init_occupied_mt_locked();
-	WARN_ON_ONCE(!occupied_mt_erase_va_locked(va));
-	spin_unlock(&free_vmap_area_lock);
+	if (publish_vmap_area_lazy(va, vn)) {
+		nr_lazy = atomic_long_add_return_relaxed(nr_pages, &vmap_lazy_nr);
+	} else {
+		spin_lock(&free_vmap_area_lock);
+		retry_queue_add_va_locked(va);
+		nr_lazy = atomic_long_read(&vmap_lazy_nr);
+		spin_unlock(&free_vmap_area_lock);
 
-	spin_lock(&vn->lazy.lock);
-	insert_vmap_area_lazy_locked(va, vn);
-	spin_unlock(&vn->lazy.lock);
+		/*
+		 * Retry transitions are drained from purge context; poke it
+		 * immediately so transient pressure does not prolong retention.
+		 */
+		schedule_work(&drain_vmap_work);
+	}
 
 	trace_free_vmap_area_noflush(va_start, nr_lazy, nr_lazy_max);
 
@@ -5023,6 +5354,8 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 	struct vmap_area **vas, *va;
 	struct vm_struct **vms;
 	int area, area2, last_area, term_area;
+	int inserted_busy = 0;
+	bool queued_retry = false;
 	unsigned long base, start, size, end, last_end, orig_start, orig_end;
 	bool purged = false;
 
@@ -5061,6 +5394,8 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 
 	for (area = 0; area < nr_vms; area++) {
 		vas[area] = kmem_cache_zalloc(vmap_area_cachep, GFP_KERNEL);
+		if (vas[area])
+			INIT_LIST_HEAD(&vas[area]->list);
 		vms[area] = kzalloc_obj(struct vm_struct);
 		if (!vas[area] || !vms[area])
 			goto err_free;
@@ -5170,10 +5505,14 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 		struct vmap_node *vn = addr_to_node(vas[area]->va_start);
 
 		spin_lock(&vn->busy.lock);
-		insert_vmap_area_busy_locked(vas[area], vn);
+		if (unlikely(!insert_vmap_area_busy_locked(vas[area], vn))) {
+			spin_unlock(&vn->busy.lock);
+			goto err_unwind_busy;
+		}
 		setup_vmalloc_vm(vms[area], vas[area], VM_ALLOC,
 				 pcpu_get_vm_areas);
 		spin_unlock(&vn->busy.lock);
+		inserted_busy++;
 	}
 
 	/*
@@ -5197,33 +5536,43 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 	while (area--) {
 		orig_start = vas[area]->va_start;
 		orig_end = vas[area]->va_end;
-		WARN_ON_ONCE(!occupied_mt_erase_va_locked(vas[area]));
-		va = merge_or_add_vmap_area_free_locked(vas[area]);
-		WARN_ON_ONCE(!va);
-		if (va)
-			kasan_release_vmalloc(orig_start, orig_end,
-					      va->va_start, va->va_end,
-					      KASAN_VMALLOC_PAGE_RANGE |
-					      KASAN_VMALLOC_TLB_FLUSH);
+		if (occupied_mt_erase_va_locked(vas[area])) {
+			va = reinsert_or_queue_vmap_area_locked(vas[area]);
+			if (va)
+				kasan_release_vmalloc(orig_start, orig_end,
+						      va->va_start, va->va_end,
+						      KASAN_VMALLOC_PAGE_RANGE |
+						      KASAN_VMALLOC_TLB_FLUSH);
+			else
+				queued_retry = true;
+		} else {
+			retry_queue_add_va_locked(vas[area]);
+			queued_retry = true;
+		}
 		vas[area] = NULL;
 	}
 
 overflow:
 	spin_unlock(&free_vmap_area_lock);
+	if (queued_retry)
+		schedule_work(&drain_vmap_work);
+
 	if (!purged) {
 		reclaim_and_purge_vmap_areas();
 		purged = true;
 
-		/* Before "retry", check if we recover. */
-		for (area = 0; area < nr_vms; area++) {
-			if (vas[area])
-				continue;
-
-			vas[area] = kmem_cache_zalloc(
-				vmap_area_cachep, GFP_KERNEL);
-			if (!vas[area])
-				goto err_free;
-		}
+			/* Before "retry", check if we recover. */
+			for (area = 0; area < nr_vms; area++) {
+				if (vas[area])
+					continue;
+
+				vas[area] = kmem_cache_zalloc(vmap_area_cachep,
+							      GFP_KERNEL);
+				if (vas[area])
+					INIT_LIST_HEAD(&vas[area]->list);
+				if (!vas[area])
+					goto err_free;
+			}
 
 		goto retry;
 	}
@@ -5240,6 +5589,16 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 	kfree(vms);
 	return NULL;
 
+err_unwind_busy:
+	while (inserted_busy--) {
+		struct vmap_node *vn = addr_to_node(vas[inserted_busy]->va_start);
+
+		spin_lock(&vn->busy.lock);
+		unlink_vmap_area_busy_locked(vas[inserted_busy], vn);
+		spin_unlock(&vn->busy.lock);
+	}
+	goto err_free_shadow;
+
 err_free_shadow:
 	spin_lock(&free_vmap_area_lock);
 	/*
@@ -5250,17 +5609,25 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 	for (area = 0; area < nr_vms; area++) {
 		orig_start = vas[area]->va_start;
 		orig_end = vas[area]->va_end;
-		WARN_ON_ONCE(!occupied_mt_erase_va_locked(vas[area]));
-		va = merge_or_add_vmap_area_free_locked(vas[area]);
-		WARN_ON_ONCE(!va);
-		if (va)
-			kasan_release_vmalloc(orig_start, orig_end,
-				va->va_start, va->va_end,
-				KASAN_VMALLOC_PAGE_RANGE | KASAN_VMALLOC_TLB_FLUSH);
+		if (occupied_mt_erase_va_locked(vas[area])) {
+			va = reinsert_or_queue_vmap_area_locked(vas[area]);
+			if (va)
+				kasan_release_vmalloc(orig_start, orig_end,
+						      va->va_start, va->va_end,
+						      KASAN_VMALLOC_PAGE_RANGE |
+						      KASAN_VMALLOC_TLB_FLUSH);
+			else
+				queued_retry = true;
+		} else {
+			retry_queue_add_va_locked(vas[area]);
+			queued_retry = true;
+		}
 		vas[area] = NULL;
 		kfree(vms[area]);
 	}
 	spin_unlock(&free_vmap_area_lock);
+	if (queued_retry)
+		schedule_work(&drain_vmap_work);
 	kfree(vas);
 	kfree(vms);
 	return NULL;
@@ -5364,6 +5731,13 @@ static void show_purge_info(struct seq_file *m)
 				   va_size(va));
 		spin_unlock(&vn->lazy.lock);
 	}
+
+	spin_lock(&free_vmap_area_lock);
+	list_for_each_entry(va, &vmap_retry_list, list)
+		seq_printf(m, "0x%pK-0x%pK %7ld retry vm_area\n",
+			   (void *)va->va_start, (void *)va->va_end,
+			   va_size(va));
+	spin_unlock(&free_vmap_area_lock);
 }
 
 static int vmalloc_info_show(struct seq_file *m, void *p)
@@ -5635,13 +6009,21 @@ void __init vmalloc_init(void)
 
 		vn = addr_to_node(va->va_start);
 		spin_lock(&vn->busy.lock);
-		insert_vmap_area_busy_locked(va, vn);
+		if (unlikely(!insert_vmap_area_busy_locked(va, vn))) {
+			spin_unlock(&vn->busy.lock);
+			panic("%s: failed to import busy range %#lx-%#lx\n",
+			      __func__, va->va_start, va->va_end);
+		}
 		spin_unlock(&vn->busy.lock);
 
 		spin_lock(&free_vmap_area_lock);
 		try_init_occupied_mt_locked();
-		WARN_ON_ONCE(!occupied_mt_store_range_locked(va->va_start,
-							     va->va_end));
+		if (WARN_ON_ONCE(!occupied_mt_store_range_locked(va->va_start,
+								 va->va_end))) {
+			spin_unlock(&free_vmap_area_lock);
+			panic("%s: failed to import occupied range %#lx-%#lx\n",
+			      __func__, va->va_start, va->va_end);
+		}
 		spin_unlock(&free_vmap_area_lock);
 	}
 

-- 
2.34.1


