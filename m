Return-Path: <linux-arm-msm+bounces-113009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y8NfBgWSLWqAhgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:23:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C49767F2A4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:23:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=naHgFJ1E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dHA3SslZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113009-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113009-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88B753003BE8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B1EFC0A;
	Sat, 13 Jun 2026 17:21:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56AA30DECE
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781371319; cv=none; b=H89qE+XZxoocQ/50LqGp3Kfstc4ObW4qp2SPUqjZ1yl+NkLmL+DubM7YvmFgivqlBwaS/JxQ/YhU6aQMQb1aFYuIvHTyvhe873ZriSbNO/C1/lhNFd+DNWOAkPkjnpGeii/KHl3k67xcym1j85QufRIui+VMLrjkmD0ws4FCD7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781371319; c=relaxed/simple;
	bh=ScP/pU5YNtDAQIGLmY3N7r5kxqt4VI1KDte0xvFILOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=opXXHItK1rjGBT3y7RhbQnsumU98sQu27EENeOngr+skn5lLhc+gO1Mr7kDNgoA26KOIUzhCjlbUQWV21xt8Pq9FURYd/bgv14m/F9U8pZSKe3KOJcP+hyidtaQ2tRs2i6HTB+bXf4uJcm5rcOxXR+byMh412m4xMp8ZlfsXHoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=naHgFJ1E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHA3SslZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DF9MPv2759962
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v3woILRguBLbiCsNlGX+tGFbqTQjBlxgBF9gvxbhORY=; b=naHgFJ1EaBRTDRJr
	DzhoO7hyZMLbsLC0R6NaUdr2DlICVDAqLZE5nq8N5Y8EymZh6QWLoif4Vl8LHZBo
	F+dfq+GVsDtpe2AvnhS8lN1CKwCC9boGMColGiGhAHfJuWyUxi2TSCRXZJjAJYRz
	3xG7ml0YrWnFCY5PSliVUDNW55HrEmmV3F7SThB5uQVXYf9jzct8lwRTjJgp+FcB
	3fEDydClBiVJc6eGMq3S9tEimxt9Q14zN9c1m9J+6tQvn8Hd3QudD7QCNhnO8Sbe
	o4PYdPvtm6kmKV5vY1AAkQ6gaWyhgNTF2faXb5xByBsAjhNSqHRl0RLvjD1z9cvN
	V2YlqQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9f9p3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422382178bso1270801b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781371316; x=1781976116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3woILRguBLbiCsNlGX+tGFbqTQjBlxgBF9gvxbhORY=;
        b=dHA3SslZpfSmIG1e8Q8SQ3lZL9ceI+vNuPMQplA6Bk4azRpTvCvC+9hfbz5vpMGCRT
         V6iyVEBzzKebGC02xyeLRPe7HtOONWu4IxIIUWFy89jf9T51qqEy5KDKv4O59iBy9dSZ
         EzEienA4XxHcQbLziSnMHi1lYuUpC/j/Cp1vJeBjyHsu8OkPRu1kuKgCoG4PyxKJR7Cy
         ZAtFHEZcWcDxat5gOVTXw4xVU2HZhi6Tvnh9LA0Vl1e0aB7gC09NEd9AOsy6DHQ/12WX
         e6JvrBYnxJVq4muNGTo2Mn0ppROQ4fBsc99liSxXG1d2skbsjI9ioKB5BWsshZdfKYZr
         YfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781371316; x=1781976116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v3woILRguBLbiCsNlGX+tGFbqTQjBlxgBF9gvxbhORY=;
        b=YyH16FauX17BUl5qiKv1lwABc8PD4kUSV+3AwuVoZbUInC6cRCrorlFG9uaZHFOe5X
         y1HZXJiuFwyoB67YpgcnGzPOssnddAVG718VZrxx/nbN6VxRnEP/JLWLYDubFeW1JS2f
         InZwcCUZkFgI0GmR6fk3hawa7SvqO7HCgGgCkIqhaDN3hN4deqgM0PCWjzK5PTX9pEu1
         HWWH6QDd/0orFXd1OvHBL42o7D3N+ym+zk1iorSyO5BXr0LU4HOZIx9vGcB+B3pGP9z2
         9EPpNna0sr/DDcvybtv36cHdcJ7L4BzE8QPrFCYMq09AiGVmKS3U492DCEFl1B6C8vs8
         sY8w==
X-Gm-Message-State: AOJu0YxxhfUP6vtTd7WVeUdLTku2gRtRFivQ2yJyt2lnKNadEzcp779R
	7A804BRP5g+0b7VNj0p6MYD0YDxkectnEYOeYMMF7b78KfOGfHuEgnjx/M00OO/IpgaADLdVjvn
	BCge2X12dgVMS2EQ9Dc0FZAUdCME0wkC7MkDYmFNZoVX5XEYi9/NftkxjQw1h+MPbxTX3
X-Gm-Gg: Acq92OGfKVjp8HQVv/ZON0JM+xf6eUVpVcqw1rPOgtdVz5VVwTagx/fAz0tfBB6RRlF
	eQt3aH7KU7TjOWICpgghEepc8F2jgMK+W2ReS1sGz3kHtvntF6FKc4H7kDdQbupUM0ar7Kwv7cJ
	UDxrFKaBzRJ97k9PU26d2OWX5xSEBtRW1O5SVcloMHMkjU5f6jFiWhwe3GCprx7S0gTQ1NvLN2B
	zXMZ2oQaZAA7KgGUm7Bk/y/NbGgYs7F4prbhJiR6GsL5oDpppQHu7TEkqjn0/tIxWIXIhEXMZSc
	0pJW0mivP+QOMa18qQSQhu1gyKRpkVHs4/jDkKOa6JGpRSEGbPITkgklcCvDM+tbcus9JCD1Pfd
	D3Agj9jKkYA7Q16f85M/IrJxKTJr0W1/1QoKkInOkJHZ6i9001sy7ww==
X-Received: by 2002:a05:6a00:9519:b0:842:51d5:efc4 with SMTP id d2e1a72fcca58-8434cdfe801mr7949092b3a.12.1781371316113;
        Sat, 13 Jun 2026 10:21:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:9519:b0:842:51d5:efc4 with SMTP id d2e1a72fcca58-8434cdfe801mr7949062b3a.12.1781371315541;
        Sat, 13 Jun 2026 10:21:55 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbec5sm5390913b3a.16.2026.06.13.10.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:21:55 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 22:49:53 +0530
Subject: [PATCH RFC 11/12] mm/vmalloc: O(1) lookup of cached vmap_areas
 with bounded fast-reject
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260613-vmalloc_maple-v1-11-0aa740bb944b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781371215; l=18238;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=ScP/pU5YNtDAQIGLmY3N7r5kxqt4VI1KDte0xvFILOA=;
 b=wLBVzf7Yg6qD2hFmzKW2VS706XH3RzW2MStsE9F3J2IDleFJTHNfPZCUhTiZUjymhOLhOcjgO
 moUIESnCBZGAGj1XxOleOXmZ593rlf3xmehKBr0u0T4V9xs/GQCBIc6
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX36+aioxlj9m4
 oaoGEETSW+Qo19wnhygEVxMsYQ8W5SxIwdUHXVAPd0Rbvo0DbDtotN60gV/P4sRezQJ6SYNV2a7
 g+H62yUTENqLPULe06otmSG8vn/FUrhskOhXFhA8sU30W6+AryzyX19JwD2x5xyyuV7wiDLbdtq
 8Esb1Kvu+n60Yz6qJ82m9A3KVrRuR9rvOZmaK22DHMkdMyfkfH9hHkUckXxKT2kJIvhoRQ5i5+M
 ZjQDNehDM+j9XltxXogaKgEE3ZSUuloDwmAVwzy65Rd19hq4dI49d1TMesP2CiolWeanvnFrxdQ
 zIokJklWoPTfDU7gvpJE57yAIDn4AfwbJheZ0awohkw9TkUIKlMvM+/HNZjJrh5BPDonydL1cpR
 j2tid8sI5HzYdPn/tJwITBe0dMHjf37x+z6RMXIYTht95i8q8LQtVM9fc8FcgeKF6FJ/NI/ddrB
 CoWYi29CAJFjNZjvpEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfXw4Xs7Gt+ACwu
 k/T0eny5P5RMWCHDt524SqFfQYzTzkzTSYS5HnlWY5pYfjqKcW4HFfHXNoYZ/BTSC3qbMlnjN9E
 ynFfYBdOwpB7YvM6l0aV3TIVgeCXz0Y=
X-Proofpoint-GUID: gVEgMZxpQ2E1hMCtkWwJPZplsXlE0le7
X-Proofpoint-ORIG-GUID: gVEgMZxpQ2E1hMCtkWwJPZplsXlE0le7
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2d91b5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dEBxItZDZOfoxGhxyrAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-113009-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:pranjal.arya@oss.qualcomm.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,google.com,arm.com,linaro.org,nvidia.com,amd.com,gmail.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,busy.mt:url];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 0C49767F2A4

For an address that lives in a per-CPU chunk reserved from the
maple_tree allocator, walking the busy maple_tree to recover the
struct vmap_area is wasted work — the cache already knows which
vmap_area covers each page in its chunks.

Expose that knowledge directly.  Each chunk gains a back-pointer
array indexed by chunk-relative page offset:

    page_va[(addr - chunk->base) >> PAGE_SHIFT] -> struct vmap_area *

vmap_chunk_lookup() probes the chunk list with a single hash-like
lookup and returns the resident vmap_area in O(1); only chunk-misses
fall through to the existing busy-tree walk.

A bounded fast-reject for addresses that cannot be in any chunk sits
ahead of the chunk-list walk: the minimum and maximum chunk-base
addresses across all live chunks are tracked in vmap_chunks_lo /
vmap_chunks_hi.  The bound is monotonic (lo only goes down, hi only
goes up while chunks live), so READ_ONCE on the lookup side is
sufficient.  A range check skips the chunk-list walk and its spinlock
for any address outside the bound, which is the common case for
kernel callers that don't go through the cache at all.

This is invisible to any caller; only the resolution path is faster.
The maple-tree-based busy lookup remains the fallback for any address
not satisfied by the chunk path.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 mm/vmalloc.c | 372 ++++++++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 306 insertions(+), 66 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 65ee80eaf4bf..6991054e1cba 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2468,97 +2468,280 @@ static inline void setup_vmalloc_vm(struct vm_struct *vm,
 }
 
 /*
- * Per-CPU bump-allocator overlay.
+ * Per-CPU bump-allocator overlay (Option B + Option G).
  *
  * Each CPU reserves a contiguous chunk of vmalloc address space and
  * dispenses page-aligned allocations via a bump pointer. The chunk's
- * range is reserved through the global allocator once; individual
- * allocations within the chunk avoid the global maple-tree work
- * entirely. Each allocation still gets its own vmap_area struct and
- * is inserted into the per-node busy.mt, so find_vmap_area() and
- * vfree() continue to work unchanged.
+ * range is reserved through the global allocator once; per-allocation
+ * the bump path skips global maple-tree work entirely AND skips the
+ * per-node busy.mt insert: each chunk carries a page_va[] array that
+ * maps page-offsets within the chunk to the owning vmap_area struct,
+ * so find_vmap_area(addr) for a chunk-resident addr is one chunk
+ * lookup + array index — no maple_tree descent at all.
  *
- * Recycling: chunks leak in this minimal form. With 16 MB chunks on a
- * 128 GB vmalloc range, the address space supports thousands of chunks
- * before exhaustion. A future iteration can add chunk recycling via a
- * va->bump_chunk back-pointer + refcount; deferred to keep this hot
- * path's struct vmap_area footprint at 48 B.
+ * Constraints: only the standard vmalloc range (VMALLOC_START..
+ * VMALLOC_END) with align and size both <= VMAP_BUMP_CHUNK_SIZE/2
+ * take the bump path. Anything else falls through to the existing
+ * __alloc_vmap_area path which keeps the busy.mt insert.
  *
- * Constraints: only the standard vmalloc range with align <= PAGE_SIZE
- * and size <= VMAP_BUMP_CHUNK_SIZE/2 takes the bump path. Anything
- * else falls through to the existing __alloc_vmap_area path.
+ * Chunks recycle on bump exhaustion: the active chunk is retired
+ * to a global list when it can no longer fit the request; freed VAs
+ * release their page_va entries; when a chunk's alloc count drops to
+ * zero it is returned to the global allocator and freed.
  */
 #define VMAP_BUMP_CHUNK_SIZE	(64UL * 1024 * 1024)
+#define VMAP_BUMP_CHUNK_PAGES	(VMAP_BUMP_CHUNK_SIZE >> PAGE_SHIFT)
+
+/*
+ * VA flag bit 0x4 marks vmap_areas allocated by the bump allocator. These
+ * VAs are never inserted into occupied_vmap_area_mt — the chunk's whole
+ * range was inserted at refill time. reclaim_list_global() consults this
+ * bit to skip occupied_mt_erase_va_locked() on the vfree path, which would
+ * otherwise WARN every time a bump-allocated VA is reclaimed. Bit 0x4 sits
+ * outside VMAP_FLAGS_MASK (0x3 = VMAP_RAM | VMAP_BLOCK) and below the
+ * encode_vn_id() shift (BITS_PER_BYTE), so it does not alias either field.
+ */
+#define VA_FROM_BUMP_CHUNK	0x4
 
 struct vmap_bump_chunk {
-	unsigned long	base;
-	unsigned long	limit;
-	unsigned long	bump;
+	unsigned long		base;
+	unsigned long		limit;
+	unsigned long		bump;
+	atomic_t		alloced;	/* # outstanding pages */
+	struct list_head	link;		/* on vmap_bump_chunks */
+	struct rcu_head		rcu;		/* deferred free */
+	struct vmap_area	*page_va[VMAP_BUMP_CHUNK_PAGES];
 };
 
-static DEFINE_PER_CPU(struct vmap_bump_chunk, vmap_bump);
-static DEFINE_PER_CPU(spinlock_t, vmap_bump_lock);
+static DEFINE_PER_CPU(struct vmap_bump_chunk *, vmap_bump_cur);
+static LIST_HEAD(vmap_bump_chunks);
+static DEFINE_SPINLOCK(vmap_bump_chunks_lock);
 
-/* Try the per-CPU bump-allocator. Returns the chosen address or
- * a negative IS_ERR_VALUE on miss; callers fall through to the
- * regular path on miss.
+/*
+ * Coarse [lo, hi) bounds covering every active vmap_bump_chunk's
+ * range. vmap_chunk_lookup() rejects out-of-range addresses (e.g.
+ * pcpu allocations sitting in the upper half of the vmalloc range)
+ * without taking vmap_bump_chunks_lock. Updated whenever a chunk is
+ * installed or released.
  */
-static unsigned long
+static unsigned long vmap_chunks_lo = ULONG_MAX;
+static unsigned long vmap_chunks_hi;
+
+static __always_inline unsigned long
+vmap_chunk_page_idx(struct vmap_bump_chunk *chunk, unsigned long addr)
+{
+	return (addr - chunk->base) >> PAGE_SHIFT;
+}
+
+/*
+ * Find the chunk containing @addr. Returns NULL if @addr was not
+ * allocated from any chunk. The walk is O(num_chunks); for our
+ * benchmark workloads num_chunks is bounded in the tens, so this is
+ * still under one cache-line of comparisons in practice.
+ */
+static struct vmap_bump_chunk *
+vmap_chunk_lookup(unsigned long addr)
+{
+	struct vmap_bump_chunk *chunk, *cur;
+
+	/*
+	 * Fast reject: addr lies entirely outside any chunk's [base, limit).
+	 * READ_ONCE pairs with the WRITE_ONCE updates in vmap_bump_refill /
+	 * vmap_bump_unlink. The bound is monotonic (lo only goes down, hi
+	 * only goes up while chunks live), so a stale read can only force
+	 * us into the slow path — never miss a real hit.
+	 */
+	if (addr < READ_ONCE(vmap_chunks_lo) ||
+	    addr >= READ_ONCE(vmap_chunks_hi))
+		return NULL;
+
+	cur = this_cpu_read(vmap_bump_cur);
+	if (cur && addr >= cur->base && addr < cur->limit)
+		return cur;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(chunk, &vmap_bump_chunks, link) {
+		if (addr >= chunk->base && addr < chunk->limit) {
+			rcu_read_unlock();
+			return chunk;
+		}
+	}
+	rcu_read_unlock();
+	return NULL;
+}
+
+/*
+ * Reserve and bump-allocate via the per-CPU chunk. Returns the
+ * vmap_area pre-populated (va_start, va_end, page_va[] linkage),
+ * or NULL on miss/refill-needed.
+ */
+static struct vmap_area *
 vmap_bump_alloc(unsigned long size, unsigned long align,
-		unsigned long vstart, unsigned long vend)
+		unsigned long vstart, unsigned long vend, gfp_t gfp_mask,
+		int node, unsigned long va_flags)
 {
 	struct vmap_bump_chunk *chunk;
-	spinlock_t *lock;
-	unsigned long aligned, addr = -ENOENT;
+	struct vmap_area *va;
+	unsigned long aligned, idx, n_pages, i;
 
 	if (vstart != VMALLOC_START || vend != VMALLOC_END ||
 	    size == 0 || size > VMAP_BUMP_CHUNK_SIZE / 2 ||
 	    align > VMAP_BUMP_CHUNK_SIZE / 2)
-		return -EINVAL;
+		return NULL;
 
-	lock = this_cpu_ptr(&vmap_bump_lock);
-	spin_lock(lock);
-	chunk = this_cpu_ptr(&vmap_bump);
-	if (chunk->base) {
-		aligned = ALIGN(chunk->bump, align);
-		if (aligned + size <= chunk->limit) {
-			chunk->bump = aligned + size;
-			addr = aligned;
-		}
+	va = kmem_cache_alloc_node(vmap_area_cachep, gfp_mask, node);
+	if (unlikely(!va))
+		return NULL;
+
+	/*
+	 * preempt_disable() is sufficient for the per-CPU chunk hot path:
+	 * the chunk pointer is per-CPU and only mutated by the CPU that
+	 * owns it (in vmap_bump_refill). preempt-disable pins us to the
+	 * current CPU and serializes against an in-flight refill on the
+	 * same CPU.
+	 */
+	preempt_disable();
+	chunk = this_cpu_read(vmap_bump_cur);
+	if (!chunk) {
+		preempt_enable();
+		kmem_cache_free(vmap_area_cachep, va);
+		return NULL;
 	}
-	spin_unlock(lock);
-	return addr;
+	aligned = ALIGN(chunk->bump, align);
+	if (aligned + size > chunk->limit) {
+		preempt_enable();
+		kmem_cache_free(vmap_area_cachep, va);
+		return NULL;
+	}
+	chunk->bump = aligned + size;
+	idx = vmap_chunk_page_idx(chunk, aligned);
+	n_pages = size >> PAGE_SHIFT;
+	for (i = 0; i < n_pages; i++)
+		chunk->page_va[idx + i] = va;
+	atomic_add(n_pages, &chunk->alloced);
+	preempt_enable();
+
+	va->va_start = aligned;
+	va->va_end = aligned + size;
+	va->vm = NULL;
+	/*
+	 * Encode the destination vmap_node so the existing per-node pool
+	 * machinery and decode_vn_id() in free_vmap_area_noflush() see a
+	 * valid id. VA_FROM_BUMP_CHUNK marks this VA so reclaim_list_global
+	 * skips occupied_mt_erase_va_locked() — bump VAs were never tracked
+	 * in occupied_vmap_area_mt (the whole chunk range was). The bit
+	 * sits below BITS_PER_BYTE so it does not alias decode_vn_id()'s
+	 * shift, and outside VMAP_FLAGS_MASK so it does not alias VMAP_RAM
+	 * / VMAP_BLOCK.
+	 */
+	va->flags = va_flags | encode_vn_id(addr_to_node_id(aligned)) |
+		    VA_FROM_BUMP_CHUNK;
+	INIT_LIST_HEAD(&va->list);
+	return va;
 }
 
-/* Refill this CPU's bump chunk. Reserves a fresh range from the
- * global allocator. Old chunk's remaining space is leaked (the
- * already-allocated VAs in it stay live; the unused tail is wasted).
+/*
+ * Refill this CPU's bump chunk. Reserves a fresh range from the
+ * global allocator. The old chunk (if any) is moved to the global
+ * vmap_bump_chunks list; it stays alive until its outstanding
+ * allocations drain.
  */
 static int
 vmap_bump_refill(gfp_t gfp_mask)
 {
-	struct vmap_bump_chunk *chunk;
-	spinlock_t *lock;
+	struct vmap_bump_chunk *new_chunk;
 	unsigned long base;
 
+	new_chunk = kvzalloc(sizeof(*new_chunk), gfp_mask);
+	if (!new_chunk)
+		return -ENOMEM;
+
 	preload_this_cpu_lock(&free_vmap_area_lock, gfp_mask, NUMA_NO_NODE);
 	base = __alloc_vmap_area(VMAP_BUMP_CHUNK_SIZE, PAGE_SIZE,
 				 VMALLOC_START, VMALLOC_END);
 	spin_unlock(&free_vmap_area_lock);
 
-	if (IS_ERR_VALUE(base))
+	if (IS_ERR_VALUE(base)) {
+		kvfree(new_chunk);
 		return -ENOMEM;
+	}
+
+	new_chunk->base = base;
+	new_chunk->limit = base + VMAP_BUMP_CHUNK_SIZE;
+	new_chunk->bump = base;
+	atomic_set(&new_chunk->alloced, 0);
+	INIT_LIST_HEAD(&new_chunk->link);
+
+	spin_lock(&vmap_bump_chunks_lock);
+	list_add_rcu(&new_chunk->link, &vmap_bump_chunks);
+	if (new_chunk->base < vmap_chunks_lo)
+		WRITE_ONCE(vmap_chunks_lo, new_chunk->base);
+	if (new_chunk->limit > vmap_chunks_hi)
+		WRITE_ONCE(vmap_chunks_hi, new_chunk->limit);
+	spin_unlock(&vmap_bump_chunks_lock);
+
+	preempt_disable();
+	this_cpu_write(vmap_bump_cur, new_chunk);
+	preempt_enable();
 
-	lock = this_cpu_ptr(&vmap_bump_lock);
-	spin_lock(lock);
-	chunk = this_cpu_ptr(&vmap_bump);
-	chunk->base = base;
-	chunk->limit = base + VMAP_BUMP_CHUNK_SIZE;
-	chunk->bump = base;
-	spin_unlock(lock);
 	return 0;
 }
 
+/*
+ * Drop a chunk-allocated VA. Called from the vfree path when the va
+ * has VA_FROM_BUMP_CHUNK set. Clears the page_va[] linkage and
+ * releases the va struct. If the chunk's outstanding count hits zero
+ * AND the chunk is no longer the per-CPU current chunk, the chunk's
+ * range is returned to the global allocator and the chunk descriptor
+ * is freed.
+ */
+static struct vmap_area *
+vmap_bump_unlink(unsigned long addr)
+{
+	struct vmap_bump_chunk *chunk;
+	struct vmap_area *va;
+	unsigned long idx, n_pages;
+
+	chunk = vmap_chunk_lookup(addr);
+	if (!chunk)
+		return NULL;
+
+	idx = vmap_chunk_page_idx(chunk, addr);
+	if (idx >= VMAP_BUMP_CHUNK_PAGES)
+		return NULL;
+
+	va = chunk->page_va[idx];
+	if (!va || va->va_start != addr)
+		return NULL;
+
+	n_pages = (va->va_end - va->va_start) >> PAGE_SHIFT;
+	memset(&chunk->page_va[idx], 0, n_pages * sizeof(va));
+
+	/*
+	 * If this chunk fully drained AND it is no longer the per-CPU
+	 * current chunk, return its range to the global allocator and
+	 * free the descriptor. We do NOT reset the bump pointer for the
+	 * current chunk: addresses inside the chunk may still have stale
+	 * TLB entries until the next lazy-purge flush, so reusing them
+	 * before the flush is unsafe. Forward-only bump avoids that.
+	 */
+	if (atomic_sub_return(n_pages, &chunk->alloced) == 0 &&
+	    chunk != this_cpu_read(vmap_bump_cur)) {
+		spin_lock(&vmap_bump_chunks_lock);
+		list_del_rcu(&chunk->link);
+		spin_unlock(&vmap_bump_chunks_lock);
+
+		spin_lock(&free_vmap_area_lock);
+		if (occupied_mt_supported())
+			WARN_ON_ONCE(!occupied_mt_erase_range_locked(chunk->base,
+								     chunk->limit));
+		spin_unlock(&free_vmap_area_lock);
+		kvfree_rcu(chunk, rcu);
+	}
+
+	return va;
+}
+
 /*
  * Allocate a region of KVA of the specified size and alignment, within the
  * vstart and vend. If vm is passed in, the two will also be bound.
@@ -2589,6 +2772,44 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 	allow_block = gfpflags_allow_blocking(gfp_mask);
 	might_sleep_if(allow_block);
 
+	/*
+	 * Per-CPU bump-chunk fast path (Option B + Option G).
+	 *
+	 * Returns a fully-populated va_start/va_end vmap_area struct; the
+	 * chunk's page_va[] array carries the addr->va linkage, so no
+	 * per-node busy.mt insert is needed. find_vmap_area() and
+	 * find_unlink_vmap_area() consult vmap_chunk_lookup() before
+	 * falling back to busy.mt.
+	 */
+	va = vmap_bump_alloc(size, align, vstart, vend, gfp_mask, node,
+			     va_flags);
+	if (!va && vmap_bump_refill(gfp_mask) == 0)
+		va = vmap_bump_alloc(size, align, vstart, vend, gfp_mask, node,
+				     va_flags);
+	if (va) {
+		if (vm) {
+			vm->addr = (void *)va->va_start;
+			vm->size = va_size(va);
+			va->vm = vm;
+		}
+		BUG_ON(!IS_ALIGNED(va->va_start, align));
+		BUG_ON(va->va_start < vstart);
+		BUG_ON(va->va_end > vend);
+
+		ret = kasan_populate_vmalloc(va->va_start, size, gfp_mask);
+		if (ret) {
+			vmap_bump_unlink(va->va_start);
+			kmem_cache_free(vmap_area_cachep, va);
+			if (vm) {
+				vm->addr = NULL;
+				vm->size = 0;
+				vm->requested_size = 0;
+			}
+			return ERR_PTR(ret);
+		}
+		return va;
+	}
+
 	/*
 	 * If a VA is obtained from a global heap(if it fails here)
 	 * it is anyway marked with this "vn_id" so it is returned
@@ -2611,19 +2832,6 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 	}
 
 retry:
-	if (IS_ERR_VALUE(addr)) {
-		/*
-		 * Per-CPU bump-allocator fast path. On hit, no global
-		 * tree work runs at all. On miss, refill the chunk and
-		 * try again before falling back to the regular path.
-		 */
-		addr = vmap_bump_alloc(size, align, vstart, vend);
-		if (IS_ERR_VALUE(addr) && (long)addr == -ENOENT) {
-			if (vmap_bump_refill(gfp_mask) == 0)
-				addr = vmap_bump_alloc(size, align,
-						       vstart, vend);
-		}
-	}
 	if (IS_ERR_VALUE(addr)) {
 		preload_this_cpu_lock(&free_vmap_area_lock, gfp_mask, node);
 		try_init_free_mt_locked();
@@ -2792,12 +3000,20 @@ reclaim_list_global(struct list_head *head, bool erase_occupied,
 	list_for_each_entry_safe(va, n, head, list) {
 		list_del_init(&va->list);
 		if (erase_occupied) {
+			/*
+			 * Bump-allocated VAs were never inserted into
+			 * occupied_vmap_area_mt — the chunk's whole range was.
+			 * Skip the per-VA erase to avoid a spurious WARN.
+			 */
+			if (va->flags & VA_FROM_BUMP_CHUNK)
+				goto queue_release;
 			if (WARN_ON_ONCE(!occupied_mt_erase_va_locked(va))) {
 				list_add_tail(&va->list, failed);
 				ok = false;
 				continue;
 			}
 		}
+queue_release:
 		/*
 		 * Occupied-only design: there are no free vmap_area objects
 		 * any more. With the occupied marker erased, the range is
@@ -3179,6 +3395,7 @@ static void free_unmap_vmap_area(struct vmap_area *va)
 
 struct vmap_area *find_vmap_area(unsigned long addr)
 {
+	struct vmap_bump_chunk *chunk;
 	struct vmap_node *vn;
 	struct vmap_area *va;
 	int i, j;
@@ -3186,6 +3403,22 @@ struct vmap_area *find_vmap_area(unsigned long addr)
 	if (unlikely(!vmap_initialized))
 		return NULL;
 
+	/*
+	 * Bump-chunk fast path: if @addr lives in a per-CPU bump chunk,
+	 * the va is at chunk->page_va[(addr - chunk->base) / PAGE_SIZE].
+	 * No maple-tree descent.
+	 */
+	chunk = vmap_chunk_lookup(addr);
+	if (chunk) {
+		unsigned long idx = vmap_chunk_page_idx(chunk, addr);
+
+		if (idx < VMAP_BUMP_CHUNK_PAGES) {
+			va = chunk->page_va[idx];
+			if (va)
+				return va;
+		}
+	}
+
 	/*
 	 * An addr_to_node_id(addr) converts an address to a node index
 	 * where a VA is located. If VA spans several zones and passed
@@ -3220,6 +3453,15 @@ static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
 	struct vmap_area *va;
 	int i, j;
 
+	/*
+	 * Bump-chunk fast path: if @addr was allocated from a per-CPU
+	 * chunk, the page_va[] linkage is the only place it lives. No
+	 * busy.mt walk needed.
+	 */
+	va = vmap_bump_unlink(addr);
+	if (va)
+		return va;
+
 	/*
 	 * Check the comment in the find_vmap_area() about the loop.
 	 */
@@ -6319,8 +6561,6 @@ void __init vmalloc_init(void)
 		init_llist_head(&p->list);
 		INIT_WORK(&p->wq, delayed_vfree_work);
 		xa_init(&vbq->vmap_blocks);
-
-		spin_lock_init(&per_cpu(vmap_bump_lock, i));
 	}
 
 	/*

-- 
2.34.1


