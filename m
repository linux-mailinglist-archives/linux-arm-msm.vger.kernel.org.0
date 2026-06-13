Return-Path: <linux-arm-msm+bounces-113002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i8guEcmRLWp0hgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:22:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C56167F286
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:22:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Vtje02JL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q7SYsvxu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113002-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113002-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A50D730323A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FD234AB01;
	Sat, 13 Jun 2026 17:21:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2553FDC04
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781371263; cv=none; b=Et0ByMSfFTK3bg5kCjpPKQN/2Hydb+/3xDLchRU4B0n+eucks3Li32C0ScD2zKrwdrcQyk1cno12QrtFhtqXSvALGAGqYKmMhJFGNC6pZawiNWu8mILcgsu6mY+GbMXqFgkAwucGJp/oJNxecXMkv5PLULxlpWMcH7URqZ+Reuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781371263; c=relaxed/simple;
	bh=fO7p35yLhLCL7LmgBhMmEl7jA4eYMFRf0y923znTj5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dfx0+yG+3DPCDyBjsWHALEI/0pOvGbsC5+nBwh4iatskMptrMmWEwKZwYW7EtpHs3zhOU5G94WyqZ5xdF8pksSm4LIU2a28FpFWxYKSWYh/VVASuo2KmwOHuyIBWfPkCNFNkwbTo2FwjcpirM3VffIKvZvkZd3THpFMQUed2fiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vtje02JL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7SYsvxu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DFQFWD2722412
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fl9EcxsXrxxpFdLKsvvtWPk1tb6yf1Ba7ILpGjWgZTM=; b=Vtje02JLOCGs8ZDa
	9Fp8D7O3MY4B1uv9kSYyndpXE0ZtVzkiWnz3K5/Gd4Uibh99WoiAlTkZOQe+YfGt
	5aldTkaZTLOwFRo+lFJUa04S+Idivll1wMD0qXK2RfWAKv8hpV4gLjFxVzUBe8ml
	WpSWNLBybnJg8Sh6DyL2fuKZlwflS7o5JXQBmMY1P7ePjKlSHmwmdU6djVVETr88
	V+CTtHgG2aOQj0m/RSH9Dy9Yw60usBES99DHkwS4bYO7dpkDXaVh5kVwxCE8NnW3
	FsY0pFMI0CLY9GHk5eAhMJ1zQvG5gu29KOq00K5LRFH5GFrjUGhM9oEVDez8TJSA
	Gm4hig==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybsj5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:20:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8428419982eso1906184b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781371259; x=1781976059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fl9EcxsXrxxpFdLKsvvtWPk1tb6yf1Ba7ILpGjWgZTM=;
        b=Q7SYsvxubhbkM3/1yr4vgsV68ZlyZfFbG4nl4FeV9WGZGR1rUAATdVVU4qOl0vk9/y
         UtE9Qr4XxjBs33b1cUjzFyrC9J+UrhxC1jB2iX38hg/MPtIa1cCB++2vm0CzCjcLv0lN
         PRG2wLj+mbCPdXdn1kL9CSuYapMXK6B50JRQ5N6q/RE6ZOU+fra8FVh/Io8D2uewD1pe
         jxSELYjcUfneK94n9SRot4jOkx8QHkT2WAhszkOGs6+//HcuHKbnygiBc3qmiSDRvZy/
         m4kA92n+PlVA07kf+wCjlfyWmeAGxIUgkII99MjgMVQmPnHEpAYeiASkz9tRlmpChgh9
         xykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781371259; x=1781976059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fl9EcxsXrxxpFdLKsvvtWPk1tb6yf1Ba7ILpGjWgZTM=;
        b=e1/yGiubXbu7cTM3lVFz7TWQEdJKCf8NaeK0BtQiRrIbMAxYCdkGeu62k6HHyi+fqB
         Kf2N8x6YXE98bNPXYdGn01GRC/1HNzXConekg+quD5Zgxe4/gYZCpGmfq35rA1TqSmIp
         gaSnUvl4Ox2X4+FvuGrzXT2rIij98FnxD7BRj5u02UYRZvvCsiX19hYCLS4gX1ySB8MB
         MfmIlb+Cp0MnzHeRCBL/0C/C9rHX40pXuH2b98+cjAfj94tOgVs3VHgGLKfwD4ZaNsF0
         LN85cvdTqHox1b7s054+OrhMLmu6J2BC70YkzNbriJBbj3B0lTBdbV4akTIj2C6kkD9r
         KeWQ==
X-Gm-Message-State: AOJu0Yx26HwB5RZ8EsllMnifh0akmYI9BMB+lpDXc3QbA5t9790KqkxC
	KfiRWzSig0RNH+fQPpMAJXJcFsYvndSfS7YOPsIdOhSLRuHSIpzKlb1UMjzqbNHLH8s9KGpdHtC
	feN/KUPBnq7AnzEXYdj6XYxyypy8dcfyxz4+iv8EZdIt2wY0oYHLw6sE7a9xArJ/rrlO7
X-Gm-Gg: Acq92OHD2+t8SQ2/x5LA2AYnhvehv4HtJ4upVw9c3tL8ap2E/Lu0Og5x1tAZZhIBLoi
	70RtSYiHvAYgPRSH66mYGSszzTorD6XkZkjzMakA6OAqg+QUWgr1LSlpK3mJNNwvjXGKtpi64Mc
	VZcE7fUH5yJrTJ5trF28hIZQauYHEXzJGZXxeJo4iO0fXnJKXn9Wlyb+4dHG8OTkiNvcyxR4RzO
	K3B5pDZI+EJRGFwcppWVnwriduQYUJe0ZGgN5buc0SRsSn+A3BGyTEqNiNbareQIzOQNwM/mUlK
	OVzSmDgZAS5auPCtUxdngfsbBtSomDhYQtpdzwsN6LK8BOL+LKx/f7B40VB94K5ehTfDH/0ldU0
	yFk3QcWfqsPSIbvEutb4dofmLcmIKn7byOuqOsX5qkvVE5Yib1+VLHA==
X-Received: by 2002:a05:6a00:2d29:b0:842:6097:467d with SMTP id d2e1a72fcca58-844e196bc9amr4347636b3a.15.1781371258095;
        Sat, 13 Jun 2026 10:20:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d29:b0:842:6097:467d with SMTP id d2e1a72fcca58-844e196bc9amr4347599b3a.15.1781371257350;
        Sat, 13 Jun 2026 10:20:57 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbec5sm5390913b3a.16.2026.06.13.10.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:20:57 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 22:49:46 +0530
Subject: [PATCH RFC 04/12] mm/vmalloc: finalize maple-only indexing and
 shrink struct vmap_area
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-vmalloc_maple-v1-4-0aa740bb944b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781371215; l=51713;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=fO7p35yLhLCL7LmgBhMmEl7jA4eYMFRf0y923znTj5k=;
 b=H1CSHTXVzF1kuQm4TSu0l+okUiGeApvOIdH5wsh24YMSJ1FhzSDwjnXTYulZAR34r+3w4sSqk
 Al/LcKiAGAaAFev0P77H95e/dVdIhZPhsVCdbsQxGCmGHhW3MEa1Lkp
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Proofpoint-GUID: mk7s2va86z_Ia3qHX-5Frm4mxQWS5SfU
X-Proofpoint-ORIG-GUID: mk7s2va86z_Ia3qHX-5Frm4mxQWS5SfU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX0mxKKey2SG6b
 KqqTQWCb5DH5mrGSK9Nz1Oqhc48q8XqjAMJGlfdUjngBGIbo3im1eSgL2Nr8uv5zHlUiEhAip7U
 REWIPBVIbGEJE4uNQd4EoFFBubbZblY=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2d917b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FKSjEIMCKi8Q58X1TJIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX5HOeOi02RGzZ
 AvoQOxTjeYQJCCvttMzZDHZ/ll7yOl++D3tx8DjFbi2D29Y2U7EbDrjt6oISSnXu4+tO6P+hEg3
 hfqAWofDUZfmPy8nbLb4qfzgs0V+gxw8nwcjUcEESPmeNv7wnCXOm7EXXIBUovDPUxr6G9eWF3g
 CZpAOErIKuze1tHwwm9jSJ5Fd6nOLhgn5nlOgxfrZ1+vitcmsiMXWWmARs5orAWwEt9BjvaZ7ul
 UH4A4ackzZhMR/yR1wi2NGfeDq+KqtnXo+4J0+rtm9zKCzARZwq7F+HfqJB6/xUl/JOvVqJKEj6
 WTAFXtDAeObjVxhNB3Smsjac/ejh8MJ/K1tBSLcOZVVr71H15yvJFgLzMfo4UxYNL5hx6tpUAfs
 Gr06rMQGAPysqPQgAvnb3kG7h8RSmeGSUNAEeVNo8kqI8fGH3OSG46rf2nrTXXMb95P8PnrgT5p
 lxLdfKKrlZbZRcZhTTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130180
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
	TAGGED_FROM(0.00)[bounces-113002-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:pranjal.arya@oss.qualcomm.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,google.com,arm.com,linaro.org,nvidia.com,amd.com,gmail.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: 8C56167F286

With every alloc/free/pcpu path now driven by maple_tree, retire the
augmented rb_tree from struct vmap_area and from include/linux/vmalloc.h.
The struct shrinks by 24 bytes on both x86_64 and arm64 (72 -> 48):

  -       struct rb_node rb_node;
  -       struct list_head list;
  -       union {
  -               unsigned long subtree_max_size;
  -               struct vm_struct *vm;
  -       };
  +       struct list_head list;
  +       struct vm_struct *vm;

Also allow maple_tree_init() to be called twice: vmalloc_init() runs
before start_kernel() reaches its own maple_tree_init() callsite,
and the maple_tree machinery needs to be live for the early seeding
done in vmap_init_free_space().  The second call becomes a no-op
once maple_node_cache is set.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 include/linux/vmalloc.h |   16 +-
 lib/maple_tree.c        |    7 +
 mm/vmalloc.c            | 1123 ++++++++++++++++++-----------------------------
 3 files changed, 436 insertions(+), 710 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index d87dc7f77f4e..642bca92b804 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -9,7 +9,6 @@
 #include <linux/list.h>
 #include <linux/llist.h>
 #include <asm/page.h>		/* pgprot_t */
-#include <linux/rbtree.h>
 #include <linux/overflow.h>
 
 #include <asm/vmalloc.h>
@@ -72,19 +71,8 @@ struct vmap_area {
 	unsigned long va_start;
 	unsigned long va_end;
 
-	struct rb_node rb_node;         /* address sorted rbtree */
-	struct list_head list;          /* address sorted list */
-
-	/*
-	 * The following two variables can be packed, because
-	 * a vmap_area object can be either:
-	 *    1) in "free" tree (root is free_vmap_area_root)
-	 *    2) or "busy" tree (root is vmap_area_root)
-	 */
-	union {
-		unsigned long subtree_max_size; /* in "free" tree */
-		struct vm_struct *vm;           /* in "busy" tree */
-	};
+	struct list_head list;          /* auxiliary linkage (pool/purge/lazy) */
+	struct vm_struct *vm;
 	unsigned long flags; /* mark type of vm_map_ram area */
 };
 
diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index e52876435b77..f3474a107372 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -5634,6 +5634,13 @@ void __init maple_tree_init(void)
 		.sheaf_capacity = 32,
 	};
 
+	/*
+	 * vmalloc_init() may need Maple allocations before start_kernel() reaches
+	 * its own maple_tree_init() callsite. Keep initialization idempotent.
+	 */
+	if (maple_node_cache)
+		return;
+
 	maple_node_cache = kmem_cache_create("maple_node",
 			sizeof(struct maple_node), &args,
 			SLAB_PANIC);
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index f2117eafa9cf..c908c1a0fcd4 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -23,7 +23,6 @@
 #include <linux/kallsyms.h>
 #include <linux/list.h>
 #include <linux/notifier.h>
-#include <linux/rbtree.h>
 #include <linux/maple_tree.h>
 #include <linux/xarray.h>
 #include <linux/io.h>
@@ -36,7 +35,6 @@
 #include <linux/llist.h>
 #include <linux/uio.h>
 #include <linux/bitops.h>
-#include <linux/rbtree_augmented.h>
 #include <linux/overflow.h>
 #include <linux/pgtable.h>
 #include <linux/hugetlb.h>
@@ -881,22 +879,20 @@ static bool vmap_initialized __read_mostly;
 static struct kmem_cache *vmap_area_cachep;
 
 /*
- * This linked list stores free areas sorted by start address.
- * It gives O(1) access to neighbors for fast coalescing.
+ * Maple tree of free ranges.
  */
-static LIST_HEAD(free_vmap_area_list);
-/* Next-fit hint to avoid scanning from list head on each allocation. */
-static unsigned long free_vmap_alloc_hint __maybe_unused = 1;
-
-/*
- * Maple tree shadow of free_vmap_area_list. It is used for
- * address lookups and first-fit scans.
- */
-static struct rb_root free_vmap_area_root = RB_ROOT;
-static struct maple_tree free_vmap_area_mt __maybe_unused =
-	MTREE_INIT_EXT(free_vmap_area_mt, MT_FLAGS_LOCK_EXTERN, free_vmap_area_lock);
-static bool free_vmap_area_mt_enabled __maybe_unused;
-static bool free_vmap_area_mt_init_tried __maybe_unused;
+static struct maple_tree free_vmap_area_mt =
+	MTREE_INIT_EXT(free_vmap_area_mt,
+		       MT_FLAGS_LOCK_EXTERN | MT_FLAGS_ALLOC_RANGE,
+		       free_vmap_area_lock);
+static bool free_vmap_area_mt_enabled;
+static bool free_vmap_area_mt_init_tried;
+static struct maple_tree occupied_vmap_area_mt =
+	MTREE_INIT_EXT(occupied_vmap_area_mt,
+		       MT_FLAGS_LOCK_EXTERN | MT_FLAGS_ALLOC_RANGE,
+		       free_vmap_area_lock);
+static bool occupied_vmap_area_mt_enabled;
+static bool occupied_vmap_area_mt_init_tried;
 
 /*
  * Preload a CPU with one object for "no edge" split case. The
@@ -905,19 +901,11 @@ static bool free_vmap_area_mt_init_tried __maybe_unused;
  */
 static DEFINE_PER_CPU(struct vmap_area *, ne_fit_preload_node);
 
-/*
- * This structure defines a single, solid model where a list and
- * maple tree are part of one entity protected by the lock. Nodes are
- * sorted in ascending order, thus for O(1) access to left/right
- * neighbors a list is used as well as for sequential traversal.
- */
+/* Per-node ordered range index backed by Maple Tree. */
 struct mt_list {
-	struct rb_root root;
 	struct maple_tree mt;
-	struct list_head head;
 	spinlock_t lock;
 	bool mt_enabled;
-	bool mt_init_tried;
 };
 
 /*
@@ -1055,22 +1043,6 @@ va_size(struct vmap_area *va)
 	return (va->va_end - va->va_start);
 }
 
-/*
- * Transitional rb compatibility retained until all rb-only users are moved.
- * Follow-up patches in this RFC series remove these helpers.
- */
-static __always_inline unsigned long
-get_subtree_max_size(struct rb_node *node)
-{
-	struct vmap_area *va;
-
-	va = rb_entry_safe(node, struct vmap_area, rb_node);
-	return va ? va->subtree_max_size : 0;
-}
-
-RB_DECLARE_CALLBACKS_MAX(static, free_vmap_area_rb_augment_cb,
-	struct vmap_area, rb_node, unsigned long, subtree_max_size, va_size)
-
 static void reclaim_and_purge_vmap_areas(void);
 static BLOCKING_NOTIFIER_HEAD(vmap_notify_list);
 static void drain_vmap_area_work(struct work_struct *work);
@@ -1078,31 +1050,12 @@ static DECLARE_WORK(drain_vmap_work, drain_vmap_area_work);
 
 static __cacheline_aligned_in_smp atomic_long_t vmap_lazy_nr;
 
-/*
- * maple nodes are allocated from slab; defer tree population until
- * slab allocator is up to avoid early-boot failures.
- */
-static __always_inline bool vmap_mt_runtime_ready(void)
-{
-	return READ_ONCE(vmap_initialized) && slab_is_available();
-}
-
 static __always_inline bool free_mt_supported(void)
 {
 	return free_vmap_area_mt_enabled;
 }
 
-static __always_inline void disable_free_mt_locked(void)
-{
-	lockdep_assert_held(&free_vmap_area_lock);
-
-	if (free_vmap_area_mt_enabled) {
-		__mt_destroy(&free_vmap_area_mt);
-		free_vmap_area_mt_enabled = false;
-	}
-}
-
-static __always_inline void free_mt_store_va_locked(struct vmap_area *va)
+static __always_inline bool free_mt_store_va_locked(struct vmap_area *va)
 {
 	int err;
 
@@ -1110,12 +1063,20 @@ static __always_inline void free_mt_store_va_locked(struct vmap_area *va)
 
 	MA_STATE(mas, &free_vmap_area_mt, va->va_start, va->va_end - 1);
 
-	err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
-	if (WARN_ON_ONCE(err))
-		disable_free_mt_locked();
+	err = mas_preallocate(&mas, va, GFP_NOWAIT | __GFP_NOWARN);
+	if (!err) {
+		mas_store_prealloc(&mas, va);
+		mas_destroy(&mas);
+	} else {
+		err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
+		if (WARN_ON_ONCE(err))
+			return false;
+	}
+
+	return true;
 }
 
-static __always_inline void free_mt_erase_va_locked(struct vmap_area *va)
+static __always_inline bool free_mt_erase_va_locked(struct vmap_area *va)
 {
 	int err;
 
@@ -1125,10 +1086,12 @@ static __always_inline void free_mt_erase_va_locked(struct vmap_area *va)
 
 	err = mas_store_gfp(&mas, NULL, GFP_ATOMIC | __GFP_NOWARN);
 	if (WARN_ON_ONCE(err))
-		disable_free_mt_locked();
+		return false;
+
+	return true;
 }
 
-static __always_inline void
+static __always_inline bool
 free_mt_update_va_locked(struct vmap_area *va, unsigned long old_start,
 			 unsigned long old_end)
 {
@@ -1140,35 +1103,14 @@ free_mt_update_va_locked(struct vmap_area *va, unsigned long old_start,
 	MA_STATE(mas_store, &free_vmap_area_mt, va->va_start, va->va_end - 1);
 
 	err = mas_store_gfp(&mas_erase, NULL, GFP_ATOMIC | __GFP_NOWARN);
-	if (WARN_ON_ONCE(err)) {
-		disable_free_mt_locked();
-		return;
-	}
+	if (WARN_ON_ONCE(err))
+		return false;
 
 	err = mas_store_gfp(&mas_store, va, GFP_ATOMIC | __GFP_NOWARN);
 	if (WARN_ON_ONCE(err))
-		disable_free_mt_locked();
-}
-
-static void free_mt_rebuild_locked(void)
-{
-	struct vmap_area *va;
-	int err;
-
-	lockdep_assert_held(&free_vmap_area_lock);
-
-	__mt_destroy(&free_vmap_area_mt);
-	free_vmap_area_mt_enabled = true;
-
-	list_for_each_entry(va, &free_vmap_area_list, list) {
-		MA_STATE(mas, &free_vmap_area_mt, va->va_start, va->va_end - 1);
+		return false;
 
-		err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
-		if (WARN_ON_ONCE(err)) {
-			disable_free_mt_locked();
-			return;
-		}
-	}
+	return true;
 }
 
 static __always_inline void try_init_free_mt_locked(void)
@@ -1178,257 +1120,101 @@ static __always_inline void try_init_free_mt_locked(void)
 	if (free_vmap_area_mt_init_tried)
 		return;
 
-	if (!vmap_mt_runtime_ready())
+	if (!slab_is_available())
 		return;
 
 	free_vmap_area_mt_init_tried = true;
-	free_mt_rebuild_locked();
-}
-
-static __always_inline struct vmap_area *
-__find_vmap_area_list(unsigned long addr, struct list_head *head)
-{
-	struct vmap_area *va;
-
-	addr = (unsigned long)kasan_reset_tag((void *)addr);
-
-	list_for_each_entry(va, head, list) {
-		if (addr < va->va_start)
-			break;
-		if (addr < va->va_end)
-			return va;
-	}
-
-	return NULL;
-}
-
-static struct vmap_area *__find_vmap_area(unsigned long addr, struct rb_root *root)
-{
-	struct rb_node *n = root->rb_node;
-
-	addr = (unsigned long)kasan_reset_tag((void *)addr);
-
-	while (n) {
-		struct vmap_area *va;
-
-		va = rb_entry(n, struct vmap_area, rb_node);
-		if (addr < va->va_start)
-			n = n->rb_left;
-		else if (addr >= va->va_end)
-			n = n->rb_right;
-		else
-			return va;
-	}
-
-	return NULL;
+	free_vmap_area_mt_enabled = true;
 }
 
-/* Look up the first VA which satisfies addr < va_end, NULL if none. */
-static __always_inline struct vmap_area *
-__find_vmap_area_exceed_addr_list(unsigned long addr, struct list_head *head)
+static __always_inline bool occupied_mt_supported(void)
 {
-	struct vmap_area *va;
-
-	addr = (unsigned long)kasan_reset_tag((void *)addr);
-
-	list_for_each_entry(va, head, list) {
-		if (va->va_end > addr)
-			return va;
-	}
-
-	return NULL;
+	return occupied_vmap_area_mt_enabled;
 }
 
-static __always_inline struct list_head *
-find_vmap_area_insert_point_list(struct vmap_area *va, struct list_head *head)
+static __always_inline void try_init_occupied_mt_locked(void)
 {
-	struct vmap_area *tmp;
-	struct list_head *next = head;
-
-	list_for_each_entry(tmp, head, list) {
-		if (tmp->va_start > va->va_start) {
-			next = &tmp->list;
-			break;
-		}
-	}
+	lockdep_assert_held(&free_vmap_area_lock);
 
-	if (next != head) {
-		tmp = list_entry(next, struct vmap_area, list);
-		if (WARN_ON_ONCE(va->va_end > tmp->va_start))
-			return NULL;
-	}
+	if (occupied_vmap_area_mt_init_tried)
+		return;
 
-	if (next->prev != head) {
-		tmp = list_entry(next->prev, struct vmap_area, list);
-		if (WARN_ON_ONCE(va->va_start < tmp->va_end))
-			return NULL;
-	}
+	if (!slab_is_available())
+		return;
 
-	return next;
+	occupied_vmap_area_mt_init_tried = true;
+	occupied_vmap_area_mt_enabled = true;
 }
 
-/*
- * Use maple-tree neighbour lookup to locate insertion point in O(log n),
- * while preserving sorted-list neighbour traversal.
- */
-static __always_inline struct list_head *
-find_vmap_area_insert_point_mt(struct vmap_area *va, struct maple_tree *tree,
-			       struct list_head *head)
+static __always_inline bool
+occupied_mt_store_range_locked(unsigned long start, unsigned long end)
 {
-	struct vmap_area *prev, *next;
-	struct list_head *next_link;
+	int err;
 
-	MA_STATE(mas, tree, va->va_start, va->va_start);
+	lockdep_assert_held(&free_vmap_area_lock);
 
-	mas_set(&mas, va->va_start);
-	next = mas_find(&mas, ULONG_MAX);
+	if (WARN_ON_ONCE(!occupied_mt_supported()))
+		return false;
 
-	if (next) {
-		if (WARN_ON_ONCE(next->va_start <= va->va_start))
-			return NULL;
-		if (WARN_ON_ONCE(va->va_end > next->va_start))
-			return NULL;
-		next_link = &next->list;
-	} else {
-		next_link = head;
-	}
+	MA_STATE(mas, &occupied_vmap_area_mt, start, end - 1);
 
-	if (next_link->prev != head) {
-		prev = list_entry(next_link->prev, struct vmap_area, list);
-		if (WARN_ON_ONCE(va->va_start < prev->va_end))
-			return NULL;
+	err = mas_preallocate(&mas, XA_ZERO_ENTRY, GFP_NOWAIT | __GFP_NOWARN);
+	if (!err) {
+		mas_store_prealloc(&mas, XA_ZERO_ENTRY);
+		mas_destroy(&mas);
+		return true;
 	}
 
-	return next_link;
+	err = mas_store_gfp(&mas, XA_ZERO_ENTRY, GFP_ATOMIC | __GFP_NOWARN);
+	return !WARN_ON_ONCE(err);
 }
 
 static __always_inline bool
-insert_vmap_area_list_sorted(struct vmap_area *va, struct list_head *head)
+occupied_mt_erase_range_locked(unsigned long start, unsigned long end)
 {
-	struct list_head *next;
-
-	next = find_vmap_area_insert_point_list(va, head);
-	if (!next)
-		return false;
-
-	list_add_tail(&va->list, next);
-	return true;
-}
+	int err;
 
-static __always_inline bool
-insert_vmap_area_list_sorted_mt(struct vmap_area *va, struct maple_tree *tree,
-				struct list_head *head)
-{
-	struct list_head *next;
+	lockdep_assert_held(&free_vmap_area_lock);
 
-	next = find_vmap_area_insert_point_mt(va, tree, head);
-	if (!next)
+	if (WARN_ON_ONCE(!occupied_mt_supported()))
 		return false;
 
-	list_add_tail(&va->list, next);
-	return true;
-}
+	MA_STATE(mas, &occupied_vmap_area_mt, start, end - 1);
 
-static __always_inline void
-disable_busy_mt_locked(struct vmap_node *vn)
-{
-	lockdep_assert_held(&vn->busy.lock);
-
-	if (vn->busy.mt_enabled) {
-		__mt_destroy(&vn->busy.mt);
-		vn->busy.mt_enabled = false;
-	}
-
-	vn->busy.mt_init_tried = true;
-}
-
-static __always_inline void
-disable_lazy_mt_locked(struct vmap_node *vn)
-{
-	lockdep_assert_held(&vn->lazy.lock);
-
-	if (vn->lazy.mt_enabled) {
-		__mt_destroy(&vn->lazy.mt);
-		vn->lazy.mt_enabled = false;
-	}
-
-	vn->lazy.mt_init_tried = true;
+	err = mas_store_gfp(&mas, NULL, GFP_ATOMIC | __GFP_NOWARN);
+	return !WARN_ON_ONCE(err);
 }
 
-static void
-busy_mt_rebuild_locked(struct vmap_node *vn)
+static __always_inline bool
+occupied_mt_erase_va_locked(struct vmap_area *va)
 {
-	struct vmap_area *va;
-	int err;
-
-	lockdep_assert_held(&vn->busy.lock);
-
-	__mt_destroy(&vn->busy.mt);
-	vn->busy.mt_enabled = true;
+	lockdep_assert_held(&free_vmap_area_lock);
 
-	list_for_each_entry(va, &vn->busy.head, list) {
-		MA_STATE(mas, &vn->busy.mt, va->va_start, va->va_end - 1);
+	if (!occupied_mt_supported())
+		return true;
 
-		err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
-		if (WARN_ON_ONCE(err)) {
-			disable_busy_mt_locked(vn);
-			return;
-		}
-	}
+	return occupied_mt_erase_range_locked(va->va_start, va->va_end);
 }
 
 static __always_inline void
 try_init_busy_mt_locked(struct vmap_node *vn)
 {
 	lockdep_assert_held(&vn->busy.lock);
-
-	if (vn->busy.mt_init_tried)
-		return;
-
-	if (!vmap_mt_runtime_ready())
-		return;
-
-	vn->busy.mt_init_tried = true;
-	busy_mt_rebuild_locked(vn);
-}
-
-static void
-lazy_mt_rebuild_locked(struct vmap_node *vn)
-{
-	struct vmap_area *va;
-	int err;
-
-	lockdep_assert_held(&vn->lazy.lock);
-
-	__mt_destroy(&vn->lazy.mt);
-	vn->lazy.mt_enabled = true;
-
-	list_for_each_entry(va, &vn->lazy.head, list) {
-		MA_STATE(mas, &vn->lazy.mt, va->va_start, va->va_end - 1);
-
-		err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
-		if (WARN_ON_ONCE(err)) {
-			disable_lazy_mt_locked(vn);
-			return;
-		}
-	}
+	WARN_ON_ONCE(!vn->busy.mt_enabled);
 }
 
 static __always_inline void
 try_init_lazy_mt_locked(struct vmap_node *vn)
 {
 	lockdep_assert_held(&vn->lazy.lock);
-
-	if (vn->lazy.mt_init_tried)
-		return;
-
-	if (!vmap_mt_runtime_ready())
-		return;
-
-	vn->lazy.mt_init_tried = true;
-	lazy_mt_rebuild_locked(vn);
+	WARN_ON_ONCE(!vn->lazy.mt_enabled);
 }
 
+/*
+ * Busy/lazy lookup paths remain lock-based to preserve pointer lifetime
+ * semantics.
+ */
+
 static __always_inline struct vmap_area *
 __find_vmap_area_mt(unsigned long addr, struct maple_tree *tree)
 {
@@ -1462,6 +1248,24 @@ __find_vmap_area_enclose_addr_mt(unsigned long addr, struct maple_tree *tree)
 	return mas_find_rev(&mas, 0);
 }
 
+static __always_inline bool
+validate_vmap_area_range_insert_mt_locked(struct maple_tree *tree,
+					  unsigned long start,
+					  unsigned long end)
+{
+	struct vmap_area *left, *right;
+
+	left = __find_vmap_area_enclose_addr_mt(start, tree);
+	if (left && WARN_ON_ONCE(left->va_end > start))
+		return false;
+
+	right = __find_vmap_area_exceed_addr_mt(start, tree);
+	if (right && WARN_ON_ONCE(right->va_start < end))
+		return false;
+
+	return true;
+}
+
 static __always_inline struct vmap_area *
 find_vmap_area_busy_locked(unsigned long addr, struct vmap_node *vn)
 {
@@ -1469,10 +1273,10 @@ find_vmap_area_busy_locked(unsigned long addr, struct vmap_node *vn)
 
 	try_init_busy_mt_locked(vn);
 
-	if (likely(vn->busy.mt_enabled))
-		return __find_vmap_area_mt(addr, &vn->busy.mt);
+	if (WARN_ON_ONCE(!vn->busy.mt_enabled))
+		return NULL;
 
-	return __find_vmap_area_list(addr, &vn->busy.head);
+	return __find_vmap_area_mt(addr, &vn->busy.mt);
 }
 
 static __always_inline struct vmap_area *
@@ -1482,10 +1286,10 @@ find_vmap_area_exceed_addr_busy_locked(unsigned long addr, struct vmap_node *vn)
 
 	try_init_busy_mt_locked(vn);
 
-	if (likely(vn->busy.mt_enabled))
-		return __find_vmap_area_exceed_addr_mt(addr, &vn->busy.mt);
+	if (WARN_ON_ONCE(!vn->busy.mt_enabled))
+		return NULL;
 
-	return __find_vmap_area_exceed_addr_list(addr, &vn->busy.head);
+	return __find_vmap_area_exceed_addr_mt(addr, &vn->busy.mt);
 }
 
 /*
@@ -1544,22 +1348,27 @@ insert_vmap_area_busy_locked(struct vmap_area *va, struct vmap_node *vn)
 
 	try_init_busy_mt_locked(vn);
 
-	if (likely(vn->busy.mt_enabled)) {
-		MA_STATE(mas, &vn->busy.mt, va->va_start, va->va_end - 1);
+	if (WARN_ON_ONCE(!vn->busy.mt_enabled))
+		return;
 
-		if (!insert_vmap_area_list_sorted_mt(va, &vn->busy.mt,
-						     &vn->busy.head))
-			return;
+	if (!validate_vmap_area_range_insert_mt_locked(&vn->busy.mt,
+						       va->va_start,
+						       va->va_end))
+		return;
 
-		err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
-		if (WARN_ON_ONCE(err))
-			disable_busy_mt_locked(vn);
+	INIT_LIST_HEAD(&va->list);
+
+	MA_STATE(mas, &vn->busy.mt, va->va_start, va->va_end - 1);
 
+	err = mas_preallocate(&mas, va, GFP_NOWAIT | __GFP_NOWARN);
+	if (!err) {
+		mas_store_prealloc(&mas, va);
+		mas_destroy(&mas);
 		return;
 	}
 
-	if (!insert_vmap_area_list_sorted(va, &vn->busy.head))
-		return;
+	err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
+	WARN_ON_ONCE(err);
 }
 
 static __always_inline void
@@ -1569,18 +1378,17 @@ unlink_vmap_area_busy_locked(struct vmap_area *va, struct vmap_node *vn)
 
 	lockdep_assert_held(&vn->busy.lock);
 
-	MA_STATE(mas, &vn->busy.mt, va->va_start, va->va_end - 1);
-
-	list_del_init(&va->list);
-
 	try_init_busy_mt_locked(vn);
 
-	if (unlikely(!vn->busy.mt_enabled))
+	if (WARN_ON_ONCE(!vn->busy.mt_enabled))
 		return;
 
+	MA_STATE(mas, &vn->busy.mt, va->va_start, va->va_end - 1);
+
 	err = mas_store_gfp(&mas, NULL, GFP_ATOMIC | __GFP_NOWARN);
-	if (WARN_ON_ONCE(err))
-		disable_busy_mt_locked(vn);
+	WARN_ON_ONCE(err);
+
+	INIT_LIST_HEAD(&va->list);
 }
 
 static __always_inline void
@@ -1591,23 +1399,27 @@ insert_vmap_area_lazy_locked(struct vmap_area *va, struct vmap_node *vn)
 	lockdep_assert_held(&vn->lazy.lock);
 
 	try_init_lazy_mt_locked(vn);
+	if (WARN_ON_ONCE(!vn->lazy.mt_enabled))
+		return;
 
-	if (likely(vn->lazy.mt_enabled)) {
-		MA_STATE(mas, &vn->lazy.mt, va->va_start, va->va_end - 1);
+	if (!validate_vmap_area_range_insert_mt_locked(&vn->lazy.mt,
+						       va->va_start,
+						       va->va_end))
+		return;
 
-		if (!insert_vmap_area_list_sorted_mt(va, &vn->lazy.mt,
-						     &vn->lazy.head))
-			return;
+	INIT_LIST_HEAD(&va->list);
 
-		err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
-		if (WARN_ON_ONCE(err))
-			disable_lazy_mt_locked(vn);
+	MA_STATE(mas, &vn->lazy.mt, va->va_start, va->va_end - 1);
 
+	err = mas_preallocate(&mas, va, GFP_NOWAIT | __GFP_NOWARN);
+	if (!err) {
+		mas_store_prealloc(&mas, va);
+		mas_destroy(&mas);
 		return;
 	}
 
-	if (!insert_vmap_area_list_sorted(va, &vn->lazy.head))
-		return;
+	err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
+	WARN_ON_ONCE(err);
 }
 
 static __always_inline bool
@@ -1616,60 +1428,56 @@ lazy_vmap_areas_empty_locked(struct vmap_node *vn)
 	lockdep_assert_held(&vn->lazy.lock);
 
 	try_init_lazy_mt_locked(vn);
+	if (WARN_ON_ONCE(!vn->lazy.mt_enabled))
+		return true;
 
-	if (likely(vn->lazy.mt_enabled))
-		return mtree_empty(&vn->lazy.mt);
-
-	return list_empty(&vn->lazy.head);
+	return mtree_empty(&vn->lazy.mt);
 }
 
 static __always_inline void
 move_lazy_vmap_areas_to_purge_locked(struct vmap_node *vn)
 {
 	struct vmap_area *va;
-	int err;
 
 	lockdep_assert_held(&vn->lazy.lock);
 
 	try_init_lazy_mt_locked(vn);
+	if (WARN_ON_ONCE(!vn->lazy.mt_enabled))
+		return;
 
-	if (likely(vn->lazy.mt_enabled)) {
-		list_for_each_entry(va, &vn->lazy.head, list) {
-			MA_STATE(mas, &vn->lazy.mt, va->va_start, va->va_end - 1);
-
-			err = mas_store_gfp(&mas, NULL, GFP_ATOMIC | __GFP_NOWARN);
-			if (WARN_ON_ONCE(err)) {
-				disable_lazy_mt_locked(vn);
-				break;
-			}
-		}
+	MA_STATE(mas, &vn->lazy.mt, 0, 0);
 
-		if (vn->lazy.mt_enabled && WARN_ON_ONCE(!mtree_empty(&vn->lazy.mt)))
-			disable_lazy_mt_locked(vn);
-	}
+	mas_for_each(&mas, va, ULONG_MAX)
+		list_add_tail(&va->list, &vn->purge_list);
 
-	list_replace_init(&vn->lazy.head, &vn->purge_list);
+	__mt_destroy(&vn->lazy.mt);
+	mt_init_flags(&vn->lazy.mt, MT_FLAGS_LOCK_EXTERN);
+	mt_set_external_lock(&vn->lazy.mt, &vn->lazy.lock);
+	vn->lazy.mt_enabled = true;
 }
 
 static __always_inline bool
 insert_vmap_area_free_locked(struct vmap_area *va)
 {
+	struct vmap_area *prev, *next;
+
 	lockdep_assert_held(&free_vmap_area_lock);
 
 	try_init_free_mt_locked();
 
-	if (likely(free_mt_supported())) {
-		if (!insert_vmap_area_list_sorted_mt(va, &free_vmap_area_mt,
-						     &free_vmap_area_list))
-			return false;
+	if (unlikely(!free_mt_supported()))
+		return false;
 
-		free_mt_store_va_locked(va);
-	} else {
-		if (!insert_vmap_area_list_sorted(va, &free_vmap_area_list))
-			return false;
-	}
+	prev = __find_vmap_area_enclose_addr_mt(va->va_start, &free_vmap_area_mt);
+	if (prev && WARN_ON_ONCE(prev->va_end > va->va_start))
+		return false;
 
-	return true;
+	next = __find_vmap_area_exceed_addr_mt(va->va_start, &free_vmap_area_mt);
+	if (next && WARN_ON_ONCE(next->va_start < va->va_end))
+		return false;
+
+	INIT_LIST_HEAD(&va->list);
+	return free_mt_store_va_locked(va);
 }
 
 static __always_inline void
@@ -1677,193 +1485,56 @@ unlink_vmap_area_free_locked(struct vmap_area *va)
 {
 	lockdep_assert_held(&free_vmap_area_lock);
 
-	if (WARN_ON_ONCE(list_empty(&va->list)))
+	if (unlikely(!free_mt_supported()))
 		return;
 
-	if (likely(free_mt_supported()))
-		free_mt_erase_va_locked(va);
-
-	list_del_init(&va->list);
-}
-
-/*
- * Merge de-allocated chunk of VA memory with previous
- * and next free blocks. If coalesce is not done a new
- * free area is inserted. If VA has been merged, it is
- * freed.
- *
- * Please note, it can return NULL in case of overlap
- * ranges, followed by WARN() report. Despite it is a
- * buggy behaviour, a system can be alive and keep
- * ongoing.
- */
-static __always_inline struct vmap_area *
-__merge_or_add_vmap_area(struct vmap_area *va, struct list_head *head, bool update_mt)
-{
-	struct vmap_area *sibling;
-	struct list_head *next;
-	unsigned long old_start, old_end;
-	bool merged = false;
-
-	if (update_mt && free_mt_supported())
-		next = find_vmap_area_insert_point_mt(va, &free_vmap_area_mt, head);
-	else
-		next = find_vmap_area_insert_point_list(va, head);
-
-	if (!next)
-		return NULL;
-
-	/*
-	 * start            end
-	 * |                |
-	 * |<------VA------>|<-----Next----->|
-	 *                  |                |
-	 *                  start            end
-	 */
-	if (next != head) {
-		sibling = list_entry(next, struct vmap_area, list);
-		if (sibling->va_start == va->va_end) {
-			old_start = sibling->va_start;
-			old_end = sibling->va_end;
-			sibling->va_start = va->va_start;
-			if (update_mt && free_mt_supported())
-				free_mt_update_va_locked(sibling, old_start, old_end);
-
-			/* Free vmap_area object. */
-			kmem_cache_free(vmap_area_cachep, va);
-
-			/* Point to the new merged area. */
-			va = sibling;
-			merged = true;
-		}
-	}
-
-	/*
-	 * start            end
-	 * |                |
-	 * |<-----Prev----->|<------VA------>|
-	 *                  |                |
-	 *                  start            end
-	 */
-	if (next->prev != head) {
-		sibling = list_entry(next->prev, struct vmap_area, list);
-		if (sibling->va_end == va->va_start) {
-			/*
-			 * If both neighbors are coalesced, it is important
-			 * to unlink the "next" node first, followed by merging
-			 * with "previous" one.
-			 */
-			if (merged) {
-				if (update_mt)
-					unlink_vmap_area_free_locked(va);
-				else
-					list_del_init(&va->list);
-			}
-
-			old_start = sibling->va_start;
-			old_end = sibling->va_end;
-			sibling->va_end = va->va_end;
-			if (update_mt && free_mt_supported())
-				free_mt_update_va_locked(sibling, old_start, old_end);
-
-			/* Free vmap_area object. */
-			kmem_cache_free(vmap_area_cachep, va);
-
-			/* Point to the new merged area. */
-			va = sibling;
-			merged = true;
-		}
-	}
-
-	if (!merged) {
-		if (update_mt)
-			insert_vmap_area_free_locked(va);
-		else
-			list_add_tail(&va->list, next);
-	}
+	if (!free_mt_erase_va_locked(va))
+		return;
 
-	return va;
-}
-
-static __always_inline struct vmap_area *
-merge_or_add_vmap_area(struct vmap_area *va,
-	struct list_head *head)
-{
-	return __merge_or_add_vmap_area(va, head, false);
+	INIT_LIST_HEAD(&va->list);
 }
 
 static __always_inline struct vmap_area *
 merge_or_add_vmap_area_free_locked(struct vmap_area *va)
 {
+	struct vmap_area *left, *right;
+	unsigned long new_start, new_end;
+
 	lockdep_assert_held(&free_vmap_area_lock);
 
-	va = __merge_or_add_vmap_area(va, &free_vmap_area_list, true);
-	if (va && va->va_start < free_vmap_alloc_hint)
-		free_vmap_alloc_hint = va->va_start;
+	if (unlikely(!free_mt_supported()))
+		return NULL;
 
-	return va;
-}
+	new_start = va->va_start;
+	new_end = va->va_end;
 
-/*
- * Transitional wrappers retained until all legacy rb call sites are switched.
- * Follow-up patches in this series remove these wrappers.
- */
-static __always_inline void
-insert_vmap_area(struct vmap_area *va, struct rb_root *root,
-		 struct list_head *head)
-{
-	struct vmap_node *vn = addr_to_node(va->va_start);
+	left = __find_vmap_area_enclose_addr_mt(new_start, &free_vmap_area_mt);
+	if (left && WARN_ON_ONCE(left->va_end > new_start))
+		return NULL;
 
-	if (head == &free_vmap_area_list) {
-		insert_vmap_area_free_locked(va);
-		return;
+	if (left && left->va_end == new_start) {
+		new_start = left->va_start;
+		unlink_vmap_area_free_locked(left);
+		kmem_cache_free(vmap_area_cachep, left);
 	}
 
-	if (head == &vn->lazy.head) {
-		insert_vmap_area_lazy_locked(va, vn);
-		return;
-	}
-
-	insert_vmap_area_busy_locked(va, vn);
-}
-
-static __always_inline void
-insert_vmap_area_augment(struct vmap_area *va, struct rb_node *from,
-			 struct rb_root *root, struct list_head *head)
-{
-	insert_vmap_area(va, root, head);
-}
-
-static __always_inline void unlink_va(struct vmap_area *va, struct rb_root *root)
-{
-	struct vmap_node *vn = addr_to_node(va->va_start);
+	right = __find_vmap_area_exceed_addr_mt(new_start, &free_vmap_area_mt);
+	if (right && WARN_ON_ONCE(right->va_start < new_end))
+		return NULL;
 
-	if (root == &free_vmap_area_root) {
-		unlink_vmap_area_free_locked(va);
-		return;
+	if (right && right->va_start == new_end) {
+		new_end = right->va_end;
+		unlink_vmap_area_free_locked(right);
+		kmem_cache_free(vmap_area_cachep, right);
 	}
 
-	unlink_vmap_area_busy_locked(va, vn);
-}
+	va->va_start = new_start;
+	va->va_end = new_end;
 
-static __always_inline void
-unlink_va_augment(struct vmap_area *va, struct rb_root *root)
-{
-	unlink_va(va, root);
-}
-
-static __always_inline void augment_tree_propagate_from(struct vmap_area *va)
-{
-}
-
-static __always_inline struct vmap_area *
-merge_or_add_vmap_area_augment(struct vmap_area *va, struct rb_root *root,
-			       struct list_head *head)
-{
-	if (head == &free_vmap_area_list)
-		return merge_or_add_vmap_area_free_locked(va);
+	if (!insert_vmap_area_free_locked(va))
+		return NULL;
 
-	return merge_or_add_vmap_area(va, head);
+	return va;
 }
 
 static __always_inline bool
@@ -1885,86 +1556,57 @@ is_within_this_va(struct vmap_area *va, unsigned long size,
 	return (nva_start_addr + size <= va->va_end);
 }
 
-static __always_inline struct vmap_area *
-find_vmap_lowest_match_list(struct list_head *head, unsigned long size,
-			    unsigned long align, unsigned long vstart)
+static __always_inline bool
+occupied_mt_find_hole_window_locked(unsigned long min, unsigned long max,
+				    unsigned long size, unsigned long align,
+				    unsigned long *addr)
 {
-	struct vmap_area *va;
+	MA_STATE(mas, &occupied_vmap_area_mt, 0, 0);
+	unsigned long search = min;
+	unsigned long hole_end;
 
-	list_for_each_entry(va, head, list) {
-		if (!is_within_this_va(va, size, align, vstart))
-			continue;
+	while (search <= max) {
+		unsigned long candidate, candidate_end;
 
-		return va;
-	}
+		mas_set(&mas, search);
+		if (mas_empty_area(&mas, search, max, size))
+			return false;
 
-	return NULL;
-}
+		hole_end = min(mas.last, max);
+		candidate = ALIGN(mas.index, align);
+		if (candidate < mas.index)
+			return false;
 
-static __always_inline unsigned long
-clamp_vmap_alloc_hint(unsigned long hint, unsigned long vstart,
-		      unsigned long vend)
-{
-	if (hint < vstart || hint >= vend)
-		return vstart;
+		if (check_add_overflow(candidate, size - 1, &candidate_end))
+			return false;
 
-	return hint;
-}
+		if (candidate >= search && candidate_end <= hole_end) {
+			*addr = candidate;
+			return true;
+		}
 
-/*
- * Next-fit scan with wrap-around. Use maple to jump to the first candidate
- * around the hint in O(log n), then continue on the ordered list for cheap
- * neighbour traversal and deterministic coalescing behaviour.
- */
-static __always_inline struct vmap_area *
-find_vmap_match_list_next_fit(struct list_head *head, unsigned long size,
-			      unsigned long align, unsigned long vstart,
-			      unsigned long vend)
-{
-	struct vmap_area *va, *start = NULL;
-	unsigned long hint;
-	bool wrapped;
-
-	hint = clamp_vmap_alloc_hint(free_vmap_alloc_hint, vstart, vend);
-
-	if (hint != vstart) {
-		if (free_mt_supported())
-			start = __find_vmap_area_exceed_addr_mt(hint,
-								&free_vmap_area_mt);
-
-		if (start) {
-			va = start;
-			list_for_each_entry_from(va, head, list) {
-				if (is_within_this_va(va, size, align, hint))
-					return va;
-			}
-		} else {
-			list_for_each_entry(va, head, list) {
-				if (va->va_end <= hint)
-					continue;
+		if (hole_end == ULONG_MAX)
+			return false;
 
-				if (is_within_this_va(va, size, align, hint))
-					return va;
-			}
-		}
+		search = hole_end + 1;
 	}
 
-	wrapped = (hint != vstart);
-	list_for_each_entry(va, head, list) {
-		if (wrapped) {
-			if (start && va == start)
-				break;
-			if (!start && va->va_start >= hint)
-				break;
-		}
+	return false;
+}
 
-		if (is_within_this_va(va, size, align, vstart))
-			return va;
-	}
+static __always_inline unsigned long
+occupied_mt_find_hole_lowest_locked(unsigned long size, unsigned long align,
+				    unsigned long vstart, unsigned long vend)
+{
+	unsigned long addr;
 
-	return NULL;
+	if (occupied_mt_find_hole_window_locked(vstart, vend - 1, size, align, &addr))
+		return addr;
+
+	return -ENOENT;
 }
 
+/* Lowest-match scan directly on maple ordered traversal. */
 static __always_inline struct vmap_area *
 find_vmap_lowest_match_mt(struct maple_tree *tree, unsigned long size,
 			  unsigned long align, unsigned long vstart)
@@ -1989,24 +1631,26 @@ find_vmap_lowest_match_mt(struct maple_tree *tree, unsigned long size,
 #include <linux/random.h>
 
 static struct vmap_area *
-find_vmap_lowest_linear_match(struct list_head *head, unsigned long size,
-	unsigned long align, unsigned long vstart)
+find_vmap_lowest_linear_match(struct maple_tree *tree, unsigned long size,
+			      unsigned long align, unsigned long vstart)
 {
+	MA_STATE(mas, tree, vstart, vstart);
 	struct vmap_area *va;
 
-	list_for_each_entry(va, head, list) {
+	mas_set(&mas, vstart);
+	va = mas_find(&mas, ULONG_MAX);
+	while (va) {
 		if (!is_within_this_va(va, size, align, vstart))
-			continue;
-
-		return va;
+			va = mas_next(&mas, ULONG_MAX);
+		else
+			return va;
 	}
 
-	return NULL;
+	return va;
 }
 
 static void
-find_vmap_lowest_match_check(struct list_head *head, unsigned long size,
-			     unsigned long align)
+find_vmap_lowest_match_check(unsigned long size, unsigned long align)
 {
 	struct vmap_area *va_1, *va_2;
 	unsigned long vstart;
@@ -2015,11 +1659,8 @@ find_vmap_lowest_match_check(struct list_head *head, unsigned long size,
 	get_random_bytes(&rnd, sizeof(rnd));
 	vstart = VMALLOC_START + rnd;
 
-	if (free_mt_supported())
-		va_1 = find_vmap_lowest_match_mt(&free_vmap_area_mt, size, align, vstart);
-	else
-		va_1 = find_vmap_lowest_linear_match(head, size, align, vstart);
-	va_2 = find_vmap_lowest_linear_match(head, size, align, vstart);
+	va_1 = find_vmap_lowest_match_mt(&free_vmap_area_mt, size, align, vstart);
+	va_2 = find_vmap_lowest_linear_match(&free_vmap_area_mt, size, align, vstart);
 
 	if (va_1 != va_2)
 		pr_emerg("not lowest: t: 0x%p, l: 0x%p, v: 0x%lx\n",
@@ -2153,39 +1794,38 @@ va_clip(struct vmap_area *va, unsigned long nva_start_addr,
 	}
 
 	if (type != FL_FIT_TYPE) {
-		if (free_mt_supported())
-			free_mt_update_va_locked(va, old_start, old_end);
+		if (free_mt_supported() &&
+		    !free_mt_update_va_locked(va, old_start, old_end))
+			return -ENOMEM;
 
-		if (lva)	/* type == NE_FIT_TYPE */
-			insert_vmap_area_free_locked(lva);
+		if (lva && !insert_vmap_area_free_locked(lva)) {
+			kmem_cache_free(vmap_area_cachep, lva);
+			return -ENOMEM;
+		}
 	}
 
 	return 0;
 }
 
-static unsigned long
-va_alloc(struct vmap_area *va,
-		unsigned long size, unsigned long align,
-		unsigned long vstart, unsigned long vend)
+static __always_inline bool
+restore_allocated_vmap_range_free_locked(unsigned long start, unsigned long end)
 {
-	unsigned long nva_start_addr;
-	int ret;
+	struct vmap_area *va;
 
-	if (va->va_start > vstart)
-		nva_start_addr = ALIGN(va->va_start, align);
-	else
-		nva_start_addr = ALIGN(vstart, align);
+	lockdep_assert_held(&free_vmap_area_lock);
 
-	/* Check the "vend" restriction. */
-	if (nva_start_addr + size > vend)
-		return -ERANGE;
+	va = kmem_cache_zalloc(vmap_area_cachep, GFP_NOWAIT);
+	if (!va)
+		return false;
 
-	/* Update the free vmap_area. */
-	ret = va_clip(va, nva_start_addr, size);
-	if (WARN_ON_ONCE(ret))
-		return ret;
+	va->va_start = start;
+	va->va_end = end;
+	if (!insert_vmap_area_free_locked(va)) {
+		kmem_cache_free(vmap_area_cachep, va);
+		return false;
+	}
 
-	return nva_start_addr;
+	return true;
 }
 
 /*
@@ -2196,34 +1836,42 @@ static __always_inline unsigned long
 __alloc_vmap_area(unsigned long size, unsigned long align,
 		  unsigned long vstart, unsigned long vend)
 {
+	int ret;
 	unsigned long nva_start_addr;
+	unsigned long nva_end_addr;
 	struct vmap_area *va;
 
 	lockdep_assert_held(&free_vmap_area_lock);
 
-	/*
-	 * Next-fit with wrap-around lowers repeated list-head scans in
-	 * high-churn workloads.
-	 */
-	va = find_vmap_match_list_next_fit(&free_vmap_area_list, size, align,
-					   vstart, vend);
+	try_init_occupied_mt_locked();
 
-	if (unlikely(!va))
+	if (WARN_ON_ONCE(!occupied_mt_supported()))
 		return -ENOENT;
 
-	nva_start_addr = va_alloc(va, size, align, vstart, vend);
-	if (!IS_ERR_VALUE(nva_start_addr)) {
-		unsigned long next_hint;
+	nva_start_addr = occupied_mt_find_hole_lowest_locked(size, align,
+							     vstart, vend);
+	if (IS_ERR_VALUE(nva_start_addr))
+		return nva_start_addr;
+	nva_end_addr = nva_start_addr + size;
 
-		if (check_add_overflow(nva_start_addr, size, &next_hint))
-			free_vmap_alloc_hint = vstart;
-		else
-			free_vmap_alloc_hint = next_hint;
+	va = __find_vmap_area_mt(nva_start_addr, &free_vmap_area_mt);
+	if (WARN_ON_ONCE(!va))
+		return -ENOENT;
+
+	ret = va_clip(va, nva_start_addr, size);
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
+	if (!occupied_mt_store_range_locked(nva_start_addr, nva_end_addr)) {
+		bool restored;
+
+		restored = restore_allocated_vmap_range_free_locked(nva_start_addr, nva_end_addr);
+		WARN_ON_ONCE(!restored);
+		return -ENOMEM;
 	}
 
 #if DEBUG_AUGMENT_LOWEST_MATCH_CHECK
-	if (!IS_ERR_VALUE(nva_start_addr))
-		find_vmap_lowest_match_check(&free_vmap_area_list, size, align);
+	find_vmap_lowest_match_check(size, align);
 #endif
 
 	return nva_start_addr;
@@ -2247,7 +1895,8 @@ static void free_vmap_area(struct vmap_area *va)
 	 * Insert/Merge it back to the free tree/list.
 	 */
 	spin_lock(&free_vmap_area_lock);
-	merge_or_add_vmap_area_free_locked(va);
+	WARN_ON_ONCE(!occupied_mt_erase_va_locked(va));
+	WARN_ON_ONCE(!merge_or_add_vmap_area_free_locked(va));
 	spin_unlock(&free_vmap_area_lock);
 }
 
@@ -2566,24 +2215,36 @@ static DEFINE_MUTEX(vmap_purge_lock);
 /* for per-CPU blocks */
 static void purge_fragmented_blocks_allcpus(void);
 
-static void
-reclaim_list_global(struct list_head *head)
+static bool
+reclaim_list_global(struct list_head *head, bool erase_occupied,
+		    struct list_head *failed)
 {
 	struct vmap_area *va, *n;
+	bool ok = true;
 
 	if (list_empty(head))
-		return;
+		return true;
 
 	spin_lock(&free_vmap_area_lock);
-	list_for_each_entry_safe(va, n, head, list)
-		merge_or_add_vmap_area_free_locked(va);
+	list_for_each_entry_safe(va, n, head, list) {
+		list_del_init(&va->list);
+		if (erase_occupied)
+			WARN_ON_ONCE(!occupied_mt_erase_va_locked(va));
+		if (WARN_ON_ONCE(!merge_or_add_vmap_area_free_locked(va))) {
+			list_add_tail(&va->list, failed);
+			ok = false;
+		}
+	}
 	spin_unlock(&free_vmap_area_lock);
+
+	return ok;
 }
 
 static void
 decay_va_pool_node(struct vmap_node *vn, bool full_decay)
 {
 	LIST_HEAD(decay_list);
+	LIST_HEAD(decay_failed);
 	struct vmap_area *va, *nva;
 	unsigned long n_decay, pool_len;
 	int i;
@@ -2612,7 +2273,7 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
 				break;
 
 			list_del_init(&va->list);
-			merge_or_add_vmap_area(va, &decay_list);
+			list_add_tail(&va->list, &decay_list);
 		}
 
 		/*
@@ -2629,7 +2290,11 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
 		}
 	}
 
-	reclaim_list_global(&decay_list);
+	WARN_ON_ONCE(!reclaim_list_global(&decay_list, false, &decay_failed));
+	list_for_each_entry_safe(va, nva, &decay_failed, list) {
+		list_del_init(&va->list);
+		WARN_ON_ONCE(!node_pool_add_va(vn, va));
+	}
 }
 
 #define KASAN_RELEASE_BATCH_SIZE 32
@@ -2664,8 +2329,10 @@ static void purge_vmap_node(struct work_struct *work)
 	struct vmap_node *vn = container_of(work,
 		struct vmap_node, purge_work);
 	unsigned long nr_purged_pages = 0;
+	unsigned long nr_failed_pages = 0;
 	struct vmap_area *va, *n_va;
 	LIST_HEAD(local_list);
+	LIST_HEAD(local_failed);
 
 	if (IS_ENABLED(CONFIG_KASAN_VMALLOC))
 		kasan_release_vmalloc_node(vn);
@@ -2691,7 +2358,23 @@ static void purge_vmap_node(struct work_struct *work)
 
 	atomic_long_sub(nr_purged_pages, &vmap_lazy_nr);
 
-	reclaim_list_global(&local_list);
+	WARN_ON_ONCE(!reclaim_list_global(&local_list, false, &local_failed));
+	list_for_each_entry_safe(va, n_va, &local_failed, list) {
+		unsigned int vn_id = decode_vn_id(va->flags);
+		struct vmap_node *dst;
+
+		list_del_init(&va->list);
+		dst = is_vn_id_valid(vn_id) ?
+			id_to_node(vn_id) : addr_to_node(va->va_start);
+
+		spin_lock(&dst->lazy.lock);
+		insert_vmap_area_lazy_locked(va, dst);
+		spin_unlock(&dst->lazy.lock);
+		nr_failed_pages += va_size(va) >> PAGE_SHIFT;
+	}
+
+	if (nr_failed_pages)
+		atomic_long_add(nr_failed_pages, &vmap_lazy_nr);
 }
 
 /*
@@ -2823,6 +2506,15 @@ static void free_vmap_area_noflush(struct vmap_area *va)
 	vn = is_vn_id_valid(vn_id) ?
 		id_to_node(vn_id):addr_to_node(va->va_start);
 
+	/*
+	 * Drop occupied-range visibility as soon as the area is freed, even
+	 * though coalescing/reinsertion into the free index remains deferred.
+	 */
+	spin_lock(&free_vmap_area_lock);
+	try_init_occupied_mt_locked();
+	WARN_ON_ONCE(!occupied_mt_erase_va_locked(va));
+	spin_unlock(&free_vmap_area_lock);
+
 	spin_lock(&vn->lazy.lock);
 	insert_vmap_area_lazy_locked(va, vn);
 	spin_unlock(&vn->lazy.lock);
@@ -5240,14 +4932,11 @@ EXPORT_SYMBOL_GPL(free_vm_area);
 
 #ifdef CONFIG_SMP
 static __always_inline struct vmap_area *
-free_vmap_area_prev(struct vmap_area *va)
+free_vmap_area_prev_by_addr(unsigned long addr)
 {
 	lockdep_assert_held(&free_vmap_area_lock);
 
-	if (va->list.prev == &free_vmap_area_list)
-		return NULL;
-
-	return list_entry(va->list.prev, struct vmap_area, list);
+	return __find_vmap_area_enclose_addr_mt(addr, &free_vmap_area_mt);
 }
 
 /**
@@ -5262,19 +4951,9 @@ free_vmap_area_prev(struct vmap_area *va)
 static struct vmap_area *
 pvm_find_va_enclose_addr(unsigned long addr)
 {
-	struct vmap_area *va;
-
 	lockdep_assert_held(&free_vmap_area_lock);
 
-	if (free_mt_supported())
-		return __find_vmap_area_enclose_addr_mt(addr, &free_vmap_area_mt);
-
-	list_for_each_entry_reverse(va, &free_vmap_area_list, list) {
-		if (va->va_start <= addr)
-			return va;
-	}
-
-	return NULL;
+	return __find_vmap_area_enclose_addr_mt(addr, &free_vmap_area_mt);
 }
 
 /**
@@ -5293,13 +4972,19 @@ pvm_determine_end_from_reverse(struct vmap_area **va, unsigned long align)
 	unsigned long vmalloc_end = VMALLOC_END & ~(align - 1);
 	unsigned long addr;
 
+	lockdep_assert_held(&free_vmap_area_lock);
+
 	if (likely(*va)) {
-		list_for_each_entry_from_reverse((*va),
-				&free_vmap_area_list, list) {
+		do {
 			addr = min((*va)->va_end & ~(align - 1), vmalloc_end);
 			if ((*va)->va_start < addr)
 				return addr;
-		}
+
+			if ((*va)->va_start == 0)
+				break;
+
+			*va = free_vmap_area_prev_by_addr((*va)->va_start - 1);
+		} while (*va);
 	}
 
 	return 0;
@@ -5382,6 +5067,8 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 	}
 retry:
 	spin_lock(&free_vmap_area_lock);
+	try_init_free_mt_locked();
+	try_init_occupied_mt_locked();
 
 	/* start scanning - we scan from the top, begin with the last area */
 	area = term_area = last_area;
@@ -5419,7 +5106,10 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 		 * If this VA does not fit, move base downwards and recheck.
 		 */
 		if (base + start < va->va_start) {
-			va = free_vmap_area_prev(va);
+			if (va->va_start == 0)
+				va = NULL;
+			else
+				va = free_vmap_area_prev_by_addr(va->va_start - 1);
 			base = pvm_determine_end_from_reverse(&va, align) - end;
 			term_area = area;
 			continue;
@@ -5459,6 +5149,12 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 		va = vas[area];
 		va->va_start = start;
 		va->va_end = start + size;
+
+		if (occupied_mt_supported() &&
+		    !occupied_mt_store_range_locked(va->va_start, va->va_end)) {
+			area++;
+			goto recovery;
+		}
 	}
 
 	spin_unlock(&free_vmap_area_lock);
@@ -5501,11 +5197,14 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 	while (area--) {
 		orig_start = vas[area]->va_start;
 		orig_end = vas[area]->va_end;
+		WARN_ON_ONCE(!occupied_mt_erase_va_locked(vas[area]));
 		va = merge_or_add_vmap_area_free_locked(vas[area]);
+		WARN_ON_ONCE(!va);
 		if (va)
 			kasan_release_vmalloc(orig_start, orig_end,
-				va->va_start, va->va_end,
-				KASAN_VMALLOC_PAGE_RANGE | KASAN_VMALLOC_TLB_FLUSH);
+					      va->va_start, va->va_end,
+					      KASAN_VMALLOC_PAGE_RANGE |
+					      KASAN_VMALLOC_TLB_FLUSH);
 		vas[area] = NULL;
 	}
 
@@ -5551,7 +5250,9 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 	for (area = 0; area < nr_vms; area++) {
 		orig_start = vas[area]->va_start;
 		orig_end = vas[area]->va_end;
+		WARN_ON_ONCE(!occupied_mt_erase_va_locked(vas[area]));
 		va = merge_or_add_vmap_area_free_locked(vas[area]);
+		WARN_ON_ONCE(!va);
 		if (va)
 			kasan_release_vmalloc(orig_start, orig_end,
 				va->va_start, va->va_end,
@@ -5598,7 +5299,7 @@ bool vmalloc_dump_obj(void *object)
 	if (!spin_trylock(&vn->busy.lock))
 		return false;
 
-	va = __find_vmap_area(addr, &vn->busy.root);
+	va = find_vmap_area_busy_locked(addr, vn);
 	if (!va || !va->vm) {
 		spin_unlock(&vn->busy.lock);
 		return false;
@@ -5650,11 +5351,17 @@ static void show_purge_info(struct seq_file *m)
 
 	for_each_vmap_node(vn) {
 		spin_lock(&vn->lazy.lock);
-		list_for_each_entry(va, &vn->lazy.head, list) {
-			seq_printf(m, "0x%pK-0x%pK %7ld unpurged vm_area\n",
-				(void *)va->va_start, (void *)va->va_end,
-				va_size(va));
+		try_init_lazy_mt_locked(vn);
+		if (WARN_ON_ONCE(!vn->lazy.mt_enabled)) {
+			spin_unlock(&vn->lazy.lock);
+			continue;
 		}
+		MA_STATE(mas, &vn->lazy.mt, 0, 0);
+
+		mas_for_each(&mas, va, ULONG_MAX)
+			seq_printf(m, "0x%pK-0x%pK %7ld unpurged vm_area\n",
+				   (void *)va->va_start, (void *)va->va_end,
+				   va_size(va));
 		spin_unlock(&vn->lazy.lock);
 	}
 }
@@ -5671,12 +5378,19 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 
 	for_each_vmap_node(vn) {
 		spin_lock(&vn->busy.lock);
-		list_for_each_entry(va, &vn->busy.head, list) {
+		try_init_busy_mt_locked(vn);
+		if (WARN_ON_ONCE(!vn->busy.mt_enabled)) {
+			spin_unlock(&vn->busy.lock);
+			continue;
+		}
+		MA_STATE(mas, &vn->busy.mt, 0, 0);
+
+		mas_for_each(&mas, va, ULONG_MAX) {
 			if (!va->vm) {
 				if (va->flags & VMAP_RAM)
 					seq_printf(m, "0x%pK-0x%pK %7ld vm_map_ram\n",
-						(void *)va->va_start, (void *)va->va_end,
-						va_size(va));
+						   (void *)va->va_start, (void *)va->va_end,
+						   va_size(va));
 
 				continue;
 			}
@@ -5689,7 +5403,7 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 			smp_rmb();
 
 			seq_printf(m, "0x%pK-0x%pK %7ld",
-				v->addr, v->addr + v->size, v->size);
+				   v->addr, v->addr + v->size, v->size);
 
 			if (v->caller)
 				seq_printf(m, " %pS", v->caller);
@@ -5754,6 +5468,8 @@ static void __init vmap_init_free_space(void)
 	struct vmap_area *free;
 	struct vm_struct *busy;
 
+	spin_lock(&free_vmap_area_lock);
+
 	/*
 	 *     B     F     B     B     B     F
 	 * -|-----|.....|-----|-----|-----|.....|-
@@ -5761,19 +5477,18 @@ static void __init vmap_init_free_space(void)
 	 *  |<--------------------------------->|
 	 */
 	for (busy = vmlist; busy; busy = busy->next) {
-		if ((unsigned long) busy->addr - vmap_start > 0) {
+		if ((unsigned long)busy->addr - vmap_start > 0) {
 			free = kmem_cache_zalloc(vmap_area_cachep, GFP_NOWAIT);
 			if (!WARN_ON_ONCE(!free)) {
 				free->va_start = vmap_start;
-				free->va_end = (unsigned long) busy->addr;
+				free->va_end = (unsigned long)busy->addr;
 
-				insert_vmap_area_augment(free, NULL,
-					&free_vmap_area_root,
-						&free_vmap_area_list);
+				if (WARN_ON_ONCE(!insert_vmap_area_free_locked(free)))
+					kmem_cache_free(vmap_area_cachep, free);
 			}
 		}
 
-		vmap_start = (unsigned long) busy->addr + busy->size;
+		vmap_start = (unsigned long)busy->addr + busy->size;
 	}
 
 	if (vmap_end - vmap_start > 0) {
@@ -5782,11 +5497,12 @@ static void __init vmap_init_free_space(void)
 			free->va_start = vmap_start;
 			free->va_end = vmap_end;
 
-			insert_vmap_area_augment(free, NULL,
-				&free_vmap_area_root,
-					&free_vmap_area_list);
+			if (WARN_ON_ONCE(!insert_vmap_area_free_locked(free)))
+				kmem_cache_free(vmap_area_cachep, free);
 		}
 	}
+
+	spin_unlock(&free_vmap_area_lock);
 }
 
 static void vmap_init_nodes(void)
@@ -5825,13 +5541,15 @@ static void vmap_init_nodes(void)
 #endif
 
 	for_each_vmap_node(vn) {
-		vn->busy.root = RB_ROOT;
-		INIT_LIST_HEAD(&vn->busy.head);
 		spin_lock_init(&vn->busy.lock);
+		mt_init_flags(&vn->busy.mt, MT_FLAGS_LOCK_EXTERN);
+		mt_set_external_lock(&vn->busy.mt, &vn->busy.lock);
+		vn->busy.mt_enabled = true;
 
-		vn->lazy.root = RB_ROOT;
-		INIT_LIST_HEAD(&vn->lazy.head);
 		spin_lock_init(&vn->lazy.lock);
+		mt_init_flags(&vn->lazy.mt, MT_FLAGS_LOCK_EXTERN);
+		mt_set_external_lock(&vn->lazy.mt, &vn->lazy.lock);
+		vn->lazy.mt_enabled = true;
 
 		for (i = 0; i < MAX_VA_SIZE_PAGES; i++) {
 			INIT_LIST_HEAD(&vn->pool[i].head);
@@ -5881,6 +5599,11 @@ void __init vmalloc_init(void)
 	 * Create the cache for vmap_area objects.
 	 */
 	vmap_area_cachep = KMEM_CACHE(vmap_area, SLAB_PANIC);
+	/*
+	 * vmalloc_init() performs Maple stores/preallocation while importing
+	 * early ranges. Ensure Maple node cache is available at this stage.
+	 */
+	maple_tree_init();
 
 	for_each_possible_cpu(i) {
 		struct vmap_block_queue *vbq;
@@ -5911,7 +5634,15 @@ void __init vmalloc_init(void)
 		va->vm = tmp;
 
 		vn = addr_to_node(va->va_start);
-		insert_vmap_area(va, &vn->busy.root, &vn->busy.head);
+		spin_lock(&vn->busy.lock);
+		insert_vmap_area_busy_locked(va, vn);
+		spin_unlock(&vn->busy.lock);
+
+		spin_lock(&free_vmap_area_lock);
+		try_init_occupied_mt_locked();
+		WARN_ON_ONCE(!occupied_mt_store_range_locked(va->va_start,
+							     va->va_end));
+		spin_unlock(&free_vmap_area_lock);
 	}
 
 	/*

-- 
2.34.1


