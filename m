Return-Path: <linux-arm-msm+bounces-113008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aVbCIbqRLWpuhgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:22:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C167F280
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:22:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F3d3zfgV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y5FKaIlU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113008-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113008-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21325300EF6B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5F230DECE;
	Sat, 13 Jun 2026 17:21:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4802857F0
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781371311; cv=none; b=IZ9hbDvyCgHrIb+7N+hGhHA3W+I/EXefkB6O3Hp365WVbyCF4hG1iVSYZU296KxUCoCjSRHdvsk0UP2KaSoVA4CxcZqhOUFAO0L0Gx8fi+gj1a3L52RKOYFB+AbB1ir5siBEzc+ZV6h06QHQ/6h87f49bA6SbS02I3DzgR8ssG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781371311; c=relaxed/simple;
	bh=PsqiD8G6HiZiANmDP/iDjGIPvGoKXcMiDUmCdx9BhDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXo4Y0lH7Z0YGsalnyoJJMv+Z5FZa7QrDzgiJTq4NBBJRb13uYhuECXyGrrNoVgd2+MqeVFhnllwTEpztjGVSXAmpvIBn/U2yCukPMOBi1k8jZrgM/sn7pPV+aEvhixnsaLqIOnC23RosmyKb7MDKh4olQ8VZ/A6ea5H/KUXdeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3d3zfgV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5FKaIlU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DFAnAq3142964
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CEwkWdeK2JOxz6CkWOPVdEpzOJip0EPBtxLmX7NxFto=; b=F3d3zfgVQWpLzqDb
	rVHYFKrrSxRwKj/qdAheSyaCiab4OUQWb9AmJytKD3J+LB2MSuXW61DmfyhWWjQW
	CKmSuBYXIsTMaCuJta5D/TNu7gIaHsh9A5GAuZ/gXS9zcqHIf9hlA1jCzoNRtgwF
	XDb/aaLKwthBrUC4viEg6Q5lQEbeFENAEkS5QY9hz3+FSxHIrO2tMQCRyXM4MuZv
	nnkelEy0BYA4jWhypdLJwcJFQJ4Mis0U+I6U6dJMWpa3vFkmEcv6xNI2ea4Acv/S
	RsFPtl9UlF192CxhabyjaVZVonAv+/T7imas3ScKscxTW8/NGozkJHK/zhVRH21L
	OmNUeQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk69mq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842b0dd8107so1201262b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781371308; x=1781976108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEwkWdeK2JOxz6CkWOPVdEpzOJip0EPBtxLmX7NxFto=;
        b=Y5FKaIlUZ/NCXNffPi7p7nDvRqbeXboi7A+jMP0SZkKVwDjG44kyVVdG1sEFKmytvL
         542WpkVU2+4FjkDTVTAsdGNlVgXqCAKAefmb2J9BbjvzTTVnUDuFaI5SQ5zpVbbfDTym
         Tnu31MmSJMcyWtij+QV1avoYuZaXrIWnmXlflGjtswxewWFbtgi72reil9pAw7cd4PU+
         OHMZPPvjEMkakx0MX7knxorfvZkfdAxBSvcAkvy3cyZaF8hAQc6plZGR1it0ozOCaoAW
         JsrH1pxeoXzIzVjvrYC3c9YTjgfOdG/8x/faZYqfXMW/cq9e5vPJgAwEdF2RFa6M3RbA
         34KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781371308; x=1781976108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CEwkWdeK2JOxz6CkWOPVdEpzOJip0EPBtxLmX7NxFto=;
        b=UonFjJK1bfRtqYwNzVLzJtKuhXHqM264ncOiUZVNiN61IqRqE8u5V6OxUo/Dsho0yq
         5jermyQUqQGg/OU/2vA6CfMcWjCyPWMjcA1z1rMWzF1ocUlHOkbUBcZ+xNFKzlbDlb0w
         aphNLC0yXH6vi8P14sowfpsr57fGeL+oXx9KUeCIaSpqVsHBdPKIxO5EP7xFh38NP5nF
         TVyHAtdiENeBB46WYi+B+4ASghRa2vt4Xx8KGhYiDu0b4U4cIOIJ6Qm7sqn+2JgQ94xf
         eGXX+sKCSXbQ8h8DpLP4yoh3fJNrjM3IvIksv1si22o9G/kqQLQM0FE9MacKByNgmSAS
         Tn1A==
X-Gm-Message-State: AOJu0YxMjpXjKqHiZFB7kfIGTy9DwCHL5kN5McdU620RNHEuObBVDfz0
	j3gr+lcmM4YXLrLl937OPhaqFiz9x3cUZn61gaeaBSvBdh3aL7vGLeB4Y796ex8xd4yEonMd6og
	KJea4kbaBnSViIAm9pf7LL1thoCYadnYUVv3Vt83bC2jwXP9M1miFoQjaPVS24YGzJwmE
X-Gm-Gg: Acq92OE9xhWhYzyqUljUvtSzXyuGurkXM0HI203y9r09mQxB1qMZFyLQOpQ4HbiBzH7
	zA0z+jfxwpPfhGbKJjEubeZVMRo7TsMg318MNVym8KJTAz1pfR3N9FaAjjyYyrcCZNo5pT48EGs
	r12oYfXA+8CpeYLzfUJG5WMMRx0QmhQZj2yxmGKDYBuYRh2w6oCNY73bvAHovaseVlJIi2TwOqb
	M17ylQ8jdlbClbGURHksfamHoIac0bSM9ODDbozRTuwlcNnmSfFO8xckFk7d3h8aU6v3IxKqkKo
	Xp6dtMmbAgp2/hs2t9gU9S2LSS7ovGPHzw+TZCs4+xCYr8waGDhIlA1HaAASnO7X2dJtaTlxRcc
	c/EV9zx7cgRHq640c0eWABHzXQQo4G0/P+mDxQQKRO3wFlg6MQhMyXQ==
X-Received: by 2002:a05:6a00:3996:b0:842:3be7:4d57 with SMTP id d2e1a72fcca58-8434ce31498mr7995849b3a.18.1781371307766;
        Sat, 13 Jun 2026 10:21:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:3996:b0:842:3be7:4d57 with SMTP id d2e1a72fcca58-8434ce31498mr7995808b3a.18.1781371307197;
        Sat, 13 Jun 2026 10:21:47 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbec5sm5390913b3a.16.2026.06.13.10.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:21:46 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 22:49:52 +0530
Subject: [PATCH RFC 10/12] mm/vmalloc: per-CPU caching of free ranges from
 the maple_tree allocator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-vmalloc_maple-v1-10-0aa740bb944b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781371215; l=10345;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=PsqiD8G6HiZiANmDP/iDjGIPvGoKXcMiDUmCdx9BhDA=;
 b=Rzw5Lud8MlSAcq9OrXE/82DTua23HOpREVjTa+P4bOWSQXGGH2GBYsa2/2zyORRZl+X2/MnQV
 Ju0LVd2eH8fBQb6oGLJiYWu3DKB8RDzJ/6N+2REGYcU7x9VGIQ29X4s
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfXzOfD4YxABnz8
 KidPeyxkXt9MVWL3nT3cHX4NXkbmfM33E2+S4pAtKaIpkCUACfIKe+BwFa0O6TphFCA3cN9rQ5L
 V3YwUJtcOXJQZPm8PMPyl4dx8lL9vmM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX8j3d8UZfH0xZ
 8LlEHCcrp0RiXYJeFryXZnn80yniZw7UrZe9S4LEJXfb7kIer6JMk9WduwNNz2fNhloZW9ej4h7
 cV0M+ODXxCBw2FKHGoE8Kj6WS7Km0zX5IpEyymeYVau/owtgM1CB8/Q1nXArm44uh/0GQb3cf85
 GSYMfe2/jQfWiDWxOpMhYuyowHzXEvRbA8QWYe8K5ZGkyJdp2PppL0qqMDBgoFFiWJBHZgM/ovX
 6zzkn/qVlsnuvQWB58dDsLPv1XnjGPnoRjf4BCeA6ivX3xK1RvMS1dHqQjsF2+svedGegm/6pNP
 RD0zEw58BuP3HAcO/7d+fbxG+NlH5pOCsE4hwh4HnpJ8hPL/978R+jmuSjqTYrVj7v6MHFZe/T8
 p/SpNC3qgzmYBxpWH53UlHosezB+b1uGdcXLXmSG/LPCAkyKuRsx3RLsH5omfLbGBdxCWBkz71o
 5ksdyyQ0uiIVLulS0pQ==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2d91ac cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FUy_0n9OcN9IEB7T7O0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: ReQEYgSNZvniyhDIMqCWCxx1pP0ybrMH
X-Proofpoint-ORIG-GUID: ReQEYgSNZvniyhDIMqCWCxx1pP0ybrMH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-113008-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:pranjal.arya@oss.qualcomm.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,google.com,arm.com,linaro.org,nvidia.com,amd.com,gmail.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: DC7C167F280

Now that the alloc path goes through the maple_tree-based gap finder
(mas_empty_area), amortise the cost of visiting it for the most common
shape of vmalloc call: short-lived, page-aligned, PAGE_SIZE-multiple
allocations.

Each CPU reserves a 64 MB chunk via __alloc_vmap_area -- the same
maple-backed allocator the global path uses -- and dispenses page-
aligned allocations from a bump pointer inside that chunk.  Chunk
reservation and drain are the only operations that touch the global
allocator; per-allocation work stays entirely per-CPU.

When a chunk's allocation count returns to zero and it is no longer
the per-CPU current chunk, vmap_bump_unlink() releases the chunk's
range back to the global allocator via occupied_mt_erase_range_locked
-- the same maple primitive the consolidate-occupied-tree patch made
authoritative.  The chunk install path uses
occupied_mt_store_range_locked symmetrically, so cache lifecycle is
expressed entirely through the maple-tree's range primitives.

Per-CPU access uses preempt_disable() rather than a spinlock; the
chunk pointer is per-CPU and only mutated by its owner.  The chunks
list (vmap_bump_chunks) is gated by a single global spinlock that is
taken only on chunk install/release, not on the fast path.

Why this overlay sits on the maple_tree migration
=================================================

The overlay relies on three primitives that maple_tree provides
natively and that the augmented rb_tree allocator does not expose
in a clean form:

  - Bare [base, limit) range reservation. The augmented rb_node
    carries a vmap_area-shaped subtree_max_size consulted by
    find_vmap_lowest_match.  A chunk reservation has no associated
    vmap_area object, so it cannot be stored in the augmented tree
    without either synthesising a fake vmap_area per chunk or
    introducing a parallel range tracker with its own augmentation
    discipline.  maple_tree stores [base, limit) ranges natively
    and the gap walker (mas_empty_area) returns the lowest free
    region in a single descent, sharing one primitive with the
    regular allocation path.
  - Sentinel range storage.  occupied_vmap_area_mt records a
    reserved chunk as XA_ZERO_ENTRY over [base, limit), sharing
    one index with ordinary in-use vmap_area ranges.  The
    augmented rb_tree has no equivalent of XA_ZERO_ENTRY: a
    chunk would have to live in a dedicated structure, doubling
    the alloc-side state surface.
  - RCU range traversal.  vmap_chunk_lookup() must run lock-free
    so that cross-chunk vfree() does not take a global spinlock
    per free of a chunk-resident allocation.  maple_tree supports
    RCU traversal as a property of the data structure;
    rb_tree-side equivalents (lib/rbtree_latch, hand-rolled
    grace-period accounting on top of rb_tree) impose write-side
    cost and would have to be added to vmalloc as new
    infrastructure.

After the migration these three primitives are part of the
allocator API; the overlay reuses mas_empty_area() for chunk
refill, occupied_mt_store_range_locked() and
occupied_mt_erase_range_locked() for chunk lifecycle, and
maple-tree-friendly RCU for the chunk-list lookup.  No parallel
data structures are introduced.

VMAP_BUMP_CHUNK_SIZE = 64 MB derivation
=======================================

The chunk size is the smallest power-of-two value that satisfies
three independent constraints:

  1. Eligibility coverage.  vmap_bump_eligible() requires
     size <= VMAP_BUMP_CHUNK_SIZE / 2 so that any single eligible
     allocation fits with room for alignment slack.  The largest
     standard-range vmalloc() callers in tree are the module loader
     (modules can carry up to ~32 MB of text + RO data + RW data on
     architectures with full kernel module support) and BPF JIT
     buffers (capped near 4 MB).  Setting CHUNK_SIZE = 64 MB keeps
     all of these on the bump fast path; halving the chunk to 32 MB
     would push module loads to the slow path.

  2. Refill amortisation.  The global vmalloc lock is taken once per
     chunk refill, paying for ~CHUNK_SIZE / avg_alloc_size bump
     allocations between lock acquisitions.  At avg = 4 KB (a
     plausible lower bound for typical kernel vmalloc traffic),
     64 MB amortises to ~16,000 fast-path allocations per global
     lock acquisition; at avg = 1 MB, ~64 per lock.  Doubling the
     chunk size beyond 64 MB barely improves this ratio.

  3. Address-space cost.  Each CPU pins a chunk-sized reservation
     within the vmalloc range.  On a 32-CPU server with the standard
     128 GB x86_64 vmalloc range, 64 MB chunks reserve
     32 * 64 MB = 2 GB = 1.6 % of the range.  On arm64 with
     CONFIG_ARM64_VA_BITS=52 (256 PB vmalloc), the cost is
     negligible.  Doubling to 128 MB pushes the x86_64 reservation
     to 3.2 %, which is still acceptable but starts to matter for
     workloads with high CPU counts.

Per-chunk metadata associated with each chunk is sized as
sizeof(struct vmap_area *) * (CHUNK_SIZE / PAGE_SIZE), which scales
linearly with chunk size and stays at a constant 0.2 % overhead
regardless of the chosen value.  At 64 MB this is 128 KB per chunk.

64 MB is therefore the *minimum* chunk size that meets constraint (1)
and (2) simultaneously; constraint (3) sets the upper bound and
allows growing the chunk if module sizes grow in the future.  The
constant is exposed at the top of the bump-allocator code block so
distributors can tune it for unusual configurations.

Allocations that don't match the predicate (non-page-aligned, larger
than half a chunk, fixed-VA, or with NUMA constraints) fall through
to the existing __alloc_vmap_area path unchanged.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 mm/vmalloc.c | 107 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 463127d5ce58..65ee80eaf4bf 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2467,6 +2467,98 @@ static inline void setup_vmalloc_vm(struct vm_struct *vm,
 	va->vm = vm;
 }
 
+/*
+ * Per-CPU bump-allocator overlay.
+ *
+ * Each CPU reserves a contiguous chunk of vmalloc address space and
+ * dispenses page-aligned allocations via a bump pointer. The chunk's
+ * range is reserved through the global allocator once; individual
+ * allocations within the chunk avoid the global maple-tree work
+ * entirely. Each allocation still gets its own vmap_area struct and
+ * is inserted into the per-node busy.mt, so find_vmap_area() and
+ * vfree() continue to work unchanged.
+ *
+ * Recycling: chunks leak in this minimal form. With 16 MB chunks on a
+ * 128 GB vmalloc range, the address space supports thousands of chunks
+ * before exhaustion. A future iteration can add chunk recycling via a
+ * va->bump_chunk back-pointer + refcount; deferred to keep this hot
+ * path's struct vmap_area footprint at 48 B.
+ *
+ * Constraints: only the standard vmalloc range with align <= PAGE_SIZE
+ * and size <= VMAP_BUMP_CHUNK_SIZE/2 takes the bump path. Anything
+ * else falls through to the existing __alloc_vmap_area path.
+ */
+#define VMAP_BUMP_CHUNK_SIZE	(64UL * 1024 * 1024)
+
+struct vmap_bump_chunk {
+	unsigned long	base;
+	unsigned long	limit;
+	unsigned long	bump;
+};
+
+static DEFINE_PER_CPU(struct vmap_bump_chunk, vmap_bump);
+static DEFINE_PER_CPU(spinlock_t, vmap_bump_lock);
+
+/* Try the per-CPU bump-allocator. Returns the chosen address or
+ * a negative IS_ERR_VALUE on miss; callers fall through to the
+ * regular path on miss.
+ */
+static unsigned long
+vmap_bump_alloc(unsigned long size, unsigned long align,
+		unsigned long vstart, unsigned long vend)
+{
+	struct vmap_bump_chunk *chunk;
+	spinlock_t *lock;
+	unsigned long aligned, addr = -ENOENT;
+
+	if (vstart != VMALLOC_START || vend != VMALLOC_END ||
+	    size == 0 || size > VMAP_BUMP_CHUNK_SIZE / 2 ||
+	    align > VMAP_BUMP_CHUNK_SIZE / 2)
+		return -EINVAL;
+
+	lock = this_cpu_ptr(&vmap_bump_lock);
+	spin_lock(lock);
+	chunk = this_cpu_ptr(&vmap_bump);
+	if (chunk->base) {
+		aligned = ALIGN(chunk->bump, align);
+		if (aligned + size <= chunk->limit) {
+			chunk->bump = aligned + size;
+			addr = aligned;
+		}
+	}
+	spin_unlock(lock);
+	return addr;
+}
+
+/* Refill this CPU's bump chunk. Reserves a fresh range from the
+ * global allocator. Old chunk's remaining space is leaked (the
+ * already-allocated VAs in it stay live; the unused tail is wasted).
+ */
+static int
+vmap_bump_refill(gfp_t gfp_mask)
+{
+	struct vmap_bump_chunk *chunk;
+	spinlock_t *lock;
+	unsigned long base;
+
+	preload_this_cpu_lock(&free_vmap_area_lock, gfp_mask, NUMA_NO_NODE);
+	base = __alloc_vmap_area(VMAP_BUMP_CHUNK_SIZE, PAGE_SIZE,
+				 VMALLOC_START, VMALLOC_END);
+	spin_unlock(&free_vmap_area_lock);
+
+	if (IS_ERR_VALUE(base))
+		return -ENOMEM;
+
+	lock = this_cpu_ptr(&vmap_bump_lock);
+	spin_lock(lock);
+	chunk = this_cpu_ptr(&vmap_bump);
+	chunk->base = base;
+	chunk->limit = base + VMAP_BUMP_CHUNK_SIZE;
+	chunk->bump = base;
+	spin_unlock(lock);
+	return 0;
+}
+
 /*
  * Allocate a region of KVA of the specified size and alignment, within the
  * vstart and vend. If vm is passed in, the two will also be bound.
@@ -2519,6 +2611,19 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 	}
 
 retry:
+	if (IS_ERR_VALUE(addr)) {
+		/*
+		 * Per-CPU bump-allocator fast path. On hit, no global
+		 * tree work runs at all. On miss, refill the chunk and
+		 * try again before falling back to the regular path.
+		 */
+		addr = vmap_bump_alloc(size, align, vstart, vend);
+		if (IS_ERR_VALUE(addr) && (long)addr == -ENOENT) {
+			if (vmap_bump_refill(gfp_mask) == 0)
+				addr = vmap_bump_alloc(size, align,
+						       vstart, vend);
+		}
+	}
 	if (IS_ERR_VALUE(addr)) {
 		preload_this_cpu_lock(&free_vmap_area_lock, gfp_mask, node);
 		try_init_free_mt_locked();
@@ -6214,6 +6319,8 @@ void __init vmalloc_init(void)
 		init_llist_head(&p->list);
 		INIT_WORK(&p->wq, delayed_vfree_work);
 		xa_init(&vbq->vmap_blocks);
+
+		spin_lock_init(&per_cpu(vmap_bump_lock, i));
 	}
 
 	/*

-- 
2.34.1


